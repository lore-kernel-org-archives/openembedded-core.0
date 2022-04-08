Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C967C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.1117.1649445925245195774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6leZX1q1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id o18so4306189qtk.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IhE4o6NRKaprKcg2n2oos2PdMdrK9lywaba4h7yA6zw=;
        b=6leZX1q1m1E9tEoOYlDe91AJIeIZl6xNX+lQkAvV9/0dQ6FZgsOVSOJJg2/1IsU/8/
         X9aiQQb3NJ+bxNVUDm0MVVE3bbYll45EoFmfJF7Bt3hQ4fPAASVVdOIU4nDUt3JkyGjn
         ioMkk1UPVekiLGjutdhWOyQbzdWXntJBd14FbbQwkPxfGXzbrIua3TvbMUC0q2ALW92e
         yHDQeB6W3+OpARRLrfhEJTNhaVtbxYPEc4RlW7kiBbBC0zmQMt27WMNAgEvwS1eaxvdm
         thBuVK7H5qyY81Yq+Zoe2i5Szs54Dm0XaX1ZUpBU1/9JrcoKKU6R0OHqUKSYfFu808bV
         daJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhE4o6NRKaprKcg2n2oos2PdMdrK9lywaba4h7yA6zw=;
        b=6gl6bw0cYRILHz4LOrWy72IAJ+bNp9P+pEjTiDdoOHVqOgRgLfDjFlaQK5PzVpdOJT
         OiNCSAgIfXteVlHlzlDgyJDd4l216VI0ctC+j8r8C68xCTlIkhaqQLaZ75nGOr4kruNL
         1d6660LrGxccRZmKCS3H121QkqbGLWWPKNlGVFkrRgLiJP03XvqjFXTHlmVTcRO/mtsh
         7C5Etgz+Bepm03AiYNb/0/Yo1RVfXCwNPwWhxccVqETq6m0kBOP9/97d4vdpK1At1GBG
         x36dfqUDW47h13jq5MKXpBUvUSD4RVdePQBW5pIcA/emUPOSmUrsnDtbzSz51JUA/fAX
         xUdQ==
X-Gm-Message-State: AOAM530NVFmSKYLizdH9UDO7Xrj/w/aMhBbTVoaXIlOeAUH0V4VtnBjm
	PnwcdI6IZjUVsfggl6Ml4PMyx88ddj3HxQ==
X-Google-Smtp-Source: 
 ABdhPJzYvUceuUwdvh/hDrS1fI0bYo0/odZBmQqooMIBVI/rN3+h3I496X2d1+jD3O1XHa57n45FXA==
X-Received: by 2002:ac8:43cc:0:b0:2eb:dc8a:d5c5 with SMTP id
 w12-20020ac843cc000000b002ebdc8ad5c5mr6201009qtn.663.1649445924284;
        Fri, 08 Apr 2022 12:25:24 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm14063367qkk.52.2022.04.08.12.25.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/6] qemuarm64: use virtio pci interfaces
Date: Fri,  8 Apr 2022 15:25:18 -0400
Message-Id: <20220408192521.1608764-4-jdmason@kudzu.us>
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
 https://lists.openembedded.org/g/openembedded-core/message/164165

The virtio PCI devices seemed to be required for this machine for some
versions of qemu (based on errors from running qemu saying that the
devices don't exist).  Changes to the entries here is all that is needed
to get it working.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index f24515216838..ffc51c803fa7 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -23,9 +23,9 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 # Virtio block device
-QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=disk0"
 # Virtio serial console
-QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-- 
2.30.2


