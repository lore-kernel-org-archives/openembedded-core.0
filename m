Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A40AE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21458.1733334890584128217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gAJrglBH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72599fc764bso377293b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334890; x=1733939690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY/fQ1Fddhax3H+Fv27nWRPLCWNLxUrDvc7W9EMEdPs=;
        b=gAJrglBHrhOtESkQwkDBJcjoTYBjRMmIQdA02M6XsuzLYrPLDXX3a+4DOTlO6RtxhH
         9lZSteOhPOM745bTI1quy7fsIJ6qRqU/YNjYdaov+PIrVZ/2vnd6dVY7tsyPpDtW4Xy3
         DGu6j8dv9HlsEXzeP6QaRzUD4vr31UN7LpaG9m3cE2zHXGkBAo369FUBDVRTkjIs+rtn
         BxSNZK4ua2sxwj2jwCR5hgCOG3rfDssDXHv5j0mdqJJC1GRhoRcaNJhKKB8WkgNRigpW
         sUoL97rfBUZ2ucrmyK973S1xt74L8KIGrJPiTAnOjn+14iQ6ZwahHh1CYnTLS9WxR1yo
         +F+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334890; x=1733939690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY/fQ1Fddhax3H+Fv27nWRPLCWNLxUrDvc7W9EMEdPs=;
        b=LlZbqiEuZ1lbYb1gGq5BHxetIjrf6BjY2/6YCsZJW2HzKNDJ2WhzUC6JpdsA0FNz3w
         6ZDGPK5sVqzQca66rwN/ycus1g6MroeT7taroxr4WkENJJ7IgfdjVWjDmq74SqcHX/13
         9TxUSbJF1n7TS5BZBdHgwlvx9onlrGMA+gXGmLSlEonkEWcsXeisY4ocSeBXaN1km2a4
         nhj7ztDcubwHmGgXQ13qHrQ54almqz8g8ePBHCYs6nVG0rPoOryB7bGOqlMqoXk8uK5U
         a5Otc7ahfIUoQIFI+C7IGW/M2JcH/8WADAN/Qfnpp2GKGxZFWiBPEqKfvR3STEhwwgIK
         sVtA==
X-Gm-Message-State: AOJu0YwHnAaksRJ2aM07KVdmLLpH6KDQjBlVmClMIc4X9QryVzA/dSo4
	SfRVyPSyl1Cu3Bm4Uxb7oiAMWL7XinnecpJrPREgQun8CmTSh8T8JxFGXh0mR0xeJVSB8pi7ArK
	4
X-Gm-Gg: ASbGnctUqRY7+nzwspYYdbUt8AsF+zPiVsYVHd4Xy7hS6BuyUyspnNXNNpU84bIGsBT
	JYBuvv907NNTmPP7UFTLQHELfjdiOYsAHLZHhmSqhoxRai/UAHbH6HqnJSl9OkByRqOvKuanFPq
	qKsxeTlCMbIjYJ78SmOU0tgrER1T54qk3eeEBwRO93/T5PMJMhdzE+7GEXKlnvnxigK/7mmGO/6
	S1iUSzEXHQCjWOl8dDONs3wotHnY4SOWkbNM3g=
X-Google-Smtp-Source: AGHT+IH7ASZTAeyuBFlg8/W2KB50rJmJ1cXSwL5aMvMOJ3SIex7qtBAESqNUhBRAxB9ibQ2s7qeRcg==
X-Received: by 2002:a17:902:dace:b0:215:65c2:f3f2 with SMTP id d9443c01a7336-215f3c56e3emr3339935ad.6.1733334889845;
        Wed, 04 Dec 2024 09:54:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/38] grub: ignore CVE-2024-1048 and CVE-2023-4001
Date: Wed,  4 Dec 2024 09:53:47 -0800
Message-Id: <823f7ab85cff010c777616ed5db0e0c41f6cc4e6.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208303

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit: f99b25355133fe8f65a55737270e67ea10b79d52
See commit: 40cd768368167f81de5bb55e9ff0584035f4c1b4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2718379474..3e96426b82 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -49,6 +49,8 @@ SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae
 CVE_CHECK_IGNORE += "CVE-2019-14865"
 # Applies only to SUSE
 CVE_CHECK_IGNORE += "CVE-2021-46705"
+# not-applicable-platform: Applies only to RHEL/Fedora
+CVE_CHECK_IGNORE += "CVE-2024-1048 CVE-2023-4001"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.34.1


