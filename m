Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TnZiG-0001V8-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 19:58:53 +0100
Received: by mail-wi0-f178.google.com with SMTP id hn3so4503315wib.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2012 10:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=W30ZMvSTqpJZC+hnfrlEpGA1rxfV2OGqZRRLSsAxkfw=;
	b=Gf3plJOb4hivLZNJ3DbGgOD4MW+0DHVmDKfqTYOgMBnGFfVGQZ3BhYXiaUakGcjZac
	bX8IsZt3o9SJ4jY9uCqMyY36Th8lBpvGO1K0dS50DHVTE04HPvLNWTiYCT7zlnNcclv7
	XfcWYAIkIJnVoqVEcQ/ngIQaxaSvPLaUAarMCNOxZjKe4TAF45ri/pvVssLh3cb3KL+j
	FBPBfWJ/wR/aNuarqB59ALqfajr+saeusUnGppWN0fDS7DUkHNGFTPl5GpHLVfua73S+
	HBOMvMkNnG8/S01EUKTJ6NSBAjx67Qz5sTnaTNNR9i5ND+kMomraZZi8W80ImfihFs7P
	RmIg==
X-Received: by 10.180.81.39 with SMTP id w7mr39893884wix.15.1356461040894;
	Tue, 25 Dec 2012 10:44:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm49126305wif.11.2012.12.25.10.44.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Dec 2012 10:44:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Dec 2012 19:43:59 +0100
Message-Id: <1356461039-31775-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] xf86-video-omap: skip package if opengl isn't in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 25 Dec 2012 18:58:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index dea8ca2..f74419f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -40,3 +40,9 @@ CFLAGS += " -I${STAGING_INCDIR}/xorg "
 do_compile_prepend_armv7a () {
         sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
 }
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' not in DISTRO_FEATURES")
+}
+
-- 
1.8.0.2



