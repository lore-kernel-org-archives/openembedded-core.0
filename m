Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1992577D86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v379lOrv025429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:24 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:15 -0700
Message-ID: <0d80053ad554b8c5eee2fe12b7ef01ea9c71996d.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] runqemu: make use of two new vars
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:23 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make use of STAGING_DIR_TUNCTL_NATIVE and STAGING_DIR_QEMU_BINDIR_NATIVE
to run correctly. In this way, runqemu would still work when 'rm_work'
is enabled.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5b5d56b9ef..e741dfe05d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -920,7 +920,10 @@ class BaseConfig(object):
             gid = os.getgid()
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
+            if os.path.exists(self.get('STAGING_DIR_TUNCTL_NATIVE')):
+                cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_TUNCTL_NATIVE'))
+            else:
+                cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
             tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').rstrip('\n')
             lockfile = os.path.join(lockdir, tap)
             self.lock = lockfile + '.lock'
@@ -1056,7 +1059,10 @@ class BaseConfig(object):
         if not qemu_system:
             raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
-        qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
+        if os.path.exists(self.get('STAGING_DIR_QEMU_BINDIR_NATIVE')):
+            qemu_bin = '%s/%s' % (self.get('STAGING_DIR_QEMU_BINDIR_NATIVE'), qemu_system)
+        else:
+            qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
         # find QEMU in sysroot, it needs to use host's qemu.
-- 
2.11.0.rc2.dirty


