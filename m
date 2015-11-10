Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 30F5675EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 11:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAAB9jUk007873 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 11:09:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tL4Ku2l7j7Gr
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 11:09:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAAB9Tra007842
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 11:09:41 GMT
Message-ID: <1447149164.3559.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Nov 2015 09:52:44 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.12.11-0ubuntu3 
Subject: [PATCH] classes: Ensure pass setVar/setVarFlag strings, not integers
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
X-List-Received-Date: Tue, 10 Nov 2015 11:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This doesn't cause any issues right now but it make sense to standardise
on consistently using strings in the data store.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass        | 8 ++++----
 meta/classes/package_rpm.bbclass | 2 +-
 meta/classes/ptest.bbclass       | 2 +-
 meta/classes/terminal.bbclass    | 8 ++++----
 meta/lib/oe/image.py             | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 561adeb..7b2dcf4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -431,14 +431,14 @@ python () {
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
         d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_install', 'fakeroot', 1)
+        d.setVarFlag('do_install', 'fakeroot', '1')
         d.setVarFlag('do_install', 'umask', '022')
         d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package', 'fakeroot', 1)
+        d.setVarFlag('do_package', 'fakeroot', '1')
         d.setVarFlag('do_package', 'umask', '022')
-        d.setVarFlag('do_package_setscene', 'fakeroot', 1)
+        d.setVarFlag('do_package_setscene', 'fakeroot', '1')
         d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_devshell', 'fakeroot', 1)
+        d.setVarFlag('do_devshell', 'fakeroot', '1')
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
     if not source_mirror_fetch:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1fa1634..7d523a1 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -743,7 +743,7 @@ python () {
     if d.getVar('PACKAGES', True) != '':
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
-        d.setVarFlag('do_package_write_rpm', 'fakeroot', 1)
+        d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
 }
 
 SSTATETASKS += "do_package_write_rpm"
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 4dc5dbe..fa3561e 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -58,7 +58,7 @@ addtask install_ptest_base   after do_install   before do_package do_populate_sy
 
 python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        d.setVarFlag('do_install_ptest_base', 'fakeroot', 1)
+        d.setVarFlag('do_install_ptest_base', 'fakeroot', '1')
 
     # Remove all '*ptest_base' tasks when ptest is not enabled
     if not(d.getVar('PTEST_ENABLED', True) == "1"):
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index e577c6d..fd87cfe 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -15,7 +15,7 @@ def emit_terminal_func(command, envdata, d):
     cmd_func = 'do_terminal'
 
     envdata.setVar(cmd_func, 'exec ' + command)
-    envdata.setVarFlag(cmd_func, 'func', 1)
+    envdata.setVarFlag(cmd_func, 'func', '1')
 
     runfmt = d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
     runfile = runfmt.format(func=cmd_func, task=cmd_func, taskfunc=cmd_func, pid=os.getpid())
@@ -39,14 +39,14 @@ def oe_terminal(command, title, d):
 
     for v in os.environ:
         envdata.setVar(v, os.environ[v])
-        envdata.setVarFlag(v, 'export', 1)
+        envdata.setVarFlag(v, 'export', '1')
 
     for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
         value = d.getVar(export, True)
         if value is not None:
             os.environ[export] = str(value)
             envdata.setVar(export, str(value))
-            envdata.setVarFlag(export, 'export', 1)
+            envdata.setVarFlag(export, 'export', '1')
         if export == "PSEUDO_DISABLED":
             if "PSEUDO_UNLOAD" in os.environ:
                 del os.environ["PSEUDO_UNLOAD"]
@@ -62,7 +62,7 @@ def oe_terminal(command, title, d):
         if value is not None:
             os.environ[key] = str(value)
             envdata.setVar(key, str(value))
-            envdata.setVarFlag(key, 'export', 1)
+            envdata.setVarFlag(key, 'export', '1')
 
     # A complex PS1 might need more escaping of chars.
     # Lets not export PS1 instead.
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index b9eb3de..9580562 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -272,8 +272,8 @@ class Image(ImageDepGraph):
         rootfs_size = self._get_rootfs_size()
 
         self.d.setVar('img_creation_func', '\n'.join(cmds))
-        self.d.setVarFlag('img_creation_func', 'func', 1)
-        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
+        self.d.setVarFlag('img_creation_func', 'func', '1')
+        self.d.setVarFlag('img_creation_func', 'fakeroot', '1')
         self.d.setVar('ROOTFS_SIZE', str(rootfs_size))
 
         with open(script_name, "w+") as script:



