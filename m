Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A748C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 15:14:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.1092.1746026065934260602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 08:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D4Z9Ox25;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4982469f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746026064; x=1746630864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpRSaLs85IwP9PMliyDENMHUiqO/e8AqgYIPe7RmixU=;
        b=D4Z9Ox25yO/IEuNWPWnsBh7R9BUwXEkEvLYHuLMhVL1soAT1GlNdE7GzieGSKm+VUs
         J+Nim1wBewkFtxLcq2c61vik6RsEUvvPkClKQlFhEu7Ona3BBS5RjR+7z1+RkhDpHjFJ
         SKlZPij3YJMU2kDA38S1AFSmA6j1CzX1dnZLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026064; x=1746630864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpRSaLs85IwP9PMliyDENMHUiqO/e8AqgYIPe7RmixU=;
        b=lg2TOOSNh+WABhCtG8iZPdzC6vvPGCwq+AmXOYuhl5O2yYxHseRR18uq//K+6hLtDP
         m7SIVSDqsGy88SliTbYeSfjfrpoO0OruZCMsFjwusXqQ+S4Z8XlNqx/ugMOlcn8AmXqh
         lgt0BLge7pNk6XUhgnCJBVV9Dj4R6U7dflXwcDQ5AvlH4P4X33ysjQ+SAbPcpzzfK99e
         Tc1vlbEZ98s59xXDd4f9r4Wp9vZfpc5wBwKDF8xX5/+7QUOqmzLtSSWlSbLuq1CN68F0
         xdScc52DqSeefXUV5yiucICx3g5HpTJO/paCduXMNssMG6jK2702zOjtufLumstNrel6
         79Zw==
X-Gm-Message-State: AOJu0YzSxWKoxlleDyoolQ1iLr70aIccVbnXsuCi1EoI4CKoXB/tk+Uz
	MNEQZwK3PmNUdYn0pQSEh1rwswzcPF0sCrx48OQOdmOsoYk1VP+HjHQZYbHseZEIaYwwk8LYPip
	y
X-Gm-Gg: ASbGncthelb6PBtU3YXxct/0XfbUnijNCArjpT1DY3/kCDjeFpJIKdQ7G+38po8cyIq
	fEF+VtlU63cSlmd+6KUn0QlGlofdbtZ0GPZfmGZGCX7Er9DUbfoo4243gJJYy78z11mTMtzBamJ
	qYHPLaCkV5sETmCbicm0izXPattHePJ1ViVVCf5P2zLA0UIeNG1d7t5Rv0nq1FBVUBwIe08nLMD
	7QOBxwK9kTFFGFwE6omlNlTtKTnUp700AX6wjbJKMakGo5BNzY4PJYlKzAzwQbwFy/irfky2pq7
	eBbx/RpJAqtLtPc3fsqjZ9ke12BSS5jSNq8e+Lz9R5wUIumz+gfxF8+7B1Lcqu5ZCA7EYQ==
X-Google-Smtp-Source: AGHT+IHZ5u83iG7vFxw5gzIWvBit2xOFHtlFY7A+r6RULiUPoPO2a6/TraBELKjK2m1F9w5KizpLXw==
X-Received: by 2002:a05:6000:178d:b0:391:2b11:657 with SMTP id ffacd0b85a97d-3a08ff50b14mr2672338f8f.38.1746026061754;
        Wed, 30 Apr 2025 08:14:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:60c2:7f54:b641:d997])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e464eesm17383388f8f.68.2025.04.30.08.14.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:14:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: Drop remaining md5sum checksums
Date: Wed, 30 Apr 2025 16:14:20 +0100
Message-ID: <20250430151420.2144142-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 15:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215752

We have long since obsoleted md5sum in favour of sha256sum. Drop the remaining
56 entries (which were showing many recipes hadn't been touched in a long time).
They all do have the corresponding sha256sum entries as is clear from the diff.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/libacpi/libacpi_0.2.bb                          | 1 -
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                      | 1 -
 meta/recipes-bsp/setserial/setserial_2.17.bb                     | 1 -
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                             | 1 -
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb           | 1 -
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb                | 1 -
 meta/recipes-devtools/expect/expect_5.45.4.bb                    | 1 -
 meta/recipes-devtools/flex/flex_2.6.4.bb                         | 1 -
 meta/recipes-devtools/intltool/intltool_0.51.0.bb                | 1 -
 meta/recipes-devtools/m4/m4-1.4.19.inc                           | 1 -
 meta/recipes-devtools/patch/patch_2.7.6.bb                       | 1 -
 meta/recipes-devtools/perl/libxml-perl_0.08.bb                   | 1 -
 meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb            | 1 -
 meta/recipes-devtools/python/python-extras.inc                   | 1 -
 meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb    | 1 -
 meta/recipes-devtools/python/python3-ply_3.11.bb                 | 1 -
 meta/recipes-devtools/python/python3-pretend_1.0.9.bb            | 1 -
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb            | 1 -
 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb            | 1 -
 meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb     | 1 -
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb             | 1 -
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb                       | 1 -
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb      | 1 -
 meta/recipes-extended/gperf/gperf_3.1.bb                         | 1 -
 meta/recipes-extended/mingetty/mingetty_1.08.bb                  | 1 -
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb                    | 1 -
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb              | 1 -
 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb  | 1 -
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb          | 1 -
 meta/recipes-extended/perl/libxml-sax-perl_1.02.bb               | 1 -
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb           | 1 -
 meta/recipes-extended/time/time_1.9.bb                           | 1 -
 meta/recipes-extended/unzip/unzip_6.0.bb                         | 1 -
 meta/recipes-extended/watchdog/watchdog_5.16.bb                  | 1 -
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb               | 1 -
 meta/recipes-extended/zip/zip_3.0.bb                             | 1 -
 meta/recipes-graphics/glew/glew_2.2.0.bb                         | 1 -
 meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb             | 1 -
 .../startup-notification/startup-notification_0.12.bb            | 1 -
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb       | 1 -
 meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb                  | 1 -
 meta/recipes-graphics/xorg-app/xinput_1.6.4.bb                   | 1 -
 meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb                 | 1 -
 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb                 | 1 -
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                     | 1 -
 meta/recipes-multimedia/lame/lame_3.100.bb                       | 1 -
 meta/recipes-multimedia/libogg/libogg_1.3.5.bb                   | 1 -
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb             | 1 -
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb             | 1 -
 meta/recipes-support/consolekit/consolekit_0.4.6.bb              | 1 -
 meta/recipes-support/db/db_5.3.28.bb                             | 1 -
 meta/recipes-support/libdaemon/libdaemon_0.14.bb                 | 1 -
 meta/recipes-support/libyaml/libyaml_0.2.5.bb                    | 1 -
 meta/recipes-support/lzo/lzo_2.10.bb                             | 1 -
 meta/recipes-support/lzop/lzop_1.04.bb                           | 1 -
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb        | 1 -
 56 files changed, 56 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 6aae34b3100..f939d11f4c6 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
            file://0001-libacpi-Fix-build-witth-fno-commom.patch \
            "
 
-SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
 
 UPSTREAM_CHECK_URI = "http://www.ngolde.de/libacpi.html"
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index c7b95e57b0c..b252ae45d26 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1742a556089c36c3a89eb1b957da5a60"
 SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
 
 inherit pkgconfig autotools manpages
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 3241b21f82e..e1e80e31ae5 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch \
            "
 
-SRC_URI[md5sum] = "c4867d72c41564318e0107745eb7a0f2"
 SRC_URI[sha256sum] = "7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a"
 
 do_install() {
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 6151f0a7e2b..3bc9b244876 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/
            file://Support-for-cross-compilation.patch \
 "
 
-SRC_URI[md5sum] = "889686ec8424468fe0d205742e77a4c2"
 SRC_URI[sha256sum] = "93575c82e4307d8c4c370ec6b767f5cf87e527b2378146d652a6d8e25d5bdbc5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 428202c2585..fb7c29e242a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
 	file://0001-fix-nsectors-exceeds-0xffff-situation.patch \
 	"
 
-SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
 SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS= CPPOPTX='${CPPFLAGS}' COPTX='${CFLAGS}' C++OPTX='${CXXFLAGS}' LDOPTX='${LDFLAGS}' GMAKE_NOWARN='true'"
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index e628f629846..ea81bf95075 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -7,7 +7,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
            file://docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch \
 "
 
-SRC_URI[md5sum] = "b48cbf929a2ad85e6672f710777ca7bc"
 SRC_URI[sha256sum] = "725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 010e18dd24a..e3ecf4b25e8 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -32,7 +32,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://run-ptest \
            file://0001-Replace-tclsh-with-tclsh8-in-the-scripts-used-in-the.patch \
            "
-SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index c29377c5eb8..fa8c0fb6fd0 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -22,7 +22,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://0001-Match-malloc-signature-to-its-use.patch \
            "
 
-SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
 SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
 GITHUB_BASE_URI = "https://github.com/westes/flex/releases"
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 0f90ab4f1cf..d582c87fdca 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
            file://remove-perl-check.patch \
            file://noperlcheck.patch \
            "
-SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
 SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 6a6aa21dafe..c73418d8e67 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -15,7 +15,6 @@ SRC_URI:append:class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
                               "
 
-SRC_URI[md5sum] = "f4a2b0284d80353b995f8ef2385ed73c"
 SRC_URI[sha256sum] = "3be4a26d825ffdfda52a56fc43246456989a3630093cced3fbddf4771ee58a70"
 
 LICENSE = "GPL-3.0-only"
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index a91944234f1..3dc3b5863c4 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -13,7 +13,6 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://CVE-2019-20633.patch \
 "
 
-SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
 SRC_URI[sha256sum] = "8cf86e00ad3aaa6d26aca30640e86b0e3e1f395ed99f189b06d4c9f74bc58a4e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 89acb64ef51..21c02c19ff0 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -13,7 +13,6 @@ DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ed5fbdda53d1301ddaed88db10503bb"
 SRC_URI[sha256sum] = "4571059b7b5d48b7ce52b01389e95d798bf5cf2020523c153ff27b498153c9cb"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index 791404e5bc4..dff0f84aabc 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -12,7 +12,6 @@ DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bb841dce889a26c89a1c2739970e9fbc"
 SRC_URI[sha256sum] = "531fddaebea2416743eb5c4fdfab028f502123d9a220405a4100e68fc480dbf8"
 
 S = "${WORKDIR}/XML-Simple-${PV}"
diff --git a/meta/recipes-devtools/python/python-extras.inc b/meta/recipes-devtools/python/python-extras.inc
index 335bde27249..b562f90d12b 100644
--- a/meta/recipes-devtools/python/python-extras.inc
+++ b/meta/recipes-devtools/python/python-extras.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
 
 inherit pypi
 
-SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
 SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 60909c03763..c3b8e526f16 100644
--- a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
 SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
 
 inherit pypi setuptools3 update-alternatives
diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index a05bd6702dc..2c5fa3f215e 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -5,7 +5,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
 
-SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
 SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
 
 inherit pypi setuptools3
diff --git a/meta/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta/recipes-devtools/python/python3-pretend_1.0.9.bb
index 21d14a03b8d..60c02de488a 100644
--- a/meta/recipes-devtools/python/python3-pretend_1.0.9.bb
+++ b/meta/recipes-devtools/python/python3-pretend_1.0.9.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/alex/pretend"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
 
-SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
 SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
 
 inherit pypi setuptools3
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index db699014444..dbf0fb0ee6a 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
 SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
 
 PYPI_PACKAGE = "PySocks"
diff --git a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
index 316dc544de2..c13a765660b 100644
--- a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
+++ b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://pypi.org/project/rfc3987/"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
-SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
 SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
 
 inherit pypi setuptools3
diff --git a/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
index 149078c51b5..2f5e0ad141a 100644
--- a/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
+++ b/meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://github.com/habnabit/vcversioner"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
 
-SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
 SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
 
 inherit pypi setuptools3
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 2522205fa1c..1e65616081b 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -26,7 +26,6 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch \
            "
 
-SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
 
 # remove at next version upgrade or when output changes
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 1327c446b3e..0d7ff9edcdc 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -28,7 +28,6 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=${BP} \
            "
-SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 
 SRCREV_bzip2-tests = "f9061c030a25de5b6829e1abf373057309c734c0"
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 84687504349..7efe5cc5922 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
 SOURCEFORGE_PROJECT = "${BPN}.berlios"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
 SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
 
 inherit sourceforge-releases
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 9175bc13e62..7a79c070426 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
             file://0001-Make-the-code-C-17-compliant.patch"
-SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
 SRC_URI += "file://1862c6e57a308a05889c80c048dbc58bdc378dcb.patch"
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 00d2564257a..be059995e7c 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -7,7 +7,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "2a75ad6487ff271424ffc00a64420990"
 SRC_URI[sha256sum] = "0f55c90ba4faa913d91ef99cbf5cb2eb4dbe2780314c3bb17953f849c8cddd17"
 
 # substitute our CFLAGS for "-O2 -Wall -W -pipe"
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 3fa89dec9a6..f95400998cd 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz \
            file://0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch \
            "
 
-SRC_URI[md5sum] = "4cb87da2dba05540afce162f34b3a9a6"
 SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/pbzip2/+milestones"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 3e0d216a032..3b681225c2c 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -17,5 +17,4 @@ BBCLASSEXTEND = "native"
 RDEPENDS:${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
 RDEPENDS:${PN}-ptest += "perl-module-test-more perl-module-utf8"
 
-SRC_URI[md5sum] = "b1d91153ac971347aee84292ed886c1c"
 SRC_URI[sha256sum] = "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index b7e4c8b2232..ae0e5ad08a9 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -12,7 +12,6 @@ SRCNAME = "XML-NamespaceSupport"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9d8a117e7620b5adf8d69c29613ceab"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PERIGRIN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "a8916c6d095bcf073e1108af02e78c97"
 SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
 
 UPSTREAM_CHECK_REGEX = "XML\-NamespaceSupport\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index ebec5f0462e..8e8be934416 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c884664
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec347a14065dd7aec7d9fb181b2d7946"
 SRC_URI[sha256sum] = "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0"
 
 S = "${WORKDIR}/XML-SAX-Base-${PV}"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index b5b111d2274..218af5c4375 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b62e3754523695c7f5bbcafa3676a38d"
 SRC_URI[sha256sum] = "4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a"
 
 S = "${WORKDIR}/XML-SAX-${PV}"
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 05644b7db95..de5fb3c5433 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -50,7 +50,6 @@ SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://0001-Fix-implicit-function-declaration-warnings.patch \
            "
 
-SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
 SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d"
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 125554b378a..d6d8aa6e1e9 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -19,7 +19,6 @@ SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-Fix-the-type-for-sighandler_t.patch \
            "
 
-SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"
 SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
 
 inherit autotools
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0a88b4c092b..b2fed672396 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -36,7 +36,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
 CVE_STATUS[CVE-2008-0888] = "fixed-version: Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source"
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c88ea08ade6..c166ace665c 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch \
 "
 
-SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
 SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a3b019d"
 
 # Can be dropped when the output next changes, avoids failures after
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 4d931805354..3ee320da5a1 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -24,7 +24,6 @@ SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://CVE-2022-4055.patch \
           "
 
-SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
 SRC_URI[sha256sum] = "d798b08af8a8e2063ddde6c9fa3398ca81484f27dec642c5627ffcaa0d4051d9"
 
 UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 58144baa149..b573669f2fb 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -22,7 +22,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
 CVE_STATUS[CVE-2018-13410] = "disputed: Disputed and also Debian doesn't consider a vulnerability"
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index d7a26a34381..b82b25c6028 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://notempdir.patch \
            file://no-strip.patch"
 
-SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
 SRC_URI[sha256sum] = "d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index 8875a939e09..0a5d32b2c6b 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz \
            file://0001-Support-gcc10-compilation.patch \
 "
 
-SRC_URI[md5sum] = "99999a0bca48b980105208760c8fd893"
 SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index aa18881a12e..55b4065a4ac 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -28,5 +28,4 @@ SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${B
            file://time_t.patch \
 "
 
-SRC_URI[md5sum] = "2cd77326d4dcaed9a5a23a1232fb38e9"
 SRC_URI[sha256sum] = "3c391f7e930c583095045cd2d10eb73a64f085c7fde9d260f2652c7cb3cfbe4a"
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 0fc075a4680..ebc836d801c 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -14,7 +14,6 @@ inherit allarch fontcache
 FONT_PACKAGES = "${PN}"
 
 SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2"
-SRC_URI[md5sum] = "bb22bd5b4675f5dbe17c6963d8c00ed6"
 SRC_URI[sha256sum] = "db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc"
 
 do_install () {
diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
index 651d03caca2..828523afb46 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
@@ -23,5 +23,4 @@ do_install:append:class-target () {
 
 FILES:${PN} += "${libdir}/X11/x11perfcomp/*"
 
-SRC_URI[md5sum] = "e96b56756990c56c24d2d02c2964456b"
 SRC_URI[sha256sum] = "1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34"
diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
index f5e3f5da12b..1d406b848cd 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
@@ -9,5 +9,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 DEPENDS += " libxi libxrandr libxinerama"
 
 SRC_URI_EXT = "xz"
-SRC_URI[md5sum] = "8e4d14823b7cbefe1581c398c6ab0035"
 SRC_URI[sha256sum] = "ad04d00d656884d133110eeddc34e9c69e626ebebbbab04dc95791c2907057c8"
diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
index 39ec76724c0..d410f7d5196 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.6.bb
@@ -12,5 +12,4 @@ DEPENDS += "libxext libxmu gettext-native"
 PE = "0"
 
 SRC_URI_EXT = "xz"
-SRC_URI[md5sum] = "c91201bc1eb5e7b38933be8d0f7f16a8"
 SRC_URI[sha256sum] = "3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index fa6585d6dce..9ec7cc30f58 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,7 +19,6 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index a6b6c4238db..0c237fcf56d 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -15,7 +15,6 @@ DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
 
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 5ace46ace0a..efaf3b9817a 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -14,7 +14,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
            "
 
-SRC_URI[md5sum] = "83e260acbe4389b54fe08e0bdbf7cddb"
 SRC_URI[sha256sum] = "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
 
 inherit autotools pkgconfig sourceforge-releases
diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
index b4f02e404c4..402d700aa16 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "3178c98341559657a15b185bf5d700a5"
 SRC_URI[sha256sum] = "c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index f3d053d9f47..d0a9a59b7cd 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.bz2 \
            file://autoreconf.patch \
            file://no-docs.patch"
 
-SRC_URI[md5sum] = "292ab65cedd5021d6b7ddd117e07cd8e"
 SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
index 023bce0abe8..d5bf5ff0fac 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
@@ -13,7 +13,6 @@ DEPENDS = "libogg"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
           "
-SRC_URI[md5sum] = "50902641d358135f06a8392e61c9ac77"
 SRC_URI[sha256sum] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 0f2153d493d..fc1b9856312 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -20,7 +20,6 @@ SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.
            file://add-polkit-configure-argument.patch \
 "
 
-SRC_URI[md5sum] = "611792b4d616253a5bdec9175f8b7678"
 SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf975146475565c"
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 2e68398f576..8d2af1f5dc4 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -33,7 +33,6 @@ SRC_URI += "file://fix-parallel-build.patch \
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/db5.3/"
 UPSTREAM_CHECK_REGEX = "db5\.3_(?P<pver>\d+(\.\d+)+).+\.orig"
 
-SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
 SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index 089f19d1cdf..a0378802c9c 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz
            file://fix-includes.patch \
           "
 
-SRC_URI[md5sum] = "509dc27107c21bcd9fbf2f95f5669563"
 SRC_URI[sha256sum] = "fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index aa7fc5e9145..b1f516f7fee 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
 
 SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "bb15429d8fb787e7d3f1c83ae129a999"
 SRC_URI[sha256sum] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
 
 S = "${WORKDIR}/yaml-${PV}"
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 195c2f29393..2132f1c27ff 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "39d3f3f9c55c87b1e5d6888e1420f4b5"
 SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072"
 
 inherit autotools ptest
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index 2b83aa06d9d..c32aa534228 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
           "
-SRC_URI[md5sum] = "271eb10fde77a0a96b9cbf745e719ddf"
 SRC_URI[sha256sum] = "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41"
 
 inherit autotools
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 742e77eb18e..9e41c5b9ed5 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
            "
 
-SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
 SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
 
 inherit autotools features_check

