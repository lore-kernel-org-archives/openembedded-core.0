Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB5562252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:19 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so2488423wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=MDHs5HCfr8T6+fXMje+nlNwjWVp2nhbZIdZV3oRtlqo=;
	b=BFI0V23uaO+xFdYI71nxF6tX0yUpjYks0HTNb2yeB75pfFAd5vtxNdPfGmF1Af9GQO
	soJYdu1ByeyUnS5eBM6kCzZBYzXklBlhVkuVNrjas4kcZmeA0b57si8WwJ5GUm7JBisG
	w3pNqU6c8K8wSrFY7mm8JNVTUzSeRYl1Y2mzAKEpqdDtrCS4m6HZYuYtO8lyKV69xgfu
	c+ja5na/qUVm2FuZ30OVFrQ86bfYNM4Svy5C1zF6bsilTPO31Wt8LmQIZN/5rIyAoe/W
	jqUAxYYgqkml8kf6HDTR8Y+NfJYRzTUWxsaEBVRayBY4stm6YPipHPGFL13tF0PhEMVX
	mhag==
X-Gm-Message-State: ALoCoQnbQXeKM1gWD9np9XSlL8wz5zxRNQQuQgXsAfoFsBcr/0/fA93SmcGTMgC8kYFhQmHeI940
X-Received: by 10.195.13.2 with SMTP id eu2mr34730048wjd.88.1410177560906;
	Mon, 08 Sep 2014 04:59:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:40 +0100
Message-Id: <db4ab05ac3ced703baf5c17aec078b288531e368.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 22/27] gstreamer: Set DEPENDS dynamically for plugins-ugly and plugins-bad
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:20 -0000

From: Drew Moseley <drew_moseley@mentor.com>

Only add plugins-ugly or plugins-bad to the DEPENDS if they are
added to the COMMERCIAL_AUDIO_PLUGINS or COMMERCIAL_VIDEO_PLUGINS.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb     |    7 ++++++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb |    5 ++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 518ab72..039abe1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -1,6 +1,11 @@
 SUMMARY = "GStreamer package groups"
 LICENSE = "MIT"
-DEPENDS = "gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad"
+
+COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
+DEPENDS_UGLY="${@'gst-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_BAD="${@'gst-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS = "gstreamer gst-plugins-base gst-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
+
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index a703d9b..3ef10c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -3,7 +3,10 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
+COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
+DEPENDS_UGLY="${@'gstreamer1.0-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_BAD="${@'gstreamer1.0-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
 
 PACKAGES = "\
     gstreamer1.0-meta-base \
-- 
1.7.10.4


