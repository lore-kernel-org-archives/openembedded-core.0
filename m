Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B35C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:41:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.6008.1705063308557890562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auXrRk9v;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50ec948ad31so5413383e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 04:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705063306; x=1705668106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X0TIMgMfTnvRwZL2/oWzQhlQKgYgQfBDN2137ri9NU8=;
        b=auXrRk9vwlr+OaGGEFgh4KRInOAp/FTL3boTxauxgQoewAsIUwDdIahHfHrByZZ7ib
         IRR7Lfb5vJ9LPdYHk036gkIDlID0tQKzjMejSDjsYK/GmOaVPGDr4FpbcKlBM6s3VmOK
         ALK51Db1gwb4elcWe1RjxSj4XHaHLFWgyQiaFqi56Lrfh0/W6Hzp+yubslB4F1T14mu7
         Mh+ymgGc6/YG0WehUA+2iyhLz0ibTZEryIqkG39tuMIcN+OvZ6wYBFcbHRNqrdhKfbpi
         nmrbJ9O8SMVb1qlxWNq4eoZlLgFcBXz8w75vSn+sDksnC0X/lTpf2Sb72OOB3Y3/i8XD
         tZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705063306; x=1705668106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0TIMgMfTnvRwZL2/oWzQhlQKgYgQfBDN2137ri9NU8=;
        b=LBRzN6VYL6P38qu3TElY6AFpJ53rZmZwdomLL/Or1Rio2h7qG3Na7psvIiCrLJQrTn
         +F05O2INYc1eANkQCOFjVtG1IfgPrLF83xBe7g8Kru/x6mVmBDpMUtiV2hduTIxI9jL8
         VprogSfM8wn+s2BGS+neO6BhEOjFMgTy+jNV8P10YK3TnccVPdbZltnspybDc8G/J6S3
         bYVVmMAxxmFNC9dFbVA9mLVwQTLM2CYVacTjCPx6QxnKoVGZzU+UOIYGyzoRqXh0PCfK
         AR/ZvxaObjRNfW6HYV8pEK+RGy776R7upSZCuZMXEAB9GHDkus9BrWe4TGhqz9N3ttcL
         AVZA==
X-Gm-Message-State: AOJu0YyKiXMY5Gbfxg/SdNrimlt0aGkZu0od/gbwCrTyDnHCbtNGoRG6
	kIV8syKHX/zLaU+6NAXY2dfNC3QHqBQ=
X-Google-Smtp-Source: AGHT+IHcSM0ScYn011cWQzW7CWxOUGgF3N80affzxzD9mLMYaSCFbyBkeCgMcJH6YKp1IaufFUPKdg==
X-Received: by 2002:ac2:42d5:0:b0:50e:5c71:51f1 with SMTP id n21-20020ac242d5000000b0050e5c7151f1mr502269lfl.62.1705063306292;
        Fri, 12 Jan 2024 04:41:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vs5-20020a170907a58500b00a2cbbebedc1sm682561ejc.53.2024.01.12.04.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:41:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] glib-2.0: pull in python3-dbusmock unconditionally
Date: Fri, 12 Jan 2024 13:41:40 +0100
Message-Id: <20240112124141.433256-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 12:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193578

With python 3.12 some of the glib ptests started failing. Inspection
revealed that they fail because all tests in some glib's test suites are skipped;
python 3.12's unittest module deems "no tests in a test suite were executed"
a failure (and I tend to agree).

Why are all the tests skipped? Because python dbus module is missing from
the image, and it's missing because it's pulled in by dbusmock, which
in turn is missing because it is pulled in subject to GI_DATA_ENABLED, and
that variable is not global but defined in a g-i class that glib does
not include and never did. So it was simply always excluded regardless
of g-i settings.

Back when this condition was added python3-dbusmock wouldn't build without
introspection data enabled; now it does, so we can again pull it
into ptest dependencies without conditions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ae6fc519922..9562bc23ebb 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -175,7 +175,7 @@ RDEPENDS:${PN}-ptest += "\
             ${PN}-locale-th \
             python3-core \
             python3-modules \
-            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-dbusmock', '', d)} \
+            python3-dbusmock \
             ${PN}-codegen \
             locale-base-de-de \
             locale-base-es-es \
-- 
2.39.2


