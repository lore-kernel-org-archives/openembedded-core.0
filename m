Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DCACCA486
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4011.1657773374978894593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QunI90Sg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so1474012pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ASIlKCpmT+Y+8CoSq6Zyh3cStANG0AdTv3MjnqXnZV4=;
        b=QunI90SgCabvQ7tkC7f59hRf2pRQOHLSVeU2ie1EZMmhF8XfGi+dmBQKjW4bOmuT0l
         OqNhbEKbrY9NT6kOJ3Z3owl0BDXWsqihR6Txr8rg+VHIOfdXBhrkmvhsVsBgBZulQ5N7
         DAujyG+UC/2Zz40iMV4BwHgKff5rk4wUjEwRXTwqIMN8cU+/HSk9+dEM/QAKf7wAcRoC
         92jHNq696NBOcwO7XUMnUy63t3ogF+T/GmJQQzK3K5dn/RNvEqX898STXE1UGha7gM7F
         Wva/nRa7cdBdIQtSe6WVfPTr+fe1ZUJk/zfdQuOs3HZlZpeb+lSTfmU9WJgwin69hv0Z
         kWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ASIlKCpmT+Y+8CoSq6Zyh3cStANG0AdTv3MjnqXnZV4=;
        b=UT+vPQdEt/SyT5C70mMvUWTQt13tM6pkXUgMhM30ZMZ/3XsYcJ/sS/bTUohztr3x7P
         Bg+iipxU+SvC5J2ERXdr8dMPfb4EN1DjY0AnWCv50tE3weI2Q0i/IJ1cpC7xXov/5GgB
         X5VF5fd5jiHeLbqrPHkT+wxZkNMQETC284QDP/hYm3NouyMEaq4SXSaoLa+GaVlDxlHb
         egTdHHXJ5CYCEcVDI+b47H2HnRQN/NrKTZJyVGtBrESLkMCI0gmk+ogVrMbjFexxd8WQ
         OL/6qvFgZWlzeX+E1eQ8foDHsd+33sPb4u5Di8P95V2hfYef0gB3H6R9p14B0nnGA1Gr
         0n2A==
X-Gm-Message-State: AJIora+rPl6Upq1qt705ium4yrUA7gX3IDv1JcdtZbwdH10qQOeXCt7/
	2qds56avmK7OttiadzmNOsSy1OYJB5zHIqvY
X-Google-Smtp-Source: 
 AGRyM1u/ek+DoiweYeFVVG6IU9dFWbxg+WNvL2zubnK1fqmLmRpUc84LMY1Gmg+asS8nVdFnroUGpg==
X-Received: by 2002:a17:90a:1782:b0:1ef:cc5c:411a with SMTP id
 q2-20020a17090a178200b001efcc5c411amr7928022pja.147.1657773374012;
        Wed, 13 Jul 2022 21:36:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/27] qemu: Avoid accidental libvdeplug linkage
Date: Wed, 13 Jul 2022 18:35:24 -1000
Message-Id: 
 <83ab9f51f45b73ff595fbb8d519eee4f4d48e308.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168001

Avoid accidentally linking to the vde library from the host by
adding a PACKAGECONFIG for the option.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 189e0d3f9e..8c5a649c76 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -201,6 +201,7 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
+PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


