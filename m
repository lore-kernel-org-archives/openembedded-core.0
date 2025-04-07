Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F13CC369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.42763.1744018859687631250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dlmy0O1X;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2438845f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018858; x=1744623658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I99dpA5rLRDAqkKBTpWg+Xnpk1r51PFCJaXLeTWI4mg=;
        b=Dlmy0O1XC+bm7C6N/J7wK4TaBeN3aLh4fl8IXs8d3bzkNFZawpWQo4Ifz+bpqqeRM6
         uM/JU8ycXhVTvGDXwrTbaLCiNfWpcrSa58XpAsZMKYRPLZW4ywyadVvJVrJnPfj45vQj
         DMVO6un41Oc+rYmz7zvpbvjG66ktFE76KWyjX4vDT/VzLg4iBEWATKWgCYl6+V1ijLtj
         oH8BEcCDY10TXzI7VljXWJ5gLZNO0UXwN++0TPUf/9Sv3HfwpZMk4YT5ecyoFibPnpWj
         VRfPXlQiA0QazwvXtruUePWLFRSMjGwi3c1//mXy2oJEfHxRgU22LEXID6pG5x5v5y8z
         QBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018858; x=1744623658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I99dpA5rLRDAqkKBTpWg+Xnpk1r51PFCJaXLeTWI4mg=;
        b=Q+4S6igrlvdTYD5PQ/PF61byR3XEtS+mwgVh/5YhJyC7i9RLR1h/MMpeBe91g7ZwOT
         l6b0nTNt7Ehm9jupnBfYAmgZM6tpbW5lzFallHutai/USb5PVcYTA/YHM7CFyoLsFVqr
         ZIMXwAa4va61JcHXxLdiBmWdQljDLRhvQ3gGB/MbwXTAhL5gWJcPgJ0AdU//VzCzQqlj
         J/sRl9ucj9BZkQ74jkakpXjgx16iFk3MVSF40oOAmQassMoZTTpiBoLLPOfHGkUdJJRg
         V+oeZG7vVNBlHeDtC059vGrLiA00FiriK8ZtSXWk0ehW4nJVk2OxTN7XG+48esVP9XRu
         7UEA==
X-Gm-Message-State: AOJu0YyZU7C2qqfOZneBLLGjvYjwJgrzJzp73DyOqLazvyqBp5mNU8J9
	4atrbochlsF7aw2IRJoYQWvWUKcE5oqMIWVvgMGbK6qzEpNJNUp/R6BFAA==
X-Gm-Gg: ASbGnctM/enyhUdCcT43OxEXHPQfRA7GXFAj565n/XL3KFoPzwP+qLEE89nFrK1R4S0
	0zoXRxcJM9zDYFuEmhrYHSPPPy3TSbYUu7yGfy7S2N8rsKlB3FzB7hBwb4C1vMNKkAPfF0H8XMQ
	5uic2epLHgy+Khyv4qSwbj0hL2xLUnxKwMS8yx5aqSFQchtd8sZ5AiWiumeV+WWpyXJ9hx7Uojq
	gcsgJnRtDYwxcR3aIP9MJDo9QUOLzgNshzKm25sRXYA9NGtolsl72bEVDCAH94odINw5U45RuLx
	DV59gxuvJniGEdbxL8P7jgBhsk/rQ6SwkD8lc67Qt9qGxEg24MetMZyHrlDWT5cNS1cYUHSNwOH
	0mccBh4OCMuU0Jd2v
X-Google-Smtp-Source: AGHT+IGlCaZ9bKoqhHdRNwudPDOxdbnKDr/kLekj3IhZh7tN3yPTl5AmqOB7VYBumBXQ7h+29ZfM2w==
X-Received: by 2002:a5d:5987:0:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39d0de5dd2fmr10443732f8f.42.1744018857857;
        Mon, 07 Apr 2025 02:40:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/18] ifupdown: mark defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch as Inappropriate
Date: Mon,  7 Apr 2025 11:40:40 +0200
Message-Id: <20250407094045.753021-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214422

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index 24e3ba0d9de..d47c50f2d5b 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -12,7 +12,7 @@ arch specific methods, and the end result will be strangeness
 like the loopback device not being configured/enabled.
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [avoiding debian-isms]
 ---
  defn2c.pl   | 6 +++---
  defn2man.pl | 6 +++---
-- 
2.39.5


