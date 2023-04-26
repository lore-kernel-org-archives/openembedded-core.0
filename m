Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD334C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.3964.1682502645600861971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q1fCVHT/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f09b4a1584so46992035e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502644; x=1685094644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FCKSEiBKsdnPnOfQ0KJHVx12u1UKgE8eNKhQz0q4XU=;
        b=q1fCVHT/EWkmh7ppShORwpHZARYwhX3kBufghaBuqCBrpTRMOUDUzIA4ibGX3xC0Du
         ZivoXsGvJwYMkolxlitC6bubO5QSz6YBcGGJ1A0RqpkwwH7wDwEWFsxsVpDUmsSkpyq+
         nU1Dvgi2jqDJ9vgaj/MHEMo2Dyk3BM/XKS8JOQvjZ7A+HaiGoFy9gLgXv+UrDZ2PhfO5
         HJGv6P+3O2ggyJc7YRAKMW2HqqVXlAxq83pQ71hY5dvuuD9/cLXk42PsWmjjTD1ckNPJ
         nX5CASTQre0HTEdhHgHN8QqUgDtMPQ4EZmJFrd3YPGgJW3DEwQNiRcpceTlOoKGvk445
         YEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502644; x=1685094644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FCKSEiBKsdnPnOfQ0KJHVx12u1UKgE8eNKhQz0q4XU=;
        b=WgFokie5zAwX5VNlTyMtrxjxypwlOFzufbCvDF/r1aLAw5kFbjLOmH3jE9x9+eJ31E
         rB1Um3fntQsVmtBbPMKwsqUaszHmbT+d6FtPUUExf++QT9Aj4DSdp7Q6YAlWnCSQgvfK
         73mfBzzH5124pspZZ5jKKh/T5MTlUucBy5bPKDnHGVIFI13gyWxVfRgvXWA3EPDUE0aO
         HOjigQRdxZRUMCjfYS7GB27qMBfzZnuLAjdAt5apht+XRyt9oLaCaKErpsweuZy30hAZ
         KfzrPr34c2++DqKl9dSKVoMVGqYwpyXQ6Xic+O/Jek7mMEif28AX2bBP4+3ncx9unofI
         vJoQ==
X-Gm-Message-State: AAQBX9cspZxHKu5GKi7AZl3rdY4+eXUxhlOPR47adJ65buMvR7e6Fms2
	fVxHjxm90LQGSd41EAxz7Fnwu1HYiQU=
X-Google-Smtp-Source: AKy350bMDeD0yIrWE+nMlAnhOhsQ7tctcklbqu3ybBHLyoWfQt7wAFja56YDavV0I2dMEwGypdUA8w==
X-Received: by 2002:a1c:7409:0:b0:3f2:4fca:1b0f with SMTP id p9-20020a1c7409000000b003f24fca1b0fmr6873455wmc.24.1682502644113;
        Wed, 26 Apr 2023 02:50:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/11] strace: exclude from x86 (32 bit) ptests
Date: Wed, 26 Apr 2023 11:50:28 +0200
Message-Id: <20230426095036.2632847-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180421

Please see the linked ticket.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 78750a0d98b..77d69c9fcd1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -114,6 +114,10 @@ PTESTS_SLOW:append:libc-musl = " libc-test"
 PTESTS_SLOW:remove:x86 = "valgrind"
 PTESTS_PROBLEMS:append:x86 = " valgrind"
 
+# https://github.com/strace/strace/issues/250
+PTESTS_SLOW:remove:x86 = "strace"
+PTESTS_PROBLEMS:append:x86 = " strace"
+
 #    ruby \ # Timeout
 #    lz4 \ # Needs a rewrite
 #    rt-tests \ # Needs to be checked whether it runs at all
-- 
2.30.2


