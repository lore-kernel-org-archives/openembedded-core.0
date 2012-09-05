Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T94FX-00025K-Gi
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 03:17:47 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4553953wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 18:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vx8TqjuOZMHNwG8Cd7+8L6P1hyhiMwhVIffcWjrA0fY=;
	b=E6fsI9JnwOe7++n1nVKMCfrdW+0aVy+mpaGjhYhWSYTpfBeyLJgOmN2g99LBSHpqC/
	jwMibQ0k2MmBkJLzUuxQKO/URPmeGF4P93HhwPop14gHaVZ/OrKayH2Y6hDIDQMLD1Ry
	SMVvd8zPuOg6aQn/kKgPUKMHJGzLhQoOo2mc+CO7bilXwaABwLHuUoq3x+uTTM62aJq2
	iMgGI2qi1DWfhoHu7P5s3vhsz0OzDdzjYjvVHnWUIPrKFb/WMZV5sRQ0LBulh+bMsWHY
	3xg33tdNYabSh+B1tQTbmhQ5NJXQUTsAWl5oJUMKCG3B7nW1pDDauqbRKF5W5U4hZAL6
	beVQ==
Received: by 10.180.105.6 with SMTP id gi6mr34184019wib.4.1346807127436;
	Tue, 04 Sep 2012 18:05:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm26693228wiz.1.2012.09.04.18.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 18:05:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 03:05:37 +0200
Message-Id: <1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 01:17:47 -0000

* pixman-native can have different do_configure sstate checksums if it's built with armv4t machine and armv7a
  OE @ ~ $ bitbake/bin/bitbake-diffsigs
    before-mgmt/stamps.1346795706/nokia900/x86_64-linux/pixman-native-*.do_configure.sigdata.*
    after-mgmt/stamps.1346801508/om-gta02/x86_64-linux/pixman-native-*.do_configure.sigdata.*
  basehash changed from 27e577de60880a788c7aaba797ef83e0 to c6799807eb3e767daf1e75738fc753f7
  Variable NEON value changed from   to  --disable-arm-neon
* so if you start building with different machine then last time (wrt
  NEON setting) all recipes which depends on pixman-native will be rebuilt too
* this explains why sstate-cache-management.sh wanted to remove many
  native sstate packages when --stamps-dir option was used (see comment
  28 in https://bugzilla.yoctoproject.org/show_bug.cgi?id=2897)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
index 35a2def..218808a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 PE = "1"
 
@@ -25,7 +25,8 @@ NEON = " --disable-arm-neon "
 NEON_armv7a = " "
 NEON_armv7a-vfp-neon = " "
 
-EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
+EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
+EXTRA_OECONF_class-native = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-- 
1.7.12



