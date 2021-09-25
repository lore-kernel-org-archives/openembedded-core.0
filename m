Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA8C433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 18:03:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9658.1632593035763886774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=McPA29G7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t8so37678991wri.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nCxQpt8xgMq7RDdonVT8BddK5eSdZ1HjO0uhvQoOSWU=;
        b=McPA29G7F4BhjDMB3BG9BmZSxKFsbrs8EoGrJyTVyOOleZVxP2QkJhlQuXIDG1QLUh
         ZXXFoLTPFP/1Fns0Nj9RmzB4kCTsf2Bd+JDp7C6ZbOXUjWziF6fQgooaIw+84kLhbtog
         pIdlU+AEZa7jl/+YYOCv0tDS5oEOfmMDPnck4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCxQpt8xgMq7RDdonVT8BddK5eSdZ1HjO0uhvQoOSWU=;
        b=nXyGy8HcGqDxc54AoNRKINtEky9uFhZjMpMFT5nK/CzjdCeeFBlDnUX3Ak00Vo0+9T
         VQzZ/QJmiMbkCf0s1s0wePr+0A3OgdDYpIp01U6mLG5Zj2vhAHckXHKyaaV8Is/Nb3Tr
         IjgO+9fFSzSP8hCuN0uKy9AVIB9bQVpCTjmT42XCzBDwvLyh/qXWwBcpSWFAZ29Cg1V9
         tZ+cbSLWWz22feSPpaHnEVhZ8U2snkNIGhdWFbdaXV1g6Wmem+hnMFnKyLXx49hkuPSn
         ci27SGScXcpi0uyruOxzMi3xi4JW7VuMn0slt2CaLF5cvw2CtmRpSI2wvb9ubfLoyDxH
         OBnQ==
X-Gm-Message-State: AOAM530ikQ9y/cRXbr/YsF9EeEJIsyiBuxZYzLnkXb2L1sRrOwfogkLu
	oBdjM13Deg6K/MZfT5II3bO5N7yAaxGRwtpo
X-Google-Smtp-Source: 
 ABdhPJwMkU2WWDTxdvYCKDFwX3hVOiXEYaNf1BW2gdVox0nNd/SUwcK5weauD8TDv/15FDtOUJEvAg==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr17898000wro.203.1632593034279;
        Sat, 25 Sep 2021 11:03:54 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id 8sm4831978wmj.18.2021.09.25.11.03.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 11:03:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] packagegroup-core-tools-profile: Exclude systemtap from
 riscv32 as well
Date: Sat, 25 Sep 2021 19:03:53 +0100
Message-Id: <20210925180353.1987944-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210925180353.1987944-1-richard.purdie@linuxfoundation.org>
References: <20210925180353.1987944-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 18:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156355

The recipe can't be built for riscv32 so exclude it alongside riscv64.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 663a9cd57bf..84eb46b9c21 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -36,6 +36,7 @@ SYSTEMTAP = "systemtap"
 SYSTEMTAP:libc-musl = ""
 SYSTEMTAP:nios2 = ""
 SYSTEMTAP:riscv64 = ""
+SYSTEMTAP:riscv32 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS:arc = ""
-- 
2.32.0


