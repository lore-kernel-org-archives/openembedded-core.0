Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1703C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.55940.1722258788094761938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zE3+rVWV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ab09739287so1796539a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258787; x=1722863587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1jHiC5bwv/7pXHOo9OqSqNFazkgeukLXVpM1668dKQ=;
        b=zE3+rVWV4rY/twGE+3MJp5+BBfPP4VzT4yuF7repWtvqkjLOR8KmQa5eJORNgJkyIS
         xh7gr339QTnvzy3Lp/150eiOvuzEbK19IIUyo79CyK5ApakBYOXrtKPTqbpD+yHGL4Go
         R/ODYxwhDWdvh6Zk9b/S3b9JqMIZ9ZvrB2wzElHzpP+ag6HfW89UVaqs2zinHwBKis+i
         /JwbP7FJB5/48ude6lUTeuf7mqhmPtWOROgZZXHJiEaOyecAmb7156ToMcq9LAp5Mm+X
         Xz3rQDet2hvIk+H4axtHES8Yg9m+iE82CbSWS+TeGRa/cxB/rtZnrPsHDBGm6+iTkg5X
         rY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258787; x=1722863587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1jHiC5bwv/7pXHOo9OqSqNFazkgeukLXVpM1668dKQ=;
        b=SI9Q44RPcqH2FCQw7gHRNejwJvpng4gm/akBrS2kw3Lc3XtKQlT7/2W093MNnrQ3yy
         VVFWrCrOF+GYTpxXkv8H9F/v2ZDY+6J6JDbZNNlNTCGLCpAhzKiJbdnV4o8JPqp+scnh
         ixJCNzNAE8fY+H0KjCVnfAP+waApUmCWJCMPYJIMWzRqwRXg/7/xUJKkXliioL8mqprm
         iDnLLiu8GENZvQ98v0aXOTktsugYqjqY7Ci2kDIOMAyhxrK+lsq6aWwEAhRSjpcK7N+G
         fpiFGvqJ6eu37a3Vs2PatOh3uKI8aHxGTopaBXzGbUn2q0j1K2ekajvY5IVKEBx7rGRy
         CFJA==
X-Gm-Message-State: AOJu0YzeiKc3IpjP0Yq9IfTz6xRLfEUsvI4k7OLpTCC50gOQVYl9n7ZK
	qwHCQ3PH2uKcLVZn8zpTm830yMlAIIP2xfiRmhP4zDoBOwnLiuETLrdg6NeErfaBWciBznQG9gZ
	6ML1gWQ==
X-Google-Smtp-Source: AGHT+IE6KPC59nPvXI9NrvoRIQPwrRc5lXsZ+e/7aBgL8xKEDWNP0bRBYGcSo4WHRU81KrLrwDrOWw==
X-Received: by 2002:a17:90a:f998:b0:2cb:4c5b:2d8a with SMTP id 98e67ed59e1d1-2cf7e1c651dmr5372193a91.12.1722258787263;
        Mon, 29 Jul 2024 06:13:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/37] oeqa/runtime: make minidebuginfo test work with coreutils
Date: Mon, 29 Jul 2024 06:12:18 -0700
Message-Id: <2b71641b9c1b8f7e67527d2242a6a65b1e849ded.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202622

From: Etienne Cordonnier <ecordonnier@snap.com>

The test was failing with core-image-full-cmdline which uses sleep from coreutils instead of sleep from busybox.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8497edf0c56da34ea7b7509b8fcd46fcba2fd0e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 8bf571663b..80fdae240a 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -157,7 +157,8 @@ class SystemdServiceTests(SystemdTest):
 
         (status, output) = self.target.run('coredumpctl info')
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
-        self.assertEqual('sleep_for_duration (busybox.nosuid' in output, True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
+        self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
+                         True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
 
 class SystemdJournalTests(SystemdTest):
 
-- 
2.34.1


