Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 57B4177D41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:54:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 12 Apr 2017 13:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="76686350"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Apr 2017 13:54:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 65E466A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:40:59 +0300
Message-Id: <40edd82480851437dfe111a87d74842878d0dc23.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1492029084.git.ed.bartosh@linux.intel.com>
References: <cover.1492029084.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/5] runqemu: use bindir_native property to run ifup/down scripts
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
X-List-Received-Date: Wed, 12 Apr 2017 20:54:05 -0000

Used self.bindir_native to point out to the native sysroot
when running runqemu-ifup and runqemu-ifdown scripts.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu        | 4 ++--
 scripts/runqemu-ifdown | 6 +++---
 scripts/runqemu-ifup   | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6cdedd8..3744c67 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -920,7 +920,7 @@ class BaseConfig(object):
             gid = os.getgid()
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
+            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.bindir_native)
             tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').rstrip('\n')
             lockfile = os.path.join(lockdir, tap)
             self.lock = lockfile + '.lock'
@@ -1140,7 +1140,7 @@ class BaseConfig(object):
 
     def cleanup(self):
         if self.cleantap:
-            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.get('STAGING_DIR_NATIVE'))
+            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
             logger.info('Running %s' % cmd)
             subprocess.call(cmd, shell=True)
         if self.lock_descriptor:
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 8f66cfa2..ffbc9de 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -41,11 +41,11 @@ if [ $# -ne 2 ]; then
 fi
 
 TAP=$1
-NATIVE_SYSROOT_DIR=$2
+STAGING_BINDIR_NATIVE=$2
 
-TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
+TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
 if [ ! -e "$TUNCTL" ]; then
-	echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin', please bitbake qemu-helper-native"
+	echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
 	exit 1
 fi
 
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index d9bd894..59a15ea 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -49,11 +49,11 @@ fi
 
 USERID="-u $1"
 GROUP="-g $2"
-NATIVE_SYSROOT_DIR=$3
+STAGING_BINDIR_NATIVE=$3
 
-TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
+TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
 if [ ! -x "$TUNCTL" ]; then
-       echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin', please bitbake qemu-helper-native"
+       echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
 	exit 1
 fi
 
-- 
2.1.4


