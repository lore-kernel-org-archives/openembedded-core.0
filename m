Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C74E673E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:15:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAFNTl027230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:15:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:15:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 03:15:20 -0700
Message-ID: <199bdc672f96e4b5c48a3d1523321b90a82788ef.1440145857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440145857.git.liezhi.yang@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] oprofile: 1.0.0 -> 1.1.0
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
X-List-Received-Date: Fri, 21 Aug 2015 10:15:24 -0000
Content-Type: text/plain

* Remove backport patch filemode-fix.patch.
* Update --with-kernel=${STAGING_DIR_HOST}/${prefix} to find kernel
  headers (linux/*.h) to fix the error:
| checking kernel supports perf_events... unknown -- perf_event.h not found
| ERROR: You requested to build oprofile with '--with-kernel=/buildarea/lyang1/test_f2/tmp/work-shared/qemux86/kernel-source',
| but headers were not accessible at the given location.
| Be sure you have run the following command from within your kernel source tree:
|      make headers_install INSTALL_HDR_PATH=<kernel-hdrs-install-dir>
| Then pass <kernel-hdrs-install-dir> to oprofile's '--with-kernel' configure option.
| configure: error: Unable to build oprofile. Exiting.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/filemode-fix.patch           |   41 --------------------
 .../{oprofile_1.0.0.bb => oprofile_1.1.0.bb}       |    5 +--
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/filemode-fix.patch
 rename meta/recipes-kernel/oprofile/{oprofile_1.0.0.bb => oprofile_1.1.0.bb} (44%)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 6b393bc..6ec56e7 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,7 +19,6 @@ FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://filemode-fix.patch \
            file://acinclude.m4 \
            file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
@@ -28,7 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig ptest
 
-EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
+EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix} --without-x ac_cv_prog_XSLTPROC="
 do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
diff --git a/meta/recipes-kernel/oprofile/oprofile/filemode-fix.patch b/meta/recipes-kernel/oprofile/oprofile/filemode-fix.patch
deleted file mode 100644
index f7ebe24..0000000
--- a/meta/recipes-kernel/oprofile/oprofile/filemode-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-With security_flags.inc:
-
-| In file included from /media/build1/poky/build/tmp/sysroots/qemumips/usr/include/fcntl.h:302:0,
-|                  from opjitconv.c:25:
-| In function 'open',
-|     inlined from 'copy_dumpfile' at opjitconv.c:219:6:
-| /media/build1/poky/build/tmp/sysroots/qemumips/usr/include/bits/fcntl2.h:50:4: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT in second argument needs 3 arguments
-|     __open_missing_mode ();
-|     ^
-| Makefile:440: recipe for target 'opjitconv.o' failed
-
-Why does this only happen on mips? mips has:
-
-O_CREAT = 0x100 
-and
-S_IRUSR = 0400
-
-and these (in hex and otcal) are equivalent. Most other platforms 
-have O_CREAT = 0100.
-
-http://sourceforge.net/p/oprofile/oprofile/ci/4598ca73b0a367ca46d4a2843261e20e1896773b
-
-The file should not be created, only opened if its present, therefore use O_RDONLY instead.
-
-RP 2014/11/6
-
-Upstream-Status: Backport
-
-Index: oprofile-1.0.0/opjitconv/opjitconv.c
-===================================================================
---- oprofile-1.0.0.orig/opjitconv/opjitconv.c	2014-09-12 14:39:47.000000000 +0000
-+++ oprofile-1.0.0/opjitconv/opjitconv.c	2014-11-06 13:14:25.941639003 +0000
-@@ -216,7 +216,7 @@
- 	int file_locked = 0;
- 	unsigned int usecs_waited = 0;
- 	int rc = OP_JIT_CONV_OK;
--	int fd = open(dumpfile, S_IRUSR);
-+	int fd = open(dumpfile, O_RDONLY);
- 	if (fd < 0) {
- 		perror("opjitconv failed to open JIT dumpfile");
- 		return OP_JIT_CONV_FAIL;
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
similarity index 44%
rename from meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
rename to meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
index b44b5c5..92a94ad 100644
--- a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
@@ -3,9 +3,8 @@ require oprofile.inc
 DEPENDS += "virtual/kernel"
 DEPENDS_append_powerpc64 = " libpfm4"
 
-SRC_URI[md5sum] = "ba0b340e5c421a93959776c836ed35b3"
-SRC_URI[sha256sum] = "847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7e3c45a"
+SRC_URI[md5sum] = "248c4c069f9476f427fa7195563f9867"
+SRC_URI[sha256sum] = "cf759a6de1a6033d5dfc93bda129a9f2e128aecc4238cc657feb0801d1b0366c"
 
 S = "${WORKDIR}/oprofile-${PV}"
 
-PR = "r1"
-- 
1.7.9.5


