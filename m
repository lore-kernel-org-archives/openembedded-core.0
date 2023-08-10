Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA00C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:17 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.21280.1691683514349948968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d58KADGC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3490eacf4d5so3839485ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683513; x=1692288313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhb/hXWt9F/S1lGdY4PK9iZYMIzJgVFDN2hxPIV7DrQ=;
        b=d58KADGCtqoVtpODf0fiAtG8Fs5BCai45c/1D3aKyJSsyAQj4FngbIJyZumcQOkfz5
         +NeI2RD6dVMVdza3tM+EWT9w0qGfXPBbWHglp8YqLu+S53MXZ72iueN8SuMR9Y8qor1A
         fBp4Q5dQcvIKE36g6ZLuUxHfWymmG/3E6F3RpC2U24LyhRet4YTlfwy7BghzrgLyOW1j
         dWzCT3flszpWMeg/2Q7jDZ1sz0d1f23IJQJDMkVu3SXntvJT2IaM07BM3dE4jHOgJ5AT
         SG0WfIrayJgHE8XdGAHVv+KP6nnj/oreoVJXTGP4h8q9n/I6nMFKWgURaxp2YRGUWrkr
         MmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683513; x=1692288313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jhb/hXWt9F/S1lGdY4PK9iZYMIzJgVFDN2hxPIV7DrQ=;
        b=BFNCfiCzivYztVGwAW5XfZZ52xE5j5xZwFB10B7pnX2QKp0wHQxsiWwXwclUZYJlls
         dCggw6hvjplQv0mn/d7SWMubS50+2G4v3bQLHQcCUkFYnHq9RAv5r6N6SoI3NQeAa5KZ
         JzaHHVcobwYjWKll9MC+z+Iw53WHz37EC606xKtjR5x0/GhM4LxJ7WY2hArIJ+Y509D6
         h+lHHow2IqjA/yUmniyZxxpEO9W2pf37h+Rp/CX2oGj805lhmesMkdraUgy6qUK8T9Q9
         7Z/4e/174swbxkCu1dsKurlXHbAZc4XYP9w9iT4YEbcZTfzs2ZJNzAYsQpC1+3GwThs3
         rgdQ==
X-Gm-Message-State: AOJu0YwX5BAbQ8ShZiupSOLVaJR5r+R1/ar1gt4MC+BS6f6fyiqn4x4q
	hUbTwcS/tuFo7Gu5rdxB9Gee+W5xTzoAK+YYIP8=
X-Google-Smtp-Source: AGHT+IGRYJc0ewgW7AuLDb23xNHtXLUgQPRjDbhEta97P+IeYj1RqU9IjNv3WA5yzzgZLop8ghiizw==
X-Received: by 2002:a05:6e02:1bed:b0:346:50ce:d602 with SMTP id y13-20020a056e021bed00b0034650ced602mr4031864ilv.1.1691683513243;
        Thu, 10 Aug 2023 09:05:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/37] linux-yocto/6.1: cfg: update ima.cfg to match current meta-integrity
Date: Thu, 10 Aug 2023 06:04:12 -1000
Message-Id: <855b9ed2110d7302fa81bad5d2275fa67b3402fd.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185775

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

    cba89f406c6 features: update ima.cfg to match current meta-integrity

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 554690317dd8b882075e43213082b40fa3271cd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 30fcbd8e86..d4488b360c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "efb2c857761e865cd7947aab42eaa5ba77ef6ee7"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index be27537dbc..4e45e25975 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 5f61c43fed..be194ffdf9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
 SRCREV_machine:qemux86-64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
 SRCREV_machine:qemumips64 ?= "6c6b1170464e1f64f78a45cf7e78d5c678f38f48"
 SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
+SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


