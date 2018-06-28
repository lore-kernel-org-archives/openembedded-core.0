Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C32BC74813
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 17:47:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n17-v6so9431299wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UkBEDgClvr0K3MfhVUjGeJiZqEVwtzqbPXpRXDJh/N8=;
	b=RT7mTTQTbuJ2qcDLk7onRHZVGq75xuGwbyWyh5jfEgHrRDWZxRgK3voMsFiJH7tp9+
	XCte1PxzXasPldpp5n0OOMF9bq7eAJzVSbQvFS9iUrunIF5mpdXvrNemnHug74kK3yFc
	eEz/qA/sXD7+oETAPIAviughYro/iMWi7zvMof6UAh4iWv5o0TkK6fk3b/ZCyqwOw2Ve
	B3Us5kG7t7ySZ4a/7kVnD1p+xKUGNKEkuUnqNu4QIc475MeRXXKR5z6PpWCVX12QW7ZT
	rUsLkZTqDE8VMpxpuLzxtF/yYEdaadhvFGxkcotmVo3FiR61lJ0lk2NxnDQ1gfSl1lIS
	oEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UkBEDgClvr0K3MfhVUjGeJiZqEVwtzqbPXpRXDJh/N8=;
	b=ok2ddexlAIenU3J2GeKGRTSnyFqLpxKX2wngyT0nbMjX1BMiVo20yR7T9Tmm9bABqu
	Xd5JrmfW5gQJIG5uBSTSHfrLyC5uiB0P5HOJZ7zDeMPjzCFN/1Ej6XN9V3e74wZ3q/Nk
	p3+iwdtxq5nSS/A/9oJ/dtGNtvW325Ngl2DSeLoSeJE2cuYAmyRje31y1xLnA2O3Ozxt
	BXH7r2N5Oiyb1YUJlSIroSoKZIfr6l2iOEFP54NQyyq9AvcfXbNLZ/kofv2ihjh/GlgF
	4omvBvKMCS8qIXINxU71o2rg540me0hq8kjf5Dso5nMY6q+0ZvIGe9piHaYGFVIiVGjO
	pJsQ==
X-Gm-Message-State: APt69E2wVKTRAhpr2b3REd7CaMnAPEBGstW7KmkLmt3BClueD+D8tj8p
	kg2tq59xuMtCXwDgt+1hZwV+oYUG
X-Google-Smtp-Source: AAOMgpe9LJMadV2da9zxpUhbf3QF3EpeH97aLA18hRyhNicX7u8cZYiDg/euqeDhf7Uwq9ZZ/TOFHQ==
X-Received: by 2002:a1c:7e8c:: with SMTP id
	z134-v6mr8869731wmc.156.1530208067897; 
	Thu, 28 Jun 2018 10:47:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j5-v6sm6953509wrq.91.2018.06.28.10.47.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 10:47:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 18:47:45 +0100
Message-Id: <20180628174745.14657-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsdl2: fix build race
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
X-List-Received-Date: Thu, 28 Jun 2018 17:47:48 -0000

There's an occasional build race from headers being generated in parallel with
other files which include the headers being compiled.  Solve this by adding more
dependencies.

[ YOCTO #12815 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsdl2/libsdl2/more-gen-depends.patch         | 47 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |  4 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
new file mode 100644
index 00000000000..29076bf6cb2
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
@@ -0,0 +1,47 @@
+Many source files include e.g. wayland-protocols.h which should be found in the
+sysroot but SDL wants to build its own headers from the XML definitions.
+
+However the rules to generate those headers are only dependencies of the
+top-level libSDL2.la object so can be built in parallel with the rest of the
+objects, which can lead to interesting errors if the header is parsed by the
+compiler whilst it's being written by another process:
+
+| gen/wayland-client-protocol.h:3: error: unterminated #ifndef
+|  #ifndef WAYLAND_CLIENT_PROTOCOL_H
+
+Solve this by adding more dependencies so the generated files are built before
+the primary objects.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.in b/data/poky-tmp/master/work/corei7-64-poky-linux/libsdl2/2.0.8-r0/SDL2-2.0.8/configure.in
+index 1c7e79338..ba07a4a4e 100644
+--- a/configure.in
++++ b/data/poky-tmp/master/work/corei7-64-poky-linux/libsdl2/2.0.8-r0/SDL2-2.0.8/configure.in
+@@ -4011,7 +4011,7 @@ DEPENDS=`echo $SOURCES | tr ' ' '\n'`
+ for EXT in asm cc m c S; do
+     OBJECTS=`echo "$OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.'$EXT',$(objects)/\1.lo,g'`
+     DEPENDS=`echo "$DEPENDS" | sed "s,^\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.$EXT\\$,\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.$EXT\\\\
++\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(GEN_OBJECTS)\\\\
+ 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
+ done
+ 
+@@ -4028,14 +4028,14 @@ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
+ SDLMAIN_DEPENDS=`echo $SDLMAIN_SOURCES`
+ SDLMAIN_OBJECTS=`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
+ SDLMAIN_DEPENDS=`echo "$SDLMAIN_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.c\\\\
++\\$(objects)/\\2.lo: \\1/\\2.c \\$(GEN_OBJECTS)\\\\
+ 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
+ 
+ SDLTEST_OBJECTS=`echo $SDLTEST_SOURCES`
+ SDLTEST_DEPENDS=`echo $SDLTEST_SOURCES`
+ SDLTEST_OBJECTS=`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
+ SDLTEST_DEPENDS=`echo "$SDLTEST_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.c\\\\
++\\$(objects)/\\2.lo: \\1/\\2.c\\\\ \\$(GEN_OBJECTS)\\\\
+ 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
+ 
+ # Set runtime shared library paths as needed
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index 6966dc5c348..accea38aaa3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=02ee26814dd044bd7838ae24e05b880f"
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = " \
-    http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+           file://more-gen-depends.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.11.0


