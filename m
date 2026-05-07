Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E9CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 12:16:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10403.1778156208797519389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 05:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hc0qa8xz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso310624f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778156207; x=1778761007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7FuZW/C8zTonUl2Sw7zjNt9X2V8RwC8SdEITttl4ll8=;
        b=Hc0qa8xzSNn2xdHI8qdBgwS8VM3T3hHACK3LjcsqKKH7YqVARW/NrRM9rQdvVXQ5e8
         4bzTnSOnrZw6jyh1U9ZNzRq3kznuF34XlqwRF4iVZt/M5yST3sNj3ogl6+8+1jyhMTt5
         yT81k1WgbfJ0Ce3dOeQ1++wOLe/60uxxEI+Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156207; x=1778761007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FuZW/C8zTonUl2Sw7zjNt9X2V8RwC8SdEITttl4ll8=;
        b=a+38jYGZE2dCoHhkoCPiIrZlrXusYmgQqmUH6VD/hr7/Zy/b7seGq6389uu9fokNKh
         X9/vA9QBYDDwIldRSPMSbepriq3pEsLzRHBmdsyug6YB9jyv6SpOcgvK9GPUoDUWrYGx
         ms+yb5fi6TuKiLJQvXyekl/I6mqZgnU4XyeRfo0wDiWBzTQhkq1mskXZ/IN2E+kmid29
         Wcbjs3nKvLDK2uWdUSdh+JfYu0cEQsxTVxOKdrZ8hX4t320qAWXgPevxEzyV9xD8z4bI
         VNJhV5OQkpGE8dnCxvutKkGfAdErt4jSFj9NG4b9dXaAVdpdCppESnH4fHWhayMQOc/H
         4oyQ==
X-Gm-Message-State: AOJu0YzgGCtlsjYNXJWiefjKAC8w4uJ2BPWjBEllgaBKk4mH7UxdnYXN
	W/LJ5qkFUR56kABRVyPchLK/WWSFp1wzCCyzpbZd8Q4Wq4q5Llqq3vRnX9+RElQcRDeaaKeIQ22
	9DmAF
X-Gm-Gg: AeBDiev62Zxpcdzp2SyAXz1UioM3d61GXwfCfhDXbRWKAuycJjj9ysUMKrc4Nzxm2n9
	pE83CMgmhprKIuNMmwp9GVs8BwCsjU0RZzLiibDHPATBIKrVFBqxXHry+9Kxr7It6bYigce27rd
	4RGrNgmSkA3Kbp8EcG2a15QSg3WlgqyFJydSFqy+GCjA8W60dsaaslJweIqO1h9CSqa1bz0BHB3
	nG/prI3kba3Nwg4O73lY+uT1p8JI/qynaQxtXeAL6NkOM4IPC8aeZUn+JdPexYcNxn62jNAQURr
	oij37+VfWmPzKFp3Hz7/1Cx+vIbNp5mEXoB6KpVceCdeTZGMUm2YeAErdgfUHbxNUDETIcJVU0b
	/oEFs5fOGMCClphXA0n/kz+73ZstO5GpcOAxUyVESky4pImoeCtCZ1fLpeIQI0FW+oouM1SfYII
	O5GNPngjo4TV+2Ev1zLCbzp/+SyXhx1yq2VybHinPLdKvQhpMMkuf+DdhROudsisxikmc0nuxfx
	g==
X-Received: by 2002:a05:6000:3107:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4515df64297mr12549084f8f.42.1778156206196;
        Thu, 07 May 2026 05:16:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:44fa:5dbd:b82d:7b00])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm19544649f8f.6.2026.05.07.05.16.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:16:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: Disable module deploy tarball by default
Date: Thu,  7 May 2026 13:16:44 +0100
Message-ID: <20260507121644.401811-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 12:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236587

These module tarballs were once useful for certain development workflows. They
are not that useful when deployed in CI, taking up space as release artefacts.

Not generating them by default saves time/space and users who need/use them can
enable them, this makes more sense as a modern default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-artifact-names.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 1a7611a15e8..6d974663321 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -31,7 +31,7 @@ KERNEL_FIT_BIN_EXT ?= "${KERNEL_ARTIFACT_BIN_EXT}"
 
 MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
-MODULE_TARBALL_DEPLOY ?= "1"
+MODULE_TARBALL_DEPLOY ?= "0"
 
 INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
 INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"

