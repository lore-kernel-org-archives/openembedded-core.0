Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3BA7070E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THbTf0013071; Fri, 29 Aug 2014 18:37:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eALrJdT2nFj6; Fri, 29 Aug 2014 18:37:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THbNvf013067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 18:37:24 +0100
Message-ID: <1409333845.29296.193.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 18:37:25 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: ronan <ronan.lemartret@open.eurogiciel.org>,
	Ed Bartosh <eduard.bartosh@intel.com>
Subject: [PATCH] package_manager.py: enable smart non-interactive mode
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
X-List-Received-Date: Fri, 29 Aug 2014 17:37:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Ed Bartosh <eduard.bartosh@intel.com>

Added --quiet option to smart command line.
Without this option smart 1.4.1 turns into interactive mode, i.e.
start asking questions and expecting answers.

Internally within smart, this changes the default UI to one which
just prints to stderr, the naming of the parameter is a little
odd but does what we need.

Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f8fc3c2..612c835 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -543,7 +543,7 @@ class RpmPM(PackageManager):
         self.install_dir = os.path.join(self.target_rootfs, "install")
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
         self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
-        self.smart_opt = "--data-dir=" + os.path.join(target_rootfs,
+        self.smart_opt = "--quiet --data-dir=" + os.path.join(target_rootfs,
                                                       'var/lib/smart')
         self.scriptlet_wrapper = self.d.expand('${WORKDIR}/scriptlet_wrapper')
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %



