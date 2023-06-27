Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED3DEB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:17:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9552.1687861057555200929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jSx5luCX;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fa96fd79feso23540985e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687861055; x=1690453055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuOeKya0grYAlXw9cC4BVdyy8UOr0G9YXcgSAHW9Cvo=;
        b=jSx5luCXOvNuLHwQ2nG9/RL+yFeC6MpxwwTwuVGyIZE8izpXwEy/6kGL0LxQ5rTPgs
         6Krmso4BrVIUXYDgXr95Ozb5mRXkBGRqHL9S0z3tSpSoF1X0CZgou8XfbEC4Wrbgq45e
         kderzCo9MRsgbKD9Pb8yhXSQ8hEyQYn9VkrmHURfSOQxil580NUanDcPI+igpil7Wgw4
         cFUuXI4T6Xdidz81Y1hCLqI01ve8OrNkdKo3uoas8FW3292PYTiK/158PfhWuhCtKaNv
         yK4rix+Sza18+OFMuiQyRk5DNO7lRs3Qp03QkUaOcEAH90kiwTUDvkURaL+sBCjO4l5L
         Vxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861056; x=1690453056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuOeKya0grYAlXw9cC4BVdyy8UOr0G9YXcgSAHW9Cvo=;
        b=V5vE3urrQN082+HgR5tCiL1GdjbVeeTR5gx5ESkKM7f7z7SrM7RouBaoyBy6vbKK8E
         FsC19KHWr1bRVxv3ipzc/ULlZ4wCaZPjjkLzctCM5aw5GsP/KKoHFsBZitfBGAJn4ge0
         lTrcoX+VGzViJoor6jeLNZGFdy55+WG3LUxp/rfNmCsK20mikgnWbX+YqzyPQ+CZUFK1
         AVjiCuT/OLKXBWbmuR8HCYA8c7bPi+SV3xfvsSSRRRmeQpDt+0VwABIuyhHAXV9ADR0K
         UIjfK04RBC5ncLmy2URj+QqK+Hj3srqrLx4f4mCZgiuc6lm/gxk3ahnRQ2PqVdsciOj1
         ZLsQ==
X-Gm-Message-State: AC+VfDw+YUdakfIw/SfVPvmf5be5C7LO/ekkWVAbRkFBx7lHXo27S69O
	E2XAJcoVAp+QXsQyIXj23J8I6c2UWKU=
X-Google-Smtp-Source: ACHHUZ5EiojA6ytV9WfWLHWJAR0ZWEIQdEt0OckbiESYU2rFephJ2HrPezEDkwqLAL3Ul2Of0wThJQ==
X-Received: by 2002:a5d:4a0e:0:b0:30a:e6d2:3ce3 with SMTP id m14-20020a5d4a0e000000b0030ae6d23ce3mr22773524wrq.16.1687861055471;
        Tue, 27 Jun 2023 03:17:35 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm9961436wrv.37.2023.06.27.03.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:17:35 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/5] kernel: config modules directories are handled by kernel-module-split
Date: Tue, 27 Jun 2023 10:16:40 +0000
Message-Id: <20230627101644.881715-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 10:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183479

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

V5: no changes

 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e82b696d1a..855c784149 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -483,8 +483,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}${sysconfdir}/modules-load.d
-	install -d ${D}${sysconfdir}/modprobe.d
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
-- 
2.34.1


