Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B27CD98F5
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5756.1781637408444673551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ChyjCqQl;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso26180145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637407; x=1782242207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APTGpNvQd9nDhdgw5oPRnkjc4mBJu1pA4aIGwqJzAi8=;
        b=ChyjCqQlnO+NvDJOCNixGIsUux/Aly2oQPTr1A4PhlmYylOaKfsrWaflcMLyC31EAU
         w9uv94DgwOmEDNfCBcdFY23kpayk0ih+UwlZm0gZOXyunilcumZAncj8qWRTPG+9dedu
         MuBr4C2NTWsU2ekl0hvTKrlOLRzqzkUb9FBn9KyxGUR48HZPxcoDI74GdIM2yiRCTvVx
         1ujLifoXMbkf0IXe8sXhUVF0sndMIeoB5EP8h5MgsLCbqxP6wx++JIS0iNR8ntVAX35V
         L+tmKEpN9MihhMtCeNbz0Bk26VAzkSGnlMF3yn8zjAJQz7hO3zywgzG297J4YaEG5srT
         64ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637407; x=1782242207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APTGpNvQd9nDhdgw5oPRnkjc4mBJu1pA4aIGwqJzAi8=;
        b=m8Du1IA371NhJXF00PunJacbRmvf8tbWlFvFJfb1HpyogOFiVx6inz5kqvN2iEzswH
         j0dNR7RG5eZlfFQq2TXus+SISLfaL2l8EJ1uzcvHGJMCgQQv1nXhI9QSE0vjggbfjT/4
         U9DbCJFkNjUHd9vtOFLn+BG5Z9zmVn1iPVAnYxm+o59VU2sM7It7oOc0PMcPqlfaMhZn
         BPAefJMk5HM4NYqjuK+bSwdgyAhortibGK6oRz22BuZHgf/91sqsdDxbhhx2YeSqGJvT
         ja97uCwIBWuH+SRmgeNkyqNJCq/XR6Ph5YYS4KJMwddM7r2JAYiHWxkM0dH1zDrUh2U+
         d4SA==
X-Gm-Message-State: AOJu0Ywb9LJ6oKY0WgLVUxLC/eXUrGZuFferKHzrKTZdHMCp84rV9W3u
	B6wsyVUizINOUUhctFx21GjOZCC1vhZ1qY0R58zN5OHQDuonhAQ+rdGcpR4scpHv
X-Gm-Gg: Acq92OEmMDc4OzS9DtPSv0e2zQwOtqvtY6KwIo3kqzVjGvaEa/IN+lciF1pGgDEtT4N
	unr+TqZaEjwudHBq2Iwo0ZDC0ykqOcQe/vezRDFlx+/Ao/ASsEFL0DmGkEiByt+9eXH8Kv9nNlH
	f3wJiCZkt6PgJXGrEivbPfxZfJ5RevFYz4PEY41vQJAzwTuBVQvwH3x/LgN3Aze+ECwGxC3Vgd2
	mwHDF/TXGisSrWgG+rwG1l8Yrk5JnjBAWEG9z0wYT45AMrLaxTW/Afgz8Qzh4WzlyWp0jwhUbFv
	Qr8uAWzPy20FLOCJZtBrMZbfI/BMT+9jeNB8254afKtekCKVgT6CZXqM83CAmENDqadxLVsEjZx
	CmN3GlpiAIkvNLcFMBbjuLF154eWvgOuZ85dD6wMrOTD63VFFc7J6HYaauGsyYnk67PTRtqxVqQ
	p58mASfn9/NPtIHy/KCCwZJieRWCbS/BKx1pKuUerLUTM7CYOUjNYfK0JIDbE=
X-Received: by 2002:a05:600c:a319:b0:490:e170:b80b with SMTP id 5b1f17b1804b1-492333debc8mr11488645e9.32.1781637406525;
        Tue, 16 Jun 2026 12:16:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/30] wget: disable NTLM support
Date: Tue, 16 Jun 2026 21:16:10 +0200
Message-ID: <20260616191628.2014553-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238939

From: Alexander Kanavin <alex@linutronix.de>

This is long-obsolete, relies on outdated, easly breakable crypto [1],
and no longer compiles with latest nettle release.

[1] https://en.wikipedia.org/wiki/NTLM

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/wget/wget_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index f0d3458462..847f82a9f9 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
 
 EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
-                --disable-rpath"
+                --disable-rpath --disable-ntlm"
 
 EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
-- 
2.47.3


