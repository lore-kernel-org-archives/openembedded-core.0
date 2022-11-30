Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD067C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 15:40:54 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.14616.1669822842622448200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 07:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=OrKdcHr2;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zD3oTgptJLb1PsNzjzuaQzuCGCD3S5D7F4G85GHE+iE=; b=OrKdcHr2vKH+DbnWVy1PtJM/Yc
	c7BK3+WIyzCzice3CKghMlDOtZdDGjNH0XQTBd8QFUFn22hKcSRI0iWtALEMDErdBMjq0ELtKAAUi
	8AEVSuPk+Jhs0/IeEHp0JB4WjnzttmJlhjEaqRcIzTO6NujoxWO0PsHYqnCsaoMNZQsqH7gftroF/
	W0yiKnE8ebmTeITk6J0/2UTE9RCFCAJ3nyoy0erv0P1wFzSzD+n22bborRxymc71qkl8G18RhypQo
	SWcDV9rzGOf7VtI9Q/S+GtgqUVFbOuGHiCU7kTrbh1xCjmsA9XQ1x47WUEcOFurnz147CE0PPkZTz
	NAUxu+yw==;
Received: from bl9-126-48.dsl.telepac.pt ([85.242.126.48] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1p0PCR-00BhAN-HY
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:40:39 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Enable nativesdk for gperf, gi-docgen, unifdef, ruby and 3 python recipes
Date: Wed, 30 Nov 2022 16:40:15 +0100
Message-Id: <20221130154015.3950-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 15:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174018

I'm building a SDK (bitbake task: populate_sdk) for WPE/WebKit
development and I need the tools below to be extended with the class
nativesdk. They work fine on the SDK after this change.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-devtools/python/python3-markdown_3.4.1.bb    | 2 +-
 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb | 2 +-
 meta/recipes-devtools/python/python3-typogrify_2.0.7.bb   | 2 +-
 meta/recipes-devtools/ruby/ruby.inc                       | 1 +
 meta/recipes-devtools/ruby/ruby_3.1.2.bb                  | 2 +-
 meta/recipes-devtools/unifdef/unifdef_2.12.bb             | 2 +-
 meta/recipes-extended/gperf/gperf_3.1.bb                  | 2 +-
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb             | 2 +-
 8 files changed, 8 insertions(+), 7 deletions(-)

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
 
diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index ebff5efd1f..efa40331e0 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
 DEPENDS:append:class-target = " ruby-native"
+DEPENDS:append:class-nativesdk = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
index 387bfa9b44..80b4c2cd8a 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -105,4 +105,4 @@ FILES:${PN}-ptest:append:class-target = "\
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


