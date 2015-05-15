Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 78D6174053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 19:56:24 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so46358302wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 12:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yKEMFCnxelTyR9r76Rqj8Ao6JNOluva/D2i5lcJCaBM=;
	b=gZGNmJZCkumvKziNkVhF0E7rNz9Fy4KdU4M90SenCuz4BrLpZQsmrnkTDC2qaA9Mwp
	E/WvgNLu6M3E0SqLXR9U3OVy1iXnbCg8HV+etYyMLPbdExYj89tYPFyRS3fcUm3cOyVO
	fFPkLzMfXAwrMAGvMzS+odnblYVZEmbqWvpTto358EovAh/kTvJ5eCzy1MbA9XkAa+ew
	FkP83/VbYzbfHk5lKwHGjuxSrASf210QJw0OWJG4FtKuiSjtv9ffYu9Na4/mqOCHckt4
	9OMcZIJ7RnYMTjoay+8TGM/TKBfEXbPNvHSb8X4i/7owU/6pNgd14qPkqIcVcU2URD5z
	xXVQ==
X-Gm-Message-State: ALoCoQmlfDzpHOPHef/MwUOe7nDO63yEnaxvh9+3MEC1+x4kL7hflV7cupK7ZIjT7GWcdl1FL1k9
X-Received: by 10.180.98.195 with SMTP id ek3mr398525wib.57.1431719784879;
	Fri, 15 May 2015 12:56:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id df1sm4762275wib.12.2015.05.15.12.56.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 May 2015 12:56:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 20:52:10 +0100
Message-Id: <1431719530-18179-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Revert "libsdl: depends on libglu when x11"
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
X-List-Received-Date: Fri, 15 May 2015 19:56:24 -0000

This patch was incorrect, GLU depends on GLX (and so X) but you can build SDL
with X11 and without GL.

This reverts commit f744f0b18c22daf8bdab837ba8096760b1ce00b8.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 06490aa..266bd42 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 PROVIDES = "virtual/libsdl"
 
 DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender libglu', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
-- 
2.1.4


