Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ABBC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.265.1714512269699402430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ybW++mIM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2b1cd446fso52353345ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512269; x=1715117069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d46vZOKnwOnl2ZIPkKxAORTv2qaaK+BJozwTApEEhE0=;
        b=ybW++mIMIs99KVCJa2kvTGH/f0gs0aA5T+PWl3FWcrKqojyGBLDDIQq07GO13lmBlw
         PeGVzfSFmCCdEFu7hTYGuDZhX/Ef6d9upFgeh8m3HQP3TuHwj0sXorGnOD7CoANJb7QF
         3Xj11qytgegbTeIFK4BqQ65hIn13SXQggIHHiJTZRPlKaS02WqtLl3TvMMfBkGniyKO9
         KsqRV2SDSReDzE2Joohtt0IZb0XLmKSuP6mOASnKROXWkN/8N6W3Y6VJwAbEmc5WBhyN
         SZSXIChPFswsbyb013EtGfEp5GhVXzVrcE4SCPhfjrsMX6uA7NFY6kNz3IIEc/jG2jPq
         007A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512269; x=1715117069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d46vZOKnwOnl2ZIPkKxAORTv2qaaK+BJozwTApEEhE0=;
        b=fTfVtb1Ewa0doBPQSYjiJ+rXHo57ox/NtS03mhhwzDgnpryJsUQIb3tsab5oLhopfM
         mkkGcvsR+zEwPm3ohVggVZSmtYN4X++96BJyUa6bSZdDY6uJUMRijCUiMML/yFwlw1O/
         ar4QGCS0swFMSKGeCTYfJ8kauh8x1Zx5BGEVKl4S4AweItrPiOVdvdVurVGj3ZoJdH3p
         0J28MUhJ+14Fsr6Xv43HsVEX6Xa72e7V4eRBepRaLd/M8h/TE5Z9uPWSWp+Z/5sjmtlP
         TdhXN6tSZZ0Rrdpg1SQ55DQgiiCeL7yMBLZuErQelQ6tnjQjbNRLNwv/hNddPY7znQ8K
         CkmQ==
X-Gm-Message-State: AOJu0Ywe6eVp026dCjNrJdzPF1+UH+zN0ERYwbSVxHVLyHqSj6yG0bmp
	MaUD+Rzfzp6CXckOg7NVn2/L4tb38os4YBNAESLcAyFRxYIW4pcTB+BPOZklZg4rnmmkvGtDBX3
	Kj2Q=
X-Google-Smtp-Source: AGHT+IExkgNS1IyHreuGizUcuVWHetaUNxJHAdEjRr19GcsKRkGeKyeGPLkBTQwTcMw78U0nAQeOBA==
X-Received: by 2002:a17:902:ce81:b0:1e5:562d:425b with SMTP id f1-20020a170902ce8100b001e5562d425bmr758220plg.22.1714512268935;
        Tue, 30 Apr 2024 14:24:28 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/17] mesa: upgrade 24.0.2 -> 24.0.3
Date: Tue, 30 Apr 2024 14:23:55 -0700
Message-Id: <78c39ef7502f91243cf09aa20f6ad30fe4f87fee.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198774

From: Wang Mingyu <wangmy@fujitsu.com>

Mesa 24.0.3 is a bug fix release which fixes bugs found since the 24.0.2 release.

New features
None

Bug fixes
v3d: Line rendering broken when smoothing is enabled
DR crashes with mesa 24 and rusticl (radeonsi)
RADV: GPU crash when setting ‘RADV_DEBUG=allbos’
[intel] mesa ftbfs with time_t64
[radv] Crash when VkGraphicsPipelineCreateInfo::flags = ~0u
Gen4 assertion `force_writemask_all’ failed.
[radv] Holographic projection texture glitch in Rage 2
[build failure] [armhf] - error: #error “_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64”
RustiCL: Callbacks are not called upon errors
MTL: regressions in vulkancts due to BO CCS allocations
zink: spec@ext_external_objects@vk-image-overwrite fail

0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
refreshed for 24.0.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 43240c8b2c5507fe6147ba04ec98528602c694e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
 .../mesa/{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}         |  0
 4 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index f6d95c8982..1711e22585 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 25e92ea5f95..3956e19c08f 100644
+index 2db6185..741b5d1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -818,6 +818,7 @@ if _opencl != 'disabled'
+@@ -813,6 +813,7 @@ if _opencl != 'disabled'
      error('The Clover OpenCL state tracker requires rtti')
    endif
  
@@ -29,7 +29,7 @@ index 25e92ea5f95..3956e19c08f 100644
    with_gallium_opencl = true
    with_opencl_icd = _opencl == 'icd'
  else
-@@ -842,7 +843,7 @@ if with_gallium_rusticl
+@@ -837,7 +838,7 @@ if with_gallium_rusticl
  endif
  
  dep_clc = null_dep
@@ -39,7 +39,7 @@ index 25e92ea5f95..3956e19c08f 100644
  endif
  
 diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544c6d8..1dae56d1b2b 100644
+index 8d73544..1dae56d 100644
 --- a/src/compiler/meson.build
 +++ b/src/compiler/meson.build
 @@ -79,7 +79,7 @@ subdir('nir')
@@ -51,6 +51,3 @@ index 8d73544c6d8..1dae56d1b2b 100644
    subdir('clc')
  endif
  if with_gallium
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6e96190084..1c9fa66c72 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
+SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.3.bb
-- 
2.34.1


