Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF4CC47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.151539.1703864763061789636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZgUdw7C2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4751dcb56so13891935ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864762; x=1704469562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnqXR7jLLU9eCCxRiyqaRVY7kBl3/QqqBYACouKvJ20=;
        b=ZgUdw7C2T6MK27QndP7c1imTcw/pLxU8eWydmOnlEZR/swiyfDP+b44pb/OHdvbd08
         J/qASOr6ECL7buCpLtx6sC06anfwtxw+G/8Sgk1dLutg1fDn4Di/fA6qedCemsCQIsS7
         /9HvQHEaybHeo0wERuSxb4p8XXmbmU7nox3SWqIXZpAGMFKDyrKEYSKdwWL7Y271piQt
         vw5YAnTdV372zhhL7kJ67vJ7Olo86ucsEXfRWC3z/RhOwHBnT+oayfgEZ18yT1GaJiR3
         UgSELD6AcCgugTNs1tPS6byRQ4E4SkKhVl2Bqh4sjZW+YOrvkpzaOUYpPwvBC2GWrjZB
         3Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864762; x=1704469562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnqXR7jLLU9eCCxRiyqaRVY7kBl3/QqqBYACouKvJ20=;
        b=LFxHG1Nrn7IDwxv47gseoBqBtFIfAnoBflCwtQWMUVnGZdGD2vMCxkHJzZHLGGJtwT
         W7JJ5XNdNlKuCsW4hVES4+dU9aH76Esgs6Dy6pv2chvDPjNSeXejttskjcT6Bvohv7yq
         4GDjBhcTuBM4X7fBAl23DbhJkXH/+IMPmWx0v1wUObxWZp9Gro7XmQdd2YBt8dXC2qWF
         6s2+ilRSk2nW0OFK1xcPk9jxuKrv1tPyLoExlGegSklsyytoba5B8tc8PFkGFHhpnu56
         OR9KYpWR3EyY9xxxNWiuSj3lu7FNRtejZj+EhqIdP8CT2KuBXzfZkFcaUKp4DPSzl5rv
         83rw==
X-Gm-Message-State: AOJu0YyVmo9I3XfaWEP4MzwFJm1bcpckY8F5BJ1ZEgnzfOPFsFlXcY8/
	SeN7mxH2I1HmBZofBAnpAFjOiJF7HCOc2k0Wd8OSi4QmbQ4vKw==
X-Google-Smtp-Source: AGHT+IHq3aX89c8Dk4WyQFM6wE5Klrac19BCTu47YUPbkuULz5ani75HQ04F7pMnHZIIBejAergj9A==
X-Received: by 2002:a17:902:eacc:b0:1d0:8383:741d with SMTP id p12-20020a170902eacc00b001d08383741dmr5847889pld.30.1703864762201;
        Fri, 29 Dec 2023 07:46:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 32/41] python3-ptest: skip test_storlines
Date: Fri, 29 Dec 2023 05:44:46 -1000
Message-Id: <11eab2b5d14efa75fcb0686a9f835f9675883113.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193049

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
 .../recipes-devtools/python/python3_3.11.5.bb |  1 +
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
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 8e023c7dfb..d375de4b19 100644
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
2.34.1


