Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SuinO-0002OP-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:33:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2012 04:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="198893969"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2012 04:21:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 14:21:43 +0300
Message-Id: <7f3f04caee7e265481f88c333ffae491a9d137db.1343387245.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
References: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343387245.git.laurentiu.palcu@intel.com>
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/6] binutils: relocatable SDK: change PT_INTERP section size
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
X-List-Received-Date: Fri, 27 Jul 2012 11:33:26 -0000

This patch is needed so that all SDK binaries have the PT_INTERP section
size set to 4096 (max path size in Linux) in order to be able to parse
the binaries later and change the interpreter to the path we want.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../binutils/binutils-crosssdk_2.22.bb             |    5 +++++
 .../binutils/binutils/relocatable_sdk.patch        |   13 +++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch

diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index 0eb5684..c936549 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -2,8 +2,13 @@ require binutils-cross_${PV}.bb
 
 inherit crosssdk
 
+PR = "r1"
+
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
+
+SRC_URI += "file://relocatable_sdk.patch"
+
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
 }
diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
new file mode 100644
index 0000000..09cb925
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
@@ -0,0 +1,13 @@
+Index: binutils-2.22/ld/scripttempl/elf.sc
+===================================================================
+--- binutils-2.22.orig/ld/scripttempl/elf.sc
++++ binutils-2.22/ld/scripttempl/elf.sc
+@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
+   DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
+ fi
+ if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
+-  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
++  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
+ fi
+ if test -z "$PLT"; then
+   IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
-- 
1.7.9.5



