Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F85C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 13:54:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.41234.1675086863843698347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 05:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eEFTk+d1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso2050903wmp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 05:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WzmluddIomWZCTJ40wj7fuceGrayO9E0gtt0IVpmjg=;
        b=eEFTk+d1nO1Trt5BVLZjXZlI8AH4G1SQdTIwkJ6G0ADa3cNT/Onny67nP3D1UhbZYR
         FMxZhKjYaZSdg+9CciyQsBfqgoe/nSO40l0/tQ2qLKgkpTfJ//lJWF4wrfb8hF8c76xO
         EXQup+48katJHaueNvVPuLGPVKEHz0wHgaRDq8coFW30Ls1FYoP95mKAUle3FdD4kFeX
         zqkYUPovj9Qyuc+UElEC9fbrAn+SvM6dDm15Tb045QvISwTyEwKl2d5WscMMnHYnGJJp
         StySNIsmsmSGo7EUREVqXlIcyb5aup/mZUHiHlnVkhp0QY6JO37bp7X2MCnyzlzyq0Hd
         R1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WzmluddIomWZCTJ40wj7fuceGrayO9E0gtt0IVpmjg=;
        b=6mCUqBSZ4VNXrBywW/5VVtPDG/jzShJzlTphR48a1LPp79LjTTR8KQpNa7yupuGFUM
         VkJH3Hoi4zz4bD+LU9nqT6iaArdj0LsgriXifab/NcwG4W1m2PiGEcwxs7faCDEOo6kh
         mjogXJjvhfTLz+90IwhxzPgxIgfPnMudx/Hz5Qh8W1rB/U1PCrIT3fWKcSDcxd7+g/z1
         g9jsUj1aCP9Vrf5W03/vzC/YF4UHZuE2aQHE136BGys4I3p10oUyhweTL8r1yt7vHWiW
         xdMQqyiHmbfG9HAFKn3qgUHLX+lFXGfbD4RMlVrE1FldtfjiwS9EprYwBO5VdG7EGLE4
         eTPQ==
X-Gm-Message-State: AO0yUKUrbk5vZhxdzlLS/oOx6YGg+OsKbBHu2PrlZxX7UlKEkm2lgTEV
	anemagaot6A8hA9oRl7QNPcg4DDkfco=
X-Google-Smtp-Source: AK7set82RDHwMn1VgTZ+Z0bF6+yisRsAgO71lFlNEHhw9+sVBqJR2OFnPZ1a7terlYEhsFEgwD6nNQ==
X-Received: by 2002:a7b:c4d6:0:b0:3dc:5674:66e6 with SMTP id g22-20020a7bc4d6000000b003dc567466e6mr4709633wmk.25.1675086862294;
        Mon, 30 Jan 2023 05:54:22 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v11-20020adff68b000000b002bfb8f829eesm11751522wrp.71.2023.01.30.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 05:54:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] xinetd: move xconv.pl script to separate package
Date: Mon, 30 Jan 2023 14:54:20 +0100
Message-Id: <20230130135420.3280337-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 13:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176493

* most xinetd users probably don't need this nowadays and it
  pulls perl into the images

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 897417314d..c390fcf33c 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -48,4 +48,7 @@ do_install:append() {
               ${D}${systemd_system_unitdir}/xinetd.service
 }
 
-RDEPENDS:${PN} += "perl"
+# Script for converting inetd.conf files into xinetd.conf files
+PACKAGES =+ "${PN}-xconv"
+FILES:${PN}-xconv = "${bindir}/xconv.pl"
+RDEPENDS:${PN}-xconv += "perl"
-- 
2.39.1


