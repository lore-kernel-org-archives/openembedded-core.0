Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0DC6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 22:45:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2016 15:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,253,1470726000"; d="scan'208";a="1021961633"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2016 15:45:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 15:45:36 -0700
Message-Id: <1472510736-3148-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472510736-3148-1-git-send-email-juro.bystricky@intel.com>
References: <1472510736-3148-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/1] gcc-runtime.inc: add CPP support for mips64-n32 tune
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
X-List-Received-Date: Mon, 29 Aug 2016 22:45:23 -0000

This patch fixes the problem where the CPP compiler cannot find include files.
The compiler is configured to look for the files in places that do not exist.
When querying the CPP for search paths, we observe messages such as these:

multilib configuration:

MACHINE="qemumips64"
require conf/multilib.conf
MULTILIBS = "multilib:lib64 multilib:lib32"
DEFAULTTUNE = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"

ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-gnun32/usr/include/c++/6.2.0/mips64-poky-linux/32

single lib configuration:
MACHINE="qemumips64"
DEFAULTTUNE = "mips64-n32"
ignoring nonexistent directory "<path>/sysroots/mips64-n32-poky-linux-gnun32/usr/include/c++/6.2.0/mips64-poky-linux/

To fix this, create a symlink of the name CPP expects and point it to the corresponding "gnun32" directory.

[YOCTO#10142]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 526be55..9791e21 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -82,6 +82,16 @@ do_install_append_class-target () {
 	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 	fi
+
+	if [ "${TARGET_OS}" = "linux-gnun32" ]; then
+		if [ "${MULTILIBS}" != "" ]; then
+			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
+			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
+		else
+			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
+		fi
+	fi
+
 	if [ "${TCLIBC}" != "glibc" ]; then
 		case "${TARGET_OS}" in
 			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
-- 
2.7.4


