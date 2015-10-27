Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5364273695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 17:18:08 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so169613363wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v8T414yalc/qnyz+2D/hK/zmFxNIHat9xJKVJzeHdS0=;
	b=QHcZR0fbrbBivf9o63Web+GGqfEqJqigguYcUgLoi9o4dSAoBOiMDdwTwogqOSg6qa
	8lNbxYMrfQOLhEjDsDJN3eb5Mjd8qaq+cz6pshcDO2epM7qHq4D08HpmHPbRHWzvnGsy
	kIE9SZtvi9OUuzD7VaGSBQx6VHcvC23zK2JHe+yfx0zDvm2gR6jqAiQqr1LcrJ6kBKC8
	rrsYMd9qD1ZeEHPQUvCfi0/MrkvOr68rgqQpst8vj9blNQ4sJeTQlplCuMv3zYkRjyeU
	KIZaWk39CvmQQiK/PugjW7nhPiIHBFzUkLIGqXgdK6qcJ0jET2ol9anWLer4TCOTtY0/
	Crtw==
X-Received: by 10.180.126.3 with SMTP id mu3mr11812062wib.40.1445966288770;
	Tue, 27 Oct 2015 10:18:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p18sm18493293wik.21.2015.10.27.10.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 10:18:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 18:18:20 +0100
Message-Id: <1445966300-26006-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][fido] fontcache: allow to pass extra parameters and environment to fc-cache
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
X-List-Received-Date: Tue, 27 Oct 2015 17:18:11 -0000

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
2.6.2


