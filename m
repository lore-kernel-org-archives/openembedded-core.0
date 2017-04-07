Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 854F177D91
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:04:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3784TqY009933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 01:04:30 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 7 Apr 2017 01:04:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 16:05:55 +0800
Message-ID: <440e9625305d6c7754989876848c107364e07761.1491551982.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1491551982.git.Qi.Chen@windriver.com>
References: <cover.1491551982.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] runqemu: make use of two new vars
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
X-List-Received-Date: Fri, 07 Apr 2017 08:04:30 -0000
Content-Type: text/plain

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
index 23c9efb..cde9ae5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -908,7 +908,10 @@ class BaseConfig(object):
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
@@ -1041,7 +1044,10 @@ class BaseConfig(object):
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
1.9.1


