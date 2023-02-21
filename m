Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFD0C64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:09 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.54499.1677012307885918393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VzRn50Sx;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e10so2350980ilu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/xlMbUDo+hPILYuVbdLGIAJQRqEfTKJOorJt4tSXjI=;
        b=VzRn50SxMsyVoO7XFCDGi9D/3z38NA21hcw0quVdkZpzb4tlpD+fp5Jg1kyC+Ab1ON
         +sq337Ntu1t+pJYaH7FKwWtGOylRmByC9s/VnVEgiwKZSxTEnN7T6fTLNpKf9t+Fw67U
         v4Y8VIE4KCucCOPQpn/EytHueqU+bu4ziaklp0QkXD13bS2CwKrslx9+1VqKcAsEzXIS
         2a9P9ixp6vdRot+txDYAqbZ2ZcK/pi3T8Cvp8ErJbqXNrToO1Iy013ohgGZBjlIRdtBW
         /87x4wSjIDcgebrjhiBWp5Ih8dgOjJGDoW9W8nbRwpZo70LakhoOuUz+DjQyLxYvHGl6
         Koag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/xlMbUDo+hPILYuVbdLGIAJQRqEfTKJOorJt4tSXjI=;
        b=cTAdB32bEOhHGzAybXclA/NOjLqd1+g1HkirTZ4FZZa/SuLjrBbor0jUDEHKHWWC80
         gMKR4VxlJYpvBZQ3o5EX7xveeQY5yieqKjLZOK/tB6bCj4s7fiOtCSd7rgCvl40/bmys
         B59ygs028qN0bOiwq2pg+LTTEIAlFTYodi/so/wNMN8K+CS4KE6JMGeuPAF04e5R1TXT
         OMhg91vXPrW2CPv8Ebou1dXQhdj6FktIFCUPc8U+eHw3nCCZQ01Vfu6h66rpuqMafYI9
         LdYCp7FeG8BF4I1q4pinPucGOMeHuCiEQzDpCzDzRCPfBn2JvwjWq2d3Uu7akH5isq4h
         Fd+g==
X-Gm-Message-State: AO0yUKU1JvWs38XH+7sRMA2FhbWZ1ugS9BdkxFqCXnaiCKFuTQZl1TAP
	xsLK9Uf9G08w/F69DHtMQlYOphiuyRo=
X-Google-Smtp-Source: AK7set9h9e1lwayI/N4nGfA/XiEhvHeQh3sczCbdDzqWRotNROKrDsX5d1Gfw+OKgzg+mpr5AeNdKA==
X-Received: by 2002:a05:6e02:1a6f:b0:313:c32b:de26 with SMTP id w15-20020a056e021a6f00b00313c32bde26mr3652647ilv.9.1677012306930;
        Tue, 21 Feb 2023 12:45:06 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:06 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] build-appliance-image: add support for qemu
Date: Tue, 21 Feb 2023 15:44:37 -0500
Message-Id: <20230221204445.23931-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177541

Add ext4 explicitly to the list of IMAGE_FSTYPES so the build appliance can be
run with runqemu.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 064e7a1ed82f..e28096758b9b 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An image containing the build system itself"
-DESCRIPTION = "An image containing the build system that you can boot and run using either VirtualBox, VMware Player or VMware Workstation."
+DESCRIPTION = "An image containing the build system that you can boot and run using any of qemu, VirtualBox, VMware Player or VMware Workstation."
 HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
 
 LICENSE = "MIT"
@@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 APPEND += "rootfstype=ext4 quiet"
 
 DEPENDS = "zip-native python3-pip-native"
-IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
+IMAGE_FSTYPES = "ext4 wic.vmdk wic.vhd wic.vhdx"
 
 inherit core-image setuptools3
 
-- 
2.36.0.rc2.17.g4027e30c53


