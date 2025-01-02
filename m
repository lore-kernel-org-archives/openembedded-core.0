Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF74E77199
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5198.1735810880679894857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIU77ZOp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e0e224cbso5626668f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810878; x=1736415678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HsIQZwkX6ctXAqNIriD3spbB37gq6f0xVWPKk1dDJY=;
        b=CIU77ZOpI8XKzFeZasZjredmNpiD0Du2+Fwi5Yt+NM0SD8SCM7ZcLfdDDc5eEDr3az
         H+FJc7GVO9K+SbuvPP7zkGx0guFHXYrbvOOidpiQBNguFUteIfn4lpgSsbOW3REhLKWs
         yzXm3Tzn6EwEoYOBTHjqwzaFnDmPMOQK3mk5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810878; x=1736415678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HsIQZwkX6ctXAqNIriD3spbB37gq6f0xVWPKk1dDJY=;
        b=XklOdt8Uf2fM8yXusfVyMv9CGy409XQ2SHr7la5Ks3m17jXOY1osdgy9ZO+UDn2v2P
         YtlVOZ4XzuRFv4vs9d555clr1nt7BTPhVDoQuH0btnOHv8j/WnfMhT4AbConXLA04rrk
         Ie0Mopy+AIiuGl5517aTx+9SHjhcKGxH1QIQNC6fDY6NxImMGekd5UH808SIXMRhcgvs
         qyl85ywomRU6OHCREWjbsBsoD17JITE47Z/QeiK0A0ImOhzjCEhaSjK6GT4Wb16ukWCV
         HZ8wYK+p33XnB5rqIqnxdl5exlr8VxfSnDLDTpFzellKSnkLLpPWZogBuntOBcFgW5We
         KAxw==
X-Gm-Message-State: AOJu0Yw53hqU0PQGCyCnwsGqVpYObs62D2xx9+aiKbnTl4tTMgy93LkO
	ENCeLWD86gqvi6ovNsxtk2cJgpSPkMPtgmz7StlT2A+5KcK8w4fhCnKbL017gXBB3ywbz1e0Zi9
	3ZoU=
X-Gm-Gg: ASbGncu3pvJLhwxEMHulZ2zMb5xKK0gH621MIRpw/PsHss4rs9j6GKAFiaXZ8TYKfvm
	I2J2eilE3GQx/l2Tju+OWoGTMW2guWi5d4E+ufkUyn8E2Ww2RTZRhlRctUSpLjtvpY75D+JyjxJ
	ZhXlIbuii4MsCxJ9b075I9VlYPauBmxPTU+Hj925fF9iXkyTXJ7AqYV0uE/RGoBHgcYu+RZNrti
	JgzCrjid1J1zmMOr+ITkdV6FoaOXIVrrhoJqvgHy66gieSc4vx1HvciK88z6UNRd1paQxKKIC7w
	AirvITgvbw==
X-Google-Smtp-Source: AGHT+IFU12QFtFRCrt5RjXBvGY3ik31H877qQgpQZ9+f3cWLYT74T7ySVnalbQ6QoTiU46haSEzAyQ==
X-Received: by 2002:a5d:64ad:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38a2220088bmr35535731f8f.32.1735810878430;
        Thu, 02 Jan 2025 01:41:18 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/21] piglit: upgrade to latest revision
Date: Thu,  2 Jan 2025 09:40:43 +0000
Message-ID: <20250102094059.322187-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209272

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Lists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 ...0001-tests-Fix-narrowing-errors-seen-with-clang.patch | 2 +-
 ...-egl-spec-make-egl_ext_surface_compression-cond.patch | 9 +++------
 ...-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb               | 2 +-
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 0c872d3e9b6..75c2d2fbfc3 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 2af98d67e16e083c36e3193aefbda942399a455a Mon Sep 17 00:00:00 2001
+From db3a33a91ce0a28f297fe270167cf2d0a44354e2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index cfdfeb683e0..22dd6c360a0 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 70f8d56bf9db9d85f3d197ab9de972e3a514514c Mon Sep 17 00:00:00 2001
+From 6559f5a7d82d411eb035f9d7c5dfb9987182803d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 69cc302912e..c9e7fe1e96c 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
+From 8320c2ff5793a612aa7d7223ae317657744169f1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-index d9540bcfde27..01a70164f444 100644
+index d9540bcfd..01a70164f 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 +++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 @@ -2,10 +2,12 @@ link_libraries(
@@ -39,7 +39,7 @@ index d9540bcfde27..01a70164f444 100644
  
  # vim: ft=cmake:
 diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index e3d55d4331fb..35f13fd007b4 100644
+index e3d55d433..35f13fd00 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 +++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 @@ -25,7 +25,6 @@
@@ -50,6 +50,3 @@ index e3d55d4331fb..35f13fd007b4 100644
  #include "../../egl-wayland.h"
  
  static enum piglit_result
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 17bcbce1908..fd085da220b 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 9b2c2213a2d7aaea350649ee031e227b44343428 Mon Sep 17 00:00:00 2001
+From 29033f323d870552410c31d1e3721304b8a38e99 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 767e93c43e1..ce1ce12a071 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 3d621cf028acb3b464759abb72a38102844079b2 Mon Sep 17 00:00:00 2001
+From ddd12c056bf05f80ddd728750a519bc502d55f3e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3e950ff61c5..829cb7730f1 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d04d6fff00849a2a8e29ef3251c6ca04a2f68dc7"
+SRCREV = "00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 

