Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862E3C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 11:13:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.29846.1690542797860521124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 04:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VCJuK/Fx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso20992415e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690542796; x=1691147596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD5AOJuikGUhVo2M1WQir+tg/leYnrRhl1HCm87O+9w=;
        b=VCJuK/FxAlq5k5sJJUwuUWazQRcpvyOPJgH3JCopgKJ205hkwoyL++JBI8L7Z3iiiO
         ub81zpJPQ+11MPqGrJLaXn7JRnpG7FZV4qwTv32lVOjRGMiGcm/G7GwfVBJzNntNJ+GJ
         0oZc6StxLn5AUv7pHJ9gRLBtAgbbxLnYXJXJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542796; x=1691147596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD5AOJuikGUhVo2M1WQir+tg/leYnrRhl1HCm87O+9w=;
        b=YQuvs96RMv2eMZqdVfUKGE45Oasjd3gdoEGh8gF4CUdADELA/7ii0BIo/8iVjwMesG
         YPEpf+6xer+RtWBMIgOfC/3MH0XhxS6PTEO1uHcAXqQhrqvEIRaNwJpIYXJ16NDHxEu9
         hfeFf6H23ypZ7JDOiouADtzw7yBm1N/qgixPgP0dUDFoRTfDonOe3IsFCJIszL6EawmP
         HBpKxdOAe/qKnfXBF9yYx/y3O49zP+28lKEDW4O/wG2J/BC6K9suXONoAPfvFICFJN3P
         0E2KWpstfhc9+nLOOt9ma7rlRALF5BdOdZ16HmNOac8ScPufalAsj4V1cFc3Mm3XeDbv
         2/0Q==
X-Gm-Message-State: ABy/qLbbNfCNmchuCVT4P3P2CTgDDOqD+sgSqGSlnDNU/jYihw8sJcRf
	N4KoxgBCA+5CexTBMbrsZYj9A4Y80Ob8Ln+2wNU=
X-Google-Smtp-Source: APBJJlFo4jMp9XR7q19QULc/qc0KoN6PaukifIqovFdIBr3i77MBlB1HzSm0PBUD9TBE3MR7zVTQig==
X-Received: by 2002:a7b:c7d3:0:b0:3fc:f9c:a3e2 with SMTP id z19-20020a7bc7d3000000b003fc0f9ca3e2mr1448847wmk.6.1690542795877;
        Fri, 28 Jul 2023 04:13:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4e39:f3a8:af2d:87a2])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc311000000b003fc02218d6csm6730736wmj.25.2023.07.28.04.13.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:13:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] target/ssh: Ensure exit code set for commands
Date: Fri, 28 Jul 2023 12:13:11 +0100
Message-Id: <20230728111311.1665976-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 11:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185024

As spotted by Joshua Watt, the returncode isn't set until .poll() or .wait()
is called so we need to call this after the .kill() call.

This fixes return code reporting so that timeouts for example now return an
exit code when they didn't before.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 243e45dd99e..72ed1adbf89 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -265,6 +265,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 time.sleep(5)
                 try:
                     process.kill()
+                    process.wait()
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
@@ -287,6 +288,7 @@ def SSHCall(command, logger, timeout=None, **opts):
             except TimeoutExpired:
                 try:
                     process.kill()
+                    process.wait()
                 except OSError:
                     logger.debug('OSError')
                     pass
@@ -316,6 +318,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
+            process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
 
-- 
2.39.2


