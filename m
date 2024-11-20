Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86596D63954
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13955.1732111072371727952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yLD/q5cC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-212008b0d6eso35993685ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111072; x=1732715872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9u0ic8R5f6HSwhRqqN77srjQ3/yUU5qavWcvx/VLnVE=;
        b=yLD/q5cCaO/qVpnhHK0780Faz4kQACbVwlN5ZrKV2fL1meKSlbwfYorBz3UbOJk1Fm
         RvmP87mneMthfA/iV3Z7rn0SrZEHTzy5QuF59RBqFEgwrvIKJffvkhxAceJjr9w2636p
         XXatYbhr9U4WGKLRpWNAgqClR+8GFj5n9UTDCjtP5mSm+c5lvFvpM30Y4LWHiGyS5Sbx
         DCgBQCzATsWtrSDYuodne+n5KdbF2GyKsCG27PkQyNajLB33xM5r2uZvp/4MWD5kWql0
         D3gRv/YzvBJ3gfP0k92Dl7+fXRWhNoE3xv1ZnWiVsgdKZuDf480KbAx/naEiVOSr+bm4
         fH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111072; x=1732715872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u0ic8R5f6HSwhRqqN77srjQ3/yUU5qavWcvx/VLnVE=;
        b=TPrf+zMfKb7cSXLgQBVnhfYNEUX4DuJUwhEmxCo1qcWtcaMNpwW2ouLucHWWpa5/gI
         0MYt9b1u+zWRl3YkKzg0kgYOR+y3AdMv1yhQlE5n5U+xo7QWWaaU8dMi5TZuux1MZkdN
         D9kn18Nx2jMMKjazy4XH2HMMxXPb1fKFooRFHbPoLoKt9sz3/wqz5fmiKzN2OxKSPGWc
         J8a6YYAGW2m1FigGQj0osUCt2dQyUFlAlsYApWrlCI3mvpyt8MGuK8V0MPVNaJ5/CvKp
         EVrBIaKaEYgicc22e63mZ3VHJXx+redueyYMmN/ZJpnSAP1KCvx6NhrPZ56hFtZmF3Id
         BqMQ==
X-Gm-Message-State: AOJu0YwHEpgyMTGDAaLBU5c8vuT3Xv1/2BEjs1izjmx8FJ0xi+s5TZEZ
	7qV7EyYw3O5aD+9wjoie0vEAFNlW8dva2BP35ODSy7k6cIIiBmK22Kn7+sTBaVRnI2T+ZcTkNUg
	O
X-Google-Smtp-Source: AGHT+IE3oJ5OSLOGZkIK7qWoJ0h2JsUtEeKmtplzbLb6uir/ollTGglIvLUoK1TmriE0HzFbal5qVA==
X-Received: by 2002:a17:902:f684:b0:212:4b18:4a44 with SMTP id d9443c01a7336-2126c117a87mr28752815ad.10.1732111071647;
        Wed, 20 Nov 2024 05:57:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 24/31] util-linux: Add `findmnt` to the bash completion RDEPENDS
Date: Wed, 20 Nov 2024 05:56:56 -0800
Message-Id: <30c37334aa8c72fdfea51120a655f910d99ad05e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207448

From: Alban Bedel <alban.bedel@aerq.com>

The bash completion scripts for `umount`, `fstrim` and `fsfreeze` make
use of `findmnt` so add it to the bash completion RDEPENDS.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8703b486a6ccf39225815362acadafb890ca56e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
index a8e346539a..646bc05564 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -148,7 +148,7 @@ RDEPENDS:${PN}-dev += " util-linux-libuuid-dev"
 
 RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
-RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
+RDEPENDS:${PN}-bash-completion += "${PN}-lsblk ${PN}-findmnt"
 RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz diffutils"
 RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
-- 
2.34.1


