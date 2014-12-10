Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 96B90725F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:17:14 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so5303980wid.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Mn1TSAb5ChC0J+WhbSQb3mTVP+0cOTiuK/xJnHSvbQI=;
	b=hKEfPEBpsM0dQ76bu9wPUg5AdhpUQ2V5Prw8N0wRmcs49Fp91juuMrExTqN7pJ+fF4
	HCMAOoyfpWN98uTyjMkevTM45nZOvsmRTj5hM88f5KNBXZ9AIZzpctrFPY1NBZnWU7Zr
	dm4gWXkWoqACblxzIWYmE/vmtJyxVI5n/B3E/eAbP/oUaUepKYxsdxOB961swep6+Jcg
	0ohrrhKZqdRpVF980ad9pqQmKB6mOq61U33P5li08BBERILes4sCNPaYM/GQEn5tCRZN
	5Hl1Ad9Ug8/TsaWAwRAfERw+kV7YRc5NO76YstDJUVmNJK/T3CVHPCAtqoaJIhCn6yql
	nA4A==
X-Received: by 10.194.7.97 with SMTP id i1mr6868463wja.31.1418221035255;
	Wed, 10 Dec 2014 06:17:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl5sm18088697wib.0.2014.12.10.06.17.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:17:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:17:05 +0100
Message-Id: <1418221027-12371-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/4] libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
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
X-List-Received-Date: Wed, 10 Dec 2014 14:17:16 -0000

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
2.1.3


