Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0D0E7545F
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 14:17:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.121251.1766585850492757365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 06:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPSrREbT;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43260a5a096so1965580f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766585848; x=1767190648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9f/Tx0AROa3eWwm2R5HZI9DWrnOi5C9ZSVDkIMq9+Uo=;
        b=ZPSrREbTv1PTeeDJZx3Y2dnMLwOUSJtgfY7XRIwjS8I1kJVu5/39Waa+o+zH0bRorn
         QBZFCm7RWFA+4OI/EVA0h1ShCyPKnFPZ0Fq3KFeBQPKUQSBsW9Sc7Yt2pxu/PvraC/+j
         kDc2qxklxq7Iy6qbK6zq2fUsrCNHmO4FDUJmgPvnz+NUs9Wgpo1T+jS/pZcrokASGte6
         GJ/0dqAyf90xYOmjtQe3p183uvq+Vebv9Gpg8NmZcJ1IjDnLhmFk0zAL/CKYVI8Z/eBo
         y9Iv+oQYfWqjx3SVEVwUY4XPv+jShnVER0hqA5SZK9FQKId6hQEZ2XYTyHC97PT44PlT
         Lc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766585848; x=1767190648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f/Tx0AROa3eWwm2R5HZI9DWrnOi5C9ZSVDkIMq9+Uo=;
        b=r8TKqDuyoA3JXBbtFIgklHj4ScMpwdk5PeSuboVGgHv8K8kOV0fuh0DcUZp00E9jCZ
         XUqayOn0ZJIgMNLi830mzECYYh8fvcrAwEHEonFQSnzzNowYhXsuGXTj9lVXyMApMpY5
         SPPvJW+UoY3joENHtLW4XTtx5tOgmHv6VekUdUKW8xvRwsHjTrZjxFILyAtaUvc61WhY
         RqfBv7MPPaxWD45zMES3tYiRfS+MJYi1dl64nksOF43iyz0DzBIFuE4V1qCdr33BAyaD
         OCSqMHR0GA4d3SoYvbe+4ookfWvq9TNoAxKMkB1uMc1hLASc7FRqgVSEDORqHghvWFRb
         bjTw==
X-Gm-Message-State: AOJu0Yx7xenpgGHlbTIdUuqPRO61Up+jhzHdRRoow54580FO17yBREfj
	SB1Jn9+gPxD9XGyNB8y6Gldeiex5hpXwRCZgSfLmQuzBs6StcQ8Mz5Mp7PrwgKbg
X-Gm-Gg: AY/fxX6B5dieLbQDRe25MNPFYZrrrmw58oH4ajjT/KSLgGx4804edch2m/h4HgSrHKG
	Q6S+cwk8WNPtH6f4LNjgGPOcYP7gOZBKaAunYfSqy/LwlIYH7NpsmH951rXLgPNWrBVwe9UyzqK
	U/Olvy+tKooqe7JpDMS/UnSj0KqSMJSPR3X+ppYYRBQ0/GUo+6h9OcEXECks92qCKNgw2xmggt9
	enV8nHuACqpx/vJ3uQR80diiyUMFbH6inLgha9vd/ZFgE2/j1ONTOiUb4wAqCeFp6zUOEMCLmlo
	zvoUEGx9pjLiNe/gZnUboII/LBy6dZ5XH8ANbuW7NTazSsBumQiO0AHD7aibwOoXNTanmO8Ulw+
	ZeOvZOIfuxj5RE3Sc8jlHm+Ai1sEIM4KiD2FAFfg5Cb1koQmnUqn8Dd8wvaMnwgjn6tSgeJmVzh
	Fj86s8aYzb36S/
X-Google-Smtp-Source: AGHT+IGbMGo8Nd1iAj00z3yO+YGMmIfhg0LpmHObKE1kI8e/a2Tr74V4cZjcm2nzuJEeB6x80W8VAQ==
X-Received: by 2002:a5d:5f54:0:b0:42f:bc61:d1bd with SMTP id ffacd0b85a97d-4324e50d78emr21928755f8f.45.1766585848026;
        Wed, 24 Dec 2025 06:17:28 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2253csm34940079f8f.14.2025.12.24.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:17:27 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 1/4] overlayfs: Fix QA failure
Date: Wed, 24 Dec 2025 14:16:55 +0000
Message-ID: <20251224141659.2218381-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 14:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228537

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The QA check for skipped mounts happens twice, at parsing stage and at
rootfs postprocessing. Fix the former, because it didn't happen properly.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oe/overlayfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 8b88900f71..dbfed317c0 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -36,7 +36,8 @@ def unitFileList(d):
     # check that we have required mount points set first
     requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
     for mountPoint in requiredMountPoints:
-        if mountPoint not in overlayMountPoints:
+        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
+        if mountPoint not in overlayMountPoints and not "mount-configured" in qaSkip:
             bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
 
     for mountPoint in overlayMountPoints:

