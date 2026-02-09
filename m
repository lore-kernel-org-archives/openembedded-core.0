Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517F8E7E0AD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43999.1770629380173288398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E74jzQzz;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362d4050c1so2648725f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629378; x=1771234178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VxcCPr172Jc5KFxnIQvVwFdYIQgt22u5fD4HL8+yaI=;
        b=E74jzQzzfDGEgrUUhMN+vhroD9ILvPY0yn0VFrbqySFD0mukiWb5yksRtJXqxL7Lle
         0gppg4DcDdc0qsnoUrjk9Bkz0DfZ6HqsVR3mHuTiGKYAfCb7Nx8mMqiwoVIr1VoDF+SJ
         gqYMLjmR5VvCiZ7aEByo+sUy09QVKKJLanmVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629378; x=1771234178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0VxcCPr172Jc5KFxnIQvVwFdYIQgt22u5fD4HL8+yaI=;
        b=GIUDdwNgvAWYq2+KUkieTzl2h/5NT2YUNq/YAmXozqC+k0ubeI4E2zDgw9SbvwOXWC
         Bgf7sgVBTe8GDjUKhxQdLuE5LGAHMFyTiGV7uR+e0mpPg1VjNRn1rqMWbT17TeXeo0cX
         1lZh5k3Ypd7e4ZDvnZnC0FCrqCS5m1YEfBh4XgMn26JwRu9DUWE+JNp/MqsxqHUINYK3
         r8n9rK96VeTzMND5zFLHDOvR0qx0/LNvE6EjULTEpPx0BvW8z/DoXZ9LRzjz9YNoimJT
         /0a7yimknHFerNh/GY5elDmXE446WDf30J1dFCizxvPSDxf8ADm/8GqiQfe6bLiMnMfT
         y2FA==
X-Gm-Message-State: AOJu0YxxjqayVBryEjEHsv44Cfe09cc085wuJpicsoIqW5acm4wgylmR
	fGdiTywI61uoEaUEGuIDzN39huDDrr7pb+O7knTX3Oaj7TCNnGbPgCRg6CLITWyy+gvGF69+KTA
	pWOGI1kg=
X-Gm-Gg: AZuq6aJKHjcvViCXKuQ02yZ8sk3Vp4H2z4FDXq3xF5EAWD41o8kbEXDQ53esG6gnVNL
	jI+Nn3uDLVwBqQdy53qubvTUgeXEPA1Fsr7cdX0pSGquggKKCeRI5utjSo9h2twMS1q+mosQKpo
	6Ej0do2JCtlVLYC3iaGz5Fpl3mroznFQTQFuXBHlRWpUmvCnXcfY+dHvKUtSFo2UhG2dnguP5gL
	bOqd61WhDTsAuC+Lnb6uyrIdHvgggEHvV5P1p91RjIZzLx2jULtJvFQhyieRV2eQJFY935pXxIT
	4n/jmYZggKgiPa7RyQT5fdLxURQWWgR8ND76NjcNcnkio9CQmS2tox8/DI396KiKO7RSWjyYbEY
	nJACoc3LqeOw9gfWMSN/c6Htpv232WKarc06wrIvCY65aeM0SVcbhZ1CPeLn5g8dvxE6K0Hh7xy
	euRJ4OymlzitBT9WVcCk6/jwv+mPg3pDc4UEQiwLD0nAjH8CpKnuVJ6lvEuPhqnr1D4ibPyOb/g
	8BaH8VdM+kFPYw=
X-Received: by 2002:a5d:64c7:0:b0:436:2356:47cb with SMTP id ffacd0b85a97d-4362938b18fmr15505563f8f.36.1770629378327;
        Mon, 09 Feb 2026 01:29:38 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/25] docbook-xml-dtd4: fix the fetching failure
Date: Mon,  9 Feb 2026 10:29:06 +0100
Message-ID: <7c9acdff1e69a82c89fd447c25b7d6186acdef87.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230774

From: Khai Dang <khaidangbk1998@gmail.com>

Updating SRC_URI, the old archive url is deprecated.

Signed-off-by: Khai Dang <khai.dang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c137d3637b6171fbd3bfd671a56096e7f2b3c318)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index e4b4201b1f9..43c3ba17ad8 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -25,11 +25,11 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e763
 # bitbake build system.
 #
 
-SRC_URI = "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
-           https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
-           https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
-           https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
-           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
+SRC_URI = "https://archive.docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
+           https://archive.docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
+           https://archive.docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
+           https://archive.docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
+           https://archive.docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
            file://docbook-xml-update-catalog.xml.patch \
            file://LICENSE-OASIS"
 

