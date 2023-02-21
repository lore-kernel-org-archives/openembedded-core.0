Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842F9C678D5
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.54501.1677012311325267146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfywE8Hm;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id x6so2512623ilm.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4CH/9yqTyhCoyJ84BE3+DIVBA/nWsZ6Oau+10TEriM=;
        b=KfywE8Hm02aR498lVopNIgGPPgU/vr98XVJF44Cs+wu91rJh2iL5G05DDiqHV57/uc
         qkul6pASgjAR2myJh6/fA9W3QDD4NOLqyMTRZ6wzlH5tOUThkd+ozJmVIPB4ojMS+8SJ
         7HFtvr1cjypBniCO7TdgJ4TMsOt1jey/5YVP3aHS4SQXggYdo/oTwazmVcSWvvdNvzDH
         tELoPqDppRR4ofI8xR0RsiiWA4mjEIWsOAAnYG2p737aIIF6k4+GIxPVjViOzC+xZwhQ
         BCPSmVzMKNe833/DMtGIUsfu+V6DC2fQibRAK3CfCllE35I96YPDqOyY5cnBb75Ay35T
         jSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4CH/9yqTyhCoyJ84BE3+DIVBA/nWsZ6Oau+10TEriM=;
        b=ssE+0AZr1XiR63nSaYwBlCKAPtLR61JvHrceZLyZIny2avpb0SRbXJ5D8FhAY4/yB2
         MUDz0AVOmrdy8K1FoocXiMCKUI2d5s8aX7xlBrkSxgSogy45zOjsYiMQY0S5tckH6ZZA
         2AVQhtOYCgks14OnXNYYCni6YPYYllG55GkWErkhYyVp/y6H4DcWUnOyEGfrjAjG+J1N
         mlh1GvTp2Pat4TxAl7VfE7NsBSw/y1DaCEG1aGrc1ToiY/da4Q/wmeS9oWTtf/aSJpNA
         g4gKx2SGcX5HP/0U97DNEBZSlVW3SAxE2tAmPPqoveq3CN9Ox0EUPpiehFZJK5TTW1Tr
         Ns0A==
X-Gm-Message-State: AO0yUKXKzvfSBoKqDrcL0M8SMLMUBsnPmFQRCh55EP9umMN0z9kZK1pT
	cwOFd7/IMEtsF6OgwDPA+qoFIqnWr0k=
X-Google-Smtp-Source: AK7set9+Dh5tWDQadBH94khq3IoL9ikTlDG5nkn+FxxFnfjxN95j1h09vs7jSyGeeH/ySEOTktZRJw==
X-Received: by 2002:a05:6e02:144f:b0:315:3036:4da with SMTP id p15-20020a056e02144f00b00315303604damr6979750ilo.30.1677012310248;
        Tue, 21 Feb 2023 12:45:10 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:09 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] build-appliance-image: fix HOMEPAGE
Date: Tue, 21 Feb 2023 15:44:40 -0500
Message-Id: <20230221204445.23931-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177544

Update the HOMEPAGE metadata.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index b000ea0c4d70..ad5ea92b3eda 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An image containing the build system itself"
 DESCRIPTION = "An image containing the build system that you can boot and run using any of qemu, VirtualBox, VMware Player or VMware Workstation."
-HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
+HOMEPAGE = "https://docs.yoctoproject.org/overview-manual/yp-intro.html#archived-components"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
2.36.0.rc2.17.g4027e30c53


