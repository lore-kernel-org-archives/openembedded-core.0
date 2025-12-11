Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E442DD43342
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 19:18:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17903.1765480719016903217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 11:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvXarP1C;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b77030ffad9so74775766b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765480717; x=1766085517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YJ0IgtIRgVg6B/Bctev6ErXKIaUDvfknNo6JRFLSg4=;
        b=KvXarP1CmLKWnWTv4U/f22w4p5MWPYAZFLFqswx31Czd0tuYlFGSn5c3x0OX0/yG/m
         ChMf+VwV1/mga37ngrQBDwp+x62Izv3Byg1oya/FC3vQMzTCZgfCR3aTYvDs1ohP4Mb/
         XlbdTwJxVMLDfR33pKOrpnxmoGBIzCO/lMcGE9qSpL91CYBq7iMsTfrGT77qiM5q9mEx
         aPXVo3VUFq16dS4cwJzFV88qKAhOT9Fsd87JK1AcT6frt3ekJwWnvHbM/CM2uiIktH/Y
         74vMs2DfU155DHTCKoiZc2oSHDExQgywJi7BEMjleaMvKZVAQeAa/yqbA2s1XJtk9pKU
         K+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765480717; x=1766085517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YJ0IgtIRgVg6B/Bctev6ErXKIaUDvfknNo6JRFLSg4=;
        b=ZL5j8nqwvfVaSk6tBAVRLBAdDATNWMf3EE2wR2K4JPJN0/Z5yoHO9EgnJZHRSp9hX7
         QGepl8IcRAVMRC9tQQeasmaYZBiqAP1dg77TeEXjcPq7fRQ7IoALqS4OLXUg3QN3XA3d
         g395pAON1mhwhBkG06z3IR38a1wLyiJvpXVfj8BtyHufD48P3iD5pwjnWtp2VBT53dE/
         RydQX85vHMY7MczHPIqmwDEEVNFNRfL1zqeUxPdgdcAqVczaxXVL4zzChese/GmhUnXi
         /LIsF/6pDeOm4ON5a7xXAc7TB6x/hXpAlJWjVhuixz+nC9JbTvAIVCZkHgwTYi1zg2KY
         RViA==
X-Gm-Message-State: AOJu0YzfDX1dpxkGHP8vGqOuNonMQLMpfr6ZGz2+C1Kn9E/31iJDo4kI
	kXGCQZukVTe/QLQLPBr7FBHZ7y4xCv8iidA/7QY0tQ7uk18PJ3st1M8In8I/CA==
X-Gm-Gg: AY/fxX4HU47K1gx2UVl6SdlMODWd5SR0TEv9GNajC5ycpt6l3CkSurS3urQqxDqSCXn
	45aiOnu+eBGzjXz4qyedF8pmU8FVPc0xEYUqvINVOXetl1d0qbPtgZmfdp9Kr9eICWxmSnMDEgb
	+inXX3qYXUOVZqYF/JcTv+GiUIpQrLILrd4fofzmERfznj6MuJai3IdvgmRADXbbubuz9NpvBZm
	Zw1uB3MlXmUpL76mJBXP/uLgdSxZXpstFawpbqau5iZBr8aLK943OkLO4SU35KS08gaMff9wXKB
	t+hehCPbEfU4dZvxrjeZywS0KDutPgnVE9JgGvuwUtpyUq90WkKh81TqjXWqKBXa5d2NIW7hXyL
	6LU6fmCxS0ZdU6F7q0QdvC+gue4AfsTlYSON864/ebjiAw42JxdtsfPVme2XQ76RN9qMghO/K2O
	Vz3o6GggTv8loyqRyCdT/5XVZS98enJmcMIXfaJvUSCsTdqPo=
X-Google-Smtp-Source: AGHT+IEDvsQ7rQ9qe0rULU5rSl1kwFfmlhZoFqpcdPNnkHO0zh/GLZ2rWb0pN9L8BaKLos2LJET/3A==
X-Received: by 2002:a17:907:3f8d:b0:b7a:1be1:86e6 with SMTP id a640c23a62f3a-b7ce8531860mr731313066b.62.1765480716911;
        Thu, 11 Dec 2025 11:18:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51756esm349167966b.44.2025.12.11.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 11:18:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ffmpeg: fix a build race, hopefully for real this time
Date: Thu, 11 Dec 2025 20:18:31 +0100
Message-ID: <20251211191831.1596868-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 19:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227565

From: Alexander Kanavin <alex@linutronix.de>

This should address [YOCTO #16000].

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++++
 ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
new file mode 100644
index 00000000000..6af9254d957
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
@@ -0,0 +1,106 @@
+From 95f1f05409fceb8b3615fa618554667a238f99a5 Mon Sep 17 00:00:00 2001
+From: softworkz <softworkz@hotmail.com>
+Date: Tue, 27 May 2025 23:24:20 +0200
+Subject: [PATCH] ffbuild/commonmak: Consolidate pattern rules for compression
+
+This commit simplifies and consolidates all the rules around
+ptx and resource file compression.
+
+Signed-off-by: softworkz <softworkz@hotmail.com>
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/a125f5db03b86c03fffb9598bd6e2026ba2c7a97]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ffbuild/common.mak | 43 +++++++++++++++++--------------------------
+ 1 file changed, 17 insertions(+), 26 deletions(-)
+
+diff --git a/ffbuild/common.mak b/ffbuild/common.mak
+index 81e8a46..0a60d01 100644
+--- a/ffbuild/common.mak
++++ b/ffbuild/common.mak
+@@ -115,6 +115,12 @@ COMPILE_LASX = $(call COMPILE,CC,LASXFLAGS)
+ $(BIN2CEXE): ffbuild/bin2c_host.o
+ 	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
+ 
++RUN_BIN2C = $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
++RUN_GZIP  = $(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
++RUN_MINIFY = $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\n' ' ' | tr -s ' ' | sed 's/^ //; s/ $$//' > $@
++%.gz: TAG = GZIP
++%.min: TAG = MINIFY
++
+ %.metal.air: %.metal
+ 	$(METALCC) $< -o $@
+ 
+@@ -122,61 +128,46 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
+ 	$(METALLIB) --split-module-without-linking $< -o $@
+ 
+ %.metallib.c: %.metallib $(BIN2CEXE)
+-	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ 
+ %.ptx: %.cu $(SRC_PATH)/compat/cuda/cuda_runtime.h
+ 	$(COMPILE_NVCC)
+ 
+ ifdef CONFIG_PTX_COMPRESSION
+-%.ptx.gz: TAG = GZIP
+ %.ptx.gz: %.ptx
+-	$(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
++	$(RUN_GZIP)
+ 
+ %.ptx.c: %.ptx.gz $(BIN2CEXE)
+-	$(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ else
+ %.ptx.c: %.ptx $(BIN2CEXE)
+-	$(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ endif
+ 
+-# 1) Preprocess CSS to a minified version
+-%.css.min: TAG = SED
+ %.css.min: %.css
+-	$(M)sed 's!/\\*.*\\*/!!g' $< \
+-	| tr '\n' ' ' \
+-	| tr -s ' ' \
+-	| sed 's/^ //; s/ $$//' \
+-	> $@
++	$(RUN_MINIFY)
+ 
+ ifdef CONFIG_RESOURCE_COMPRESSION
+ 
+-# 2) Gzip the minified CSS
+-%.css.min.gz: TAG = GZIP
+ %.css.min.gz: %.css.min
+-	$(M)gzip -nc9 $< > $@
++	$(RUN_GZIP)
+ 
+-# 3) Convert the gzipped CSS to a .c array
+ %.css.c: %.css.min.gz $(BIN2CEXE)
+-	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ 
+-# 4) Gzip the HTML file (no minification needed)
+-%.html.gz: TAG = GZIP
+ %.html.gz: %.html
+-	$(M)gzip -nc9 $< > $@
++	$(RUN_GZIP)
+ 
+-# 5) Convert the gzipped HTML to a .c array
+ %.html.c: %.html.gz $(BIN2CEXE)
+-	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ 
+ else   # NO COMPRESSION
+ 
+-# 2) Convert the minified CSS to a .c array
+ %.css.c: %.css.min $(BIN2CEXE)
+-	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ 
+-# 3) Convert the plain HTML to a .c array
+ %.html.c: %.html $(BIN2CEXE)
+-	$(BIN2C) $< $@ $(subst .,_,$(basename $(notdir $@)))
++	$(RUN_BIN2C)
+ endif
+ 
+ clean::
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
new file mode 100644
index 00000000000..a27e30f7104
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -0,0 +1,43 @@
+From 6cd4855ea3dd62e6eb36c0796f8cd7bd4aaae05c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 11 Dec 2025 19:55:46 +0100
+Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
+ before running shell redirects into them
+
+Otherwise, occasional build races have been observed:
+https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3001/steps/13/logs/stdio
+
+/bin/sh: 4: cannot create fftools/resources/graph.css.min: Directory nonexistent
+mkdir -p fftools/graph
+/bin/sh: 1: cannot create fftools/resources/graph.html.gz: Directory nonexistent
+make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:165: fftools/resources/graph.html.gz] Error 2
+make: *** Waiting for unfinished jobs....
+make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:145: fftools/resources/graph.css.min] Error 2
+
+There's a separate rule for making those directories, but unfortunately
+it's racing with the rules that expect the directories to exist. Rather
+than add a Makefile dependency, I've injected the dir creation directly
+in front of commands that can otherwise fail - a proper fix would probably
+add the rule rather.
+
+Upstream-Status: Submitted [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gmail.com]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ffbuild/common.mak | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ffbuild/common.mak b/ffbuild/common.mak
+index 0a60d01..346bb0a 100644
+--- a/ffbuild/common.mak
++++ b/ffbuild/common.mak
+@@ -116,8 +116,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
+ 	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
+ 
+ RUN_BIN2C = $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
+-RUN_GZIP  = $(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
+-RUN_MINIFY = $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\n' ' ' | tr -s ' ' | sed 's/^ //; s/ $$//' > $@
++RUN_GZIP  = mkdir -p $(dir $@) && $(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$@
++RUN_MINIFY = mkdir -p $(dir $@) && $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\n' ' ' | tr -s ' ' | sed 's/^ //; s/ $$//' > $@
+ %.gz: TAG = GZIP
+ %.min: TAG = MINIFY
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 6187f4cabbb..5ae985efb56 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -24,6 +24,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
+           file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
+           file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
 SRC_URI[sha256sum] = "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
-- 
2.47.3


