Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB1CCD98EE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5777.1781637394514524296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GmTyfXLo;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b9318997so36148595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637393; x=1782242193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSB4IrZMz0nao2gVG4MRYebjeWczq2Sl1u/xvkCVuxI=;
        b=GmTyfXLow2RDaCYSeahqGjNIU5sDJv8RB0qQJm9KvLOXHIclPfLU+6wTEOzuczTxZu
         wxArbnbXJAbBxnvB6d5j5duGt/9ghMx2M8/VITlAQB6QP0/xNppHpwmu5g1T+IOO2qsk
         J5EJ4bkjZ9hPQJX6QajpFiyAOcdfJ+Q1n5iuAfGJELPARZn0goVbNU/tQILTzlVODMG4
         WzpG+vakVOMW08070OTQRqtBqjS0jUa1wdqYVkiU5Ls9VhQiwho3Z1/lfLT1dpr5ZnJI
         erYuJTwCZ8V7Xpm93AqBA6MiRsoZSWbXCh1AoCXVliio0RjVMrkUnViY2zdNcg8woBwY
         rMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637393; x=1782242193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSB4IrZMz0nao2gVG4MRYebjeWczq2Sl1u/xvkCVuxI=;
        b=f5bEQn8bWZWLaLnBhTr4dh24lCGWOU1PVkvhN/cUY1nWg7XSssW1l1SAHqklWz96Fz
         7j8GhFNcBxcLdujGydfjowOLY65vBesZLUYj/BmDYINilI0bOVPDbWWuiWzLJn9BuOOV
         t+7U7fL3P8bicFWPUyrlplohoQ2gxge9B2CQfrPmgBwYxuHsVHSMe33kROoucnw8Y1DJ
         uf7jw18qsu4RKqeML/I4kI0Nb3R6IJeDJJIVulGSKBFPoUuZ9RjxuPvrOyZv9n3NhmHt
         Gr3Y1cu7qDwyDG0dxkOVSLbvHQAkphArjDJ19HUpSNhTfbBvUJyjUDDwm9e9LzKqtPPz
         GQ2Q==
X-Gm-Message-State: AOJu0YxSMguJnYKPdHEdeyx8eEi4h2e42ooggM+F3FmX0711QSV2PEl9
	e6S2m560rmAgTJI5P1GlvVvzp6NObC91CvJcY+QPFDcWfs5B6R2MnMxboTBFWRiD
X-Gm-Gg: Acq92OFGkSkKBPsmjTyZcyeUOLWCh3QfrO+5MFVXkxxCoy5Q4Iy452A0LLqnB5gmmBU
	nVYnr09KBRCoD3UWDjOhjJ7ko8rRbSQg373yzeTBv89xez1ayOziIxufAjMIqF0E/wst+j66BZx
	zjyhA+CnJvJSyqWsSTEH4zjN861LqjxDfmlxhIPJuk7eAtQ2gJ2eV+8sXLqwmEUUvNtkt6JFxqD
	XcaFR+824flhflDCIZdp/nuthFNsqznJ02RcOBEsnTUdzk3xM6hMSJOypN+e3vyLNV9vDnClMX1
	KR9yi2hxlIQBtPbIJs/kqRAJUg37AhGLmJN46YZvm2iRhv60KbMSiKyMVILqRaR5OvWJ2kV3uHj
	RpzmtgnjaGRqMlAAU2A8VdugsrtLxTBpjgYhjL4q+fJN3hKTZ1VbB7zaTqo2lxfSs2sYJ9qVqrj
	L8C3/UEeb0asAf6RGVa4mbmWWcCoc+bN5YyJz3tS2n5T0bvxnvSQpy1HZ1zyy6lSaMCXd54Q==
X-Received: by 2002:a05:600c:a148:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-492333dafe8mr10658545e9.27.1781637392500;
        Tue, 16 Jun 2026 12:16:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/30] gstreamer1.0: disable an intermittently failing test
Date: Tue, 16 Jun 2026 21:15:57 +0200
Message-ID: <20260616191628.2014553-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238926

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 44dc350eb3..83a78fabd0 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,8 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
+# Intermittent fail
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
+
 gnome-desktop-testing-runner --parallel=4 gstreamer "$@"
-- 
2.47.3


