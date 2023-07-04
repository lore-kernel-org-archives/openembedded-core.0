Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99817EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:31:39 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.61551.1688484698756285473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ak7qn4GJ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4009ea1597bso44953411cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688484697; x=1691076697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMseFkm+75idzyVSl8duUSD9W9mVwRYfCMPwa0xtqR0=;
        b=Ak7qn4GJuswVjsHGck19QWicPXFtT2/6xEOcdZBWPvQU/Xl+7c07BAXepB/tAqIZCb
         Q3L8dorc3pq/zAJyjDh11TRHAwLHjuL5a44K/H9jLVPMOr31gCNw12oyEhu6vnf4/bVY
         tm29vKUQ2uwlwGhGCE4zChlZxGQjz2z2LhxQevsB36IvsIjBajByEBspW/v4d/GfXfYp
         qFJqSZieGqpbSODnuYp64Vu0MQhJX4q8oLwBe1kvVP3Cb5WLzpZ1BetDY+HSlvHHrsgf
         34tIhE5zgnNOhZmpQB68ehcMDnJmNYUiTmL+5bVBKtCVjs9Y9MfK4iHFLj3LfkPWU3CM
         4FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484697; x=1691076697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMseFkm+75idzyVSl8duUSD9W9mVwRYfCMPwa0xtqR0=;
        b=ZsJcylsf3gx0HJg/9B2TsZ0dnKiqwU2TJcBC7ATlVIkG1OCNeIv9ETqXAsMg2m3Mui
         SfqevayU262cHeTpKVg/wphIQLIaPE6LoXj0c7EwsrZN4G7i1RhlMLSCq8JsLx1OXOxO
         zOzg/WvjMjY2jeHWOerAcc7bVOpTrmFnqwnjzk1f6D370PLZ1Y3EaFzwFVdE6ZawFfE1
         yfHawBIHqpulIRZzajHpTfLUV40/jppgPeTheNGms2VprbwMf0LZVNNBIDfGm1ITGaJ6
         ptD9MAXkQEnipRThF/FXRjAThl4kzm4OGjkAp3SF+HDkCubrzLxTX1PrDcs3f9tgF+lm
         Hh0g==
X-Gm-Message-State: AC+VfDxjIoFAVClo6V05Gb29VcEQqBaukD7hBGTlOHP4orUAc3vqdITI
	Q368F4nOSg8wu9EvPx3uji/6BpE4ROFGYRff2s8=
X-Google-Smtp-Source: ACHHUZ41L78iRT+9hKdCCafFvGLuznuyTFTzOp7rP96s+FDh6nTRy2g4BMcp/uA1o/TWKuEdCDS1dQ==
X-Received: by 2002:a05:622a:594:b0:403:3bc1:54f0 with SMTP id c20-20020a05622a059400b004033bc154f0mr14787595qtb.5.1688484697237;
        Tue, 04 Jul 2023 08:31:37 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id v10-20020a05622a188a00b003f9e58afea6sm10935132qtc.12.2023.07.04.08.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:31:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3: add cgitb, zipapp ptest dependencies
Date: Tue,  4 Jul 2023 11:31:35 -0400
Message-ID: <20230704153135.2263176-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183866

Without these, test_cgitb and test_zipapp both fail when running the
python3 ptests.

Also reorder the ${PN}-misc list to be alphabetical.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 moves ${PN}-zipapp into the ptest RDEPENDS list.

 meta/recipes-devtools/python/python3_3.11.4.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 6b074c48cf..86ecc4e297 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -406,13 +406,13 @@ INSANE_SKIP:${PN}-ptest = "dev-deps"
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
 "
 RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
@@ -426,7 +426,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata coreutils sed"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-- 
2.41.0


