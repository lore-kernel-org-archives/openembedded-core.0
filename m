Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D7CAC5B8
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 06:02:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.12448.1759816940392350737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 23:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kbSt/Ky6;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4470058b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 23:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759816940; x=1760421740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Amj3+f6ObCyyj0SdwC+TJz9UMBO/GlWpyodylnC9IwU=;
        b=kbSt/Ky6D9O6pBMwWwEioTDA9WJGTxc8QAhSB1gH9ucTnKZI8bJs03zGawtY1TwoFc
         1WZE/u6yk6jL28w/US0/Vn5iaLYNOM0vVJ8Y/ILX5ueHczv5mfcDnCbrD81XDg3DQXwI
         uv9zMP2QGrcuv5Z5VXvzQUbVShQR6GtEVqr5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759816940; x=1760421740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amj3+f6ObCyyj0SdwC+TJz9UMBO/GlWpyodylnC9IwU=;
        b=UEWLhmWD/3d9ZbCe/6/4gGAyZ7An6X86YkeyqacGyDsJMge3M4S5iuzYZnG3VnkiO8
         qa/aFWJruZ/Fxbe/LO7sLtmF7gcSfqEmEgJUk1FLifOrxXpgIxuEBhdIn5NlUfU/3zB1
         SJax3RWNB4Fotwha6LP/mBROdmDVZAXElU7YvsBg5fqoj7B4kIqDH86VvgcfS2cxth/t
         NmW6hHrWCCS6BFG1jdcYtKmZ3WEMNWuEuXcSJPS8hxiISEk39HQeUfRk4gVxcLwi9WYu
         fU0CzNJWEBgiIHLtR8d64slfE98clyk2AqJxXwN+f5lEgeExb8Bz/r/cCYXert2+9V68
         27Hg==
X-Gm-Message-State: AOJu0YweuPTnniUDrd+DsYc4EWj0tD4FmuKQgxwnhI7JRu7Aeb/IeveT
	X4NOtjs0QUmzdOAy2hCalzUv0QF/BnPxTJogyeaGSFW3sZn1nkXLSeuzu1gkz+hApJiymS4TnxW
	KMxkEGek=
X-Gm-Gg: ASbGncubbD+5r1PufjqD0LOzqR/jOa2vAsr2FxcEuyu3oywjYBTS+9tARdZnLD/OuCr
	gC72BdvpZXdaqmIVbYiIeKZjT5dEYT/ATSg6MdYfe7kMdPSI8Av53yiCMZ5ws/cYWwr3P5VmZqf
	VCd7NjXruTuVdaPe7xrxfjvzZVN+xyMyh5n5F2nNaOVbpxGNQ+7gcwhrnEp5PgI9KrPrj1ojFA6
	vSXK0b6GGQ1dU75faPJxM8eWkCBAEIZu25xBUxVxsx4GjdRweNZfuYE561Z9dCyr61C9VHsvdMC
	U5TCvAMDY258aG/I1iHTpxKYDNMTr53S3tlr6EWyHu57Q87z/p2VBhgeN/8yTkW9XdvJGQnh93l
	BF5OLibAz50A7RARnDrl9WsAcIaQjGyFpz/pRzLqkFjgd
X-Google-Smtp-Source: AGHT+IG+u0NpG1tEgjr/Ckd2XUY2/8Kuuevcu8cV+xdfyIm3gX83F2VW/rdxVO0R24f4d83byfNUPQ==
X-Received: by 2002:a17:903:1a2b:b0:265:47:a7b0 with SMTP id d9443c01a7336-28e9a5435e2mr185612565ad.10.1759816939517;
        Mon, 06 Oct 2025 23:02:19 -0700 (PDT)
Received: from MVIN00013 ([43.249.234.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f1a75sm151570685ad.125.2025.10.06.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 23:02:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] grub2: mark CVE-2024-2312 as not applicable
Date: Tue,  7 Oct 2025 11:32:06 +0530
Message-ID: <20251007060206.72978-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 06:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224511

This issue is specific to the peimage module that Ubuntu add, and is not
an upstream issue.

(From OE-Core rev: 8d2fe3f403e6435e1ffe122a6776381090752d8a)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.50.1


