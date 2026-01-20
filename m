Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33765D2ED16
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4161.1768908271185082069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AVfwwDE4;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so47320965e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908269; x=1769513069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ka4VfRrbTEdIjhOQzmp+kFlQeiNqXiZkdU1c0mYem4=;
        b=AVfwwDE4pubPUNs/26GGQxAnE/MoLOqYPWLVTzGeQYRb0N0fyMY9gdNu1wVkpw6pI0
         WQrNhhULhNNz1QN9w7klthdq/t5EQtmN43xfS1TzR55I2E5UuT6kAq8gfuVTw5ObyPam
         94hsa6dKMjSX5L5clLdhEkt+bZrSB3TGRIus0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908269; x=1769513069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ka4VfRrbTEdIjhOQzmp+kFlQeiNqXiZkdU1c0mYem4=;
        b=iBQFoqCKejI4Ee4PwVNk7Nt2eoQgGyrdVJKj/rsMbFoiYGUdik5v+N/6q9KJ/xfB1Y
         FfZKOMi0Hk93fZZrD1ZIFAJmQgKuJfLS9qNKI34auLfUIeh/ioTxzahxkPI3plK6AKQ9
         7mfz1TtgwVNZhUOzGZquuPJxypZpFrrDFlaQJzTRu0c0GllAuZUCrHZa4Q6DvIi3vmrL
         OjmNlTSUY0yO2nbxgmHqz+L0J7IxN7AjfQOV1DuyrUriEPM2FTdQyZT+AXmGSCrh2o2i
         oHuPf0ocHE/CsmbGBvTLx9DlFQRYVaR8A2EWAjCEaktVa6YGob5CLz+Z87ZElk+2zThU
         5qpA==
X-Gm-Message-State: AOJu0Yw00lq2gfyO3SrN816RqomNAri+zdyV77/CfQnptiM+ayaTOfJ2
	zJpdFV9cHRq1S5e0vfV5I2AkNPagG8swo1D08kDqErd6i7GQzgE0zp3Z3JXcfd0/9e9UOGoR6LW
	/4Dqp
X-Gm-Gg: AY/fxX7iZUo48xkz+KxkHpw2+6pt42H9TPaPb6IOGRjQEnHT2G7YcBpOvWk37mmTrmR
	kJdiY126HP3ydDobpRswB9bPONYBVZ+JjeS+GvJ6Q3c1nhUlQ3FNfhQUYbcNBKS89wx9jntS7l2
	G6I/BAfRgHslo9pHzlTC3+BO3WHLfoCFd9u1MyJH1h9Q6nFFXlotzypEKrkIf2+7z+Aq+zMsNPD
	Git9u9gMduOBOQodMhW77t4FILiCXj37hQpt50Chx3swS/1PEyR3XYbKgTEfxVuXF15kjjeIweh
	tdwadNwtoWcp72bOuLts4hkxqYVjdovldTGnpDhvoEIgjQOgUVq/zEVJXQExS/nodvSq1eX72H0
	rOL5I72VR6aaWK1mlvJAo5g5YVM7/6ygNoGYTI6kQQxE8U1sYrB7My5ulr0zNA1uTBl7RQATZ9i
	DHuC2m+L7yhDB9YpnHTDT1aNu+E+66Rqvv+W3cZtjBoGTis8y4nnGnQKM4HzBE4O2AHu9cIUlht
	/aJeoct+c4GtSawIx39AQZmiwq2/7dg
X-Received: by 2002:a05:600c:1c13:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-48028a65fb7mr125999795e9.2.1768908269287;
        Tue, 20 Jan 2026 03:24:29 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/15] ffmpeg: fix a build race, hopefully for real this time
Date: Tue, 20 Jan 2026 12:23:52 +0100
Message-ID: <21ecf1b5a0b6b664234f6d3bd39bf411ef57448e.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229667

From: Alexander Kanavin <alex@linutronix.de>

This should address [YOCTO #16000].

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86396b85b4e8f6748885710e50428271cd3493a8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++++
 ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch
new file mode 100644
index 0000000000..6af9254d95
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
index 0000000000..a27e30f710
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 5e8d7bde55..fdc16598d4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -24,6 +24,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-fftools-resources-Fix-double-build-by-disabling-.d-f.patch \
+           file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
+           file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
 SRC_URI[sha256sum] = "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa0be2d60273d27b8e"

