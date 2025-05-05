Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B88C3ABC0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:24 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.42935.1746418517258727553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkX9t75s;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e16234307so17994915ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418517; x=1747023317; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwRWkBQu6KGYAI4vfGEXkJdHZaaivZJFmGfuugqrIkw=;
        b=LkX9t75skd/P4xaTgPOcxUYLvcaTTBJjPjPkiF5L5gyUqIGiaQ+3wd7tEHC6e4gQt+
         5EsEoWzGZ0gmYb0c4liiwxj5NWHEEB2hvh8v1LqCi4oq+xPSFb4CT/X7Lqvm/jJkNmqU
         3k+jXHDWso/02jERq9XLLipIFlJ3CzvJzNp7dZBjTyAtleKkrsNEB2v3dFf00Z42EV5y
         2GemSsMon3vIfqtgiigJAdHYw9LTfkCt2TpQJRHN38181imhbAGSEwsrUhlzIlB5gDHw
         ZtvHY37o1CmF/loBzTFEZwBZ2MjiP6Qv6wdEMD4NXF88QO1UlD/smGWjxIaBiNr0g9cK
         +Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418517; x=1747023317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwRWkBQu6KGYAI4vfGEXkJdHZaaivZJFmGfuugqrIkw=;
        b=pzyFT2dsCiCXBkj+fQddlm5jXjFCH8xN7hZvVMa+weA4mLniDdUqCdzmriYOXE2RCX
         +oJEcbPLRpxCvUuZf/TThsVVP1qINmoDEHO2bD0vxEghZ0Z1591aCNZNqbsa6yrwOZNf
         exJXieKtE3tjigMeMMIY8ueQyzbPtuJJ0k+yqbpphIEDGApMqMzD23P1dwtsdc08dSXU
         rIbanXM/GDSB7CBM4xGunmn1sqFew5wgQzLUXtv3fnH7VZzPeQnCo+lYTIMgBMAxO6EI
         7T9enpeUn9GEIC7wcn7GutE8OZ8emUwjcBRpkQJ5ioQpRs7ad6ry57YkUMqggYRNo+zN
         aekg==
X-Gm-Message-State: AOJu0YzzTFa8ssTp9JNl0ko/q2Mjvzob+NTBZE6SJawB8n3Pfw3/mis8
	M8HWukBta6T9BHLne25OwWxkQ9/LwcYqn2DPBhqDg5WmLZysZoNU
X-Gm-Gg: ASbGncv4I1tTP03eRYLYS3ESuEsXUR98pV6fo1O8B4AdCy0CFs0OSxAzluJh7eqQS6c
	8iRI0C9mdasXiF18Ri8WUfnWORTALBU2hbCTCDIppJZoASGJA0bdeovhNQ0J70ibhePOitj2e5i
	a1w1CJRcw5NYX22e9vKcP4Bse02B4aFITlamJj++GUBrVVYt/tV7pe7PAmHwWjcnwfzTWded60E
	Mjelv3LOEe+HJ4J4+ygUSrFWHZJJ+zuHMQMgtkKzk5NQzMxsSwN2tUa/ZGy+OfkZFYNs8hHToZE
	2c7PhufLcOKYUBweiaxniosjf6d+9mp6
X-Google-Smtp-Source: AGHT+IGCVY/VbtobOHP3qPnovYCXP+IPC3zdQYaO+BPCS7Pv+S38xz23UeIUIFyayf1DFhmpKamT3Q==
X-Received: by 2002:a17:903:4102:b0:22e:16b0:ef8b with SMTP id d9443c01a7336-22e16b0f160mr88747945ad.7.1746418516627;
        Sun, 04 May 2025 21:15:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:12 -0700
Subject: [PATCH v7 2/8] clang: RPROVIDE spirv-llvm-translator and libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-clang-merge-v7-2-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215977

This paves the way to spin out these packages out of clang in future
specifically spirv-llvm-translator which is not yet part of llvm monorepo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 8ae67c8c66fe1834a526be9d274020f1e1fdb6a5..67cd5151df6f551a5316b0d853591b11a1cae878 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -334,6 +334,9 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
+RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
+RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
+
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
 
 FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"

-- 
2.49.0


