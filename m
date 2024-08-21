Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B3FC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.18876.1724244651200159247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B64VP7LA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7142448aaf9so477039b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244650; x=1724849450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/MfxLiN6Nt25vvF+/psLlbeGudtZMYK+MrdiMSEQF8=;
        b=B64VP7LAigMaIxsy+7auXTHle3o6zoLagJHEhAqISOkobkN+kF3e96vzZaYoE2TV+Q
         eLvfY9kueMzb10gtjYFAHb4iJ3uVKGkQZjS6B4PleFlxl93HsP+GQ0t14yZat8AjJcU8
         IDbF3d4EshJ/SUqNbq+FSUEQVBFaiE+1E485e1j8Qak9/XU1Da+Yc0NjV55iE9clnIaB
         NsDU+rOuNb4lG+JeKP+Xl8y7pLv/6ASZmfB6Ls0S7/kJlbEktE50GHDu+PM0/lKuM7NF
         Dn+1su77vact0WiUkOh7P/BIHDpaRTPqbnNgpAsxHs8StDoMMFbUBF6Jq/jgWxFnR8Hc
         uEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244650; x=1724849450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/MfxLiN6Nt25vvF+/psLlbeGudtZMYK+MrdiMSEQF8=;
        b=hqXAayjYTd6bv4GsIo8sidRVqn8WIex3KpSAZr1r2+58zLLc3hnVqMAP2ABsCC5zCc
         sH+1v3d0QuTg4fig7bVIqzX7sBG80f2wCMjp63gVEN9L4XNonlGKVLOGJl2914RgIOBN
         F87kLdl8cwIEygIsPELzTyGUskKQAYhu0FaAiZmmLEvXQ1wqEa4S2q1ms7vYBj8OqeJI
         3bO6qDURBK1bf4QdfUebuH2mMBr4uFIquydW8Avkho9Zi5GXixGaXHYLTB76moA4Bia7
         v254iFfnniowHToMGTncvENuxriH3uPvVZuFy/4loYRcxlfXTGVjmOXQbzx+pEf8R87T
         xlSA==
X-Gm-Message-State: AOJu0YzmmfXD2OFG/xaGTlMq6M9FN0HE6odNSmxFLFX26EN55LgZfmJg
	e5ravlHoOfNT7VSWbBrgfn/91cZEsyYktR/G+U9xMHtewQ0CgmGVsnbUkTND7UFOYaFwoMDflA5
	rTBY=
X-Google-Smtp-Source: AGHT+IGTkaLPpTSt8aJn6AFu9DbTS+PPtvZjjqCbVm2lNqmPzRIcC62HOVkkbTwZMpZ3PEghj/cJYQ==
X-Received: by 2002:a05:6a20:43a8:b0:1c4:d14f:248f with SMTP id adf61e73a8af0-1cada1b967fmr4828341637.13.1724244650352;
        Wed, 21 Aug 2024 05:50:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/18] librsvg: don't try to run target code at build time
Date: Wed, 21 Aug 2024 05:50:22 -0700
Message-Id: <310e9387a7a89b8a2a01ecc9fe889ede16622d66.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203599

From: Ross Burton <ross.burton@arm.com>

The rsvg-loader test binary isn't installed but building it causes a mix
of build host and target code to be executed.  As we don't install the
test, don't build it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78667e67a77df39c2af417e56ebf480962ff2e42)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librsvg/disable-rsvg-loader-test.patch    | 40 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.57.1.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
new file mode 100644
index 0000000000..e56772a7e2
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
@@ -0,0 +1,40 @@
+From df94cfa4a637c229fef32c349b5c2dfee2dca3fc Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 27 Jun 2024 17:09:11 +0100
+Subject: [PATCH] Don't build rsvg-loader in cross builds
+
+This binary is a non-installed test binary that isn't any use in cross builds, and
+causes problems because it generates a gdk-pixbuf loader cache at build time using
+a mix of host and target libraries.
+
+As we don't install the binary, we can just not build it.
+
+Upstream-Status: Inappropriate [upstream has moved to Meson]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gdk-pixbuf-loader/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.am
+index 44df9c6c..fb417d24 100644
+--- a/gdk-pixbuf-loader/Makefile.am
++++ b/gdk-pixbuf-loader/Makefile.am
+@@ -30,6 +30,7 @@ if PLATFORM_WIN32
+ libpixbufloader_svg_la_LDFLAGS += -no-undefined
+ endif
+ 
++if !CROSS_COMPILING
+ noinst_PROGRAMS = rsvg-loader
+ 
+ rsvg_loader_SOURCES = \
+@@ -52,6 +53,7 @@ EXTRA_rsvg_loader_DEPENDENCIES = libpixbufloader-svg.la gdk-pixbuf-loaders
+ 
+ gdk-pixbuf-loaders: Makefile
+ 	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
++endif
+ 
+ if CROSS_COMPILING
+ RUN_QUERY_LOADER_TEST=false
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
index 4b52d4062b..ceaf1dfc00 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
@@ -21,6 +21,7 @@ require ${BPN}-crates.inc
 
 SRC_URI += " \
            file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
+           file://disable-rsvg-loader-test.patch \
            "
 
 SRC_URI[archive.sha256sum] = "074671a3ed6fbcd67cae2a40e539107f4f097ca8a4ab1a894c05e2524ff340ef"
-- 
2.34.1


