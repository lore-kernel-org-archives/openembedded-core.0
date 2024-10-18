Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE015D2FFEB
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.18926.1729245703533332834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J2L7EUva;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-430576ff251so19172255e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245702; x=1729850502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAE0cX3/d8b9sagUnU8jVpOV89F4Oy3ZzS5WOCTPcr8=;
        b=J2L7EUvaBBmMf2e3LIHrU4Rl0deS4CVzFG+HQI1ukNlVFGL0dcONh9rbHfE52E75BP
         mqh2AZqMWqz3ZBJpysvUFCOKWRdRfGDWq3fQugJje8SaZTELHoNgOICrYvxCRq7bVe8k
         t9WwNHTxqxZodkXSq6acSomFt+Hjn26YScsVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245702; x=1729850502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAE0cX3/d8b9sagUnU8jVpOV89F4Oy3ZzS5WOCTPcr8=;
        b=obkWXJK4arvb6HL+6VLyJPQunWzAFPZMNCRmudySnIZwzpmuLcQhshXbgqb+jQC4nw
         peDP1POx7HGcKkZL9xLBq7iz4hhVX3f+pj1JNOK0XjMcJjzdnYmB5MeFaJUnMAcQL2BS
         97uf4lb4c0T20l7MiRkDFUGg8S5jdYIh1ENNAwMOrgFiZlNVZA7VyD0omYjmrsioX8Lw
         6Dvq6aj5cLRJIc+YRLbvbPaW/fr0QzO55gwDczxLUrTG8C1gMNvfjGM8tIcwUuzOf3wh
         4uAH91ehBbpPgyzghHWuPIkHTv8lBN2xxe7honPPezXV2yieQ1zmtz46c8Q4OoVE4J+m
         ZNMQ==
X-Gm-Message-State: AOJu0YwWTdFSquaXGbwbAuVcJgRavYBfAPEnSLdUIaMEZ53OuUBNbOjj
	aZ/u6vV0UDycNtz8H7Py3LCJ0dbIfau5ZaYI9fbjaQ4fX0QUb2GwCm88XMnOaDoD9p1R40g/IOt
	y
X-Google-Smtp-Source: AGHT+IHALyxCQ5TnT1Qf360Jcp4qAboW/MZat24Iblo90d6HBqg7BAj8lLPdCsgX2zee7qRTECFWlA==
X-Received: by 2002:a05:600c:3b8c:b0:431:54a1:360e with SMTP id 5b1f17b1804b1-431616976dbmr14261245e9.32.1729245701494;
        Fri, 18 Oct 2024 03:01:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] ppp: Upgrade 2.5.0 -> 2.5.1
Date: Fri, 18 Oct 2024 11:01:36 +0100
Message-ID: <20241018100138.2341819-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
References: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206048

The license on chat.c was clarified to MIT with a license identifier
so add to LICENSE as such. The ccp.c change was an email address.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ppp/{ppp_2.5.0.bb => ppp_2.5.1.bb}                    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.0.bb => ppp_2.5.1.bb} (93%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
similarity index 93%
rename from meta/recipes-connectivity/ppp/ppp_2.5.0.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.1.bb
index 36e2585de42..5b8c49ca850 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
@@ -5,11 +5,11 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
-LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
+LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=1bea10e81fc6f2df105b1f8b733cb149 \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-                    file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
+                    file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6"
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://pon \
@@ -25,7 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65ecffe897de636ff"
+SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964faf0243a"
 
 inherit autotools systemd
 

