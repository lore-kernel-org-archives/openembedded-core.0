Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC43C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 01:34:08 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3698.1634261647421136827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 18:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4t1sZE2;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c29so7041921pfp.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iK7rrBUOdynnyE5s+VA7BOhRzr4L2ccufFmcN8XN8M=;
        b=V4t1sZE2d5pwQbepEj6lKFfBypJD3Vf2UmW8w/g9V/W/AoWTs5mB7yxGJSvKP8/LVu
         ohsiUIH7aZHmQUlyR69SsA9946N/rJwrhdLmHxCIa9Z5krwzZJ0il7nKs9zBUQLvjhQ+
         k2v9HnxeVjkeyflLJoYxW5mowSvhCiIkLB3h7YqD8w0Thp8lMr8DiPiaxgo7IquuH6W8
         FJOV7tLIsNncadK+ZCdlaO3KfSbjV5zJtz7y1/4IAzOrG2vK9WrjgsNR9UNRyF3Ylds9
         Dx/UpkudfOX4iUaw9i0U9zQccvH9QtXQmJSl8JpPE7KeLaVVVjGQkiW9xxTElWGBp6Pf
         ic8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iK7rrBUOdynnyE5s+VA7BOhRzr4L2ccufFmcN8XN8M=;
        b=fQnDM+1/J+wP3ZiN5E4h5mpbWfwCoOAB07ylHp2Zh3nRMTOATUac+oeDLPyry1kbuj
         iibGQQZOdUtwqgCMs6EtGAV98vxgT+mj5crCc2iHgaQp0XBpOuXYjspmsj64bv2Swe+g
         Ffiy1vq+Og+g9IERi01yhV6ct9TwSmKueF68piMSHVWA1K9yKQxgfR8doCTnk/dD3sVF
         PwghAJq/YtsLks1GCZdyrZCpnGYfO3p4lIJSA9g2pf1JhCGmqfaVpMZ5Xy0etbgXpbsL
         snakf+OXrZYiGFswc7ZYVUMLA7QLT1DFTQvkA2dPsTIOv4IrEyjDUXHuBbkWGXkeByJf
         hUgA==
X-Gm-Message-State: AOAM532ngACE/jFWdoC8crpI9k2pVeS0c/Ug2fV07s2Uv8iMzi0/I2CI
	ma0acCBB3mfPrPVtuzebQKlvFgORmTLpdQ==
X-Google-Smtp-Source: 
 ABdhPJxEd2PQjI97B3VeBV6EjRjDfkAvtiBjXmDwuoGGE3+Y4lZVfoHRuqxXvK989p6ZHMSI4gqypg==
X-Received: by 2002:a65:5a8e:: with SMTP id c14mr6980623pgt.125.1634261646428;
        Thu, 14 Oct 2021 18:34:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 z15sm3707574pfr.92.2021.10.14.18.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 18:34:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Add knob for enabling PMDK pmem support
Date: Thu, 14 Oct 2021 18:34:03 -0700
Message-Id: <20211015013403.182404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 01:34:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156981

This ensures that libpmem dependency is added in a consistent manner

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54ffb85286..6c72409590 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -194,6 +194,7 @@ PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
+PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,libpmem"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.33.1


