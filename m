Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061D2C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 18:36:40 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.101574.1700764590730546103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 10:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=T+guQThC;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77d6b28aa9aso61329385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 10:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700764589; x=1701369389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qlwf99q/WL4BnEOtkgcGObCHI0JP6IqVLlS2Filkaus=;
        b=T+guQThC8g/reWTzlEjlFYvSg8sf0MKLgaP3+OPYYEAyNiqEtdFpni6kIFZq46w/Q8
         AwshId8rjd00nO/1dwonaDqvOqJK6ESN/6TAr9rIZmwZDOs+Kkg6Fz8Vy9AV9EA+pToL
         HU8p2CPJYw5kZp+O1SrButNjriStFWVX/gEvbk6buVIYT0Pk/6PQcdoO4956jH7ywc5d
         n89Ackc/Nuu4u3q5R3VokvY3ujgFP9JaRDNxYLDyliuo4qjedgk7v8UZo0kSVo/TNlA0
         D59zDHAh4QohXDeisiMHR3wO3RsAEVHG0Upj6V1ZBgYT2oBl3pyvzCGB1WJtbHBo/JD8
         NUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764589; x=1701369389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qlwf99q/WL4BnEOtkgcGObCHI0JP6IqVLlS2Filkaus=;
        b=HywyVuhdp7goD0ZRTZsyvgQ73nbQD208WLv20aShjQNkFvnJaXbErgeapLINIxujRd
         fNSLA+Ijm9W+ns8U290NDVkSKjo8EcM6YQTt/Y51dxLufHl5VNWhC9EaOYp1KDE+58rl
         e4IV3ds6U6iZ6+tHelmBSfJV8I3SCkmAybNTW5RJZbMI5dLXuvd8IVpgIBn1I/690bNf
         0erUL3u14LQsNrEBG44kJyE/t715B/FF9gkxFu7J3dS5AZA4P4ZOXtWlnvRfnYmoJ7NL
         2inieOcmdEKA2kQn8q85/5EQ4FqByfn9/Syq1StxQ7tVfbIoR1pbYu5vEcPNH5TmZlKc
         UVTg==
X-Gm-Message-State: AOJu0YxU++rYRFYtqa7y1l4y3c1jKr4Yi9J418jjzvfezSdyJPGZO4PA
	Ji4LMw7pJBDaLAK67GybZDc55nNoAH688yakJB0/Qw==
X-Google-Smtp-Source: AGHT+IGWf7TViW72RJHj09u8h+EL8L95eaQQGDmu9Va3BS64rbFxFz2flHHqITV/7S3EinV6Bu1uQw==
X-Received: by 2002:a05:620a:17a9:b0:77d:7308:2842 with SMTP id ay41-20020a05620a17a900b0077d73082842mr252158qkb.59.1700764589385;
        Thu, 23 Nov 2023 10:36:29 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id g15-20020a05620a278f00b0077d7649ef06sm457394qkp.14.2023.11.23.10.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:29 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH] python3-ptest: skip test_storlines
Date: Thu, 23 Nov 2023 13:36:27 -0500
Message-ID: <20231123183627.3811314-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 18:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191174

[YOCTO #14933]

test_storlines is yet another Python ptest that fails intermittently on
the Yocto AB, so disable it during ptests for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...orlines-skip-due-to-load-variability.patch | 32 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.5.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
new file mode 100644
index 00000000000..199031d42aa
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
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 8e023c7dfb8..d375de4b19c 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
+           file://0001-test_storlines-skip-due-to-load-variability.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.42.0


