Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5008F77081
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:41:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 07 Sep 2016 14:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="165579056"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2016 14:41:29 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 14:42:38 -0700
Message-Id: <1473284559-187471-2-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
References: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
Subject: [PATCH 1/2][PROPOSED] libcap: fix compiling issue when not having libpam
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
X-List-Received-Date: Wed, 07 Sep 2016 21:41:30 -0000

Select a genericx86-64 target and run
bitbake libcap

This error shows up:
-----------------------------------------------------
pam_cap.c:19:34: fatal error: security/pam_modules.h:
No such file or directory
 #include <security/pam_modules.h>
                                  ^
compilation terminated.
Makefile:23: recipe for target 'pam_cap.o' failed
make[1]: *** [pam_cap.o] Error 1
-----------------------------------------------------

The option PAM_CAP=yes/no is not effectively passed to make.
We change to EXTRA_OEMAKE, instead of EXTRA_OECONF which
PACKAGECONFIG deals with, for this Makefile-based project.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
Limited test is performed by building this recipe only.
Refer to the cover letter before merge.

 meta/recipes-support/libcap/libcap_2.25.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 8f3f11e..bc29310 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
-DEPENDS = "hostperl-runtime-native"
+DEPENDS = "hostperl-runtime-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
@@ -27,18 +27,17 @@ do_configure() {
 	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-native ??= ""
 
 PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
-PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
 EXTRA_OEMAKE = " \
   INDENT=  \
   lib=${@os.path.basename('${libdir}')} \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM_CAP=yes', 'PAM_CAP=no', d)} \
 "
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
-- 
2.7.4


