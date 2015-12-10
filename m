Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B1A506E665
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:25 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v187so33893724wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=l4u98GIvePIyL7eKOz56rkbMim/bANZ84aBNmC8A5Fg=;
	b=fTcCL/f4JPZYjXuu8nHZkVhDdPY7Ed2ESBrK9kc++QckKVDoywH3oImPPtqU2bv4Fg
	/XesPMWCFUgbAIJuSuhWUKFCalVu2d7xTR5qg/jfaYtR5YFR7m0tqybogeGNDvkvN5VQ
	mnihb6RzDhrUS7KtgKziQOGm8SQO7S1oa4c1ssiy/QvivpA/TKsiNLFLS9YES4OOX1+K
	9Yjw0gvFjIJV7acpJEhDZycaaBqXbKYNJ0/8QfVVPgVxmeIe8dY6AjNcx0qDx/W5y61H
	qvlBSFYe8x/b4WinyBcNYNB0xb0JE5nf/1zf9u94qH8wM888BO22P04dlWt0IxZBgmbU
	VLIw==
X-Received: by 10.195.12.163 with SMTP id er3mr13068108wjd.135.1449755185883; 
	Thu, 10 Dec 2015 05:46:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d2sm12518235wjy.16.2015.12.10.05.46.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:47:59 +0100
Message-Id: <14c2dfbe315db976b43f7f2db2fd092296cbc6f3.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy][RESEND 1/7] fontcache: allow to pass extra parameters and environment to fc-cache
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:26 -0000

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
2.6.3


