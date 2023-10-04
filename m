Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76461E936ED
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 23:15:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3197.1696461329789466017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 16:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JdxMgjEq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so3237585e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696461328; x=1697066128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I26U6GrHplAOU2UqluXV0Pw+lzPCxEpW24mV08Vwdo8=;
        b=JdxMgjEqUNHpw7vEV7i50Ug225kW1nj0ZMXO4S67BNi/TnflXe8kVrQbTrAHh0/aTj
         Wd+f3Sp1UjRja8KrIa7R8VyMkTF+Xhmcdo/OlM4WNMfUwwu8SF41wP5cSQXnyjXSt3Jk
         2+Ky3vDJsExuI66Cs/xqbYj63Tnnp2DMReUX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696461328; x=1697066128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I26U6GrHplAOU2UqluXV0Pw+lzPCxEpW24mV08Vwdo8=;
        b=Fs04lQjogmxuo1H5jPFq4Iw3u00ZvUwJn+kzhPbUufI0z7jViGW3qeazW9IuHOT/7L
         WduBLsRtE1lKMMopE5Y/ZYxJsX/0Nfxs3mUS7cs9WHh0sH4brtiZsoesT3gi2OFXQwss
         o5DpM2P9qqz02FKts5qQCLoJc1j1MBGqWOZbzG6S+2loyQBLZyLASS/JjMBCPIzDQ2e5
         6EcGwYh1RWx0OOZL2Pg1JI9/Q6DYk3AP0rAv+FDz1KqVxNx3e2UUEjksAqlpaPSPFchg
         iAP2zL2LtwUfhPHJZvZ7hXXpmeFOxWguGdKPGBdVmPP7dcIaKi6IUIctCN3ibQIdB4O8
         l5IA==
X-Gm-Message-State: AOJu0Yx0nj90dHCQ1MHsJ7+eO4MWkHULbnPzWwu/CMvWtR2P8QQfx7hO
	482Hdzy8cNZMVRxuscVBkQpXbUuUgodDk/HVl7Y=
X-Google-Smtp-Source: AGHT+IHt8CwDiHvMIZmT8sktPC6HUUTmT8FYFbbbMTjXzXuAxhob9IEGFAkDqCsnxrsPvAal6K2Q2A==
X-Received: by 2002:a1c:f718:0:b0:405:3a63:6d12 with SMTP id v24-20020a1cf718000000b004053a636d12mr3729276wmh.17.1696461327625;
        Wed, 04 Oct 2023 16:15:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bd34:260d:44d4:25bf])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b0040596352951sm2531407wmj.5.2023.10.04.16.15.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 16:15:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/concurrencytest: Remove invalid buffering option
Date: Thu,  5 Oct 2023 00:15:25 +0100
Message-Id: <20231004231525.3044043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 23:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188703

Fix warnings from oe-selftest -j:

/usr/lib/python3.10/os.py:1030: RuntimeWarning: line buffering (buffering=1) isn't supported in binary mode, the default buffer size will be used
  return io.open(fd, mode, buffering, encoding, *args, **kwargs)

Remove the option since it clearly doesn't do much.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 5e20b0e1266..d10f8f7f04c 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -264,7 +264,7 @@ def fork_for_tests(concurrency_num, suite):
             ourpid = os.getpid()
             try:
                 newbuilddir = None
-                stream = os.fdopen(c2pwrite, 'wb', 1)
+                stream = os.fdopen(c2pwrite, 'wb')
                 os.close(c2pread)
 
                 (builddir, newbuilddir) = suite.setupfunc("-st-" + str(ourpid), selftestdir, process_suite)
@@ -309,7 +309,7 @@ def fork_for_tests(concurrency_num, suite):
             os._exit(0)
         else:
             os.close(c2pwrite)
-            stream = os.fdopen(c2pread, 'rb', 1)
+            stream = os.fdopen(c2pread, 'rb')
             # Collect stdout/stderr into an io buffer
             output = io.BytesIO()
             testserver = ProtocolTestCase(stream, passthrough=output)
-- 
2.39.2


