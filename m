Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4416AC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.2287.1643826504403752215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bORaIpxi;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id jx6so368277ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sTfEgLmg1Yp7+Qa34vnHFnv1EbK2927EXjCOnQn9LcI=;
        b=bORaIpxi2W6wq86HPSZVUDFDhcrFQbE6j1yC65CT2fqkJpD0khP+o5OdgXi8pLrpRs
         O9bYsFZacLFFlLQZKq9luJVDjWvMKQ9ofaOLAtDvXYqObDM8XoSbNqmhhv+mcHb7JaVt
         FmlODiMQS3km7kd2lE7t5exv5QiKjp8svzeaNtYwyeFyBUc5phIEyuyKQVII9dB8xPls
         uvCWBfd+AldSQkIfALdCOejR4KEMNfa+Y/fJZaErZZRxaHoIosPWIkWsW7CBzYy1U7mG
         CVIQ95/OpnRGREiQeLN/ihdDQllaZh3eO4W+03LV7lavQSU0cYuo/SE+5Zl9oIpYhoVU
         JUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTfEgLmg1Yp7+Qa34vnHFnv1EbK2927EXjCOnQn9LcI=;
        b=hE/t7kiyVbaZxI95XTxIUeFKBYAYj1Yl8b0rx+EpBqAQByHyfARVcBL8Zdz7xWts1X
         L898pmHN0oWPgGHR6ZRk6AlU8/PDZ/7foiQX2OVqg9vEZxJQCkLx4ALCgaWVrM83HogZ
         rr1esn6o/xwp8JbExhZPJMkFPgqe7XEzohPvdpm3S8iEoFSXD5nwAeHYIR/2++enQuLL
         XRTrGilHr90Ih+cvLwCIkVaCS9HF4TWJXaj/L9cz8X9FpstgS4MwiHgP6a07Sk3KdZzA
         LZ7WUo8pwdnuUp7dvu/O8UdDCqxPcoVOidcJuhI8p2+xCuNMHlcN9JdGLBssINQVY4zB
         Wapg==
X-Gm-Message-State: AOAM531ne64vaDo3gl4b4zOtVep3ZxMSn3NmfIYJ6pvExsgRoI9Vlj9J
	ymOeKdufHJdjVLFZVG6uNX167ksjrc0=
X-Google-Smtp-Source: 
 ABdhPJwDekUhlfHT1ilSH6IogLgzF5Q0ZhbvB1Q/Uim+GSwa7rz+LY5YKEVJcE0/RawNMZbzoY0xKA==
X-Received: by 2002:a17:907:2d8b:: with SMTP id
 gt11mr26439042ejc.569.1643826502975;
        Wed, 02 Feb 2022 10:28:22 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/33] stress-ng: upgrade 0.13.10 -> 0.13.11
Date: Wed,  2 Feb 2022 19:27:48 +0100
Message-Id: <20220202182758.919991-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161248

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.13.10.bb => stress-ng_0.13.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.10.bb => stress-ng_0.13.11.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
index 700ee1595e..72c9de38b1 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "b81116cb69a97aa671ab207a7f600aaacca091d1"
+SRCREV = "48be8ff4ffc4a04a0e3b5f2feaf63cce0cbd4f2b"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.20.1


