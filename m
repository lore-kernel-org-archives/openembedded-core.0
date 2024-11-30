Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0BBD73601
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:27:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.133018.1732969657443025716
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 04:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DiuTv0Zq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e2880606so777271f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732969655; x=1733574455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0DH//UhrDjpySZ41Gs+Z9CgzGGTuu+bXzJU/W8rjGk=;
        b=DiuTv0ZqwzxobZjf4QEW8hroFKe5wtIl5wwHiCEcsIELo/4fi2URYDnUOvpLDtBLc/
         CcfGhRdV8DBTzROz38KnJhECLj+yiOIEC8jdXygjLad6kYP10gPnzd5bM5C3XOuvJMeC
         818ivz2yHjS1RCX0qd3DudHxRKSvKaNthSv2iZWW8Z4qENU8O5+Zt3sGTNwIR8zOkH5P
         P7Tyxp88ZThZqAxvdGYqWTAGQuMoCUlnZIpzdTniQnhg7cA4zgLuNcIhNZ6S8UI94TZB
         9y4CstJi2oZ7ZsZFxFQcgkE9+SI21wPl5TrX5iawmFjZOP0YjH9sRRuS0Dhhkx4UxY3m
         dFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732969655; x=1733574455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0DH//UhrDjpySZ41Gs+Z9CgzGGTuu+bXzJU/W8rjGk=;
        b=FkftNWvjHS+hyiIxLu1Bx+esfAdCvaPjc9OQmWUBVUN5M05nMCyN6fqN6itF7ZtngT
         Esb/a3RD73ogT024/Z9JwvGQvB9Gg1sz7pa3VFa54xD5G3uFrC8LhRrDp9EZ4jlIPVYf
         LJvLqcLal5lT6rtVJMhoZG9JGytwxtT8TZddZZKJmmWsqc863ZVMNPHaANykRBSFBbz6
         4DuZTQZcJDwv0mEMeMBu6+cB2wt6Ow1UhiXyIMFW1xjTekPnmZDHYQ7Q91/Mgcxuqefq
         shRsvR2bCGvKLSc3tSNFIkzazE/5mWyDnuGt98GnNAgyHd/agta2LYFg26kRxQEorzRX
         0o7Q==
X-Gm-Message-State: AOJu0YwFrCGCgFSXDF5YS7bCin/qKZpXEOY0xZnkbLSXUBBtVt4K1Xlz
	FB6XPOYreutR5wi3pocBhdaYJ6u2I2B8YstFyUf3Bx+Rgk2rTEEX94OZbw==
X-Gm-Gg: ASbGncuBm1yZvr7MW3+XtLc8HAeW388hz96Y1+SAcmtpxu9mWn9AULzu25lB4fSYMIE
	FKUyK1PkMOSb+7fm4gtmkFj5L3Axzhib33/lzGCvyZ43YHypgV+gX16a0fYjcGEQ/STIEJyBKrB
	ODmNSn4EbGQBQgrM/r5KLsSwP0SLSKFhnfr9fXgr5urQMcFwkjCOZQds3w+7vulAXHW37ZetdqI
	5lrXliq/y2Hzv/JTBKkDThsABvRmr0jm4ZyV/3DrH1N85b/Lxu0zbrjwWDB6WwMvg70Br0NpMI=
X-Google-Smtp-Source: AGHT+IHP86pVbXRIvYSIP+cK5fl45efwyu7ZJiAjdDycc4Gq/oAoG+S9QoyFbVpf6ObK9zEk2Tsl/A==
X-Received: by 2002:a05:6000:1446:b0:385:e5dc:e285 with SMTP id ffacd0b85a97d-385e5dce400mr1685982f8f.58.1732969655341;
        Sat, 30 Nov 2024 04:27:35 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dec66e0esm4487177f8f.43.2024.11.30.04.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 04:27:34 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-poetry-core: drop python3-six from RDEPENDS
Date: Sat, 30 Nov 2024 12:27:31 +0000
Message-ID: <20241130122731.4535-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 12:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208043

Looking at the history, python3-six was removed as a dependency
in the poetry.lock file in v1.5.2

Even before v1.5.2 and until now (v1.9.1) there is no code in
the package which imports the six module. So it can be safely
dropped from the recipe.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index 173c3bdb68..ea4164d06a 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -35,7 +35,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


