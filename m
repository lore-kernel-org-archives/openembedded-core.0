Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B5EEE65DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 02:29:16 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so60110353pdb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2015 19:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MRnvX1A1nIopTKLWu4CSxwNLcrlwf2NaqhATdiZzwXI=;
	b=nuPiUFH+sSZIkw4RgmsE7JPns+drfzI5mrvclzON5DtonE4GdLSfVqvR8t5/d5SO9o
	nW8S5xJA6UrAhmbFb9P2VkncBfugbNk8gJaPfEY3u5BmoVCaIhh3r15s4TKcFw9OLWjn
	0GvALKladets2rWIo1YJq92mOGzRFZcJJ2oc6S8k7CILDU8JS5RrVeJ1nUNc5Zd5c7v6
	w/WmoZcg/W/BepawcnIMnWmePJ31k7ccydwBvrMWMbYmMM2wizGi8gAl3yopqEQVzd47
	Fvjqi3+yWaQa8Q4GQaCGPGawMFd9YgCRZgVNSqJaijGJ8gHNa/ACog7+eidy+Xti2cL8
	zNYQ==
X-Received: by 10.70.38.227 with SMTP id j3mr16595274pdk.149.1425868157554;
	Sun, 08 Mar 2015 19:29:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id pm9sm3187851pdb.59.2015.03.08.19.29.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Mar 2015 19:29:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 13:28:37 +1100
Message-Id: <1425868117-11979-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] postinst-intercepts/update_font_cache: fix ownership of fontconfig cache
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
X-List-Received-Date: Mon, 09 Mar 2015 02:29:17 -0000

The file ownership of the cache files in /var/cache/fontconfig needs to
be set to root:root otherwise it inherits the user and group id of the
build user.

[YOCTO #7411]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/fontcache.bbclass                | 2 +-
 scripts/postinst-intercepts/update_font_cache | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index dcd1f04..dfbdfa1 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -12,7 +12,7 @@ FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
 	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
-		libdir=${libdir} base_libdir=${base_libdir}
+		libdir=${libdir} base_libdir=${base_libdir} localstatedir=${localstatedir}
 else
 	fc-cache
 fi
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 78f3365..3907f25 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,5 +2,6 @@
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
 					$D${bindir}/fc-cache --sysroot=$D
+chown -R root:root $D${localstatedir}/cache/fontconfig
 
 
-- 
2.3.1


