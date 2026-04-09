Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7698F364B7
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 20:16:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.141664.1775765775362069239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 13:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZoqkTg+u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d23305225so918201f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775765773; x=1776370573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kj+/rtJhSt3QDayqdWwWu4hz5SMc+utK3TRMyLXcuLA=;
        b=ZoqkTg+u0fYeNg9ZB4+qV5zpbGjxF2nIz6jHauGJnIXPOZyECgLbgCzCYF8KAiagxn
         2At0nNPnwqAph6yZJkGOalorkdXZcsAPoouxfKBfgs3Sj/N/0q7PNUt8i0tOMFFstz6n
         lms6sY+PsfPhoLIvDbJEMAUgV02h0FwxEXrmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765773; x=1776370573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj+/rtJhSt3QDayqdWwWu4hz5SMc+utK3TRMyLXcuLA=;
        b=a9UWyEAdtbqohNxZaSfAUR55qtv/hbEtmgGOFV92aTB1kjzH02wxuPxJMcbptMhccF
         6YlcBdNqP/gbg8qS3M+3MBI62dNARaWgHaaORiNV2GxBkoiQFlph7o8l4Ydz6Y8cl2FL
         SHV/G6DQ6oxjPItSYAt5HctP9ZoaZhQq/ycyJzbf3eH8UHgOnQar7ZLYEAT3KgPB+lMJ
         m2pgpM271kakxq2HRSKmItrqThEW9mG0op4zJ9CuhTdwC8a93QlpgueLKq5r2ZHIX8Cf
         AUC+htc/pCXC386Nr9mP7gBtBWRcrEUNti/7MA6Ijk8DqgSUCE8UFJdASi2TqVq41ulP
         p+dQ==
X-Gm-Message-State: AOJu0YzQbOVXcFB/hikl+xpDItSdYw9o445Snj7dSRu41OHDMBN/dNQ5
	snm38NklD8sKXLkPsrLsvq7kPwCkj4wwr//VgWhkmjM3+LBCcgS12WjwEsffqizm/7YC8+PmHv2
	pwlkQSH0=
X-Gm-Gg: AeBDieuARXOpIzMDSulwPCWr1/QJJZL6kiC0IqASpu0ijOCV8kORO0nSWbwWFwWRtGU
	4Q6/I59q1r3O3BA7epRXdmps54UeVTVRaxYHGNhErOF8fCvSH1+SRtr3haYnN6cDjPOdbOcRjRF
	nrOgauEqaiUeGNWQgarPpCpPItFykRLOx/leWoUdtMMt/UxyiYRvjKLHZQeJvFZe2TOMu3slMDf
	mOcuwsPk8aC55SmJvclMY2pxvEKYNA1FAfPzYiVv7K38tHxD8NNnIpMUcZlbQTzPMxzFP3ixPUu
	DMCcbYRC8lrvep6KFyjq2WCQddNTACK433mmoXERpZGNR/Fif+UukMplm+UdadBOS6mnEE+iXv6
	z3Yu+9dUSYgMEMvD6q02dRnYwJSVnRSTN8s3tRGYmTM6zcYnIBY/eYSezuJfbFC0N+cphLPufjs
	TTdTOzMCp/NW6/KGoyNs4zxi2fOpFQnl3pi26Ys8ys4XuZetHTH/5Wi/GiG4Cpdgw=
X-Received: by 2002:a05:6000:3111:b0:439:c157:2577 with SMTP id ffacd0b85a97d-43d642e7123mr624691f8f.34.1775765773184;
        Thu, 09 Apr 2026 13:16:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec295sm1292483f8f.14.2026.04.09.13.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:16:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgcc: Bump PR/HASHEQUIV_HASH_VERSION after reproducibility issues
Date: Thu,  9 Apr 2026 21:16:10 +0100
Message-ID: <20260409201610.3478433-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 20:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234944

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc_15.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.2.bb
index fdcd6cc0da1..bf0a5f58fd1 100644
--- a/meta/recipes-devtools/gcc/libgcc_15.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc_15.2.bb
@@ -5,3 +5,7 @@ LDFLAGS += "-fuse-ld=bfd"
 
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 = "arm"
+
+# remove at next version upgrade or when output changes
+meta/recipes-kernel/perf/perf.bb:PR = "r1"
+meta/recipes-kernel/perf/perf.bb-HASHEQUIV_HASH_VERSION .= ".1"

