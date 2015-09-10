Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 131D260132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:30:33 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so25515628wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=28I2mliTjJBH9PR4XHhLOwJQDbaH04vmLQD1JzZWJWg=;
	b=l8HrcVRjr515vKASwRPMAYr5NJCZ3WgwW/lmhWJG7zHyWXriba+pTQBZN2mUjthnUA
	oRFGY6dAXUyTlH9cB2Jn3CMnxMaI3LCWlT5rBGmR5AbPwRFG7ioxGoOZCUTnSUsXhM1I
	jlPHPAiiNXt9KwCkRrvByzY/7A8AlbGFn/6iND+Ij//jnQkIB9bSWycKFCjFu7cfZSIk
	8RyT/KwqxOz46v4nHqx/tuXLJL5z//7EM2kNTPN5ZWZj2Nk15epcplVu6m5PnYGzo8oc
	vBDX00VkdIL2/NTdRVletvJ4fMiWT1zWxjgIRa6V5u6IxxxUzJIWwnPwhvMgJCqwIeFB
	vhtg==
X-Received: by 10.180.187.141 with SMTP id fs13mr7234120wic.13.1441895433714; 
	Thu, 10 Sep 2015 07:30:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id p3sm9630128wib.16.2015.09.10.07.30.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 07:30:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 16:31:26 +0200
Message-Id: <1441895486-26145-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441369348-32182-3-git-send-email-Martin.Jansa@gmail.com>
References: <1441369348-32182-3-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] fontcache: allow to pass extra parameters and environment to fc-cache
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
X-List-Received-Date: Thu, 10 Sep 2015 14:30:36 -0000

* this can be useful for passing extra parameters, pass
  -v by default to see what's going on in do_rootfs
* we need to use this for extra parameter we implemented
  in fontconfig:
  --ignore-mtime always use cache file regardless of font directory mtime
  because the checksum of fontcache generated in do_rootfs
  doesn't match with /usr/share/fonts directory as seen on
  target device causing fontconfig to re-create the cache
  when fontconfig is used for first time or worse create
  new cache in every user's home directory when /usr/
  filesystem is read only and cache cannot be updated.

  Running FC_DEBUG=16 fc-cache -v on such device shows:
  FcCacheTimeValid dir "/usr/share/fonts" cache checksum 1441207803 dir checksum 1441206149
* my guess is that the checksum is different, because pseudo
  (which is unloaded when running qemuwrapper) or because some
  influence of running the rootfs under qemu.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/fontcache.bbclass                | 19 +++++++++++++++----
 scripts/postinst-intercepts/update_font_cache |  4 ++--
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index d122387..8ebdfc4 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -9,12 +9,23 @@ inherit qemu
 FONT_PACKAGES ??= "${PN}"
 FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
+FONTCONFIG_CACHE_PARAMS ?= "-v"
+# You can change this to e.g. FC_DEBUG=16 to debug fc-cache issues,
+# something has to be set, because qemuwrapper is using this variable after -E
+# multiple variables aren't allowed because for qemu they are separated
+# by comma and in -n "$D" case they should be separated by space
+FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
 fontcache_common() {
-if [ "x$D" != "x" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
-		libdir=${libdir} base_libdir=${base_libdir} fontconfigcachedir=${FONTCONFIG_CACHE_DIR}
+if [ -n "$D" ] ; then
+	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
+		'bindir="${bindir}"' \
+		'libdir="${libdir}"' \
+		'base_libdir="${base_libdir}"' \
+		'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
+		'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
+		'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
 else
-	fc-cache
+	${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
 fi
 }
 
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index c8c6018..0deab3c 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -1,5 +1,5 @@
 #!/bin/sh
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
-					$D${bindir}/fc-cache --sysroot=$D
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
+					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
-- 
2.5.1


