Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TbBxw-0001zL-QP
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 16:11:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Nov 2012 06:57:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="220667009"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2012 06:57:44 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 16:57:42 +0200
Message-Id: <1353509863-8314-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] binutils-crosssdk: do not set .interp size to 0x1000 for partial linked objects
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 15:11:53 -0000

When building the SDK, the final .interp section size should be set to a
bigger value (0x1000) in order to be able to change the dynamic loader's
path later. However, we shouldn't do that for partial linked objects
(when -r or -rU is used). That's because those objects will then have an
.interp section of 0x1000 even if it contains no data and when the final
linking is done we will end up with a "cannot move location counter
backwards" error. That's because the linker will try to squeeze all the data in
the .interp sections found in various partial linked objects into one 0x1000
bytes final .interp section.

[YOCTO #3264]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../binutils/binutils/relocatable_sdk.patch        |   37 +++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
index 33f9e68..7408c31 100644
--- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
+++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
@@ -7,15 +7,42 @@ by the relocating script.
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-Index: binutils-2.22/ld/scripttempl/elf.sc
+Index: binutils_git/ld/genscripts.sh
 ===================================================================
---- binutils-2.22.orig/ld/scripttempl/elf.sc
-+++ binutils-2.22/ld/scripttempl/elf.sc
-@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
+--- binutils_git.orig/ld/genscripts.sh	2012-11-21 11:58:23.325441925 +0200
++++ binutils_git/ld/genscripts.sh	2012-11-21 12:03:42.106815400 +0200
+@@ -290,6 +290,7 @@
+ LD_FLAG=r
+ DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
+ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
++PARTIAL_LINKING=" "
+ ( echo "/* Script for ld -r: link without relocation */"
+   . ${CUSTOMIZER_SCRIPT}
+   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
+@@ -298,10 +299,12 @@
+ LD_FLAG=u
+ DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
+ CONSTRUCTING=" "
++PARTIAL_LINKING=" "
+ ( echo "/* Script for ld -Ur: link w/out relocation, do create constructors */"
+   . ${CUSTOMIZER_SCRIPT}
+   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
+ ) | sed -e '/^ *$/d;s/[ 	]*$//' > ldscripts/${EMULATION_NAME}.xu
++unset PARTIAL_LINKING
+ 
+ LD_FLAG=
+ DATA_ALIGNMENT=${DATA_ALIGNMENT_}
+Index: binutils_git/ld/scripttempl/elf.sc
+===================================================================
+--- binutils_git.orig/ld/scripttempl/elf.sc	2012-11-21 12:02:26.800377384 +0200
++++ binutils_git/ld/scripttempl/elf.sc	2012-11-21 12:04:16.166109621 +0200
+@@ -124,8 +124,8 @@
+   DATA_SEGMENT_END=". = DATA_SEGMENT_END (.);"
    DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
  fi
- if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
+-if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
 -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
++if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}${PARTIAL_LINKING}"; then
 +  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
  fi
  if test -z "$PLT"; then
-- 
1.7.9.5



