Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206AEF357D3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21659.1771943572620810171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Kzrc4CU/;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso45230535e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943571; x=1772548371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD85uW4QA/K4yBI0wVXq+Z3n+vWHzDWr4C8pDdYf/HI=;
        b=Kzrc4CU/KccR4LwoZg2hh+MIDCGQrIIAy+8HVEom4r2XWEyQEiWsCWIY9lZ2zbF4Wi
         +SdprqnzZkYBV8nMmiZQ9e32LOH3jeFqpL2SZLWH2lTEqSFoimgApeCOYYVcMvKwG1Lq
         KEpEqHRRYYYZA4+VIqt/GAG5foUi3lOOGbgDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943571; x=1772548371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD85uW4QA/K4yBI0wVXq+Z3n+vWHzDWr4C8pDdYf/HI=;
        b=WiB5CLhSeojHnLfOjeNOk54Z3zH6T+AxP9Gf2eX8FF2FZqqbWOQ8etUhpWeijrnM6w
         WomoP3mgXnuGeUvsGxtoZweFU3KJvsmGnZvvLY8+JgRtW47NJ/ynralL11e7xL8dEPU/
         lRfOHra5VGCG/GvP+F3KII+34b2Qj+G8KciJNuwX69fibVZnXA3UdYuzVxU5X3hvv4JA
         rVW8iVlOYmVylOLMAh2ibQY1Yxc9TUnHWM4tneUHek6WD/S9jPDyepBJpQ4VyyHvPZug
         cBZFW0UJnF8nglaLqjzcOPBhIulE+6yGXox+0khWZe7B5JlZ3g0JjgJ/pFUCbDkOGP4i
         M5Lw==
X-Gm-Message-State: AOJu0YzGJnecqUYFo9XE2JZqCg4QMmffvVs5UDnGSJ0Iyqa6Hfy18NSY
	HQcvgBnsocC8c6Cf12QWQ/iRVdlEzkb22xn3WZw/jGun0l6wKv8Edghi32aG+XQ9EqqM7M+zJCS
	U60Nj
X-Gm-Gg: AZuq6aJxPPfOb/skxLZDJTMaq9FFDDPOTS0myL4cQimvVU9kppxkVNZ4ROPv01rOANK
	UrPMZmDUJJUpacYRJshiJnMA6IRHF5N/rWlzJwqBzcvIixPXtpkyyKE7G0i7DM2P5ifxHahwImK
	kv7x4nHSjG7DRh7mZHUOSNN36YU+NR16HAaIn+XYQskkqSABJtpbaSeCOCrmgNsFx2NJ0ZWBQ+x
	PNfX6JwPftjpMOJLjrIGAUYe13SbCye6RixmXtsSRh3/hJiEvjwTWDO6bQL7wB+aLL47E6OFQ9d
	Jk7dKV+aHPf/e7yYWJbOgLzD36hS5dfZZZPDJ216TAmC5iKRHp52paV5feGHgR+VUHZQo0U23KV
	lSJ1Oq9gtq76F2wbEoPMm0MHB61i5ba2AJsy21B+GlvK344DfAJ7VkzC7kXAvz4YpC83e2v6FiS
	OiRg8YB0d8NwfX60lDgaw4S55BbjoTqd9p9SonCAKy160gmC+fydiMWm8o43hfldln6YTt0c6ez
	rYk1AoDY2DGENO0OqUNeiiKDB6r0zabkQ==
X-Received: by 2002:a05:600d:644a:10b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-483b5059e22mr62756495e9.32.1771943570575;
        Tue, 24 Feb 2026 06:32:50 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/44] vim: ignore CVE-2025-66476
Date: Tue, 24 Feb 2026 15:31:36 +0100
Message-ID: <41cd026976fcb38dadd79ec3e8815243827e111c.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231813

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9a..c492342ffb7 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"

