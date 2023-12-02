Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523A5C4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 06:58:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.13717.1701500278259861713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 22:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvVK1rXp;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d075359c8dso1048375ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 22:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701500277; x=1702105077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dExELja/7VH9AxECk1PvxhDOoA0pM0nvQAxcDo/zbb8=;
        b=IvVK1rXpzScyC2iNC98RgPF0Uulbz7uUeuUt38qDx/aBR+vcyNmsOkC88MlUZroo4u
         68rZBQ0p6QcCHg0vCnrSwSmeIjcdT/pfFagXeKIs+uMarhi8Ad0AAokyBe1r/bgW2T4l
         9My4+Uc0CrYhdlQOZFD+FZCNrXOYluD4JB4umjaf0OTlK0+XimkMTwGQcHsZnAWcbsoq
         akvCvAz4Ji6GQtHLZSg+A9RHpFHirVFVx7F14LEE77OaJh/ZpGApSB2vqMpyky1LQKWj
         pu+baO8cLkbg8Q4R4VQjXKKby1NwKNULMxrk72v9d1g63lRT7W3ZvPETquw5bQ1aeXpy
         9XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701500277; x=1702105077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dExELja/7VH9AxECk1PvxhDOoA0pM0nvQAxcDo/zbb8=;
        b=NPUodLX+CU354hMXWsQX8rIHBr6hT9fXmTGqapSLmuGBUVfjEDeY1B6OR32JZJy98s
         u0I8DuQsJR/zkFvM20CcsCcfcZEcgqc4IUI7qAwKdwtg5xx2iYkjY5dD2DBylITPkrAx
         upQ9HNAvsVr2ey9PxGH09ErvMwTjmjgs18x/9MRL+E1OqmiLba9kICV6G+Y/HiXkyqUd
         FnsZHzUXy71lA5VMxme7nBbKvFosX1btEonnN7T3b1Odl46z4spSSY9X25xjD+Ccw0sJ
         guNcQXp/BoZAY2fNNmPfO91MUTn0lIJ6oICWEW3ZTInBAD+fjD9uooz449Y+Mm4tQDV/
         8ROA==
X-Gm-Message-State: AOJu0Yzi4XvcJaxwgdSbIG5z+Vgznp6OqjLsyChzUt3J2tqOXwWqY/XJ
	vDyPUcFI+74lAs2KNNvxlibP4Mfha0A=
X-Google-Smtp-Source: AGHT+IF/RfOU6sgGS+GhQjx0ZTqnGCz3z4cYCXO24BPnwfHNVJoyWVTxCV4fw+Q4HMZvz3Z3K6uB4g==
X-Received: by 2002:a17:902:c44c:b0:1d0:6ffd:610b with SMTP id m12-20020a170902c44c00b001d06ffd610bmr661311plm.45.1701500277358;
        Fri, 01 Dec 2023 22:57:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id z6-20020a170902ee0600b001cfc35d1326sm1030023plb.177.2023.12.01.22.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 22:57:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest tip of trunk
Date: Fri,  1 Dec 2023 22:57:54 -0800
Message-ID: <20231202065754.3646660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 06:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191699

* f314e133 mntent: fields are delimited only by tabs or spaces, not general whitespace
* ee1d39bc mntent: unescape octal sequences
* e17b9d74 ldso: fix TLSDESC addend processing on archs with backwards descriptors
* 039d3c34 ldso: convert TLSDESC_BACKWARDS from "#ifdef" to "if" logic
* 7b6a6516 byte-based printf family: emit a nul byte for %lc with argument zero
* 8c086e76 remove arbitrary limit from dns result parsing
* 2265a4c9 pass AT_NO_AUTOMOUNT when emulating fstatat via statx
* 2d84486a __year_to_secs: fix dangling pointer
* c5459df1 timer_create: volatile static -> static volatile
* 7bb11f75 ensure valid setxid return value in an unexpected error case
* 7f3a2925 synccall: add separate exit_sem to fix thread release logic bug
* 5baf2d92 ldso: use __ehdr_start if available to locate its own ELF headers
* 725e17ed remove non-prototype declaration of basename from string.h
* 6be76895 elf.h: add typedefs for Elf64_Relr and Elf32_Relr

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 7dd949ffafd..87ac1641af1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
+SRCREV = "f314e133929b6379eccc632bef32eaebb66a7335"
 
 BASEVER = "1.2.4"
 
-- 
2.43.0


