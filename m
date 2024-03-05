Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74369C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:46:10 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2457.1709667963116063344
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2ibWbJR;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1db9cb6dcb5so18377535ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709667962; x=1710272762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ52PglYVpNt8sfkzULklWXSddz0xGbRPxvIPslAr+4=;
        b=P2ibWbJRfOyWIo+gCTUF8nttJU5ir+q8qeOpC4mzc8WUFE/4fBvxH5BQfkSzqjB/Vt
         om6JN/sy+/s+qp15/QNOcsCY3FxscbSU3MhIIPoRojlcW9mjQWyqZIMxxo8p28QRvzp6
         4/rskfsAX69QBI0CNECK1ttu5q/3IL4q7XVOs1Qu4jS28ly81s8AwkeJAubdoslXAZP0
         l5R9lWAsDQ7LDbJp/Q5tQInd3hk3kCxXWrhSiFup+KA4MzhV5C5wxC3YDjuaIMQ5yhMD
         l6ZhG8UXkterfMwZTcWiVgqb0vXi52AQ4BqIXLe6wiOmHMe6qUmRaAL925ipv6X3KPAn
         YpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709667962; x=1710272762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ52PglYVpNt8sfkzULklWXSddz0xGbRPxvIPslAr+4=;
        b=ZT4bkhlWoCYScB2wfAN50IQcj7ZZ63JKTowRWICAAmRTUPwpqTUyeKW1MO6bRoEV7S
         L7xzRAqrzO5ZcObx8Z0z4vkq9pDSwjVAus8cmVZ6q67ar1e4QzdOy8h4iL4FNamby+3v
         3BL5BGUPIayK30Kf8a0BPZ04O6lo3AsfbsQkrMJT0gD1zCp85DfNtSn6PfGwc1Lfptjs
         S5W476XYmp5oqvvsCSJ8D1jxMaL8nZsjqnW5Ym1cuBhI2fgPXVh7w1gicgBPJkoyO9sG
         C60DJo54lnuiEHDADSRIpQkBsUHk4ed+kRa94Wf8w9mlB9k4IoMyF4k9E9bCTAT3qj+w
         AawA==
X-Gm-Message-State: AOJu0Yy8fJ/lVslQlJTDXlOXWzxsjfXDGBxA2UABfmneA2jyeYAQa9jh
	4icEreudZCqpcrna4LNMg9XO7AzMbkfQtuSGp2+GZXbZC9vV02bOlRno43Ne
X-Google-Smtp-Source: AGHT+IFx/w8knv3Ff/zSvj1+2/OSnbPwv53uwL8vg3pSF6om3pAdLrgeNGVkb3fozK/7AeLwVYjOng==
X-Received: by 2002:a17:90a:d78d:b0:29b:4dab:efaf with SMTP id z13-20020a17090ad78d00b0029b4dabefafmr1510845pju.4.1709667962172;
        Tue, 05 Mar 2024 11:46:02 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:faa2:7198:2727:549f])
        by smtp.gmail.com with ESMTPSA id o8-20020a17090a744800b00299d061656csm9849098pjk.41.2024.03.05.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:46:01 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dev-manual: Convert to 'bmaptool-native'
Date: Tue,  5 Mar 2024 16:45:52 -0300
Message-Id: <20240305194552.1098165-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196646

Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
'bmap-tools-native' has been renamed as 'bmaptool-native'.

Adjust the references in the documentation accordingly.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
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


