Return-Path: <hroussille@adeneo-embedded.com>
Received: from smtp.adetelgroup.com (smtp.adetelgroup.com [94.247.26.71])
	by mail.openembedded.org (Postfix) with ESMTP id 7D07F6C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 07:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.adetelgroup.com (Postfix) with ESMTP id 3DFC341D9A;
	Wed, 27 May 2015 09:41:08 +0200 (CEST)
Received: from smtp.adetelgroup.com ([127.0.0.1])
	by localhost (hbg-pa71.hmc-pa.adm [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dkL3PXzbHCiq; Wed, 27 May 2015 09:41:08 +0200 (CEST)
Received: from hector-HP.adetel.com (226.94.7.109.rev.sfr.net [109.7.94.226])
	by smtp.adetelgroup.com (Postfix) with ESMTP id 2AFE241D76;
	Wed, 27 May 2015 09:41:08 +0200 (CEST)
From: Hector Roussille <hroussille@adeneo-embedded.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 09:41:03 +0200
Message-Id: <1432712464-12695-1-git-send-email-hroussille@adeneo-embedded.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] Adding support for directFB to mplayer2 recipe
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
X-List-Received-Date: Wed, 27 May 2015 07:41:07 -0000

---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 5b0e1de..b208144 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -121,6 +121,7 @@ PACKAGECONFIG[postproc] = ",--disable-libpostproc,libpostproc"
 PACKAGECONFIG[vorbis] = ",--disable-libvorbis,libvorbis"
 PACKAGECONFIG[portaudio] = ",--disable-portaudio,portaudio-v19"
 PACKAGECONFIG[mpg123] = ",--disable-mpg123,mpg123"
+PACKAGECONFIG[directfb] = "--enable-directfb,--disable-directfb,directfb"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
@@ -134,7 +135,7 @@ do_configure() {
     sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
     sed -i 's|_install_strip="-s"|_install_strip=""|g' ${S}/configure
     sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
-
+    sed -i 's|extra_cflags="-I. $extra_cflags"|extra_cflags="-I. -I${STAGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure
     export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
     ./configure ${EXTRA_OECONF}
     
-- 
2.1.0


