Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB9D711D9
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:25 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9457.1766114539305312533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LgyDcE0S;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0b4320665so19804855ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114538; x=1766719338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOBxGCy+dwrfi5A7kzQXwdEzigTQxjyMn3gH4pLakrw=;
        b=LgyDcE0Sb/4oPPW2hS7rxh9rKvas3RYccqidzrUzy8CdvGB0TZD+XyczCioQBylJlp
         1fDb30pjkVL/HQTZfU+x4G1FXPaeJydWP0ogAmxnjJI5s4oFByXlWy2OS4a+RUQWFq04
         a5wyTBIOTiiT/3w1gLYFIfojGs9bLBzcjG6amsfXcLDqDD9n0wVqPG6eBUvIOScHaRPf
         l/L8chpyjBiv3fQWLp4RqyPS4Y+E1hJ2mriv3WVzcVKNiO0fopY0b1j1LChS6V267Rpu
         u3irNyhw2RAcnOZ9twHop9ZFqSygr0zQN5eAJIKbo39JI475W8QG7o42/fR4p418MzLA
         UpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114538; x=1766719338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOBxGCy+dwrfi5A7kzQXwdEzigTQxjyMn3gH4pLakrw=;
        b=rI6wD76VbMk8s7+qys/pUOQedi6WVz7q4tyOlYnGNjyIoVX3iBk2bPT9gLsi3UwBo9
         HnCD6q5YkF4T7uNn/vTG2oCOSpDamHudsfrfC9ARnisUuNpZRZGdDDhQamwW1LjdeHeH
         MSwtmWY+8ejojYEI+xV/tyX4s4xVDaiXHRswur1Iom4psSwy4n0WPGpCANG98Son3oPj
         AoSq66OJV3b+Nh8C98bZaOsDKH0sOspAvnJgLNHb+vZQhajnixGix4XCECg+NNrImdYz
         zl5ITGAxzqigBc/zBWPjT34PDo4jP7jsPielrDY0+iyclC2YDoQ9ViMN3sZ4yI++aBbj
         B+Kg==
X-Gm-Message-State: AOJu0Yy865GIVEQJCwKEjDFGGrewwwGEsK9BU6MXB93MWUXZ+UYg01gh
	FKBkdCEFHb/1f9Vsd/8p2qsMGHwaXmyxQ+msu4Sj8jwuTtuzSvDipzjSJXFPow==
X-Gm-Gg: AY/fxX5wGmq0ISCDwIlWHT98a7nfOLKZTiA+k1pJg0fcCLXzSXrKta7tEw/jD+oPOfS
	8M8Z02RA46rRiXty9Dbw/0fr3tS7wscQ0Jned7+tgAYtBUjdHRCmCSc3oAJpTCDnFZR2Z9gwUPc
	3bzgCcUDkL9M2aR1v+y1Orbs6NpEdl5M9NoreF0wDqKWHaNLz1s3u40u7a8dOQY7DO+9wXjca6/
	intSPir7LCk4lQBa1o+LR/zW6sf6g2SAfoxMYkrBe+v8iav5dOcC6j/Rer9a3SgTEBgxJhj8RZc
	9/WeCH1DI8DuC3l3/5Q0zvIpjyI7RosHG//bsGAbNig0JvJk6Y3K50YAr0cofZWsAW47nzuMufT
	Ey1VY2aFj7R+LNjp0pRlsS9j+Dyj4SQGKE9bNnTdFYZnrIRVuiK8AlnadAE29xNKtMdd4sOR2TT
	QTtfAkoL7cOjXkc+mUKPOOlsZneNpZvghs0Nw=
X-Google-Smtp-Source: AGHT+IEDSjP5+PgiNXIJ4kBQXr3AnAfK+NavSP5MXBJ2qMgVhuAFb3H7UTE0IEpWrW2S+dtW4Jwzzw==
X-Received: by 2002:a17:902:e946:b0:2a0:7fa0:7b5c with SMTP id d9443c01a7336-2a2f2c4ce38mr15667195ad.55.1766114538507;
        Thu, 18 Dec 2025 19:22:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH v2 01/29] libxmlb: upgrade 0.3.23 -> 0.3.24
Date: Fri, 19 Dec 2025 08:51:40 +0530
Message-ID: <20251219032209.960840-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228169

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.24

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1316eceb9fef09ad0fdeede0d1772eac38c2261e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
index 54df81c718..24eb62c98c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
+SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
 
 DEPENDS = "glib-2.0 xz zstd"
 

