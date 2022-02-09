Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C902AC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:20 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.29853.1644427819557595753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UMPtCbz6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id o3so2388934qtm.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7vAclrXXDDHN9WRDZ5nhJtQtlx+oTJpWwUSuc8GpEoU=;
        b=UMPtCbz6NGR5rdvZcpzzAOFg0hNomP/uoV2FnWjG17joQLD7i+lUQ3yd0HmTPBOY5I
         Dvzq23MFPANKTApXmhQXsFpk5T3Azd2eVbr1HqHmJwCoIldhV5c49Fy/UVeTzTHxEF1Z
         GP7BYP2VXtd5Qq+jDNZU0/VY9LCWY6mlPehx7X0LNJDHUxXa4x+fgvxaR/YUAmDkWVar
         mOsIv1FefkJ/fhtElSt+x4ZPfgX42um+kGI1m+mtJf61TuNw7cUj5jgCF3dgznRRfS8E
         JfZ02NL2iIT76lV3uJd2w2WV+lhYraTzJljzqC2eq3lHdVBMdo+iAGJbUlWngt2zKeA0
         4aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vAclrXXDDHN9WRDZ5nhJtQtlx+oTJpWwUSuc8GpEoU=;
        b=YgIFXEH3Q8geYL9pKHz39FAciDJfzzsZDDBWBZ14B3MExUQCOq1mt3FL0StLepAERN
         waWAM0fIvd0hvdFjFlIwWiFpJWfXkvyyJN/cU/ppxXSO8Zt58B5N5tspXVaNDTLCF51U
         0EhFJjcbIz9qi78eqM3OCaymvR8UHEilTOjOR69noKrMvKkfimp/qEBvoYNKvNreouw9
         NLk6H5tqbVwnKsih//dvGkbyrNIpGguWSWZKIvYpbpMjFhdaimzlEh2vfaruo8sRPBFw
         7AimQbif/wUQ5Enyso81gTjC5ttFQtA6EltMID1GRxZOyi3qkKLoTmTqugK8AT1Da2Mc
         DLhQ==
X-Gm-Message-State: AOAM530FsL13gN+TraKHha80+2Dv8N0lNITJP7gCQau+rHfmMXG0DfO5
	MvIBu0UDMauOUd0j8iBqu47rZO7Y3og1fQ==
X-Google-Smtp-Source: 
 ABdhPJz4oNds/2VlZDIWM1B3xBO2TdkOe52jgb5wT1pcEgjyPG6QWOwtmxr8dz/8Zfsyd+13OJk7Cw==
X-Received: by 2002:a05:622a:54d:: with SMTP id
 m13mr2114970qtx.421.1644427818572;
        Wed, 09 Feb 2022 09:30:18 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 u9sm8855477qko.110.2022.02.09.09.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] qemuarmv5: use arm-versatile-926ejs KMACHINE and add more
 virtio devices
Date: Wed,  9 Feb 2022 12:30:13 -0500
Message-Id: <20220209173014.1389378-5-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209173014.1389378-1-jdmason@kudzu.us>
References: <20220209173014.1389378-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161573

Use the Arm Versatile 926 kernel configs and round out all of the virtio
interfaces to match other QEMU machines.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf |  8 ++++----
 meta/conf/machine/qemuarmv5.conf | 11 +++++++++--
 2 files changed, 13 insertions(+), 6 deletions(-)

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
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 2dad504c9932..863379ff4961 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -13,9 +13,16 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-PREFERRED_VERSION_linux-yocto ??= "5.15%"
+# Virtio Networking support
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-KMACHINE:qemuarmv5 = "qemuarm"
+KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.30.2


