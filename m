Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D82C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14058.1676902729285837393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=poDbwJHt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id dw16so420872pfb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdJK4UfanqJxNXfyGFrXDR6RoMDH3dic4Yd1NpqSz5w=;
        b=poDbwJHtskIZsBnd2IBDVMQJXZKh1hjun2qOgvDRVOfbj8xwjlIkq7Si1AMmDsjvuT
         EVs8h2/iP/5YhqyXcluPfa37WxesK8jZZx6pmn3FAg9YKLULLStHjk8QgPkXQCZCMayu
         H0RAWHWHYkawdfrWnZ2jQEkxY34by0rYIwQMMkoFBqkJ2tp/Dm9azRX+++3atsDVYiCB
         mpZk29IlMWjzhNeaRVnpWKtXps3MSl/SIuq+CVII/WzbKRbQh2lGQAHzwqz3G62s5BsW
         guhAPmfFCgBdK3I4yuyBGfPRtdvU/vbaeTkGsAQnDi+Eka6a0jqemEdSrOsJhTQZzXz/
         0JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdJK4UfanqJxNXfyGFrXDR6RoMDH3dic4Yd1NpqSz5w=;
        b=Wpz0E7Xs2lva+/svhFBZjZSS5WqMfhf3O1XlT39a1RGPdI5v0eV2Zr1InmUHSXh2ZJ
         lMXp31IoR5rnPGzqpOARWQlnFFYuF9cQWRjJwBMT9M+c3otm/V6BiXYyEwkrHHjT3BDd
         NE3k6jji9yTW73VtKBq9YT83qrwGY8V8TABjEK+hnAiaQPFFvx9SqvmrnZXf1JwA+uvb
         FC2Adcr26ZZ0GaILK7Svtx9ijjO7FeF3Xkk2O2M+mIAkS88grnd3E5bilqIj5EAHuUuX
         fL5kpb/0eXhwQN7I04EJX5oe2bk+ooS5Egms2vB/1yWL5fvse/aY60ZYQ4+Q7GGjcqYp
         a0vA==
X-Gm-Message-State: AO0yUKUqidOBPL0hdIfcGBirSJH9015UURfAHD60XyjhIOiEVv75aLhQ
	796dF7G+0ByNC5CaLR94e2dQPAlrfY5whCa48Ww=
X-Google-Smtp-Source: AK7set/ROOb9jVyruX0wY5C6WSwHcb8Goj3Y3guwaxYbLqwHwglhZNp2aiIEP17zyqjuXruRuE1dIg==
X-Received: by 2002:aa7:96c9:0:b0:5a8:bed9:3509 with SMTP id h9-20020aa796c9000000b005a8bed93509mr1174128pfq.3.1676902748818;
        Mon, 20 Feb 2023 06:19:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/22] oeqa ssh.py: move output prints to new line
Date: Mon, 20 Feb 2023 04:18:24 -1000
Message-Id: <5346b927a9fba57b2bb41406fcac09cd6369f26c.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177423

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The output from is garbled otherwise and it's not
easy to remove debug output form real command output on target.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 917a70cbc43ac1c70c477b220c4115735457ef04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f956a7744f..f1b9090bbf 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -240,7 +240,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             eof = True
                         else:
                             output += data
-                            logger.debug('Partial data from SSH call: %s' % data)
+                            logger.debug('Partial data from SSH call:\n%s' % data)
                             endtime = time.time() + timeout
                 except InterruptedError:
                     continue
@@ -256,12 +256,12 @@ def SSHCall(command, logger, timeout=None, **opts):
                 endtime = time.time() - starttime
                 lastline = ("\nProcess killed - no output for %d seconds. Total"
                             " running time: %d seconds." % (timeout, endtime))
-                logger.debug('Received data from SSH call %s ' % lastline)
+                logger.debug('Received data from SSH call:\n%s ' % lastline)
                 output += lastline
 
         else:
             output = process.communicate()[0].decode('utf-8', errors='ignore')
-            logger.debug('Data from SSH call: %s' % output.rstrip())
+            logger.debug('Data from SSH call:\n%s' % output.rstrip())
 
     options = {
         "stdout": subprocess.PIPE,
-- 
2.34.1


