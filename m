Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9083FCF6BFD
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1459.1767773369596154301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hmHvRAAs;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so17362735e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773368; x=1768378168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMUi6i8YzT8joLIkeO3q40sWfaa3ltfKleoxH1fvydA=;
        b=hmHvRAAs1GqFwrvxoxQZzgMOIF2eSiyVC6OU2WR3g6BYQdXDBVtajYKZS+09cpDlqO
         wv0Q6WsBRaUBIQ1tmMbUU/HyEfjbPh7qJs4CNyBRkwv16dIdj0ROoMoNVDY7m7Vl4M4k
         mwqG76hl2M7lJt2l7Qqn3F9kR9Axhu/OFnMm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773368; x=1768378168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LMUi6i8YzT8joLIkeO3q40sWfaa3ltfKleoxH1fvydA=;
        b=ICmZTgAdtWAkS8ohe8PD6Z3T8A5EDrJQH+TjcUAZjP1UZPfks82F9vACl87CU6Z1yp
         Lyc1lisFkEswK8YmqhsVoB3sKR9qifBjjwlaojjxh3/KyjruOf3Faje/f3rAua13arYK
         FkqpDuvodfWfSbkYDTbeHiYXPzUCx2REvz9lXZUycLkwcLuOgxnr/KxHBcvS2A4CUoUm
         A+5Il66YQFM9C8XpVxUGO/ZgJRhrNfFz0595ct+RUHtho1m4mCVfaKYjwwjl6ae12jC5
         JNAK+It/nrZNjjQILRVBAcdLgMQ9gwK6Pm0EwsweTBsFQao+Z5vN6tAxUBLsrP94zoYB
         sRgA==
X-Gm-Message-State: AOJu0Yy4lBtclyiSFdl+8KN28iDSM+BVR+JsN8A2G4EmTomi5GGYREeq
	7q8+vUekc/zI6W9muRbvp3YLMnNKw9x0xmTpZ15oeFAq/h79aYG/A9Cgt8QXQ8Y47t+YuDKtwNw
	MGTYE
X-Gm-Gg: AY/fxX7WheywyXW6G/pTlOnFZ/qpt+Xf2iyrzDol4bYUysa0ZBM0JMkKSOlnLegB7jP
	0T1WlRdqNwVPO2Kkmr+l9yHWu6ltAg5elULa/tUQqbvYp5GTuuQeBsz5klDTwboxcd7/fUPmFRe
	O2lAqB92q7QgYWgr/gC6BztfLBGd1oeTAM8YyhDCwrlIaiJmeKM2Jst3ybEeLYy/Pm8Fgqs+0VA
	3Sg5l38+CsqcA0BMUh5j+0SheWFdQhaQ3NF5EgU2RDDZuca4C236sggf/Pd56QkN2Ank7BHgsL9
	rX5/4BPCM/EtQgOD7Nrp0UpOneasHrhTqO232IlnQ4zqi0gVjGzsqNSO3DUkDNtBxrwVlWOQlvk
	EO+6IQxJGSrBkFhNxEz4kWykC3gfhRgw9r1dR4nqnSKYYjq+ujc1B3aCVZ8aOmz7MHrQPMa7v+u
	QymsJKnrUZVTt6eYvVEFtCM5ptlAMMUD+oHjYkqaU2kaAYNiFQVxwyHXRiDKmjY0l0xSuZ/ukiX
	jmw8qHz2Vm6SIefRdkZj7q8BQ==
X-Google-Smtp-Source: AGHT+IF2AAoYvC6YwbHVt3hNZvsximT8RoRrH3ugrVD0mZdAxbeU/rYe7H15fMq9s5SL7tpOoNWXFQ==
X-Received: by 2002:a05:600c:500d:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-47d84b3b881mr13076185e9.29.1767773367702;
        Wed, 07 Jan 2026 00:09:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/11] libpcap: upgrade 1.10.5 -> 1.10.6
Date: Wed,  7 Jan 2026 09:08:58 +0100
Message-ID: <043c8cdb3138e00ddefdb698cb0f6363e9db20f5.1767772758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228956

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-11961 and CVE-2025-11964.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 7ad52acd06..1b10001035 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
-SRC_URI[sha256sum] = "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
+SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 
 inherit autotools binconfig-disabled pkgconfig
 

