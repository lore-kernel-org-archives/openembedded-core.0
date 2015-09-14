Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9377404E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:32 +0000 (UTC)
Received: by qgez77 with SMTP id z77so120009794qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rxfaz4WkprKUcu6ZG7Mgxit7sbP9RneKOou/WHe1mWw=;
	b=Te05YZzYvuDE/0+hKzfsWxLSeWPxpjWgpxoNrPYeKwX/0N68E8iyLIZkSv959bSZWY
	Kai1C0TLGsgcqFTRf+MLpaDB1W+PLvZeZmw+EpwzwfKijVRZPkSkxyCgsZujgndFyTp/
	WsjClwGVolTC0RvKqdEbk2nZLorTeS2xga9nc2WiBnjjcA03Sattjgkqh+k+CMmSYRkf
	FHOHcAvdOMQaIWSjR7kQWZdMGVWzSI8RuSzXWjnQa64w1YrS35bBaM0HePSryFv7aHIY
	JEqA13btQkx7DK+p2uHEe03blGzLqoXpB9mpu743eMUVcwnTZKS+4cpHuA+FF8D1gfmB
	9xPg==
X-Received: by 10.140.194.148 with SMTP id p142mr24748016qha.84.1442248292652; 
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:18 +0000
Message-Id: <54236c26d0a0e99fc1cc8b115ba0e2be4911efc4.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 03/12] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:32 -0000

This must have been a typo which is a bug infact we should have used
bitwise & in first place.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...put_dpms-Replace-logical-with-bitwise-ope.patch | 31 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-omap_0.4.3.bb           |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
new file mode 100644
index 0000000..41e77d3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
@@ -0,0 +1,31 @@
+From fc653ca3b36435aea281ae409fb90f85e1bc0d81 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 08:44:13 +0000
+Subject: [freedreno][PATCH] drmmode_output_dpms: Replace logical && with bitwise &
+ operation
+
+This is a mask calculation so bitbwise & should have been used
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/drmmode_display.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drmmode_display.c b/src/drmmode_display.c
+index c3cf4f8..eb54b59 100644
+--- a/src/drmmode_display.c
++++ b/src/drmmode_display.c
+@@ -777,7 +777,7 @@ drmmode_output_dpms(xf86OutputPtr output, int mode)
+ 
+ 	for (i = 0; i < koutput->count_props; i++) {
+ 		props = drmModeGetProperty(drmmode->fd, koutput->props[i]);
+-		if (props && (props->flags && DRM_MODE_PROP_ENUM)) {
++		if (props && (props->flags & DRM_MODE_PROP_ENUM)) {
+ 			if (!strcmp(props->name, "DPMS")) {
+ 				mode_id = koutput->props[i];
+ 				drmModeFreeProperty(props);
+-- 
+2.5.1
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
index 5f3a532..76682ed 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
@@ -24,6 +24,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
+SRC_URI += "file://0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch"
+
 SRC_URI[md5sum] = "be35daf6fa4b75092cc4a8978c437bc5"
 SRC_URI[sha256sum] = "db1e0e69fd4c4c8fdca5ef2cb0447bccd7518a718495876a6904bef57b39986d"
 
-- 
2.5.2


