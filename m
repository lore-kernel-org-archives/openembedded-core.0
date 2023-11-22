Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32A3C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.18525.1700657119749485659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMq0TAVo;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a03a9009572so134672366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657118; x=1701261918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Npj/4pL/8eE3DBC0ZD4H9kLmyzZlQ7VlkQUeUZOoOLc=;
        b=mMq0TAVo3ZzNwZEi5K06I062frz1kZ/TwPi8Jvb96QF2iAnrkIYbyDTCRsIKOKL3bG
         +d13B3/glqvDVYKsY/S5J1kLytH451ujqWU42Aj+zS0U6sDYg3jw81p8OuR8OuHKEx6g
         lGZbdmCCZictChf64WNVkO0y/DC0Wq/UOte9HSEboZDf/Jp0uC5bdQ6dGT/vfRt5aojm
         xNnFSNme6a6qYvpAoax3PzWhZ9YqyOxuoB9AbmvlECb6DQsBOCppvZY7e2ecPfHzwEdU
         +lwXWVzXM65tnMpoQIKGMUdyTQcryDlaHdSXAsem1Ri4QoC4KQsBmiOOeDqs1b/kXDZk
         OUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657118; x=1701261918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npj/4pL/8eE3DBC0ZD4H9kLmyzZlQ7VlkQUeUZOoOLc=;
        b=E9yU9wlHuh2b48GI14OlAMTEChX+0djAESNg9UXPi3E1YYJXmy4V3eQJ1ib9U3dzOv
         NypLURHEFO1goGjmB0hG00goHWhUBQVtUQta5xPzWWiCZV6u/ghk3OqN6sAXsxURQEe6
         IAgBTIZ0cqPeHohcPWss6YHH/kPFHjwq5dJCezZaFbnkAifcPHC5qRcF1qhTtJDC9QO1
         2/FtOIgvJdq2WkQYDNjF8huT+s9mRH/SVJ+0iMc7swegdmlzsrWt9WEPuBrE6sA2UmYi
         rTpfbA2T1x5yAOpmNJ9wLjMHKHn0ilj+qEQUBVeoTWPdCqPZQBsktIiMEQFPNxqWeWyg
         7Jvg==
X-Gm-Message-State: AOJu0YzPqQACnAwRqU4QbRT4v6NNlD+eWhL+H5b+NbGhb9x1AlxO+gqd
	380gocNdR7wCrDGx5ZSYVFrOGvJC+ds=
X-Google-Smtp-Source: AGHT+IGd6h1tPLSIaSi7tBmp31SGqhYxEgGsYhvGQjkBXwpc8LQ678t7ka6/IcSNm/7k2lMpGfbERw==
X-Received: by 2002:a17:906:748:b0:9cf:797b:6adc with SMTP id z8-20020a170906074800b009cf797b6adcmr1465109ejb.33.1700657118019;
        Wed, 22 Nov 2023 04:45:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709066ad600b009e776cc92dcsm6599492ejs.181.2023.11.22.04.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/21] kernel.bbclass: inherit KERNEL_CLASSES at the end
Date: Wed, 22 Nov 2023 13:44:43 +0100
Message-ID: <3be74acd327c35399f2ce0e1345e29199c7f6c0c.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191090

* after defining deploy-links task, so that e.g. kernel-fitimage can append to it
  like kernel-devicetree.bbclass

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e38784a320..c5ff7453ff 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -156,23 +156,6 @@ set -e
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
-# Here we pull in all various kernel image types which we support.
-#
-# In case you're wondering why kernel.bbclass inherits the other image
-# types instead of the other way around, the reason for that is to
-# maintain compatibility with various currently existing meta-layers.
-# By pulling in the various kernel image types here, we retain the
-# original behavior of kernel.bbclass, so no meta-layers should get
-# broken.
-#
-# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
-# used to be the default behavior when only uImage was supported. This
-# variable can be appended by users who implement support for new kernel
-# image types.
-
-KERNEL_CLASSES ?= " kernel-uimage "
-inherit ${KERNEL_CLASSES}
-
 # Old style kernels may set ${S} = ${WORKDIR}/git for example
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
 # create the symlink in advance as the git fetcher can't cope with
@@ -892,3 +875,20 @@ EXPORT_FUNCTIONS do_deploy do_deploy_links
 
 # Add using Device Tree support
 inherit kernel-devicetree
+
+# Here we pull in all various kernel image types which we support.
+#
+# In case you're wondering why kernel.bbclass inherits the other image
+# types instead of the other way around, the reason for that is to
+# maintain compatibility with various currently existing meta-layers.
+# By pulling in the various kernel image types here, we retain the
+# original behavior of kernel.bbclass, so no meta-layers should get
+# broken.
+#
+# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
+# used to be the default behavior when only uImage was supported. This
+# variable can be appended by users who implement support for new kernel
+# image types.
+
+KERNEL_CLASSES ?= " kernel-uimage "
+inherit ${KERNEL_CLASSES}
-- 
2.43.0


