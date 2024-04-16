Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF17C04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.18818.1713269227900192630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OC7EpcCh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so3915770b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269227; x=1713874027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hibM0Aczb+OeMjm4K3xpTGSZer2/C2IBOrQMvCI7ARU=;
        b=OC7EpcChtFd2QxRSm32KStQ9flC13ekVTtqtYUdA09hpJRPINS9xYJm8xiXcMyx5tL
         jArdxVAedUXGC0jshelkqn7xt5ScPkryhkIRpHfVV8eQDmRXPsojyBAl1ULQeMhK4cGL
         rYqgHcyfBUyEl4Ewr6fcxN46wARcbBCHnOAhbp7+PAeY215OV1MZrgN/ao4kwJgXW5BS
         XMY8lcYX24u2u4akHsYsFa3nvpVZsztmum8W5zVPQjS/6JQVz5ZzdKq+crFZUUI4O+Dj
         Gs2wE4Y72wPHo3kjc7sk97BU2TGlQOggC1RnB1iVOKVqxXopsAWcXapHMUX6J3lucO+P
         dD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269227; x=1713874027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hibM0Aczb+OeMjm4K3xpTGSZer2/C2IBOrQMvCI7ARU=;
        b=n6nCLHFVudtm8Km2H7yXuXV7o7Acf/mv3CljeXfM/ZW/7YdDt9MsDTjKgj5aj4FV3M
         1fu87GbW3hC4Q0Vfy/LKVm6ZwGCpVqMVatrVBMrSVLx0HGRgXxCbqjk3DBfHWKgvDItD
         oLmDphR4gCvi65Df6ATwBTs7okVo6VkWOnK4KVyTGGM1PMqWllPMZQ4Uj0pDPGQ+Imag
         X/PnU58wLqtf05xTzIBGMtOHgAaA2dvyrvifcAo1IAzSGo4Pt/mHn+pk6nVaPl5Vo2Mm
         GiWZrnOS5o77k/vXdYbId4ReiJHzL8+BbEpSXS2NMACSVrkAs+RifQtVTOn/PEtVoIhg
         ki/g==
X-Gm-Message-State: AOJu0YyW2UB3zqaOdPh+q3wwP7K+KQRdSCCl2PqGkDC/Oy484jRYfUl/
	PhZQ5DorF8lyRAX7i/ENaj4ARF39gLar6VifA6kMLM3jolujwuMflfo+3t2sppwCcCpYXcUXbS1
	83ag=
X-Google-Smtp-Source: AGHT+IEiXO2tKyi5DdgNzKr9PDclsCyOHhtVc0n9YZEDxlzBXaK6ZSVpFhnnyMd77omNoL3zIH0dCg==
X-Received: by 2002:a05:6a00:1781:b0:6ed:1012:93e8 with SMTP id s1-20020a056a00178100b006ed101293e8mr14756686pfg.24.1713269227173;
        Tue, 16 Apr 2024 05:07:07 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] perl: ignore CVE-2023-47100
Date: Tue, 16 Apr 2024 05:06:49 -0700
Message-Id: <8df158f39f1eed1e3ae88ddf935c67e067b72525.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198439

From: Alex Stewart <alex.stewart@ni.com>

CVE-2023-47100 is a duplicate of CVE-2023-47038. They have the same
advertised fix commit, which has already been merged into the
perl_5.34.3 sources used in kirkstone.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.34.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index e8b518adc9..215990c8fa 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -48,6 +48,9 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
 
+# Duplicate of CVE-2023-47038, which has already been patched as of perl_5.34.3
+CVE_CHECK_IGNORE:append = " CVE-2023-47100"
+
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
 }
-- 
2.34.1


