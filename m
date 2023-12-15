Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD1BC46CCD
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.57790.1702626738401063317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/06pVG0;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5529a38eccbso336375a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626737; x=1703231537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gS9yMDq/i0Qaxb9266fS0t8XQVXJQA6O398lo1e9UBE=;
        b=W/06pVG07TV/9UrBiyF3HUHhM3g9Vrl0JVBkmbipOTiZMZvXiHA5KYmWJCMoWoXdtS
         /vnajcieMG+WfjxGJm6cXhHq5D+fFGvCd3cH80IYuUbXqOkbQG4niKptLagCzjym8L5f
         jPs2gsiYH+kMeCVSm3GeyFNA3hDgDdSUS8YHyQwtgFsZLi6+gOISd9ASOfeZfSV/m2wE
         owLQ3z3N9b4bV1bhKtqKJt27PoW9nOW2B6hJRj7+dOkfVWiLAMBDMbebH2mktaa+ZHlX
         KXyt37DUdrp0x05qiObhYQBWPNTknud8sY5QEOMZdZtHQqu8rFlcCH60Pl9Wm92RP7EZ
         YsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626737; x=1703231537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS9yMDq/i0Qaxb9266fS0t8XQVXJQA6O398lo1e9UBE=;
        b=rGEAgr1+e15cOI6J/i6BU/LUbLY68jethuDlmy2dggIlU2DiRwp3QBiuM4FxpsDtUv
         tODv5HmxxUiAncmMWxmDckLP9irKTRxi7MHYiaU8STIVRrhcWule+XT78tWl78Xe3j41
         uQ24AF55Q9Bfic8WOm+tu6XwoDi4NsN52wUHNbUormopXhSTaGI2Sq33DgEG/GWaF0y8
         2o/0vWcouC5g0yqYisshgxY9/OGtFzSWOFbVF04dZp648efQH4ecuy96bp+SgWfzIr6T
         1Gtpbdwkr1L3GqzQK7jaASq13Xd486OuzgujgZMO4kCOP3BiwvjMU6dCcxMLVAKrRYCh
         bFJg==
X-Gm-Message-State: AOJu0Yy8NHk2fyd15KDgvT3LjT/SjSG/xFsp8gtESEGTSzlynTHBqRDH
	mVKsmRWOj4DOUF1JoxIq++Kmv4vwJuo=
X-Google-Smtp-Source: AGHT+IF4YxyIR7Q+syv4mJQnY8kaph3pXxci3ttXKLfff2OvGNMpPyqF6iNddEmlOHzncs1YbjnZlg==
X-Received: by 2002:a05:6402:214f:b0:54c:f771:b49b with SMTP id bq15-20020a056402214f00b0054cf771b49bmr2515098edb.90.1702626736844;
        Thu, 14 Dec 2023 23:52:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/10] python3-setuptools-rust: remove distutils dependency
Date: Fri, 15 Dec 2023 08:52:05 +0100
Message-Id: <20231215075210.3049785-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192417

As allowed by https://github.com/PyO3/setuptools-rust/pull/336

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
index a91ee23ca0c..13817cb3150 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.8.1.bb
@@ -22,7 +22,6 @@ DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 DEPENDS += "python3-semantic-version-native"
 
 RDEPENDS:${PN} += " \
-    python3-distutils \
     python3-json \
     python3-semantic-version \
     python3-setuptools \
-- 
2.39.2


