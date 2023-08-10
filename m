Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E5C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.21433.1691683566800437257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gLAhiwsD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686f94328a4so797973b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683566; x=1692288366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CboZF5ZYjUyiL+yEWrimFVNFfpUj/dw8kicNOEAj5gI=;
        b=gLAhiwsDBuc9eyYqN6eQmirex/PvlE6oSfQWf0FH24UYxK8WqvP8i8oemfkzW/gpvF
         rqOKN9O34hRTEk6MQgGKcB9R2Z0PjqanrnkcV6pKEoUQrTcN91GK8oIVPOt8R45mV/6i
         PhZ6pZ41nEE917uwS5Ez+OFu7t1XHUdyNoRXxE4sKfxKypY5w1OkPKaMKHpgW50wgMag
         48PlMosY49y+p8xu1rsZg8rkx6xRsRb+kHgEXDnFDlpl9IlNdRDSNGmuchK3ysQ9nrFr
         0hRLg1lUR3jFfEclws4PKmGtSLu54jmB4k60HNP+ffQVWKOYL4xLb8iAYi9Cd3H1Be87
         qhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683566; x=1692288366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CboZF5ZYjUyiL+yEWrimFVNFfpUj/dw8kicNOEAj5gI=;
        b=KoRqdSK98yxK8YGF2a5TeWLzXWXEVQRr92WuPPy9qx7HcBfoh5yJox60yr/Do9SKJu
         ri/2yLEpB4RuH5IBhrr+cglinn6H3n/nB+XjRxMPuoMGeCetuU1KEgf7Fa6IPKi2BIFb
         IbG/M15qs2ZH8+3jeu5NgytNa+UAk6N5Yc9Xj4t7yPUgrhLvTQmQzbWdrdV5Pmln/viD
         afU4ThK79L4RUDYn9eQNqE+g0ox4uUamssHCvWAUDpuG+cKId4RJuAz4MLCRZa7gBkfC
         /rr9fIF317EI2QO06Wguo0Kr28FemvEcA/sWUDOlrvFxIurNL9N4S1tNSpg+hrDXMFEj
         gpjg==
X-Gm-Message-State: AOJu0Yy4C5UXiBJ3YCQf/YOpLV/nYwm5Q7QiKEAk10BVz7Hk/ZX3hcdb
	A/vt93xz1H86K5A/kO2Lzgl4RMdV6lmutJHX+i8=
X-Google-Smtp-Source: AGHT+IGkCeszz/Cr8KRlxbSxhBLIc96DhG1FKfNOdC5guZpYveLtpmvLluKy0Lkvy5RPz1GN0FNIBQ==
X-Received: by 2002:a05:6a20:12cb:b0:123:152d:d46b with SMTP id v11-20020a056a2012cb00b00123152dd46bmr3099581pzg.26.1691683565803;
        Thu, 10 Aug 2023 09:06:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.06.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:06:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 37/37] target/ssh: Ensure exit code set for commands
Date: Thu, 10 Aug 2023 06:04:36 -1000
Message-Id: <6bd6b7110ea2029fc736a40760536adfaf28eec0.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185799

From: Richard Purdie <richard.purdie@linuxfoundation.org>

As spotted by Joshua Watt, the returncode isn't set until .poll() or .wait()
is called so we need to call this after the .kill() call.

This fixes return code reporting so that timeouts for example now return an
exit code when they didn't before.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3924e94214b5135369be2551d54fb92097d35e95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 764ec339a0..1cd496c2f4 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -262,6 +262,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 time.sleep(5)
                 try:
                     process.kill()
+                    process.wait()
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
@@ -284,6 +285,7 @@ def SSHCall(command, logger, timeout=None, **opts):
             except TimeoutExpired:
                 try:
                     process.kill()
+                    process.wait()
                 except OSError:
                     logger.debug('OSError')
                     pass
@@ -313,6 +315,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
+            process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
 
-- 
2.34.1


