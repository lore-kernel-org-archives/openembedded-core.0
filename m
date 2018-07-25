Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0B10789E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:24:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P8OPin027047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:24:25 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 01:24:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 16:34:35 +0800
Message-ID: <bfa9f8fcc4f3ca807cc3dfa589a86e8539420fd0.1532507399.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532507399.git.liezhi.yang@windriver.com>
References: <cover.1532507399.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] runqemu: let qemuparams override previous settings
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
X-List-Received-Date: Wed, 25 Jul 2018 08:24:24 -0000
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
index 7a13e5d..6b4078f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -188,6 +188,7 @@ class BaseConfig(object):
 
         self.qemu_opt = ''
         self.qemu_opt_script = ''
+        self.qemuparams = ''
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
@@ -451,7 +452,7 @@ class BaseConfig(object):
             elif arg.startswith('biosfilename='):
                 self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
             elif arg.startswith('qemuparams='):
-                self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
+                self.qemuparams = ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
                 self.bootparams = arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
@@ -661,10 +662,12 @@ class BaseConfig(object):
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
@@ -1166,6 +1169,10 @@ class BaseConfig(object):
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
+        # Append qemuparams to override previous settings
+        if self.qemuparams:
+            self.qemu_opt += ' ' + self.qemuparams
+
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-- 
2.7.4


