Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5E1CD5BB0
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.955.1779233433132602355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aK+SepI1;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso41463955e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233431; x=1779838231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6hu2wjuqy56zgLH39N9IVie1m69ECjfc/u7p/LkM8o=;
        b=aK+SepI1j9H8puckEmBsIT9ha3mwOWlvO9/l06RQx1YEaKtj1xQxhjLeLuJrxtqkqc
         YPuDUpdHp7EGw+wDnSDM26VZsh03h8JpPXB48KICF4FskHgjHSAs78HsMKSHvd4JtoBw
         28TShpbbxFy+SyQWrIH4vEtXsvINxEcmvunW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233431; x=1779838231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6hu2wjuqy56zgLH39N9IVie1m69ECjfc/u7p/LkM8o=;
        b=CStiRKF3lpEzZohaGYufGqohe+PYmok5mwjv819o/Hk/P6Yzfl2HP/vbsy9po18PZW
         Gnpy/ZImgUZIMgz8m2R+6bxqL52EozreRpzc163FTrjrj6CHtUALj2LDZumWklXhbI57
         vyD04va8iL1BS/jREM4AFZJkJDiuFQfExBzZSsGkkrq9BlF7LhbseLxLizuFLOG2tjN6
         5OvA/7g1acAqVx7bNwq2cSMMrn1+PHvJFikUV4NIO7iGqbpcIe6MPcq2TLSbHSHDUTWI
         7VoiAdrekTaJwkPOnx32yt8qDWU9rc55dOGO+mH6z4ELw58gRR2xnwlAAgPfXyOIhZLS
         yClQ==
X-Gm-Message-State: AOJu0YwnKhTzrQcAuzNyfXX369tGMnHCIcpyDv/96z2a2Z5oD5XQQiDC
	AK+iIhgMUjYxa9yL5aMXJP0U2QW3qmNBKjMDATbh9bevihIUwnCL9/wctzC6GOlP9bqZAH1Pedg
	7JMDJ
X-Gm-Gg: Acq92OG+d3mEYct825T1gyelSRsOzuLrmLkEkZLTXBVsSBbf2QSZh2wCCt7/KYCULvN
	bh5yq/8v9hKskwiW6RljwiSZ5lkIkAV0JkKIxgqCgX/0irnK9WC4+zyWq7BtCckz6SyyWCb0uo2
	TX6ewIoQBYBPwAJWlGj3J+Hf8dMFnz8JdkfC9SSaAZsAqb+W1b8DjVvXYXVS1ZoytP/LBJHZ12r
	ZKJZs0AjyD0f7L17dvH5fyg8rBmUevHjemjxFjVjDbBQ7xmjhaLKDVJV2PODanmhp7fRiC5YDsh
	SxPLx4/6pfiMbCSdx6rsW9yPVcBBf7QhrREmTNLPUyOTYigKReRATqB5wrxn3bHtctsRo4Q17qL
	f8ut+aQN272kzj7w+TQ0X5rneK6rFSuiNBGKm08DpahT8kSL7B3ZNXfmUiFfuf7pNTUNjw5VN97
	m+nJExbJCvYIWKg6H+HN2nYw91EOmfbhton9+RLP9MWfKYcIyBPQ0gKOIMG+NVmWRumWTZhBm/s
	5tiQ3LE3l4rQXj+1iPO3wcZ4Fc=
X-Received: by 2002:a05:600c:5010:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48fe5388407mr309009585e9.12.1779233431327;
        Tue, 19 May 2026 16:30:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/28] b4-config: add send-prefixes for wrynose
Date: Wed, 20 May 2026 01:29:46 +0200
Message-ID: <eb5ecca81dfbda1dc230398b081838a4bb779c88.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237356

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Cc: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531..cb3022dcce7 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = wrynose

