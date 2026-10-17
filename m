Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62F1CCF2C9
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4507.1792236249771541879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dgfuJDN9;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so394541f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236248; x=1792841048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNqe7cx90CBt92s+MnE1dlFKsOt1Z6z/k5F2sETynw0=;
        b=dgfuJDN9xnD7U3Oqd8xqsx+IgEFDas7F37xvrmmtJ28KBZ6ZNrjU7lMevqUHc+kWUM
         lSZI8aN516XFJclGbwPtsfS93Hd0qOhhJ1kxjpycw/Vh8pVgFg4cvexpKJJonR6e+G4K
         OIvDooyX0n2VKsiRVhRXsYi0uR3++v0VcpumtDwH6JATmoXlHet4IDBoNZNlkWxus55A
         I50WArzTdMIgn5fB8ICnpa6MZoFpB6oOWxqDgcMPg4E2gB3RubdptItiYaPEDyrPqzWA
         6OKyQojOKJO53PVB1Q5ltJM9Zo+A81rnoN4elJQfwI7DS//pSLRD8bSKVkDqzBc0StyD
         bU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236248; x=1792841048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNqe7cx90CBt92s+MnE1dlFKsOt1Z6z/k5F2sETynw0=;
        b=AWOB4kgFSF138kLDkxvSYCWXsPFfcACpJ0b6nzDJEj9t0yDs8ShfdrQBG2kayoQRqz
         xAsCyYaTRNYuIb0F+UvdQD14n+GpizD4C58t4arGLCgsQdCsA5UGxf1IeP8yUU6T6PSK
         Gze7cHU6sVI7CTsIZXiQX+6zfQO8t3pIPLhjBOBCavjEQS1lJRuK3Xiu1LLQ2D2A3DHL
         KStgtNvnWKUDZdXHwBBH69lB56R9bHJyT5CTYQ3pvii25zb6zr3NieunZ8tzjKZ+IAuR
         /sKlJQ6y3NHtzj8AaS3bkJYeGFlx04ULahZ/R9VcBGINQU5TYI3S2RMMRsfoDFQZ3wFZ
         g89w==
X-Gm-Message-State: AFq9FYLkBCDBUcUeXXLqKYdncVSEqU3CJe1e78Jkko10yRE3k2O5UlCe
	u77bCc0WX3B223GWhMf/Ba8GJhzB99pDSAmRK7uGjiBGv8TGtMHHtIqpcPtWi1Vx
X-Gm-Gg: AYBFou3jBf3euR74f942R/TfmL3+B9XfQieYyyH1+nBD2LRcVyHLe7pAJcChoaEplbQ
	4ODWqW9g0icqxsxPxdE6YMoh2VUVPpLiHqoD3JRdnqUox+cxSXnte+NW/l6TVA35fZMSOiyqO+l
	riUrYjTiCkFKcuL0XFZoq7uF4zTGXP2/tvDKYCDWiTYCLwoqUC4OCNtuxwAKCVoBQsiQdWsVwrQ
	8EE5dSEDeAAox+bmx2S6eStSQCWbf4in1Pg8BWasLefnC3RYkEl9/Aij1wMYEITc84favfhqvap
	YYvYq0TfZhWYdnlQq81TBLXaWShK2hhyUNOKcfHLbPLLFi0r5JpkYIRwcwpYhg/DfABXYLg9mHx
	wYei/K2Ul95wY4YOa1JmkBt5VMjp0LBEUz8pqtFy0789QXstH51VmW9UCvAbpfrnotegQshcmS9
	aoNK1ZLG9Y9al0yiduhYDtJA39X/UhIrZVh6hN0x0UKXHpcXy/ygE6cNI7dQJ5jiAnwAITxoz8v
	bVp
X-Received: by 2002:a05:6000:2611:b0:48d:ef93:67a0 with SMTP id ffacd0b85a97d-48e07fa8300mr4766004f8f.50.1792236248016;
        Sat, 17 Oct 2026 04:24:08 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:07 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 3/8] ptest-packagelists.inc: re-enable python3 for riscv64
Date: Sat, 17 Oct 2026 12:23:52 +0100
Message-ID: <20261017112358.77434-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248082

python3 was parked in adc448b19e because it hung on qemuriscv64, still
running after 42000 s. It no longer hangs. core-image-ptest-python3 on
qemuriscv64, in two runs: 44546 & 44548 pass, 0 fail, 71 min each. On a
VisionFive 2 (JH7110): 44698 pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5e99b59d4a..97c6e35050 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -159,9 +159,6 @@ PTESTS_SLOW = "\
     zstd \
 "
 
-# python3 ptests hang on qemuriscv64
-PTESTS_SLOW:remove:riscv64 = "python3"
-PTESTS_PROBLEMS:append:riscv64 = " python3"
 PTESTS_SLOW:remove:riscv32 = "lttng-tools strace "
 PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
-- 
2.43.0


