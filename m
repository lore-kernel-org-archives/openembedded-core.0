Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027BDC04E69
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:32 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.78394.1690740084440687315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mM+GWNsx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-563f8e8a53dso2291117a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740083; x=1691344883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DyL2bxXABFI3GHK3XwF2dO5zmtkdQkRCwHbbvHMP2s=;
        b=mM+GWNsx6PqUZ5xfO23jz5nF7hIOEHDLOyCpiuiYmnLiMXda6gzX6B64EFQKTDiTbe
         7C1akufjXc/Q767lLmMtEX9THSXyBoDNHjAqBb2HneWjOICXQA3QYf51+jYpj4Oc3PFo
         2pHGQyT3kvJ3KDOx2+s5s9ZePe2QMBq6bZGF/Zi+U1WHJC/CV2V9kEEPF9jaSZNFSWVq
         NyOyt/o3XPDzlePZqnYm71aI1bSWVYhkRR8UCioMeLkzwqUwswWcdkHrAx5sNacwX6Ze
         Ls/SrG5ZEZU7MDSKLu/Cg7H2A3OA1TL6U6ENr7QY/usCTNtXTYW7cutN926vdUFTmy4l
         x7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740083; x=1691344883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DyL2bxXABFI3GHK3XwF2dO5zmtkdQkRCwHbbvHMP2s=;
        b=EhqdGmrsMOLH6F34FWNG02eEbPp5gnkJ10D7qndf7zqTTF5O8tl0AnqGU/RV7qpvl3
         rPpL0eGO2bALCKE1ShuaVDL3DtnEuNrbvIl2F6i3gCi1z0pgbgBnZt8GtvlHHWZCvNH+
         oxwmuyU+AUf4Pi95ooXtDxNMrF4FzA9NYO70WVf9aZsfvXvzYG/hcCSZYYNfA9OxwBYw
         l9lpjMFaDng/9VGxIKXI8Dkl/G+/F9FPTjuxrVOi/XIR0Rr3r7D5r4AFqXFxlbn5QzCh
         qZVHc9hcvBTXVF0XuPY+efzSG7iyDknGBPknvnOwnZAZw80hV9R/2uYC22w38Lc0+4Qu
         MEBw==
X-Gm-Message-State: ABy/qLZRn9KDjPsa7ojesLhiRl6f31fx8n6erPJP+XpqppCcysMvLpBS
	jpOiVK+UqIXYwxHI5tkBVZsXMTRcUhJbiKEdzhgj0A==
X-Google-Smtp-Source: APBJJlFJ7DLqe27B1vEp+ESuXEEuifDr/EUErohL8KN0dBiBBgmL58zx5eAy9Ft7nww3WivzmQUGhw==
X-Received: by 2002:a05:6a20:32aa:b0:12d:a04c:7e8b with SMTP id g42-20020a056a2032aa00b0012da04c7e8bmr6613031pzd.40.1690740083532;
        Sun, 30 Jul 2023 11:01:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/30] lttng-ust: upgrade 2.13.5 -> 2.13.6
Date: Sun, 30 Jul 2023 08:00:36 -1000
Message-Id: <1361c8f4be21e41db74623dcacc92d8f02e6a2ee.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185091

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


