Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649B8C001B0
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.83604.1691927656865136149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a9HoqiCH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3024395f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927655; x=1692532455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVm8iLAUPV91MHtbSqz0BZcsV3Aro/xOpzjnLVzxT7w=;
        b=a9HoqiCHKlDXcsN6yTyUR69U3lHGwQo66ixw+qJaG0XfZvVOSUYPXo8f3QpGIxTfDe
         Ova0TpBL1wwK57vovmJw7/M6Aml6mZtRASp5u0DIcPfSzSG5U5nCTS4B6VUss+hnHaf/
         t+sIl3yi1iGYpXY0w1oVe+QnwJAhAZtPG9DsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927655; x=1692532455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVm8iLAUPV91MHtbSqz0BZcsV3Aro/xOpzjnLVzxT7w=;
        b=W9392h2QWPQ0HagpcZ9IBCTnoV+zqyaPMERXc69c9QxM+a9ZhGz4+5UIjvX8YflhhD
         5xrgQ0kSm+0dRRiDr0zVilpYHO5cKNNJOFQwaCZ1QmR0piqpG4gizQtpMJc+no8JoF32
         PDIlhU6Sx54ubkgxVrabXxJaQQoUDJY28G8vnz8Mckkjo7BIVYMKxFPVoktngTC8xwih
         G+bRytNK/KycTLu9GBh8vlmrgbajkdJc50zLnVQDKYONp3AoK7qDIqmt6z2XzYWcsErE
         DTHGl/Mn8zGckzvu2lL5Av1exNagootg9ACczO50fcmmPdAISEr0UrEibIa/rZpafo32
         S1Rw==
X-Gm-Message-State: AOJu0YyPqOLH/BFxoTaHxf5ubHMIz20AS6feL9nW+7wUYvThsZQ0WWe7
	Lhc/BRWw3te5PXMhZNtW8M19vhew9Yx9kvRH3AE=
X-Google-Smtp-Source: AGHT+IFwZYL8hlwrtDWYRdLyfyykgnEtI4uGUBr8O/ndIXkawL+6kTnuGnP5+fh0To5gBbBdNtzy9A==
X-Received: by 2002:a5d:6051:0:b0:314:5f4a:5a63 with SMTP id j17-20020a5d6051000000b003145f4a5a63mr4926532wrt.54.1691927655089;
        Sun, 13 Aug 2023 04:54:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/8] arch-mips: Ensure TUNE_LDARGS is set correctly
Date: Sun, 13 Aug 2023 12:54:08 +0100
Message-Id: <20230813115410.163212-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185878

Similarly to x86, ensure we have the flags to the linker operating correctly (it
defaults to 32 bit). Normally it is driven by gcc so this hasn't shown up but
it does lead to hundreds of binutils test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index e48ddd2d6b4..e39cdcab5dd 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -26,6 +26,8 @@ MACHINE_FEATURES_BACKFILL_CONSIDERED:append = " ${@bb.utils.contains('TUNE_FEATU
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n64', ' -mabi=64', '', d)}"
+LD64ARG = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '-m elf64btsmip', '-m elf64ltsmip', d)}"
+TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'n64', '${LD64ARG}', '', d)}"
 
 # Floating point
 TUNEVALID[fpu-hard] = "Use hardware FPU"
-- 
2.39.2


