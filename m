Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A970C73C22
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:20:32 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so29890869wgs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f00u/QSAH508M9i1NEI7HIFVdUyqQFjttgfCZ0mAbio=;
	b=AmEf+2RYuaE5viSoS8Jf3d1e+WFu0DCcq4VYP7lLuR5uO1tO/R+57NL5HDql0n7trm
	5Yflvydkn0rlTXSNs8Nf2mCIyMtAW9Z5L+gzVTi/TQSVEfI8Zcg1jn6g34Am4BIqQzof
	mhL2zRt1SFlrYacc8JmYBJajQFrFmNz5lR5Ndmu0GvV9UfaelKpxafws1z+3n/R1jj3v
	N2ah0lgqET/lNK7hx/juWEsGS/co+SKtnt1U6K3ZUxW3AWnlQUa/SVrfxu74XvHNTmwQ
	J2b8pBkxq4vQgWWefS4pRJHJ5/nFanL0jxLnhzYmtiuasjLUjC/kTS+Jowtp7aq7ZR1U
	ItSg==
X-Received: by 10.180.187.200 with SMTP id fu8mr3737046wic.2.1428405632839;
	Tue, 07 Apr 2015 04:20:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	gt4sm10550023wib.21.2015.04.07.04.20.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 04:20:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 13:21:13 +0200
Message-Id: <1428405673-29955-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <20150330172759.GC14928@jama>
References: <20150330172759.GC14928@jama>
Subject: [PATCHv2] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Tue, 07 Apr 2015 11:20:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: added --with-cache-dir to fontconfig EXTRA_OECONF in case that was
    what Ross wanted

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


