Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A74C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:41:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.22896.1707230498040675918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P/LoaQyu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40ff28388a6so2431765e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707230496; x=1707835296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24qJEk90dFcR+SPSIuxeMg1+PbHTSePSAxVpzJgbAlA=;
        b=P/LoaQyuU8pIMQr13O1QTg30I44+PL+/6ckMAn1a1525tTNC3k42j6OCD3q/CCS3KL
         sZ3dRpgAviDW5IpbhKN8g257lLhl/0It5dRg7Zuh2wQ6XPU2Wf+yIh9Ltc0GEIE7j63D
         x14NxxL43oNsJh7fdOsQEni3z0wQsNHrRISRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230496; x=1707835296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24qJEk90dFcR+SPSIuxeMg1+PbHTSePSAxVpzJgbAlA=;
        b=xIl9waNWIkpgDpHbHPf6yq1yp6DhOlx314xgUQH33gdZpZJvhPFynmGhCtFwXGVVTY
         kJJcacxbGLlu6LZs76Kp9NU0DqehIvOEjWAm5JClJEqWQmYt/I72gWVgb14eQjhT7J5R
         A/mL6idCDUepaw+SqmcX/sKB0jTIg7VacnhRTapjqRwtEMcKKHjTvgy30LMx2MzVjdD/
         juIjYRmVt64br2qA9DZRPD82JcSmRSWLR8UA8hhB1AVTlEz6rbWlhODUAO0NAzwt07iN
         W5wjDqOvkwqm77VzMTZUv4V8Ph0xVJWkQOrK1DjFkc4pdBZYoH/+bu9HiEjF8q/7svnO
         hXKw==
X-Gm-Message-State: AOJu0YwmoquMR6v0tNK+xXFio0FbuLhkl/uf/zUsMcaSBKgHIo1RQZXr
	gLqzHny0+ax8yWvJZxkjUPF00l4iUlQsBCJ5Qd3nyAQpMBzj5GstyWcDvizb5r9FAwCvNKUtSPN
	W
X-Google-Smtp-Source: AGHT+IHy1X/If/5862h/M6lMBavt75zgNTFNHB8905iI5/kStd86Ndq2uZM6BPUIGuQRJy5d4tkOUA==
X-Received: by 2002:adf:efcc:0:b0:33b:1cba:d0e6 with SMTP id i12-20020adfefcc000000b0033b1cbad0e6mr1408668wrp.37.1707230496304;
        Tue, 06 Feb 2024 06:41:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:45c0:34a2:1eea:2530])
        by smtp.gmail.com with ESMTPSA id jp10-20020a05600c558a00b0040e541ddcb1sm2162821wmb.33.2024.02.06.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 06:41:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ptest-packagelists: Mark python3 as problematic on riscv64
Date: Tue,  6 Feb 2024 14:41:35 +0000
Message-Id: <20240206144135.2597050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 14:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194996

Most ptests run on on riscv64 but for some reason python3 hangs. Move
it to the problem list until this is resolved so we can establish a
"known to work" baseline.

(was still going after 42000s, long after everything else finished)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 68a3f63a6a5..b590640edc2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -121,8 +121,9 @@ PTESTS_SLOW = "\
     lz4 \
 "
 
-PTESTS_SLOW:remove:riscv64 = "valgrind"
-PTESTS_PROBLEMS:append:riscv64 = " valgrind"
+# python3 ptests hang on qemuriscv64
+PTESTS_SLOW:remove:riscv64 = "valgrind python3"
+PTESTS_PROBLEMS:append:riscv64 = " valgrind python3"
 PTESTS_SLOW:remove:riscv32 = "lttng-tools strace valgrind"
 PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace valgrind"
 PTESTS_SLOW:append:libc-musl = " libc-test"
-- 
2.40.1


