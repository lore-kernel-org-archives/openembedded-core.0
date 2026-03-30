Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C66C10D14B2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 13:28:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51290.1774877316503534024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 06:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JV4PJ0P8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35DA13580
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEB193F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774877316; bh=e2aeHszUknUzkVfYZWj+nD0VtqnGTXaiM5sQW4Cm3Tk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JV4PJ0P8AS6kNgb39EXRHuezk/SPb+3nbmjZRzsBTtRtVo4NZzI9ADIvDajNPURxW
	 qn0cPk8ThY6GVxyODDU7WnFslqMvCvj+3apTpcxRYl3CLYafA4j6ttSOe9rEH5LEo3
	 IQS6cA1CaWG7m5VLgYbt6SYV7Z7wQfu+2YA5Aejs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] recipes: remove redundant autoreconf excludes
Date: Mon, 30 Mar 2026 14:28:25 +0100
Message-ID: <20260330132825.1784802-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132825.1784802-1-ross.burton@arm.com>
References: <20260330132825.1784802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234236

With autoconf 2.73 autoreconf is better at not forcibly running aclocal
or autoheader if the relevant files are not managed by those tools.

This means we can remove a number of explicit excludes as they are no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb   | 1 -
 meta/recipes-connectivity/openssh/openssh_10.2p1.bb   | 2 --
 meta/recipes-connectivity/socat/socat_1.8.1.1.bb      | 2 --
 meta/recipes-core/readline/readline.inc               | 3 ---
 meta/recipes-devtools/diffstat/diffstat_1.68.bb       | 2 --
 meta/recipes-devtools/expect/expect_5.45.4.bb         | 2 --
 meta/recipes-devtools/help2man/help2man_1.49.3.bb     | 4 ----
 meta/recipes-devtools/quilt/quilt.inc                 | 2 --
 meta/recipes-devtools/ruby/ruby_4.0.1.bb              | 2 --
 meta/recipes-devtools/subversion/subversion_1.14.5.bb | 2 --
 meta/recipes-devtools/tcltk/tcl_9.0.3.bb              | 1 -
 meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb           | 1 -
 meta/recipes-extended/bash/bash.inc                   | 1 -
 meta/recipes-extended/cups/cups.inc                   | 2 --
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc       | 3 ---
 meta/recipes-support/nettle/nettle_3.10.2.bb          | 2 --
 16 files changed, 32 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/r=
ecipes-connectivity/libpcap/libpcap_1.10.6.bb
index 1b10001035b..9b259396f06 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -25,7 +25,6 @@ EXTRA_OECONF =3D " \
                  --without-dag \
                  --without-dpdk \
                  "
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_10.2p1.bb
index 929c9e4b9fb..96cb09acc0e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -66,8 +66,6 @@ PACKAGECONFIG[hostkey-rsa] =3D ""
 PACKAGECONFIG[hostkey-ecdsa] =3D ""
 PACKAGECONFIG[hostkey-ed25519] =3D ""
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 # login path is hardcoded in sshd
 EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/login' \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-p=
am', '--without-pam', d)} \
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb b/meta/reci=
pes-connectivity/socat/socat_1.8.1.1.bb
index f6f2a3304b9..e662c79a754 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
@@ -17,8 +17,6 @@ SRC_URI[sha256sum] =3D "5ebc636b7f427053f98806696521653=
a614c7e06464910353cbf54e232
=20
 inherit autotools
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
-
 EXTRA_OECONF +=3D "ac_cv_have_z_modifier=3Dyes \
                  ac_cv_header_bsd_libutil_h=3Dno \
                  sc_cv_termios_ispeed=3Dno \
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/=
readline/readline.inc
index 06630dc455c..8b07ecbcce7 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -17,9 +17,6 @@ SRC_URI +=3D "file://inputrc"
=20
 inherit autotools texinfo
=20
-# Ensure we don't delete the shipped aclocal.m4 or config.h.in
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader,aclocal"
-
 EXTRA_OECONF +=3D "bash_cv_termcap_lib=3Dncurses --with-shared-termcap-l=
ibrary"
=20
 LEAD_SONAME =3D "libreadline.so"
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recip=
es-devtools/diffstat/diffstat_1.68.bb
index 4bc18158378..ce1ba79c2d1 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -17,8 +17,6 @@ SRC_URI[sha256sum] =3D "89f9294a8ac74fcef6f1b9ac408f43e=
bedf8d208e3efe0b99b4acc16dc
=20
 inherit autotools gettext ptest
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 LDFLAGS +=3D "${TOOLCHAIN_OPTIONS}"
=20
 do_install_ptest() {
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
index 48b5b0d934b..f24dd3b7c81 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -39,8 +39,6 @@ UPSTREAM_CHECK_REGEX =3D "/Expect/(?P<pver>(\d+[\.\-_]*=
)+)/"
=20
 S =3D "${UNPACKDIR}/${BPN}${PV}"
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 CFLAGS +=3D "-std=3Dgnu17"
=20
 do_install:append() {
diff --git a/meta/recipes-devtools/help2man/help2man_1.49.3.bb b/meta/rec=
ipes-devtools/help2man/help2man_1.49.3.bb
index 75931a511f5..1ba8d6090a1 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.3.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.3.bb
@@ -10,10 +10,6 @@ SRC_URI[sha256sum] =3D "4d7e4fdef2eca6afe07a2682151cea=
78781e0a4e8f9622142d9f70c083
=20
 inherit autotools
=20
-# This is a hand-maintained aclocal.m4 but our autotools class currently=
 deletes
-# aclocal.m4.
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 EXTRA_OECONF =3D "--disable-nls"
=20
 do_install:append () {
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index 59d13237e2f..387e132b602 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -28,8 +28,6 @@ CLEANBROKEN =3D "1"
 EXTRA_OECONF =3D "--with-perl=3D'${USRBINPATH}/env perl' --with-patch=3D=
patch --without-sendmail"
 EXTRA_OECONF:append:class-native =3D " --disable-nls"
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_BASH=3D/bin/bash ac_cv_path_COLUMN=
=3Dcolumn"
=20
 # Make sure we don't have "-w" in shebang lines: it breaks using
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.1.bb b/meta/recipes-devt=
ools/ruby/ruby_4.0.1.bb
index e51d0d3e9cf..93df86333ea 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
@@ -34,8 +34,6 @@ UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/do=
wnloads/"
=20
 inherit autotools ptest pkgconfig
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 # This snippet lets compiled extensions which rely on external libraries=
,
 # such as zlib, compile properly.  If we don't do this, then when extmk.=
rb
 # runs, it uses the native libraries instead of the target libraries, an=
d so
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.5.bb
index 47e2b6c6932..13bec4ad595 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -42,8 +42,6 @@ EXTRA_OEMAKE +=3D "pkgconfig_dir=3D${libdir}/pkgconfig"
 CPPFLAGS +=3D "-P"
 BUILD_CPPFLAGS +=3D "-P"
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 do_configure:prepend () {
     # autogen.sh manually puts things in the right place, and libtoolize=
 doesn't
     # work as they don't use aclocal
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.3.bb
index 18de3a333a2..ce8598fee6d 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
@@ -34,7 +34,6 @@ VER =3D "${PV}"
 inherit autotools ptest binconfig
=20
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
-EXTRA_AUTORECONF =3D "--exclude=3Daclocal"
=20
 EXTRA_OECONF =3D "--disable-rpath --enable-man-suffix=3Dtcl9 --disable-z=
ipfs"
=20
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-d=
evtools/tcltk8/tcl8_8.6.17.bb
index 968cd6778e8..1b08fda5fa6 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -38,7 +38,6 @@ VER =3D "${PV}"
 inherit autotools ptest binconfig
=20
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
-EXTRA_AUTORECONF =3D "--exclude=3Daclocal"
=20
 EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix=3D=
tcl8"
=20
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
index 634209c9115..858088cc772 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -7,7 +7,6 @@ DEPENDS =3D "ncurses bison-native virtual/libiconv"
=20
 inherit autotools gettext texinfo update-alternatives ptest
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader,aclocal"
 EXTRA_OECONF =3D "--enable-job-control --without-bash-malloc bash_cv_wex=
itstatus_offset=3D8"
=20
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 24ebcc4aae5..2724ce72fba 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -63,8 +63,6 @@ EXTRA_OECONF =3D " \
                DSOFLAGS=3D'${LDFLAGS}' \
                "
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
-
 do_install () {
 	oe_runmake "BUILDROOT=3D${D}" install
=20
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
index 5a1b44a71c3..f8c0d8ab838 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -36,9 +36,6 @@ EXTRA_OECONF =3D "--enable-xim \
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[startup] =3D "--enable-startup-notification,--disable-star=
tup-notification,startup-notification,"
=20
-# Ensure we don't delete the shipped aclocal.m4
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 do_compile:prepend () {
 	echo '#define UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
 	echo '#define WTMP_FILE "${localstatedir}/log/wtmp"' >> config.h
diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb b/meta/recipes-=
support/nettle/nettle_3.10.2.bb
index e651f68cb94..7b7be5f5941 100644
--- a/meta/recipes-support/nettle/nettle_3.10.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.2.bb
@@ -26,8 +26,6 @@ UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\=
.tar"
=20
 inherit autotools ptest multilib_header lib_package
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
-
 EXTRA_OECONF =3D "--disable-openssl"
=20
 EXTRA_OECONF:append:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","ne=
on",""," --disable-arm-neon --disable-fat",d)}"
--=20
2.43.0


