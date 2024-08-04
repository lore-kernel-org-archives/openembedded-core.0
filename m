Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1A1C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.30106.1722791390548107461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ETSQUmmt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d18112b60so3721217b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791390; x=1723396190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI4DExMJ8ECT+RFP59k8ntZFnMiSpAjE1q2JwdkwUKI=;
        b=ETSQUmmtXKhcBIz0xk1ztvZ4jb/HY3dcUgwwgqogovpE44LwPhIEVZ87LUawCgmOZj
         Knbu45io45Ohty/Txs5jyYAML5tdh3i90RMUVKSTH3nUXYl4m3efj8Yj6YwUa8uwE6r2
         YR+Gd1pSXvhfWCH9QaTSuebTaYpydA178a8uqrWgdgKW3qR9HVdYwqi1uwnSe1KQuQVq
         IVSoPWuA6w2jl/qLBMxMn3v36Pw4IfD0axB+JeXmMQYDtiDhTaXsdQnIzGmSo9SagDLV
         IEdSyn8k/BnmmhM1Y6VZAHVBfAFVEhqsp3TSWYOqfo1Vkzya2hgGHlK9IzJfmr4UP0ZL
         P90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791390; x=1723396190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI4DExMJ8ECT+RFP59k8ntZFnMiSpAjE1q2JwdkwUKI=;
        b=cu9CFJjt9nioQxPag8GQvQOxoNJX9q9R7mnRBAoI9kMO4Rx8UXHnMB1l2uF6w5RiU4
         kKj1GCwxQP6ht57uHVgg9KIivor7c7tHSwtoBjLa3c5G0XvMwf+2CEoAcSZ3ZHkl9pX1
         pwNWTJaUr+haPhWKnnBz8XYsWmd1KDnL/88BFsmERYO4RNf0Nhuq8Wkyeb+DIGjNk8cr
         +3Z2+R6qw8vRD4ldOI0tmtlpvqTrLC9+Hx7muEyeiWDQbkOTINiLQBaaUPlpY1Bw1JOz
         dLOlAbwbNu+o+wJs1CdJyRqrZw4SBkQFxKxbV3zcDceE+wbNvYiMomwfDHF+rC38vCiF
         ZADw==
X-Gm-Message-State: AOJu0YwuA4TH3h3sCbSXrHsoYmVCE7Vy/XavdRhFxjU+1OwG3H7TMoDs
	5Un8PhuvZh5u8ujmaZpoT7h4sCndPSZ6qFQ9jY4NxxDmezha+dQUW+Aj1ApBKReoW8BkUoCH02C
	SFhR4pg==
X-Google-Smtp-Source: AGHT+IE0iK3DBMog/ypZe5BoOOxtBA8TlMjT0Q2qTI8WJDcYHwQj80W6+5cM9mARjfp4DYW5LqDcOg==
X-Received: by 2002:a05:6a00:8583:b0:706:5daf:efa5 with SMTP id d2e1a72fcca58-71065e9d3d8mr15875450b3a.9.1722791389876;
        Sun, 04 Aug 2024 10:09:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/18] watchdog: Set watchdog_module in default config
Date: Sun,  4 Aug 2024 10:09:20 -0700
Message-Id: <953ea8fa9e3e6a34cbb42e56743fb7c6cf98ff2a.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202976

From: Wadim Egorov <w.egorov@phytec.de>

systemd started to warn about used but unset environment variables.
Let us set watchdog_module=none which is used by the watchdog.service to get
rid of the following warning:

  watchdog.service: Referenced but unset environment variable evaluates to an empty string: watchdog_module

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f1dc796c7298373e61d806e63bc121128c1c27c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
index 647d5abca5..cee5fdc2b6 100644
--- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
+++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
@@ -1,2 +1,3 @@
 # Start watchdog at boot time? 0 or 1
 run_watchdog=1
+watchdog_module=none
-- 
2.34.1


