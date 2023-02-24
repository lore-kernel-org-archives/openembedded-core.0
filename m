Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CC8C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 14:37:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.19023.1677249465793569893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 06:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tl/cQNrX;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zarkakareem@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bo30so13570904wrb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jb1gvNO5K5prTFNUJK7EKm+TowFGswa9IJukc0Hd8g=;
        b=Tl/cQNrXvo/3mN2nh3spRyvA7G0KWOieF9jX1qeG11QgmzYdRyhEug0jgtzqF1nHLV
         11cUapOhvclvC93yK+Lq/gNfkb047IGkQubMaR3Em6rJMK0rOGdcC9NNsTUk5fX789sM
         ipQacGRmPkb7tOvo0XmoOwXW5STIRz7OEHjyB3a5QJfN/ZqoQDOb5JbFOvYgqh2Ff79T
         po2ACz/zafYJx+WiLgIxN/Tbhe3Y3oZ5m11D+Fkp5esKnbsABHRvN4mpYktb5B3Gd0bP
         pC/iQl9Iiyu9fUqtc47tx59QZ5ldFShgONFReB8taYZIPDNF/L5IAKwJWJ1MqR8avSAE
         wd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Jb1gvNO5K5prTFNUJK7EKm+TowFGswa9IJukc0Hd8g=;
        b=1BeHqmAKcCMbZf8b3oF/1gnRm8ggRqfvEDIS5wVD79VC/+cR4e2H0rPK7voCY3LQlt
         hu8ed+wmAibImZ+tBZsFnP16MMMCNHNQ4JWRSgvIorBZr6VMQXTZKTC6avkvGo+MmkzH
         R/ajFp5aX1yPuCgXtHPMJ79Mqkuv9gyhF4/nZ3rommyuUeVgu7VkTVHSz+0zes8+VcC0
         xse8OW1fMfK/RY+BRjw3a3ZsYSBdXlSqMtKM8LsVDtQp6KbtcIF6H3JI5bu3vssYU9u1
         P4h8SHIThHyMSvM78eohapo3oi/TQJazv8J4c/wsa0fXuCrGgQZ6GT1+W7BTd3o9ndYW
         T+0Q==
X-Gm-Message-State: AO0yUKUzf4R4XrgRQO1AvQPeYDpMoH/nfZrsg95ldPZOE53ZGaoMcdi1
	SB/YGsLo1Hqj/3VeWNtW5nyRfc00hnkbw/aQ
X-Google-Smtp-Source: AK7set/EIrhznRUvwYvHrkeusFRoAQF7aFmcYzYCthn6Ls7YpzdyUF5AS1fUFn10m4Ty+O/Y2zYG5A==
X-Received: by 2002:a5d:58c5:0:b0:2c7:17dd:ed6a with SMTP id o5-20020a5d58c5000000b002c717dded6amr3488061wrf.33.1677249464044;
        Fri, 24 Feb 2023 06:37:44 -0800 (PST)
Received: from kareem-XPS-13-9370.wtcombo.net (93-46-174-218.ip108.fastwebnet.it. [93.46.174.218])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b002c552c6c8c2sm10907813wrp.87.2023.02.24.06.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:37:43 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/recipes-core/images/core-image-minimal: add mtools to IMAGE_INSTALL
Date: Fri, 24 Feb 2023 15:37:17 +0100
Message-Id: <20230224143717.2669400-3-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224143717.2669400-1-kareem.zarka@huawei.com>
References: <20230224143717.2669400-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177688

The wic.py selftest cases test_skip_kernel_install and
test_kernel_install for OpenEmbedded were failing on autobuilders due
to a missing dependency on the mtools package, which provides a set of
tools for working with MS-DOS file systems, including mcopy.
To address this issue, we added mtools to the IMAGE_INSTALL variable in
the core-image-minimal.bb recipe. This ensures that the package is
included in the core-image-minimal image, which enables the
test_skip_kernel_install and test_kernel_install selftest cases
to run correctly on autobuilders.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 meta/recipes-core/images/core-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 84343adcd8..5d626898f0 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A small image just capable of allowing a device to boot."
 
-IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
+IMAGE_INSTALL = "mtools packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
 
-- 
2.25.1


