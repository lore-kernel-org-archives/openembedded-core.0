Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB51C44523
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:42 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13737.1784295278409182173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bU/qrI/c;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c11f9015d8so1091057e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295277; x=1784900077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5n1qm9VAEfAauKmP+FEfBBz678WXRJTz7w2r3TmRXJU=;
        b=bU/qrI/c6KhujvDkI1F6ePLRtsIJASjmqbrjnDsudmwTcQCB0lbp8fOKVb+MDMyrtE
         15UCNVVZslbWju1aunVMeMlm+dDB60VQr1tfwmgShVGPR61vseJ4YZeaOY2NGn0i28v2
         mirmghoJv6X2rywEe7YNvYSLWXAUjeBLjIQFI9HIn5uLvScVboVkbsxXADTx3DekJNES
         Df76mi8Q5tzDvP6tL2GbLEw8KEQWzU8NDdMe1JG3wb/FzQ7Yk+JoSYDc77wCKQ3CMtr7
         PRtEwoZuonG1m7HIPjOvPz6bqa+obieWVwG6cMeBdexTLxjC5t0OxO5Awt7ikPsYGk9P
         YkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295277; x=1784900077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5n1qm9VAEfAauKmP+FEfBBz678WXRJTz7w2r3TmRXJU=;
        b=gupq/LTTNXP2PFcrrRERGmcMm/b0WZ85djMeS4wLiDtnOnTthKUk7VViLGoButRlsW
         Xz12435ghKA3ob3wd9Io+YwmjlkICqksZQdGW7wK+5UnaAEQHvxgsyURfJn2hhYJHYU3
         +TnEouF8od4tA8o30EQjc12jV7dRW4qQUgg1EP6oufmRvvwr9yIUZcO1vJUqFBL9Kvi2
         y2UZ7hHhh/zaUeCd7FAI/Qx2dzKH96Al+JouWMnaKkMcU8eqJ47uVHJ4HJt7Afhs1zUL
         5akXKhqWcbhAC37zAAGjXJCO2JWw+pOCNvzHavygty8G2gDfubqJErLsosIS0fvrgR8l
         rNCQ==
X-Gm-Message-State: AOJu0Yz3fJWP5ichr46h9oTenbA+Dp/DE/ihWqwfl4GfVZug8JXt/b09
	1AW4B0p+IwKGcE7qOgjgkXk/fhAUZQiNlAYw25Rbn3Oa0Kim2mNph8fJwns/uQ==
X-Gm-Gg: AfdE7ckvjVDoWRYs6nQoBJ6tnrzW++Cb+cGwfMOyhV5j0zZeiRtAa9HyF5SCmQGF/0u
	MTnrpJF9JwxIQXdxGNLSwWIxI3tuMMs/6pX0MSYeUhavwUvR+UjZhlpiTahLlYH2+dPNAt34alD
	2KMo3nnonj76J5hZWnbLkMOYlpvCYTCWA6pt8KfWDO08ko7E+rcGhpC3oa3tP6b52TBbNojJp+f
	/oOX3HnWD/1EJSSCVHMW/8re+U5S4buvPEoZWWeVC560nM5JyR+lrcxS3q+o3LqBHtOqRxQ+GdH
	jcDIW3PXneVaVBzWhRK7wG5bl8sQh5sZRwk2s1bsYVpjLOJaYV2KpIDHEK2XycGXt9qoH749HgD
	Oy25gtln6EzBos4x5KechUer1/vW2A4n+NH+iK+gskMKMW5kQ3/1rRO6RXc2czNLyuXFQsY2bjj
	Ym+ip/E+WOb50oQ98XybKtAD1t/jnr1JMxtVvSWv1kRGnk
X-Received: by 2002:a05:6122:e247:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5c1b64e8f9dmr383692e0c.2.1784295277203;
        Fri, 17 Jul 2026 06:34:37 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:35 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/6] nativesdk-packagegroup-sdk-host: add an sbom SDK feature
Date: Fri, 17 Jul 2026 09:34:19 -0400
Message-ID: <20260717133421.3510970-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
References: <20260717133421.3510970-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241186

Software composition tooling is useful to have in an SDK for generating
or checking SPDX documents and scanning artifacts, but it is not needed
by every SDK and pulls in a Python dependency chain, so it should be
opt-in rather than always present.

Add an "sbom" SDK feature that pulls in the SPDX and SBOM/CVE tools
(nativesdk-python3-spdx-tools and nativesdk-python3-sbom-cve-check). It
is not enabled by default; a configuration that wants it adds the "sbom"
feature to SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new in v3
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 7205599288a2..31559eb2cd82 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} = "\
     nativesdk-flex \
     nativesdk-perl-module-integer \
     ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'sbom', 'nativesdk-python3-spdx-tools nativesdk-python3-sbom-cve-check', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


