Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED39C5518D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.8141.1650463718107042233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=u56xE47+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so5067497pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WJDeZuhNg9o6CqmzNkbeh8aC8cV3lgV4SRwFyfmRc/U=;
        b=u56xE47+8uK3pm/W+ZxrjfrVm8jBBZ3CSipzrpPf2cqt+ht1ClenihdfhjOo2ySOvm
         1rqWKwKZ565JRDBlZ5VHIB9olHYQbv6mgZ66BDckgOPRd5DQNH5W0gVTGKQ6h2VMShiQ
         vnTfx6ETGMuUyPo2emgwDIFUfP/8NkaFbvHSjOZlFEcbiTfJ/4D2Hcbkwu6djJ01rqoZ
         3FtIU1dCVpaVfQQxHEaw5BsOXL4G13y9CBFzS+R4p1fSx80KyWQgpQuGnQUQld56/G6R
         aVX8yztCuuo1StLuULL/YFMA2tNUuWWhmsNkvAjl7ecsM+yZC1KJ/zcfStuM92TABpMw
         4DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJDeZuhNg9o6CqmzNkbeh8aC8cV3lgV4SRwFyfmRc/U=;
        b=Psvp/2+ySbvw7HWZxFG5GL440HaOt4lerWvPiiKF/AU2gAm7HFOqZACnVaLYeQ/EjS
         +L/mcSOvcx749f5mWALi5q0XAfFJ4ZQdNYDpNmhs/FUhTi2IqWNt+6AA4hq+uJKxi7en
         yKjTDzARz4jDWBnOeA6H4xOwLZrfY/vNEpZFIivP1u9TIyk6lXZTNqkTQlFq2v2tqWm8
         dCw+3X7rI+xi8h+bRPmmRIELz5pNMWuWUoOLhVRog1Lp+/Jf8BvZThRriQLN8wXBJjQh
         oHZczOmFwH8w049+/5MDDSidWwj3LC1mtVgUj5nJGzDsk0ZWCrSwBS1aG0Qq1dRZZ4wW
         lGqA==
X-Gm-Message-State: AOAM531ZxvNnzKkcFhZcB4Y6Ryj9uroAotP+PA3JZqqdt+9CBdWR/05p
	Z2sYJ7W6MIFMErDgeP7eWB6oTW2GzdHZ7zzU7RQ=
X-Google-Smtp-Source: 
 ABdhPJwbW7aW69dsmuBRneiP+7zYa+QwE3tFcHXKVfsEP6ELL7akyxsqfQZs7U0k59CrlbKEm8VdBQ==
X-Received: by 2002:a17:903:32d0:b0:158:fe2e:d2a7 with SMTP id
 i16-20020a17090332d000b00158fe2ed2a7mr14221024plr.93.1650463716952;
        Wed, 20 Apr 2022 07:08:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/27] qemuarm64: use virtio pci interfaces
Date: Wed, 20 Apr 2022 04:07:50 -1000
Message-Id: 
 <7426b5349e5a2872ce8f963be35ad11dcdc4891e.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164670

From: Jon Mason <jdmason@kudzu.us>

The virtio PCI devices seemed to be required for this machine for some
versions of qemu (based on errors from running qemu saying that the
devices don't exist).  Changes to the entries here is all that is needed
to get it working.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217deeb43036d1a046d6c5ea2c1ccdb94d3d605a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemuarm64.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index f245152168..ffc51c803f 100644
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
2.25.1


