Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB651C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 19:01:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.23202.1640199680020530046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 11:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ie0lGPU7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id i22so6716707wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tL1z47PSy3ThOQoLacfDk9zPTd9MI3KytZcRtQJA5rs=;
        b=ie0lGPU744cGBqsC11P8nb1aidgoSRIDOci9PnR7zmKOad1t5TUZI7Yfm20Zs19YN4
         z1wFe7hYKZXerp4LZ+rJnLDrh+Ah6IaBJQHVkZByhAYw8EZ4g5D7gqRgv8nr2l9C0ZPi
         Ck9zqFQny2aXQv+fNE1Tu+2pGTGQcR2VZD6D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tL1z47PSy3ThOQoLacfDk9zPTd9MI3KytZcRtQJA5rs=;
        b=gPhtbIZrzyohwVayXfVnDl81FSTSgWptgo0IURo3RFGH/dmenMXSZVRS1P2CI/oB6T
         J6RnhQCHTRl7mdkxrbYQJqexIPhmQojFmivB9di9duD9t1WL8SK36NaF9JPxN8YnZhgH
         R7aUqvLDLbyDydGAxspYXs/s1eIgcrqJBD150t+FXA02nIM9Gj/f+Sp7a3rnkTB8a/8w
         MNzpvPaLPs5qV7mWRHiCL+FhT7SfdO2Mv8g3oVbiHFsuhlRrRom7IUjI/TgRUbI4terc
         iaFcbZk97dlVb35yX/j7raD1ZTrPv6Qu8MHx1BlTbyzRwFa3rZoU7/H1PQLMpBSq9V+3
         ORRQ==
X-Gm-Message-State: AOAM5320UVrWpCnKiTWievinCCThJbA2vXRYQZcf2wIVuJYeuVqub5//
	j0+wr1mL+nicj5L2yLPYD9YMa7JqQBgbgQ==
X-Google-Smtp-Source: 
 ABdhPJyZXntXxEVMR9fG+5N0pOBNV9VuYxY4EkNP/xutIVNTI84BxMdzeRT0NH38nDU+zp/dkrfQ+g==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr2875037wrz.666.1640199677967;
        Wed, 22 Dec 2021 11:01:17 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cfd6:850f:93ba:e301])
        by smtp.gmail.com with ESMTPSA id
 l26sm2663213wrz.44.2021.12.22.11.01.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 11:01:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Add selinux PACKAGECONFIG
Date: Wed, 22 Dec 2021 19:01:17 +0000
Message-Id: <20211222190117.1028585-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 19:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159963

We're seeing failures on systems with old selinux headers. Add a PACKAGECONFIG
entry so that we don't try and build this unless enabled. I'll leave
dependencies to someone who wants it and can test, I just need to fix
build failures right now as this shouldn't be enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fe838276be1..843de3337a5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -200,6 +200,7 @@ PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.32.0


