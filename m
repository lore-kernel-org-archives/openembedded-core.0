Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A1EC76098B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:57:23 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so2153291pdj.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Lu8QUOrG6X0z/TbQcyXi8KNYpyg/NkKEx2MpwTFfqsg=;
	b=m3rJBTt4GttmvcLJgOvqa8vuZ6r6V27L/NFGcRwT1J7jKQn+qy/BNI6lDmj0J9R9x3
	egzYrnA0TWgW2SymOsj5J2ZbHLkLahV/CSWE82LfiRStIn6z4b+XGPUIVZwGJS2ZgW+3
	uYleZjR2lYChF+P5U1NaI2nud6PRdU+gyGOg3c9v1Uid8wH7FYD77NFcIzCvmSNKFUfI
	K+zaY4HLygIXebtWBdljYRbrKuhzxWeP3PWljVS6T3QFHRNNkeWlorOLSwijQBAPSVj4
	xx+5X19WazMZzCfCAejFNv9ljmEq0ehM6Cphk8hN39SKJGJxycqRn2ElZvKWBXc+5A0g
	0LUA==
X-Received: by 10.68.178.162 with SMTP id cz2mr26572693pbc.51.1397901445084;
	Sat, 19 Apr 2014 02:57:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id lr3sm2070242pab.4.2014.04.19.02.57.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Apr 2014 02:57:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Apr 2014 02:59:28 -0700
Message-Id: <1397901568-992-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [master/daisy][PATCH] libav: Add libsdl to DEPENDS only when x11 is enabled
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
X-List-Received-Date: Sat, 19 Apr 2014 09:57:26 -0000

When we have opengl in distro features but not x11 and try to
build libav then it calls out to build libsdl which inturn has depependency on libglu
and libglu fails to build

ld: error: cannot find -lGL
| collect2: error: ld returned 1 exit status
| make: *** [libGLU.la] Error 1
| ERROR: oe_runmake failed

since libglu wants glx enabled in mesa and glx in mesa is (righly) enabled only when x11
is in distro features.

This breaks the dependency chain leading to this problem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 5e675be..2152936 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -9,7 +9,7 @@ PROVIDES = "ffmpeg"
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS = "virtual/libsdl zlib libogg libvorbis libtheora yasm-native"
+DEPENDS = "zlib libogg libvorbis libtheora yasm-native"
 
 INC_PR = "r8"
 
@@ -32,7 +32,7 @@ PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
-PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto"
+PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 
 EXTRA_OECONF = " \
     --enable-shared \
-- 
1.7.9.5


