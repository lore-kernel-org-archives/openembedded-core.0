Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA75E81DE9
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:36:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.10528.1696592206172016476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DXzQqDWF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1966788f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696592204; x=1697197004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lRgZdvscs3+EEh0ppKH3AZ+FQ+x1t3dyMdKq9vNblE=;
        b=DXzQqDWFdUlQvVWhm4J6hYERvXW/eU497EyyXezbKKv3l2r6l9DvQQZ8jgnveefXHC
         Zf/TbhyJwNZeieg7cdMCzfiHwrXfqY0ZYhEsITG9mXrYT6jUojF4ykT5HCJ/YWR1Zotp
         5Tlt/LHg6VE4kCCcag0xbn2+9LbKGhyUTdIy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696592204; x=1697197004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lRgZdvscs3+EEh0ppKH3AZ+FQ+x1t3dyMdKq9vNblE=;
        b=YdJcZvsnWWdB7K2sB4d8IeWAJf/N4doTTHLtF0lWPhpgDWeB8G6y9SNXJj2d6/e3ii
         GYTV2cmyk7FhKXxwRkjzBu20fJCVl0g3gwjRO+WRKPycZ9tOQW3XcTCVVkJAwI+5KVAE
         i7C4ev6MppNAliU6PtRz1DmSryoJMsWuDB7k2YNtrfJ3ZslYa9C9mrtyW5D8X6Nyt4xJ
         Th9JCCc5VKqo8Ac5naiUVrAzY6c1oDTkrrxHbtYQoF3sHTYXMNczU3xQcb8VzP9IZr+P
         ksh04V5/p+n1UM3zTWb+Qn61tBnrMvpjx6ZJlK8OuMVncYg1vLFOMJy3YAsIn2akcMaC
         y6gA==
X-Gm-Message-State: AOJu0YzXE5pLwnP++3zu7YyNJXtOR8rYm/wBDnjA15BxJRMC04QOIF+E
	BOUDxIlHhkR9rJLpQSJp+UN8KMiSRD5qNL+wNSY=
X-Google-Smtp-Source: AGHT+IFfYXEwdHtAHXFJvyvdiIHo5By/qRdHcC4d3+elVahmdYZufShpFnsk16HDDPQz30iXeRGc2w==
X-Received: by 2002:a5d:6042:0:b0:317:4ef8:1659 with SMTP id j2-20020a5d6042000000b003174ef81659mr7086917wrt.28.1696592204346;
        Fri, 06 Oct 2023 04:36:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id m15-20020adfe94f000000b0031984b370f2sm1449098wrn.47.2023.10.06.04.36.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:36:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemux86/qemuarm: Drop kernel version overrides
Date: Fri,  6 Oct 2023 12:36:41 +0100
Message-Id: <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
References: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188762

Drop the version overrides for the kernel for the x86 and arm machines
so we can go back to following the distro versions. The reasons for
these versions is mostly historical at this point as the issues were
resolved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/x86/x86-base.inc | 1 -
 meta/conf/machine/qemuarm.conf             | 4 ----
 meta/conf/machine/qemuarmv5.conf           | 1 -
 3 files changed, 6 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index 050c20af70c..fc6c39148db 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,6 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "6.4%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 04216cdc2e0..881733eb2da 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -28,8 +28,4 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 
-# 6.4 causes Xorg to fail to read the virtio framebuffer so stick with 6.1 until
-# that is resolved.
-PREFERRED_VERSION_linux-yocto ??= "6.1%"
-
 KMACHINE:qemuarm = "qemuarma15"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index deb4869c0aa..f0a86f1e4c7 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -16,5 +16,4 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-PREFERRED_VERSION_linux-yocto ??= "6.4%"
 KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.39.2


