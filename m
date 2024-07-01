Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59EBC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:24:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.4399.1719858276317977211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 11:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D741Wenv;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-706798e7ceeso116670b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719858275; x=1720463075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx4LsmiZs5ULQkJFJa7YuIbwoe3C+FJQujXbm965fQY=;
        b=D741Wenvyo0y16eJJn+b/o8ASAvwdZLiV5H4irMfCbQ/GiM7KpYFO8bt/AougPPRh8
         iFfdOmVP+tw/9k9ZoUGqV1L+FmJCSZ99XD7aMMRsuq8tdWxKPBc74tZ3i/zr5j5aBFd4
         UHD9eJlbHPaU1euzHjDCQYNAEX+ExcPl2Gpogknr9KYLFRfdcJYAnivwthXPlzXi1Sh0
         /bAVIN/8jbfYhB9pYyFgBFgMsn8qXqA8w6vC3RvyFSJfqx8qs7KW65oBXaz7zopt4IyX
         OO3SFA5alawxMO1PJ3pWKSCg+YoX0vURrY8y9hQ6OLx7BBOZLc2hjGYBCUuG2jSCsFs1
         zMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858275; x=1720463075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nx4LsmiZs5ULQkJFJa7YuIbwoe3C+FJQujXbm965fQY=;
        b=WWsl0zMU1GD/gpDBjlMvGrF2LE9MKIAtC3xL7eWEd6mGzWkgvIF1L4Yqm0vRLejuOE
         2NfZgkz0rjku8Zn3FtMTvNGf1LDgnXZmURinaOmviSsszXTzXVoGS0fJscEJDlFDIoX4
         48dnTm+pQCDwlgXW7y95xMLGSmdx49jJuh+hXEKWMpcL2wjolEi+MKkM5qjdExZeWHEv
         QDiU5/+Qd2jFEHhGf92LolChNyRY2VspVORFs66g6JkKc8pZIOQ5PsfugF0Lf889l6ys
         ys448AL9LvvzGWE1vq1Tz0LOk1MUhDJ8jTSQa2K97HZAKUnOaozmiLyyHN14+Ado5wj0
         zqjA==
X-Gm-Message-State: AOJu0YxtHnIFyJkMaVhjccFvJz3wVs01gyL8CEl2dSC/GGT+CIc8EK37
	hUJhlTy0/UfQZfsJMWyyNmGGgtCyVbhOSbLVK9yGLcP6Xx3t4kGdhq+6og==
X-Google-Smtp-Source: AGHT+IGeqB1A6waR6Z9BfCsRerfn5xEFaTGaYpEmfVzp7tgxYUYTUihq/rjfEamkCOF3PcHhmX0uEQ==
X-Received: by 2002:a05:6a00:8716:b0:707:fa03:542d with SMTP id d2e1a72fcca58-70aaac21799mr6748253b3a.0.1719858275097;
        Mon, 01 Jul 2024 11:24:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:27dc:3453:bfb9:bce5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70833fb4ee6sm6658013b3a.52.2024.07.01.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:24:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: upgrade 2024.04 -> 2024.07
Date: Mon,  1 Jul 2024 15:24:28 -0300
Message-Id: <20240701182428.130319-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 18:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201411

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2024.07.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.04.bb => u-boot-tools_2024.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2024.04.bb => u-boot_2024.07.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.04.bb => u-boot-tools_2024.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.04.bb => u-boot_2024.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ca5357392a5a..1b5382a6ad68 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
+SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.04.bb b/meta/recipes-bsp/u-boot/u-boot_2024.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.07.bb
-- 
2.34.1


