Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5026778299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:48:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 05:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,390,1503385200"; d="scan'208";a="161402279"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 17 Oct 2017 05:48:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 15:43:39 +0300
Message-Id: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] scripts/send-recipe-update-reminders: send recipe version update reminders by email
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 12:48:20 -0000

This script will determine (via bitbake -c checkpkg world) which
recipes are in need of a version update, sort them by their
assigned maintainers, and send personal emails to the maintainers
requesting that the recipes should be updated. Also, it will send
a summary to the openembedded-core mailing list. The actual sending
happens only if --send parameter is used, otherwise the script
only prints the summary to standard output.

For instance, if the script were run now, I would get:

=====================
The following oe-core packages, for which you are listed as the maintainer, are in need of a version update.
Please prepare and send the patches to the openembedded-core mailing list.

Package name                   OE-Core    Upstream
============
epiphany                       3.24.3     3.26.1
gtk-doc                        1.25       1.26
libnl                          3.2.29     3.4.0
openssl                        1.0.2l     1.1.0f
psmisc                         22.21      23.1
=====================

I intend to run the script about twice in each development cycle,
first towards the start and then towards the end of the merge window.
So that reminders happen altogether maybe four times a year, which
hopefully no one finds bothersome.

YP used to have a much more sophisticated system called Automated
Upgrade Helper for this, but it hasn't been heard from in several months
and so I quickly rolled my own cheap and cheery replacement.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/send-recipe-update-reminders | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100755 scripts/send-recipe-update-reminders

diff --git a/scripts/send-recipe-update-reminders b/scripts/send-recipe-update-reminders
new file mode 100755
index 00000000000..1ac0d1a0812
--- /dev/null
+++ b/scripts/send-recipe-update-reminders
@@ -0,0 +1,81 @@
+#!/usr/bin/env python3
+import os
+import argparse
+import subprocess
+import smtplib
+from email.mime.text import MIMEText
+
+parser = argparse.ArgumentParser(description='Print recipes in need of version update and optionally send email reminders to maintainers to do it.')
+parser.add_argument('--send', action='store_true', help='actually send the emails. SMTP server and sender name/email are taken from git config.')
+args = parser.parse_args()
+
+try:
+	builddir = os.environ['BUILDDIR']
+except KeyError:
+	print ("BUILDDIR environment variable is not defined; did you initialize using oe-init-build-env?")
+	exit()
+
+if os.system('bitbake -c checkpkg world') != 0:
+	exit()
+checkpkgfile = open(builddir + '/tmp/log/checkpkg.csv')
+
+# skip the first line as it's just headers
+checkpkgfile.readline()
+
+pkgs_to_update_by_maintainer = {}
+for i in checkpkgfile.readlines():
+	fields = i.split('\t')
+	maintainer = fields[-2]
+	no_update_reason = fields[-1]
+	status = fields[-5]
+	if status == 'UPDATE' and len(no_update_reason) <= 1 and len(maintainer) > 0:
+		pkgs_to_update_by_maintainer.setdefault(maintainer, [])
+		pkgs_to_update_by_maintainer[maintainer].append(fields[:3])
+
+for (maintainer, recipes) in pkgs_to_update_by_maintainer.items():
+	recipes.sort()
+
+publicmsg = """The following oe-core packages are in need of a version update.
+
+{}
+""".format("\n".join(["{}:\n================\n{}\n".format(maintainer, "\n".join(["{:30} {:10} {:10}".format(recipe[0], recipe[1], recipe[2]) for recipe in recipes])) for (maintainer, recipes) in pkgs_to_update_by_maintainer.items()]))
+
+print (publicmsg)
+
+if not args.send:
+	print ("Use --send to send email reminders about the above.")
+	exit()
+
+privatemsg = """The following oe-core packages, for which you are listed as the maintainer, are in need of a version update.
+Please prepare and send the patches to the openembedded-core mailing list.
+
+{:30} {:10} {:10}
+============
+""".format("Package name", "OE-Core", "Upstream")
+
+
+privatemessages = {}
+for (maintainer, recipes) in pkgs_to_update_by_maintainer.items():
+	privatemessages[maintainer] = "{}{}".format(privatemsg, "\n".join(["{:30} {:10} {:10}".format(recipe[0], recipe[1], recipe[2]) for recipe in recipes]))
+
+smtpserver = subprocess.check_output('git config sendemail.smtpserver', shell=True).decode().strip()
+username = subprocess.check_output('git config user.name', shell=True).decode().strip()
+useremail = subprocess.check_output('git config user.email', shell=True).decode().strip()
+
+s = smtplib.SMTP(smtpserver)
+publicemail = MIMEText(publicmsg)
+publicemail['Subject'] = "OE-Core recipes in need of a version update"
+publicemail['From'] = "{} <{}>".format(username, useremail)
+publicemail['To'] = "openembedded-core@lists.openembedded.org"
+print ("Sending a message to oe-core list")
+s.send_message(publicemail)
+
+for (maintainer, message) in privatemessages.items():
+	privateemail = MIMEText(message)
+	privateemail['Subject'] = "Please update the following OE-Core recipes"
+	privateemail['From'] = "{} <{}>".format(username, useremail)
+	privateemail['To'] = maintainer
+	print ("Sending a message to {}".format(maintainer))
+	s.send_message(privateemail)
+
+s.quit()
-- 
2.14.2


