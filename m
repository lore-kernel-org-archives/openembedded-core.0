Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41239C04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.138768.1692116708448553010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QSG22zUP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc5acc627dso37110425ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116707; x=1692721507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfHG3S+KrJLv2kNDNLEj918uKUaGkXU7rE5e45A90L0=;
        b=QSG22zUPb4+/REN9R2mvgoksGo/+SQfcM+vPUif378PjWcxgC3xjtt8j0KQZED4BoB
         aeKAPvtWwV1+gIOgQmtb8LFgyjae2l3bHoacV1qShOnJoHnaBnVnLagCa20Yr3kjCf0v
         +cg2/mcowGZYv8UREZy/lMkZJop3mGY9fRSTbpheV8+lqIjnt4mMuTEP1IL3ELcsN4f1
         6bdsj7aFxP9lV9cn+kKQ3BvVnqfo0zyWY53g1o3pQ/hIz4wBhxvnGj9/A+pAxX8QgtZ5
         uwBxu+Sl1F7cd+XZf+7FJfEVlYsyCMdNjLnZZB0lBxU6n6rOe0gsBvfrDYuRvWJITHv+
         TWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116707; x=1692721507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfHG3S+KrJLv2kNDNLEj918uKUaGkXU7rE5e45A90L0=;
        b=K3YIymAiMaaaoPzvSVwZEsJ1fN4ouxKFLJcxOAyPZSwBmMZ9OUqlcykhmurmGwGw9N
         id56G5qodWDcm4+KxipGqzcpLCdg8rKs52KwA/fuxHpXevAwS1a/4lSMcHzthH+ZPwmK
         Jn52EIYAZr7n2xWEtmA2cIrQEGzV+DJJoY9LJfSQ2aOAQELgbg4rEsF0673O74eLnyfn
         x0+Yrmmlq32b+mu363KAn8bAS2i17sL2OWepBmvjFtDGUTJk0YBQH13Rd52Ti18Ruzgo
         yPmy082U6RT2Q8E1VjvCYsL+04NDUhbEoMGDjoQD3kh/1Q0Aybke9k1Dp1t07xw6JmCo
         hyIw==
X-Gm-Message-State: AOJu0YxaUV3qKyPyiByX7M72FolAXohlz9YdAxWhxANexUyMdrWfyCGq
	lXs5/u4DIgm29dLAhLe457FO4YQf0XDwzCnclNA=
X-Google-Smtp-Source: AGHT+IEhaWL12U6GMHMWCTbGAH8m0JnOxPFw86g3ofNhjuYYxXRyL4rt5zx5ErSQOto72TrYj0sQbg==
X-Received: by 2002:a17:903:11c3:b0:1bc:ee6:7f2e with SMTP id q3-20020a17090311c300b001bc0ee67f2emr13525529plh.53.1692116707545;
        Tue, 15 Aug 2023 09:25:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.25.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:25:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/18] kernel: don't fail if Modules.symvers doesn't exist
Date: Tue, 15 Aug 2023 06:24:27 -1000
Message-Id: <366f14eeaf01cfa05707928deb202cc7931f8a27.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186097

From: Joel Stanley <joel@jms.id.au>

Kernels that do not use modules do not have the Modules.symvers file,
which causes the previous one-liner to fail.  Invert the logic so that
the absence of the Modules.symvers is a passing situation but we still
get failure checking on the install operation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 856c916ffbf3438d8cf5d8bed344473bde03b56e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 759f72d571..3abd689794 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -477,7 +477,7 @@ kernel_do_install() {
 	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
+	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
@@ -545,7 +545,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.34.1


