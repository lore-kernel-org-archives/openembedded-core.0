Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA03CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:33:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.278969.1697628784734877137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbw4wSbG;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-406609df1a6so62501695e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 04:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697628783; x=1698233583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiqiWl1nFNoYZOxenKVD3VF5Q2T5Xau4G9sHx2P4G3w=;
        b=jbw4wSbGK1d1RnvLaX2BbwEg6Ptd+4eQFzs4JePuSa763b+Kt4WTzJ7FEipxz3R7K0
         05ySqz1Bagf7/Y07KjJ//6WwHW8B3sDudOsWGcD9nCwC2J1sTpbJfMbcYuU2j1pmrVkL
         dE9Cq3M4TWsM1f+E4x1syjsERhDSSMOYHh7iEzIkrIAAxTgsjw/NWfB/Teij8ySiA0RV
         FV/vRLoYwq3/B5vk4sucryPl8QIhJoeyh57UUvRv+7FtyF9SU5oDG1Sf27S3Ozm9Fbqo
         nsQcrwFKL+2vwxujLqrnDw9h02NAvH4VHXO9FBbPrjnLRwpS0EuO7qm+WG7vQ8yVOtcV
         lifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628783; x=1698233583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiqiWl1nFNoYZOxenKVD3VF5Q2T5Xau4G9sHx2P4G3w=;
        b=uoiwybmDvcXwEfXs/IcgxsU+1YpICFe2C7C1HowE+j3p8H/cFxpT6c1fql34yvLeo2
         nR8l52bFIc0rKOx+lrnv/y3sjOwWk1vCtZGs5S6ElTVbcFDucWfqKqGhqTuSfKixfCdP
         3mB2KD5vVRUTBN5+cZaYO/IaYQY7d35ZD2aABSWV0kaSIHjZFeKsPNO9m+6/ED7nljoz
         mwpMOvg18uRhv4OqOa67SxI8JbmNC+o9JtwQis6+Y3eF/C2Cq2UntmTpadHxw4UTRaCR
         fUu5LaM7RmFML9lzSGz0O/znNN2NY8lfZgO64JaeDOS9jXaM1DiP/RBsfCtR6YbQfYr0
         uXeA==
X-Gm-Message-State: AOJu0YwunwAAWfaxG2abpLFbSIE7nIDi+MYNddxw2QYXdfa0CCG5vQur
	Tpsba8VCRhLSXKrgSvcaTtXZsEry7oPQig==
X-Google-Smtp-Source: AGHT+IGnrDjqz3UIICu7Ywuns0j/qLqyns2IxMk/DJFaRtF90eH7P530gMoCVGfHaWXW0sooJ2B6bQ==
X-Received: by 2002:a05:600c:4444:b0:407:5ad0:ab5b with SMTP id v4-20020a05600c444400b004075ad0ab5bmr3893650wmn.8.1697628782698;
        Wed, 18 Oct 2023 04:33:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00403b63e87f2sm1465725wmq.32.2023.10.18.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 04:33:02 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 1/4] systemd: sort packages before pn
Date: Wed, 18 Oct 2023 12:32:52 +0100
Message-ID: <20231018113255.607577-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 11:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189379

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..d24bf0cb06 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -384,20 +384,20 @@ python populate_packages:prepend (){
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
 PACKAGE_BEFORE_PN = "\
-    ${PN}-gui \
-    ${PN}-vconsole-setup \
-    ${PN}-initramfs \
     ${PN}-analyze \
-    ${PN}-kernel-install \
-    ${PN}-rpm-macros \
     ${PN}-binfmt \
-    ${PN}-zsh-completion \
     ${PN}-container \
+    ${PN}-extra-utils \
+    ${PN}-gui \
+    ${PN}-initramfs \
     ${PN}-journal-gatewayd \
     ${PN}-journal-upload \
     ${PN}-journal-remote \
-    ${PN}-extra-utils \
+    ${PN}-kernel-install \
+    ${PN}-rpm-macros \
     ${PN}-udev-rules \
+    ${PN}-vconsole-setup \
+    ${PN}-zsh-completion \
     libsystemd-shared \
     udev \
     udev-hwdb \
-- 
2.42.0


