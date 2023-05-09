Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBB7C7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.39289.1683653031361427637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dx07UQH4;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9659c5b14d8so1001447266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653046; x=1686245046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BhVlhr/SnaVAzTUmt9puT7zuwZZhGbuzyBt9KnwJnU=;
        b=Dx07UQH4Qft60XKUqf0DOALx5UY9BNr0tRRnOZw9qsqSuhWPdE6f03G4hM/PEwjB0X
         zoyvcuzNQMV3msDTN/D2+Vk7h99dQbm/q0TA2Xv3zM5i/7Rtvyh56my8pBN5inczoYp/
         mhKl8rADqJFOA0PGqYbkmVNZwvg3k/HZSQ+Y4Ipe10bTKKDC0YZNvBmvnIxaVSHNWCOC
         EyyT7wEmEoyUM3GqBOVOX5pgpAmZs1iIVYRixJZfN01WFHNMPp+9hcTHpoMgd0H62Bf6
         e+QDBqzMLgkAuPZyEeayEqNOfnW6kzSqV7PggzH8zbdVjCSLDS7YL0ZxUW+bhMvsJ9Zs
         p4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653046; x=1686245046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BhVlhr/SnaVAzTUmt9puT7zuwZZhGbuzyBt9KnwJnU=;
        b=Vmf7l11/T4bSvp0LZdrjFjYL685NNC07wYGG9q7WfrXhAFJ7rrjpJOXGNbXhbcAszt
         EEt1cwn7sG0IB/VTP1wQJ3W+heT9nxcuCrX8Pt9fL57+aW8R19jbabniRn9J4fyexbI7
         wAQbNw7kGMXuzxprH6aFFlo4oi3iPk1TD5t2fF03sH2gm2q46J4MyTnP7QNZpD/Cfj4X
         tlCfTfsei//F+pDKpw2BWkQDmcgR9MGiTZvHChTZmQnIRQgkFQwzhpFL/IfcY1lTi4sf
         gjA6jjWW65p913f2LGMrXW4WQ096Nhj+8iNOKmjpJBrmqAKvpwl5ynVFGooev9g8VXPz
         t7cw==
X-Gm-Message-State: AC+VfDxR2DUHG8hSS4cP0/nk7Vss0572x4PIY4sNUjJiG6lrweUtANFg
	nHxS0JZXCOVTsDtd5H18HTWVyQWYdc4=
X-Google-Smtp-Source: ACHHUZ5grKP2rGfRuCmorksqFSLJaHzFfzXZZz0DypGOzTfv9Sh6C1ynSp6fFnKwVqmrYwWDdUI0DA==
X-Received: by 2002:a17:907:6e07:b0:966:4033:d1dd with SMTP id sd7-20020a1709076e0700b009664033d1ddmr8451186ejc.34.1683653046110;
        Tue, 09 May 2023 10:24:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/27] gdb: enable python PACKAGECONFIG
Date: Tue,  9 May 2023 19:23:42 +0200
Message-Id: <20230509172344.1516743-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181080

This is required by latest valgrind ptests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9db61b785f3..5a41cd17dc6 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
-- 
2.30.2


