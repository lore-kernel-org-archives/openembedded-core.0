Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqgne-0005Lz-Oi
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 10:37:02 +0200
Received: by bkcik5 with SMTP id ik5so3317599bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HGBXGmLHOMdPWzE6MyabKTdOpSfxnDqQTCIT7RfqExM=;
	b=y+9kWXrp1S42h0RklfRFzDjCnQnGgb78xcSDmJpJt6Si9O5HxtKcmKABMuUBtFzl8z
	nNFYGMTHozpCyO58O/o5vR63WMce0Jgvb0vcetirZhW02fQOPxjYXDB+OCwKQSMyT3hB
	YZidiDNBtlshleFxDE48P1HEy+D5pY2Oj8JnP4PL1lSmTwTIqVKntSIjt5L0X6uxTNCg
	LGQ0bwWEOdzeHPU8psms2+MxLm2SoWVuRJsMS8iGHjPHQLjY5SkEefZaS0/Xe1VYzI3t
	hT5vGqT442L3NSx8Wp7YwlMWFQFbzIBZFJ/eWZUc2aBt8sWo0Fj/nTZGuXuvzXD6lhTp
	ORzQ==
Received: by 10.204.136.205 with SMTP id s13mr4375024bkt.22.1342427144522;
	Mon, 16 Jul 2012 01:25:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o4sm7424361bkv.15.2012.07.16.01.25.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 01:25:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 10:25:49 +0200
Message-Id: <1342427149-11779-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120716073703.GC3729@jama.jama.net>
References: <20120716073703.GC3729@jama.jama.net>
Subject: [PATCH] libx11: fix makekeys build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 08:37:02 -0000

* on hosts without libx11 installed it fails with
  | makekeys.c:33:27: fatal error: X11/Xresource.h: No such file or directory
  since oe-core rev 52d4ff7b35602faa52360a3e7a800891ef60c739
* upstream added -I$(top_srcdir)/include in 24283d40b1e4314c6647dda49d2a159833341a8b
  to ensure that right Xresource.h version is used, but we're building
  makekeys outside source tree (x11_disable_makekeys.patch), so we need
  to pass -I${S}/include in our makekeys build too
* building makekeys outside source tree isn't probably needed anymore
  and recipes should be updated to reflect that, upstream fixes:
  https://bugs.freedesktop.org/show_bug.cgi?id=22584
  http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=b2487d07f7b355f230a56e32c763acd08862735c
  http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=24283d40b1e4314c6647dda49d2a159833341a8b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    2 +-
 .../recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    4 ++--
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 4ae8b29..7d4facd 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -5,7 +5,7 @@ this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 89c4597..3d5a306 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index a1e4386..592f116 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -35,9 +35,9 @@ do_compile_prepend() {
 		sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
 		touch makekeys-makekeys.o;
 		if [ "${SITEINFO_BITS}" == "64" ]; then
-			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -I${S}/include -o makekeys
 		else
-			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -I${S}/include -o makekeys
 		fi
 	)
 	if [ "$?" != "0" ]; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 04805d7..a65ab1f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "r0"
+PR = "r1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.8.6



