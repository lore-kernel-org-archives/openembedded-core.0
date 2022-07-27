Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3CEC19F28
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.14400.1658882478851420184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FE5NDFjl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 x24-20020a17090ab01800b001f21556cf48so548640pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eBC89MeRD0K/rwXoFG2Dt+WjV12I7ZP6O3BRxgHALTI=;
        b=FE5NDFjl8/nsYzI7jNX75rw4S+azCysfkdO0m5azqDj2BRah4qTt4kbOgnC0qYGrNA
         U5uZRxFbzK5zYJB+E8UVK1VxiFLPLAuKbEAgex/GwrkAEiUv8HnkLwujMYLIbSLVv+a6
         CopcJvkF6pTZEjWJ5Z+vhO/dcFR08dczGjW3H/7LBAjFofWaJjw66mP+yrzoOKj6RoxX
         I2tzYJe8OHOhb2cNJrvHiBKIK49BXRxLpuQXT6B4DeIyZsxLTBk3K4+le/qXyovcB5V7
         0Bn6g9U0wgaqEBxxOCBnUI79UpKZvmeCCHCvAhNzL33BIQteFttyWDBdwzD/I501oMc7
         EhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eBC89MeRD0K/rwXoFG2Dt+WjV12I7ZP6O3BRxgHALTI=;
        b=MMpa2ZFrI4lGXiUXUnZg2yoW4cOmoM4EtKYx6OnXIAfFVsigQrP07nXiXCVvQQ3oIy
         SKwwMtGLhMEZZdbb7qlc1LPqhRj8xwjrRk6qnaOt8yDXexi7hcp9t0JnZ7apMhgTuCqt
         qkjhgIKeMeU9yl5CkZL5nyeFG+u8yGCmKeSOs+AFIk/u5ezoyTuqMkeOSWebttT3bdj2
         AnxffFXRVl6zODr62AdRetC4YQ+00yXI4IXYgIG2pKF5ZGMp1y9SGT+TfUbhxG5Fhuqr
         XbCMB8vOKOnfyN+CTPEneVi6wt0P1/rsd+f5HYqx5+VmqY7rGke5ZkLOqXTR4aQRy7Cq
         2Tow==
X-Gm-Message-State: AJIora8L6sqIYfOs38+E3E1KxrT/Zxw6srSeTGkqZh5THsLm0yIT7bnp
	RcM04/bKZNxNiAnC6qgZuDCPrVTmcJlPdkWc
X-Google-Smtp-Source: 
 AGRyM1vHEypWPaSdECQckPjlSHK2eelhfdsKrDqxMrW9sdDCYL1YoxYUlJa3XBxIIQ+MCjtuJucB/A==
X-Received: by 2002:a17:90a:9406:b0:1f1:a0c0:75d4 with SMTP id
 r6-20020a17090a940600b001f1a0c075d4mr1680944pjo.198.1658882512645;
        Tue, 26 Jul 2022 17:41:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] gcc-runtime: Pass -nostartfiles when
 building dummy libstdc++.so
Date: Tue, 26 Jul 2022 14:40:46 -1000
Message-Id: 
 <2bc86c029fb82ae572f6a89407ccfe332972568c.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168538

From: Khem Raj <raj.khem@gmail.com>

This is a dummy shared object therefore reduce dependencies further by
not requiring the C startup files, we wont use this shared library for
anything useful anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c85b5888d4..8074bf1025 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,8 +68,7 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	touch ${WORKDIR}/dummylib/dummylib.c
-	${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
+	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.25.1


