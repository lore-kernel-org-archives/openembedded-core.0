Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AECCD37B3
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8161.1778224342491059571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xZBbwgV6;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-448528f4e69so1069695f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224341; x=1778829141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgZ00ChyLAYVM66AY0+ucW2IVTbROHRxghqXDls18Yg=;
        b=xZBbwgV6/af8y3xmz3eXw7UN0u8h3S4yYUG6Y0tNMpoazRxALNS+df4Kf7HnIUcu3I
         6Kt1up/2Zs44+moDDBoZuF3C5PzInjq0VYjzp58YfAhoEOpzRYa278rK3BBTnj0TC1yC
         meSz50nCcDwHL/s6sMu/x9BpUhKChFh4i7igo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224341; x=1778829141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgZ00ChyLAYVM66AY0+ucW2IVTbROHRxghqXDls18Yg=;
        b=NBSV5R3JqpCeu+KdQSHrMY4PQ/m1gSEsNz/KCLMKtmIO1nDqO0U1HK44NqcxL/sOaR
         gvzLscKJroI5LHxJfwL8JhEu6RXtPnSKWvDcVyv5NpbpyyXra++4B821MnNa9aBhUe6R
         +2dkW4TiMfH+MyGmMIdFjx+xp9e8RuB16F7ULM9NSTBECqa1z7dsEn8QOuGi3UmFxCyT
         hj/vX0EbsHo972sYLdMuPj1aftoNSN21Nh2oexljReEEM22bYFMa8RzfWfeJ9nhVB2M7
         RA48Hh0QkndMZdJrD6FYmglPmOJ/PFvmU488ttS6VoHuwG8fwSEjsiMZzsHoCEaABVoO
         fxPw==
X-Gm-Message-State: AOJu0Yz74UloOgUh61KhAifncKBteOuxWEx5N1w/LopRnL5n19LTZwcb
	81R/nSGpq6BKkqfwqn9iadWZlf6vQsJ7+Ny9cBR45UTadTHJ60aInpgjVM2Uw8k5rQeI4M0RDhd
	7L2t+OgM=
X-Gm-Gg: Acq92OHbskb1zi6BoTS2sdPyIL83bHXuyVM5J80yYkTUrsmboKGCZ7qlG/1OP1qBng0
	B8hFuyYtO8pkxCWyiG79ffuLju4f2ZaFq6jTWZpIgMkQ3SczYweQp+baHR1WKSb5wIpWbkV+NRZ
	iyS1LA01t01hyJSiL/pYpYUzrmxfYoLgezINfZdxRQDzr/p/ykI16g+Hvd2b+KnccFV1Ng6eCZC
	c6cC91PVbwYd93mP7n9oz4b0EP39ShH6OPL1yczPvESctgNjvYxAHz59ueFkxHrnrMsX6Q/Emte
	LU4Y4mKc+3+yjv8MYoUEqXRReGtiHNgKgCtZPUjbyzX/vp9UXuryhE2V7NgrqLsJEUuR/wdwHIn
	X+ceBCtKUXxHxdNtvgPtEDiGNlQYBLoGjP3IOjeLDe2kJibEzr/aX/IyKaYfmusXLgCO4pi/I9y
	qFrpEvcY0hULGc3Vo8jickpe9MQjnnwXv38QCOiz6YYez/fUChndzooDdXvjBbSa8hNEw+Tq4ev
	hZQ+E+SgMbwgsDw2uGydQupDc4=
X-Received: by 2002:a05:6000:2dc2:b0:43e:b0b0:629a with SMTP id ffacd0b85a97d-454636cd6ccmr2111461f8f.34.1778224340585;
        Fri, 08 May 2026 00:12:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/52] cargo: set status of CVE-2023-40030
Date: Fri,  8 May 2026 09:11:08 +0200
Message-ID: <392b88f7d93230194a7b4749de4c2f62e01e1069.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236657

From: Peter Marko <peter.marko@siemens.com>

sbom-cve-check has problem matching version 1.72.
It works only if cvelistV5 is modified to indicate 1.72.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac18fd10e777b4ef688b7075c47c616e9405d752)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/cargo_1.94.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
index fc41a19a257..36ec3461135 100644
--- a/meta/recipes-devtools/rust/cargo_1.94.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.94.1.bb
@@ -83,3 +83,5 @@ RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/l
 RUSTLIB_DEP:class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2023-40030] = "fixed-version: fixed since 1.72"

