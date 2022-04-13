Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A34BC47084
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.1709.1649872701211509383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AKtb4Uk0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w4so3710805wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vmN6DsnlaN3Rcl09r0wcpuwtFKrBdqi/XnIB71UOXRA=;
        b=AKtb4Uk0p+vcJznXbKpv/u5AVKuHkSiarJtbd8r7WvUs2EdUwW2CCexfjAny/SI6GZ
         vOWvcLvQlzMNmqOBkGI/Ghvq6aijsaA6EvLU/jbj9Sua8CURkIMRs6fki2OqI7K8puSs
         A+Yp/z7hcW/tL7dR2KAMw9xee7G+pHBX8Km4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vmN6DsnlaN3Rcl09r0wcpuwtFKrBdqi/XnIB71UOXRA=;
        b=hPzbUBkNRJg1KitbmXaBaTcn4p48PfxxPLTOcH6AjND6t3QfKH9eFlFWi7iL4dmG2i
         A6ViyaQMsU7gQjcR9Xag1gTGXK3cKdTLX9eW7oayvtCxQCdT7ZueqkIpp24sA0A5JdJp
         9376OoTbtWk05YpN+/kEQwPtLMGmne/4DtHwE3ndf8NjOCqTKYLngQQf3daSUeIeA5Om
         grB+HTCWGK0YkzEJTA+ZIFU5spgA2eGEfifzviJQ3AYEyiUUgkvTeZ+V4WLTMFf+8/ot
         y/CvfgoelNc4aKHKA2tltPiJpW3gQwMUBr3AIoB2Rhsapp4VF9mjmnR6VpnjkRh2zh3G
         ToNQ==
X-Gm-Message-State: AOAM530QzqSRRROAjEhTF6/mG9NPM0vsIgwXmmVMAAsbKAW40BDhPOTl
	D2Fzuz9s3Cl+V3MpjE0g62o+BF9HuNx2pA==
X-Google-Smtp-Source: 
 ABdhPJxNPnf92NDB7o7PHh4BQixJ8TbtqvEgKnZCi2IFrQv2I9K4UJ4UyLaO1w0lHDLGRcd0HBbepg==
X-Received: by 2002:a5d:5705:0:b0:207:a299:27e2 with SMTP id
 a5-20020a5d5705000000b00207a29927e2mr58059wrv.59.1649872699077;
        Wed, 13 Apr 2022 10:58:19 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm14770056wrr.67.2022.04.13.10.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:58:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildtools-tarball: Only add cert envvars if certs are
 included
Date: Wed, 13 Apr 2022 18:58:16 +0100
Message-Id: <20220413175817.2187595-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164353

Users may or may not include the certificates in buildtools. Only set the
appropriate variables if they're present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index f9f36e68c4b..6b59e4934d5 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -69,8 +69,10 @@ create_sdk_files:append () {
 	touch $script
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
+		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	fi
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
-- 
2.32.0


