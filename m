Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 78A6A75F23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:52:49 +0000 (UTC)
Received: by iodb91 with SMTP id b91so6462387iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=whb5/iWXBGgJaZ+DaQkeYKkyIf5iP020k93c+NplEuo=;
	b=QVvXmA1yl5FtMKX0RtoC9XKt55cYAFPSC7LEoi0Uv1syGhwJCtBE0iB/vOCeOnxy7A
	GxM1RiaSxPxApriz/lLhB7cZxPuJQjSxY2nO7rH0zVK2xlELE03RHQO3sgix2c6xDDKL
	+w8aEjZJwk4bx3C+3S9Ev10/dME+2mMxAvi0H903i2Sa50+JunOEEXwwo8YsnA+LLJk9
	kdxrzA7jP4rvweIICV2mGtVBGDiCyul2nU4q9N+C+zfDngs8hpkdCSxfdJg9P2CQZtmz
	vo2m6rK91F1DaleakUT/N9Hpd3RNoZBj6WVZuurYyr/BoZAyGVpDvNOeRknsNj87tgiC
	2gLw==
X-Received: by 10.107.155.12 with SMTP id d12mr15136078ioe.131.1438822369380; 
	Wed, 05 Aug 2015 17:52:49 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm3355789iod.26.2015.08.05.17.52.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:52:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:52:35 -0700
Message-Id: <1438822355-23346-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438822355-23346-1-git-send-email-armccurdy@gmail.com>
References: <1438822355-23346-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14
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
X-List-Received-Date: Thu, 06 Aug 2015 00:52:49 -0000

  054151c libiconv: Fix B != S with uclibc builds
  273c437 libiconv: Remove RPATH from binaries
  fcb8d6f libiconv_1.14.bb: Fix build failure [partial-merge]

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libiconv/libiconv_1.11.1.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index d09b194..6ce4b96 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -32,5 +32,16 @@ EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
 LEAD_SONAME = "libiconv.so"
 
 do_configure_prepend () {
-	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
+	rm -f ${S}/m4/libtool.m4 ${S}/m4/ltoptions.m4 ${S}/m4/ltsugar.m4 ${S}/m4/ltversion.m4 ${S}/m4/lt~obsolete.m4 ${S}/libcharset/m4/libtool.m4 ${S}/libcharset/m4/ltoptions.m4 ${S}/libcharset/m4/ltsugar.m4 ${S}/libcharset/m4/ltversion.m4 ${S}/libcharset/m4/lt~obsolete.m4
+}
+
+do_configure_append () {
+        # forcibly remove RPATH from libtool
+        sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' *libtool
+        sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=_NO_RPATH_|g' *libtool
+}
+
+do_install_append () {
+	rm -rf ${D}${libdir}/preloadable_libiconv.so
+	rm -rf ${D}${libdir}/charset.alias
 }
-- 
1.9.1


