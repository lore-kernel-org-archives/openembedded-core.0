Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F21E69184
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87778.1766434077635336665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIHgl6zv;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so828945766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434076; x=1767038876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfB7O98TPwWfkp96MIJ2UUHVtzCE5iXnQxEYgaxeYsE=;
        b=HIHgl6zvOPo7K9u0YVCvsBhCWlC9vTldisrcMKpPbewH7e4h+O4nUEJ4+XkryBNcWg
         eXny7cQ6Z4rHa2PLFuWx/+DOJkrexHDUNQ3Jo9SsxcyCVhqnO7ThNSsAdhgJQB+88on1
         Lgt+YmhlogFgNS2EKnPC5Va5pEy0PsEsSI3ya0Cmjor0EalRcm/NzWpBO7FdRO3XOOu3
         /am4uv2OZz3BEhuUSJs+jtjwGC9RxB1YLsKKtgTf3YcbLvAD9vnraGkIeYSThCQ5N8xo
         d1tywJ/gF5gYxmV68xN4mB0mzIHBqOkYJcYZNsHL3WcAtd1kyLRBxw1lJc8MZv5Q+k+N
         FSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434076; x=1767038876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfB7O98TPwWfkp96MIJ2UUHVtzCE5iXnQxEYgaxeYsE=;
        b=Uaq2Sg6Wh9ASK8mYSYFirMZFzSIyr3sZApCtvpWKFsO4rHeJJFfEwkupK562E2vBPn
         pu4UCEtMA7shHI3W2YTlsoI/WJd6PTox/Bv2+3UJcb2dgZg7i4ROWoDgOyNNPQL9B1Mq
         vafujNfqFaNrLbmC8KRx9g87IR3Cp6mk3hjpLxv5m3Jju/sRJkgxD/9UvrfFs8VXJqoR
         8AbMj9qNMhLSVTqdTdatod9D8VEZ1EfK8n9ivXAs825bfpRPyr3dZlqejo31J64zHEbR
         hyxFAew8qshxoLhhgEcklvCMydSeUNZ25hguMmXpht4x7U3Rm1PEndSfGJI64aSzzO/L
         CRLA==
X-Gm-Message-State: AOJu0YzIlUwM3k4uCtViKwX8fM4BdGFBrmGIxZLQO34ALakaDIsBsPy3
	osUnjYGD2hVoRMjZXko+8y3DNTeNtegbe1989FR2RiNjE7HaVGi371jpGY6bUA==
X-Gm-Gg: AY/fxX6XiMtm/OZGFPPdhgwsHPFPZtDoeWrflOCd/OHtRHjYU3eN9Zq8VEikKiRMxi8
	QYA4cAXg9bUP1hUsCfFEk3DITdKISbxt82PYQRKM0REcd8uN7jQgj9mw8IrzuS9rRH+SxZYKgtq
	eiszIVVsXO3daqxDsxERxXFkpZFnzFZrpHebZfEGxWitclVsIRDP2ySvxLzdXLB0ZgdfjLXJYyv
	+T5y88Zn1CwP7U9RCT17yg/v4dV3yFvAY40+LPRID5OB4X5iNk0Ifory5eITkhjtVX1wey5srWN
	uMN1TCDiyW68n0CCY86IwZxR+xAqZRnaUBdsM5Knv45x52vxCwi6b7sM9SepDbwkfOd7utev0vC
	HBIbUpaTrQVA9v5nasqnlBcbQFnZzpxb3/3PFsL0rqVCGS4A/03oRRTxfnqXphDMmwEDfMsmRQQ
	ijNfpullc5M5UMx/x+CrSHGzHw0Kf4ERbfVG6yK/hdZzxnHuI=
X-Google-Smtp-Source: AGHT+IE2cGx1lgZ8eqDwkVAZv+bPnsbhTV1YS2oyfXK5QpztGy8qgkBZ4lf2x9T8xN96pEM8hlerVA==
X-Received: by 2002:a17:907:3da1:b0:b73:7652:efc2 with SMTP id a640c23a62f3a-b8037233e05mr1347388866b.60.1766434075920;
        Mon, 22 Dec 2025 12:07:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 016/114] go-helloworld: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:05:58 +0100
Message-ID: <20251222200739.2278706-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228341

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 0a8668dd4d..77a13b39fe 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "8b405629c4a5215871be932097e099c05ec5cb2e"
+SRCREV = "7f05d217867b2af52b0a28c6d1c91df97e1b5b39"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.47.3


