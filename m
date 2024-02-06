Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635E0C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 12:03:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.19808.1707221002544515154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 04:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aszepNPY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so6565755e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707221001; x=1707825801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPsu9pjg72TseZB8PV3nTGgvbZmRq/fZxtOZjFvR5zo=;
        b=aszepNPYEMWPcE9h+v4Sq0XkaOoHSEevdXlz7ZIMpwXPrzuRZ+uwIYJCNfpcnPS1zk
         mAmUNLLpijLysOyr5RJ0Nx4VvHQ1Ri4iqHtUXzQsW+7YldmEJ2aSlfEZONDwYPtht6Ry
         HpRi9jCOM5wyYfD2JCOI9vbB2zQ2M2ZNkygqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221001; x=1707825801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPsu9pjg72TseZB8PV3nTGgvbZmRq/fZxtOZjFvR5zo=;
        b=C+sCPtWcnMdH80MpOgC5ZiYIBKJsAegNddpPzoDbUEMpbgCR674lNwIvbklw5kzByZ
         iGdUj6EHgbie/i3lOp7AHHgKnyXaKEqKCGoelQiuLEGlHzzYerArs97MgfTzYqKI0lqI
         2b8zw0nkmrGiZv/sgXiHtikqA93cKGXgVNs2V8tboM5uO8BNF7+6vtlT8Oix1zRb2Nou
         uUJ46dQKozWLIZobsg8jp4HjUuWlNIniAHikPB6MPRuQPQd09qUlqYuaE5Gx9h6Y2As5
         d3c+AU739Tz6EJlDdD1pVdJiaFIklrrwbc/vSLhY7ZVf4o/GiS8sYBvjJUoO7S2l3FhD
         SNDQ==
X-Gm-Message-State: AOJu0Yx89CD902EVq3rLujEom5nIMu06cuh6qGog2Qx2Rct+BGiemPee
	zvko7abItX9zL7BhMqjum2URunZbTbPdQ52tHHVkjnywUOGxk/a7dkc6YxSb1tWZ8g7PQTkpyN4
	R
X-Google-Smtp-Source: AGHT+IGV4yBBmUPFDf7t5TxYzDk8QI8ZnVDLhASIRv96pWqEUGoRn0ba/spaaSNA+c/w0Tan0g4bOg==
X-Received: by 2002:a05:600c:458d:b0:40e:fb4c:c1a4 with SMTP id r13-20020a05600c458d00b0040efb4cc1a4mr2428051wmo.21.1707221000639;
        Tue, 06 Feb 2024 04:03:20 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:45c0:34a2:1eea:2530])
        by smtp.gmail.com with ESMTPSA id h22-20020a05600c351600b0040eee852a3dsm1822204wmq.10.2024.02.06.04.03.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 04:03:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Allow shallow glibc to work correctly
Date: Tue,  6 Feb 2024 12:03:19 +0000
Message-Id: <20240206120319.2579571-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194989

The intention of the mirror code was to allow faster cloning of glibc.
This wasn't quite working since the full clone was needed by glibc-tests
or cross-localedef-native. I noticed this when I updated a build and it
was trying to unpack glibc but fetch cross-localedef-native.

Add entries to cover these and restore the faster cloning for glibc
and realted recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index cda431ce891..ad070d44911 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -92,6 +92,8 @@ BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
 BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
 
+BB_GIT_SHALLOW:pn-cross-localedef-native = "1"
 BB_GIT_SHALLOW:pn-glibc = "1"
+BB_GIT_SHALLOW:pn-glibc-tests = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.40.1


