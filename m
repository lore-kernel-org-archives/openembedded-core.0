Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DE5CA0EED
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 14:38:40 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.26712.1694529519037737371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 07:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WQOp6AnH;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a7e68f4214so4324680b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694529517; x=1695134317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=std/fF9BCG571Crc/kp7Mdl1Zu8nvZpHZ9pKUSf+FHs=;
        b=WQOp6AnHz3neGeek2ytZfS7w/LJs8DDDVpXqbEWcyRfCfhWBC7LjM4WgsQKxsF4olC
         8i77rTtu5DVWm6VmNVsEqbM0nQYilsOunhWqwstKLYekgfYJJA62Rb8wcUfiZcErowye
         bBJzZc3cit/Vvsko7GpQZndGa16URXCfdznDmmSan+BcZoaLNuK5h9tfFJnqs2R0xS89
         Cf3wuI2In1OIfE+bPb16m7ZAT9JJki3JEmVT9vk5tSV+onUi0Vw0xyf1XZwJWnEiuRiL
         onzVCwVNy46pPo3ZPqs73ANz9MIT/qGLQBqkRbIFpaKIdnYXFIXcw+V1v9/jrEsj0YUz
         G0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529517; x=1695134317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=std/fF9BCG571Crc/kp7Mdl1Zu8nvZpHZ9pKUSf+FHs=;
        b=fYoRWexaGsF5hLPrO3XyVR5dcfPay7933Aceuhwsl6srnuVvsx7dY1xALzmD11T3Nj
         sDyeQaJ+pN70Yh5KJR1APofu5zmg4nYO3CWi50Rt0jFMNjiIm15MUqRWDyzC0X5icc+1
         5eM6xKrxUmE389w1WA1dGUqUeuUfQ0jbXsoT2Rlf+ywUUXVoOtNiSgAF0UHFx0PXM5er
         UYZuetyFt3utMWJO+vcQsL5QTv4XdLpjw1/Qnd6jr13JA3FqgTA1jTER5AXXKfxdkp0e
         w9ztxTBaBzwzG/r641XelaGLNz+AVLZEGnCij2atx2mCFLZjnWZIemJCMHkZkTnAxFEK
         rwkw==
X-Gm-Message-State: AOJu0YyEbP14HCoSKsx5u1NtygQiLCLx6C6RsovEoSBGlVs0N4UQlTa7
	loUN3PoHWmE7FOQFUFFsOsdWbvuRnyg=
X-Google-Smtp-Source: AGHT+IFsURMG1xysQrQzk0xM0PmVfeZ3xQ1utTVaSQZXhFhwFRBOoM4Dx6wI33HtsbS1aimN/HaxqQ==
X-Received: by 2002:aca:2803:0:b0:3a8:43d5:878b with SMTP id 3-20020aca2803000000b003a843d5878bmr13316020oix.2.1694529517679;
        Tue, 12 Sep 2023 07:38:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::88cf])
        by smtp.gmail.com with ESMTPSA id z22-20020a056830129600b006b922956cecsm4107358otp.25.2023.09.12.07.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:38:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Add extra debugging for missing package files
Date: Tue, 12 Sep 2023 08:38:33 -0600
Message-Id: <20230912143833.1527597-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 14:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187531

In a effort to debug YOCTO #15185, improve the logging when a package
file cannot be found in the list of SPDX files.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 844b674f6f1..3aa629852d8 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -302,7 +302,8 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
             if file_path.lstrip("/") == pkg_file.fileName.lstrip("/"):
                 break
         else:
-            bb.fatal("No package file found for %s" % str(file_path))
+            bb.fatal("No package file found for %s in %s; SPDX found: %s" % (str(file_path), package,
+                " ".join(p.fileName for p in package_files)))
             continue
 
         for debugsrc in file_data["debugsrc"]:
-- 
2.34.1


