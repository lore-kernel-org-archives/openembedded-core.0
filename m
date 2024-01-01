Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64533C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 21:32:02 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.15506.1704144714513150693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 13:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=diaYNgGq;
 spf=pass (domain: underview.tech, ip: 209.85.222.170, mailfrom: vince@underview.tech)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-781048954d9so764355585a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1704144713; x=1704749513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s94OXJ68e/6W4/mvgHJXKZtL5V4HOvy5X2/mTC89sk=;
        b=diaYNgGqyx6nlLe4WplCEbahEUcGvxixx073nUlyaOJMBl/a+nUIUWTwyfoLxQt+OI
         MxVRSQv59Td2KsLiiVMcEHtkRDKK3G06hZq0xsPEeMOGf2ClcqfhFLVs84Ej/nkytpeE
         WmDLd9A6pQHqx8KXHOJNTlOqX8mtziKgAuJWk+7ds/6d88h9VQxQKn24BsBMfpamRd5c
         Pb1TxtWcAmOy5m3u68yxbmRNR/8vZd7azJH4Crta5HN9i8kJtDVFbSCgpZVy6zdwmjr2
         n3qKxBoQPcQMpvZn6s0T0/mYnGOXQkB3lUZJLJ/NlnkWheF19Zj3Y43RKP3aF4ltyoUm
         GfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704144713; x=1704749513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s94OXJ68e/6W4/mvgHJXKZtL5V4HOvy5X2/mTC89sk=;
        b=WN80VqSMhR94Dw/1KMubqGKeolJHlTGQUYCAWGr8b+EdrOAQB3eDE6GYEL+FSXRfkV
         LEiwX3mh1L7EkNd6nLVEwdkdH2VYFOIqcqs7FTsLfXUkB5IRpbw80xjv3IcDJ3/Kbrao
         AmCqmCrw46eVoR+FD8adz90MAao5NXnY4iEfBfA2FtPP+h0prcgLiabKMJa+6vana3uU
         0UHfVToBhSr0WVvRDAtcwj6bVNCgYaKcmdnqJofPfXYuF/IXF1iXDFrt5Tc//6kp+V2Q
         +Ryly1cNFTU4aqdlhQg0aJyoeT4hziB3DWpLfGF5HurJ14UXyDcHj270tFg5NFJA18by
         jEKA==
X-Gm-Message-State: AOJu0YxTrgO0m0pWxPgPX11Kwp2GJvmSzU0nyhNaoASwWOp7EaZuQdqh
	h8OGJKp9G4N4CGWfM77RivaHJSmpK/bZ33EkzA4ayaXwVcI=
X-Google-Smtp-Source: AGHT+IF3bfwfw9aAg9HJJBAympNvqI110LqVbMqv47LldzGGAL1LGbinEHXz5RUhagjpmko56Txx7g==
X-Received: by 2002:a37:db0a:0:b0:77f:accf:35f6 with SMTP id e10-20020a37db0a000000b0077faccf35f6mr17979127qki.7.1704144713384;
        Mon, 01 Jan 2024 13:31:53 -0800 (PST)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d00:a9b0:c204:4786:6cc4:f4b8])
        by smtp.gmail.com with ESMTPSA id pb21-20020a05620a839500b007811da87cefsm8790486qkn.127.2024.01.01.13.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 13:31:53 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 2/2] machine-qemu: implement XSERVER_RECOMMENDS variable
Date: Mon,  1 Jan 2024 16:31:17 -0500
Message-Id: <20240101213117.437651-2-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240101213117.437651-1-vince@underview.tech>
References: <20240101213117.437651-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 21:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193191

When building qemux86-64 machine run into

nothing provides mesa-driver-swrast needed by
packagegroup-core-x11-xserver-1.0-r0.qemux86_64

The XSERVER_RECOMMENDS variable will put
mesa-driver-swrast into RRECOMMENDS of
packagegroup-core-x11-xserver.

This way error nolonger occurs.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/machine/include/qemu.inc | 6 +++++-
 meta/conf/machine/qemux86-64.conf  | 7 ++++++-
 meta/conf/machine/qemux86.conf     | 7 ++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 14feb86790..6e97b94d47 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -6,11 +6,15 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
             xf86-video-fbdev \
             xf86-video-modesetting \
             "
 
+XSERVER_RECOMMENDS ?= " \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+            "
+
 MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
 
 MACHINEOVERRIDES =. "qemuall:"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 14873a3b4f..ae9e581fc2 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -23,7 +23,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 # This is because gallium swrast driver was found to crash X server on startup in qemu x32.
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', \
-           bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'mesa-driver-swrast xserver-xorg-extension-glx', d), '', d)} \
+           bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'xserver-xorg-extension-glx', d), '', d)} \
            xf86-video-cirrus \
            xf86-video-fbdev \
            xf86-video-vmware \
@@ -32,6 +32,11 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
+XSERVER_RECOMMENDS = " \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', \
+            bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'mesa-driver-swrast', d), '', d)} \
+            "
+
 MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1e072e1ae2..e8a267734f 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -20,7 +20,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
            xf86-video-cirrus \
            xf86-video-fbdev \
            xf86-video-vmware \
@@ -29,6 +29,11 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
+XSERVER_RECOMMENDS = " \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', \
+            bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'mesa-driver-swrast', d), '', d)} \
+            "
+
 MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
-- 
2.34.1


