Return-Path: <d.mukhametgaleev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173C3C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 13:37:50 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.10846.1721828262357286542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 06:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=caIpHETN;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=a2ZeHc6O;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: d.mukhametgaleev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 3D014C0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1721828259; bh=ESbO1ZYW6BbNhG1am4s0QCkSqHiy/NKSArXyGHMQrRg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=caIpHETNkPK4Mvs0ZjSOf+B5tGRGWO8d8UJ72kBixxxmd68CY0KWZ7k8ibtnuF09z
	 tVLmYiWpqYdy5xg34mZWAd2zppRpLaGsoqanRrhqoOG51ClqXQLplXzaR4+Ixqffzu
	 D+kAlwfvd6zV3DBru5y/MYXeDTiXRE0ajNFPpBXvxyJ59xh9qzkWlYpYRru2yOHqu+
	 IKkrHMpzJYodwFjDyy7WiDOhyYWIVRfXbZHJwvFRTNEeSvN7Mj5T46vF1ruWa2rD9w
	 gUKjGc65nj/W4+IA+qRXXHahtPP0icRnJv5m8/8lo1Kv4Q3PFSWcY7Ooxv4e+cBjsm
	 4LEllOrsZrV6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1721828259; bh=ESbO1ZYW6BbNhG1am4s0QCkSqHiy/NKSArXyGHMQrRg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=a2ZeHc6OO4FL9MyI6yakT6anCTNcfSFw+urF0oNXyo//juxnxoco2HMtT0Kp8EOth
	 g4QZO9JZ32/KgFSj14UzByTODL9ccJmOpY+0yEdhZECau/4RS/7dAaXmksXYh/oKvs
	 UcO1Muo9t9HenRRK2aN3IndNjFwu3DDlz8RWV0PMaZL4N+Ycl70im/GUtGHQ5yzQEJ
	 AyQoQU0OL7UXVX9YLjKi+pL8Q+r2NYo3x9eTYBF84AL5thiUW6LtHP07TTFfQ6XgqN
	 kH44ZHT/11/QBEu7Qok2Weg1yLBn1hwGTcCFqlGf2d+LhqFSMSCPi2Xpv4RpfV9GBU
	 ACecZ+62rGNYA==
From: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
Subject: [PATCH 2/2] poky: avoid using host Python by inheriting python3native in appropriate recipes
Date: Wed, 24 Jul 2024 16:36:24 +0300
Message-ID: <20240724133624.3450439-1-d.mukhametgaleev@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 13:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202443

Signed-off-by: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb                         | 2 ++
 meta/recipes-bsp/grub/grub_2.12.bb                             | 2 ++
 meta/recipes-core/coreutils/coreutils_9.4.bb                   | 2 ++
 meta/recipes-core/gettext/gettext_0.22.5.bb                    | 2 ++
 meta/recipes-core/glibc/glibc_2.39.bb                          | 2 ++
 meta/recipes-devtools/binutils/binutils-cross_2.42.bb          | 2 ++
 meta/recipes-devtools/bison/bison_3.8.2.bb                     | 2 ++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb            | 2 ++
 meta/recipes-devtools/flex/flex_2.6.4.bb                       | 3 +++
 meta/recipes-devtools/gcc/gcc-cross_13.2.bb                    | 1 +
 meta/recipes-devtools/gcc/gcc-runtime_13.2.bb                  | 2 ++
 meta/recipes-devtools/mtools/mtools_4.0.43.bb                  | 3 +++
 meta/recipes-devtools/pseudo/pseudo_git.bb                     | 2 ++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb                     | 2 ++
 meta/recipes-extended/bash/bash_5.2.21.bb                      | 2 ++
 meta/recipes-extended/bc/bc_1.07.1.bb                          | 3 +++
 meta/recipes-extended/cpio/cpio_2.15.bb                        | 2 ++
 meta/recipes-extended/diffutils/diffutils_3.10.bb              | 2 ++
 meta/recipes-extended/ed/ed_1.20.1.bb                          | 2 ++
 meta/recipes-extended/findutils/findutils_4.9.0.bb             | 2 ++
 meta/recipes-extended/gawk/gawk_5.3.0.bb                       | 2 ++
 meta/recipes-extended/grep/grep_3.11.bb                        | 2 ++
 meta/recipes-extended/groff/groff_1.23.0.bb                    | 2 ++
 meta/recipes-extended/gzip/gzip_1.13.bb                        | 2 ++
 meta/recipes-extended/lzip/lzip_1.24.bb                        | 2 ++
 meta/recipes-extended/lzip/lzlib_1.14.bb                       | 3 +++
 meta/recipes-extended/parted/parted_3.6.bb                     | 2 ++
 meta/recipes-extended/screen/screen_4.9.1.bb                   | 2 ++
 meta/recipes-extended/sed/sed_4.9.bb                           | 2 ++
 meta/recipes-extended/tar/tar_1.35.bb                          | 2 ++
 meta/recipes-extended/time/time_1.9.bb                         | 2 ++
 meta/recipes-extended/wget/wget_1.21.4.bb                      | 2 ++
 meta/recipes-extended/which/which_2.21.bb                      | 2 ++
 .../ca-certificates/ca-certificates_20211016.bb                | 2 ++
 meta/recipes-support/gmp/gmp_6.3.0.bb                          | 2 ++
 meta/recipes-support/libassuan/libassuan_2.5.6.bb              | 2 ++
 meta/recipes-support/libcheck/libcheck_0.15.2.bb               | 2 ++
 meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb             | 2 ++
 meta/recipes-support/libgpg-error/libgpg-error_1.48.bb         | 2 ++
 meta/recipes-support/libmpc/libmpc_1.3.1.bb                    | 1 +
 meta/recipes-support/libunistring/libunistring_1.2.bb          | 3 +++
 meta/recipes-support/mpfr/mpfr_4.2.1.bb                        | 2 ++
 meta/recipes-support/nettle/nettle_3.9.1.bb                    | 2 ++
 43 files changed, 89 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.12.bb
index 9857e8e0..f6e8b74a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -7,6 +7,8 @@ GRUBPLATFORM =3D "efi"
 DEPENDS:append =3D " grub-native"
 RDEPENDS:${PN} =3D "grub-common virtual-grub-bootconf"
=20
+inherit python3native
+
 SRC_URI +=3D " \
            file://cfg \
           "
diff --git a/meta/recipes-bsp/grub/grub_2.12.bb b/meta/recipes-bsp/grub/g=
rub_2.12.bb
index 05d46278..10217230 100644
--- a/meta/recipes-bsp/grub/grub_2.12.bb
+++ b/meta/recipes-bsp/grub/grub_2.12.bb
@@ -1,5 +1,7 @@
 require grub2.inc
=20
+inherit python3native
+
 RDEPENDS:${PN}-common +=3D "${PN}-editenv"
 RDEPENDS:${PN} +=3D "${PN}-common"
 RDEPENDS:${PN}:class-native =3D ""
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-=
core/coreutils/coreutils_9.4.bb
index 62ecdea6..386f2ea7 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -13,6 +13,8 @@ DEPENDS:class-native =3D ""
=20
 inherit autotools gettext texinfo
=20
+inherit python3native
+
 SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-c=
ore/gettext/gettext_0.22.5.bb
index 1a66d379..c7e143c3 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -20,6 +20,8 @@ PROVIDES =3D "virtual/libintl virtual/gettext"
 PROVIDES:class-native =3D "virtual/gettext-native"
 RCONFLICTS:${PN} =3D "proxy-libintl"
=20
+inherit python3native
+
 require gettext-sources.inc
 SRC_URI +=3D " \
            file://parallel.patch \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
index 91224726..3e962f34 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,6 +18,8 @@ easier access for another. 'ASLR bypass itself is not a=
 vulnerability.'"
=20
 DEPENDS +=3D "gperf-native bison-native"
=20
+inherit python3native
+
 NATIVESDKFIXES ?=3D ""
 NATIVESDKFIXES:class-nativesdk =3D "\
            file://0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-=
as-.patch \
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.42.bb b/meta=
/recipes-devtools/binutils/binutils-cross_2.42.bb
index fbd1f7d2..28db0a15 100644
--- a/meta/recipes-devtools/binutils/binutils-cross_2.42.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross_2.42.bb
@@ -1,3 +1,5 @@
 require binutils.inc
 require binutils-${PV}.inc
 require binutils-cross.inc
+
+inherit python3native
\ No newline at end of file
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-de=
vtools/bison/bison_3.8.2.bb
index da138e35..58dc1ef6 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
 SECTION =3D "devel"
 DEPENDS =3D "bison-native flex-native"
=20
+inherit python3native
+
 SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 940b47c1..8c9d83b6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -1,5 +1,7 @@
 require e2fsprogs.inc
=20
+inherit python3native
+
 SRC_URI +=3D "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devt=
ools/flex/flex_2.6.4.bb
index f7d4ef1f..9245184c 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -7,6 +7,9 @@ LICENSE =3D "BSD-3-Clause & LGPL-2.0-or-later"
 LICENSE:${PN}-libfl =3D "BSD-3-Clause"
=20
 DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native fl=
ex-native', '', d)}"
+
+inherit python3native
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067 \
diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.2.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_13.2.bb
index b43cca0c..b7a8cf43 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_13.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_13.2.bb
@@ -1,3 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-cross.inc
=20
+inherit python3native
\ No newline at end of file
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_13.2.bb
index dd430b57..f8585b0a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb
@@ -1,2 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-runtime.inc
+
+inherit python3native
\ No newline at end of file
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.43.bb b/meta/recipes=
-devtools/mtools/mtools_4.0.43.bb
index 85910397..793d2964 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.43.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.43.bb
@@ -5,6 +5,9 @@ SECTION =3D "optional"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
+inherit python3native
+
+
 DEPENDS +=3D "virtual/libiconv"
=20
 RDEPENDS:${PN}:libc-glibc =3D "glibc-gconv-ibm850"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
index c70b5092..dd3fd64e 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,5 +1,7 @@
 require pseudo.inc
=20
+inherit python3native
+
 SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=3D=
https \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-de=
vtools/rsync/rsync_3.2.7.bb
index 130581a7..efb3579a 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24423708fe15=
9c9d12be1ea29fcb18c7"
=20
 DEPENDS =3D "popt"
=20
+inherit python3native
+
 SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-ext=
ended/bash/bash_5.2.21.bb
index 46d921bb..6831e3f4 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -1,5 +1,7 @@
 require bash.inc
=20
+inherit python3native
+
 # GPL-2.0-or-later (< 4.0), GPL-3.0-or-later (>=3D 4.0)
 LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extende=
d/bc/bc_1.07.1.bb
index 819da6cd..5882b341 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -2,6 +2,9 @@ SUMMARY =3D "Arbitrary precision calculator language"
 HOMEPAGE =3D "http://www.gnu.org/software/bc/bc.html"
 DESCRIPTION =3D "bc is an arbitrary precision numeric processing languag=
e. Syntax is similar to C, but differs in many substantial areas. It supp=
orts interactive execution of statements."
=20
+
+inherit python3native
+
 LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
                     file://COPYING.LIB;md5=3D6a6a8e020838b23406c81b19c1d=
46df6 \
diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-exten=
ded/cpio/cpio_2.15.bb
index 52070f59..a20745ef 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D "efa50ef983137eefc0a02fdb51509d6=
24b5e3295c980aa127ceee41834
=20
 inherit autotools gettext texinfo ptest
=20
+inherit python3native
+
 CVE_STATUS[CVE-2010-4226] =3D "not-applicable-platform: Issue applies to=
 use of cpio in SUSE/OBS"
=20
 EXTRA_OECONF +=3D "DEFAULT_RMT_DIR=3D${sbindir}"
diff --git a/meta/recipes-extended/diffutils/diffutils_3.10.bb b/meta/rec=
ipes-extended/diffutils/diffutils_3.10.bb
index 08e83056..1cd4052b 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.10.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.10.bb
@@ -23,6 +23,8 @@ inherit ptest
=20
 RDEPENDS:${PN}-ptest +=3D "make perl"
=20
+inherit python3native
+
 do_install_ptest() {
 	t=3D${D}${PTEST_PATH}
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
diff --git a/meta/recipes-extended/ed/ed_1.20.1.bb b/meta/recipes-extende=
d/ed/ed_1.20.1.bb
index 9ae53002..3d8844b2 100644
--- a/meta/recipes-extended/ed/ed_1.20.1.bb
+++ b/meta/recipes-extended/ed/ed_1.20.1.bb
@@ -25,6 +25,8 @@ EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
=20
 inherit texinfo
=20
+inherit python3native
+
 do_configure() {
 	${S}/configure
 }
diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/re=
cipes-extended/findutils/findutils_4.9.0.bb
index 074817df..91f0112e 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
=20
 DEPENDS =3D "bison-native"
=20
+inherit python3native
+
 SRC_URI[sha256sum] =3D "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d5475=
73cb08065fd462fe"
=20
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.0.bb
index d7a0fc61..d85c2771 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -6,6 +6,8 @@ HOMEPAGE =3D "https://www.gnu.org/software/gawk/"
 BUGTRACKER  =3D "bug-gawk@gnu.org"
 SECTION =3D "console/utils"
=20
+inherit python3native
+
 # gawk <=3D 3.1.5: GPL-2.0-only
 # gawk >=3D 3.1.6: GPL-3.0-only
 LICENSE =3D "GPL-3.0-only"
diff --git a/meta/recipes-extended/grep/grep_3.11.bb b/meta/recipes-exten=
ded/grep/grep_3.11.bb
index cb3105de..0ea329da 100644
--- a/meta/recipes-extended/grep/grep_3.11.bb
+++ b/meta/recipes-extended/grep/grep_3.11.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] =3D "1db2aedde89d0dea42b16d9528f894c=
8d15dae4e190b59aecc78f5a951
=20
 inherit autotools gettext texinfo pkgconfig
=20
+inherit python3native
+
 # Fix "Argument list too long" error when len(TMPDIR) =3D 410
 acpaths =3D "-I ./m4"
=20
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-e=
xtended/groff/groff_1.23.0.bb
index 0fc4f831..e70fcd62 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -5,6 +5,8 @@ SECTION =3D "base"
 HOMEPAGE =3D "http://www.gnu.org/software/groff/"
 LICENSE =3D "GPL-3.0-only"
=20
+inherit python3native
+
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
 SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-exten=
ded/gzip/gzip_1.13.bb
index fd846b30..095ee896 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -20,6 +20,8 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit ptest
=20
+inherit python3native
+
 do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/src/build-aux
 	cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/src/build-aux/
diff --git a/meta/recipes-extended/lzip/lzip_1.24.bb b/meta/recipes-exten=
ded/lzip/lzip_1.24.bb
index 73040a6f..df4c338e 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] =3D "d42659229b10e066eeb6e81eb673cdd=
893b672e512d26719c2d9597555
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
=20
+inherit python3native
+
 CONFIGUREOPTS =3D "\
     '--srcdir=3D${S}' \
     '--prefix=3D${prefix}' \
diff --git a/meta/recipes-extended/lzip/lzlib_1.14.bb b/meta/recipes-exte=
nded/lzip/lzlib_1.14.bb
index a6010bbf..0ab0b4f4 100644
--- a/meta/recipes-extended/lzip/lzlib_1.14.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.14.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] =3D "5acac8714ed4f306020bae660dddce7=
06e5f8a795863679037da9fe6bf
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
=20
+inherit python3native
+
+
 CONFIGUREOPTS =3D "\
     '--srcdir=3D${S}' \
     '--prefix=3D${prefix}' \
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-ex=
tended/parted/parted_3.6.bb
index a537ef74..3d98c97f 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2f31b266d3440d=
d7ee50f92cf67d8e6c"
 SECTION =3D "console/tools"
 DEPENDS =3D "ncurses util-linux virtual/libiconv"
=20
+inherit python3native
+
 SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-r=
esi.patch \
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-=
extended/screen/screen_4.9.1.bb
index 7b040e6b..53f43770 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -7,6 +7,8 @@ BUGTRACKER =3D "https://savannah.gnu.org/bugs/?func=3Dadd=
item&group=3Dscreen"
=20
 SECTION =3D "console/utils"
=20
+inherit python3native
+
 LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
                     file://screen.h;endline=3D26;md5=3Db8dc717c9a3dba842=
ae6c44ca0f73f52 \
diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended=
/sed/sed_4.9.bb
index c4d89c34..2332b81d 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -20,6 +20,8 @@ PACKAGECONFIG[selinux] =3D "--with-selinux,--without-se=
linux,libselinux"
 RDEPENDS:${PN}-ptest +=3D "make gawk perl perl-module-filehandle perl-mo=
dule-file-compare perl-module-file-find perl-module-file-temp perl-module=
-file-stat"
 RRECOMMENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-ru-ru locale=
-base-en-us locale-base-el-gr.iso-8859-7"
=20
+inherit python3native
+
 EXTRA_OECONF =3D "--disable-acl \
                "
=20
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extende=
d/tar/tar_1.35.bb
index c7bd1d19..cf22c26b 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] =3D "7edb8886a3dc69420a1446e1e2d0619=
22b642f1cf632d2cd0f9ee7e690
=20
 inherit autotools gettext texinfo
=20
+inherit python3native
+
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG:append:class-target =3D " ${@bb.utils.filter('DISTRO_FEATU=
RES', 'acl', d)}"
=20
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extend=
ed/time/time_1.9.bb
index 8364210e..77faf6fa 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -21,3 +21,5 @@ SRC_URI[md5sum] =3D "d2356e0fe1c0b85285d83c6b2ad51b5f"
 SRC_URI[sha256sum] =3D "fbacf0c81e62429df3e33bda4cee38756604f18e01d97733=
8e23306a3e3b521e"
=20
 inherit autotools
+
+inherit python3native
\ No newline at end of file
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-ext=
ended/wget/wget_1.21.4.bb
index 1d31b011..d7829916 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -1,3 +1,5 @@
+inherit python3native
+
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-ext=
ended/which/which_2.21.bb
index 77861370..d311b576 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504\
                     file://which.c;beginline=3D1;endline=3D17;md5=3Da996=
3693af2272e7a8df6f231164e7a2"
 DEPENDS     =3D "cwautomacros-native"
=20
+inherit python3native
+
 inherit autotools texinfo update-alternatives
=20
=20
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_2021101=
6.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 99abe606..35ddd6dc 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -14,6 +14,8 @@ DEPENDS:class-nativesdk =3D "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
=20
+inherit python3native
+
 SRCREV =3D "07de54fdcc5806bde549e1edf60738c6bccf50e8"
=20
 SRC_URI =3D "git://salsa.debian.org/debian/ca-certificates.git;protocol=3D=
https;branch=3Dmaster \
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support=
/gmp/gmp_6.3.0.bb
index fd4aec92..2356483d 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -25,6 +25,8 @@ EXTRA_OECONF:append:mipsarchr6 =3D " --disable-assembly=
"
 PACKAGES =3D+ "libgmpxx"
 FILES:libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"
=20
+inherit python3native
+
 do_install:append() {
 	oe_multilib_header gmp.h
 }
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.6.bb b/meta/rec=
ipes-support/libassuan/libassuan_2.5.6.bb
index 7e899e73..22773a32 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.6.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c=
2e1ecd4e0c9be8967949 \
=20
 DEPENDS =3D "libgpg-error"
=20
+inherit python3native
+
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index 5ab67b87..00bf9e2f 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -20,6 +20,8 @@ S =3D "${WORKDIR}/check-${PV}"
=20
 inherit autotools pkgconfig texinfo github-releases
=20
+inherit python3native
+
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_AWK_PATH=3D${bindir}/gawk"
=20
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 5a76201a..79b33fea 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -6,6 +6,8 @@ HOMEPAGE =3D "http://directory.fsf.org/project/libgcrypt/=
"
 BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
 SECTION =3D "libs"
=20
+inherit python3native
+
 # helper program gcryptrnd and getrandom are under GPL, rest LGPL
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} =3D "LGPL-2.1-or-later"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/met=
a/recipes-support/libgpg-error/libgpg-error_1.48.bb
index 9f2b4920..b42ccb07 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
@@ -32,6 +32,8 @@ MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/gpgrt-config"
=20
 CPPFLAGS +=3D "-P"
=20
+inherit python3native
+
 do_install:append() {
 	# we don't have common lisp in OE
 	rm -rf "${D}${datadir}/common-lisp/"
diff --git a/meta/recipes-support/libmpc/libmpc_1.3.1.bb b/meta/recipes-s=
upport/libmpc/libmpc_1.3.1.bb
index ed57396c..3c6e8958 100644
--- a/meta/recipes-support/libmpc/libmpc_1.3.1.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.3.1.bb
@@ -2,6 +2,7 @@ require libmpc.inc
=20
 DEPENDS =3D "gmp mpfr"
=20
+inherit python3native
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3De6a600fd5e1d9cbde2d983=
680233ad02"
 SRC_URI =3D "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
=20
diff --git a/meta/recipes-support/libunistring/libunistring_1.2.bb b/meta=
/recipes-support/libunistring/libunistring_1.2.bb
index 3018dbfd..d23d7b15 100644
--- a/meta/recipes-support/libunistring/libunistring_1.2.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.2.bb
@@ -24,4 +24,7 @@ SRC_URI =3D "${GNU_MIRROR}/libunistring/libunistring-${=
PV}.tar.gz"
 SRC_URI[sha256sum] =3D "fd6d5662fa706487c48349a758b57bc149ce94ec6c30624e=
c9fdc473ceabbc8e"
=20
 inherit autotools texinfo
+
+inherit python3native
+
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.1.bb b/meta/recipes-suppo=
rt/mpfr/mpfr_4.2.1.bb
index a2067e10..8d21db7f 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237=
af26da5dc08a4e440464 \
                     "
 DEPENDS =3D "gmp autoconf-archive-native"
=20
+inherit python3native
+
 SRC_URI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "277807353a6726978996945af13e52829e3abd7a9a5b7fb2=
793894e18f1fcbb2"
=20
diff --git a/meta/recipes-support/nettle/nettle_3.9.1.bb b/meta/recipes-s=
upport/nettle/nettle_3.9.1.bb
index 396708cf..99766dbf 100644
--- a/meta/recipes-support/nettle/nettle_3.9.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.9.1.bb
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSERv3;md5=3D6a6=
a8e020838b23406c81b19c1d46df6
=20
 DEPENDS +=3D "gmp"
=20
+inherit python3native
+
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
--=20
2.30.2


