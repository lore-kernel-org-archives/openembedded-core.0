Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0CDC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 03:30:55 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.7017.1642649454427681053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 19:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZlEE0fU;
 spf=pass (domain: gmail.com, ip: 209.85.219.53,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id g13so2823852qvw.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 19:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lgmg1dnpHLBYb5lM0aRBHv785mIohpo3GwXz6J8Pv/8=;
        b=CZlEE0fUwWs0b3qwpLDcD0BFAT8U5XYyHedKWCL2AeKXohEPYxHoKMxXCnIADErKhV
         vT2QYyppK2UxMmyvemAEo6v7Iii2H4LTQm8df+H/zMWhQA/84PIXEaIIp8Tb46VaZRto
         oc7gVUPqh9mXG1F2br3ABol6B5nvFJVXH7vYORMWdsTww3hAveno38N2to7P2Iwozewk
         2/uE1gDiwVeV7QmoTQNW4FkAV42aKcPSujgl7MGD+YjautVPjo73KXuCpNj7g7a2RHrp
         /FT5jVdo+lD1d2up90OioIKX6Zp7MDsBojTYOM8r/hHF/vuuYZPF7btOXnBV86gqy9lf
         cIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lgmg1dnpHLBYb5lM0aRBHv785mIohpo3GwXz6J8Pv/8=;
        b=hrPpog7tueEPT24qO2K2QCknDiek1tun4pbchTRmEU6dYocFaoea16Zw1GabNffpUm
         /MdyyZuRFX+u0bC3Tu0I93pgOxnMzKLAAVqc1e/89NIzGN5ztZJnQCpZC+rO+ayKmaod
         vfBlXgFl+l9AhjHuJhxiO08pHJsEsAQZTU3wqCiiEXge7JFGs8MhapcJOGfDL0C+bQWA
         KkRk8COGjzyGNmnIs+nj+HD0YqGWGKeFZ0wK7dLidkc235npzVSObdk8CS9uBhhL+Mhp
         ycbhl2eKtjUBpYC28s4kxJVvG3naYOM34E6oCyDP2fMzDyfCE+w4zXZyLiCz2G7H9Jcp
         G0Cg==
X-Gm-Message-State: AOAM5317bZFpqY22bdLzJnBat8XUYCwaB5YpDIAaUAtlWVLORbL5KV94
	+3p+6nPcTGJfbKJNx4yeK6KF+sZHSXCpog==
X-Google-Smtp-Source: 
 ABdhPJzhzDl7mtKf4eriE47tOedYQ8s3WOHito2pbHluGjhi0omRpGYpwkmL8UXtxp9IiFOFP3CmaA==
X-Received: by 2002:a05:6214:3003:: with SMTP id
 ke3mr26777739qvb.54.1642649453219;
        Wed, 19 Jan 2022 19:30:53 -0800 (PST)
Received: from hercule.localdomain (cpe-74-138-104-174.kya.res.rr.com.
 [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id a11sm975291qta.1.2022.01.19.19.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 19:30:52 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] security_flags.inc: don't default to PIE if image-prelink is
 enabled
Date: Wed, 19 Jan 2022 22:30:45 -0500
Message-Id: <20220120033045.1098738-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 03:30:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160749

Since a prelinked rootfs is in conflict with PIE, don't attempt the latter
if the image enables prelink.
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e469eadca1..be6feb9e5f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -5,7 +5,7 @@
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky" configuration.
 
-GCCPIE ?= "--enable-default-pie"
+GCCPIE ?= "${@bb.utils.contains('USER_CLASSES', 'image-prelink', '--disable-default-pie', '--enable-default-pie', d)}"
 # If static PIE is known to work well, GLIBCPIE="--enable-static-pie" can be set
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
-- 
2.25.1


