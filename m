Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A836E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8170.1733295002310098369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLMe40Rh;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a736518eso78228915e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733295001; x=1733899801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT7nM9uqd7uOuuxKhStcnUAdVio7yBQmXk/M6hXitnE=;
        b=cLMe40Rh45Qi8mImD/RXnbA2A0rKV3IX5MaUBRi7wRejfY1O+bplo9AyV9Ph1/Xkwk
         v7XWeO+Cy9ATHDvLukeKmdH9JBX4ErhWK+eVRPR/UcjFXQIKeFk6ssjSzbKO01LjnzyS
         xfwsUHXW4gPLXXZFwQ3bOmzXsvtfTyENmQev7CykZUdo6tDu/mg8wWRu/8A0GMKjUzGR
         wrgQHLCDwmtzq2c82vQpBd7qxQXQYv4t4pXKp07SkGu8Q1SG4ofzDRiknbcBTSBxQh5K
         LnYk7xEfDmg7oTLsW5CfcMIMWLeadAYohO7yZswWkjJCSkiA3YOL2DPBGPW6NFTdQDqA
         SWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733295001; x=1733899801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT7nM9uqd7uOuuxKhStcnUAdVio7yBQmXk/M6hXitnE=;
        b=Q0qlXmvoDPu+RsB1QI3gakyfM8869e4HnnNCOxY3aGGftYGrcY/6bzxrUhWu5PM1VX
         BuYRvA2bg9TtaSYkB/J4U46qiUKpu/pMpH35PLxq0p1TrqBfXdzvDQODIJ8xHc26fv+i
         wPYIo1Y+R3L3fX3aD5vTtt4QzPicH4u46jJJNctiSc3kKEHb9HWJkczYRmheQrRBameP
         AeLQhBW48vn4SWKbgVJnQNBRtZSVmljxITota/Ep7nDrmmR2gPt7CH1xwEz/WOl1VWqm
         S9m1S4U7O+9pONzPpqqGdQkzP5i4Z0rZGHczx199Zl44cyWwpSWtHWoUlE9dR7RZOSLW
         SFYQ==
X-Gm-Message-State: AOJu0Yxdj1quLJenBLBRyNd3k+LpXke8RUlfMT3rJIbrxW8lEjkEEQlK
	F7bO51S9WhYu+dy2OJ40fXRrJr/rpSAvEcTfJqIRIt9W93K60Vm2Vd1YOA==
X-Gm-Gg: ASbGncvotG5tR9rNjtRymAGeFL1gSj3mNioPsd0YqkNCQ1u2hIZleQvuT+faKZh0iYU
	+OspY19m7MbBbj29ykXO1vk/daKmW1hha+Vzm6Ja6A1QuBFs1gN7hFnhASTfVYc8SXQl6W5cxaF
	KDBJPKFImw/Gmv/lSR/9COAceOZcF3BJL9XcQINyFGvL2wfikDY081T/qYb6q7Yq6Qjh4BNZgm/
	G70EU/YcTGU+lzAoZXeoNuOKek7qx7ce3CueUxyuuI2cg3jP2rqApFJDzPdmsj3ILonX4L8PKKl
	l5W4LQyGBao=
X-Google-Smtp-Source: AGHT+IELFh3rhjz9s76ovxn5THYjRYur3nbPEFM/sPo03kGEHOnctvJGehoVW4IHVUXxBW+SLSz3bA==
X-Received: by 2002:a05:6000:156c:b0:385:df4e:364b with SMTP id ffacd0b85a97d-385fd3cd9edmr4854372f8f.12.1733295000609;
        Tue, 03 Dec 2024 22:50:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:50:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/37] go-helloworld: update to latest revision
Date: Wed,  4 Dec 2024 07:49:15 +0100
Message-Id: <20241204064920.817016-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208261

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 8d4dd49ab67..1e911e16940 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "39e772fc26705bb170db248e5372a81ed5ffd67f"
+SRCREV = "d7b0ac1278591aea848a99258ccfdee8e4d454c1"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
@@ -20,3 +20,6 @@ inherit go
 do_install:append() {
     mv ${D}${bindir}/hello ${D}${bindir}/${BPN}
 }
+
+# /usr/lib/go/src/golang.org/x/example/ragserver/tests/weaviate-show-all.sh is requiring bash
+RDEPENDS:${PN}-dev += "bash"
-- 
2.39.5


