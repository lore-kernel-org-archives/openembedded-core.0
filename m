Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E1DC77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.30353.1683300061667588700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3huvXSLl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64388cf3263so1449293b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300061; x=1685892061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ejz1LfjapYoYnYV+LeCx+jd92GAMmxLlIfvJfAlXC+o=;
        b=3huvXSLlOPVLZFvC/I718Zo76RvdK4ROdczmCOg+J8WWAVcClOKL1UGgQd57p44THJ
         jk1t6bbdgTFokA1+xMZ11v362XxT6ESOnxXApcqy1izINQ0wJ969lRh7DyBZHRbRkbl5
         E8j4Jn5pbw2GPnP/EWkUTfS534tKdoOCb5UJV47pUbN5+14l3Ia0kLDwH/6oCZ1ELuNs
         64hOnYpX+cmxmqTMLUkP/7nTGB8TNcUHpVqzAX/brG+0/mMWiylyQx8mSa204Y071Zyx
         baxSufan1iMQxzAHlwBbyBeQBpyurSfb5uhpp794miEbrBHg7aKO7qLP5oc87cMz2LH5
         GMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300061; x=1685892061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejz1LfjapYoYnYV+LeCx+jd92GAMmxLlIfvJfAlXC+o=;
        b=cz6bQ9NdMG3Tqa7I4WUmVkKj/5hyOUeLwfYF4vhc8kpONvvlzJvMj7rnDuCqkbvKkb
         5Vz6vnWaON+Kf5gS8jJOSmYMZyZjv6jkRcC2fdCkC0jV+9UK+0vGQTKvK12dZZcxBPsp
         qnf7BPdPoBJIb0izGtQQ/7uTU+JBkknd9dR+COHCon7UL0q75JyYKvSSfnQCuP5j7E6k
         L2tMAD88oSuX8/4h6V0MHXZQGvfIjtpEBiy3qbqRxBZZc6HdmRiaRspTnDjjTgIrTDaJ
         pWS4s33oKJFY0Dnpt3rKRIC66iTCPqRkUP2bLc/lgvku9/p0WZBy4qlNTrSJV1bAj61S
         sJTg==
X-Gm-Message-State: AC+VfDxMrwexrKm1qsQEV2AdVMI7qRySRv+S4cNAcOURSuZzyKtRYfCe
	oZ1ASzJMSveJUBxu32WWb1nVvunRzBmMZ3AAxw8=
X-Google-Smtp-Source: ACHHUZ6NLDR+t9s2wSdkWJegL3rs9A1GqS8gLB/9Q0Jm+piGulzwrnknBMstuzaEV0FlBNEOrgbiXg==
X-Received: by 2002:a05:6a00:1581:b0:63b:6911:8928 with SMTP id u1-20020a056a00158100b0063b69118928mr3022582pfk.3.1683300060667;
        Fri, 05 May 2023 08:21:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/35] libarchive: Enable acls, xattr for native as well as target
Date: Fri,  5 May 2023 05:19:40 -1000
Message-Id: <9d19e501d710c6c357bf6c8f16ac3e172d63e11d.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180949

From: Piotr Łobacz <p.lobacz@welotec.com>

Libarchive is being used by OPKG package manager as default
API for extracting tar files. This fix allows us to extract
ipks packages with preserved ACLs and xattrs.

Partially addresses [YOCTO #15091]

[RP: Merge into main PACKAGECONFIG and tweak commit message]
Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 913aad1ac013368aef8f6af332588ef24bba46bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index f447035b67..aafede3da8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "zlib bz2 xz zstd"
-
-PACKAGECONFIG:append:class-target = "\
-	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
-"
+PACKAGECONFIG ?= "zlib bz2 xz zstd ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)}"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
-- 
2.34.1


