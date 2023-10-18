Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FCAC46CA1
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.284614.1697644122362089521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=It4mrwpC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5b837db1b26so363964a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644121; x=1698248921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tdy6YNpHFeKFoZJq+xBj6+yANRkAQHGK9MvLEGTw70=;
        b=It4mrwpCMuzrmEj8iWYdQtEJ78IFUT8eDzSOwqklWvR6VfBuUDQHTaxlz5QcpewVSe
         gi1l2qfpO7lJkK1MVJi6cNqcW2RnBVj5xBFc7uNT8vkx+o8EY1Tv0Ae8vfI1J7k0oFi8
         qSTRTQ1zkvd4X/9bviVKTRzq4XT+qy6P554nlpTXHpfazguTm23ByM02x8g1R/kNnMvf
         kEXaizP8wLWlrXP93ceM05TpwslPkXuU5NiNdqVfOYa7Ts5ARi/x9xyUWhYZdmvaR/CY
         JSbCGyi0QxBCjCmPDqAjbzULcH34u/2LBLgx8BRK3uH3G+AbgekuKPGdICZU+qSuPeEB
         PqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644121; x=1698248921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tdy6YNpHFeKFoZJq+xBj6+yANRkAQHGK9MvLEGTw70=;
        b=OihOsNtsGQb1VmqCq6h176q1tm9yshKMnLWEHdBOHEPUfFbRsbJR1YtdRVNhxSvAfg
         vcXh+Z0tRqbe+cg7yK1zzDG16MOAKqsv5phINHRqBcgyYYhalfLCJqJs5tgMYO07TgvH
         d/EWRdg+khRL3mKcpE2t6mZfk6dIvqsz5Mr1pU0gtnqnAuZlwdGMuhrfxgdaMX2E2YZG
         O2GlrdIvv6jQdZ0NEnr4EQmWpGZf96oX/LFXUUg8YHE6uvY4picfR9H7lrDnIpHE6pFb
         T/bY58gqnIAMWXKhXEEndUvnPWEXOkFTri4bGst1R3K7Nhe8hHKBXD3+/cM4Zf0O+Qm1
         f8Pg==
X-Gm-Message-State: AOJu0Yz0aAVf9NMaScx0O3R5hElHrKwY2ot5wUFR3KH4Y5S6xlXk5sbv
	1Kal6pXN5t/MRS+p2Fyzj+krYNQAdQtaYOdwFbI=
X-Google-Smtp-Source: AGHT+IHKHYPzz0LwHMz0e4Mickv0H+N69XjA9zYzyLB2ZhIap9KzXTu7lmsNkjHZyVV1wXwE7FIuKA==
X-Received: by 2002:a17:90b:5103:b0:27d:5946:5e2e with SMTP id sc3-20020a17090b510300b0027d59465e2emr5540273pjb.1.1697644121466;
        Wed, 18 Oct 2023 08:48:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] binutils: Mark CVE-2022-47696 as patched
Date: Wed, 18 Oct 2023 05:48:22 -1000
Message-Id: <bc480221d8091be460a1b8c4d023b9841e1df3c2.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189402

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils/0025-CVE-2023-25588.patch                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
index 142d201c40..9b5825037f 100644
--- a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
@@ -17,8 +17,10 @@ anyway, so get rid of them.  Also, simplify and correct sanity checks.
 Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
 
 CVE: CVE-2023-25588
+CVE: CVE-2022-47696
 
 Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
 
 ---
 
-- 
2.34.1


