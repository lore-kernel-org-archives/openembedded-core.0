Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACF2CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 16:59:28 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3916.1780333160881295451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 09:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h14tlSwg;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842273a2c4dso1640834b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333160; x=1780937960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6LIxv5MlIR0cz7oPp8fzl+qTZ7RJ/ffa9H2AzFUDi80=;
        b=h14tlSwgk0VHW8PeWYjDki6luvRSROLfZYtsfvScPpixFZJCUwKoYh0y1caaqxmbNm
         n0o0vSHWH+l3Hu3URsfL3RHi43tE6A/P6SLXgn2V0r2keQ59pprSHytk3EOygzv79QIZ
         aEpgfIRin8K25TAHluSpT2iDFwDTKLJFGtJBpzLyh4K2MCE/u+5Q5cWHOnolDILGR+fR
         Kd8l1SrwGmBq+Dqui0KFXwOE9BvuBxhgYQALE6zjQ0Nt54FqcygIawzKq7m7KMc64MZb
         KQ4PVe6PbN7y8L0V0EkQmoygqmlTmiUIXr7INLqyTs3ykx5u9VK/777kJLhOGChOMWm2
         9Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333160; x=1780937960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LIxv5MlIR0cz7oPp8fzl+qTZ7RJ/ffa9H2AzFUDi80=;
        b=TmkLjkTziGfbGOtNZUsgKr2JX+54utGi9mLTBoNsMB3LSdtO5OyJRjQJU6I4PNR+Z8
         4s2rjhd3kpXOpKn6zFAWn3oi9dyubooGhFinnAE1OUXtC/J01o/8TlLDmhsOXzCuILiP
         xlOkbba3AJ2LLTooV5L3jJXWk8XXj9HHdJTEx+lV3pV64d3o4iakyuLq8gVx+jtPDlls
         6cGOyG7Wu2q06WW4ysXKASNHuTzlNy8mK4v5tpM0WnEAT8H8Nh+KOpkObdTLkfwNUEe1
         MuH27NRM6/jFlgaEvUwmsknkRnLRqfp3LPHqzq2DyV6d+ipa4OmR2gcRqTvuwCdhaMEO
         RGcw==
X-Gm-Message-State: AOJu0YzRZR1nwnXwB5RWMmcJCfZ3bpDVGxc9oOHrk9AlLo00e7L9UUsV
	LDlK63tFxImxggmsfGGnki5J5t29cPPS0rGfA4/1l5qHON6O/XxTGGvVwJ/B1V/A
X-Gm-Gg: Acq92OG4xo1y+e9RB6kMkYAXewm5ys9OApGHFhyh1GZpL4nj8H1U899KcmKbxvnb5nz
	hhY9uWd7AQXQuC7Ubuil6CaO9UUdJ6o4pjPBsFzIPkYk1eFBQDMBaOVAgy9l8E2Zwz93i1HecNf
	KVsNvoecEH6wtGYrIL0FHFKxXZ7tX/XPCxcXQkaMod67FIMTwi2ubTPQfiDb6qRHLIeLFlfhYTi
	sQR87ZbBt/VAk6ccmqvXiG2+wSIFGMZMEsNVWLKRMiCtsrOkSuAq6QlIDukS6pzfSqVBg8S9M3t
	VtzulC1m9bE5m3Y4OHXcb2B4tOZ4kXG5pZaqRoErZIV3O4Fv3K/CKo7V5WFrdegGnz14JUxHUi7
	mJtST33hjn8aivUmuqGg+Rg6bHxvLwM66UHaD/9wSSJSU8RuOwysZbTtIueCC8vQFFtUGId2Rwj
	akDd+2pvMYuogB/RjhEd+Btw7q0Z+6x58IutX+pSXda8eTmqu2S5wZ2dwPcOyHwEWhVVhSOSuZJ
	3tZgVkH8B6K+s6R
X-Received: by 2002:a05:6a00:a88c:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-842254953d9mr11505860b3a.36.1780333160225;
        Mon, 01 Jun 2026 09:59:20 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.95.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8424aa8dd16sm4227913b3a.32.2026.06.01.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:59:19 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH v2] qemuboot.bbclass: add missing task dependency on kernel deploy
Date: Mon,  1 Jun 2026 22:29:12 +0530
Message-Id: <20260601165912.533636-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 16:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237970

do_write_qemuboot_conf had no dependency on the kernel deploy task,
so if the kernel was rebuilt without invalidating the rootfs sstate,
the task was skipped and .qemuboot.conf was left stale while new
image artifacts were deployed with a new timestamp suffix.

Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which
is the same variable used by do_build[depends] in image.bbclass for
the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?= it
correctly handles firmware and baremetal images that override it to
their own deploy target.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14520
Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 56106b1958..db971d50bd 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -128,6 +128,7 @@ inherit image-artifact-names
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
+do_write_qemuboot_conf[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.34.1


