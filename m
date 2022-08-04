Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3830DC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:25 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.699.1659653897965734479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMRbYRC+;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id m22so728870qkm.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fyTU5dGBsoYIhFJ3JMlz7Yw5DWUwWsl1OTyimNizdgs=;
        b=iMRbYRC+8M8/Cd3TW7US/3Zy7eb8QbHz8M1J6dc3FHpde3r4i8ldKuf5Lf21+qtxVp
         mbjNQRBCGLmTlaS6gG6//rTEsbJ8c11n58DRYDiWBDvv+w515vKFFUDY+8PF7yhybuCM
         zCcyB5H3+BFovgqE2md+pJ01YP/SVMAYSa0T3dCohVjXLotdXaGT+EQUtA6nLxY9f7Hr
         MQsB6aruxkbREjXFPDFLYLuB7wOp136qvYP5OVu1D2NA5v1PCUVVm89qwyg+tCAD2+hU
         2SImzbdyjx9cRDnoa0L1FOnypsxWG4oaKhkyynQJL9uKLfA1dLAJUSVi+OjlQSGTlK59
         M/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fyTU5dGBsoYIhFJ3JMlz7Yw5DWUwWsl1OTyimNizdgs=;
        b=iI5z/7GkixbWgh6YiriBYyn0i2EaokTm3hZRTJXsjJD2fwLNDT/G2ZwLem2VLM98e7
         oJqrXZjBximeW2YPNJmqk6tGyKCKlowx85FxKQBRnro4qUxtNa1kg2YZILXbsguASiuN
         d0yjG/r2GD8M7Cf/DbsB4E9DmGk050w360C210Y18HXUwv3HyE9BGaf8b4STnpB9YB9T
         DqStRKPlBf6jPiUS5jlDXdh+kmaymbKYX/CNsrrM5Ei0qDTJI8Fl4kwjXnO1vPi/p2Np
         0zFRLggtb0SdpirnejiiWBRr/iHBxy7Ut265lK/EFg2mBHCYiaM8xPbrSTQB/6hEARna
         PqXg==
X-Gm-Message-State: ACgBeo3hDOKKzGY1w4HpLgJ9im6lu9rfVsiTG1WZXA3fQRCPu/1oSzmY
	TfXVTREsXH1YiLyGhz7cySw=
X-Google-Smtp-Source: 
 AA6agR6z1wgMjXGSxkqc9PJuPgkOUKYgL2GS7DptG9Uh992ubMmIj/L6kxqkmMGadbRAXzw3Xl4uqQ==
X-Received: by 2002:a05:620a:404d:b0:6a7:d3d:df9b with SMTP id
 i13-20020a05620a404d00b006a70d3ddf9bmr3092380qko.530.1659653896962;
        Thu, 04 Aug 2022 15:58:16 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/13] poky: change preferred kernel version to 5.15 in
 poky-alt
Date: Thu,  4 Aug 2022 18:57:49 -0400
Message-Id: 
 <056ce553b9f41c17046eeaab37d95e0950af83d8.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168876

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.10 has been removed from oe-core, we change the alt distro to
the 5.15 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
index 0de2013826..b42b830e43 100644
--- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
+++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
@@ -2,7 +2,7 @@
 DISTRO_FEATURES:append = " pam"
 
 # Use the LTSI Kernel
-PREFERRED_VERSION_linux-yocto = "5.10%"
+PREFERRED_VERSION_linux-yocto = "5.15%"
 
 # Ensure the kernel nfs server is enabled
 KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.19.1


