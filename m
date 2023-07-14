Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B5C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:38 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.805.1689374014704595714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vA/mbRd7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so1656130b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374013; x=1691966013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DyL2bxXABFI3GHK3XwF2dO5zmtkdQkRCwHbbvHMP2s=;
        b=vA/mbRd7XrCP1kkCjwOiFA1W16AUyQrTKJI7pgt32i3E+tm3WWD8gmk2myxak6bqcx
         +OHw5aNEuOEiFW3xWG1zj9gyrWpjmlIsnKyZmofJaHPMh19Hk+/5zN3undcEpFgspa+X
         VX+wX5VOoaje7KkMPt3vKxij7yx9mLKtsykKeHz3KClpXzqJoBxlxcV8++F7EOIvToAJ
         +p+lsZkdgLykH6Sipm2joeOT3vTMC/KRNE0iytyUzWvgcxnrPxbl/odYfow1+rPZ72Ff
         7IQoldyEu53JAn3CnT0xOTHV9ttiqjq/0Mu6yGDaCxs++pPoQs6UQ/CiKn8ZI7b0VDVA
         /E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374013; x=1691966013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DyL2bxXABFI3GHK3XwF2dO5zmtkdQkRCwHbbvHMP2s=;
        b=RVMTTlZDNH0Gqk64el5eIVJDl3B3dFTAyyWK0KAvKYyjpKVB8NVq2PhJ7wv9a4Utwz
         EEzUUtogjSq+R+gQUrllkI4mry+0See/WnnhsUI5zvNbaregL+qV6mTi5oVksM++YHq2
         a8YcodTJFB/pxTHb5aaMwr3hrAalaa1qmo7ltI94LWJtmbzwIihriX2N/14FhnfyFFNQ
         8X6KRD8MP6nakpo3IO2dbOPqiOd4+aNWFyvPP6KSGvyZ/fpQlEbgO84qXHB4cTRM/U8H
         6PEdHkMkVGn92a6scBZS8ArApH/YHwoYwFwQuFlm9umJ798ovcEpAOQKz9gG/A+Llpr9
         Aikg==
X-Gm-Message-State: ABy/qLZ1ytq1bKnedQewtRkMO2THQhDJJtTnJrGuGtfQ4jg3LBdGLrhd
	8qVf98XcOX/GUl3NALBnodmwUWQG7Bopr0VkatM=
X-Google-Smtp-Source: APBJJlEanzhGT37FHd3hv/pCWV2VrudKeaC8WyXf9PRkf6ssOmi/ooxuZ/15ioXaWOOYs0ZKzDSM1A==
X-Received: by 2002:a05:6a20:9687:b0:115:a2f4:6284 with SMTP id hp7-20020a056a20968700b00115a2f46284mr4064917pzc.16.1689374013579;
        Fri, 14 Jul 2023 15:33:33 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/26] lttng-ust: upgrade 2.13.5 -> 2.13.6
Date: Fri, 14 Jul 2023 12:32:45 -1000
Message-Id: <c4bfec4b2f092bd76292ad8a03917514626a3a8f.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184293

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix: segmentation fault on filter interpretation in "switch" mode
* Fix: `ip` context is expressed as a base-10 field
* Fix: c99: use __asm__ __volatile__
* Fix: c99: static assert: clang build fails due to multiple typedef
* Fix: Reevaluate LTTNG_UST_TRACEPOINT_DEFINE each time tracepoint.h is included
* Fix: trace events in C++ constructors/destructors
* Fix: trace events in C constructors/destructors
* Fix: use unaligned pointer accesses for lttng_inline_memcpy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 656470b4b0db579308d218d1ece77bdacd168d14)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
index 916408bff0..424b0fa645 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
+SRC_URI[sha256sum] = "e7e04596dd73ac7aa99e27cd000f949dbb0fed51bd29099f9b08a25c1df0ced5"
 
 CVE_PRODUCT = "ust"
 
-- 
2.34.1


