Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD827C77B60
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:32 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.72228.1682871974660663664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SeGQbYKr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso1200975a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871986; x=1685463986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XI2qiVstMq/uLeXnE2JTRl0DsbVgaA95H50pkETksw=;
        b=SeGQbYKrT9IZ/uinIVJb9KrwTnaQqxX5lJtkBNYKnVSekMIn7vaaUNqFRy5m+lA/k+
         oL/dhtWK3Zi63oDtQKCLdcWvS41Bs5rg2nXNurxOqD+PADMLZgF8jJISWOegdyyMF2bO
         pqD8foXuY39tzu82xWG3qz2rzBP9wuAXC6CdJBtWmaxHnAijdrwpglOfixCt42TkeYj8
         SBVtcAAoxr+UWbABtij8MP8E69sJuWT8aHniXvkxuZZFFtnApLTQAcuPadzjee+TnINK
         OJfBtsG6zsUKDch0rQ9WAHCDFlUqmFEzpj7LshXuDwCAW6Ql7iqaPJnPkvB7Weh6h5em
         4XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871986; x=1685463986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XI2qiVstMq/uLeXnE2JTRl0DsbVgaA95H50pkETksw=;
        b=Sfp+YJax10Lg8zmaJQPvNlwcmPAm24wMjtezSxV8iVhjCJ6U4Es3m8k9+i6DBD3YzH
         metjHSYsYofbbyfTQ99F4oWKX+nOA6aTgpjHqgrF/P0uQqjA50PtdmOpypYwM/D7NJ4W
         bqQIOLqcMOU7m8uDlW7DA1WGlbntJ0IpFkpimvLb7re7L2i2EERmnWhryCC8qUNuagxu
         K+Al8Q2oNelPrKOPdSzvFsxhMZVSQDv2n2igpzuouwQnId5CrYT+tpRHFE5+Q+jv7b1W
         i2Z24kLCGj1q7uSCcrbhTeGwNojNYs/uQ/I9bApCoOntYN7n4i0I3WB8S2bul1mGtla4
         fIJw==
X-Gm-Message-State: AC+VfDyzm7UnhcfsAnxHbi4zziFaUDDQ7JVZdJRznSRD58vbsuZlOAfB
	GCOjevevA+gj0pe7b4Tv4Xj5oUsw3CnP8BaX2Yo=
X-Google-Smtp-Source: ACHHUZ78/cKJB/6xSN7ctPpLk4jtyAAC/Hzgl1gktEcFOmbO8ncOZkOSwiOcID4F4VvHwBTV0PthfA==
X-Received: by 2002:a17:90a:d3d5:b0:24b:b22d:c78c with SMTP id d21-20020a17090ad3d500b0024bb22dc78cmr11896503pjw.9.1682871986198;
        Sun, 30 Apr 2023 09:26:26 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] populate_sdk_base: add zip options
Date: Sun, 30 Apr 2023 06:26:00 -1000
Message-Id: <b9e0c3ced645cab74b2488a26b8f656a94b2a6f5.1682871869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180581

From: Christoph Lauer <christoph.lauer@xtronic.de>

Add SDK_ZIP_OPTIONS to remove symbolic link creation in zip archive or add options, e.g. for encryption of the zip archive.

(From OE-Core rev: 04b62f9459b401c276255f166d0738b6f902a576)

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 396792f0f7..49fdfaa93d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -51,6 +51,8 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 SDK_ARCHIVE_TYPE ?= "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?= "-9"
 SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?= "-y"
+
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -58,7 +60,7 @@ python () {
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


