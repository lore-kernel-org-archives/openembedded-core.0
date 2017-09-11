Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1EE77E88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:28:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8B9S90b017651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 02:28:10 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 02:28:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 02:28:07 -0700
Message-ID: <0670ad46edba632b7d9eb47ec6a7f6304302fa5d.1505122056.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1505122056.git.liezhi.yang@windriver.com>
References: <cover.1505122056.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] runqemu: let qemuparams override previous settings
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
X-List-Received-Date: Mon, 11 Sep 2017 09:28:09 -0000
Content-Type: text/plain

Fixed:
$ runqemu qemux86-64 qemuparams="-cpu coreduo"
The default cpu is core2duo, but coreduo should be used here.

Append qemuparams to the last can fix the problem.

[YOCTO #11773]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ce8cccc..b58c965 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -185,6 +185,7 @@ class BaseConfig(object):
 
         self.qemu_opt = ''
         self.qemu_opt_script = ''
+        self.qemuparams = ''
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
@@ -444,7 +445,7 @@ class BaseConfig(object):
             elif arg.startswith('biosfilename='):
                 self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
             elif arg.startswith('qemuparams='):
-                self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
+                self.qemuparams = ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
                 self.bootparams = arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
@@ -635,10 +636,12 @@ class BaseConfig(object):
             raise RunQemuError("Invalid custombiosdir: %s" % self.custombiosdir)
 
     def check_mem(self):
-        s = re.search('-m +([0-9]+)', self.qemu_opt_script)
-        if s:
-            self.set('QB_MEM', '-m %s' % s.group(1))
-        elif not self.get('QB_MEM'):
+        for opt in (self.qemu_opt_script, self.qemuparams):
+            s = re.search('-m +([0-9]+)', opt)
+            if s:
+                self.set('QB_MEM', '-m %s' % s.group(1))
+
+        if not self.get('QB_MEM'):
             mach = self.get('MACHINE')
             if mach.startswith('qemumips'):
                 logger.info('QB_MEM is not set, use 256M by default')
@@ -1125,6 +1128,10 @@ class BaseConfig(object):
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
+        # Append qemuparams to override previous settings
+        if self.qemuparams:
+            self.qemu_opt += ' ' + self.qemuparams
+
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-- 
2.10.2


