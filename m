Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FE2C10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.22434.1672418712841224560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xLPXAHNd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id z7so9081067pfq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxVQDrxvdYPvsRC7zv7MprxF0v536nhht5TEDnZPd1w=;
        b=xLPXAHNdAq1m45s2DMFOCSZZ0tZSAqQC/nlMf9+JJAP9u0MTl6wDyteCYazdqTM+Ts
         MYmaNXfKnLZSBV0GJJ5iU7IG9a8uxrJ+xKHIJVRjE4Ex9Q/RS6KFDt4mn33sZ6sSHkqo
         36r+9Fbu1DEb9h5bN9EK1TzTi5qi0WKZY69jAtO7H7wSrv7rw0KnzOh9F/bdAGgJpKXo
         cbMviP4F1i307Ko2IdjPtCJErR+eVuTH5WOoNYVfeN5ssL9Sk/1EN6SB5/1J+DHzPNRA
         fcjvteaYGVewlcxrM7ySBB5VRhJxEbYPgK9h4HZEa4mrOz3nltiOCZatoM/f3IfjU1EH
         Yivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxVQDrxvdYPvsRC7zv7MprxF0v536nhht5TEDnZPd1w=;
        b=NTkpf/ZYHpUDATfMGDoVF07iCaTIJ9BgtUbEpYW7NzX86+rWUHDSGH6PQIdzpao9Pm
         BDrEd5DQLqr2gauzrulPwOKWv0XdcBPTFzpgghlG6wgiyUclc5FRzANa9ZwxAHrmsixX
         DGT2HfBfRb7OQ0Do/EfSxbOhg0i7pf6u+o0Zkw6zI+/S0jxYbWHy5u5kBNBdltiJbp0X
         NiuS7HDDPWztoqIyw6awcugijqkonXc3P4qus2QCY0louziIVv2LuEDVfmpOWcKe/rIq
         7wYPD6nnVX2WvDB0i8pe2ZHJNGt4syAmCUEyB+ABO9yoXYoeoIImiIQeI7PDI9LsDPO7
         PAEQ==
X-Gm-Message-State: AFqh2kryavkro/D2U14FrPY1080hhTeVaA3J7/TSG13aBhaB14RdUrch
	/u873ppQdcSxdx+Ilbe9GSv46LmdPdP89u4isNM=
X-Google-Smtp-Source: AMrXdXs7a2/BlwVB4Slcll2nZjTljtYnseHZwwori7poj5PIb/+uY+KaMLXcV+pGvKQb5cMmyL5J1w==
X-Received: by 2002:a05:6a00:3217:b0:581:7430:aba with SMTP id bm23-20020a056a00321700b0058174300abamr11644441pfb.10.1672418711876;
        Fri, 30 Dec 2022 08:45:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/22] go-crosssdk: avoid host contamination by GOCACHE
Date: Fri, 30 Dec 2022 06:44:04 -1000
Message-Id: <e88068a0c7d66834d8527bed468a8131cafed089.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175155

From: Robert Andersson <robert.m.andersson@atlascopco.com>

By default GOCACHE is set to $HOME/.cache.

Same issue for all other go recipes had been fixed by commit 9a6d208b:
[ go: avoid host contamination by GOCACHE ]

but that commit missed go-crosssdk recipe.

Signed-off-by: Robert Andersson <robert.m.andersson@atlascopco.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e5fd10c647ac4baad65f9efa964c3380aad7dd10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index cd23cca2fe..766938670a 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -4,6 +4,8 @@ DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TA
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
+export GOCACHE = "${B}/.cache"
+
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
2.25.1


