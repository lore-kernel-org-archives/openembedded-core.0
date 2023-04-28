Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46506C7EE24
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14759.1682671710395592069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wt8LLO3K;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3010889c6ebso5874509f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671709; x=1685263709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJfxJ4X9sfCiwlmRnxJkW2b8NRPnZdXK3+fJN+/OZOg=;
        b=Wt8LLO3KQPhU3jDu6J54wiYuctpRsDj1baUffdcAl6AXdsek1O9A9/NEiZ/LxoDB7W
         kfsnrO+S749sXX/mBu7AvMvdEYzlioDmuQV0lh0F1MJNO8FQ2qP4xUSrtomQZFD+DWf5
         PC7GS6KZlvsw6LewMj/nVg1TVdHdTYs58R2z6tn+qAGoyVfzjFIjt527Lv4ykOhafgWg
         Cugq2wn5FelVP8+SUrOpc/Qt5yh2e4MgtwCm7xViTYGRTdkPmmewS87RpFzN7DyzWLqA
         Xi+EepfKEvNJWUeIiGnoL+Qbgz19lCKDcYBfh9/tbWw6r21PSY9VBjVDBCTjCdSICJj1
         CN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671709; x=1685263709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJfxJ4X9sfCiwlmRnxJkW2b8NRPnZdXK3+fJN+/OZOg=;
        b=IYthACu5qJ6K7Y1+tw2o4Qifdl5I+8uE5Jz35Wj8gKibEtGguX1xGN5do+VRvn26Qj
         wQgIe999k2Wfd/ylzYTSy3vtC6E/vXfu0UIvsGtjdILIUCG/AzgGKAdqkIyiD3Brnmgi
         2kS7ATJN8N2OFkXfIQe3FhSHkBxcqGoBTiDvZ0elgif4O5jmXUx6rZ5tiMjYLfvahSf/
         ZPk0o8XNEQb0u5N0BAvfJYRQpskVyFDfa+08fvQV1K/iFqXJ/81NjJuLG1GoLxn8YTxj
         G32bK82f3jnlgIJ2BILuZ+S5/lP1m4OhkxDgniwgU82xc910rNA9otcl+08S8Rpu9Xrx
         3p7g==
X-Gm-Message-State: AC+VfDwIzUpHpM7c5GIZHz1e7jsUVPKywGXtIcbOrmIceKan52WM0M9x
	yL4zLD/jvD4AzPsrIm/jkiDeL/tiRo0=
X-Google-Smtp-Source: ACHHUZ46L830IvA94w0SgoDZdM5R+ruoGcjBLoOCd2QB+BqQi/heGs+h9ZefY9PFndKUDQnnYR0pzw==
X-Received: by 2002:adf:f583:0:b0:2ce:a30d:f764 with SMTP id f3-20020adff583000000b002cea30df764mr3078654wro.21.1682671708924;
        Fri, 28 Apr 2023 01:48:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 04/11] lttng-tools: exclude from x86 (32 bit) ptests
Date: Fri, 28 Apr 2023 10:43:45 +0200
Message-Id: <20230428084352.836515-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180515

Please see the comment.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/ptest-packagelists.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 77d69c9fcd1..39b885066ce 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -118,6 +118,12 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 PTESTS_SLOW:remove:x86 = "strace"
 PTESTS_PROBLEMS:append:x86 = " strace"
 
+# Needs support for 64 bit syscall versions
+# which was added in http://git.lttng.org/?p=lttng-modules.git;a=commitdiff;h=86040c9e2ff8a79633db34220e32bdda536b00e6
+# and should show up in lttng-modules 2.14.x
+PTESTS_SLOW:remove:x86 = "lttng-tools"
+PTESTS_PROBLEMS:append:x86 = " lttng-tools"
+
 #    ruby \ # Timeout
 #    lz4 \ # Needs a rewrite
 #    rt-tests \ # Needs to be checked whether it runs at all
-- 
2.30.2


