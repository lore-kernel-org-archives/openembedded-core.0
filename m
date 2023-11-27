Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED3AC46CA0
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.91594.1701080288992459267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2xoqMSS;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a03a9009572so545034966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080287; x=1701685087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmhoLzKYHM6KC3A9qiRZECcNFDdS8OD9uG4EnDskow4=;
        b=E2xoqMSSondXNxYpXlmE+wCmZdqFnfg/4282v6chpr57/Cz3jBk3eUD4kFQq0Y5kH0
         G9L7BgyCogiXcDLIEkoXbIrzxNsUXRMrzguBqeD0HImQZfSGQWED2483jxrdXL+yo1Ux
         179xXrQOI0wA8uogWDtcdG5mnUI52aNespBNimxLuW3+2e0+BL1XxlQfMvo1hfkDzcse
         viCHazjpYDphG0tQ6N+KN3E717p/btGqcp/Q6mPFlVIh/Wrl9RIMMKh/WH0fx41wAtak
         lUVo6htnhFY3BrsfdvEpOyWkx7HdkHYtBGVFh2tVJ49c2RKomV1DSKAcU4XmJGKyNOkb
         EjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080287; x=1701685087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmhoLzKYHM6KC3A9qiRZECcNFDdS8OD9uG4EnDskow4=;
        b=nlViYgc0jnIz0qJSYK0vLhmhkiyDRUTg8eCue+dNIJNWglymHtxl/sQRVvt9lOcvPt
         TX0F0twoj+YBI7kZt8+WJKULs2B6ZGXms8BXwGd7eklpdm420U+tYVoXxPtSgW0qvKrg
         d1sXhrLl92Ara6E1/svtnK5vSCAbD9d4K/lQg5O40ptdmFiqQ6ZaRYzYbFPuK1pAZNPi
         BtYFCxpTpPyT0eEc2jBIqgKFRK/++8Jh56CZD5IqEzVBvLCsFNvUG+NJZ1H3PXu8uiQW
         ax3MxIDgb0zhTourYWWwKgmelwHn7EozeDbK6CTTw+KBNGzuiIO9QSz1A3CNhOdYbvrO
         V1Sw==
X-Gm-Message-State: AOJu0Yz6H1XR1FAyjNfbnpTleWtLgZXOgGbvvZtKAuf+0yDO6Qe+/YNC
	nRigproUprKDAgf42L+U6shi4vWAAs4=
X-Google-Smtp-Source: AGHT+IHOheVZ2XqC9sitDvEO28TIWTmwejvfas9HvbQ0uAQTshfOUisdNnThnvedwu+HLy8C9NqKVw==
X-Received: by 2002:a17:906:3290:b0:9e0:5dab:a0f1 with SMTP id 16-20020a170906329000b009e05daba0f1mr7503540ejw.36.1701080287091;
        Mon, 27 Nov 2023 02:18:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/19] icu: upgrade 73-2 -> 74-1
Date: Mon, 27 Nov 2023 11:17:46 +0100
Message-Id: <20231127101751.3187950-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191281

License-Update: formatting
https://github.com/unicode-org/icu/commit/248b1c2a13fc7fc346e9e9419c4794df8a590ad9

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/icu/{icu_73-2.bb => icu_74-1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_73-2.bb => icu_74-1.bb} (95%)

diff --git a/meta/recipes-support/icu/icu_73-2.bb b/meta/recipes-support/icu/icu_74-1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_73-2.bb
rename to meta/recipes-support/icu/icu_74-1.bb
index 7c59f8bb896..88ded166b52 100644
--- a/meta/recipes-support/icu/icu_73-2.bb
+++ b/meta/recipes-support/icu/icu_74-1.bb
@@ -78,7 +78,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=80c2cf39ad8ae12b9b9482a1737c6650"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=08dc3852df8fffa807301902ad899ff8"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -111,8 +111,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "818a80712ed3caacd9b652305e01afc7fa167e6f2e94996da44b90c2ab604ce1"
-SRC_URI[data.sha256sum] = "ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701"
+SRC_URI[code.sha256sum] = "86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0"
+SRC_URI[data.sha256sum] = "67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.39.2


