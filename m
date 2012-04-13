Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SId9B-0004ig-1E
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 11:50:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3D9f637010192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 02:41:07 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Apr 2012 02:41:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2012 17:41:16 +0800
Message-ID: <638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334308316.git.liezhi.yang@windriver.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Fri, 13 Apr 2012 09:50:29 -0000
Content-Type: text/plain

There was an error when build with gcc 4.7 (FC 17 64bit):
| fs/zfs/zfs.c: In function 'get_filesystem_dnode':
| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
......
cc1: all warnings being treated as errors

While compare the compile command between gcc 4.4.4 and gcc 4.7.0, they
are the same (both of them have -Wall and -Werror), it seems that gcc
4.7.0 has changed its algorithm for the strict aliasing check, but I
didn't find the related information from its release note.

Add "-fno-strict-aliasing" to gcc's option would fix the problem, this
would disable the optimization for strict-aliasing.

[YOCTO #2291]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index ac66e83..f45b634 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -12,7 +12,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -29,6 +29,11 @@ inherit gettext
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --target=${TARGET_ARCH} --program-prefix="""
 
 do_configure() {
+    # Fix build error for gcc 4.7
+    echo "CPPFLAGS_DEFAULT += -fno-strict-aliasing" >> conf/Makefile.common
+    # Also modify Makefile.in, we can remove this when we can run autoreconf
+    sed -i 's/^CPPFLAGS_DEFAULT = \(.*\)/CPPFLAGS_DEFAULT = -fno-strict-aliasing \1/' \
+	Makefile.in grub-core/Makefile.in
     oe_runconf
 }
 
-- 
1.7.1



