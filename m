Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EE9C5472D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.18883.1724244656819325717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TsVdBwuL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so4018410a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244656; x=1724849456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjL4ZbbRwjyX2A7MTvPjx33/hdmkF+pgA1G/nt62P6I=;
        b=TsVdBwuLIa3+KZpvFydsjG+/2V+iJ5YPdZbGJuRE4QAXNPVS4/Tpu6/DC4yqqS8jTk
         1nAorKLiJFDx/tJoFg5dFm98I1pkN6MMS8PmQtuG2mskyrXFs4YyfXb+huPqXNtLB5r5
         R88y4AXGYtx+SldCHbWS4kqOwZYlSpS6Kk8eEawTuN9U7DjLqAL3uLz6PSvCkxoXb8sr
         SutnxnqInQzBru9v3eOHM5argleUH69LXIat0p5nu9WxM098Xk9iND5vVTAmxEzsZcZs
         wKfF2S+KPY4J0VgKi6SjUxwEMpkgx0eP9t7+fXWc3lKgCmWxTIfyk+COroyy2nItZC4x
         B2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244656; x=1724849456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjL4ZbbRwjyX2A7MTvPjx33/hdmkF+pgA1G/nt62P6I=;
        b=W2M5aEeZorgsxsiTxDgaXKtzv2PiSo0y5SnuY76TKrxxWghIme9BWfRclxRxjb2pGx
         5zBItYjZF0Q6SM/w7LGU4/8V3Q/JbUe2O3WyOZljZqtVXSkKSCzEcMrRcSfQXvvSWbHQ
         GPiiwRjaYJwvRFYjGJ3roOQ2k991O9rROq+puUKdh7VUjQAdBbmYpjnmYlrs50NtO0sG
         95UwDXcZdgK3xs1ByxDFzNOI76bRlPk2N72G11hcdjv26pTzHQdc603CpSCoLV9nuZzS
         mXk7pOOCFHpR2oRRFHck2jDepmiUXuYBOl6DyUYreNf7DlrUp+okTH/GrwONtGotyPpb
         MBBw==
X-Gm-Message-State: AOJu0YwViHJfLHlN5EwmucTSRoXUBYF+DJPFUb+7SJ66XxqqZSLg7MPh
	l7ote4jZ//pnAuhxfhR9gGN7A1J0VD+ZatYGZMFNXeUwogFWGkPjzDlOUgrsFYXLLVdDQ35jZB9
	En4c=
X-Google-Smtp-Source: AGHT+IHg0wTliD0BOc+AMjhvlXXy3bLDWqjjitVzD+peWZXVe6zbmK1FHNZGEJmt468obYxrNsZAdA==
X-Received: by 2002:a05:6a20:6f87:b0:1be:c5ab:7388 with SMTP id adf61e73a8af0-1cad7fcd121mr3036732637.25.1724244655974;
        Wed, 21 Aug 2024 05:50:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/18] oeqa/runtime/ssh: In case of failure, show exit code and handle -15 (SIGTERM)
Date: Wed, 21 Aug 2024 05:50:26 -0700
Message-Id: <1bd6b0e29650c34652c1027b6975eb8620a73c55.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203603

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Ensure we show the failing exit code in case of failures.

We're seeing autobuilder failures with -15 (SIGTERM) which is probably from
slow boot/init. Retry in these cases for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 127d3bd8d5509ae17e359c1365859fd362ffc74f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index ae92bb34cd..9a8deb3f25 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -5,6 +5,7 @@
 #
 
 import time
+import signal
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
@@ -19,16 +20,18 @@ class SSHTest(OERuntimeTestCase):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
-          elif status == 255:
+          elif status == 255 or status == -signal.SIGTERM:
               # ssh returns 255 only if a ssh error occurs.  This could
               # be an issue with "Connection refused" because the port
               # isn't open yet, and this could check explicitly for that
               # here.  However, let's keep it simple and just retry for
               # all errors a limited amount of times with a sleep to
               # give it time for the port to open.
+              # We sometimes see -15 (SIGTERM) on slow emulation machines too, likely
+              # from boot/init not being 100% complete, retry for these too.
               time.sleep(5)
               continue
           else:
-              self.fail("uname failed with \"%s\"" %output)
+              self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
         if status == 255:
             self.fail("ssh error %s" %output)
-- 
2.34.1


