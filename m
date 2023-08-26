Return-Path: <sveyret@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A76C83F13
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 22:23:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.17847.1693088617600518376
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 15:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FT5NAMMX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sveyret@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fef3c3277fso6576195e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693088616; x=1693693416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4l0Zk3aHkU1ivs63V+w+tEe4bd8vMgnusMa13+17qc=;
        b=FT5NAMMXQH6mL8LNC1XqvPebMGjxnGjQPOQaT0LnMod7diZbrDswynSWKJoOq4hw25
         9ZL4lQ4SiHHBwXVdBDwRXD98OmgEcwYtm4WzgT3PNBLslrvrOkEQ8hePJy5Lea4Pblpt
         H3tAHDfT0LC78nuEJqkb7iaOYP0SAf9jT7NfqieGxvzfRJqZWkBBAm8/FgstBq4ES6CM
         7GBI/2PT4d/+Y5vDacvLNEZDJvjaqk/qrmsLfRHgwPsmFskJeGNW2PBaZuHanACqYNS/
         cR2Cr+Qqb8vOKydmJBbP2tjdAU2M8W8ZkMSMAKJvwKyNvGHN4M8g9gFN6SpiNHhLEXm4
         g55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693088616; x=1693693416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4l0Zk3aHkU1ivs63V+w+tEe4bd8vMgnusMa13+17qc=;
        b=k4dzAsSm/8JrkuWhUqLp7rQj/v2fzu5VeDDOQV2xfJMOtgeos55RZpeJH9CzXD1NOT
         XdnDZr8K1x+j1FJIDcj5DLoiIcGjSpOls4EqBLU3dM3ijSo3z+APOnMSVVpZQFEMvOBV
         2vGAUAGevVnib/JogSbyezP8E18pMIGt1MktayluUV4VcUm3vMTWCTL8tPzpdo1AtuwB
         IWvVm+E7uOh4lGIQpumrpFhjR0ET/p9ZzVulwCvNetGRKY7WYaS6DqVBJFXYif3ksJtn
         FbcEp2mIFKcWaT/QOgNP1MaL0D6JZvB+iWMknqTYg/yNh2GyH60BMETWrY/hcFphKLOP
         h9iQ==
X-Gm-Message-State: AOJu0Yx3sf+nd2km1hxvTdxcJZ8+TsBmJoj2F0Z4KcAcO9ZuLEv4pVnG
	iAX3JPyQEgjr+DlpGRwNDk7iXWR62Z8=
X-Google-Smtp-Source: AGHT+IFDsSbYvj6hL+VjU51MdRzWiKJbZoRFhSOQ0pc5+79uWQUMvQXJ2B6X9e5wXsjoGvUYUTOunQ==
X-Received: by 2002:adf:ee4f:0:b0:31a:e54e:c790 with SMTP id w15-20020adfee4f000000b0031ae54ec790mr16517784wro.6.1693088615875;
        Sat, 26 Aug 2023 15:23:35 -0700 (PDT)
Received: from buffy.int.neptura.org ([2a01:e0a:3ed:3de1:ef11:32d0:af22:f04f])
        by smtp.googlemail.com with ESMTPSA id a17-20020adfe5d1000000b00317f70240afsm5880624wrn.27.2023.08.26.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 15:23:35 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Subject: [PATCH] nfs-utils: Add needed library to client
Date: Sun, 27 Aug 2023 00:23:07 +0200
Message-ID: <20230826222307.32183-1-sveyret@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 22:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186766

The nfs-utils recipe creates a nfs-utils-client package, which can be
used if we need to install only the client side of nfs-utils.
Unfortunately, rpc.idmapd is part of this package, and requires the
dynamic library libnfsidmap.so, which is included in the main package
nfs-utils. Therefore, nfs-utils-client has a dependency on nfs-utils, so
the server is installed, and try to be started, even on system where the
appropriate modules are not present, which causes errors.

This patch adds the needed library to the nfs-utils-client package, so
that it is now complete and does not require nfs-utils anymore.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
index e703395cc4..35cf6af6d4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
@@ -84,6 +84,7 @@ CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${sysconfdir}/nfsmount.conf"
 
 FILES:${PN}-client = "${sbindir}/*statd \
+		      ${libdir}/libnfsidmap.so.* \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \
 		      ${localstatedir}/lib/nfs \
-- 
2.41.0


