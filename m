Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 96D347D29B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:37:13 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id y6so7440193pll.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=UHduqQWjqumLy7LTjvBurUzRAvjh1pJ010OqlEm5PoA=;
	b=gps2qo3j5R8RoRIjwf545VS+L1iGeWEC5vnGO66nFngS4DIRd1WRi32q+vFQBm5R6x
	hwnu79sQgtXWACSb1v2tIkzwVMX0Pnex8HZuZoSbyoVijm0kl0NFujpog2PbYULk093x
	idNU8YpSuZU36+LTuJn0gMPklUVLtpx9LOSDG0P7XxdC3GNQSp/nwH0JWMKhKLDh6pmL
	hy+CbXOAY/1KGAq3a6lfQWdaQ3lOnSN0v4PO0cHPxa7qJahCuo+E3vyZgTbb1RIw3LSY
	mFNyKGeH47EdMV3lvn8/3TPp5AYSDs9d6XiIH4hU6ZyjnKp1XEbf8pnjGpK4Cjw9I9PG
	qibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=UHduqQWjqumLy7LTjvBurUzRAvjh1pJ010OqlEm5PoA=;
	b=aOTaL4yBLNgrQ8Hm8HejiZjLhZJwn48SM0bmcEo2S3p0jTxyq5Tp4FkuXr5aVGfmsR
	EjSaCEzM77mpv0s3sP0gU4QrHcaixiwACPXhTjdHFrR/Jxb0AhBxBRLIxsvaIi3f59zF
	9E+htd4hD5sB93uXFjcOTC3iBimSzVE9a/WseplygVU3MjDkf80CiMNZIkdCXx0+tRnX
	aP2VWIcpzE17QVEZ3wh9kYFoY9/iKv0TYkDIGoeL1kyvNd0PhstFwbPedBPUzZAoTsRZ
	bI8Bb/IPKGzaheiVcIgp/OS4qQ99u/oR/wOxvN6pi9ey8+nxLvdmhVMdaiibQEknuMlo
	gojA==
X-Gm-Message-State: APjAAAUILgBWryVG6y1JFuKnrZZc3QGQguDthkcTzTazTnBQOZ+cWk5V
	HkClvkI5+uGtRDHoXoR/dp6ksBlPU2Q=
X-Google-Smtp-Source: APXvYqyvb2sTOw9lS3M/lKe3k5cn011HjUQ/yewjwVt96dkRWfkxxv2DSfytn6eUwiK9zSKGo2grBg==
X-Received: by 2002:a17:902:b602:: with SMTP id
	b2mr15810295pls.293.1554269833999; 
	Tue, 02 Apr 2019 22:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	p2sm52060009pfi.73.2019.04.02.22.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 22:37:12 -0700 (PDT)
Date: Wed, 03 Apr 2019 05:37:02 +0000
Message-Id: <20190403053702.10672-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 1/3] cmake-native: Enable ccmake by default and depend on ncurses
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
X-List-Received-Date: Wed, 03 Apr 2019 05:37:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Enable the building of the curses based ui for cmake. This depends on
ncurses.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
This patch suggests enabling this in the cmake-native recipe, however
this might be undesirable for bootstrapping reasons. Whilst ccmake is
not used normally the added dependency on ncurses is likely required for
other parts of the build so impact on build ordering and time should be
relatively minimal.

Changes in v2:
- None
---
 meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
index fedcf3d4bd..b2952ee5f5 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
+DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
@@ -13,10 +13,9 @@ SRC_URI += "file://OEToolchainConfig.cmake \
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
-# Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
-    -DBUILD_CursesDialog=0 \
+    -DBUILD_CursesDialog=1 \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
---
2.20.1

