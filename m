Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C20C87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:06:33 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.40652.1754885192754209223
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TEuiFcD7;
 spf=pass (domain: underview.tech, ip: 209.85.222.170, mailfrom: vince@underview.tech)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e80ba947cfso402197285a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885191; x=1755489991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kfSNVxnvqGWkvUTV1AsKCIm9rTbTCgDhEND2ysqh+c=;
        b=TEuiFcD7n0k8tA0QWqC27KtnahraQToHlvaPSVZRID5/v//Nm3tHpLxANFMjUVVE/l
         9uDwPjbQc9VVmfrN1CGBrbiQr1gDvYA0Y3aO7jWkLxB3d5j+a49DjDwsWfXqqfOEqsKg
         0MRk+rHrVrQXacCGktTm3iHP9U1OlY8iJV51b3Gejee7myO0JAGpAG2ANH6XnZrikJPQ
         c5Ks/jpPSiHXYV3XbdzZ3MQpObfMghzEhIzUlF0GUi9vEX/YvYuyQ9nQrLWKuPhthOUF
         1p4aTxqfPtmvzjQbfilZhQwNXTLyrayajZ9iGiP771hcto6vp3rhKJnSZ1ppH3SDTP4z
         h1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885191; x=1755489991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kfSNVxnvqGWkvUTV1AsKCIm9rTbTCgDhEND2ysqh+c=;
        b=vQNoEQJirvzvrp3lQZPSsKmumdho3cU7EeHFhpG40ojju4BjiAx1Rm540NZvfyV0o/
         pwLfBmTlr7eCC5pH4hh6stzcSsTeCg0aEDv5liIMYVIj34+4cEbSDzi5XyorlxnE+Zp0
         oBCJvr0iO/GOrXApE/aYl9Q7oB2hk9m0pS9aeXO3HX9Y7N7YGBri2kk49vv489j6Xfjw
         x3wLIqvn2e/x+6I/QrgQ3o7nm/YBZuhrURUqNc8mDuFqJW0eovCPghlE9TkfaBvUdElN
         qlVsTvMGrUYDGZ2cSSUBPZwhJlZuDQ5/Fhj3D2Y3XkKNK2Qu0tSETV4JzJCiHEtcmCuZ
         +FpA==
X-Gm-Message-State: AOJu0YwZLH92ngyAXcxtSS845r362x66shwFhfa9WFmQ/rtdPD1Gvg29
	NTl+lURocA79ykX3hvEOiWl0NfNNfwi1+tWPMazP6/dkS5E2STgz7KuhU6n8ItCgmrQuvv0EDiY
	Qd0ks
X-Gm-Gg: ASbGncsIAD7KiWzDE11rktdJyvpTs+6nQLHUhMv5wCE2G1+b6L/0V+td6WCIisBjO30
	329SNxxBTERY7EJsWmaxgTXwu7t+NfsZqB6rDRfOkAocN5o+4snFR+bhvWT6OIvgA0zYj9eUN1p
	kheAdbL2Gx1//ZyKn6I/11VXMYnIAlNTZ3PSj3snQPm4SBS0Qcfd0bzaboPomz+S9R8rk9h8BXu
	cUI4O8jWti8Y6BKuEm/2LeWD8cnMsr4qVwfsmkdNwidVe+xhKDk4EZPCD6yEG24ra7N1gsNV/US
	zXx+A5X8C1YIActFXjWVXnwZ+4WE3coXH+O1XT252fKWPpCDBEersM/jwo9Nwck0bVctH6sgq5g
	V3avJEMhEuog=
X-Google-Smtp-Source: AGHT+IHjqHLQ02P/t/vyYxkkMg9zB3PNz9q+c8z7b0poOdmtOOmTVv0s4G30kmYFVPDwlFRfzImTgQ==
X-Received: by 2002:a05:620a:4105:b0:7e7:12c1:8f93 with SMTP id af79cd13be357-7e82c7c96cemr1763085085a.63.1754885191241;
        Sun, 10 Aug 2025 21:06:31 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:06:30 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 8/9] bootimg_pcbios: add help and usage comments
Date: Mon, 11 Aug 2025 00:03:46 -0400
Message-ID: <20250811040339.857858-16-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221715

Adds comments underneath class declaration
defining plugin usage and potential
optional variables to set.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 1fa9d895bb..caabda6318 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -26,7 +26,48 @@ logger = logging.getLogger('wic')
 
 class BootimgPcbiosPlugin(SourcePlugin):
     """
-    Create MBR boot partition and install syslinux on it.
+    Creates boot partition that is legacy BIOS firmare bootable with
+    MBR/MSDOS as partition table format. Plugin will install caller
+    selected bootloader directly to resulting wic image.
+
+    Supported Bootloaders:
+        * syslinux (default)
+        * grub
+
+    ****************** Wic Plugin Depends/Vars ******************
+    WKS_FILE_DEPENDS = "grub-native grub"
+    WKS_FILE_DEPENDS = "syslinux-native syslinux"
+
+    # Optional variables
+    # GRUB_MKIMAGE_FORMAT_PC - Used to define target platform.
+    # GRUB_PREFIX_PATH       - Used to define which directory
+    #                          grub config and modules are going
+    #                          to reside in.
+    GRUB_PREFIX_PATH = '/boot/grub2'    # Default: /boot/grub
+    GRUB_MKIMAGE_FORMAT_PC = 'i386-pc'  # Default: i386-pc
+
+    WICVARS:append = "\
+        GRUB_PREFIX_PATH \
+        GRUB_MKIMAGE_FORMAT_PC \
+        "
+    ****************** Wic Plugin Depends/Vars ******************
+
+
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+    part boot --label bios_boot --fstype ext4 --offset 1024 --fixed-size 78M
+        --source bootimg_pcbios --sourceparams="loader-bios=grub" --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+
+
+    *************** Example kickstart Legacy Bios Syslinux Boot ****************
+    part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux"
+           --ondisk sda --label boot --fstype vfat --align 1024 --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
     """
 
     name = 'bootimg_pcbios'
-- 
2.43.0


