Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB11C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 14:19:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.159521.1680790782597043946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 07:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=DkuCpG+B;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso2971042wmo.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680790780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMODFEuZI/pgjR5tKvR28LdHRjBgr9Dhxt2A+tlovus=;
        b=DkuCpG+B0On3BCsksiXhLLmNQ7qT+iwIxi9zOv06fTqTp6J2bxWfqL6YoC6mFd2siU
         mbVhRL8fIVMrCUH9Ozm+v+LtXEiy3Z2vQvRO0HdLNNQLLeTegc+19KaCN3DrIyKyd2Xj
         F9gKysrlAJ8xND86p58AxNXzqN/a2x+jgcN7mScXS0wZAScfVTWWXThSWuxml//unWsf
         Nv9TXeB/kAaEe45KiFrTIZ51lvc81OrXc9ABw4PWNwXDjvP9RCwzubNVMD405mVBBYVQ
         Y2TduOmTbPgWKbTctpFhoKJ1VQ2ZfPoJpqMeJehC8d2jcwMnopv1ffM31dMEclnaw/aO
         s31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680790780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMODFEuZI/pgjR5tKvR28LdHRjBgr9Dhxt2A+tlovus=;
        b=Ir5OuPBf9mhQG8E5iehu1Gt7541Hmp3WWn++dctD+qMCnMDPkSAk+tuJOyYzNVLQj2
         n94cAzlwgEePK/Tw++fo/yrZGyFLHvPswayMks8LuNNaiEQqrOIjq9LexKaV4Fm4sryz
         bFzAtyZ/pOzV9EfBeer1FXNsS7tlWfEdNkUDQ4uNnC3QDm+rHkj1lbShnjjeBsO5IrZN
         boXUSb/5EbEbMO38zcqfdkvwAdqWiVWzSdranBdW65Ko0EXJVKxw9QORjhlU/Kukbl3k
         wO8+njiXO5tjzSU9i+Ko6A2K9hjx+HtdKot1KFqTWOa04Kh8VXctk/RulZaGdcuzf4O5
         +DXQ==
X-Gm-Message-State: AAQBX9d+BK2Mx3/TODos5IefHZlsCY7rF1+7zfELN6P76jlp4TI9jIva
	D6ZP7FdVXMfcQMrtzMsqzHhB+oYGIJhXeYH1qwM=
X-Google-Smtp-Source: AKy350agePqYrqfj10uy2CQP4n83HhXnftCTA1DynTj7GiesPbZ6aqBjJaq5jKgLeVrT9LhEIn1MZw==
X-Received: by 2002:a7b:c8d7:0:b0:3ee:6161:7d98 with SMTP id f23-20020a7bc8d7000000b003ee61617d98mr4785705wml.16.1680790780540;
        Thu, 06 Apr 2023 07:19:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ee44b2effasm1748331wmr.12.2023.04.06.07.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:19:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] cve-exclusions_6.1: ignore patched CVE-2022-38457 & CVE-2022-40133
Date: Thu,  6 Apr 2023 16:19:22 +0200
Message-Id: <20230406141923.419980-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 14:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179775

Ignore CVE-2022-38457 & CVE-2022-40133 as they looks patched in our 6.1
branch.

I've asked the NVD to add the commit as the patch for these CVEs, but in
the meantime, other sources seem to agree that the commit fixes these
CVEs (and I concur).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index ec7ff9c1a7..8b32c2b2df 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -13,3 +13,17 @@ CVE_CHECK_IGNORE += "CVE-2022-3566"
 # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
 CVE_CHECK_IGNORE += "CVE-2022-3567"
 
+
+# 2023
+
+# https://nvd.nist.gov/vuln/detail/CVE-2022-38457
+# https://nvd.nist.gov/vuln/detail/CVE-2022-40133
+# Both CVE-2022-38457 & CVE-2022-40133 are fixed by the same commit:
+# Introduced in version v4.20 e14c02e6b6990e9f6ee18a214a22ac26bae1b25e
+# Patched in kernel since v6.2 a309c7194e8a2f8bd4539b9449917913f6c2cd50
+# Backported in version v6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
+# See:
+#  * https://www.linuxkernelcves.com/cves/CVE-2022-38457
+#  * https://www.linuxkernelcves.com/cves/CVE-2022-40133
+#  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO07rxR4nQgkJA@mail.gmail.com/T/
+CVE_CHECK_IGNORE += "CVE-2022-38457 CVE-2022-40133"
-- 
2.30.2


