Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8EFD5B146
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2924.1765620148496925432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hOOGamE9;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2984dfae043so19377095ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620148; x=1766224948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcjMPSyFur+ukLwYd0wwUWqeD2CbQW8Wtva84nAYRy0=;
        b=hOOGamE94My2eqGBIOukTYy0SUIrYskCiO/Scx/09DAFoXBYK0DYFwwTwiAl2k7OfJ
         05DRHTO7ebWzuXQxCBN2lBAx36TqLI5d7FML4Mr3+lakc8/4ehD1A+d197H0olabXSCl
         3igoRZrPHUqkfhJ4IdBE5WnBpaaZ7prXhvMAmigS4I4uxT02kgX2bRyNnvQt1LAF4y/T
         bQ8LfO1fGCUVSxEk1lv16QuET5cSiQjJZQM1A5TvghXLa1628wuZcljYAqZtq1+pqYP6
         pjEHM8btkbz4uUbGw1nmmpbU0GBuR2IOIuoluDmE3MQ1K1AzmkzrifDVXmQ969Cz/ogY
         pbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620148; x=1766224948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PcjMPSyFur+ukLwYd0wwUWqeD2CbQW8Wtva84nAYRy0=;
        b=dRohCFOQVdzGhEqK0RsUJk9R5tYOSY2kHKQb8NpYN/jWQQ9fy5G8bx3awQP9sP1HSR
         O0CNCGlm8ycvjqmHheCYX5RFUR1negq9Ef6EbD3CtpkkA3jWG7Kf8oDk0/ATnKVKoBlf
         H1HrfKRBTEA9FCgDk3d6QqjgkE6nsznV1TLR5z4JobxTcgrA/XcBjQwoDe11ClI3uFOF
         +T9jRnjFlxe/JxleltLQzhX6U2BeAb5mrh67WrwY4ejpUWw++Kq3YCLOylkhVgHnUfTo
         Nw1Q4FskuWC/T2dTLpUm7BLMQrnbXgoXESBLmc9DeGjLsLzx9t0WhljmWp1ias4q4pTT
         ARYA==
X-Gm-Message-State: AOJu0Yz+yikl7EL5m0KoWJbjrVPXKylL/GKU2teA8gL/epDAYrLgPNvb
	/3gUxK8fShvwb+KLqODdoAh3aZsiU9qrqQjLzxSjfWzuhNtpparmE3iCEW55QdE9
X-Gm-Gg: AY/fxX6aPtd+8fQNaZinNzPqHRGo432hO46AoQ67cloie2ub9KtWSaAtrbb/gvRAa1G
	avAJxO0buOpYx8bPqqGYIUrlzMzCQ6qcbMhrIJQS2kqGOGyIyA2B5kpBg2ncQKc8APGHx2hkt2O
	RYMR5iQa87RMuBAieXjLiNakUu52MHzyfpnvz4crgI7m6o6rgG4B/ZM71LAs7MoFuW+p66XxISW
	0sfw6N5/4DiY6R5NY0gMhX9NpI3cOx96qIldIN8exvYH2Ya9pRuAKqI3FERKUf7kLlyQbhvwflR
	2ZBJE/tsJxkAJSJyQqiRK/0nlvAjFQ8/eVi2XXaZdxWeK/MASPWk16T8b+EZa+lkbK8JmoBtD4E
	OkwjwCtEF55T3IfxeXkoBXI79iBop+Zq3a5ORtqQ9xy/FnqcD3mjNiPL2wVhoDuhUGyRiCi0xhE
	fwSF8eXQuvosAAhqwJdFvmWLs3
X-Google-Smtp-Source: AGHT+IEQRhX7wL3iztJoLaj8HD58aZaBBrwcwqkmdGbScrFeeFOaATVIPF07fxjBUOGIyw6hzgIMZA==
X-Received: by 2002:a17:902:e80f:b0:2a0:acca:f3f0 with SMTP id d9443c01a7336-2a0accaf767mr1239855ad.49.1765620147682;
        Sat, 13 Dec 2025 02:02:27 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 60/67] base-passwd: upgrade 3.6.7 -> 3.6.8
Date: Sat, 13 Dec 2025 15:29:24 +0530
Message-ID: <20251213095931.2571498-60-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227678

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a020f8ddbb7acf208992962eb07360a39d0a7972)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../base-passwd/{base-passwd_3.6.7.bb => base-passwd_3.6.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.7.bb => base-passwd_3.6.8.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
index 177927d674..609f67037a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
+SRC_URI[sha256sum] = "fab3d0e6e8b641e116bda9bd5f7a7ed24482384c1513f6a369b506327fbc8dde"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

