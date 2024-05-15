Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F55EC25B7A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.12845.1715774189480676416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+XH/lk+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-520f9d559f6so7965208e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774187; x=1716378987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kugkSzL8nOjVPt8bev8UcX4/JmvTQVd5ikKR39qXIwA=;
        b=B+XH/lk+ZiAP9/qUEApTTSoSDLA6KLK/QmAeBnMya9/UlM+2HjUkwCHjUsgaDOfjlV
         CUN15kMwlXKCAneHns+az04g3g2okQaanOzIL+WNGHr396u2LMfQ6mcXDJ9ZWUu7bayl
         3dQYZpFClHEfH2bfjE1PrsvmXowj3yvlV6V5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774187; x=1716378987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kugkSzL8nOjVPt8bev8UcX4/JmvTQVd5ikKR39qXIwA=;
        b=JPLmUqQ5Uws6jY8MsM4su2U0GyMV509Hafz6hOX7ASOXZUnlvfsUZGq0ilzWo9RyqV
         uZAfFxtIW2fPaoZ0BEXRo6wZjXbsDKEtjnuBlgNhg9IDqjuV6np2mSZ1lw20nwgQK7Lv
         SNiBe2Uivou9JZjr6Ykz9fpsSwevEfUx2F6m43AqMBmzOF6ONU5RTFalVo1U1v4asour
         qxnHMR6ExykPQ5wB9Ytt+NVXT7u1YDmIyM/giBsp0ZAMBxQGQGowASvgeu61l9wyhEHZ
         yEiqWek03MEaWrZq55+CwUS2WI0/05YWWfR9iAOG1gL9b4y+ts686Y0LDqqpK6pjeNHY
         uU8Q==
X-Gm-Message-State: AOJu0Yz5TzkXDjaEFZQO02jzmZIgYx+CA+9qW9OKaFxKeoOecN5IevGb
	xFY8011fccYq91FtFBjL71xbRqqRpDed6HumKG411cO2lrFXajKOHD+VEYlPWfghi1B8PO0ciKt
	BJIo=
X-Google-Smtp-Source: AGHT+IFULL0ZA2m6MFukQ5rZDjTqg8ephyHmJa9HhJU3cnQ5jo8fHnLLatQknHHKFx+hcCMjpiaZcw==
X-Received: by 2002:a2e:90c7:0:b0:2d4:3d86:54e2 with SMTP id 38308e7fff4ca-2e51ff5e37fmr97004861fa.27.1715774187079;
        Wed, 15 May 2024 04:56:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] insane: Warn about S == WORKDIR
Date: Wed, 15 May 2024 12:56:17 +0100
Message-Id: <20240515115620.420558-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199284

Where a recipe uses WORKDIR as S, add a warning since we're going
to stop supporting this soon.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 03ac06b102f..7af29ded458 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1602,6 +1602,11 @@ python () {
     if prog.search(pn):
         oe.qa.handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
+    sourcedir = d.getVar("S")
+    workdir = d.getVar("WORKDIR")
+    if sourcedir == workdir:
+        bb.warn("Using S = ${WORKDIR} is no longer supported")
+
     # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
     if (d.getVar(d.expand('DEPENDS:${PN}'))):
-- 
2.40.1


