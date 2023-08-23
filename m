Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E267EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13113.1692801452354706116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Kn69VMY4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bda9207132so45367695ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801451; x=1693406251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpdHRRWqDQbgkYbxbq1Vad0jBj1+MzsdLLzygLIFaI4=;
        b=Kn69VMY4SWGACpmfQLB3C9AsFebZgp3zxG0BAn9CyuPafiEI4tnUqY+/oaNcKzn1GC
         Gvoag6Rbad4/Ml4lLkCjRJD6V0/gQ3JfQZr/GcmthJ2ZUoMH5ksIDQAlRK5Ne57MDito
         W8UCkRd2NyZZGnZ4lEK6VHV37Z9kqwhLivVgKxfj7PIF2IbxO4iUVQg76LZIJsLwAcJh
         HKalScSspsALintj251KPIdsrysTL76ec1KFB90koa5YArovMzq6zuyqid+3MMpSJtYs
         2x2LzEADZMOpvoDooophXb9VHu78qTMwAdR2P6robzDt0jMVaUWtwgXDXCCPdQ5bUkQf
         JqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801451; x=1693406251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpdHRRWqDQbgkYbxbq1Vad0jBj1+MzsdLLzygLIFaI4=;
        b=lENxvSNE1oxFdF5s5LFoFOAIjcvo9kmC/CIHiBkF6MpTgYleddGJjF79pGGZpIbNEn
         tDhcyipNZ6/z6f+izZIH+Y5nuAUGSwBbWpONrifh0f0Z60rYsYYrcewubQKW10QJXFcf
         P6FPnKrzJpkPuyU9gZa/ZRboy+3rzmsGbKhE8Aqu7ut3Xxk1wH7lKpuz9xKJcqY5H1Ig
         mzOMJwQpdm3mVZ67G2FCcAyz8i2YZjZN0gMkNx29HIOMBQRH7w24LuFei1+wJBWr9nIZ
         yxjLpTvmkjBQ32AYP4Wfk69wz7N5ZNeHqEN9Lh6Lq7c+dbeHT75lqFJ2bnUA24YTH3i1
         5BjQ==
X-Gm-Message-State: AOJu0Yxk043X+uucwS4GA1eqtTkEKqs+C5WJVhIGdq2EQI4DMjStozfS
	YZBvgcXYcAarch0uxgaKwRkWjkSVV5BIRkT1oQw=
X-Google-Smtp-Source: AGHT+IEIE5Cmb1Ur/4KJQ2eE0/LfCrCkYjLuOETfWiY4Bpd9cKoAZo5qHFR7VQRGPsW9sOMdeQkwlw==
X-Received: by 2002:a17:903:2446:b0:1b1:9233:bbf5 with SMTP id l6-20020a170903244600b001b19233bbf5mr14599681pls.57.1692801451442;
        Wed, 23 Aug 2023 07:37:31 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/36] oeqa/ssh: Further improve process exit handling
Date: Wed, 23 Aug 2023 04:36:05 -1000
Message-Id: <e1e038ab01a599fcdd4aa6211b6d15cd01a5e2e3.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186616

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It looks like there were further cases where orphaned processes may be left
behind since the .kill() calls may be unsuccessful if the process terminated
due to the terminate or through normal exit. In that situation .wait()
wouldn't have been called.

Further tweak the exit code paths to ensure .wait() is called to update the
returncode value before returning in all cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a0a1731e38edfa72a141e8fd8f2de52be562e94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 69fdc146f0..6ee40083bd 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -262,7 +262,6 @@ def SSHCall(command, logger, timeout=None, **opts):
                 time.sleep(5)
                 try:
                     process.kill()
-                    process.wait()
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
@@ -271,6 +270,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             " running time: %d seconds." % (timeout, endtime))
                 logger.debug('Received data from SSH call:\n%s ' % lastline)
                 output += lastline
+                process.wait()
 
         else:
             output_raw = process.communicate()[0]
@@ -285,10 +285,10 @@ def SSHCall(command, logger, timeout=None, **opts):
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
@@ -315,6 +315,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
+        if process.returncode == None:
             process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
-- 
2.34.1


