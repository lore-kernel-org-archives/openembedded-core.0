Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF95C64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.53788.1677012309770535473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=baFEr0e6;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id m18so2410296iln.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kguseQdZpmI/3v6qjyGYZ04Kp6D6dBjxqYAsw0vzuv0=;
        b=baFEr0e68SE6hui2Blyp0/M6kovrANjGr+hYnYsV2guyChnnvXMfUnsmeA2YB7zsNC
         zOeA+PXr96p7KdgEFziqobcj6GeWXB4Na9MX63Zrf+S7RlfsMbds/dpQix+67mkV2Ki1
         1M602ToWd2k8Z7JOuqm3zxnxJ7kDh+/vfxZkMzhxpxc9XOmNp2ezEMNjhIhOtI4lzoT2
         rarfpjyqBw1QJI78C8UT7/Ft0RBVUBi1Ck45zYpnf4TiodHxV6JXYKlbQ3ZpKPyxx1Ic
         Q1HbOFhP/lfHNOTMUpK/6rULeTnVvC3EqyRLCktP80Uh0r0xdqCq0v7ludH5DCXzK2x1
         +QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kguseQdZpmI/3v6qjyGYZ04Kp6D6dBjxqYAsw0vzuv0=;
        b=d9ZaV3TH06OBtQk2HwrfvLyejZpM09KVYxDZmHnqg6cWwQiorPNu8vL5T6vSRZ3SaS
         pg+cn3OUYi3HKgD0PRf+C7Yc7igxShM2hKHVG/rg50ragOobbEhjukKUVcLDuSG0JsgH
         FC1fx5EW5TflNuCsHgsFTd4XI7H/EB23QEu1uJF+Fu0T+IhAM23Qjqk0CU/Ze5XXoRl8
         qYGZ2j4hmLYrMCFj5R/QiWbpz37iUqtMtyAVG/LDJFHSoQaRB+GSdAHit0CYN1cJ9cUI
         DCXKMSxRcTYoq1veKcLgHfLIzxbiEMHGiPg0WToGy7euzgA5JhTNNHey9hiL1rBEv2cG
         Vfkw==
X-Gm-Message-State: AO0yUKX45qvmbBJIryJCirK4k6OkneCz+iKVkoy6OIOHI5fXBT6Fbj8m
	mvZivzPmZ0ajJKU01gm1BG2H7maw9pY=
X-Google-Smtp-Source: AK7set85nMZt4jLfDpbNBn6ynvsqXC2QOrjDcAuQeSQQfYEB5HNYAqmEMFZ6rjADPJhFhSSfwkyENQ==
X-Received: by 2002:a05:6e02:1a6f:b0:313:c32b:de26 with SMTP id w15-20020a056e021a6f00b00313c32bde26mr3652690ilv.9.1677012308787;
        Tue, 21 Feb 2023 12:45:08 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:08 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] build-appliance-image kernel: linux-yocto: qemuall: add taskstats
Date: Tue, 21 Feb 2023 15:44:39 -0500
Message-Id: <20230221204445.23931-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177543

Add the taskstats configuration to any kernel built for qemuall for bitbake's
benefit:

	WARNING: The Linux kernel on your build host was not configured to provide process I/O statistics. (CONFIG_TASK_IO_ACCOUNTING is not set)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 091003ed8299..93eef9e94684 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -31,7 +31,7 @@ DEPENDS:append:arc = " libgcc"
 KERNEL_CC:append:arc = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
-KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
+KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc features/taskstats/taskstats.scc"
 
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
-- 
2.36.0.rc2.17.g4027e30c53


