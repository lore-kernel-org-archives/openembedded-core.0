Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D709E7D0DA
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.16341.1695367477428608953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hF4qVmsu;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so209101466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367476; x=1695972276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+UZzaI7LvdM+a2TXJqEqMFH+eJ1nOwS2KKwa0m7J2s=;
        b=hF4qVmsuANDgE0hpN2ChiDjLAC8Ykiow9VBaC3z/L/YYtmT+f9CTcawgLGHdRrJQBn
         zbKSjtAgvYuonnzWcnyg4ckqzluHYfajrsjl+f0ONf1BkMhmMw4j1kKhcaCgEOjsNbIM
         dFp0/vBskJYIwnUGwcJFWfriQawHoThBWP1z5Hqo3In8IP0nFlRecvJdz6BesF8xaXkN
         MHsk2K56iP4E/ao2W4s0V80XVoLe2Gd2ax9jQmZNzb9CupnEk4Se19bXXLs+WICgpBrL
         XzMMxPVhE3XLsFyu0mnKztNZx369jOTJG2zYV/rGa3c3TikDqG1N5bSrv/8qo4CRlovW
         fVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367476; x=1695972276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+UZzaI7LvdM+a2TXJqEqMFH+eJ1nOwS2KKwa0m7J2s=;
        b=wiwl5YnT7mfQj9M6VK95hSTRDm37tdUFTsEECNM2FNJHuiXakSZFXCIrIvGRoXZG+b
         1XnCOyt8HcWbHchmXsAlqhwidMleLcSU5pnfWE+W+cY65rbdPE/PAjSMUsurDPm6EA9v
         brgZKoE0a/prDj2e0rA2eg+cUgJug/bSzjvnv5VCvf2oSjdDEepl/wdltBWAy2cMK9PO
         Gfes/9eOwp44gdjJKP1AlZtitbJ4LQItUkI2DO3i+DSU7FapGgl0NzNX8jZaing6HFAK
         MH7unCrstZr+II8St5tvYu+I9w5FDihKZ8uGRYVIyOw44LaziMU6o/gw8sDC8WdKdxQK
         PEJg==
X-Gm-Message-State: AOJu0YylU04TDyXfLcEiCZfiYIj4jZ23T++/Y/M6UNiqV0xvqKR33Das
	/gVRgt/2TWGwJ5TfY1r/lun6lLE+bdU=
X-Google-Smtp-Source: AGHT+IHk9edQKOcKKfDUv6Wdh7MCy7bmCKWY42jSTOoavH9MvJ8QK36IhlAARKMgK7NOdoHYrTTGUw==
X-Received: by 2002:a17:907:78c9:b0:9ae:552a:3d46 with SMTP id kv9-20020a17090778c900b009ae552a3d46mr4450927ejc.13.1695367475917;
        Fri, 22 Sep 2023 00:24:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/40] cmake: upgrade 3.27.4 -> 3.27.5
Date: Fri, 22 Sep 2023 09:23:54 +0200
Message-Id: <20230922072431.1481743-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188047

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.27.4.bb => cmake-native_3.27.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.4.bb => cmake_3.27.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.4.bb => cmake-native_3.27.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.4.bb => cmake_3.27.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.27.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.27.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 430f13f4e17..ef4eec5ab1b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af"
+SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.4.bb b/meta/recipes-devtools/cmake/cmake_3.27.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.5.bb
-- 
2.30.2


