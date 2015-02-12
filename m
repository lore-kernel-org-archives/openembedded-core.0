Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 74204733BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:05:47 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id a13so6587379igq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iSS4ulqHtg8AsI7AD2LNUx87jMw/Yj++QqR5OGqVV0g=;
	b=PDNb96zq9Yl7m35xzpPlxjDkrpKrfKCyZqjFpTmnZjeXarO4VNk6mBxxcokqtoR7zK
	RFGiE38F2LMj/zo0lOMPTiLuKA9C50k9ojRVtz+842yN3qcidQH+cCbEljg18vlf9+L5
	MmlFL7VQQAoossYpxrYyoWBh7hSazjuge3H+x59LEd4SzsSR3FM6QaUTBe5IZPTjcx4V
	c7JLOb7TYKDVvu41TvaSyaRLdbGyVp8/UInJV2BmZrE7PjQUTkH5w2THVHVc6su6jcIP
	G0W5KIIPOVFnvHqZI57q16vH5IZDmJUWwu4duHvDnJSfLXJQzn3y++B/79CBsY88Tkuf
	rv7A==
X-Received: by 10.107.133.36 with SMTP id h36mr7543316iod.40.1423775148852;
	Thu, 12 Feb 2015 13:05:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c70sm3128161ioc.3.2015.02.12.13.05.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Feb 2015 13:05:48 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 13:05:14 -0800
Message-Id: <1423775114-6122-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] icu: remove obsolete aclocal.m4 workaround (fixed upstream since v52.1)
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
X-List-Received-Date: Thu, 12 Feb 2015 21:05:49 -0000

Patch also includes some minor formatting cleanup of icu.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/icu/icu.inc | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 26994bb..40cff45 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -1,5 +1,8 @@
 SUMMARY = "International Component for Unicode libraries"
-DESCRIPTION = "The International Component for Unicode (ICU) is a mature, portable set of C/C++ and Java libraries for Unicode support, software internationalization (I18N) and globalization (G11N), giving applications the same results on all platforms."
+DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
+portable set of C/C++ and Java libraries for Unicode support, software \
+internationalization (I18N) and globalization (G11N), giving applications the \
+same results on all platforms."
 HOMEPAGE = "http://site.icu-project.org/"
 
 LICENSE = "ICU"
@@ -24,23 +27,13 @@ EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
-# ICU puts custom m4 autoconf functions in aclocal.m4.
-# However, this file is deleted in our build system.
-# To make it work, we copy aclocal.m4 to acinclude.m4.
-# This is a bug of ICU. See bug reference:
-# http://bugs.icu-project.org/trac/ticket/9790
-do_configure_prepend() {
-    [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
-}
-
 do_install_append_class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
 	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
-        cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
 	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
 	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
-
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
@@ -56,4 +49,3 @@ FILES_libicutu = "${libdir}/libicutu.so.*"
 FILES_libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
1.9.1


