Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79A8E77179
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 18:17:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18643.1733422659999903423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 10:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Upt0018i;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-432d86a3085so8740075e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733422658; x=1734027458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSH+wgrWMM9yEn8RPm9S2bPY+hAZCbMX/EeaCgLYvKU=;
        b=Upt0018iXz89yd836W6I8kYnG2B1aAh/qZjwxJvrSuAMG8e2G4xbZX8jN/eDV/W6H/
         YAhgRKpmdLSKdHrtXVlNc1JYI6dcxiEkPfWfKJbMddocDx8tgxe1uro6/TgSjMhnzyeX
         Iz4wzfuOOeAMZcCcyncFm/Dcsudnv/eagV/zsROE7aS6Rx6kSUdZskcUJigAgOelBXZ5
         UMR8XlZvj3ql724w6uUdzM2GUn2hMdg9sK791PJw8YMQaYKnWw8oVBd7iaMTz71xDvmI
         DRHRdWpSXQkLANVv3FrcKiPiiUoyLrIzSNp930AdE8lfwf0BGruLuP57renObeQ1HHXT
         Fj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733422658; x=1734027458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSH+wgrWMM9yEn8RPm9S2bPY+hAZCbMX/EeaCgLYvKU=;
        b=KdGlT0HBMp7LyuXhIl+T0fAE5MljNRKVfxuhBGNAwYr5TKgdO2DnpMVLG0GKYu/RzU
         AL/uWc48rx5br+fooH50yOVgCyGkwdhlwZnKTWRqCrCOFVdLNP15AkyX005oWUmOF8/Z
         MldKhIxKJg0e96nX8vkGEpOB3Q3wkUzK0iv01RJju16Ih2FFcLO2tbsPrSGJtinug6CX
         lUTA6+/6TUaNBDbQQBIn/5J5Bgo/Tcd+BNndPYNzqD0JFs7krk27PbLKmup9wNVba7cv
         5LZO6yTR6YHQzY32skTnXGlLTv8k2N5s1Y1qJSizmrCBPVz6gwDziFiIQ6LuVd/wkCYQ
         dExQ==
X-Gm-Message-State: AOJu0Yz26Q3lrULYc2uPXZuCIik2VymiV+6FLUWuw+XpqOCJKl/aiwB9
	efmD5DV61vmWK6mi2ZPMG0jby/Ov6Ik+a4h6fiyOLJ67F7iHC0/e2ZHbVA==
X-Gm-Gg: ASbGncvs8rp+7kgCQ4IlpLqS+MACnpO47DXn/nfgWB0W9dCpYfOZ6OGhJIdX3H37xXv
	AkXQagJ86v668a0SG4adNikGf6n56sgqMwEAJAMDdCiurbCgTLkQU2TNr57Ywg4noUJwLuQQgd1
	yscbup6+0EO9QbwgchdroSwqhWmZq9UnxHJk1rbjM+9SoyqIYntmawusX8xEx6c7qu57DbiaXog
	7zMUwpa+REnDivD9pzNtmoEt6NYBXM73Whuppv7+69/Ve/hhJdnnH711uTcp35i9N0czmFVYCBk
	6DcJ6x6tnX8=
X-Google-Smtp-Source: AGHT+IGK71GcAgEHJNw3Yq7SKeuEguNIWO4CI1KeaJxBhveFWSs+rP+6+5JOVUI22LvXLYC5Ahzh8w==
X-Received: by 2002:a05:600c:3555:b0:434:a6af:d333 with SMTP id 5b1f17b1804b1-434ddeaf9aemr2981615e9.16.1733422658112;
        Thu, 05 Dec 2024 10:17:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190964fsm2522898f8f.65.2024.12.05.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:17:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] libtool: restore recipe-specific application of 0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch
Date: Thu,  5 Dec 2024 19:17:34 +0100
Message-Id: <20241205181734.1767363-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205181734.1767363-1-alex.kanavin@gmail.com>
References: <20241205181734.1767363-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 18:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208389

From: Alexander Kanavin <alex@linutronix.de>

It was pointed out that it
"potentially has side effects for native builds. It breaks the ability
to run files in the .libs directory which in the cross case we don't
care about but some natives did once used to do that. The risk is they
find host things instead."

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/libtool/libtool-2.5.4.inc          | 1 -
 meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb     | 1 +
 meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb | 2 ++
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
index 86ce446916a..6b533a0d00e 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
@@ -16,7 +16,6 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0005-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0006-libtool-Fix-tools-path-issues.patch \
            file://0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch \
-           file://0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch \
           "
 
 SRC_URI[sha256sum] = "da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
index 32d03c2f8ac..33ea706adbe 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
@@ -1,6 +1,7 @@
 require libtool-${PV}.inc
 
 PACKAGES = ""
+SRC_URI += "file://0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch"
 
 datadir = "${STAGING_DIR_TARGET}${target_datadir}"
 
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
index 3669c8ba2ea..2e39a1e1d76 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
@@ -3,6 +3,8 @@ require remove-buildpaths.inc
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
+SRC_URI += "file://0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch"
+
 inherit nativesdk
 
 S = "${WORKDIR}/libtool-${PV}"
-- 
2.39.5


