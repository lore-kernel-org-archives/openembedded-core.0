Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E39C433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 07:59:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.13262.1647158376136796499
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cNwzTYiA;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id u17so9456156pfk.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIAiK6Fc0/3FCmajY9i9sV4yuc81GhUDmf1CU7/gX3g=;
        b=cNwzTYiA3yGjOFnyNRi/8m3q5ki1WkRfLoT2bfy1+1uQwdxAUXbMZkLtxsStDXVGC5
         4arJvfZItxOIXp90YO5zfoS3poTNoI3wHi4f3hfENUW68ZpoJYNh+cZUgIHY2axVsxBH
         KP/gbig9+8aO2JIDxELOxX51ZjeIUgPUEzugyj6H2pPa/t1LsDF52G9qPQvIfIHpC6xV
         8YancQCuk8L4dkJfh1/ncaDnqxXuy10FELlCWYjuX3OdNfAdjAgFzhBaWQaikDiCkxVq
         8+8PmIdXwnwfH6SlvbUXJQ9WXlP+IVFiziB5DQBwosz2BLzzYaIi9YJ4eKtP5OthxRZc
         px1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIAiK6Fc0/3FCmajY9i9sV4yuc81GhUDmf1CU7/gX3g=;
        b=7QgV4dnbGDZQDFjD2Js17brSCL9v/kUBo/8N1U4dP8LGlCiKHdPIa9zKstGjcFlFzG
         HrZPrtoKRwQqUDSq36niNFA1LEvhiSd+EmksZz3rnQi3gukduNHXNIr+Z/4o1MjAnyd5
         HE2Ox9B5mrLERu9VBN4oHu5NxJBH3Led5NJo0pDiKo6+nPhB5DUSTdj3YmZMY6ip3fBx
         ltFqckrz5NTYVyqUI6pxPCNg6thb0lfyMZ9kyh9Io5g/s6EtuDLu7CAUyhJiZgYKJ8yQ
         Y47QW6753Z7DdYE3usHMS+g11wEwkJfl1TEba4+d5P143lA1I9MtunspsQPCHVlPCBP4
         cNZw==
X-Gm-Message-State: AOAM530kahdE1+JX4wstf8UUQUXZtVVSQLX6fPQygHPPA3n17ZmaHhgQ
	pl+B2agK/jfpVRYpUdhbzfociB+n9n1S4Q==
X-Google-Smtp-Source: 
 ABdhPJxyrrinWgmaz3+QSU6vqiW1sy4Y72rZeZNc+Lf2fdfPCoAuw77nBCYx6qfgAwqHn6gTSbng7w==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr18153585pfu.46.1647158375343;
        Sat, 12 Mar 2022 23:59:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm12958928pgl.36.2022.03.12.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 23:59:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] linux-yocto: Ignore textrels for ppc64 kernel
Date: Sat, 12 Mar 2022 23:59:31 -0800
Message-Id: <20220313075932.3031649-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313075932.3031649-1-raj.khem@gmail.com>
References: <20220313075932.3031649-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 07:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163103

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b9715e71eec..9a147023e83 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -66,3 +66,6 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+
-- 
2.35.1


