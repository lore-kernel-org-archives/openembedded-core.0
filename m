Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4058B71DAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:17:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 12 Apr 2017 12:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="73188472"
Received: from ggalliga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.16.55])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2017 12:17:11 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:17:32 +0300
Message-Id: <20170412191732.30651-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] oe-build-perf-report-email.py: use pwd for getting user name
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
X-List-Received-Date: Wed, 12 Apr 2017 19:17:13 -0000

Use pwd data instead of os.getlogin() to get the username for fallback
email address. os.getlogin() basically returns the name of the user
logged in on the controlling terminal of the process and raises an
exception on some systems if the process does not have a controlling
terminal - when executed from a cron script, for example.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 055a7b12cf..261ca514e5 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -211,9 +211,10 @@ def send_email(text_fn, html_fn, subject, recipients):
     else:
         raise ReportError("Neither plain text nor html body specified")
 
-    full_name = pwd.getpwuid(os.getuid()).pw_gecos.split(',')[0]
+    pw_data = pwd.getpwuid(os.getuid())
+    full_name = pw_data.pw_gecos.split(',')[0]
     email = os.environ.get('EMAIL',
-                           '{}@{}'.format(os.getlogin(), socket.getfqdn()))
+                           '{}@{}'.format(pw_data.pw_name, socket.getfqdn()))
     msg['From'] = "{} <{}>".format(full_name, email)
     msg['To'] = ', '.join(recipients)
     msg['Subject'] = subject
-- 
2.12.0


