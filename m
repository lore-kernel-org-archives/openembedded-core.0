Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 459A777D51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:54:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 13:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="1118751501"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2017 13:54:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 42DA66A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:40:58 +0300
Message-Id: <37196dc09488e5610d3b5253d6bfdbb2a367342f.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1492029084.git.ed.bartosh@linux.intel.com>
References: <cover.1492029084.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/5] runqemu: add bindir_native property
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
X-List-Received-Date: Wed, 12 Apr 2017 20:54:07 -0000

Isolated logic of getting path to native bin directory in
new bindir_native property method.

This property is going to be used to obtain location of
qemu-sytem and tunctl.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a8bb9eb..6cdedd8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -721,7 +721,7 @@ class BaseConfig(object):
                 self.load_bitbake_env()
 
             if self.bitbake_e:
-                native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
+                native_vars = ['STAGING_DIR_NATIVE']
                 for nv in native_vars:
                     s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
                     if s and s.group(1) != self.get(nv):
@@ -1056,18 +1056,7 @@ class BaseConfig(object):
         if not qemu_system:
             raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
-        cmd = 'bitbake qemu-helper-native -e'
-        logger.info('Running %s...' % cmd)
-        out = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
-        out = out.stdout.read().decode('utf-8')
-
-        match = re.search('^STAGING_BINDIR_NATIVE="(.*)"', out, re.M)
-        if match:
-            bindir_native  = match.group(1)
-        else:
-            raise Exception("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
-
-        qemu_bin = '%s/%s' % (bindir_native, qemu_system)
+        qemu_bin = '%s/%s' % (self.bindir_native, qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
         # find QEMU in sysroot, it needs to use host's qemu.
@@ -1196,6 +1185,28 @@ class BaseConfig(object):
             self.bitbake_e = ''
             logger.warn("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
 
+    @property
+    def bindir_native(self):
+        result = self.get('STAGING_BINDIR_NATIVE')
+        if result and os.path.exists(result):
+            return result
+
+        cmd = 'bitbake qemu-helper-native -e'
+        logger.info('Running %s...' % cmd)
+        out = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
+        out = out.stdout.read().decode('utf-8')
+
+        match = re.search('^STAGING_BINDIR_NATIVE="(.*)"', out, re.M)
+        if match:
+            result = match.group(1)
+            if os.path.exists(result):
+                self.set('STAGING_BINDIR_NATIVE', result)
+                return result
+            raise Exception("Native sysroot directory %s doesn't exist" % result)
+        else:
+            raise Exception("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
+
+
 def main():
     if "help" in sys.argv or '-h' in sys.argv or '--help' in sys.argv:
         print_usage()
-- 
2.1.4


