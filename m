Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952E6C44502
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156298.1783358239813204284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JXbG1Y+E;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b779003fso16592895e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358238; x=1783963038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHu/XNiNciyFXe1tZesMGeLw1VRxsu2RZPdm4a2Ftpo=;
        b=JXbG1Y+EGSzAgVp60hEFkN9sj40CsjZk31rKbhE6M7A8YcXNzLwMO3SZgwcz4NF7hV
         LBdc/aq8I55ZgBNCwF8y1iVE7zBrgRYlL8Hw7M45tTpm3owdNncGcscKCMDKYVsDouZ7
         YwinhTa3wxps6LmOCnMyyydp4L+FZ/IOnnkBpRtbW5a6qT1zxiEVBxqFrR2ARLOYkFIi
         eYsvhYRBtSif5UPnSDS2XdVK2fsZrV2Udt2eVqyavKW0B86yqTRJ+BNmD98KPkX5DvBz
         22HuGqbssvuIbXza8dXHH87P0HKuluUQ5kv/buv3pppCHVGs7sVZvXWBVv4NKlovCH2G
         qqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358238; x=1783963038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHu/XNiNciyFXe1tZesMGeLw1VRxsu2RZPdm4a2Ftpo=;
        b=IDqs3aySFd4FXDuF7tCtGAXiV5GOS96S+YDlRXuztIjoYvpr7opBPw0X/yAz8zAiEK
         X6V3k6da5rIqik2a6FaxjTavSLCQGJkGNmrFLc3bUmoPmF+/3OCH69XMIn7ihAbSVNyg
         c8eNv5SG0wuf6RFSzIQa7+iQ35xlU7N/ybhGOCtRHuj531AqYXYO0p+nA++Sfn1+If8k
         bZ12kLiS4O/puijDCSCJHEtoPv3tlh8/VAS1So+UgL2sgEPigjwqIJmPjUbgaG0mHs3U
         iwr9RAuwEJqCH4vuT4PFdWazXg3xRL2/tFvqGk9B8THqmqoc/YoEFk8/1xNVVhmKebt9
         0rCg==
X-Gm-Message-State: AOJu0YxuI6S+qgHjx+TMV3IaIk2dhSNj3/8oapT9yRVBYSo3ajZwHnu3
	YDZU7JhShj15+GHVym9rTWdkyuu/MhpkxZzBEcuT9bAGBTI6ekPIrpRC2TXEHg==
X-Gm-Gg: AfdE7cmoSL5wfH215VLlEP9cOUEvryCoNdJ2dMQE3E0ac8tUfxr2KddqeITfumQpKT0
	hQnn5ZZBOfcItvNA9YVWx21tDnYUyPHlpNdzOkzKxzE+ezSItN39n2KSusGbT+rCBDX3of4g6xA
	mL0CWsM80e2aJqZqD11pTrGFbQay/uZD3uZXKcX+p/BaaRz4iCfLa5DTKf+YYDiU26s39s/em5i
	zoPTzsKCzKGdO1unNyI0gRjtRXUVq2MmBYzsjI3fMcYBZ4dZgKQ719Vp7iBvtba86N3t9YcMq9r
	zv0UuRD9qRqiBnxyAzOA0yrKk169NIBQTF5pfNL4q6P5UCvy9N9QEnUA8UjJrLGe13pEW8phlWD
	cFI2KNXaLUjiRmfxFI79AWxtxQP1ut6jeHI+1ARr3OTCPPVxhL28SP6CygfXd4U3/pTwEtc4UBE
	td6P9tVoqZ3/le13OQkJ3ItbE+yofn+OzdfHTSTBpGeccbIdNn
X-Received: by 2002:a05:600c:820b:b0:493:df58:42b6 with SMTP id 5b1f17b1804b1-493dfcfa776mr2311505e9.36.1783358238049;
        Mon, 06 Jul 2026 10:17:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/45] iproute2: upgrade 7.0.0 -> 7.1.0
Date: Mon,  6 Jul 2026 19:16:30 +0200
Message-ID: <20260706171701.70536-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240302

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../0002-include-color.h-add-missing-include-for-types.patch    | 2 +-
 .../iproute2/{iproute2_7.0.0.bb => iproute2_7.1.0.bb}           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_7.0.0.bb => iproute2_7.1.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index efca33b6cf..1d3fc5bb40 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From c32fe3424c067baebbf6c263886e04bb99a5af77 Mon Sep 17 00:00:00 2001
+From dc1db1129a98530fb44b3d1a448e991adaf5b066 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index c5c7254c61..2078e48d8a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 2289366b53c5bdc117907e88578d24d2007fd035 Mon Sep 17 00:00:00 2001
+From 5c7bd395e9364a1c7c9370680ff265e50cf2b2b9 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
index 15f626de3e..c5944f2e54 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e"
+SRC_URI[sha256sum] = "fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.3


