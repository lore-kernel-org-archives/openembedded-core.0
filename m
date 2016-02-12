Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4E98273289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 14:02:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2016 06:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,436,1449561600"; d="scan'208";a="910745429"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2016 06:02:07 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1EC1D6A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 06:49:56 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 16:05:20 +0200
Message-Id: <1455285920-6920-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] mmc-utils: upgrade to latest git version
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
X-List-Received-Date: Fri, 12 Feb 2016 14:02:06 -0000

Removed 0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch

Instead of that patch, define __SANE_USERSPACE_TYPES__ to avoid
compile errors due to conflicting types for '__u64' in MIPS64/PPC64

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...mc.h-don-t-include-asm-generic-int-ll64.h.patch | 28 ----------------------
 meta/recipes-devtools/mmc/mmc-utils_git.bb         | 11 ++++-----
 2 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch
deleted file mode 100644
index 1724de5..0000000
--- a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-mmc.h: don't include <asm-generic/int-ll64.h>
-
-Including this file causes a compile failure for qemumips64.
-This file is not needed to be explicitly included, because it will be
-included by the <linux/mmc/ioctl.h> file if _MIPS_SZLONG is not 64.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- mmc.h |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/mmc.h b/mmc.h
-index 9871d62..3df2cdf 100644
---- a/mmc.h
-+++ b/mmc.h
-@@ -14,7 +14,6 @@
-  * Boston, MA 021110-1307, USA.
-  */
- 
--#include <asm-generic/int-ll64.h>
- #include <linux/mmc/ioctl.h>
- #include <stdio.h>
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index c50ba54..64b8910 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,18 +4,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=17;md5=d7747fc87f1eb22b946ef819969503f0"
 
 SRCBRANCH ?= "master"
-SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
+SRCREV = "44f94b925894577f9ffcf2c418dd013a5e582648"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
-           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
 
-do_configure_prepend() {
-    sed -i "s:-Werror::g" ${S}/Makefile
-}
+CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
+CFLAGS_append_mips64 = " -D__SANE_USERSPACE_TYPES__"
+CFLAGS_append_mips64n32 = " -D__SANE_USERSPACE_TYPES__"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.4.0


