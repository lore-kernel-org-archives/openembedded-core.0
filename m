Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D14CF3973
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 21:50:15 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.5089.1726782605275902659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 14:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nE/3ryCX;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9acc6f22dso117304085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726782604; x=1727387404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFsxaDb6NIQUUzT9tnOUsVLbPoJq7IfjFCUiOJxf88c=;
        b=nE/3ryCXYvjPIgPpkG8+U8fy4g6w+T0Z5bnMg04jja7Ap8o162qSO8lr/E1NOlYj2J
         z2bvighNRulbJa6x48Wh7JR+NHstk3sofCi3YEXkrJldnFCFiyia9otWvBAjuHVkdb5w
         cX8rlmvEhohkujdS8klC/4K9ICykpkNACyUur4SrbbucqIWyGT4kb7DjtYaHdUMaSQBr
         Q2jt+fqMdKR9OFGnyxqxckGEb0OZsILTG56FuBCCezmfIwCAS3Ix+n632jj3wOfbWnup
         xB9+4FSXU5ScTTPsghMlnp4NS+KiKTwhn0WsW3SXY29UPutpqAHXxuZD9HVIfbUdU6Og
         aBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726782604; x=1727387404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFsxaDb6NIQUUzT9tnOUsVLbPoJq7IfjFCUiOJxf88c=;
        b=TBB4AsqGF3F7d6u6E3PZVHG3mDeA20wZ3fCKyoKYPSCBy/qNzf0sgVd9F6U6nbPVNF
         4i/dCfBysg2DkH/XgC6mcv993Q7x76xJe/dxxKH79AVh34RAMDXdy5cYom5yhQGWtuz7
         Bdh+LEV0UL0rVFkRnbhVJgnNqf4AFaYedFGoLYMMFjTO6XjQbr5dm+uX3Xebob13m//L
         CA76735CuS28OheWPa+aMaUe3KMNHNWiuFRYCD1OEy8/wl9VtqEJOzIvJXRyss96PI36
         pzIIexhYcCf4W+Lo3H9pnQHPMMCFKBbWH+pT24B7EZtbJeEI9Ji21p4efkiUk3WkP0Pw
         rZHQ==
X-Gm-Message-State: AOJu0YyTlh2+IuPatQ6GuuDS1+l8SJbAYhgQImZSKZ9F5XGiKeEqofUR
	q59j8eZXCzEYRfGTNZrTtnJiZKUOz46aYtLkmxSvclNjyoj7FykPplZ12w==
X-Google-Smtp-Source: AGHT+IHxoHQ+ggUz2kxJ1qFRInL5tePY3JjbttlKYqDhg+cWkdhpiVEdLYst4kkuQc+gB7sH0MMNQg==
X-Received: by 2002:a05:620a:2482:b0:7a9:be54:4b00 with SMTP id af79cd13be357-7acb80cf731mr121114985a.35.1726782604033;
        Thu, 19 Sep 2024 14:50:04 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb07ddcf9sm111044185a.15.2024.09.19.14.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 14:50:03 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v2] python3-pip: keep pip program name
Date: Thu, 19 Sep 2024 15:50:00 -0600
Message-ID: <20240919215000.2448517-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <17F6B1F8381C459D.22254@lists.openembedded.org>
References: <17F6B1F8381C459D.22254@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204719

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Python 2.x support is long gone, and many tools expect to use pip
by that name. Keep the pip name around again.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/python/python3-pip_24.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
index 1f8aeb35fc8..5e1a467990a 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -29,10 +29,6 @@ SRC_URI += "file://no_shebang_mangling.patch"
 
 SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8"
 
-do_install:append() {
-    rm -f ${D}/${bindir}/pip
-}
-
 RDEPENDS:${PN} = "\
   python3-compile \
   python3-io \
-- 
2.46.1


