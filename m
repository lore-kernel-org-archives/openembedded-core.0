Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E99BC77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:18 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.80368.1682431096318760161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eoc9NxFq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b46186c03so6989955b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431095; x=1685023095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irZdtiz7s0X0lvvoAt9Hc2AWaoPGjnF3jpCpsHJrNF4=;
        b=eoc9NxFqGJGN4vhi2sev3WMCcX7LLtVFerQ/Ns03x9RFnqwKRTwQ4BcZ+7c4G2iJkq
         T7luKAj7lH55OrcQKhxO/wDIZuLnkHKJ/cP0cms8JPbky42UnLaVE3WhoJaiAPQbSsM+
         +sXehdT6sWO353u7mY+vUIQXEwoePL91TZCu44tOYetET/BdzabkuewmyclvhvqSaUGz
         2eTrHgo/MT6MWEXBjZfLH4UHl2I6J/WOshpP7pX8iwCe+Rkz2jCo/5xuFsGJudqwU17L
         S4kWofT7HKE2sJ1zxh+U75cDbv1B5bAY/WCU9YNW/3siokM/7J57DSPNUxCcmmP/lKCm
         oe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431095; x=1685023095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irZdtiz7s0X0lvvoAt9Hc2AWaoPGjnF3jpCpsHJrNF4=;
        b=cJVEMv6NVoWopb20fKIVQPxVDtRzKhKObGdwhVUwOlsTfElGJ+ydSFljOYpyWkUSdY
         MGNg4UJ1iMlzj4/MhbkvTSB2KmfejjTAPgxoGZtBtGb9E3++0J3RgorCZ/9Zsuom2/2X
         dRqkULKS0ziGWgoztCIAbHH6enF0+EqLpnYL2Ljk5sORQbtsXV7v+dgX4yI68U5ujECH
         HcgmkTa1iuXeUyLDbo8Xj0O/V7QQAA2Ju4h02NUjbGfaBve9YHhEi9Uljr1+SgI6zFpg
         9i+gq9/ZlvjJPsnse9GSn9CGYIwbc0ohAplUV+EPNcuNJ0QHqH+Zfx1JJkRk0xEfxjsr
         xr9w==
X-Gm-Message-State: AAQBX9dLnIIRbKyGozd1CQ89hYJ02ycHdi5tjcerI+bjHG6SAwOUMZlW
	kl3THWEAw9OKi0oOfDoD3A1Ust7NOp+dTzS+mv4=
X-Google-Smtp-Source: AKy350ZXz1dVlq9hWE/f/PWi0bPvyBQMoOoZ4H+7qoFn1n2FaYl3ro6wjALKSj1U7CWVV7bg9DYCzA==
X-Received: by 2002:a05:6a20:938b:b0:f4:d4a8:9c82 with SMTP id x11-20020a056a20938b00b000f4d4a89c82mr9750949pzh.47.1682431095430;
        Tue, 25 Apr 2023 06:58:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/10] populate_sdk_base: add zip options
Date: Tue, 25 Apr 2023 03:57:42 -1000
Message-Id: <4632b0d43fa383bcf404a36c5dd5c58dc89f6295.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180386

From: Christoph Lauer <christoph.lauer@xtronic.de>

Add SDK_ZIP_OPTIONS to remove symbolic link creation in zip archive or add options, e.g. for encryption of the zip archive.

(From OE-Core rev: 04b62f9459b401c276255f166d0738b6f902a576)

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 70b3f1974e..6286d64233 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -74,6 +74,8 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 SDK_ARCHIVE_TYPE ?= "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?= "-9"
 SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?= "-y"
+
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -81,7 +83,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buildpath
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
-- 
2.34.1


