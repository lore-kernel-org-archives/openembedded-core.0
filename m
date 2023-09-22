Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BC1E71098
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.16348.1695367485772920722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzFgobBh;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae75ece209so37706166b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367484; x=1695972284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p80yVn63C2gBzaBM3vVP7/o3FqqKkmkAr3HIGXd+Goo=;
        b=XzFgobBh+F98qyaNTVZM0MXKvStJV9VGumT6PU82z00cTejroV4jk+Ajb2tcbjc83q
         AAIauQZ8FXCq9hmq5fcDbonH5hzGRdBwKiqyqXnRHA2VT0A7tjO2rJRDwIS6lJt56qgg
         +6IEHTwf77Q5v9q22pSNB6Bs6yZ2a7/Hp/VNIMqLqaCZzd3obo5/kJyKFy+3juPuA6M7
         Qc6G4KrdluhTYV8uP74PdY+YyCXgOTXijXHZ6ITWx+kmia8g92/jLHDEBJJEt2XlB03F
         +OcKfU7Ll73pSvrMOhb/g1cxDMTkHl/unxBSpWqCqDmC9oClKkXp/BQqzrm9nsrMt4W4
         Vdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367484; x=1695972284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p80yVn63C2gBzaBM3vVP7/o3FqqKkmkAr3HIGXd+Goo=;
        b=rKDF81qEZ9Y8/Usmr8qdDH/r/NtY4m61jEzzNbIn0CV88ZteK3h8QviWKLpUS6AeSt
         NF+gQKya13TIsjP2BRsqZhBa1IfgjWaoWedx28xar7P3g+eU/hPJX95/Ds4VtsJtd87X
         rZq93p1NQQYfrQzV1KAKTBXT0sJUR2kHm0GLt/wCEhnUSv73fXGKdEKh8+q2/qS37lNF
         d02YRrwooskX0O2ubrOr0pFn5kl5G00T8U7Qz+00d3pb1uZOvGYE4JuYjV/LgIifJw+j
         +4yMoZBC4kMeQgLLyKNW8+ni88eP7BMlPuKK0MlOAa9seCaudY3hAQQ8BZZGLfrkpJ7g
         wJ1A==
X-Gm-Message-State: AOJu0YxlAP10xH3/D1NYVYpDTfIjAhKRrajJ96AhxJza7u8qEY6+YazM
	1Kf2yKCIMPY1EMlllas/bvxTZz1NNSw=
X-Google-Smtp-Source: AGHT+IGkO1+6K6iHQNV9P0L7cpvPbwomQBWxjARmBDDs4lEnLTbi6sgKdrVb3VfATaNHqBJwMZymYw==
X-Received: by 2002:a17:907:75ca:b0:9ae:6ff4:9f0e with SMTP id jl10-20020a17090775ca00b009ae6ff49f0emr2058640ejc.13.1695367484252;
        Fri, 22 Sep 2023 00:24:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/40] font-util: upgrade 1.4.0 -> 1.4.1
Date: Fri, 22 Sep 2023 09:24:06 +0200
Message-Id: <20230922072431.1481743-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188058

License-update: clarify license for unicode items:
https://gitlab.freedesktop.org/xorg/font/util/-/merge_requests/7

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{font-util_1.4.0.bb => font-util_1.4.1.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.4.0.bb => font-util_1.4.1.bb} (60%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
similarity index 60%
rename from meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
index db82104afe9..0c65927fb4e 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "X.Org font package creation/installation utilities"
 
 require xorg-font-common.inc
 
-#Unicode is MIT
-LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
+LICENSE = "Unicode-TOU & BSD-4-Clause & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2a9e705c00e463c8d294f90486852e06 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
-                    file://map-ISO8859-1;beginline=9;endline=23;md5=1cecb984063248f29ffe5c46f5c04f34"
+                    file://map-ISO8859-1;beginline=1;endline=4;md5=9c9c1d525d29c0e82b5c99edbb8e71c1 \
+                    "
 
 DEPENDS = "encodings util-macros"
 DEPENDS:class-native = "util-macros-native"
@@ -16,7 +16,7 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d"
+SRC_URI[sha256sum] = "5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
 
-- 
2.30.2


