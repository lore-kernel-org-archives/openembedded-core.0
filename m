Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20662C46CD2
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:36 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.43020.1703124575903327552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FonQKsS5;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.45, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-58e256505f7so238497eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124575; x=1703729375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYVdPleRXkp1y/WGdGNGt51S2v9KZzQno2ZeM2HRfMQ=;
        b=FonQKsS5yorUfo5NZW5kMZ2UVJzplguRjvBEg35gKu+HAtVrvGbhNbSfc7iugEw/i4
         A3nHtXnRkYkRqQM6GlyJ8o3rHiNJOBvWNiWw9ylvt61iWp0VF6jLz0fpqBK7Uz4JGexS
         M9otRDybtJjZGDJMvjIc3nfyVzrsbHK0hgzHsy8ZAyEQcznQSWXusZBpv7TfsOZHfJkX
         7h9Xym2sZkN5Yd0SO6/Nop0+e2TMglc/nIBoMOxG3QrtKEmWJbGkxcd0EBSPikAYrNnv
         9DYIO0l8RkTv9+Um2Ei8u6nyr+Bt0y5Ql9JUNKfn5beEYH9eQZu6pb1GUuHa2yxsubf6
         Hh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124575; x=1703729375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYVdPleRXkp1y/WGdGNGt51S2v9KZzQno2ZeM2HRfMQ=;
        b=GRz83efBEWQPLDa+hSsQIfSA8+BQ7+Qm7AbTH2qwjUpmPqhDIxwEjb8oJUmyUxqopD
         t+VeviIZrRBo89lI0UtAnYAnPOtPZ0yU0NCOKgoe/IkQMeEaRInYPHvCHepFlQmKn8Sr
         gntrtWDZWTRBi18Z0VUKL+iZcQOqhYy/OYQFOpWtA1XJEYeYCDm8aipoWTRPZeOM0ffW
         iBjssjlfPFuQjajfpEJCNDUelYjFo5UCqMCUq/PWHuTDNN8Y6qE/2CdDdCcU35O8iI9P
         d3k7DpNZvepuQnCLRKtHIuzPYgwDwaaIXvVft4OlLJ5sC480oQu+iT5um+MyOn4FGlyf
         W/dg==
X-Gm-Message-State: AOJu0YySk/pl1in1qWLQkkdo3MAc5+5rk6GwizFIVmdIG5cNo1t37tdG
	ihEqlD1MXz0HOBJXEdv6fn50xzTt2CmGY38bV0j9/Q==
X-Google-Smtp-Source: AGHT+IE5sLaV9sTCf5SSb2iy2ZdgMjkpQeHT3DJ5pIcRzApLE8Zlv6hvA/TuHX766joZ52uBCQKAPg==
X-Received: by 2002:a05:6358:339a:b0:174:aaff:4a29 with SMTP id i26-20020a056358339a00b00174aaff4a29mr832431rwd.7.1703124574831;
        Wed, 20 Dec 2023 18:09:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] python3-ptest: skip test_storlines
Date: Wed, 20 Dec 2023 16:09:10 -1000
Message-Id: <b71d5ec10f8e64fc6102c66dfc36151f2b0b3c86.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192822

From: Trevor Gamblin <tgamblin@baylibre.com>

[YOCTO #14933]

test_storlines is yet another Python ptest that fails intermittently on
the Yocto AB, so disable it during ptests for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d7b9f8157e6214a83b5495e8a32e11540ae65ff8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...orlines-skip-due-to-load-variability.patch | 32 +++++++++++++++++++
 .../python/python3_3.10.13.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
new file mode 100644
index 0000000000..199031d42a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -0,0 +1,32 @@
+From 013ff01fdf2aa6ca69a7c80a2a2996630877e4ea Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 6 Oct 2023 10:59:44 -0400
+Subject: [PATCH] test_storlines: skip due to load variability
+
+This is yet another test that intermittently fails on the Yocto AB when
+a worker is under heavy load, so skip it during testing.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+[YOCTO #14933]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_ftplib.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
+index 082a90d46b..508814d56a 100644
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -629,6 +629,7 @@ def test_storbinary_rest(self):
+             self.client.storbinary('stor', f, rest=r)
+             self.assertEqual(self.server.handler_instance.rest, str(r))
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_storlines(self):
+         data = RETR_DATA.replace('\r\n', '\n').encode(self.client.encoding)
+         f = io.BytesIO(data)
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.13.bb b/meta/recipes-devtools/python/python3_3.10.13.bb
index ba53a09ef5..76e37e42a1 100644
--- a/meta/recipes-devtools/python/python3_3.10.13.bb
+++ b/meta/recipes-devtools/python/python3_3.10.13.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://0001-test_storlines-skip-due-to-load-variability.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


