Return-Path: <mporter@konsulko.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2A42765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:13:45 +0000 (UTC)
Received: by igcpe7 with SMTP id pe7so18493492igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ClU0hPjzQad7OrB09STIfYdxVrrXCiwz3qApQn+6+yk=;
	b=kqxBmocF6hynd0uIZ3EfTx6NISACTXHCx0pE0NAHRHBD4A6R721/7mqsgznn/1+hky
	us3Qp0n26nPdGMTmRmDQ9kd0u5ERUbWwob7fZ2K00PtVV48D3Qq7lFKHHNucCEOExjgS
	cuplFvuOqrZfDTfdPpSW//tcmp3jmlq6NRoqZgn8Ljv5aaQqPOT2xaX7zGD/VpOhes/c
	qf7Q9gpVBFrMkLNHj3c2E8aC+HqGEUNiuKnEoVL0ndsN4mcbprGhmdYaqmo4Jy9TRF/d
	gt+z04EwZl6KUdFVv3EEVn2cS+1Yv6TRe0fbvj18QhpcH584j5D0ZNBspC8XnumZUFK5
	wKOw==
X-Gm-Message-State: ALoCoQnWeq4SMm0qYZRHF3GpZwAY0g+ERhW5jfqsoIZ664ysWBs9x5zjBVGruVvuMXio7/Y0HyIs
X-Received: by 10.50.79.133 with SMTP id j5mr19235250igx.59.1444749225499;
	Tue, 13 Oct 2015 08:13:45 -0700 (PDT)
Received: from beef.ohporter.com (cpe-107-10-23-53.neo.res.rr.com.
	[107.10.23.53]) by smtp.gmail.com with ESMTPSA id
	ql6sm7146444igc.15.2015.10.13.08.13.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 08:13:45 -0700 (PDT)
From: Matt Porter <mporter@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 11:13:31 -0400
Message-Id: <1444749211-30044-1-git-send-email-mporter@konsulko.com>
X-Mailer: git-send-email 2.1.4
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH] libsdl: enable fbcon video when fbdev distro feature is present
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
X-List-Received-Date: Tue, 13 Oct 2015 15:13:46 -0000

The fbcon video backend is always disabled. Use the fbdev distro
feature flag to enable/disable the fbcon video backend.

Signed-off-by: Matt Porter <mporter@konsulko.com>
Reviewed-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c0d5c6a..c604c6a 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 PROVIDES = "virtual/libsdl"
 
 DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+	   ${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', 'fbdev', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
@@ -40,10 +41,11 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-mintaudio --disable-nasm --disable-video-dga \
-                --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
+                --disable-video-ps2gs --disable-video-ps3 \
                 --disable-xbios --disable-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
+		${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', '--enable-video-fbcon', '--disable-video-fbcon', d)} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
-- 
2.1.4


