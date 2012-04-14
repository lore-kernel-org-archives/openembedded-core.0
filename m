Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIvES-0001cu-QR
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 07:09:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153517548"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 21:59:43 -0700
Message-Id: <faa747203f561dbd8c74f1797b7db3a6117661f3.1334379293.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1334379293.git.nitin.a.kamble@intel.com>
References: <cover.1334379293.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] grub-1.99: use gcc-cross for building the target binaries
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
X-List-Received-Date: Sat, 14 Apr 2012 05:09:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

It was using distro gcc to build binaries for target. This got detected
on fedora 17 alpha, on which it hit an gcc-4.7 issue.

This Fixes Bug: [Yocto #2291]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index ac66e83..07ee667 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -12,7 +12,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -26,6 +26,8 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 inherit autotools
 inherit gettext
 
+CACHED_CONFIGUREVARS = "ac_cv_prog_ac_ct_TARGET_CC='${CC}'  ac_cv_prog_ac_ct_HOST_CC='${CC}' ac_cv_prog_ac_ct_BUILD_CC='${BUILD_CC}'"
+
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --target=${TARGET_ARCH} --program-prefix="""
 
 do_configure() {
-- 
1.7.7



