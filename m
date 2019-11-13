Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E31C7F7C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:34 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r18so1571188pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H9x2lX1T5aqKy+sjRZ4iPGRy8y8H54nvfRnSRaedWlI=;
	b=fvmaG/4I6lnl8/+Pf566rIxfvyT2mwFMxVtDCgU2JR+YCp81L2t4mRKKDn6/Kp3Hwl
	HLpi35DDfB+t3/ApYUXfOU+NcidPItuOEbBmc+q/C69rXz+bjDpgSdmkYeMYIjwh0xEy
	7PpesJZKC21niunIl5WHvV7LIPuMQUwfZ8/DIsbcElKk18294a+RMyADTCGUkqMoi/G4
	sg8B6wWP+wjHxcXtYwp9OB69T3izVelaSfpYYzCnskv19ns0b0ORfzlMXacsTetljufs
	05vBiuFndKypZXEnBu+FQT7p9oXLlbkOSRvBKwzA86t3BBv45jBi8QjWzI4MLmnzGXdq
	/PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H9x2lX1T5aqKy+sjRZ4iPGRy8y8H54nvfRnSRaedWlI=;
	b=YUyzSEIqt/LZM6k3VMUqijOi33UAMRD2GkJf1IKpz91FZRsgSAAAsGHsFA3bcKndeY
	4iimwK9IF+SsG94cQmH6nq1taPotYdvwVajYD6Oq4nwZ+iBooucdsT0a7fZsXUssXyt3
	VMnchu1GPVzTdAgbXBh/tpkEuxboGH/W+eTnEdjoNpM1dOCQ2TT8CkJvT4LvKcLKX26N
	G+mG2mkWgIK2T1Ku1nXi9z+SGtIsx+EWc4YjWcCq5tysbufVaevPNioYbUhCySo2D7jg
	wNcda1srV6PlbmC6cCATKIPHWI+t6LJDjmwyViZW9cxoiTEG5YN8laVowY3e2HeKhGdn
	hUNQ==
X-Gm-Message-State: APjAAAU6SXw3QXCjFqrovlqgEuuCmBR0y8nB9clgxubRpd2n39J4RbDR
	QjoZhGPqnIh1ZtPUoaAoSdhdgmag
X-Google-Smtp-Source: APXvYqzl1CM5LefT/spIAKeSlHG+7nFYuxfAdiEMfvwRis/KhoUvuCzizw2uu9jiqJ8WbIZ0+lC5+w==
X-Received: by 2002:aa7:9589:: with SMTP id z9mr917656pfj.184.1573659155369;
	Wed, 13 Nov 2019 07:32:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:52 -0800
Message-Id: <4e3e8d8270f318e6384c3d9bb5f6c7503f41d736.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 10/31] libsdl2: fix race when building in parallel
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:34 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...heck-for-build-dir-when-building-version-.patch | 45 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
new file mode 100644
index 0000000..bba3a6d
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
@@ -0,0 +1,45 @@
+From 6a4cc6d0a53402f646045c2994844237d978f9b5 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Fri, 8 Nov 2019 15:07:22 +0800
+Subject: [PATCH] configure: check for build dir when building version res
+
+Fixes a race where we try to build version res file in build directory
+before it has even been created. Prevents errors like:
+
+/bin/bash ../SDL2-2.0.10/build-scripts/updaterev.sh
+/bin/bash ../SDL2-2.0.10/build-scripts/mkinstalldirs build
+mkdir -p -- build
+x86_64-pokysdk-mingw32-windres --include-dir=/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-nativesdk-mingw32-pokysdk-mingw32/nativesdk-libsdl2/2.0.10-r0/recipe-sysroot/opt/poky/3.0/sysroots/x86_64-pokysdk-mingw32/usr/include ../SDL2-2.0.10/src/main/windows/version.rc build/version.o
+x86_64-pokysdk-mingw32-windres: build/version.o: No such file or directory
+Makefile:692: recipe for target 'build/version.o' failed
+make: *** [build/version.o] Error 1
+make: *** Waiting for unfinished jobs....
+touch build/.created
+WARNING: exit code 1 from a shell command.
+
+Extension of upstream fix:
+https://hg.libsdl.org/SDL/rev/99d8b18acf8a
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1aea11fbd..186229ab0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4177,7 +4177,7 @@ VERSION_OBJECTS=`echo $VERSION_SOURCES`
+ VERSION_DEPENDS=`echo $VERSION_SOURCES`
+ VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.rc,$(objects)/\1.o,g'`
+ VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.rc,\\\\
+-\\$(objects)/\\2.o: \\1/\\2.rc\\\\
++\\$(objects)/\\2.o: \\1/\\2.rc \\$(objects)/.created\\\\
+ 	\\$(WINDRES) \\$< \\$@,g"`
+ 
+ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index cdc8650..ab514f0 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -15,6 +15,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
+           file://0001-configure-check-for-build-dir-when-building-version-.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.7.4


