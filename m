Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A7B396025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:27:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2016 11:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,406,1470726000"; d="scan'208";a="1057378562"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2016 11:27:19 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 11:27:16 -0700
Message-Id: <1475000836-12716-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Cc: joshua.g.lock@intel.com
Subject: [PATCH RFC] scripts/runqemu: Be more loose when guessing QB_SYSTEM_NAME variable
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
X-List-Received-Date: Tue, 27 Sep 2016 18:27:19 -0000

Following the instructions to reproduce YOCTO #10026 I found that
runqemu would fail to start because QB_SYSTEM_NAME is null. This patch
makes the guessing algorithm more loose allowing it to correctly guess
the variable from the MACHINE name.

It is still a good assumption that if it contains "qemux86-64" for
example, that the system is x86-64, so this is unlikely to cause any
new issues while preserving some peoples' old workflows.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 scripts/runqemu | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 45bcad7..b06d09e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -870,20 +870,20 @@ class BaseConfig(object):
         if not mach:
             return None
 
-        if mach == 'qemuarm':
-            qbsys = 'arm'
-        elif mach == 'qemuarm64':
+        elif 'qemuarm64' in mach:
             qbsys = 'aarch64'
-        elif mach == 'qemux86':
-            qbsys = 'i386'
-        elif mach == 'qemux86-64':
+        if 'qemuarm' in mach:
+            qbsys = 'arm'
+        elif 'qemux86-64' in mach:
             qbsys = 'x86_64'
-        elif mach == 'qemuppc':
+        elif 'qemux86' in mach:
+            qbsys = 'i386'
+        elif 'qemuppc' in mach:
             qbsys = 'ppc'
-        elif mach == 'qemumips':
-            qbsys = 'mips'
-        elif mach == 'qemumips64':
+        elif 'qemumips64' in mach:
             qbsys = 'mips64'
+        elif 'qemumips' in mach:
+            qbsys = 'mips'
 
         return 'qemu-system-%s' % qbsys
 
-- 
2.5.5


