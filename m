Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663C0C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3151.1675840922932410177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VnWSRZNM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id q8so12648980wmo.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYxyM6d/l4hfli8ZnYozxMCL9zsJYLDtRH1zyKmveiA=;
        b=VnWSRZNMMe5Zh1oP0vXlwKX5YVNYz+HgWH/mclVb0ymChQN9TKazNLRQjdgJs7twUd
         WyN21alVU/NcPrRXXbj4OGoFS7p7BCGelKE5emAk0z8O5CYoDeT9/ph1ySsWSPcYFVl8
         p6j8MB4NH/EfFlHosBpG4iya+g2sdz54ZAAXvFw6uRz7WoBg/Vsz2225OFcdrZwTLC+Z
         7sB3z3icNdUtvZC6DBI0qEQdQarGs6RvI4NW/RYSzK4HOE3CBjExrVumVIosXnI4XtQO
         3ct2/WeSoYqZj+EZM27v7cJVfwIfioY1tZp7M56Nhft1WKoT9re0Tk2IBWrC6AZzX4TP
         Mtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYxyM6d/l4hfli8ZnYozxMCL9zsJYLDtRH1zyKmveiA=;
        b=31M1GrAl8SMfF0mnQ1wh3ysKNlazddWFInuuNLR872BXe8pYYXA4VCu95wB+YOlOl3
         4Ce2Oh419Klkd5KjEowUKAqHb+G72Z9wMJMiooC+Wb5rykCG0MeGOzvNOTKvJYOE00Mb
         zvdx8hDt6T+UeCt00sA4S7Ka5EyeMYSS6tohzRFxmZMhOSzRKVQvstvqEvCTpDHiKOnb
         K7NLZy2Ldp7nLZXveqvm5uQKON0m0HMuWdku9cOX58eiqpmmwV/YbsxbGqkxrsw+MrdG
         LNj+Bq9n5vn+xiv4ZYfVYC8UtL0NKCwjfK6z4Y8uJqXXbWAA0diED+4SG7G8hyPoyjUL
         9KWg==
X-Gm-Message-State: AO0yUKULby517jYKNIpv/XNYyGQW9vmaaPa3uPrMue8fyeze78zxrLEi
	1ssWLXMMRMSKNsLeTG4lpjCGC6CUJ/M=
X-Google-Smtp-Source: AK7set+a30tkqE2MkkQIn1f/LnnU36N7av5ZxZtMG1C5Kt1bv9Ig5qYlgJRoCqW3ODEbSdvzrr8Jag==
X-Received: by 2002:a05:600c:2e89:b0:3e1:bfc:d16e with SMTP id p9-20020a05600c2e8900b003e10bfcd16emr1259076wmn.39.1675840921457;
        Tue, 07 Feb 2023 23:22:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/52] rng-tools: upgrade 6.15 -> 6.16
Date: Wed,  8 Feb 2023 08:21:15 +0100
Message-Id: <20230208072143.2930292-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176864

Adjust dependencies to match what is optional and what is not.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../rng-tools/{rng-tools_6.15.bb => rng-tools_6.16.bb}     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.15.bb => rng-tools_6.16.bb} (92%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
similarity index 92%
rename from meta/recipes-support/rng-tools/rng-tools_6.15.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.16.bb
index efc08b5e0a..02abe486bb 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -6,14 +6,14 @@ HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "sysfsutils openssl"
+DEPENDS = "sysfsutils openssl libcap"
 
 SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rng-tools.service \
            "
-SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
+SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +27,8 @@ PACKAGECONFIG:libc-musl = "libargp libjitterentropy"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
 PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
-PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
+PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
+PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
 
 INITSCRIPT_NAME = "rng-tools"
 INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
-- 
2.30.2


