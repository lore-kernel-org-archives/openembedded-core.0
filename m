Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDE4C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 03:57:30 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web10.42671.1671508648790680436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 19:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=c2BnjmLP;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H0LJ4GbKxTAK7UTnS6HX3l7o+bNYEmRzn2mGF69uygg=; b=c2BnjmLPPHU69elaBKzmOSzOrd
	JZ4Y0QF1NjSCI4fYoLXGura5cXtBmKO0hiZbHjcJHsSnzyNauu9qrKjNiMstCvZ0DvfMfNA2DIGpj
	ZP/clO/IlIfeYCw8CkaT+PLeiCHpa773SFooV3B94fhM6Xf7nJp3RoEcF5wmKSmT5K5OjgIMXnxPL
	jvMeXL2wNgwOFmYRjAmlaTTRUvqhiYe1JGVF/DThvi1s5JFid8JVfYj/0iZACWR+SBqW0WDTRcFOY
	JFcpnp830ZdRIha0zfYKm7PsSsbM170Rq9Phb6aeZsIbrqvKiHYIhtLqpPUsbO4l52EzJVOf9n4kA
	j3oAy3AA==;
Received: from bl9-126-48.dsl.telepac.pt ([85.242.126.48] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1p7Tkr-006hho-5z
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 04:57:25 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] Enable nativesdk for gperf, unifdef, gi-docgen and its dependencies
Date: Tue, 20 Dec 2022 04:56:50 +0100
Message-Id: <20221220035650.14043-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 03:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174836

I'm building a SDK (bitbake task: populate_sdk) for WPE/WebKit
development [1] and I need the tools below to be extended with the class
nativesdk. They work fine on the SDK after this change.

The needs are because:

1) gperf and unifdef are required by the WebKit build system at build
   time.

2) gi-docgen is required by the WebKit build system when CMake option
   'ENABLE_DOCUMENTATION' is enabled, and gi-docgen itself depends on
   the following python modules that also need to enable nativesdk:
   python3-markdown, python3-smartypants and python3-typogrify

[1]
See:
 - https://github.com/Igalia/meta-webkit/pull/436
 - https://bugs.webkit.org/show_bug.cgi?id=249604

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-devtools/python/python3-markdown_3.4.1.bb    | 2 +-
 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb | 2 +-
 meta/recipes-devtools/python/python3-typogrify_2.0.7.bb   | 2 +-
 meta/recipes-devtools/ruby/ruby_3.1.3.bb                  | 3 ++-
 meta/recipes-devtools/unifdef/unifdef_2.12.bb             | 2 +-
 meta/recipes-extended/gperf/gperf_3.1.bb                  | 2 +-
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb             | 2 +-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.4.1.bb b/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
index e99c3310ac..b398cd8bc4 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
@@ -8,6 +8,6 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "Markdown"
 SRC_URI[sha256sum] = "3b809086bb6efad416156e00a0da66fe47618a5d6918dd688f53f40c8e4cfeff"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
index 05c94c390f..d089a89b95 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
@@ -9,6 +9,6 @@ PYPI_PACKAGE = "smartypants"
 SRC_URI += "file://0001-Change-hash-bang-to-python3.patch"
 SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(?!2\.0\.1)(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
index 83e9b5eadb..826f126ad9 100644
--- a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
+++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "typogrify"
 SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-smartypants"
 
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index c8454da3a9..85d6184a04 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
 DEPENDS:append:class-target = " ruby-native"
+DEPENDS:append:class-nativesdk = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
@@ -139,4 +140,4 @@ FILES:${PN}-ptest:append:class-target = "\
     ${libdir}/ruby/${SHRT_VER}.0/*/-test- \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index b42051b8b6..3e08b3a0a4 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -18,4 +18,4 @@ do_install() {
 	oe_runmake install DESTDIR=${D} prefix=${prefix}
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index c9f09c7931..4c32a5dc83 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -17,4 +17,4 @@ inherit autotools
 # it where to look explicitly (mirroring the behaviour of upstream's Makefile.devel).
 EXTRA_AUTORECONF += " -I ${S} --exclude=aclocal"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 9e5adca3df..fa41f2ccd2 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -19,4 +19,4 @@ inherit setuptools3
 
 RDEPENDS:${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-toml python3-typogrify python3-xml"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


