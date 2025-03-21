Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ADDC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:14:00 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.2344.1742570033184360158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jt+DQbob;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72bc3987a05so1078388a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570032; x=1743174832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut6A3xBTYdBfuXc/WX3rqWmIIQ/O9UlwlyIDg/YSAGw=;
        b=jt+DQbobhfVL/jNgrxSaHrXOINZ1km3TYzDzHl3vehFprNb8asJuis//7dNqYVvT5s
         VOsZEMe5EptyXP8RnJ8B8Mso8/lGhObVivSKgGRh2Xmuw7UJg/s2mwSVVPeGrLszoxX4
         YZmJ6kXsJTlBGNegWLWWuOnJFF/VY5iAg0VRyexCEhBe+5Ji/8mL95l62SKDVRWa3o4E
         NfyPuDluSCLJSpv7z21ewVzPo+O6wgek1sX78B+0ZS4U4bIQG4nTrXuRMVyhD5fVhKea
         +R/Cd0hpVqQd534vx0sHtU95UPIu4P0Shs51QrxAYj8jK+p6oCJhFWW2cBsnAtZkG0M7
         N2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570032; x=1743174832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut6A3xBTYdBfuXc/WX3rqWmIIQ/O9UlwlyIDg/YSAGw=;
        b=wIJo9eVYqqdS+zYt+1T6Joo2+4YvjT1mKexRFU0IKGRLeJCtTc7OxUTEY0REoDbJXo
         Vlhg8LaoPu00tHri4kibDMtdn+xxcINtJ9OMvd9Eybo/x1Xrl9SschBXW6RjIKPQZ9Br
         dShpU2L6NGBlwM0JdzeczZaNl42yk/YQDG36ecfo1FpM5QzCGVN1G4QD0AnHFJJQsCpf
         8k6Yx9fFbBxtE/+p261LXP2so9NR2emXSBXIz/b++Bxch66v7FiMr8oMjbePJClZ56Ap
         1Dhd/eGDkneFKF+ILMhBKTBhwH3C273vyZOjNSyBA9IsgIPIaWITjRdm2SPKnIEJSop/
         xU+g==
X-Gm-Message-State: AOJu0Ywb3OS64NcIayA+/WweagO9rqyrJ7p1RS5cPOWE9ShIYs7EgQ8U
	X2RxOHVdqEcwdfMuytx1jTUU7/85FPl4r6dLm3mRQIlG3Wenpp+F2Tpp6g==
X-Gm-Gg: ASbGnctfs6nTfS4P7IyzdBknkdsfm5t1Iwe0JnF55+X+ZognAfQh2jKDEhnJS1gU0ga
	LMcWUS46jP+kdQ7Ye5I6yjx5uNeJ3L1o1M8A099yUNUAPF/PJQFJbTGW6fNUFrXXijUXwFjua67
	tr1uRxJX6BClsyv2mHz80hqCzHrjrDOtUbM+akLqUR/dubsFACJG3AC+WN//UKrWBlEzpdCCzFJ
	55SqCP9iUWa+xgJfLfUoCsyhviig5CWTeRrziUF2LtblrNN8wCd5FvfM3gtq1aqaAXVL9bguQJP
	KFzhkZAV9u3A8eZFu7uIAifIQUSf4xuBI9QXv6vVrNs=
X-Google-Smtp-Source: AGHT+IGG/8JIH8/8JmRmVWv7dsaugqqNfbhja7BNxZqrABjYq2WzfflHOM+SmsYljD5oDYsdVtI0kw==
X-Received: by 2002:a05:6830:6402:b0:72b:7d40:5fe2 with SMTP id 46e09a7af769-72c0aa6e757mr2515144a34.12.1742570031654;
        Fri, 21 Mar 2025 08:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::b36f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac389sm425931a34.4.2025.03.21.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:13:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] oeqa: spdx: Add tar test for SPDX 2.2
Date: Fri, 21 Mar 2025 09:12:40 -0600
Message-ID: <20250321151345.484603-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321151345.484603-1-JPEWhacker@gmail.com>
References: <20250321151345.484603-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213482

The base-files test for SPDX 2.2 did not give good coverage, since
base-files doesn't have any dependencies. Add building tar as another
test which more fully exercises the code

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 2351103433a..6eac5f9911f 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -31,13 +31,13 @@ class SPDX22Check(OESelftestTestCase):
         self.write_config(config)
 
         deploy_dir = get_bb_var("DEPLOY_DIR")
-        machine_var = get_bb_var("MACHINE")
+        arch_dir = get_bb_var("PACKAGE_ARCH", target_name)
         spdx_version = get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
-        machine_dir = machine_var.replace("-", "_")
+        #arch_dir = arch_var.replace("-", "_")
 
         full_file_path = os.path.join(
-            deploy_dir, "spdx", spdx_version, machine_dir, high_level_dir, spdx_file
+            deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, spdx_file
         )
 
         try:
@@ -68,6 +68,9 @@ class SPDX22Check(OESelftestTestCase):
     def test_spdx_base_files(self):
         self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
 
+    def test_spdx_tar(self):
+        self.check_recipe_spdx("packages", "tar.spdx.json", "tar")
+
 
 class SPDX3CheckBase(object):
     """
-- 
2.47.1


