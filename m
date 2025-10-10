Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F8CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 09:50:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5107.1760089819430337244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 02:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HiRWtU6L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f7469so11387375e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760089817; x=1760694617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/NgIKua76DeSdZJljVXPtkfD///bdGjNm0Bz05Mwqk=;
        b=HiRWtU6LpGWgaiasXEcWzNur+PnSzTfIXpj2KOz0fp7HTImugPGaaX+odGAkCKyyMF
         0P5e6JZDiVaSmVZq+xgupFMIhPfsSTSfzc95J5TkI/pZVLd/EMIotHzzzedsyWXSoHEz
         1JHqCeauML6qIquNfBbHf2P8X3VZZ+YEiAQ9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760089817; x=1760694617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/NgIKua76DeSdZJljVXPtkfD///bdGjNm0Bz05Mwqk=;
        b=NOXpJAPZN3PORsq+2+8CDpJGwVpezx6RRVOX0q5mzrkMrMg9BY07I0gf35TqSkayBA
         W9k1JG4IRBL15odRkfmd9MxrLNYwq1XkX2AUa8QUsB4zpFZ56c9yDAAVhyO8bXbGPF+V
         Sncu1o4jjEqaulzazokp5ZVv4Rl1QqFzxbiOUH/0Q4hNzMgvGGVM5VcQQrn0yYNnFEBL
         kCYNLdo2+ygDvsbFDKzcx9KojnE/Yk3yJRkYdQ4Wd2sPmYlPLNquwBbAG12L1WnTOXCH
         NXKjRfbA9S3T9ptpQ7gFfYhRwMXvHB1350de48MFROcAjRarabJkEEz8pg41kZiuv9qb
         dxbQ==
X-Gm-Message-State: AOJu0Yx48yqq7C0R6cbnEqRgkEX/kGXc0ZV4EGrm0W+gmaDhS2p4/7NF
	YWInrCwc4m5Jtcua0K+/uk1ssCpEmcFCJC5Gg4WRTapTaAxFHl4Jh8+SlVfs3GdoXZ/2sDyNvPC
	mcIcK
X-Gm-Gg: ASbGncu2OdiNHCCN6dqHs3OlrPXVNSb5zZ37R0eho10BFk/wol12Maz1yWlAsr3HI6Y
	0Fsd3XQD35HCbdLfRYD5oUlzf4FsF5RaWvFVT9xlClhZFZsrxh1GhDXI0M7RsVS72irSuQqJZBi
	CPwFcFnMyihk9LD8uqAQvwz1i23Ts7hmU/wR+GPesdtase3o8CiHNvMgcSTE6Jdazc7FutqbQ1i
	opA9AchbRYDnV0RObedOZlUlunSLkUo9K7g98pSO2WSLKomI8T/BfpVBY69wlJeDyhFMeJgDpiA
	9iCVzUJ11kwK7cbUdySDIxV6Ff6hf3xD6GKbGB6Dnc7YnaUKamYtMsb7M9SUVNUq/H/fgmdbF0J
	dcr+BdxMAcRceIMU+e48DgEBCe886dA4jRvEDFOnJcKW1+UudVpb5zlHPvRdu/D7BTPlf/Q==
X-Google-Smtp-Source: AGHT+IHXWsOodMzH/d832DNm+HK99cMXnYmc4PkPwUy7uxwCl1dio9gJGYgfJjCw/zylwfDRiLnzuA==
X-Received: by 2002:a05:600d:8110:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-46fa9b01fb1mr80228815e9.30.1760089817223;
        Fri, 10 Oct 2025 02:50:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb497b8fcsm37260685e9.2.2025.10.10.02.50.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 02:50:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] llvm: Bump versions to resolve hashequiv/reproducibility issues
Date: Fri, 10 Oct 2025 10:50:15 +0100
Message-ID: <20251010095015.183456-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 09:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224676

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/clang/common-clang.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 2e9d3d73f92..47f036bc662 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -16,6 +16,10 @@ CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
 LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
 LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
 
 # set the default pigz thread

