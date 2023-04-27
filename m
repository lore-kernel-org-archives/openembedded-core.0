Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BAEC7EE22
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:35:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.14808.1682580937717752169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wat/VfpQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-304935cc79bso2586654f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6m+FhGGlEwpf0aqPOhZ4hnLtuTn7FKXifaglrOzU5M=;
        b=Wat/VfpQiwGfXEcORy/bbMtxD4Qh1LgmS3Dcbv6qu6p6FhuZg2gWROQrupCEVjODrE
         /vthp/NZ4FMn5/RYfrTQuOZ1MxLkXz9tvxmpJ1QYMLog5FDR5syoAG6K1/KSLGwsl/GR
         Dog1d6a50rMtoqZVHP0MAXiVgHe3w8fMfriU4FI4gLcrTY4k2a7JK1p9AdtC/IE3r7ws
         Y7qxVPWXCN6dJHItqTTr/hsxVGv5iD5fz0jjRHzjIp4bv9i9ohgO5Mnn6Zrvq9iZULIt
         3YIaJ3O+aoptCXIcT7G6O7P7Q2Mk7vjxc2H4ALKTIzqHsSvxILlmyFCbyYn8vtakWKPn
         StPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6m+FhGGlEwpf0aqPOhZ4hnLtuTn7FKXifaglrOzU5M=;
        b=brri9vgMVWg0p80l6IMN+XCD/jFQNekoJfu8qeF8I8sUD/f1xKpI1xsKdJ/UkV/hiy
         hbC0ZDugiYdvGW9YtM694xEsihnw9Th5FX7QVtix3bHGlNajcjV8NNNFidhylaoPTcQY
         hLUDvUfGLLS6Ct4G6pcHkwNpYOWnwdeXhCEEWBgFO+Oh2T+eP9K5xOiW02DA/JPmIg/k
         UKA3tIkr07TTt760DjM5qyPim6kJG6/7wC/ZkUQZBMp040WU10vR4JiFsqOPT8a1ZDAl
         CaRP6EQqtNfKqsez5/wcXmtll8zSgJAUEVagVBSReMXRrcduRS7lHEu9M61HtFhLZsZi
         HGPw==
X-Gm-Message-State: AC+VfDwn4RBq7lllzeTYNdwLVGfylZif9rE13Vgyi6SVq6URfnvy9TJj
	4U7WvsLKnOodhVFyzDobNo4vT9hWeVw=
X-Google-Smtp-Source: ACHHUZ4IDklXVKZ9QcRtmrvm6bXk1PjHpXuCbI0c0jh7K8f/YndEKk3Oo4xLttlxPnD9jLnwfKAv4g==
X-Received: by 2002:a5d:5543:0:b0:301:5615:26e4 with SMTP id g3-20020a5d5543000000b00301561526e4mr609832wrw.32.1682580936150;
        Thu, 27 Apr 2023 00:35:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm17678411wrj.34.2023.04.27.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:35:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] dhcpcd: use git instead of tarballs
Date: Thu, 27 Apr 2023 09:35:27 +0200
Message-Id: <20230427073528.3956414-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230427073528.3956414-1-alex@linutronix.de>
References: <20230427073528.3956414-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180478

As announced here:
https://roy.marples.name/downloads/dhcpcd/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 579fa95df70..21b2eebbd8a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -9,9 +9,7 @@ HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d148485768fe85b9f1072b186a7e9b4d"
 
-UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
-
-SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=dhcpcd-9 \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
@@ -22,7 +20,8 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
+SRCREV = "3c458fc7fa4146029a1e4f9e98cd7e7adf03081a"
+S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.30.2


