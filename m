Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1207572C42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:34 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so2843286wes.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VqELaMhtbpxgulHEGERDeyio6CY3CqTSuJnIMicu8n4=;
	b=Ym270MvOrChNZqPvRb2CitxYHj0yZQDlB2yyegXTme2T6Fk464V526WgORQpc8aK/O
	oDCKMiMjMTXkbyrA1gCWtnYZaNwk448Lc250bCAFaaAUtdQtsYk5Va9zQdda7za0Vga2
	XhavCUamC3kGMbJGwQmZVynmTXyG6Y3pCAPpVqZu3eLbf3rMm3sedWgzi4VLLfvyIMgU
	tdrqPfH3AwJt1ro2XxOy1V6sDRpk5pC42pVFZp56E6/aVI+pteeDZHUBI8vCIM58zjQs
	aZYnD2oQ3Kc7q2uW+LPGMoN/CJkfYcBATKCTH9/UFcCkx4H69/YA6mPJnU2HaQDLxz1O
	e2kQ==
X-Received: by 10.180.91.109 with SMTP id cd13mr6823271wib.46.1421944774540;
	Thu, 22 Jan 2015 08:39:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l6sm4618507wjx.33.2015.01.22.08.39.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:32 +0100
Message-Id: <604f6c2ef7666fbbfca76b3aaa38a0c5ab3952d6.1421943849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 2/4] libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:34 -0000

* standalone libpostproc recipe depends on libav, but current PACKAGES_DYNAMIC indicated
  that libav-9.13 also provides libpostproc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc       | 5 -----
 meta/recipes-multimedia/libav/libav_0.8.15.bb | 2 ++
 meta/recipes-multimedia/libav/libav_9.16.bb   | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 5c327df..8b470c1 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -85,9 +85,6 @@ do_install_append() {
     install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
 }
 
-FFMPEG_LIBS = "libavcodec libavdevice libavformat \
-               libavutil libpostproc libswscale libavfilter"
-
 PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
 
 RSUGGESTS_${PN} = "mplayer"
@@ -140,5 +137,3 @@ python populate_packages_prepend() {
         for pkg in pkgs:
             d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
 }
-
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
diff --git a/meta/recipes-multimedia/libav/libav_0.8.15.bb b/meta/recipes-multimedia/libav/libav_0.8.15.bb
index 18dc49a..127a088 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.15.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.15.bb
@@ -16,3 +16,5 @@ PROVIDES += "libpostproc"
 EXTRA_OECONF += " \
     --enable-postproc \
 "
+
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb b/meta/recipes-multimedia/libav/libav_9.16.bb
index d046885..8ced2dc 100644
--- a/meta/recipes-multimedia/libav/libav_9.16.bb
+++ b/meta/recipes-multimedia/libav/libav_9.16.bb
@@ -11,3 +11,6 @@ SRC_URI[md5sum] = "7b44b75cec24b8e7545e5029e76917e0"
 SRC_URI[sha256sum] = "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
 
 DEFAULT_PREFERENCE = "-1"
+
+# unlike 0.8.11 we don't provide libpostproc
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
-- 
2.2.1


