Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5419C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.71681.1724736256092280483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nBIEbtiJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86883231b4so659083266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736254; x=1725341054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yoIt+ao5xhdKma52apw77pTsiX7+jbAZJiWmvZkOKo=;
        b=nBIEbtiJCmVmCuKN021AKBx5XLlGz6n4zQmRQ0RXXlGiMXnlAgWMOYqNXm05O90GGV
         1exUo9Wcp4fm/utIAA2ocSOZCf6mBbhHqrvCUE9rrnYoxWEo5EVucH8ozX6g2yP0rmc3
         14HeYTEz2azNgYaFVmFnlEgwPMhGB8iHUEbM6Q+cz3KjSVnC0IlcgBabn+jx1c8SP13n
         1pcz8RwExeYWNEG4j+ep4m4GAbTKZcqWgMjrMdr8QznLjnUBvpUlIQgN3e+AWKhHwknp
         i5MITfJvOXYMoB7rNbk4loDE7DRwlvCEj54J9hqgBJrSLKMfD1de9eOx1BBb0r98BOub
         IS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736254; x=1725341054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yoIt+ao5xhdKma52apw77pTsiX7+jbAZJiWmvZkOKo=;
        b=nKMN7p6O7ChW2tPPwKQSgGKGBG1mxQAOPKKVzHeYN7DcMLlQgravsnbWFLYtdYqrMZ
         Arq1AYVxSqdkanDavx8MIUd08Z3ejKlYLXkeaAwC+vPXtgfzYjSGZY4a4kY+pjBXN7Mm
         J1Yn0dtiiicRkitST6wQW3zKPBkZ9vb4MY6Xt2OCcO/+9UmMJau9SWAm+w1uTMwjz/HE
         Zt2C1fYdZYY9teIKkW1azPjyX/3RTmgYfgiF2nj6wybJVEBQlTaZzDSrvxew6pazV8dK
         vCA+Pmw3rNZUZAwZd8uoJfN5IGygM01C53vHXTHziRtqqAOD6MXPQQT4qMZRPvqe7WEN
         9YpA==
X-Gm-Message-State: AOJu0Yzz5Ft+gFgqNLuD9MD4qDEz8cn4K/JcmDj9Q2Ep69pylMmdDOVa
	vhy06kWzacaOj9Tc6rO5ZWO0XUKX5iLr3gJ5eyS/vPBU+aARgnX7jdZCNw==
X-Google-Smtp-Source: AGHT+IGsqPsw2nNPBW3Fjs2QLuFx2QUGVb5+fAQwnpu/pdgR3vQqMEOcfc2t7n7aT2lGYIdsNvkzYw==
X-Received: by 2002:a17:907:7e95:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a86a51b24b5mr1064460266b.15.1724736254116;
        Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/34] hicolor-icon-theme: upgrade 0.17 -> 0.18
Date: Tue, 27 Aug 2024 07:23:48 +0200
Message-Id: <20240827052354.1319810-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203804

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py                 | 4 ++--
 ...hicolor-icon-theme_0.17.bb => hicolor-icon-theme_0.18.bb} | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.17.bb => hicolor-icon-theme_0.18.bb} (77%)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 4b6f89d8cb6..423c31e1892 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -173,8 +173,8 @@ class BuildhistoryTests(BuildhistoryBase):
 
         data = load_bh(os.path.join(history_dir, 'hicolor-icon-theme-dev', 'latest'))
         if 'FILELIST' in data:
-            self.assertEqual(data['FILELIST'], '')
-        self.assertEqual(int(data['PKGSIZE']), 0)
+            self.assertEqual(data['FILELIST'], '/usr/share/pkgconfig/default-icon-theme.pc')
+        self.assertGreater(int(data['PKGSIZE']), 0)
 
 class ArchiverTest(OESelftestTestCase):
     def test_arch_work_dir_and_export_source(self):
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
similarity index 77%
rename from meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
rename to meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
index bb6cb000ab3..283264675c9 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
@@ -8,10 +8,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SRC_URI = "https://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "84eec8d6f810240a069c731f1870b474"
-SRC_URI[sha256sum] = "317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8"
+SRC_URI[sha256sum] = "db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7"
 
-inherit allarch autotools
+inherit allarch meson
 
 FILES:${PN} += "${datadir}/icons"
 
-- 
2.39.2


