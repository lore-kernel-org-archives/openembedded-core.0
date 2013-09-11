Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 975886064E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 22:25:00 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so7407192wes.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 15:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E+Sfx+EG+GM/zrYEXI5T8wA01PkwQXum5t34X6lYN1g=;
	b=muPPkPhZ3ugqGoO6Pp3B+TCC+GkAvPuYaW1qHOeWvFxi5bOvc6jOMAdR3MIr+YrST7
	KFYOX5zzN2Ml8vApoo8XaJXcf+Fge77GRHu8MFl+yP3ca0jFLY8FzfbLpEVwLW5RnWAP
	7+79mm51Ak8jFPGC29jpUtub4SMCgzN8UFCsva+DoS5SXbcbPEvmkN+3bftUzIj+Y6uY
	t+V4INNuSNbJaArQzbM1CZJ3PwefBdICaZtDAJdBB5wZ7YrzKQ+rX+hb1sJZNw1Kd0oA
	0S8XuKA9NEeVvbd0PJeVL7DWQx35T9Zcl5PFqrEByES/M454Ff24gJZEmsjraSiehujK
	RmJA==
X-Gm-Message-State: ALoCoQlN2BSJyxn3PWm6qFlrJO3SHMnj//WkOvoySJOtnyCPN0kvZWistC35EKliVjMW1RW2lbfo
X-Received: by 10.180.189.9 with SMTP id ge9mr3183600wic.52.1378938301660;
	Wed, 11 Sep 2013 15:25:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz8sm13519243wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 15:25:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 23:24:57 +0100
Message-Id: <1378938297-9208-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xf86-video-vmware: respect opengl DISTRO_FEATURE
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
X-List-Received-Date: Wed, 11 Sep 2013 22:25:02 -0000

Conditionalise the GL dependencies on the opengl DISTRO_FEATURE so this driver
can build without the opengl feature active, as the configure script will
enable/disable the GL sub-driver depending on the presence of these libraries.

This is an interim patch to fix the autobuilder, a more complete patch heading
upstream to make the GL sub-driver deterministic will follow.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
index 1526a02..0d8c8d2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
@@ -6,8 +6,8 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
-DEPENDS += "virtual/libx11 libxvmc drm glproto \
-	    virtual/libgl xineramaproto libpciaccess"
+DEPENDS += "virtual/libx11 libxvmc xineramaproto libpciaccess \
+            ${@base_contains('DISTRO_FEATURES', 'opengl', 'drm virtual/libgl', '', d)}"
 
 SRC_URI[md5sum] = "b08e0195ebf3f88a82129322cb93da08"
 SRC_URI[sha256sum] = "802dda415c22412edad6c3df44fe18a06e91d0f8456d9a58bac0d340fdf8fe3d"
-- 
1.7.10.4


