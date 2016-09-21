Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BC76E60616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:35:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Sep 2016 12:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034348368"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:35:54 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 20:35:37 +0100
Message-Id: <19ef49d402e97d1632ed0eb3e40ead9ff4538ad8.1474484610.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/4] runqemu: try and guess qemu-system binary when MACHINE isn't set
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
X-List-Received-Date: Wed, 21 Sep 2016 19:35:53 -0000

Emulate some logic from the prior, shell based, version of runqemu
to try and infer the correct setting for MACHINE from the kernel
and rootfs filenames.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5170d87..591746f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -846,9 +846,45 @@ class BaseConfig(object):
 
         self.set('ROOTFS_OPTIONS', self.rootfs_options)
 
+    def guess_qb_system(self):
+        """attempt to determine the appropriate qemu-system binary"""
+        mach = self.get('MACHINE')
+        if not mach:
+            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips|qemuppc).*'
+            if self.rootfs:
+                match = re.match(search, self.rootfs)
+                if match:
+                    mach = match.group(1)
+            elif self.kernel:
+                match = re.match(search, self.kernel)
+                if match:
+                    mach = match.group(1)
+
+        if not mach:
+            return None
+
+        if mach == 'qemuarm':
+            qbsys = 'arm'
+        elif mach == 'qemuarm64':
+            qbsys = 'aarch64'
+        elif mach == 'qemux86':
+            qbsys = 'i386'
+        elif mach == 'qemux86-64':
+            qbsys = 'x86_64'
+        elif mach == 'qemuppc':
+            qbsys = 'ppc'
+        elif mach == 'qemumips':
+            qbsys = 'mips'
+        elif mach == 'qemumips64':
+            qbsys = 'mips64'
+
+        return 'qemu-system-%s' % qbsys
+
     def setup_final(self):
         qemu_system = self.get('QB_SYSTEM_NAME')
         if not qemu_system:
+            qemu_system = self.guess_qb_system()
+        if not qemu_system:
             raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
         qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
-- 
2.7.4


