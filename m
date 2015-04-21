Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4996A73D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:42 +0000 (UTC)
Received: by wiun10 with SMTP id n10so16749747wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/FnceBp864m4NHuSAcxJJEh58RqmaTfmWQ+nhEhWFuY=;
	b=MOAldPaAbOFYpGEAsyBFzRIt8iL7qq5PhM7MluUPNOjgojgPEAYYrzyC50jxZ8OukN
	qlEKoyLgHHS+o+dW50zlHxqqnRX2L4G8hRuhs/IyFsamZogPPBoAkCBe/29aTTDKv/5n
	m2aCNuu52WRUT/WkppbmuCwelliUr8AE7o+wVpRqLHW/KZ710egsRukLnYXv1JWPw2al
	DTi3LXvh//g531PTch/rpBV0hoDd/n7MJX8azki0GWPJgxlitNdEBZUMorfn3jDxpbnN
	gjZQsC+mGWyIXR8RBdTVzgQ8NBXsovvkD3U8kW8CXQRWtAXOXWKsbIILVm6PKj0IxT/7
	uaxw==
X-Received: by 10.194.104.71 with SMTP id gc7mr38181836wjb.114.1429613623950; 
	Tue, 21 Apr 2015 03:53:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l10sm2079657wje.15.2015.04.21.03.53.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:40 +0200
Message-Id: <1429613620-2989-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [fido][PATCH 4/4] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Tue, 21 Apr 2015 10:53:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/fontcache.bbclass                        | 4 ++--
 meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 4 +++-
 scripts/postinst-intercepts/update_font_cache         | 4 +---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index dfbdfa1..d122387 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -8,11 +8,11 @@ inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
 FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
-
+FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
 	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
-		libdir=${libdir} base_libdir=${base_libdir} localstatedir=${localstatedir}
+		libdir=${libdir} base_libdir=${base_libdir} fontconfigcachedir=${FONTCONFIG_CACHE_DIR}
 else
 	fc-cache
 fi
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
index 797b321..7c5b4b4 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
@@ -37,6 +37,8 @@ DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
+FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
+
+EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR}"
 
 BBCLASSEXTEND = "native"
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 3907f25..c8c6018 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,6 +2,4 @@
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
 					$D${bindir}/fc-cache --sysroot=$D
-chown -R root:root $D${localstatedir}/cache/fontconfig
-
-
+chown -R root:root $D${fontconfigcachedir}
-- 
2.3.5


