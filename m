Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0548C7EE21
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3965.1682502646260224310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BexWMUKf;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3003b97fa12so4171075f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502644; x=1685094644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJfxJ4X9sfCiwlmRnxJkW2b8NRPnZdXK3+fJN+/OZOg=;
        b=BexWMUKfDfsp2ZI6MJIwIM0Y7nsxaz/Nd1PDAzc4grQmwuTxEINUlqbMbVC/bKvL1n
         Ol9KTQ2w7mctV2CY9lAx3E1qjurJRPw2/jlTNTQW3hCCK2CfboXujpbGcyE7zJI7/IZ2
         E4ITsCT0mNz/+94ye57kXLxzf+b5qP0svSiiOq6pAebXgCSwy5ga26fesQgLVPM1kSmf
         A64TBFSmDcLYUIxCEiKmlSVsklKdLYwPrcCoSHMpjflL9RN4S7gK1RlqOw1jL10hLT2s
         iZzjfOZYYVXd+5SqiUSVkmNIrlB9NqA0k2ns3ss7ioRlIpjZW3via2NVP/IEE4+YX52C
         Bmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502644; x=1685094644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJfxJ4X9sfCiwlmRnxJkW2b8NRPnZdXK3+fJN+/OZOg=;
        b=jt8/2v42yySEk4jgcI9ftdjGkj9SN4zmgd2sSGGTNkKWhZCoi6iGs2+5JlrZ5M2ffS
         fNAQhYtONKlyXhvG9xJfqv40+h8zhK2ixRv5fzqcyM3u8EqgXHowbRPmRxps5vdryqlz
         TvjnwBB8M4Kt1xzv+5eSCmEWfdt3iQOfxiaQzIxglt2+C0k3GfOhOZ4kQyCwi6kiUG2I
         0bHyUA7HBdDJSATjcZhvS/1H+Is5swPv0Zxpu7d9k+9CvkAak8Emvp0GkOyzAGEo3hLy
         L58DXtLpLMfLp+CJcnMEJdkMvJLSAqMPTZ7Eb/NJgaVcGUvCjN1KRohnLkEyC1MkIaDN
         cPPg==
X-Gm-Message-State: AAQBX9dq9wLtyxSli3nXroAWX3YjZE7PuRv51hCChZzH1PaCvzJkDrm4
	vrZLJ2mjkG7K4JY7njVchz0PNQ1vqxc=
X-Google-Smtp-Source: AKy350YjjhBvUsOtVEz272J0Rlg4w6tPqB6ZzsuVKnmm3yO51qRWgM5BbDa0RcYO5Qmq0IdkUYQcHQ==
X-Received: by 2002:a5d:5151:0:b0:2e6:348:5fef with SMTP id u17-20020a5d5151000000b002e603485fefmr14556622wrt.55.1682502644624;
        Wed, 26 Apr 2023 02:50:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/11] lttng-tools: exclude from x86 (32 bit) ptests
Date: Wed, 26 Apr 2023 11:50:29 +0200
Message-Id: <20230426095036.2632847-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180422

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


