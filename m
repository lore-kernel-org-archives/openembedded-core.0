Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA9CC43219
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.1058.1649445924585079914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7m7zbC9a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id a11so11385320qtb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=na3r5BS4NIs/tBgM+2QiHIE/Qnx8Kg/cKTgIRujNAj0=;
        b=7m7zbC9aUkR3ovjMX2AL+tup+rvgnUUuRFHge+xPxwdQw6qGZZ+P+oYVHsN9npr5Md
         SxPNCLvvx+vvYsRVChaozpJf0OMCWVzwXPyy62+53nvbieaO5OEywk8LxD4ycA9Ie2Rw
         kxi71IosjlcTL7bl9DFKQn0Lik85bfWoGs11w3FWbh4XxZL6CPCxaSQ7KTAg5wn8aogH
         gzP+iCXK7+jQO8VMA5OlFG5+ui4Ye9A+L4Xpz74ebtiuFogphZzm/bfP6A5YxBxEj7wq
         ZgS4y8dzet9GK/45iKEXtwr4FL2rr0TLli+1yEEwkO/9i5VPWX947RpTaCspAEJcQR7/
         rBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=na3r5BS4NIs/tBgM+2QiHIE/Qnx8Kg/cKTgIRujNAj0=;
        b=Cjj0XP0URP9wDQjyDsN23f/+HQrc61ZEw7PeXpwsjYwYX46TR0gaNKG5V0S1xNZZzu
         GJdCpwMXtSpcyLuuVmC2S5tnvR+dGAmz+GFxc0ZYolc68RR13HHPtLZ6jmJM9aJUm/4v
         3NMutiIm+vGULtVZauI1SfazulJcW3rAqrkdqa2MetLhXvdNhdRZuKPZOqxVMzOC7PWa
         YERSDIfB/xaMraZYNicOhbZSM5p9QsXg4zej7IolF5fY9G6iArrisiKnFEJkg9IuJ3EH
         PZvvcSjknetlj8CI5qY4dU00KH3DZP0nPVAyoPcfca7C6gI+JIQbLCunx3CwuAjLOfEl
         ZjSw==
X-Gm-Message-State: AOAM530Pr9tqb/1Ah45S940DhimC90Ka9jsiLBpds/iqPVX66bCFg265
	ez3mMryCCxk2xpNSrfGrNhOKurVd69Xcag==
X-Google-Smtp-Source: 
 ABdhPJya4sjt4ftpE4ehAKKR31lBdjM2xzkxF8r1hkymY+xJCy3/OygIMpiWbv8eHuEZ2pJXavWi+w==
X-Received: by 2002:a05:622a:2cd:b0:2e1:db0c:88db with SMTP id
 a13-20020a05622a02cd00b002e1db0c88dbmr17087734qtx.649.1649445923629;
        Fri, 08 Apr 2022 12:25:23 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 f8-20020ac859c8000000b002e232e04cafsm19351678qtf.88.2022.04.08.12.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/6] qemuarm: use virtio device interface for graphics
Date: Fri,  8 Apr 2022 15:25:17 -0400
Message-Id: <20220408192521.1608764-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164164

For uniformity, use the virtio device interface, as all the other virtio
devices for this machine are the non-PCI ones.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 1bd4e3e154fc..12da1557efff 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,10 +17,9 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
 QB_SMP = "-smp 4"
-# Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_GRAPHICS = "-device virtio-gpu-pci"
+QB_GRAPHICS = "-device virtio-gpu-device"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-- 
2.30.2


