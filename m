Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6A5CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:05:01 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5709.1762455893901250695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJR/VKUw;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso1310877b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762455893; x=1763060693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeDEzAsxw7RQ/W4H3RPWtlDwPun/p/gTx2OLHhuyicE=;
        b=nJR/VKUwp4thg9Epm6kj2stUkNqfLIYHKiLtgpwK3gCR1Cs+H7RyzxQf5+8FHw7UWW
         k6xXq8X33t+T15RnKpcu9z0zvsxdD71/5a50knSSAxYnSgCCQ7ujWjW9dPEen5zzSVOA
         bTHUt+7l0blayP3UIuxczYuOVR7aQPCv64+b7Jnl5azBidoN/NhfM/utVDoIgav4+BFC
         TrxelI5jQZlXktUmC5YFOX4C8cIug7GNslVabL7A6kEqXnrBQ2NeO+w2/fl62x6zRvuq
         fNsmDQrX92hvj/ZC2JRbcf9s+t79mw4kFnxNGkczwByYSZ3YjU0pei//uPnwMRa3lJp8
         JAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762455893; x=1763060693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeDEzAsxw7RQ/W4H3RPWtlDwPun/p/gTx2OLHhuyicE=;
        b=jYKEWHyVWA61acVYOH/lk0ii8TIGUZxyDJGAnACkUtlI+GRWUn7bBIvQke1i88hma5
         0GytI3UQOS50E+ozFkB888tlQUcbBsI3c0BjnpFfslQg8kC/7dhPXdddzGjGksFuY4Vb
         DQXqtIbPaX9oOTFs2s7ZbSpf85B3ZlznPttWCSyzE2pfASnlu459iW7Em4sbMQN4xfW+
         9OEou6JpIDH/6l731x4b3XVwbyUvg3rJoBmiizad4jrVhi9LAAl6wdzaRAT99cD68MV+
         QNpLmpUwNgVygCfOBPdxq/YOSgOeslLMsja4GVvErI9H5AR7wdn/hSKXIaWR5AzyTl0c
         f+/g==
X-Gm-Message-State: AOJu0Yx9QP/2OphFOtsuaoC7tCoLpC6iA32aqHKx5+iN04WBzHHxameu
	n4wD3EO6Jhbug0AMG2t9ARo9XEodZcX8xdwB2lFQrn7QTpHtPmvDieWrQGy2LUq8
X-Gm-Gg: ASbGnct7JBJ1AaI1wYRs6DqunZfq6BNdNHV0JF/cE2nt60zDoTBmDue+/Vu0pvfMHq9
	ZWVxuvi8RZJlPUgGAvv9s1yAj4we/U8avxpF1494/HYBmP90NxS2FE6qWlS5zmnziq8CKZz+WaM
	ODi17krbbAvnZ3QCX8EhupxpMeaHKAv/+Trc7Sn/g3kJJ0a+jjvbyMaTF8GYfF44R/mcslEy00r
	SsHulo1BLcbShcE9D852w0bB1bIw7iWQVUatFLEypyJGGoxXK9jg2miIhS17BxZC3rxy4Z5QjNW
	hi9GlhHESrfSXgEOSgQp0G4xyfV7Kwk3r7/GMenIBk+T5njt8DCZViGBc1I7ABsQtlc0Mp+Qbo+
	HZcFmg0TGMWl9niFrDx/Ws8+0yRJU6fBVZ1aRm7gFmX35RlfUKOA8yOdXAxpF8FQEhdAs/fr8mW
	KXndn+v7OI2xDskSaXK7ecou3BfoismeR8S6u8eJ2w1ZteMpA/P9eVZZ0jKWNPhA==
X-Google-Smtp-Source: AGHT+IHNA63SI4D8lFao3AAok5UcYGz+KAUqUQdodHCjEKH2/oiyiNAl8IssuSYVWeJMz4thaJ8dTA==
X-Received: by 2002:a05:6a00:1988:b0:7a4:c1c4:3959 with SMTP id d2e1a72fcca58-7b0bdb85befmr733164b3a.22.1762455892812;
        Thu, 06 Nov 2025 11:04:52 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c0874bsm285608b3a.16.2025.11.06.11.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:04:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libclc: Add misssing quotes around target list
Date: Thu,  6 Nov 2025 11:04:50 -0800
Message-ID: <20251106190450.2830150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 19:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225989

Default for LIBCLC_TARGETS is `all` so a single
target is ok but when its overidden with a semi-colon
separated list to use a subset of targets, e.g.

LIBCLC_TARGETS:class-nativesdk = "amdgcn--;amdgcn--amdhsa;nvptx--;nvptx64--;nvptx--nvidiacl;nvptx64--nvidiacl"

cmake rejects it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix typo in commit message

 meta/recipes-devtools/clang/libclc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index 60909339e70..c4b4881542f 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -21,7 +21,7 @@ B_NATIVE = "${B}-native"
 # Semicolon-separated list of targets to build
 LIBCLC_TARGETS ?= "all"

-EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD=${LIBCLC_TARGETS}"
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
 EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
 EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"


