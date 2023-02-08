Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB738C6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3143.1675840916113229552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ou9F7OpS;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id j25so12240262wrc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vK60FKvlPrM3CbmYYQ52pkVlXTuHuTHmvAOqQRMevUY=;
        b=Ou9F7OpSRHCtzg+e3dbsRGWvJ1F/uFCRBeOW21ZoiMfSvDGPd7AGiaoVghbbLFNlGU
         nbiiW/vjdbNbEmFh81dv7h4f+nbwLPmLoutdNoLQGsO+hQuaSA9z2QGr1p0TVCkdsjOa
         NNoGxtden8WTq4x2tSxklFYwdzKk5DphLoMzqaHzIJCpu0alMtV88CQt75Yq7dwM4nHc
         9nmbM/0QZF5cpeIc/T8P+qu0qa9DfCsws4fLmngWmC4eHJ4eipcdjbj6qGwSrtqoUfiQ
         iznLrmCdR5UjTrF/dsI8cApvPEj0tPIoauuh2XYPhldG2iTPH+UOlhIXAllGLiySFkSL
         M/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vK60FKvlPrM3CbmYYQ52pkVlXTuHuTHmvAOqQRMevUY=;
        b=FpiirPt9+fRnH+4swgWsKUtsgE6+acHcAGW2q3d6UrZ5vCM0Ot3ZZKyYz68DdeXF+l
         Ytct0fzwVyt+9otbsAzM2Pj+ur+TN/VJBuXyhIjaX9BsaBs6YAShcZuA2zzGksLifcJq
         O6rW/YhEm5ukWr2QC+TCnaz9S+vS5pCUeHpZkIseAzhGkZqEhdDT9iug+4NxmE1oTkiR
         FvbZvH3l+3ymVYHkIew1lr61FmGnRVIcJAdgWyjvNeM802tXY0UjIGKp5u8+jAlOF3px
         gyiGu0a08B+Xw2dDpCc97VTiQDM1ngqq6pUeChlPr0NLX09BVfCsLPswKwmQJ6SgNhvD
         aUBw==
X-Gm-Message-State: AO0yUKXrRbJ449wFHXihVx/BuW47Wyavk3DqVR2yRUd3RdgE2M/6LDBJ
	KQpCzjZtHBOXFmd6ya/+LvL12w8/x+o=
X-Google-Smtp-Source: AK7set9OgRCvouG90pa1lxxKRI5t/tLKdMnaVUyurJFCuAwELsntR6u9sz/NCnVTROOklKNZZpQrpw==
X-Received: by 2002:adf:fcc1:0:b0:2c3:f78f:518f with SMTP id f1-20020adffcc1000000b002c3f78f518fmr4630267wrs.39.1675840914466;
        Tue, 07 Feb 2023 23:21:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/52] cmake: upgrade 3.25.1 -> 3.25.2
Date: Wed,  8 Feb 2023 08:21:03 +0100
Message-Id: <20230208072143.2930292-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176852

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.25.1.bb => cmake-native_3.25.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.25.1.bb => cmake_3.25.2.bb} | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.25.1.bb => cmake-native_3.25.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.25.1.bb => cmake_3.25.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.25.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 7da9a2fb55..b7e674c4c4 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8"
+SRC_URI[sha256sum] = "c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 451b6ebfad..d13c367e78 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 8e53dd7f6f534ad933e7e9c7fc20cc1a6cded3f4 Mon Sep 17 00:00:00 2001
+From 5acfcb2aba1a5641d390558fdf288373f5e39cb5 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake_3.25.1.bb b/meta/recipes-devtools/cmake/cmake_3.25.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.25.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.25.2.bb
-- 
2.30.2


