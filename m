Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312E0EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 19:48:22 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.6686.1688068096598327489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 12:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=smOsvvCe;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76714caf466so96432885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 12:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688068095; x=1690660095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r9QrLaAbRu0KQ7fsE0XRA1ZnLB3XcUjfBY1lBTRc5Jo=;
        b=smOsvvCeilfDxfvbTJZSVUPMi2ytLjK9/Lbn6cNdQyINRNomlazte5wlaS5v3YO7Gb
         7Gm39DMC4uOdiJ24sKmAhfwYxAkg+8om3n5BRMi/KHG8Z+ciezWPQBAcxy+4L8Qb4DJp
         OtIPfCbzQqC6Wv5QBzXOU8xKg4BaAYJYZISVtny2tR/qtK/KNz7GgNbGAPn0kdjIOAs2
         xYMDrNngYkCpxsLd3XTBVp4u4a7abUlnJJxogeSs1U1pRjjvbXzNumF1pO6ZULWrVv3h
         bM4HuOrci1G/eTObqy11mWtCOquRvqQ+MxeRVUbPoMIUG5TPaPySVgGfFcmKo+WzSes5
         aOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688068095; x=1690660095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9QrLaAbRu0KQ7fsE0XRA1ZnLB3XcUjfBY1lBTRc5Jo=;
        b=WazSIKZ4PpeIl8VLgMBQWwC/yHmy1s5iVuDN0Is+Rl1glCn/0G3aWryJq5dvOREfPA
         ckf0xe3ewab2LlE5FngnfTiN6xQQM5VAqCDF7/78wD3c/C/fvKyLrNe1ypE4svvxcYso
         jhxJqZcOqkSYMCXfsKGYC+zb3MfcQa5UM+YoLybHAfiD/RWJZmBXfOpFlP/OGwyyxpFV
         3aF9pT1vIzHMIgmFhOXEj8dFTbLXAfVnweyadgx+5U6f1dk5yJziEawVZto7Q0fjR1/7
         KFw1x+QCpxiUeX/i3sx6oXH95NhblpotON8Z2sKoy1zCi8D5AJ5IZigTMIH+IdPP9xAH
         N6GQ==
X-Gm-Message-State: ABy/qLbig8s/QJcopboPxVcxkjEajds04QcWtD82NDWtwNsMLs0c/wBv
	majcKqUvqz0dSXS0x2QibLb/AlpN0ilJGRFBHnU=
X-Google-Smtp-Source: APBJJlG8AJiosoRQP5ksAh1hTDY4wKzo441UNSBtfF2t+w1fquiO71w69M/Fgu7/zuMAIOI5WZTZuA==
X-Received: by 2002:a05:620a:bc2:b0:767:1772:4f4b with SMTP id s2-20020a05620a0bc200b0076717724f4bmr261309qki.68.1688068095174;
        Thu, 29 Jun 2023 12:48:15 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx13-20020a05620a51cd00b007339c5114a9sm3502385qkb.103.2023.06.29.12.48.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:48:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: add cgitb, zipapp ptest dependencies
Date: Thu, 29 Jun 2023 15:48:13 -0400
Message-ID: <20230629194813.1171680-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183638

Without these, test_cgitb and test_zipapp both fail when running the
python3 ptests. Since cgitb is deprecated, I have only added it to
${PN}-ptest's RDEPENDS specifically, but zipapp is more current and
therefore I've put it in the ${PN}-misc list instead.

Also reorder the ${PN}-misc list to be alphabetical.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3_3.11.4.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 6b074c48cf..cdd8bd0ab7 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -406,13 +406,14 @@ INSANE_SKIP:${PN}-ptest = "dev-deps"
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS:${PN}-misc += "\
+  ${PN}-audio \
+  ${PN}-codecs \
   ${PN}-core \
   ${PN}-email \
-  ${PN}-codecs \
-  ${PN}-pydoc \
-  ${PN}-pickle \
-  ${PN}-audio \
   ${PN}-numbers \
+  ${PN}-pickle \
+  ${PN}-pydoc \
+  ${PN}-zipapp \
 "
 RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
@@ -426,7 +427,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata coreutils sed"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb unzip bzip2 libgcc tzdata coreutils sed"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-- 
2.41.0


