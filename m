Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A88EC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:30:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.14498.1678296630487914755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tmylqmsu;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso3171736pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678296629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6cmdtZbLeqVbvZKoqVxZ3/2GPGkZtveajMEo/skr3c=;
        b=TmylqmsuXCyf/Y7TjC1yhVO46PBpNe5SOtqDVUDfk7TzPE0IbMYdWOn7IVoFTXvjKK
         ep1nz2HYM3lb5NN/HSbnUtZ64+g+Wiwnbo2y5/uYdkA/+n8CeZUX5TWaWozLuRHx7VBH
         0eZLnHyfAtoXMp7gzUNJisskzrAR+zgJMXHo3IVEZ0kiJd9T4CAUsX/VQMorrat3kSOE
         hVsbsRZmlHIw0PDyPSNEbNqmQP0q0oGjUD7gvDP0TMyuRSjoK12+ehNm+R+TGMiMim3l
         ZV1zmsaZ3nUmwYbAxZ8YJf3ny+WPxZC5sGkTs/pqfCibmuqzrY1bqw8YUX9qx1vq1FWG
         rEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6cmdtZbLeqVbvZKoqVxZ3/2GPGkZtveajMEo/skr3c=;
        b=fVCWdar1slW9ETtA47oWUCIHtW0I435+lMUAN1OE4zbr1YQt84ESKNG3RwZJpPdf8d
         Ywig0OqgnpQRw94oQE7szBTZsx/avaViDcaESqNzd5zSMDIsyUrwcgS7tgNQfmX5MZR3
         0SXaRZYd8YiZP7SAMoF5Ws24X1aJZHNXlWv0w9ZQT1lhY1//l3MLNjBBu+MHPiFOmc5r
         J4IV8eiyqx3bDsp8+Ol9s90ZSWJj/965HlgEHP7i0eTpczqo7Ty1AAypVdMGWbzYlL4H
         P1w9Agrd0xUnNdxm6fJcRLt+qK/Ih6i8gMG5RQynZYFwQlmj6Ngll43bqIYB8DeIJNKl
         8dJg==
X-Gm-Message-State: AO0yUKWuy6W6ispEEFY5DhOsIXICFy5MZDK5D2d0piQDehPxHV/k3YG0
	ZZTEPwrZVqyrgwpFpVl+gp8Z2VnQy4CJhA==
X-Google-Smtp-Source: AK7set9upohHaPynljFuPDL6dEppisM6ulNn5G7xweREVQMbBzKqxrzFfQChWJgttQ4HwYVnPrCUsg==
X-Received: by 2002:a17:902:e543:b0:19a:96d2:2407 with SMTP id n3-20020a170902e54300b0019a96d22407mr25211042plf.8.1678296629468;
        Wed, 08 Mar 2023 09:30:29 -0800 (PST)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id lf14-20020a170902fb4e00b0019edd34dac9sm3168895plb.60.2023.03.08.09.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:30:28 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com
Subject: [PATCH] rust: added missing runtime dependencies to run rust on target
Date: Wed,  8 Mar 2023 22:59:09 +0530
Message-Id: <20230308172909.2052236-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178186

[YOCTO #14975]
rust files are not linking on target due to missing dependencies and observed below error.
error: linker `x86_64-poky-linux-gcc` not found

Added the required dependencies to run rust on target machine.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.67.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.67.1.bb b/meta/recipes-devtools/rust/rust_1.67.1.bb
index 2118faec8f..f4c6d9511d 100644
--- a/meta/recipes-devtools/rust/rust_1.67.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.67.1.bb
@@ -13,6 +13,8 @@ DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
 DEPENDS += "rust-llvm (=${PV})"
 
+RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
-- 
2.34.1


