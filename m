Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5E3C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.9980.1718288464262844466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eFjcW/m2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f4c7b022f8so10530555ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288463; x=1718893263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqP9ohdQhlMSPMcl/I2Fnmx0lxvg1r9PtwvHKHY7dV4=;
        b=eFjcW/m2AZCU7j8VktZm22FStCmDJ7bRL1Aig0VD7XmnhDSwb4kW0QfC5Nw2/Kgg1k
         EAFiU8BzZn1an5mKU0r6L32253ciQPK3L1rPKXKJGbDLRgndqseTq7FSthqgrPR9TKWK
         jb74yHnV76x8MnWQxcXNVJFsjRW6LBFG6syeJbwarxHPFLiGXVY/e3WO3AhFxmH/Cz8V
         JX4GC6ESWxUmXRLRS2Q/ixXIPkHV+5tqNsIeHbW8oW4iFUGr5fqAUGcP7J41LTSdBq0A
         /bXqStX3/4tP6rUI/XIYBQuolcCMVXxTMg/pNv0DqxO1hcxsEEyTdxLIg0m/9TW5pcul
         e9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288463; x=1718893263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqP9ohdQhlMSPMcl/I2Fnmx0lxvg1r9PtwvHKHY7dV4=;
        b=UhAyejqvGauTcAEfJy4NSWeVo6Bw/EHTEYHRe2ZYlqt5VWRw57xzKdkzbpZk5MeMCk
         g0nSBcEbesb7diR7sWS08VEQnIgkTzk2gb8eUF8kmpEoiFropM7oyy5q6EyqJ+0pxvTR
         KAcwTS0NotJmOdAgCmX+dFU3cVOD1KeWvE81ZDaMWjZLTwwgDCPxLb/QbSC+ZnK2sYAj
         +JgbAUuUgb7vCywmWuV2vSpwaA6iRW9/zoetUGUKZS/+ttzUqivuWNgiFFgkqLT9pSmE
         u9VjaVPf7RWjQugqhLudzvfK5EJCema3Ovw6I6EX7Hi1N7Ma0pbx66e0xl8FuefxxbP6
         KQ4g==
X-Gm-Message-State: AOJu0Yw/YZO1ECKW5IDqomS5xwrUeDQLA58PXr4uEzw6IefptWTDvOYL
	RYGwuq/lHtV50qXtSJvYP5DTzigrvbKb0Kgrmse5GPY6P0hukfn8U/hpZP0FIM8FYo+Jc0BiLil
	4
X-Google-Smtp-Source: AGHT+IGkolfM1BGShWfekAIBosDdxjdljlYgCkR5tC4wNoYmv7YJ8v2m9HTUPIzWs5TrsbvD/Pw3sw==
X-Received: by 2002:a17:902:f690:b0:1f7:3d44:1f1c with SMTP id d9443c01a7336-1f83b55e2camr59716565ad.5.1718288463462;
        Thu, 13 Jun 2024 07:21:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/29] busybox: submit CVE-2022-28391 patches upstream
Date: Thu, 13 Jun 2024 07:20:22 -0700
Message-Id: <f3e6d0dc315dc915d8029a0d84a12f74ca5d62f5.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200620

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64c026024b1c86797de338760b9f29d7e949926c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-libbb-sockaddr2str-ensure-only-printable-characters-.patch | 2 +-
 ...2-nslookup-sanitize-all-printed-strings-with-printable.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
index 4635250170..ceb3ad7250 100644
--- a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
+++ b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] libbb: sockaddr2str: ensure only printable characters are
  returned for the hostname part
 
 CVE: CVE-2022-28391
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.busybox.net/show_bug.cgi?id=15001]
 Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
 Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
diff --git a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
index 0d7409ddc3..1dbc3388a4 100644
--- a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
+++ b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
@@ -8,7 +8,7 @@ Otherwise, terminal sequences can be injected, which enables various terminal in
 attacks from DNS results.
 
 CVE: CVE-2022-28391
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.busybox.net/show_bug.cgi?id=15001]
 Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
 Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
-- 
2.34.1


