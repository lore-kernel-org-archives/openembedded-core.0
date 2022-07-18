Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D15C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.28274.1658155870106823018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TxFqrRf4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 n4-20020a17090a73c400b001f1e87432c2so131306pjk.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KxhoLUd1N/Pey4KDwLBufK5c1ZnIqrch8OD8tWvNvew=;
        b=TxFqrRf4/1wFWS0UajGvLZY2YEoh7ylB/39qzcnZcuXB3ZBJRbdqgBVBl8GQVse1jT
         wh9SGN9UAWKJ2jPBHw1AlDpA/5ug6sLVTjwp8x9/fR8003HOg3UsLX75XT+P9bAzcKvh
         ESxeyagA0xIr679DYF9wSSDY4M4T53555yhQFGpdbEnU8kOP4yWSRE2px7TF7bIL7zHJ
         wI9CA6Ad6xCarOW1+QXIOAZFek4MrM8FabA6xEMcGnGQ2eRfAutihaq30R/SiGbVz3kh
         Ppv36/VQSPCKOeldJ9sIcuXEMburzrToizrfMchbED5ztBANLhCzaB3TxfGSsv1cKUgi
         BP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxhoLUd1N/Pey4KDwLBufK5c1ZnIqrch8OD8tWvNvew=;
        b=KAjFUvoii65JrJRNOZ8FNTBjkZ9B2wWvSmUbCwe+Nyx9FqAqsvos3IqT0421as+J7N
         U2eOTykTYNypFgR2ta79l9UbpUp+rzkmBUsoHqWhwGxLE/6/AWkH48++cbu25s2P43ob
         I1c4FDYMHRy3lwT14BD5J0CXE7puaLoWmZYYPoGabR8VD2OottakKsVBLgw5vh9b7xZm
         OfCHYX/CBFIZNIm2GWJpEX0ZeqsPvfO1uQaylPGXpOO+Fex2aKevOULFiDaeNFgAqFoJ
         3INb5K3hlhqPVVsWNiEkPm48BeGvhXoCJRo6s+B5UTEXW61NJZ/YO8UaEPqyV2Zoth5n
         jnIg==
X-Gm-Message-State: AJIora9RmB8thlMmrO3VpxBKUNhR6HJBAEW8re9a/T/qECQIpmKoGRgv
	/v1783NRftP6DWkktk7qAKllajM3xXkJ9E8z
X-Google-Smtp-Source: 
 AGRyM1uC/+BfyJ7/UWfuPy6PlSuUa1GpGswbWMuaj9amzODjOPCC4XLg2tia9igKFqyqzGvCLqK+MA==
X-Received: by 2002:a17:90b:1d8f:b0:1f0:270a:b556 with SMTP id
 pf15-20020a17090b1d8f00b001f0270ab556mr33476055pjb.192.1658155869070;
        Mon, 18 Jul 2022 07:51:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.51.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:51:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/35] cargo_common.bbclass: enable bitbake
 vendoring for externalsrc
Date: Mon, 18 Jul 2022 04:48:58 -1000
Message-Id: 
 <9b2f7eb0e2108392a849dff663767f1f32552241.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168233

From: Chanho Park <chanho61.park@samsung.com>

To support crate:// fetcher on externalsrc, we need to remove "-z
${EXTERNALSRC} check of bitbake vendoring. It is possible to disable
vendoring by CARGO_DISABLE_BITBAKE_VENDORING = "1" if externalsrc-ed
project does not want to enablt it.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Pastrick <ripastri@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 90fad75415..39f32829fd 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -45,7 +45,7 @@ cargo_common_do_configure () {
 	directory = "${CARGO_VENDORING_DIRECTORY}"
 	EOF
 
-	if [ -z "${EXTERNALSRC}" ] && [ ${CARGO_DISABLE_BITBAKE_VENDORING} = "0" ]; then
+	if [ ${CARGO_DISABLE_BITBAKE_VENDORING} = "0" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		[source.crates-io]
-- 
2.25.1


