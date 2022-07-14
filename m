Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93B7C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 09:15:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5543.1657790127856516128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IsO8VflE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a5so1661516wrx.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3N2mVRueBLEUwvADC0WJXelWRDHnYmPsYl7pGCq9wo=;
        b=IsO8VflEoLuzEq7T0+ABxRaF2zzhq9RdOc3hZkoYrTlyd3WD3tgmNP6Tu6UrXwK8hO
         N4MRkyw96lk7Dio+Pt+iMxuuBLWBddi2xMC1aENKtqQc3EfjQkqtMluNzgWwLWR7IX6x
         SzZ41G/dZ31IDf53rLMCUsPERwJEn8qiMVr1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3N2mVRueBLEUwvADC0WJXelWRDHnYmPsYl7pGCq9wo=;
        b=t1qnHoAGdv7uLYeatATtmoIRxYFnKesAEd6nOOmpc8doC17AnRBdU0gWH08m0fX147
         f3f+P79QzL4ABIoEnkEUygG8GA0TGLt4pgnmsPe8KSO0dXyC1rUj8ACNaECxOIbVpDg6
         Oe6bhCWaXq2hRpz9dGB79pyUNKUkOi2DftnoEb0Ae6n2at7UK/mVkNbSZBRuK8I7gYB6
         gbi7x6Ynx3g+jD+Hjoq+yicyOCxTzN3STIFPUkdFaF5Q+2KVQ6M0TLljgEj57Cw0AB3z
         4Qp0ORxzqHGk8OWnwi920+eRk2dojOuMT7XzYvEdnkfwJmNNzrZyuloIFMpbNBRuRvJf
         /BuQ==
X-Gm-Message-State: AJIora9KMm3T4/1lIF9BGM+cRl8QGrds1JSXwNK9+nep30oqyRHG7o5J
	rfov4W0Gxhx122mDev95CCNHKASnPA9jNw==
X-Google-Smtp-Source: 
 AGRyM1uydKwn4dNTZsX8EK1Ba+VPgxmvhwdjuIYWYKstChMDNURZo58iJ8N+iU8qojpPuI2RYwIhZQ==
X-Received: by 2002:adf:ee89:0:b0:21d:681b:47cf with SMTP id
 b9-20020adfee89000000b0021d681b47cfmr7192987wro.394.1657790125690;
        Thu, 14 Jul 2022 02:15:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 k6-20020adfd846000000b0021d8b1656dfsm904263wrl.93.2022.07.14.02.15.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:15:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-runtime: Fix build when using gold
Date: Thu, 14 Jul 2022 10:15:24 +0100
Message-Id: <20220714091524.475739-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 09:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168028

If gold is enabled as the default linker, it errors trying to link
to our dummy library empty file and this turns off things which should
be present in libstdc++.

For example, _GLIBCXX_HAVE_S_ISREG isn't defined and HAVE_S_ISREG in
libstdc++-v3/config.h isn't set properly.

Instead of just creating an empty file, create an empty elf binary
instead which addresses the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c39a0caf8a7..7e920df2d34 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	touch ${WORKDIR}/dummylib/libstdc++.so
+	touch ${WORKDIR}/dummylib/dummylib.c
+	${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.34.1


