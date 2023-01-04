Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5611C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:18:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10525.1672834715183963889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eboIiaqQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so19540945wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 04:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbHV1Co9g1YDYCom1Vxshi+hV9Ubn39ifN+K3n76azY=;
        b=eboIiaqQc7CsAn8mslCzd5neim0rKZtZx/jEHX2Giv6QDpyhusBxxAivIDtyoOzinJ
         GpA3AqXFlLag/xziPEU8Kq4oSDeK2fvCRXW7TUum48oeMAdruUu19qowIfOIaQUvIVd7
         3AjoH6XNXvC4MU1npnEUe7St30KT5fbi87dJ/WXFkHKjnQnm7cPAIq1xgUzxXuDYERoQ
         KNnaoRzGxOO+UoWjRcgaqqnqSwhvUmfmaKqp+oCZg0K//fDXk0Xu4m9IZIQW13f+jgQM
         0JKBFvOcBEFsxnvUr1CVDTW1QufoNu95+GQ2M18M8iNzXVa1vIPqyvQH8Ax768d48acd
         KqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbHV1Co9g1YDYCom1Vxshi+hV9Ubn39ifN+K3n76azY=;
        b=cdkKHCcwlbWtdsb+IFpensQzvyeHUZQODMzQd6J77pJQK5Pvy5S+1mm+Q3WRj1rSuM
         MEyiYT7pSEyUGdpZI6CTioXAphTfKkBPyus0E/a8VqxvzvmNOmIP1eXB0JmC3+RzcCcS
         /NfTMIffKN+65dWkTpgXFJzgQGdA/7PFqtdanG/+MWO9ALOTQmkhGy5A/7ntUvsvLn5/
         f7/ixeh9AQ/sRQbLDoXT+qDOQOHNy/F1ib3YUdPDQkED0vEmorNcIHhHm+I4FTN/UqpD
         ogz96VE6ZF5J2HbD8+pFvdDtm1ZrVJ4KsIcp4/N+zXDkcwTth+3iti9Xru0Ra3lFou+l
         eLIw==
X-Gm-Message-State: AFqh2koAGecAtVMor/STKooiBWTAXZGpYkm4vyEwo5bxFSK/5BnQfi16
	EFigRpGeFSHzQOVjd1R7AFZ+3tmZAM8=
X-Google-Smtp-Source: AMrXdXuQqoRy2OMbagMRug7roE5wo9TjcIJs2qsp+EYxvKngog5Ao+odmpyr1xqGNXwgpXV1avdo4Q==
X-Received: by 2002:adf:fec6:0:b0:26a:ed4c:e3af with SMTP id q6-20020adffec6000000b0026aed4ce3afmr37046056wrs.49.1672834713319;
        Wed, 04 Jan 2023 04:18:33 -0800 (PST)
Received: from ThinkCentre.fritz.box (p200300cfaf4b81003e9287465d6a8a6d.dip0.t-ipconnect.de. [2003:cf:af4b:8100:3e92:8746:5d6a:8a6d])
        by smtp.gmail.com with ESMTPSA id d11-20020adffd8b000000b00236545edc91sm33564176wrr.76.2023.01.04.04.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 04:18:33 -0800 (PST)
From: toertel@gmail.com
To: openembedded-core@lists.openembedded.org,
	michael.opdenacker@bootlin.com,
	richard.purdie@linuxfoundation.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
Date: Wed,  4 Jan 2023 13:18:08 +0100
Message-Id: <20230104121808.1065203-3-toertel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104121808.1065203-1-toertel@gmail.com>
References: <20230104121808.1065203-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175471

From: Mark Jonas <toertel@gmail.com>

If DISTRO_FEATURES includes ALSA then automatically load the
snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
machine configurations conf/machine/qemux86.conf and qemux86-64.conf.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 091003ed82..c8a9b0a1e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
+# sound driver recommended by conf/machine/qemux86*.conf
+ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
+KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
+KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.34.1


