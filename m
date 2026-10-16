Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC8ECCF2C4
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4256.1792184009200627844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AQWPY8Qs;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: oo.hehir@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so403466a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184007; x=1792788807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNqe7cx90CBt92s+MnE1dlFKsOt1Z6z/k5F2sETynw0=;
        b=AQWPY8QsRghn3AHT6t9BYPcyH6ex44w9/DB3SWfJtH/eieb26g+f+l4XXZvZiTTvBS
         V6zYdG5viXYzUL98rTT8ZyZqmmQaDDKQzfVvERfj6YLJMel1q3ncbI106524vlomArl1
         SKWW2yQZ2mcb44sCIRMisTyl3R6ZbftNQyHxjlBiWvW1EtHd6w0D0VDUXV96Me+GRytt
         Z1taRq9MJ80sfQsHr6HXCXY+cwspKZXoZo3fY/v3EjhqDmPu4gY3LBl4/gpwKOmVAPsP
         ksY/LXrw/zf0pahtpyxJiTBUo3080kYmlimeZfBZwtJuM7i9KrwPpeN3WFNWfbEUvkpQ
         0SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184007; x=1792788807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNqe7cx90CBt92s+MnE1dlFKsOt1Z6z/k5F2sETynw0=;
        b=J8H4IY7BB9N6BCfzk4P/lmjb0KlZvwd92lVtEBnIedz1Jc4RFGhgW3LwQw69jfjhDX
         rJAaWwy865oZx4gMq3EX0VdNgJGoUmN+coQVmKCloLr/teqzXSShD0tgTiqrg2lXZWyw
         6GsG4rOpT2d0EmiRg+z9h62omUBlUSt2H9l39FrYtX3USrKDAPzOvNZYC/ClRW07z1C3
         hukX0lr+RDN7b7okPmpUCXXshe9ChLS5AwDPGm9tb+ODzmvBjf4RdCpwR9thmSApkvRg
         8EIMfYwTNdSWpppm3tksjibR/ACeELXGUoRmqqDmV4IYPAabMCHLipMkuftJcqddv2AR
         /DdQ==
X-Gm-Message-State: AFq9FYIVGQpPpB+EzhUMNV6IbYxhNQsDHtKM3XW8I1vN2+kB1JCJKEkk
	QrnmMuEr1XsV6XVbsyeO6PykzgbPVyOI1HOLVPB0jIJv0oQkLzdviLypLvnveQ==
X-Gm-Gg: AYBFou3Lwx1dwPvCrjqfa3tV4MVkRwpRbBnryE5GYOKf6JwWIGM2jhdIqI20auYRgEJ
	V5QL+bAvukwDKigYtNDbsD6DYVG4TXQm3ai1n6nTNahYC52Z3p9hMO+x3B+By6t8n87xCS5GaPG
	GIN29qCsfCKH8vo8Z0yWhZeBstbkSUB2xh+EXIxuPsZJBnq2m/g5FbDspxMbt7NWSqKauyNE9SE
	7M1sqwTWd7o9RQ4dK6feY5Zd7g5bjwybqxoFwII6SWyjLSeViJdH+0miswLF1YhDSvVV2zSMrDu
	JBazRGn9A71avtVAlg/CBs4P6/lIsenG1aw8R9v/VdCvZyKjC6mxDzpoyfDSaAMMFiJutjuodUI
	HSwmDM4c3IRjgxUuY6dQXJy1ljOI8hS1aR0Ne3VqEvxfF0ZNokQhC3oqBkTkt4kF32ey6Vz/3BG
	zv1uM85RsiLDC2H/bl5RcHtez4LjybqBUQefFq9TSojQnDwYIxoZvSRBU8KBV+2zA0wMW0IFW5u
	G8=
X-Received: by 2002:a05:600c:1c06:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a1d75fef28mr20762175e9.16.1792183657505;
        Fri, 16 Oct 2026 13:47:37 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:36 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 3/7] ptest-packagelists.inc: re-enable python3 for riscv64
Date: Fri, 16 Oct 2026 21:45:32 +0100
Message-ID: <20261016204547.2328847-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248042

python3 was parked in adc448b19e because it hung on qemuriscv64, still
running after 42000 s. It no longer hangs. core-image-ptest-python3 on
qemuriscv64, in two runs: 44546 & 44548 pass, 0 fail, 71 min each. On a
VisionFive 2 (JH7110): 44698 pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5e99b59d4a..97c6e35050 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -159,9 +159,6 @@ PTESTS_SLOW = "\
     zstd \
 "
 
-# python3 ptests hang on qemuriscv64
-PTESTS_SLOW:remove:riscv64 = "python3"
-PTESTS_PROBLEMS:append:riscv64 = " python3"
 PTESTS_SLOW:remove:riscv32 = "lttng-tools strace "
 PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
-- 
2.43.0


