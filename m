Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79C2C52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.55670.1722258813239659974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=14XbrQU7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso2515407a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258812; x=1722863612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHeRv5mdCdEy7SXZq/ns27qbHzcIsXxYrawbFbAoRtk=;
        b=14XbrQU7Lt5U21LMcdpMrzb5f9ZxI97xv0NQcTmvMrBTFJamL/UdUupfEEgYEZOKoP
         6lWlAhlshtmW9/hiTeKN5oNyoPP6W7sEKursClAoELbqYRuJO4q8lNJyLzZhG837sMfT
         ElK+1s8j9gULMZeKOK/YQNLLAzmLQ+WFcFkDhUc4NK4dQ+A1/QlrlsExl4fuJnWt15R1
         SvGk1s1iN6lUkDY9+FOflv8vRmBak+SgVABg4f2qc68oCBFiijB7fsm2aYp53h8kWheQ
         n1YmVd2aPHOYgAYK7zI1Efox2u1mfAijHtUte/oqhFGfcg26gHFqumtdcIPjqfWgFU1Y
         Zrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258812; x=1722863612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHeRv5mdCdEy7SXZq/ns27qbHzcIsXxYrawbFbAoRtk=;
        b=NWel04ccyo7aUpGmFBt3r5v3OtW8VCr27xezxVf//7na5UHvQAvNR0XtaToEUjSJOL
         k2m3AhYGf0hV79XyZItRCjcHg+F/Oj3qmSBHcyZ5J+IzieoEKfLrKX2RmRhxNzyn/xFQ
         VR8mIpPMmeeH36DeYA7Y1RKpjxA8SeVLxa1Qq7JHwy4rMWQr6H61nrhs1a3rajR/6aiX
         EiEF/538AACN20qTV2zSZtCk6DR2EPxvx5txMDttcZx6JmYNDqvWMFleT0SRtPrKoUKZ
         59fXymUa8bzQYYxlVVewBK3S6iz/maENLrrP7mDquEeh4hJMuV/24d4AD9d2xhwLjsLF
         cnKw==
X-Gm-Message-State: AOJu0Yzq95DiL32AGkQc0vmshnanrkG+/we886OTfFUDg/aDO7K2m8QO
	xf/cVoB2Lbnc6X3A3LmV/qddpuleqY1Iott6rDkU70/2osVJlmBheFW6l31aSCcU5LvbHB1pYFq
	tUg4Hhw==
X-Google-Smtp-Source: AGHT+IHCFq0ypis2frTCzmftYEC//Co5MpJ0V5jlrQXeT/0qifkghfBn+R/3jnnl6y4uKKCV+Zs4Sw==
X-Received: by 2002:a17:90a:644c:b0:2c9:9fcd:aa51 with SMTP id 98e67ed59e1d1-2cf7e19e13dmr9011991a91.5.1722258812392;
        Mon, 29 Jul 2024 06:13:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/37] glib-networking: submit eagain.patch upstream
Date: Mon, 29 Jul 2024 06:12:36 -0700
Message-Id: <a46e784fa315ffc545ad36ff865ce033c3da0b67.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202640

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb3958bab8e1a7307f4de7615ddac8222aaae5b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b..98ff476071 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -12,7 +12,7 @@ FAIL: glib-networking/connection-openssl.test (Child process killed by signal 6)
 
 The test should probably retry in this situation so test a patch which does this.
 
-Upstream-Status: Pending [testing to see if patch resolves the issue]
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/253]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
-- 
2.34.1


