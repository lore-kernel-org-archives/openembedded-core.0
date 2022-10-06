Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B23C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 20:24:10 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.2556.1665087845888404599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 13:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hISfDinj;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id o64so3300440oib.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGVTfVkHmlqCWKfrWjerTPTTWc6uZ5usovhfZSC2OaQ=;
        b=hISfDinjgRUdGb3fZuWagH6qbXQ+IdPRII4EF/ZvPiyN3lrT6UUHCCtbZHsNHy0IHL
         PbAnx0DA7PKo8FfQmNxEnDYmYC5UciTpirC9jp+IJknO8iFjbwjpo2N/6/haghwJahy0
         WZZXPVC8XOgItdKxwvtaFHIh2USGkRV+f0slyVjyk9uljkcY4OlBj5mmU/mCPWZo1i37
         cskWqqORjNWyP2NnsaEZgE4qG0kgkhbUTUQduSjjjhwrb08XYM4Ey79eN4nO2Gw0htza
         LziEC87rfbgAHd1pe2YQqahV1aGQW+mnX4975tHsiyMy90vss/UbSJE6c2MujyMonawL
         UnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGVTfVkHmlqCWKfrWjerTPTTWc6uZ5usovhfZSC2OaQ=;
        b=x2kw9OAtAW1GrnLAtmBRSUUC4qS9ZZHjsuuK1/2kWZRqEzE04HYYKvrlVGQ1M1cqe7
         OJz2hy7j1EEGR74dLTk3JTshg2x/BcWoak1N83ev8zRjAj4IOQ/zWJq9K9pZYVv3MB2D
         zFkyMBRDriPh32g3ppADBNSen9Kqxbf8jqg7Q3QPyJisuysOiuFyJcNunD0AAhp6JmFZ
         pPO9tRoEMVLg0yMDRm2LAak8+d9LnJTFQxxZEQDlkEIe8DBuZgp+O949p/XPTT49xfxX
         R2bko+x2Yn17GWmT5WCQb02+0CPjSSS5zZsdZNXxAkrX41SLOX0MUXZsZpWev7anjKEs
         0VGg==
X-Gm-Message-State: ACrzQf1r224mxT/nDKv5oqcnGOkrUNwxR4npe+KQjBgWt+4Z27fqDg3n
	fEaXF2gRtCRRAHggDv3bJrs/mTjVfdawxg==
X-Google-Smtp-Source: 
 AMsMyM7ZKs06frUwEFgk+bBTMox8yacvR2Zw/8a2oAU4FjVrsAR/2es0jzqkEO3uy93EZ0HaFfKR/Q==
X-Received: by 2002:a05:6870:5688:b0:133:3339:63cc with SMTP id
 p8-20020a056870568800b00133333963ccmr811837oao.0.1665087834132;
        Thu, 06 Oct 2022 13:23:54 -0700 (PDT)
Received: from localhost.localdomain
 (2603-8080-1940-056b-a027-4c74-8f6f-3dad.res6.spectrum.com.
 [2603:8080:1940:56b:a027:4c74:8f6f:3dad])
        by smtp.gmail.com with ESMTPSA id
 z25-20020a05683010d900b00660cf957463sm312550oto.0.2022.10.06.13.23.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Oct 2022 13:23:53 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] go: add support to build on ppc64le
Date: Thu,  6 Oct 2022 15:23:39 -0500
Message-Id: <20221006202339.24899-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 20:24:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171512

Verified by building on a ppc64le based system

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/go/go-binary-native_1.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.bb b/meta/recipes-devtools/go/go-binary-native_1.19.bb
index ca424a66b8..eda90f3753 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.bb
@@ -10,6 +10,7 @@ PROVIDES = "go-native"
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
 SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
 SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
+SRC_URI[go_linux_ppc64le.sha256sum] = "92bf5aa598a01b279d03847c32788a3a7e0a247a029dedb7c759811c2a4241fc"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.30.1 (Apple Git-130)


