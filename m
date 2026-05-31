Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5156CD5BD1
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 07:28:50 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2098.1780205972637275528
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 22:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P+O68vuf;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: prabhudasuvatala@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so241261137.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 22:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780205971; x=1780810771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CFptPqhZpIUHaAaJsPrlVoyWvVVFnMwo5XlmoOkeQo=;
        b=P+O68vufyehmVK3DpdAqqEvD2gwYPK/2oNcRUQ0wDrFPUryMSLzVg67FuDcnsKWCr1
         MjbRbgTrzREqp6vJKK2jKRkkdh3PSlM6wLUAI8oXpzyzR4CVSlgpbSJiojM0jTJbeGWB
         Qc2vu/Tc1meMuRKlZJugtYI083ukWYicBKP71F8EKFA0hQcj3h/OOZYzPhgIvu+fbxog
         yilvNldw4jZXd0qDnUBADSMWzWUgKl6mQtzlehFJHMI8SXUKKB7sVfGjTjRiZUdX6gyr
         7fOudWkmh/Ij3jNqYMGdzlkPDCNwNb8tyW86N1MQZWHcTQd+18Cf+7wkS4OrBZttLzWn
         /Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780205971; x=1780810771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CFptPqhZpIUHaAaJsPrlVoyWvVVFnMwo5XlmoOkeQo=;
        b=MekAioO9U5hqyEerPP9BTo5DCMt+Fm7kBpwDbZk4smLyEfGJ49OVuQV0eavDsufPG+
         7DqzbAN4bLEAErdOtPNsgS5OF7WAlToPmxKs5kTTtPR/KC6W64W21tru0e2PL/x+1/LV
         KBA3E3+bLyzyr6ulhWLZszqHm28/G7cSLRxV+sFGb8lUUdX58xpjLEbkLg/E1IIvtrQy
         aV7Kg1EIxCOJLwFrBPuUUG8eibdygSMFlebEZWZoJw8ywh2FSjxK+SbeeBSVFPdMCpFu
         kd0FV/1pw0DbuQ42q6RyRCJQNBl0VVKh7r7yJTmHRoH89H3q+VMldr6/YNO55JUK65tU
         VjAQ==
X-Gm-Message-State: AOJu0Yy1HreETXBq2D9MR4FudnP+vV/Y9zJu7nu+QuYJElQ2NEDGKrav
	hQ7o3ktfpUI9O8GYPOEAM3Hqd1ZMj2Sl9TXr99MHgCQtSPmv2ooV9rrCPuuC6WpQ
X-Gm-Gg: Acq92OHjBr6YZ8811xVDt8zOefY+52NN2FBUiEim06yeMBnWvMGFme5eaDfKCZmHSyp
	YN8VnL6YthxFq8In7rB4IwkrhkW+ucDEEmKyaXFBeVIm7Dyia0RHxmC97SUL0QmijdMZUUK/wOi
	sHp6kWa7ZqQXOJM8tIkXiqhyuiX38F19+GP7pOFcwYuWM9JOAmxaF14NSXoGWYj2kPQKyKOaUXX
	mpsDRTqJK5cB+OrFRz25AYsjD01BCHCfnyTBd+iK6cixe53yKay+5SjDz+ojNE/fKBpZX8+8fct
	/HHG1z1S74j+un4V6sGA0nD/qa0IiIMHF1dIiYLcJssoGU3IYFlcNQLlvxCSQUveoeL4PVADAm/
	OhLOdsSR2p9ZX1S9Sc7QXEwRMCgdHk7nFvIjZ35NsdBou3kBM3aPTj3Ddfqp6KdfhQh0w/nPzqB
	BgEVjNFX1+uK3k4GLQjJYoF65YTv75LGR+nviB3mvQ1SRHdRdhrhvgb+A/GEgV
X-Received: by 2002:aa7:9313:0:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-842256d7323mr5361362b3a.25.1780205485111;
        Sat, 30 May 2026 22:31:25 -0700 (PDT)
Received: from workstation ([2401:fb00:ffff:fffc:0:b:ac10:f0ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm7290311b3a.26.2026.05.30.22.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:31:24 -0700 (PDT)
From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: prabhudasuvatala@gmail.com
Subject: [PATCH scarthgap] conf/machine: fix typos in ARM and x86 README files
Date: Sun, 31 May 2026 11:01:17 +0530
Message-ID: <20260531053117.17915-1-prabhudasuvatala@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 07:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237791

Correct spelling errors in the machine include README documentation
for both ARM and x86 architectures to improve clarity.

- Fix TUNE_PKGACH -> TUNE_PKGARCH in ARM README.
- Fix "to to" duplication in x86 README.

Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
---
 meta/conf/machine/include/arm/README | 2 +-
 meta/conf/machine/include/x86/README | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index c5637798e6..807b7f8a2b 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given tune.
 
 A small set of ARM specific variables have been defined to allow 
 TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
-change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be 
+change the definiton of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be 
 ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
 default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/include/x86/README
index 05aee533a7..8065ecb3d6 100644
--- a/meta/conf/machine/include/x86/README
+++ b/meta/conf/machine/include/x86/README
@@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
 TUNE_PKGARCH = ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
 
 The package architecture for 32-bit targets is historical and generally
-set to to match the core compatible processor type, i.e. i386.
+set to match the core compatible processor type, i.e. i386.
 
 For 64-bit architectures, the architecture is expected to end in '_64'.
 
-- 
2.53.0


