Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4028771ABD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 00:04:17 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u86so7619198pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 17:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CbVboZGJaIYNJDuvuODFKSwy0L6VlF7UyAzlrcDcrtA=;
	b=Q41VB5x///nYrbWVJsCnX6aZuUrKrrTvr8X5cJ9CNeA6tC1/PbaIa3ViTHr9Itzi7c
	7MqOXz4wf48Iou1yV3SdsqBmIwb8KwCXt3uXkz36nVte7pqHnu6GxIo9ThxuNLjQIbKY
	gHstE8b4nnb2LZ3tt0gVPI+gMgKyY/r5IxCz5UGvwRBTL1PQW5RnZ112sjNgzsf9FQd3
	GQ5yjUOP9pFtrbw6ufouEgMaU3tf237/CuX1399ofmPH1Hlg+2admDOUp/DGxRGN0dKY
	II7vRnuRX6GFp4xmDw1ZFe6PQwhhte13DAggwPScj4pcld6TL19iDjgmFzL2Zg9XjoHS
	osBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CbVboZGJaIYNJDuvuODFKSwy0L6VlF7UyAzlrcDcrtA=;
	b=fPLomj+r79/VtQHquMrkQuk6WVZaaBP1FHtPB7ZLVhl/+lGq6AtWxg09+IlcYFUGoM
	DN4XI2jjDNIwOtYPZwz+tje+uc0yDMEG04eGtHLWCUtDVuMpBBmhWHNNOmFxhcn9sLQT
	ZJt9ZDLaJEe1RK6YJPR4WXk6muOMgp2aN0uinjALL+Pyx4TFp2z0PauB+CkZgUbH7xYA
	CgTUd2PmM5N3dXqpvHpxclMyh5z8dNfJc/3vgV28trKAngFurrHlGDEdWy9XbVJa/oFB
	B8MMx4ICT3dlO5lsypCl8HBwEoQcnjfqBOTfE1QMd+fHfRP34BDrOuHKCJgWFPVxuyJj
	jzsQ==
X-Gm-Message-State: AElRT7GhJEwaTfyDT8V8bqGDCw9RkdE8GD8+XsjUNAgqFZBsGeazdobg
	Hh4Ws9OkZJDRncnjztgP/prR6A==
X-Google-Smtp-Source: AIpwx4/Kz03f6bzs97L1RaLCRieFAX1JzYsztxl3MwjSHJpcoMadDgw6A66JwOMcFmDNvyKTT0qNMg==
X-Received: by 10.99.55.93 with SMTP id g29mr2836589pgn.161.1522541058756;
	Sat, 31 Mar 2018 17:04:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	f7sm14776483pgq.34.2018.03.31.17.04.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 31 Mar 2018 17:04:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 17:04:10 -0700
Message-Id: <20180401000410.8314-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH] nasm: Fix pure function warnings
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
X-List-Received-Date: Sun, 01 Apr 2018 00:04:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rop-pure-function-attribute-from-seg_init.patch | 27 ++++++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |  4 +++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch b/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
new file mode 100644
index 0000000000..12ae3a94df
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
@@ -0,0 +1,27 @@
+From 77c3a77210d8ca8b94e999c711156e984a8dc737 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Mar 2018 11:05:33 -0700
+Subject: [PATCH] asmlib: Drop pure function attribute from seg_init
+
+seg_init returns void, so it is impure function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ include/nasmlib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 79e866b..b80b7e2 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -191,7 +191,7 @@ int64_t readstrnum(char *str, int length, bool *warn);
+  * seg_init: Initialise the segment-number allocator.
+  * seg_alloc: allocate a hitherto unused segment number.
+  */
+-void pure_func seg_init(void);
++void seg_init(void);
+ int32_t pure_func seg_alloc(void);
+ 
+ /*
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
index 3a47fc9c88..236d7e5e36 100644
--- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
@@ -3,7 +3,9 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+           file://0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch \
+           "
 
 SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"
 SRC_URI[sha256sum] = "63ec86477ad3f0f6292325fd89e1d93aea2e2fd490070863f17d48f7cd387011"
-- 
2.16.3


