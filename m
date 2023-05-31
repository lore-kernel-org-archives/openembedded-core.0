Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D72CC7EE2C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:59 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.4699.1685500492197153554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=USVKNuFM;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-39425ea8e1fso3595831b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500491; x=1688092491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZXK2LMiYBqe5GJPbRDYwkeKObTFIQbArAw1bMIlD/c=;
        b=USVKNuFM5btp5xGQyUZrGJo0tmU1w3HkbAjbRFQtcFuJpPh5myoqbwM9Zc+Av4cXeN
         258OOX28oNZG3vI93Lkz50jSWI9fJ/zntrtnsdyWt+v7quzwcD4JsOglgEefrLJMpZM2
         OvaVOSwKrT7IRKXzDYM/axrpMLkNbMly0gjBkKEdNTU8f/8vTqAsSKbAVkcza65aeaLd
         9ZHvOwlbkWl6fvjp2+JQwn5IkRcrsnSeYULPUlCV6g2EEckyvZG9zXctxYVtRKuHXwk9
         CjVKe79WyVDhKdHC8IHE76ZNQYfzUE6fjzJBYFq0WLeHLCy4/OwgZed3K9CC4TnCV78J
         14yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500491; x=1688092491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZXK2LMiYBqe5GJPbRDYwkeKObTFIQbArAw1bMIlD/c=;
        b=VN+mdpMbV7vOZfSwxNfZyMrJJkRZLACx2Aup/yaM6+mFl7YfDq4vs71VuLv78dspRA
         HILJ/so0MbwD0UfMl7S0RINFwPm0VhcT/vxNyF4RJD0qlvm+C+qwBo/oNpopENWQtamE
         +DlN2i8Kyp1TAvxLgSkppSOfGkqSWi1FZWQSKjdAOtErtRrGliQcG5Ov5iemUDnH9EBD
         iJ+NXmxcMcD+oAK+HXkxDPkn1J/hGdLkdNMEvEFGq1KlFJ5HfrOYswBSt3pCsPXzLFgi
         eQgQxdXejjeNfqa7aDkUI9bXc7e8SpyIYjktdfdgon782Xo7KFcxjrNoeJ+C/kfnpXao
         SSaA==
X-Gm-Message-State: AC+VfDxNK4J5rpbokPILVOL5LMryQKkHD+HcVj0c7k6zDd1qpJSVC0cS
	f5RTTw6s7njhu2Cd+8UxhpaXXXI8ieFr4rqFmzk=
X-Google-Smtp-Source: ACHHUZ6U5TFdHZ0JH/ozyCegFkZdJuElkA79tBCv5uWJUqi2MUnBYUWAwVUPFH6mYmME2CAR4IKs8w==
X-Received: by 2002:a05:6358:4303:b0:122:f227:581d with SMTP id r3-20020a056358430300b00122f227581dmr425944rwc.24.1685500491091;
        Tue, 30 May 2023 19:34:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] kernel-devicetree: recursively search for dtbs
Date: Tue, 30 May 2023 16:34:20 -1000
Message-Id: <717b9f18a51e9c9fd5a471238aa2ea4de439ef17.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181982

From: Randolph Sapp <rs@ti.com>

Upstream's dtb directory structure has no real standard. They just tend
to idle around the 2/3 directory depth. Recursively search for the
dtb/dtbo files instead of assuming anything.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index e1e67cbc56..18ab6b4c4f 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -6,12 +6,12 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
+# recursivly search for devicetree files
 FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
-    /${KERNEL_DTBDEST}/*.dtb \
-    /${KERNEL_DTBDEST}/*.dtbo \
-    /${KERNEL_DTBDEST}/*/*.dtb \
-    /${KERNEL_DTBDEST}/*/*.dtbo \
+    /${KERNEL_DTBDEST}/**/*.dtb \
+    /${KERNEL_DTBDEST}/**/*.dtbo \
 "
+
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
-- 
2.34.1


