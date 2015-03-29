Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id C22797391D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 01:27:02 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so79040324wia.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 18:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qVxclQs+r03IVmYzZKJi4M3YBTtypNIeNH7fqnwdtPU=;
	b=zxL9ViRyEnVrkg5jXKFgtMshZKeloYveoZYk9SNv3mlaZUqRpg3bGA4re0XYYob3Kv
	QS15lUSXf+ik/HyNRMcuvmjHgry67IjGVp4qQxpJNbV10G3DFiVZhGoEQvuzP8g6pWoy
	i2MMjiMLGcnR5NHJLyWHc8T2MMvhqw23GkZVFZS5tnXmM3VfrgTljDkx4CjhxwCOa3kk
	y/gNfxgDexGH/st5iMDDSIwlrkA9tBlkv6ZzWPII+86n2X+NRjvfWmcV7DhXyuLedYPi
	ORfbMCxnPTQ7rh+PgNQRb4ppmvGO2t1fzuE6iK17uR9uqjJa8JZ8ZpZICbDpu3Pa7RyV
	IUEg==
X-Received: by 10.180.102.130 with SMTP id fo2mr9672173wib.30.1427592422836;
	Sat, 28 Mar 2015 18:27:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lx10sm9267506wjb.17.2015.03.28.18.27.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Mar 2015 18:27:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2015 03:27:20 +0200
Message-Id: <1427592440-2658-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.4
In-Reply-To: <20150329002843.GE2343@jama>
References: <20150329002843.GE2343@jama>
Subject: [PATCH] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Sun, 29 Mar 2015 01:27:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/fontcache.bbclass                | 4 ++--
 scripts/postinst-intercepts/update_font_cache | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

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
2.3.4


