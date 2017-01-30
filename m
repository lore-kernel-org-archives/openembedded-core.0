Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 462 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jan 2017 21:59:54 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4896007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 21:59:54 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id E91E4AD009AB; Mon, 30 Jan 2017 22:59:50 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 22:59:50 +0100
Message-Id: <1485813590-22370-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ffmpeg: disable cpu autodetection
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
X-List-Received-Date: Mon, 30 Jan 2017 21:59:54 -0000

Just pass the correct -mcpu= configure switch (fallback to generic).

Avoids warnings like:
| warning: switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
index 66718c4..c376d82 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
@@ -66,6 +66,12 @@ PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
 
+def cpu(d):
+    for arg in (d.getVar('TUNE_CCARGS') or '').split():
+        if arg.startswith('-mcpu='):
+            return arg[6:]
+    return 'generic'
+
 EXTRA_OECONF = " \
     --disable-stripping \
     --enable-pic \
@@ -90,6 +96,7 @@ EXTRA_OECONF = " \
     --shlibdir=${libdir} \
     --datadir=${datadir}/ffmpeg \
     ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
+    --cpu=${@cpu(d)} \
 "
 
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
-- 
2.7.4


