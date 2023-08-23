Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F9AEE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13099.1692801450365038914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EpCWz6y+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bc3d94d40fso44349835ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801449; x=1693406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ttMj3XKQhSO5TAxOgH38Nz2oePif06X3brILiK0E8o=;
        b=EpCWz6y+Yu9NbfCTrlMwGgeKQwdB2RycHC5hzQlCnMVqRvfYAH6Y48DiqzLboTriX/
         RbtStTC9xJ12/dF71rjD4oLycGxw2QVpVZtocciFY8Ps4B+lw2277AqxIwDNsA0nEbwt
         TuOCkSUIxi//jy7WYaQyulkSuAOFEp7MbIWAnyX+5AyfHhq/uZ3+bdhjXGf4Pcc2KZgM
         HMI31SyVwNMSvklR0Yws4bsf/oe4WUPntArtpyMxW47FI9PspzthGolowWb5H2u9GDp+
         uJTah16iHsIOk2FYf8FR7rJTom8E6OYIh9Rf0P/STTuvIdkfGURf/deuYetbpdG1AT3V
         h6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801449; x=1693406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ttMj3XKQhSO5TAxOgH38Nz2oePif06X3brILiK0E8o=;
        b=e/s/fauvXSDZ8XKgsBiC2XUT4r/nfcjuPxDA6EPmiDRpl5Io3eZtCO/tatUg368JHN
         SSxpS4Iu+K5rtmTqRRYhXvlmSiJpyJEOrkm3uJH2G3Y3yRF7PhWVzQ61D3a97u4VYHh9
         +dX16Vk4wEdDHS/JIWx04Q0q3FZ4OEBPtxBaNK4K8MMC5Zb+Mjm/4jzUIjzUi2RNTYP9
         w0J+pK5WFXLwirzgYZAK1AerVmK7S59iJYUGETqufM8qRLC7BnHSuUKPVphxbiGJaIvJ
         VdOBDrRBfOMXCrBPYpSggRSjRfY110dg9KJhQdyhgw46pqoGJsdjYzfBHC+6CIcLELuC
         RQbA==
X-Gm-Message-State: AOJu0YzdzlCGX/W3u6ACkmBSzPw9LT3AEvbcyqnki2yreaoYZ29cQsXE
	j6XFEevqsihNo03GAPD1O3896RVJ8vjxgTc0CP8=
X-Google-Smtp-Source: AGHT+IHRq0w3wxWgTawLlhIdEM6C217MaSZq3B7E1L5zmcRuXBogZeOGMMrMQanVDXE+jgcLYDcF9Q==
X-Received: by 2002:a17:902:c411:b0:1bf:73ec:b977 with SMTP id k17-20020a170902c41100b001bf73ecb977mr14188099plk.46.1692801449401;
        Wed, 23 Aug 2023 07:37:29 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/36] target/ssh: Ensure exit code set for commands
Date: Wed, 23 Aug 2023 04:36:04 -1000
Message-Id: <c70b05ea667e7bd280470b0b6ca10efb0f648e0f.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186615

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
index 7c206ff105..69fdc146f0 100644
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


