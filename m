Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0814ECCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:50:51 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2316.1760064648114694558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xj0qzeLJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7810289cd4bso1590387b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064647; x=1760669447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab9NZq/vJQznnW0hHY5b6/mlYHgyaWdqP+fMe1xqxws=;
        b=xj0qzeLJRfPXMNb2qZq0pXplAHqL0AcEQXCg1u1BLQAw9y3dVk/YFwj0gvFF8OZha4
         JN8yfzqQlRdTwBkaAR31zjms+GI3neWSdQO5Etcg7IBQq+NebTSiBEmsw+fbthperGqF
         AqZnWjQgTRnpeUW5zxHOF33upikw0u3OMDqByp8GfalOrC3sDf8tQSFVapCr3JevMNnK
         zr88qn5DFKOJfJzuAgbLXLlqPyJiY5y6WHlyrDt+sv0g0I2HaimaUGuW6N4e+bIJU9BG
         iSFj3GeqwqQFnYijCQAzJHrK09ZVf5yrtpnfLy3Upq9s4IulQMf3+Frr+7DmojYjRkmK
         MMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064647; x=1760669447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab9NZq/vJQznnW0hHY5b6/mlYHgyaWdqP+fMe1xqxws=;
        b=dvQk6afolwQPfg5aXQB0MAoPrNNUuTFWNTlMbvBRN0C+IL6WMdgJssymO1za0RLmHJ
         Qk5sF92WPj3bT+jI4yg2io9ulg9qehdgqH4M/Z2PFyLkihum+bjBbGki3kPf4fI8zkns
         lSqYdgpFgJ7XW4KqIq33MEDZizdbeSFYgWVW/X3wpZAGuBH8uq+ddN9Tx5y6nulLEBZj
         tqYsAXAN4mRU5AnIyATEbe5q/Dbltp8RF4S3egvHU4RyePquLhgysSomsHx3OJYONSnt
         Xsys6S5XCGg9Ltw2dNjQXYVoELOG2XeWGa3mlvmGM0tGX26Vwmym588T1nj57R7uTwZX
         eAiA==
X-Gm-Message-State: AOJu0YwJwqcA+z92N6LUuIL999EAfNANqfj9DOBgSQiodUwWxrvOQIAU
	qseT0+2+3zFFpM10zhi6sQ8+xGGXB0/DPmhtKfwGVcARluYN0uptoc1gkR/G6FXQ5zc/OBG/OUs
	nl/CJ
X-Gm-Gg: ASbGncu2JgNZlEs50m8/R6/3qQNozy5euUCT+NfF3FfFn4bddEx+jeWaqQdzBEmniU+
	/aOaqh/n6qZTFlJ4lo9VfwCijo6yP4HuBKgzoItsZ0djdvkM+5kZmLcKCjlcbaTFVDCCRSo2mKe
	ffVXvi2OeHszyWdUvnmkXl0ovwBgt5NuzavouM5rY40nY8xGsq+/Gg+HY22h97w1mSZUBCFA9WC
	+uhd/e/IEN7fwEProK78qleN6HzWe/AlNEkqYYo1iP0YG1tKLRbMCpYXBaevgFIXpNeyl24mKk+
	J9atNmo7rfJlEcDH3jSuQl3c5533VkgE1a4a08tDargzuIDoRoDVq14Y4aUCh245y4c9OsnI9rW
	5LSQrGHBUc+/wvYxdxKksj1yrybDBm6r7
X-Google-Smtp-Source: AGHT+IFFoNnZseq91MMiAKL8GXvXcu/rbfO9u/jLhnFPYnjzwH95g4P6KACw4XZOJNpH5c3qG2bibw==
X-Received: by 2002:a05:6a00:4fd0:b0:783:7de9:d3ca with SMTP id d2e1a72fcca58-79387c1a74bmr12149242b3a.31.1760064647382;
        Thu, 09 Oct 2025 19:50:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/18] grub2: mark CVE-2024-2312 as not applicable
Date: Thu,  9 Oct 2025 19:50:21 -0700
Message-ID: <d005eda88dad37f31bdc59e45e20b209f3771a26.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224646

From: Hitendra Prajapati <hprajapati@mvista.com>

This issue is specific to the peimage module that Ubuntu add, and is not
an upstream issue.

(From OE-Core rev: 8d2fe3f403e6435e1ffe122a6776381090752d8a)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index fd671d88ad..edb87ef2ea 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -45,6 +45,7 @@ SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
+CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.43.0


