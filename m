Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D453C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 16:27:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12027.1690475224395802324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 09:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S50tfmZa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so1228653f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690475222; x=1691080022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydrABrsblzlZEUgvMpe80gxmOk97srY8gSr1AnfhG6Q=;
        b=S50tfmZakoMa7F5cDhRK3rc7RBOPJpH3CEgjgb26TVDCXlyHydC1GOOB4f1h2ess75
         ApHiFU1vDGGzeJeU1yYKf5EHYo/T7NJW6NhQxA0uarjn4sU4z9mHgn2LV1qtEKHvErcH
         O+bteaGKt8UCzf+cDdBLgHXbJ8J4ykcNcSRUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690475222; x=1691080022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydrABrsblzlZEUgvMpe80gxmOk97srY8gSr1AnfhG6Q=;
        b=eZ45OgCZEV4xiJLoiOHCrgbVXbhJHbyZi0bFuMN77NBltYtsx355vi9XsV3Y//fZ02
         udNCAVXfZDp30lYCF57VHGMbMBu2NQPzi9/tPupD5lb2DBMPXC2P/CG/JlzrigxrQxga
         HAApeZOE9N9lGBg6wbZKjc5Gdg5QjeMnwjr7gSou1VQ2avrRrKmQ8B6aLJ65Mkg6Hwup
         gGheUkl+Dm99Fb2Etrh+foJ40yorbIQsKUONhxSvSqeq/GQy2/MrNWdPXXSR39IP1g82
         Nu3P7dFzODan7QXlB5zvpbDR9VCT4AclE5sV5VitbXHG2gKdAoHnzEqiIBIjkyiMHxzz
         49rA==
X-Gm-Message-State: ABy/qLY6SHUyDDPK+FbVKVdjE4H8n7hLRNchl5S51EVJbT/IR8dSSi35
	AIdxaegatnoQ5IksBs3/5JpGJ4z7UXEgkVtbgY0=
X-Google-Smtp-Source: APBJJlHAJqofid9uBB5jiHWqfvyJuIq8kU5OBVhfbVW354bL5V/F/lLtrreyOlqcZolozxeoFGhDtA==
X-Received: by 2002:adf:f0c1:0:b0:317:4a0b:c4db with SMTP id x1-20020adff0c1000000b003174a0bc4dbmr1980440wro.71.1690475222362;
        Thu, 27 Jul 2023 09:27:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:efd1:4b49:509f:a1e1])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d608a000000b0030ae499da59sm2440568wrt.111.2023.07.27.09.27.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:27:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
Date: Thu, 27 Jul 2023 17:26:59 +0100
Message-Id: <20230727162700.1576131-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 16:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184969

We have a suspicion that the read() call may return EAGAIN on the non-blocking
fd and this may truncate test output leading to some of our intermittent failures.
Tweak the code to avoid this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index e650302052d..243e45dd99e 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -253,6 +253,9 @@ def SSHCall(command, logger, timeout=None, **opts):
                 except InterruptedError:
                     logger.debug('InterruptedError')
                     continue
+                except BlockingIOError:
+                    logger.debug('BlockingIOError')
+                    continue
 
             process.stdout.close()
 
-- 
2.39.2


