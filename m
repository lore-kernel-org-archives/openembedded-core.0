Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914C8C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 08:03:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.49944.1690617810628945997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 01:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D7fS3GW5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso31538145e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690617809; x=1691222609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aUVJFowvTI/yG2iFzW8ZekfiV4MfxNYWT7XJuCfQ/s=;
        b=D7fS3GW548yVl3z0gYXP2mH5QuH3M9pq+xGnfUbbM4XFwrXaDUQchF5SclZB9YroMc
         7380lzAFUQbJCqFNDazuLHUx5D3R+gDhngBqfNQp9u5HxUqpzxSj/1qHet9kDhUKeNnD
         gg0pVyRUggWFSUy98UqzJPTPphyAVgxSKw+Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617809; x=1691222609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aUVJFowvTI/yG2iFzW8ZekfiV4MfxNYWT7XJuCfQ/s=;
        b=Dxv83aopkLGi9PrQiJL9bxAEREIJUReDj84/qd7ekNUlfbxI74ziM2WtWWJDb6fSMw
         XcuD2ZO1uRa666OF3YoF9LDrafaw6EsbKBGTyC354QV6195tg7BZRfWR8vH18bDDqiGF
         42gOFpc0A26AtdpZrQ/8IhoftxysQvyVcQO5l3TMj987tWz/2p0/aeYC8aGzY9FtIy1X
         sZLpjEXBmGn0w+7nOyUYgumUZgCyBgJI2+1vYVoHHsnhp0JMSbo6goyTIEm1Icw9Vm2H
         u6SPkkRyDCplRkF/M5U2oIOdK9BlMLDzHTU3XSpbPDCfvwniCEiG9nG77xMxAfkeSF/F
         se9A==
X-Gm-Message-State: ABy/qLY++RdM1wu+DH6pD21CKrSzRy+xVUyRtZyaiTbf9iQ21iLfHrk/
	ck/kpdsVJjglX219uliEze691XAK1Jd5hvtSPuk=
X-Google-Smtp-Source: APBJJlHerdS94k8/c+dhOrwNjvayd+KyfNrl1dJQP8I+/EklHedFuOJvzshLY4+D+zR2Qr78y+VFlQ==
X-Received: by 2002:a05:600c:2181:b0:3f7:2a1d:1b05 with SMTP id e1-20020a05600c218100b003f72a1d1b05mr3536756wme.14.1690617808787;
        Sat, 29 Jul 2023 01:03:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f929:4921:3439:ee63])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm8710813wmc.0.2023.07.29.01.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 01:03:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>
Subject: [PATCH] oeqa/ssh: Further improve process exit handling
Date: Sat, 29 Jul 2023 09:03:27 +0100
Message-Id: <20230729080327.1749156-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 08:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185050

It looks like there were further cases where orphaned processes may be left
behind since the .kill() calls may be unsuccessful if the process terminated
due to the terminate or through normal exit. In that situation .wait()
wouldn't have been called.

Further tweak the exit code paths to ensure .wait() is called to update the
returncode value before returning in all cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 72ed1adbf89..f22836d390a 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -265,7 +265,6 @@ def SSHCall(command, logger, timeout=None, **opts):
                 time.sleep(5)
                 try:
                     process.kill()
-                    process.wait()
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
@@ -274,6 +273,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             " running time: %d seconds." % (timeout, endtime))
                 logger.debug('Received data from SSH call:\n%s ' % lastline)
                 output += lastline
+                process.wait()
 
         else:
             output_raw = process.communicate()[0]
@@ -288,10 +288,10 @@ def SSHCall(command, logger, timeout=None, **opts):
             except TimeoutExpired:
                 try:
                     process.kill()
-                    process.wait()
                 except OSError:
                     logger.debug('OSError')
                     pass
+                process.wait()
 
     options = {
         "stdout": subprocess.PIPE,
@@ -318,6 +318,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
+        if process.returncode == None:
             process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
-- 
2.39.2


