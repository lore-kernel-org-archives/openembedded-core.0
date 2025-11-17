Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688EDCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:00:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12799.1763395196048447838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 07:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CYBlRvRi;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779a637712so14055485e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 07:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763395194; x=1763999994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGhHOeIZ/hBf6SkGjXIPccvnKcx3AEeoWe7ypaabSwc=;
        b=CYBlRvRiIADcUfb0UqydMpkincEd/8PNT6RayY1hHmSWmdF6zz4hLfU8YJsMzZamCX
         cWqbWF0x+se0i+L22+PaU3TZqxNLk7m53e5B/QkJAssEpzqQLz8JeXdfw85kuB+WFmy7
         hvDamYVNXassJeFwn4A+Li1Er0vQpwrNiv0n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395194; x=1763999994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGhHOeIZ/hBf6SkGjXIPccvnKcx3AEeoWe7ypaabSwc=;
        b=BUh19UwoUFiW80+q1tkUF3GuRBhRXuj225tC6WwWrCGI+/UvDJ+M9jc/AUzF2IfRwC
         rH/GBm+irw51Qg+fsi2I62vIWSTb8rQILsPdhBqqG/AJnGNPSfIoCfm3hpjZs29zg+qN
         Bmz+7YRlo1agK4bj6aBoxpNMYJRNNaFnpERxiX7PP/7dAdbiq57yrxWDm1kg7Mitv1On
         7VPAJnp4PIehRJWIElNgcv/jR/BIvFibMiPTRoY6s7UCq05R0eLse2qr6cLd+pvQgP0f
         ui5kvducGOoYzEk1eJ5MO97tu/jqBHdjzYRCcd8GXjiqEQAJR91vWVGN6tNa1idOzKdV
         7XhA==
X-Gm-Message-State: AOJu0YyqJVQxFRoexveoNU7AsMyWqOVkPkqvlbJCey7j8XOaDnyGyYBj
	VajSM1x5YXH79mhUHauBiuA3+tylQ0uTcQqy7cLs1TzpvMXA/RYpiZMvsTOfZ/8IWxxbKRc9lD+
	kLo3V
X-Gm-Gg: ASbGncvK5Gs4JK50oHtJ9CQGh49K00W9IDtGkBh1PDybgA455GzoXXiCYycR3mEPY/t
	AyqbbwZVQdCcMIna76CpF6pXENIz8gxracEUcJlQ8aOycQNZOVZiJd/Up/w2jXL7/NUXYm/ZlPO
	B8P9aIBdOfd0LzIGwCQuu8GiryhsMyfqUQqTcFf8dx75p8Y8PvJb9ddQL3CAT/ktn/DQM2oIl1u
	xhXn/aOAX6QNRaVAc5Bjuif0fREjkYJqncVox2DkaNlQ6otIF+wXY9ihBHZvOk1gLVUMrtonnLw
	C8Uhgr48LGSnl2XucB7v3Ge1wRqmNKXHkiItb2BBEAnesw30uZktRW/niUL43gySZRfJaxePBWk
	CZRbGuzF+wSsP8Q7LEGVwB6ioh4+FjR2oDY30lZHgyYJU/9YZ+F4u5wGIfX+3nqTJmw5FCbMXDI
	yOnHrIIBNiMw497Adn/JpfGBbiDdtyWlutjb1KR2p2LjVyrOkZzSsgbpEtYvWDz1s0kmh98og1N
	HUjm9RgrFSGOhaUlF5txO9nYKqZx34=
X-Google-Smtp-Source: AGHT+IEiHh/jazVi8Q3rZTqmTtMj0EPgJBnMpitIWz14q0QiqjaKbbY4am8HvIp7HoBoyHiEtCBEcQ==
X-Received: by 2002:a05:600c:3112:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-47796503351mr86341015e9.2.1763395194217;
        Mon, 17 Nov 2025 07:59:54 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm340609225e9.0.2025.11.17.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:59:53 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH v2 1/3] ptest-cargo.bbclass: Collect only test binaries and not executables
Date: Mon, 17 Nov 2025 16:59:25 +0100
Message-ID: <20251117155927.427462-2-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
References: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226497

This commit changes the files that are collected during compilation of tests. Till now, all the
produced binaries were collected. This commit changes the conditions inside the loop so that only
the binary and integration tests are collected. To do this, the variable "test" of the object
"profile" is examined. Tests are all compiled with the "test" profile, whereas the binaries are
compiled with the "dev" profile.

Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
No changes in v2.
---
 meta/classes-recipe/ptest-cargo.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 30463e117b..004abb40f7 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -55,7 +55,8 @@ python do_compile_ptest_cargo() {
                 current_manifest_path = os.path.normpath(data['manifest_path'])
                 common_path = os.path.commonpath([current_manifest_path, project_manifest_path])
                 if common_path in [manifest_dir, current_manifest_path]:
-                    if (data['target']['test'] or data['target']['doctest']) and data['executable']:
+                    # Collect tests (integration and unit) and nothing but tests
+                    if (data['target']['test'] or data['target']['doctest']) and data['executable'] and data['profile']['test']:
                         test_bins.append(data['executable'])
             except (KeyError, ValueError) as e:
                 # skip lines that do not meet the requirements

