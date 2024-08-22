Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE504C5472E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9398.1724319344888257545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPEYNIOI;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5befe420fc2so968051a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319343; x=1724924143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP6nd25PAO9gW4ruYXLEzbkMi4yjCzfei5rSMCTQe1c=;
        b=XPEYNIOI7pkFBN2B7LZnidTNPWIkbceTOUWlYmbZPeoAtxPpuASqsrAtqANxpKyUvU
         Xb/MOhIuHk4izrmWFAF0badvi5m07QUBQU+6s/84h3Vxo2DajTo6tv4s4nRXK5SlQhas
         Ov1AdS4AucjEPkOO44Z10ixBQ4oWn479EHWgfX1sSMrI4AVwoy7p/unqElHTMnvm4+S4
         iLFsaQKoajAVwJ7O0uwA9fs8NEl/DBZj23yVJPFpy4d0EjCly0/utPoucBFU5NejLwUV
         ySi17iuTw/cHjoART08JaGnien2q4Rrn9ZFdzx9rSqc1CtuHTXr36oIVL6xafIp3lN87
         y4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319343; x=1724924143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kP6nd25PAO9gW4ruYXLEzbkMi4yjCzfei5rSMCTQe1c=;
        b=k7oRRtyFgqruvWSN1/EA2bPHRpI6BQOGu4BAibhhMASeNR/ES8iaZUutgz2XkI5QTr
         r4zKr+Ps233ywqo9t6AxltVwwlWHEWTpmk7IAtUZcq923RWwE1kU7KFgGgnicAX1b82d
         YA9TtpP2WsXLCKat57nFsHXaFYTonXxmzKeJmYgio3fzMMrF7El/Bu1+5yrp/Wc+r4Ax
         v3GEQT5T8cEuhb8tl7yRVq7cAJdDogT1wpu1J6AcBomNOuE9K+A0wBb452KZfDsBtl+X
         plOGHBrU4b7T/mnOz8f7CLWDEkRL3vYA+OQva8KieAiztoi+ZjTejnRaw1Nm35B02SXs
         KWbg==
X-Gm-Message-State: AOJu0YyOFcUBlGDdX1PnmnXfCRYzQbRCvoDPGkZtRYuz953nZY0rzJcH
	Koq4woTXSQ/C6F+zG37UeUamfkPMLCBHntiTJN6RvI247ZpVaDxLvq0vEQ==
X-Google-Smtp-Source: AGHT+IH0quDQUadYcjTQXqiGv2dneERM3mu9gvqBVx7mc0RWdXU8MOokQLNIEig/4OF2xdMMo7F5Ow==
X-Received: by 2002:a05:6402:270a:b0:578:60a6:7c69 with SMTP id 4fb4d7f45d1cf-5bf1f234d83mr3230810a12.30.1724319342689;
        Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/32] stress-ng: upgrade 0.17.08 -> 0.18.02
Date: Thu, 22 Aug 2024 11:35:17 +0200
Message-Id: <20240822093521.36790-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203643

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/{stress-ng_0.17.08.bb => stress-ng_0.18.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.08.bb => stress-ng_0.18.02.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb
index fffe6a1823b..e63a68aa6df 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.02.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "b7c7a5877501679a3b0a67d877e6274a801d1e4e"
+SRCREV = "be42d072c0df72dc8136f52d3962e4ba264a100a"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.39.2


