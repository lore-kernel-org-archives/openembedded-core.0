Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBFFC47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.151049.1703864770761673376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hRPVcQft;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d40eec5e12so48815755ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864769; x=1704469569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Twp4zngxN6CSSGC1OZwdzvF3ONQnVw9Q4NiIjHRsnLo=;
        b=hRPVcQftZhoGDpdd8sJX5J93G1dXGPCuBjJMpTD0Ke+XbLYa0ZT1Phfc+XhccE460D
         ECEQM7ubz1i/XJaK9JIiC+zvtv0T+N3AQVmOao9MrqsKMbN2XlSXXz2+0ICQpn91O8T3
         ulmO1ZP9/BNgniLNdLguzSr2C/5mqGVYH/WkSv/+Aruj4k/o1XV7bdCDkr5xiZQnSbPS
         iH8k6BpMDxmcjtG/maqIc0iOV9satimBVzwQqcuhyQic1uZc3ZJzCeO2VH0jAnYLJPA3
         HiaIhwRq+uvZCx6iivnDW4VtN3Xe/1DCzQuxWyOdNLev0SGRh5FEokfkhcHkq6MJwOfj
         t0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864769; x=1704469569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Twp4zngxN6CSSGC1OZwdzvF3ONQnVw9Q4NiIjHRsnLo=;
        b=d9IeP83e0yRijXVkQfXtDf/DQ9efw3af6rGU3rh1KleDCx9uICfp1UiCRP4bqIwQNd
         h7tRqqIDiWi4y8RpggesJSmTx2dPa8qAXgNEtQHWwDNRqBfXDe7IUvSHCgmwTYzF6kbJ
         2tKUOs3dtM3FV+rwoHOfwWvgJwSjhEvyR6EI2f7YY6dcbaymUNj2r0BdzSHkhBjuHk5P
         QmefMdcCNwytY6Deqha+TFcq+E430BV213jQYDnMY9oG7PMgMZZ/vvP3eWwSWvlgBX03
         AffQ9Ie+MQyrpK5t8/RWpPt/Klw4OaujdU4ejmKv3Dp20WauHLuJ6p4Up7k0gN06p/XT
         AUww==
X-Gm-Message-State: AOJu0YzJxsOwxowXAycBj9Pm2lJDzgmQx2nmoeeUWI+h1OjhgKyEj8jO
	YUqRmVhjgxVtqDouJ8jeadNqvWT1Cn5soU9yMqFmPR8gdvLuyw==
X-Google-Smtp-Source: AGHT+IGoiCcWKE2/N+domkjBMeiLMYGPdWLI9VqQjGBteOeHVjJxzjGppT0RcSnjem58dBb/onkCNA==
X-Received: by 2002:a17:902:e808:b0:1d4:2a9d:8274 with SMTP id u8-20020a170902e80800b001d42a9d8274mr14959274plg.77.1703864769497;
        Fri, 29 Dec 2023 07:46:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 36/41] json-c: fix icecc compilation
Date: Fri, 29 Dec 2023 05:44:50 -1000
Message-Id: <edda50f28826fd84f83ccecaffbc7705204bccd6.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193053

From: Marco Felsch <m.felsch@pengutronix.de>

Skip -Werror to make it possible to compile this recipe with ICECC else
all fallthrough comments will be removed since we pre-process the files
on the host before sending them to the compile nodes which then cause
errors because of default -Werror switch.

Fixes: caf64f85b5c5 ("json-c: update 0.13.1 - > 0.14")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 915f8307b063e17ddadd5dface83578b8ad254e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/json-c/json-c_0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
index f4b7a32cea..20bcece768 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
+# Required for ICECC builds
+EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
+
 inherit cmake ptest
 
 do_install_ptest() {
-- 
2.34.1


