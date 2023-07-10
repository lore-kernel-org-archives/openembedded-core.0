Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917D0C001DF
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.32114.1688959241234911655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UF27kxyN;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6355e774d0aso22186466d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959240; x=1691551240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeldNYZTBK+YCxNePrlJ+CKmRrJR5tB7u3R/h65/hZY=;
        b=UF27kxyNHkK107D6rTZyRc+wBfQJt/n31MkMc/L7JaFwaNsI9o1rAkeCuEijDbqUwg
         6g5r1P5O+jFuR+DI0RpcQ4osQqCWVSJDoUeLCqbaBiU/8S3Htlzbk1GWCMIkKRRz6o+m
         XHF7gUkAL+XUp5gfxgdB9v0DER1gjYLnvUCtdLjjqec4EtS1hR/Vum/uJa4wqoPOFK2G
         7iVUTuZydcOKmlfIGbUyfgTBdD5nNSFSdA07DDoNRDHvVSrzgRLQu5cZdqBXiHBdP0CK
         4cQ4JZ/spa7cIjAAWEHgeRDNA4Vna2VFtWX6WtwLz6ytR6vAHkNu7Qdo0yVbzgP+haTS
         vKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959240; x=1691551240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeldNYZTBK+YCxNePrlJ+CKmRrJR5tB7u3R/h65/hZY=;
        b=GTxdEmo/U1847q0Qu43QxzEu8xPpFRlwhX8FQB68Gr7Hs675kXfimtq/xEk+uVhFWv
         g8EhsCD7SAao5axcnGxR95L6ZqnrAj4mDdpte0IEuVzk+QtdbCXs1euk43IsPB3FbQYU
         gO9As6IN75dTxTMMpGAaV7xi5DtRqRCTx61vdVxbNbko2Ilo+FyGmvdH4fnjr6HwwE2Y
         AwHJ3B5C/axtCp7ERaQSeP/NzDSDDKG5aI4qiBSpfJ0vn/8cwnFgYE4ji5uA+Ga2q+HF
         vwXw23PO/buD5D4injbcHm2X2rT6ESCR618O0ZAWI2QgTGeUZCQi53thkQj0qBEvI8fs
         SHTw==
X-Gm-Message-State: ABy/qLaE/F80vbqFbEn0oZhoa3kQrFou42iVvATZ5oWo0yUUxwErgnrv
	uYjBlNNw00z5a0qN48q9hBU=
X-Google-Smtp-Source: APBJJlGXXCtjcXIkdRtCdVGwopYWwmLfm6TSVFcMelRoqxD+Beeeyp1Uf76HwDQZgd/t3hMXGCOwKg==
X-Received: by 2002:a0c:e34c:0:b0:635:e113:a0fd with SMTP id a12-20020a0ce34c000000b00635e113a0fdmr9878623qvm.33.1688959240300;
        Sun, 09 Jul 2023 20:20:40 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/15] conf/machine: set preferred kernel to be 6.4
Date: Sun,  9 Jul 2023 23:20:24 -0400
Message-Id: <b12e8190a32b17701d86220ec8ec6e775496f706.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184055

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index c3cc0dbff6..050c20af70 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "6.1%"
+PREFERRED_VERSION_linux-yocto ??= "6.4%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index ef1b4ece23..deb4869c0a 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -16,5 +16,5 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-PREFERRED_VERSION_linux-yocto ??= "6.1%"
+PREFERRED_VERSION_linux-yocto ??= "6.4%"
 KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.34.1


