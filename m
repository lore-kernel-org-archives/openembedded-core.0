Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC2AC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 12:35:20 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.40789.1717763710873694407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 05:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iy65e7cg;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bfdae7997aso1735901a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717763709; x=1718368509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBsKlbH/NnFbBJNsWUyS23a4hIgBoPL6tdJRwM4ACuM=;
        b=Iy65e7cgsJkhVkqCqQXXuqAGoiZHldH9Hius26PmtBsAig9EC0hf0e5x0kDrcWenZU
         eXddkoird7i16senrBj3Cl6vU9cLaJfiEBkKm6VklHfE7X3BvUef4/2PByfshN41IB4v
         /EGI5c9Zqp59+CPTYND2U0PiECCs8zlOyv3fByN00nlONoxIz4B9LiXiyUN6KTcatj22
         BF9ZhUJzXZSlhldETehhsHssvTYD/v1RNz6iO/41rLdrXm9L/7CDhI9XYcKsIJVv0oXl
         vlrNwh6bniOgxcusmJgFsa2oIMc8+Z8fQ8EqDJQvRcpj5gDXYdUITgG14yJEuVHfzroh
         QSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763709; x=1718368509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBsKlbH/NnFbBJNsWUyS23a4hIgBoPL6tdJRwM4ACuM=;
        b=k/DO5KxCOT5AwTF5RXf/zFDlwQ+Avd+T0OZjltpVko4+qJRZlFV/M/rn/Fod/1rZGJ
         SIjWqdMFMPfAssdaFg/0hUsK1PntKTGkNz7rl/M+kAMm79+6TsAn+9OlEJDYIb4NHa0l
         UGIXHNgMKSP7TEIH0ylkeKWKCv2FswHmmIlBMheN2VKZOLC9igc9NhunZmrBg8AzUOcv
         8cxGpLldO7PwbwtM7/IpQicMWX4IyJ7meztM7SgQLEDgFovZjoMHgYjjDYZtXmkpSPAB
         RFwvrwXEoO2R5PRO4zOPBiTAFqGCYBHidYZJ7AcxaHHLVaNOWAH8qPgpJsxZSZHaIdiq
         VdZg==
X-Gm-Message-State: AOJu0Yw+wZgepumDjXqnUu+QGH6q+pO7tIM4ipF7WegF4iCmsyDAAQas
	w7A1eUJoHZkTBGuCaqOVuHMNG2ZQ9ZeHw2nzSyDaMPxEzGD8UB2GN7zr
X-Google-Smtp-Source: AGHT+IHEsMBnR5MYMfZEX/wDvwk3gFDOGvI8AuW5gmJo8FInZFKhdlNivh4F1NSIR8tvFQiOyseypg==
X-Received: by 2002:a17:90a:684a:b0:2c2:5f25:5490 with SMTP id 98e67ed59e1d1-2c2bcc6cd65mr2652744a91.34.1717763708677;
        Fri, 07 Jun 2024 05:35:08 -0700 (PDT)
Received: from L-17494.kpit.com ([103.146.224.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806bd795sm5371303a91.35.2024.06.07.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:35:08 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] ffmpeg: Whitelist CVE-2023-46407
Date: Fri,  7 Jun 2024 18:05:00 +0530
Message-Id: <20240607123500.127317-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 12:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200439

Whitelist CVE-2023-46407 as Vulnerable code
introduced later than 5.0.1 version

Introduced by:
https://github.com/FFmpeg/FFmpeg/commit/f7ac3512f5b5cb8eb149f37300b43461d8e93af3

Debian link: https://security-tracker.debian.org/tracker/CVE-2023-46407

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 1295d5cdf1..c0121edc7d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -39,6 +39,10 @@ SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a
 # https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
 CVE_CHECK_IGNORE += "CVE-2023-39018"
 
+# CVE-2023-46407 was introduced in 6.1 version of ffmpeg
+# Vulnerable code introduced later than 5.0.1 Version
+CVE_CHECK_IGNORE += "CVE-2023-46407"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.25.1


