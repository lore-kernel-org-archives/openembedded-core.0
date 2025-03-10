Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C7DC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:48:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.33882.1741600086460721964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1Cs+6GZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso23339605e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741600085; x=1742204885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOk6sib1Mcv6xL+jZasV9DCgjvW+SSEbEaFIZ5U6Zu8=;
        b=U1Cs+6GZmTCTvbNDJcuHViVlywe00z/xKPM5jHRjP7OuT54h2wDG0LLWmMNqs9mJrB
         jJPVrfNhJeH2vKonrA96aZZYCeFDCMFzH7wjtuWsSq6WHiK98pOnsQS1qL3QkXC6StLQ
         lEqcIuvjGjIJ7+dzeY8ELUm1uA9brSdDkynNfLYDf5YuYuJVWPPW2aBs+TDFmy2HnO2T
         B577oWhiwt+WZGoGKsVChKphM/YqDYsIJI+X2CzDK4AgNYMcL4bglO5SxtDbaJ0MBsWX
         hYScLirnJqe/Hq7e5WS8HbtML5ZrqwjMSJ5e4rHz1krM8qMTjYZZi7T36/M7oJS7+phn
         cvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600085; x=1742204885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOk6sib1Mcv6xL+jZasV9DCgjvW+SSEbEaFIZ5U6Zu8=;
        b=ZRvapnfmsV0x8Q1vESgRUqG6MKnBxPBlLM528QJa0OYJWtBq/2f2V+LJyyBfsTduVq
         Id0A9FE/vXhMdfXxl+MNGeUnqB5EJiWwVWk67N0zaSaRi4bMUqr2vjp6k5258XKMgZyW
         kthNJkEx6YbDycPQYkiTGrRFkAi9D9rUF/m/Px8uYPCFGf19vvMyxHiXTv9XGhtUv5FT
         rhtqBKO8AFWrlGJ4zl/fckrQmuv2po77+d07qCBtmX+/U2ygcyujZkjaMKzY0QD/MwVV
         1ibHR2YaAQB3Nr8cYtArjmoe4p16N7wsDaanjq5lBhlr+P6/+XwkHXfHtGtA+qhtPkSS
         wyrg==
X-Gm-Message-State: AOJu0YyTGX6DLsApTqbLRDzmUsZN4vJWIXBnGMdQmF6B3R5eC0wZmbsT
	sMXWjj1C2pqMv1n7fNt+9nXN1vrPQ8m2qP+s2I26nNBlGQijpb4pdUIYyw==
X-Gm-Gg: ASbGncs+tR0aVT1POsTk8zHPAgd/Bc0JS7JeDG96rw/w34+Wns2peQJ7YxmPGs3V6Ft
	tg8qLxeYvi4eGYNSV9WzLFKCOYUZw0U+NYfy8r8s1LZ7o7+Tt50oiae8wKwqzkPFUJQZV58zAT0
	jGXXD4ZQYZUx0un9XfI8nz9/xugmef6xv31ypMxbf3DGIyYTzSqHriAEpkmMNM918KQVTKBVNtI
	y5i62bhbbXzOtCC/PFFYoQIj63UUWOgO0w+WsQlEap6gIWEv+9brvO2xwEQtPCk9mnmXjG4khP6
	jtCjNi4PlEqtaoptyTmY06HWpDMFgRj6EmXAC2fsYyhpKD5USr4oTPnfphBQCjqkRfw=
X-Google-Smtp-Source: AGHT+IGKQ4RjFnYc9aXzMET95sfk6sYL+EjyxZB/EKEmBAMUUAnfeQ3+5IlhXu9iVbS8X/MnOGvKbQ==
X-Received: by 2002:a05:600d:14:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-43ce2dda00amr51835225e9.21.1741600084352;
        Mon, 10 Mar 2025 02:48:04 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfac24345sm19910085e9.22.2025.03.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:48:03 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-init-build-env: define umask
Date: Mon, 10 Mar 2025 10:47:53 +0100
Message-ID: <20250310094753.1985294-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212505

If umask is not suitable for bitbake it terminates with:
  ERROR:  OE-core's config sanity checker detected a potential
    misconfiguration.
    Either fix the cause of this error or at your own risk disable
    the checker (see sanity.conf). Following is the list of potential
    problems / advisories:
    Please use a umask which allows a+rx and u+rwx

Set the umask flags in the oe-init-build-env script to prevent from this
error.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 oe-init-build-env | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/oe-init-build-env b/oe-init-build-env
index 82382f27078..5d830455f74 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -57,3 +57,5 @@ unset OEROOT
 
 [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
 
+# explicitly set relative umask to deal with security hardening
+umask u+rwx,g+rx,o+rx
-- 
2.47.1


