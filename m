Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E337C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.101.1667835416176483666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GASKwygM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso14958449pjg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KajuL30hsAoaOkFZK76V8+HXA6IbOPtP8ITpn2R70q4=;
        b=GASKwygMsEqwlXOjQ6ZsCLHzSE5Sfa3i8ZHylpkBqWQd78/ixv0fiD0Gafwb4oBiSF
         9wEDXx1Ec0AtoNJsXOF3ehngt/NKkLRUu8ibso0MvIJBYr8RezLeKLb08vkivUAs/xHk
         t2hn66xtGMnzBXk2c57j3z9B14QVjS4bxU8dLP6H3egoF/8s3m6EdI5UXcfmaIB6qdYN
         LYgGXVvmuU01VqKpIYjU222HQP/BZPXYZ1Ht0TTc4lb2KZxyxcUIJSivJ2bFBNNOMxGO
         lumRHjSo5YQECzF7WDB0CnrT12GXDovgaTGCbsGOZ5xywCmHMgA46BO+FjwuWG/E2LFu
         Xp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajuL30hsAoaOkFZK76V8+HXA6IbOPtP8ITpn2R70q4=;
        b=dIHTwx5OzXj8WRd1Q0/7TVffW8z0PoBfgAyqosUEjqQ52XdBlMHCwtJiH+oNKbbJEp
         fM4eWzHAGJ5QQ+SBZm4+4NHAWAan5PIKRF8ezOvzIivQMcTnjr2YaQJ16GF4vP+Jk3JE
         2GZgrH9oHMh6T2gQHkPSdZHqvIqztl5CXsyOfWTMwbDENjz1IiIkiLd75FAqiWszevW/
         eEFAOuisbnwqV/cP5W6HMyTKBvzi3H89wjRM6CB2n0h+DmZNd+IIqy/EOPDjeQOmI1Zb
         z2SZ+/VR/mJN+l8zrByHX47OMnpdmMQcXjlDjCQ09mvUEQjZ47TLvZuWeJGApasVgEij
         BVdg==
X-Gm-Message-State: ACrzQf0//NbeQc75pgD5j9cpqkc0piyntKk+hYG/2civ5w4Q0vEf6OTQ
	gXiKMOix6scdWixE2RllVp3gHeGjbLsTZBXO
X-Google-Smtp-Source: AMsMyM7+t9h9UkkFNE+L1PTfde1+eyak3u5cC7RE6F64AIEFdG6bQkrHSNfaz13ClUCx70OlYCznDw==
X-Received: by 2002:a17:902:d50d:b0:187:2cd8:3de with SMTP id b13-20020a170902d50d00b001872cd803demr37987367plg.67.1667835415027;
        Mon, 07 Nov 2022 07:36:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.36.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:36:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/25] libcap: upgrade 2.65 -> 2.66
Date: Mon,  7 Nov 2022 05:36:20 -1000
Message-Id: <003a81171366956c899305ca9adc352d3c99c964.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172900

From: wangmy <wangmy@fujitsu.com>

RELEASE NOTES FOR 2.66

Fix documentation typos in cap_from_text.3 (Bug: 216514 reported by Paulo Andrade.)

Some getpcaps code clean up and a fix for PID argument parsing from Jakub Wilk.

Slightly more robust Makefiles to address an error with make -j48 test observed by Tomasz Kłoczko.

Include a simple Go program, captrace, to trace kernel capability validation checks

This program can be used to figure out what capabilities a program needs to operate.

captrace (a wrapper for bpftrace) uses BPF kprobes to monitor the kernel for capability checks and whether or not they succeed for the system, a specific PID or a program's direct execution.

Trim down the default file capabilities for contrib/sucap/su to those actually needed and set USER and HOME environment variables so bash doesn't complain about a sourcing error.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9040e612084a561b1766bb86c9c002b811eea4c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 3f4c7e57ae..8bd2050ea5 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 1c234bc39446eb9b23896e85dd67b02976d46c3d Mon Sep 17 00:00:00 2001
+From a3196f3a06e7bbfde30d143c92a4325be323b3d0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.65.bb b/meta/recipes-support/libcap/libcap_2.66.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.65.bb
rename to meta/recipes-support/libcap/libcap_2.66.bb
index 8013d40769..c50e9d8cc7 100644
--- a/meta/recipes-support/libcap/libcap_2.65.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd"
+SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


