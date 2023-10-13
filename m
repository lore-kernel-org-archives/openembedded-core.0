Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A805FC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:23 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.51143.1697233996545901906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=txlr/Ekh;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57babef76deso1361151eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233995; x=1697838795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dw5pNiEjvVmits/I/DLIV5NgFigud/AJQ6vHH2JgatE=;
        b=txlr/EkhETz+VNtDjaslIptNKNAuFMw7Ptt8KDP8mB3hzKuUIDSE9jSJwKz9pXqH4K
         Q0mGbNIiENnB33r+JxMUig/6zjDBLY/n/UHY9dLDrI5z8n3sKRaHHTpOnc1E7cLxuFmd
         2SxA752iBTT47vOTxCOYtKBHg6nK0+6hkIRgsQ6Efdx5uOiUXqn/NsRsXkTEmPw41ryH
         puR0DPlG32Gq5f8gCigCyV5Er+FuUs2p+Rc6bW9I/W9kl28Bjm5Pbdommu09ylPqaUZ1
         KxJAmEvz4MlAcCyRjFW6CKDv37NrBkQ/bBSryhros5rrvoSfnTEM+36qjPQhDD9QcW4m
         Qn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233995; x=1697838795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dw5pNiEjvVmits/I/DLIV5NgFigud/AJQ6vHH2JgatE=;
        b=bqjzGL+FJshgpNF5gSsOObktVW2a3/FlZS6exF1fQ7yC8KTLCu7t9xnk67nkaDee9i
         jTOzyYXx7XWkjmMgPTBY9xmQYFLhTgfAOhNF5jVn2Ds3MbtnaUhQRCqbYDq3CG5VtyUa
         XFU41HTYF7mSOpWC4jSZZhi+J0Hd/qOdP37n/4gwPAAFllVpT/e0/7OGAhuyUx/vMeQg
         hTWOwnaK1obh7DwXWNb/haVNG9u/Wcb8lXm++TgCQBOjoDigs2Se+7hpb1uSkQ62DnWC
         zzEf5AEX2iAn0ObByUB/hBq9j1hXO5sJRdy/JZrTxulnRtoSc4toQDrGGD+/ff7dBhhq
         fDXA==
X-Gm-Message-State: AOJu0YwAqqRSlUt0EfnR+UTmW4TX3lcowYPygwvDAhWSRWUqV7n4u3V9
	UUSYs+ltvviuDkzE8P/6opgbr+jklpwpXR7cdl0=
X-Google-Smtp-Source: AGHT+IGQWXcgBzI+9HO6Zb/kg4JxyJ3bzh0mr0OWkvwp0JkYfXvTEm0oTlwsXOFKhbtDiO6OQdMMCA==
X-Received: by 2002:a05:6358:261a:b0:14f:d52:39cb with SMTP id l26-20020a056358261a00b0014f0d5239cbmr33775500rwc.26.1697233995478;
        Fri, 13 Oct 2023 14:53:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/27] gzip: update 1.12 -> 1.13
Date: Fri, 13 Oct 2023 11:52:32 -1000
Message-Id: <8ca6589c1cb37cd0ba446cfd58e5f7f90832b93c.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189085

From: Alexander Kanavin <alex.kanavin@gmail.com>

Stable release update

Drop autoconf-2.73.patch as issue resolved upstream.

License-update: http -> https

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ddf9e053b17913718c780ad4c877d5ddb6ff536)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gzip/{gzip-1.12 => gzip-1.13}/wrong-path-fix.patch      | 0
 meta/recipes-extended/gzip/{gzip_1.12.bb => gzip_1.13.bb}   | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.12 => gzip-1.13}/wrong-path-fix.patch (100%)
 rename meta/recipes-extended/gzip/{gzip_1.12.bb => gzip_1.13.bb} (88%)

diff --git a/meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
similarity index 100%
rename from meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
diff --git a/meta/recipes-extended/gzip/gzip_1.12.bb b/meta/recipes-extended/gzip/gzip_1.13.bb
similarity index 88%
rename from meta/recipes-extended/gzip/gzip_1.12.bb
rename to meta/recipes-extended/gzip/gzip_1.13.bb
index 14de50b230..fd846b30a5 100644
--- a/meta/recipes-extended/gzip/gzip_1.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -6,10 +6,10 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
-          "
+           "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
 
 PROVIDES:append:class-native = " gzip-replacement-native"
@@ -38,4 +38,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[sha256sum] = "5b4fb14d38314e09f2fc8a1c510e7cd540a3ea0e3eb9b0420046b82c3bf41085"
+SRC_URI[sha256sum] = "20fc818aeebae87cdbf209d35141ad9d3cf312b35a5e6be61bfcfbf9eddd212a"
-- 
2.34.1


