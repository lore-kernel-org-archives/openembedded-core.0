Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9268EC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:16 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.51591.1682788875183762113
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e/Jb4Y3n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2472740a0dbso1025918a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788874; x=1685380874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uf1EaT6ZO2ote1VAOb4orRmQeuRByXTbkCaWCMjeyk=;
        b=e/Jb4Y3nIT8VHRp9sNGq56FiuaEPR6SxCxavLvhWFoSsHO/7QnAOef16mnfIBIKSpS
         jQKm8HkP09FbAkYMf6nyV5a3tBu51QU+HZt4K+JTjAVAs5BEoNaZQBTaQgneU8ClZXTT
         JXKDoSv+mKnm8pL4CUptzl1iOLzCGgFTfs4pnzprNz43kCUk+8l527moUouPVz7kyhLg
         3/dmkm38jffR5vEp5lVlR3GMMhYgDi+AupDdKDHCpPVz81mq2HoFnt45tohhlVb5welc
         bEv5fF0uPXUbdudab/lHfCbHEUnRC2iMHwzw0KLr2nzK/UMve8v+sGJaqZYkl1XMRdmH
         KzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788874; x=1685380874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uf1EaT6ZO2ote1VAOb4orRmQeuRByXTbkCaWCMjeyk=;
        b=RYq6IxnRcnDeXE2XhvAUsH0C2CDNlWH3WIktA7SAw9DemxXZwzXFpra63mS/KV7ukQ
         x5ei8I6xP4TJFztJfHvPWSaLUYsxyzPJYvfYecShSsAKtPaf1yORlXDOBFhWCOluoPf9
         VfjIQnq65kF8Fy8uExG2GllyeU/IRRdb4xXKCEIjz/z+5BmgK1gZtv++frmv3yU1K4Ga
         CiW3Xq26T6inGkqdye8MlCmKA/47UHg7afhYCwrnMFwdEExwSnR8g3b5P21E1tMh+yb9
         Ie15d64vb/tvyIqnWgPEL0aGLTq9oeKWgITmbbxZujU9AwHvrKUrnK4Pp1JfZlJxuKln
         lMqQ==
X-Gm-Message-State: AC+VfDzXLiFC48jZoz5PA9z16+JqLvwCIHzpFK/k2gceiyEp9tDHanUm
	pK0uBtBD3ulbdjwy+VJbHC5MXtLk6EsHvl0wxfM=
X-Google-Smtp-Source: ACHHUZ6bqwt1GY4oriaCykyLH4Sf/x5wdIooUU03yqjzQrC8HNMeORptN5pC6/SR7DIezpTI7asbww==
X-Received: by 2002:a17:902:ef91:b0:1a6:81bd:c4d9 with SMTP id iz17-20020a170902ef9100b001a681bdc4d9mr7440008plb.39.1682788874270;
        Sat, 29 Apr 2023 10:21:14 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] populate_sdk_base: add zip options
Date: Sat, 29 Apr 2023 07:20:32 -1000
Message-Id: <4f5bf144bfe4f34adfc22d86783d6ce29e9f6e15.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180555

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
index 16f929bf59..fb00460172 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -53,6 +53,8 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 SDK_ARCHIVE_TYPE ?= "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?= "-9"
 SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?= "-y"
+
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -60,7 +62,7 @@ python () {
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


