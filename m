Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446ACC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 03:00:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.36443.1658199627936045172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 20:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhLnBxuS;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id k19so10746030pll.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 20:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVryLeKNy9Y0ZwpMmSTEf5sT2LZglc9FkyT2AepvEAI=;
        b=qhLnBxuSu3kxxrCNG0c1XnAbr2l4w5ju7nevxLQiwp0zerqPM1FegrNNPQz7yIM0ir
         qoDPWJcr9ftxVWXaRHitPiny3WD/4aKii/QgINjHidqW4PAcYe4YQK4DvyTKtBMTkfl1
         x7CqLWc0eAv7qCN6uaFeXCzfCFXQa6em8nfFrQA2zPaRtA9wE7rl590Eu52QjuF4yjBK
         sFzYUwNZUm9zFScYpDDg9khJMC70i1XdCp7EdA/XqVLky9dgHgvFMvWP+XkvLcCyO9n2
         pRUh0Yf2th7QP+K/2Zm5KxSv7XzyN67vhHq1IP1ikrLg+huXn/ptQ6eyquY/SzMbg+v/
         +pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVryLeKNy9Y0ZwpMmSTEf5sT2LZglc9FkyT2AepvEAI=;
        b=3l0t7g5kjGTmJVbBduaYJ9Pq12hL+KVwSe4bxV3r4Y1DS0U3kbyBDy04/nXGz/wVDh
         vAXiYLMqqOddRMBHrOhxwt56psIlgJ2vGqehf9WPKxUPCiF1bkuJSVOWkvCdtck+GS2O
         YzyduYAlJV6cdZQz1ZrkxPAcFWgd0Jwc/4PxZGRt3exPzg6rOn7xSmr3MH7DakTWU26z
         2UwLmKg61kc6QZPAuMmQjbGuJawRzA44FchahG0Px+rW9fHUxkQ3JoIXpNFEQCwAXs59
         Cf9Kn8Zz+v2+eX2+B7l8j7sulvytt3IReVHzpmnj18OhqokoHljM+Qe+bKYzMQMY4zUl
         PuHQ==
X-Gm-Message-State: AJIora/3Fb7Ifm0e2UvWrzfj6RmxAbJRwEHChwjG/U7nw0njRBebWR4l
	I37Gjal/yb3Qaevrrbsslv4ZE+iJlhp8WA==
X-Google-Smtp-Source: 
 AGRyM1t2yg/jelOo00jLEwUwx1xtpiHIqJBtGLjPV3rRVRrmfaJYq/2o2pxpbPrEVXmlLJe7uSvX7Q==
X-Received: by 2002:a17:90a:6741:b0:1ef:7f62:6cd1 with SMTP id
 c1-20020a17090a674100b001ef7f626cd1mr35249801pjm.89.1658199626827;
        Mon, 18 Jul 2022 20:00:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 b23-20020a62a117000000b0052a53f8ece3sm10083127pff.42.2022.07.18.20.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 20:00:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Pass -nostartfiles when building dummy
 libstdc++.so
Date: Mon, 18 Jul 2022 20:00:23 -0700
Message-Id: <20220719030023.2456608-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 03:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168267

This is a dummy shared object therefore reduce dependencies further by
not requiring the C startup files, we wont use this shared library for
anything useful anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 5d74e4494d1..3e1c799ba13 100644
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
2.37.1


