Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDG-0001ZJ-0I
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753279"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:05 -0700
Message-Id: <059f194ce53999fc216e788f2bc637e8858daa2b.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 18/50] tclibc-*libc: Utilize TARGET_FPU for gnuspe setting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 08:33:03 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Its possible that BASE_PACKAGE_ARCH isn't set to ppce500 or ppce500v2 when
we build native toolchains.  So we can utilize TARGET_FPU being set to
'ppc-efd' or 'ppc-efs' to determine if we should enable the gnuspe ABI.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/distro/include/tclibc-eglibc.inc |    2 +-
 meta/conf/distro/include/tclibc-glibc.inc  |    2 +-
 meta/conf/distro/include/tclibc-uclibc.inc |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index e070aad..9fab4dc 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -5,7 +5,7 @@
 TARGET_OS = "linux"
 TARGET_OS_arm = "linux-gnueabi"
 TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add glibc overrides to the overrides for eglibc.
 OVERRIDES .= ":libc-glibc"
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 5e7afc1..0370dfa 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -5,7 +5,7 @@
 TARGET_OS = "linux"
 TARGET_OS_arm = "linux-gnueabi"
 TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add glibc to the overrides.
 OVERRIDES =. "libc-glibc:"
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 65693a9..2ccda5b 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -5,6 +5,7 @@
 TARGET_OS = "linux-uclibc"
 TARGET_OS_arm = "linux-uclibceabi"
 TARGET_OS_armeb = "linux-uclibceabi"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add uclibc overrides to the overrides.
 OVERRIDES =. "libc-uclibc:"
-- 
1.7.3.4



