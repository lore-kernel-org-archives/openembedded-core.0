Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB02AC4332F
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10819.1653405851894946122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87CF723A;
	Tue, 24 May 2022 08:24:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049083F70D;
	Tue, 24 May 2022 08:24:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 9/9] lzo: remove recipe from oe-core
Date: Tue, 24 May 2022 16:24:01 +0100
Message-Id: <20220524152401.1663317-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166079

LZO is a fairly archaic compression format that hasn't been updated
since 2017.  It's now unused by anything else in oe-core, so remove the
recipes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 ...onfigdir-to-solve-the-undefine-error.patch | 27 -------
 ...Use-memcpy-instead-of-reinventing-it.patch | 77 -------------------
 meta/recipes-support/lzo/lzo/run-ptest        | 33 --------
 meta/recipes-support/lzo/lzo_2.10.bb          | 35 ---------
 7 files changed, 175 deletions(-)
 delete mode 100644 meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to=
-solve-the-undefine-error.patch
 delete mode 100644 meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-=
of-reinventing-it.patch
 delete mode 100644 meta/recipes-support/lzo/lzo/run-ptest
 delete mode 100644 meta/recipes-support/lzo/lzo_2.10.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro=
/include/distro_alias.inc
index e43c0acd80c..d5f91265d9b 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -186,7 +186,6 @@ DISTRO_PN_ALIAS:pn-lttng-modules =3D "OSPDT upstream=3D=
http://lttng.org/"
 DISTRO_PN_ALIAS:pn-lttng-tools =3D "OSPDT upstream=3Dhttp://lttng.org/"
 DISTRO_PN_ALIAS:pn-lttng-ust =3D "OSPDT upstream=3Dhttp://lttng.org/"
 DISTRO_PN_ALIAS:pn-lz4 =3D "Debian=3Dlz4 Fedora=3Dlz4"
-DISTRO_PN_ALIAS:pn-lzo =3D "Debian=3Dliblzo Ubuntu=3Dliblzo Fedora=3Dlzp=
"
 DISTRO_PN_ALIAS:pn-mailx =3D "Debian=3Dbsd-mailx Ubuntu=3Dbsd-mailx"
 DISTRO_PN_ALIAS:pn-makedepend =3D "Mandriva=3Dmakedepend Ubuntu=3Dxutils=
-dev"
 DISTRO_PN_ALIAS:pn-makedevs =3D "OE-Core"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index de3fb7474cb..02e8982de52 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -470,7 +470,6 @@ RECIPE_MAINTAINER:pn-lttng-tools =3D "Richard Purdie =
<richard.purdie@linuxfoundati
 RECIPE_MAINTAINER:pn-lttng-ust =3D "Richard Purdie <richard.purdie@linux=
foundation.org>"
 RECIPE_MAINTAINER:pn-lua =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
 RECIPE_MAINTAINER:pn-lz4 =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-lzo =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index a1ead906493..d97bb80d4d2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -42,7 +42,6 @@ PTESTS_FAST =3D "\
     libxml-simple-perl-ptest \
     libxml2-ptest \
     lua-ptest \
-    lzo-ptest \
     m4-ptest \
     nettle-ptest \
     openssl-ptest \
diff --git a/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-=
the-undefine-error.patch b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfi=
gdir-to-solve-the-undefine-error.patch
deleted file mode 100644
index 5235a15dc9c..00000000000
--- a/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-und=
efine-error.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e730bfd7c2d3a4b5f3605878599cb9b20d31b1fd Mon Sep 17 00:00:00 2001
-From: Fan Xin <fan.xin@jp.fujitsu.com>
-Date: Fri, 2 Jun 2017 11:52:25 +0900
-Subject: [PATCH] Add pkgconfigdir to solve the undefine error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index e4d383b..c75023d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -14,6 +14,7 @@ AM_CPPFLAGS =3D -I$(top_srcdir)/include -I$(top_srcdir=
)
- LDADD =3D src/liblzo2.la
- lib_LTLIBRARIES =3D
- noinst_PROGRAMS =3D
-+pkgconfigdir =3D $(libdir)/pkgconfig
- pkgconfig_DATA =3D lzo2.pc
-=20
-=20
---=20
-1.9.1
-
diff --git a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-rein=
venting-it.patch b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-o=
f-reinventing-it.patch
deleted file mode 100644
index 4e6ca4132b5..00000000000
--- a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing=
-it.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From: Simon McVittie <smcv@debian.org>
-Date: Sun, 23 Nov 2014 22:50:33 +0000
-Subject: Use memcpy() instead of reinventing it
-
-gcc inlines memcpy() with results as fast as handwritten code (at
-least in my brief testing with lzop), and knows the alignment
-constraints for our architectures.
-
-Change suggested by Julian Taylor.
-
-Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D757037
-
-RP: Patch is still in debian as of 20220524 in a revised form:
-https://sources.debian.org/patches/lzo2/2.10-2/
-https://sources.debian.org/patches/lzo2/2.10-2/0001-Conditionally-replac=
e-reinvention-of-memcpy-with-cal.patch/
-
-We likely need this in OE to prevent against unaligned accesses
-on systems such as armv5.
-
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- minilzo/minilzo.c | 14 ++++++++++++++
- src/lzo_func.h    | 14 ++++++++++++++
- 2 files changed, 28 insertions(+)
-
-
-diff --git a/minilzo/minilzo.c b/minilzo/minilzo.c
-index ab2be5f..6913c2f 100644
---- a/minilzo/minilzo.c
-+++ b/minilzo/minilzo.c
-@@ -3523,6 +3523,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memop=
s_TU8p)0)=3D=3D8)
-     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n > =
0); \
-     LZO_BLOCK_END
-=20
-+/* Debian-specific change: we know that our compiler inlines memcpy() w=
ith
-+ * constant n to be as fast as handwritten code, and knows which archit=
ectures
-+ * need things correctly aligned. */
-+#undef LZO_MEMOPS_COPY1
-+#undef LZO_MEMOPS_COPY2
-+#undef LZO_MEMOPS_COPY4
-+#undef LZO_MEMOPS_COPY8
-+#undef LZO_MEMOPS_COPYN
-+#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
-+#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
-+#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
-+#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
-+#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
-+
- __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voi=
dp ss)
- {
-     lzo_uint16_t v;
-diff --git a/src/lzo_func.h b/src/lzo_func.h
-index dfaa676..1cc1b53 100644
---- a/src/lzo_func.h
-+++ b/src/lzo_func.h
-@@ -333,6 +333,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_=
TU8p)0)=3D=3D8)
-     if ((void)0, n__n > 0) do { *d__n++ =3D *s__n++; } while (--n__n > =
0); \
-     LZO_BLOCK_END
-=20
-+/* Debian-specific change: we know that our compiler inlines memcpy() w=
ith
-+ * constant n to be as fast as handwritten code, and knows which archit=
ectures
-+ * need things correctly aligned. */
-+#undef LZO_MEMOPS_COPY1
-+#undef LZO_MEMOPS_COPY2
-+#undef LZO_MEMOPS_COPY4
-+#undef LZO_MEMOPS_COPY8
-+#undef LZO_MEMOPS_COPYN
-+#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
-+#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
-+#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
-+#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
-+#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
-+
- __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voi=
dp ss)
- {
-     lzo_uint16_t v;
diff --git a/meta/recipes-support/lzo/lzo/run-ptest b/meta/recipes-suppor=
t/lzo/lzo/run-ptest
deleted file mode 100644
index 6acb89fc1fe..00000000000
--- a/meta/recipes-support/lzo/lzo/run-ptest
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-
-./lzotest -mavail -n10 -q /etc/services
-if [ $? -eq 0 ]; then
-  echo 'PASS: lzotest'
-else
-  echo 'FAIL: lzotest'
-fi
-LZOTEST=3D./lzotest /bin/sh -e "./check.sh" "/etc"
-./align
-if [ $? -eq 0 ]; then
-  echo 'PASS: align'
-else
-  echo 'FAIL: align'
-fi
-./chksum
-if [ $? -eq 0 ]; then
-  echo 'PASS: chksum'
-else
-  echo 'FAIL: chksum'
-fi
-./simple
-if [ $? -eq 0 ]; then
-  echo 'PASS: simple'
-else
-  echo 'FAIL: simple'
-fi
-./testmini
-if [ $? -eq 0 ]; then
-  echo 'PASS: testmini'
-else
-  echo 'FAIL: testmini'
-fi
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/=
lzo/lzo_2.10.bb
deleted file mode 100644
index 195c2f29393..00000000000
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "Lossless data compression library"
-DESCRIPTION =3D "A portable lossless data compression library written in=
 \
-ANSI C that offers pretty fast compression and *extremely* fast decompre=
ssion. "
-HOMEPAGE =3D "http://www.oberhumer.com/opensource/lzo/"
-SECTION =3D "libs"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
-                    file://src/lzo_init.c;beginline=3D5;endline=3D25;md5=
=3D9ae697ca01829b0a383c5d2d163e0108"
-
-SRC_URI =3D "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.=
tar.gz \
-           file://0001-Use-memcpy-instead-of-reinventing-it.patch \
-	   file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
-           file://run-ptest \
-           "
-
-SRC_URI[md5sum] =3D "39d3f3f9c55c87b1e5d6888e1420f4b5"
-SRC_URI[sha256sum] =3D "c0f892943208266f9b6543b3ae308fab6284c5c90e627931=
446fb49b4221a072"
-
-inherit autotools ptest
-
-CVE_PRODUCT =3D "lzo oberhumer:lzo2"
-
-EXTRA_OECONF =3D "--enable-shared"
-
-do_install_ptest() {
-	t=3D${D}${PTEST_PATH}
-	cp ${S}/util/check.sh $t
-	cp ${B}/minilzo/testmini $t
-	for i in tests/align tests/chksum lzotest/lzotest examples/simple
-		do cp ${B}/`dirname $i`/.libs/`basename $i` $t; \
-	done
-}
-
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


