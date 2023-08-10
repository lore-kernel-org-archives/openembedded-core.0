Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE74C04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.21428.1691683559949534699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WDxPPB9b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc7b25c699so8075435ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683559; x=1692288359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puddgIvHuM15odN1P9N/MIGq2a+jknx9jgzvEP37PvM=;
        b=WDxPPB9b1//UbXPFg7Hw5oYNI47kME8PSJLsIskDRJQHLlkYjyI3s0cI+AlY6cfahW
         hSjfSw/l7I7ah9lOrCo3fw8C9xdXjHwTqz+i0PseE9ogxueZBgcAHU+BqzYGtgNMMuzP
         wPUfoWyETzTdyGanViB/z3dQwY/HqbioaJ3WMQKk31D28RKXIcTD6TeXddIz5+O9ba+T
         D7fbl//zakPgpgX8q/DEewpOiCf6Fwv+cefVyVCrFjvR0zzLkwN1LLuVYDWuAMQ+z9lI
         4KIaTA3Z989RvSrM0thKki0ggsms/uFkR+Se8+Lm20XrZAZtiyDXbOPJhIgPcsVMzp3I
         f5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683559; x=1692288359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puddgIvHuM15odN1P9N/MIGq2a+jknx9jgzvEP37PvM=;
        b=lmcRHs9Y443GVVo7wW5OH/7c2+im4fRXZpyUubSsyPa/wuqd2KRde5o1tp3TF1lXHA
         FTlxUt4cfuO2f7igndYJ+PPVcM/naxLtbdx3om5ypmvx0S94QPVqRDE5njDiP1OX66sL
         b4KreM3UFqj2wwdop43CxLpqv7bgSFvD86duebp3zGEShuh1m37FDDmfzIwJYvKDb+3b
         GGaHvcL4Ui206numUicIgsgz/FLuX45VFHh0OenqNQHOR+Gyeo76113WKziSK1MQjhp0
         lNu4oAovifZlMAfTyz0/t9ER9iyN0XADTpU+5tdKLgLmY/c1QEACHcmAXEpAY1k8MTyu
         6wRQ==
X-Gm-Message-State: AOJu0YzMSp+Ky2k2jMTpCxnTr37nPzGMXlQG4CYTn/QpDLVvO9/wSVG5
	JmzCEENiCKJ3O4FPtM5S+aKUhACHD1cKdXB5U1w=
X-Google-Smtp-Source: AGHT+IGw3SIvEezZZd0P2VnY1R03XCirLBYRxwHlC94P0Dn9Wqu/dMQ/CvUMVAZYtRNvwTMNv1UwZQ==
X-Received: by 2002:a17:902:7d90:b0:1bc:afa:95a6 with SMTP id a16-20020a1709027d9000b001bc0afa95a6mr2300819plm.40.1691683559028;
        Thu, 10 Aug 2023 09:05:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 34/37] oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
Date: Thu, 10 Aug 2023 06:04:33 -1000
Message-Id: <fd9e47ee5653dad1f24d823d32d2012e7f8bb3a6.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185796

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have a suspicion that the read() call may return EAGAIN on the non-blocking
fd and this may truncate test output leading to some of our intermittent failures.
Tweak the code to avoid this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8920c105725431e989cceb616bd04eaa52127ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 51079075b5..764ec339a0 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -250,6 +250,9 @@ def SSHCall(command, logger, timeout=None, **opts):
                 except InterruptedError:
                     logger.debug('InterruptedError')
                     continue
+                except BlockingIOError:
+                    logger.debug('BlockingIOError')
+                    continue
 
             process.stdout.close()
 
-- 
2.34.1


