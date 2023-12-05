Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF70C46CA7
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:42:41 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.1729.1701801761180561318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kE/ZQMLZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: jandryuk@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-77f035e4dabso195880785a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701801760; x=1702406560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeZAazw9D4pXSE+tgHzZViIPvDmQKXIJ8slnDn3+drE=;
        b=kE/ZQMLZR6F3PFj8mvKhsWoVx3SEhfXQPKLO94NEaF+oTvb4y7ZWkgZGjaLnJgR53P
         +jqhLlVsBNavJ+iO6fG22JOf5FXmeE/RQijBUdP5n9NzfP1a7Her/0Uaw3+S9idS9ExN
         W5UMc+A04lt9aiXKafUDNhdezYOMNnVcDSRFK+fYii+pHnkqoTQsa7XjS/WR3hvFhSwe
         uWQ2J4lWslh3IPv+o18WMgj5xhqFmFxFCKfrs3714GwYbMZu/guRckFFHfnIgPAsrG9V
         8QefNd+iIaMDyCF0E8TR6MsWP0yh0u/cG9tRVefpVqHA0EPAo43YzMCOj69MC4mRQUB4
         Tizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701801760; x=1702406560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeZAazw9D4pXSE+tgHzZViIPvDmQKXIJ8slnDn3+drE=;
        b=mn9VwbgopYzR+5nyIz14jrZCnuIUaQ5EdBwJWs3hGTwVwX3o2zN7I/JkBeOwGuKlLx
         F3l2Gi746gDDjU9x56/2MwXcL7VIFK3K/B44Ab1UZLEYVFZA4XKnKEgQHjw5fV6HDAKD
         Z5OL1sd1fwUTpK6k3lm+NQhOmizJLYLj7KEyf/8WPsl3AyQJc+ktH2VB0Qp/k7gASRxW
         uqolHzfiZr+oOwmu7Z8U4N4KjXxo3RcV5OAZtreisv+uOI4c8muP0GJk+20+gscExqPb
         5rcUFP0At4kQHOY6d8prLjG8N3RwW1u79gZjdzMn92j/N7V0fzKqrHbyjhxqFjzd0pTO
         kqYg==
X-Gm-Message-State: AOJu0Yzsx1wQSxEgKlE9RPCadlmfoGPaVjzxKVTw8Di/9ABdeuJ1TSUW
	14hySOMyL55VZiddLsAcbaSpLUhdpNQ=
X-Google-Smtp-Source: AGHT+IFLZbbcpFRTmH3v6ZK/w/KYmfeXFwtnjCmL5rkD0Ok+29EibM5CqU9UueQwObshd6FjWZYr2g==
X-Received: by 2002:a05:620a:1a21:b0:77f:21f:8e23 with SMTP id bk33-20020a05620a1a2100b0077f021f8e23mr1665630qkb.31.1701801759726;
        Tue, 05 Dec 2023 10:42:39 -0800 (PST)
Received: from pm2-ws13.praxislan02.com (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com. [207.172.141.204])
        by smtp.gmail.com with ESMTPSA id uc7-20020a05620a6a0700b0076cbcf8ad3bsm5267386qkn.55.2023.12.05.10.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:42:39 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 2/3] linux-firmware: Change bnx2 packaging
Date: Tue,  5 Dec 2023 13:42:05 -0500
Message-ID: <20231205184206.30387-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205184206.30387-1-jandryuk@gmail.com>
References: <20231205184206.30387-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191861

The bnx2 module uses both the mips and rv2p files, so package them all
together.  Remove -mips from the package name, but add an RPROVIDES for
compatibility.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 .../linux-firmware/linux-firmware_20231030.bb      | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index b849c086b6..a1229e4827 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -340,7 +340,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ice-license ${PN}-ice \
              ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
-             ${PN}-bnx2-mips \
+             ${PN}-bnx2 \
              ${PN}-liquidio \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -1087,18 +1087,22 @@ RDEPENDS:${PN}-bcm4356-pcie += "${PN}-cypress-license"
 LICENSE:${PN}-bcm4373 = "Firmware-cypress"
 RDEPENDS:${PN}-bcm4373 += "${PN}-cypress-license"
 
-# For Broadcom bnx2-mips
+# For Broadcom bnx2
 #
 # which is a separate case to the other Broadcom firmwares since its
 # license is contained in the shared WHENCE file.
 
-LICENSE:${PN}-bnx2-mips = "WHENCE"
+LICENSE:${PN}-bnx2 = "WHENCE"
 LICENSE:${PN}-whence-license = "WHENCE"
 
-FILES:${PN}-bnx2-mips = "${nonarch_base_libdir}/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES:${PN}-bnx2 = " \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw \
+"
 FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
-RDEPENDS:${PN}-bnx2-mips += "${PN}-whence-license"
+RDEPENDS:${PN}-bnx2 += "${PN}-whence-license"
+RPROVIDES:${PN}-bnx2 = "${PN}-bnx2-mips"
 
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
-- 
2.43.0


