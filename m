Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C16EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 18:46:39 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.36445.1704221190752251988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 10:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4tuXrHA;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-781753f52afso397861385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 10:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704221190; x=1704825990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jeRS8WqpUU5N5FHn8gnkS08aWA1snfLz852HFlT3Ak=;
        b=B4tuXrHA784K8vIketkC+cVjtTe1BJvQyd2dYXQtaAG1pSS2lVFubmyMzyB+zt3z9w
         8wfzfE3fIQpQNgbsCfTLR2wgRoLmhnpOrXAV6AiL1qsA+5vcKxfRSYXg2NzyO8qygpQC
         t6PeEcDxhLXM3Pt7dssIODdS+ErrhgOYTl7lbdbma4LhgB0let4TsZlnkEW2BnCBBgRa
         JP5+ybtRHkny0JZ9tUPfM6+/qEvUO9PGrVuoV76z1yUM4iKGut8N46EznsG/tk/j41Oc
         R6yxGIqVcr/iUYgehw2ECiQ/aw4ZSSL0+ZNwpJUeQPd4AOQ27tC1XxC81Qsv3WSvV1G1
         72Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704221190; x=1704825990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jeRS8WqpUU5N5FHn8gnkS08aWA1snfLz852HFlT3Ak=;
        b=gCsrA8zMsFpbD1hOBPk8+r8zvnNYb8FrD3Jn2tXM+c7hzBjAPwpsR2HK5/p4ZFTuhk
         psHVupwpvwfFMq4j863JNALe3uCQQxBo9Mco6Z6PhEgLUtQIu9vSJ7r7yq05RWVRSOxm
         k2BAVI4RRZrXCmYAArXAh+HuvphmlHfBRqkB6hm6JDuUX/j4myWj68lMcr2hDX8u5NGg
         0f0eaxEFos4YRPrcQjeOBfx52ZmNpQQiR3sSkhMwJJOrHUnl72BmJHzRxTgKNLjHU/AF
         78v2v0qcUH1QlCJbWgeq8eTdCaDVf19uOoRH51haqZeGVNXZ+/HbYH8ClBYYmSd+QsxG
         RVcQ==
X-Gm-Message-State: AOJu0YwxwaFqcN+OE9Br5juFQNKeaxstazO2nuFTP8KNj+CW8KoKK/Wi
	rjkAjFljhQ5YU8oNnrC3Zfc=
X-Google-Smtp-Source: AGHT+IF/3Q6ezgZw+9nfGElSJ9GRZETaYRhy7/Rl83+b4HS70qEFnw4JMSQYIxAn06WeTKEdi0zL2A==
X-Received: by 2002:a05:620a:258d:b0:781:d536:2cc with SMTP id x13-20020a05620a258d00b00781d53602ccmr2855625qko.18.1704221189709;
        Tue, 02 Jan 2024 10:46:29 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h25-20020a05620a10b900b00781d3f29215sm1001032qkk.91.2024.01.02.10.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:46:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/parselogs: add qemux86 ACPI ignore for kernel v6.6+
Date: Tue,  2 Jan 2024 13:46:28 -0500
Message-Id: <20240102184628.2587515-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193257

From: Bruce Ashfield <bruce.ashfield@gmail.com>

upstream commit 003e0694fcd3d5 [ACPI: processor: Refine messages
in acpi_early_processor_control_setup()] changes logging during
boot such that some of the informational messages are caught as
QA issues.

Adding the string to the ingore files so that 6.6+ will pass QA.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
index 14f8c0d494..f91abbc941 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
@@ -11,6 +11,9 @@ NX (Execute Disable) protection cannot be enabled: non-PAE kernel!
 Failed to find URL:http://ipv4.connman.net/online/status.html
 Failed to find URL:http://ipv6.connman.net/online/status.html
 
+# x86 on 6.6+ outputs this message, it is informational, not an error
+ACPI: _OSC evaluation for CPUs failed, trying _PDC
+
 # These should be reviewed to see if they are still needed
 dma timeout
 can\'t add hid device:
-- 
2.39.2


