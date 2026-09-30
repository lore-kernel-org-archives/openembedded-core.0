Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB18CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:04 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18093.1790786300342433022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=RcqDXJ7u;
 spf=pass (domain: baylibre.com, ip: 74.125.230.235, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910c9ff1fso561489185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786299; x=1791391099; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU+DGFQDo4CuYq6bmFnI09Dk0FiL+P8Ywfnx61KZqAs=;
        b=RcqDXJ7unTroyf3K3XlWoFjAFoB1hoWVz8w7XOnqQy4cHSFqhq3cLjoOBfcpRYhgxO
         ugmNJBotR7trMHhwNQqvt7bN1PJHfwPKeTxXP6LBQ3WMTLbF4+yfsbuTiwH2NRAc23lI
         dS1EjXgLAhpgWdBZnzDEdZqFipgjeW9BRW8CqF2qlB1/madhK74MZSE95TkO1564/Din
         eOSyFuzJJRNDWUmP2cM3D2FP9RFpY++OtrIjHrH00ezryfEVGVp90MbUR/zO1Z+IYb3g
         95PqV/xBKbLzuu+8AB2u5Dgp/gTrWGv1vSviBdZptfM81gogC4yBVi0CrVRLlLjFfEKx
         nc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786299; x=1791391099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU+DGFQDo4CuYq6bmFnI09Dk0FiL+P8Ywfnx61KZqAs=;
        b=kpUmPBbJkB44apU7c3FzdbAvXe2/HxlBi+DIs0/nkOkqXU4gkigL6/EyE+G723+uF1
         u+1E+SmD8NbadcErCFiPKGIH0nCLZmawBgDrXE8gnmFcS6vNIhz+ovYY3nO6vsCEkjpq
         T/73oiLXrPssd+5PNL10VkPbXH9DOjvkZsbpNyP4n8VV5g7l+apwKt6KkUyzFSEiH3MS
         sttXiMWFfMeQdnACzGHvp69ZgDCfqAfiYhkJhF3ku77eAv3xKvdN77pBoeP73tle2IaZ
         rBALFemWuAQEiVmWVlCFyc2UniZt927sBGZJClmYW3l2R67Qv5SUHIDSngYLpa9wV1aM
         Bmnw==
X-Gm-Message-State: AFuF++ne7TajiElHHoXv6UkWJBjf0ETXXnj2K19icuWe3dd8It72ELVd
	Cd0u5kUIEz72CWr20R8MJ7PoB9SOqRlefdPPb+CTxMsYZ39MDBKAlBgyCH/S9YQ5HK0=
X-Gm-Gg: AYBFou0tEzFp3W8mvPWoA8XwRoA5VVQcXpEx7fgXkxR0A/H+s1g0yLJ+/Slz8dp+tdW
	y1pnVFlJMNCSoOOmQ8AzmU9pcPzfEqlQ76ttPZfVSzv2Xbqzl79bxvcdWu6DhDxG06WM+bVrXzt
	P6CKSkAHhv4FuMCZj49NMa4F5eG/M6y4c9F36X4GnAzeaFCdy8uoDxJcPC4LMvU3XeH3bvqZGsp
	JNMtTC62Y9wvzr4KZemrDRtOeX1kgctDWWduK7MSmnwchUUy4Hy5FS4D5ySjZrtGq9i7LcSVYRq
	Ib3u4bCDEfp/Tur7P0kkENU1sYPVwPYoe/WptCvIJwWeyzoUZvN5LTxafy7+TZHQiMUQtKjdPDs
	O0BYjhgj6XL4M6P9wIFwl0rg2a9BCBhjMlyrY02S1LVuCtdf8g0P/weNsBFxYqw9FZUX6n8rH3o
	V3T+hKUEqN8BAyGje4ulPY0VvInmPEmKg/hpbli9lIpjVFFsUVYMlZ9moBip9hf0Ih9AOtv09rG
	NpuIUXgeO19gTUFEx0HZ0l6ViP9ONDNsZ5znu5lMh0F
X-Received: by 2002:a05:620a:4543:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93ca97a9b56mr326511685a.31.1790786299111;
        Wed, 30 Sep 2026 09:38:19 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:17 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:06 -0400
Subject: [OE-core][PATCH RFC v2 02/19] tune-riscv.inc: add 'riscv64gcv' tune
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-2-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246982

Add a new RISC-V tune option which adds the 'v' (vector) extension,
compared to the default.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 8a14971d5f..ed71dc06ba 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${TUNE_RISCV_PKGARCH}"
+
 TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
 

-- 
2.55.0


