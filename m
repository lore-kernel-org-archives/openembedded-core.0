Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89205C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:52:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2633.1709668346146223245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bT2L18Bz;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so2323259a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709668345; x=1710273145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weRBtS4BblqzaZQBteIlqINQwMKFdKNXb02dvjaiMUM=;
        b=bT2L18Bzwhb5qkU6leAafL1SZ2d3vpo74LbEmDfDNmz1/flb1zcPpxbtzaj4zRfl+g
         qWii7fIQaYeqAxGDis3QZxy8gF4RXmPcwUjvz6OIXPAyiHD1tOHiAKag7Kd0VO9KUxIE
         6Uc/XdBiyxoKhM7LcIAKZ/7yMYKHWRfWsZkJC/j8lPJB5ozw4TOcWJ7Gd2P1mJjaPSxz
         j8ACJcDziltmNRHrT8K8oUosZTzR1XqeGsCW3utvp4e8Rm4PkuBHOrQlmaEdbyih4Qub
         ET70xT9i+xQhhOL/gyTnRX3cL6D9LMiVtMY8Yhxrj5cA3BrFeu6FWHAgE8o6Xcj5cfjL
         yTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668345; x=1710273145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weRBtS4BblqzaZQBteIlqINQwMKFdKNXb02dvjaiMUM=;
        b=cNTy3PwVGA1DiOS6zBkTKEFwrYf/qt5g1DNTrO/g9ZVRVePW45G/uM1sj7A9mUr7zp
         +8n8RT1yH2rjhsPJPmFORE++gMXubasauOgaxBXw+rbq8M+TTYN20Vl4dGUDYF8T9vQn
         WSu3bTb0G+uCv/+EvFsmiVH8pCjuUkqSJE/ZIfw57Fu66+byiYUIMl+0ZvahAdQw95xo
         NaMUZnwqpwHH0cPIU4ppO0T0ZJ570H00YDY8L1PksQ8xYMEyGVD0+cmAJHq12R2xYqp7
         lw4O1dlxt+0nFdgBVCIyKYoN1e1Gp+3LGeW6K6rYvBgF3Jq8Pfb5RQURR9Q33t9hiOZd
         Bx/w==
X-Gm-Message-State: AOJu0YxVjkL09Y+xpNlJatYtZhIiuBTJvSAv2dAuzP4+Vss9TXcYqg9W
	0YSodO9LA2hF1FJ/amsbC8loKH2J9EVEfMCvkLmjOczgba0Ly8QdYf/a7oUr
X-Google-Smtp-Source: AGHT+IFaDw8BUhOouG/5fMlwBy1Bw8hYYEvYXT2HeVr6S7+X3sqcQ1d6UwYnhSb+qFCnIYkzW7MRhA==
X-Received: by 2002:a05:6a00:1821:b0:6e6:3069:660d with SMTP id y33-20020a056a00182100b006e63069660dmr1636193pfa.1.1709668344904;
        Tue, 05 Mar 2024 11:52:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:faa2:7198:2727:549f])
        by smtp.gmail.com with ESMTPSA id q5-20020a056a00084500b006e535914f9bsm9595242pfk.97.2024.03.05.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:52:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	docs@lists.yoctoproject.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dev-manual: Convert to 'bmaptool-native'
Date: Tue,  5 Mar 2024 16:52:13 -0300
Message-Id: <20240305195213.1098945-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196649

Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
'bmap-tools-native' has been renamed as 'bmaptool-native'.

Adjust the references in the documentation accordingly.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Add docs@lists.yoctoproject.org on Cc

 documentation/dev-manual/bmaptool.rst | 6 +++---
 documentation/dev-manual/wic.rst      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 9add72cf3b80..3a2a61d8cdfe 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -22,7 +22,7 @@ system image files much faster.
    -  If you are unable to install the ``bmap-tools`` package, you will
       need to build Bmaptool before using it. Use the following command::
 
-         $ bitbake bmap-tools-native
+         $ bitbake bmaptool-native
 
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use Bmaptool to flash
@@ -45,13 +45,13 @@ any type of image. Use these steps to flash an image using Bmaptool:
 
    -  If you have write access to the media, use this command form::
 
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
    -  If you do not have write access to the media, set your permissions
       first and then use the same command form::
 
          $ sudo chmod 666 /dev/sdX
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
 For help on the ``bmaptool`` command, use the following command::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 312f78c403a2..05e9cb381b31 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -503,7 +503,7 @@ Continuing with the example, you can now write the image from the
 built your image, and boot from the media. You can write the image by using
 ``bmaptool`` or ``dd``::
 
-   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
+   $ oe-run-native bmaptool-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
 
 or ::
 
-- 
2.34.1


