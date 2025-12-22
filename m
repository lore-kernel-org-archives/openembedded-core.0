Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBDCE6917C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:55 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87657.1766434074443664939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPi0jUnP;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso8111689a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434073; x=1767038873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxPGscT0PFpSvC/mFSnG0EOQS8LwTZ6mIVObwSPuea0=;
        b=nPi0jUnPTMl3ikkXx0C2L9hM+ypTnPH7FYBfoDY7VW4LHZQC3lcdAru7gl7aln3GDc
         Ivy8qX0lvX5cXw06FyuuoIOyzh9Lk85PtF/+akWjrB8en+hHWqqBo6zk7ZJwofR6ZF6s
         kt3RLcp/5T1kYZDVGsguKUzDaDQiZ8RBf7NnK3loRPfjV6kDPfWXjKLrjAZKFz1RLZ0g
         zkupGdQU0yEbkzgbb9ea6CO/IiSfQhJmYN78hFK7wrEINYkzq8jn/JVeO7FEl/dR6tfw
         kX+fUa9exjSpe4pgFAcyw0+pnd8/pGuIndVRy6JRch2xRlFCA3KX4uYsh+tnuqC1yJwQ
         9H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434073; x=1767038873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxPGscT0PFpSvC/mFSnG0EOQS8LwTZ6mIVObwSPuea0=;
        b=fExNohI1/ftzjfLru536TZC+JmARfr/zhr1ifsp7jP40e8vxpaMVaQlnUspo1oDiql
         EDuyPU2G0KWJzv1sySz0ePFODO7xAECnnYsHgrca48rlMomLdDWfLJaNTqodv63pElpS
         DCj5kKivvAlQcU9NLCj7AuTKFxl34+Ji4wiYa1gh0xlBcJ7N9f5U/Sx5jOHSu5s26qj0
         BwGFV3DnA3geKDz4jjvYuF25jJUN4hAkvCGmMfrYRqSw5Y0WR058Lrs6B53bM8ot/VaN
         sB43dKh6r7cIT6/nNIw0/TDivszHE3DD9kwGtTwVBoQUzr+xPkUspgy8ZZMPU9Z3eVs4
         NeWg==
X-Gm-Message-State: AOJu0YzPvWLUHMKnHiQPSXTQVPrS1tMyYYCG2Hx4u5Xj0Y5zj4Hr68oM
	6eMtJLzsgxASW6BNw7+T1puj7bdWOJWvtElavjECmx9NXGjdEUFYJPHLws96SQ==
X-Gm-Gg: AY/fxX4cqgRsN1k7o8abH4tOtjjlYc5RkqV9+9xAQ6BvUkfy6FaMCCInUmAePaEsECy
	0OexiE5ikwHJxMlxE/Tf1bJ/NeAzsla37Qb1rRe9mlABnmGDx9GnEQjvOsgm9gnjFYs+FzgcMh4
	lIgCrMKSdxT67G2u8mSL6Ce5SX1ATjFm3CfQZbkc7j1gsSalT7hruO+xmjdGq4IXss9Y/bFPCiS
	7WTd7iG65m4QB22TLGqFiYXtY2s9ULHDpFvauR7wIu+vL10oCAT9iexGoOL2crGkESLjGRLY41k
	hkp2z4Hy16UU6+X7sdeEi2EVNV4x+lzbwcRlUz0E4ouXhrUuU4rtotqLd/j7O0Nhb7dndVK6ppm
	MX4zb7EnOOwlm+9V40uvypFMwU9KT3V6EefiCDqm4rQZklSYffDOtkH0y2KItRVYpRiiSear35A
	2LNHXI7qNjD+ivceVDY8IhjUpxx69CL5ulcTm8vp1gk/yzDJo=
X-Google-Smtp-Source: AGHT+IFzGnD5jPTH9srNco4QzvZrPcHUI1cDx2KSWqM3WZd3puXanmNqvKy9rqefu8m0q8vRMK+kQw==
X-Received: by 2002:a17:907:948a:b0:b79:ea1b:f13d with SMTP id a640c23a62f3a-b80355b7986mr1590618066b.2.1766434072754;
        Mon, 22 Dec 2025 12:07:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 011/114] ed: upgrade 1.22.2 -> 1.22.3
Date: Mon, 22 Dec 2025 21:05:53 +0100
Message-ID: <20251222200739.2278706-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228336

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.2.bb b/meta/recipes-extended/ed/ed_1.22.3.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.2.bb
rename to meta/recipes-extended/ed/ed_1.22.3.bb
index 80d4e116ac..1a5a28a039 100644
--- a/meta/recipes-extended/ed/ed_1.22.2.bb
+++ b/meta/recipes-extended/ed/ed_1.22.3.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3"
+SRC_URI[sha256sum] = "47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.3


