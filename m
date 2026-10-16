Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E00ECCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4294.1792184153155551242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fhx/T5A1;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: oo.hehir@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so294664e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184151; x=1792788951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LL/5KO+A0v7ws7LJif5O2SK1+kZjEbYMlMBguWDN2NY=;
        b=Fhx/T5A1F2M7Ri6HjRe7RxuwFVv9I4BdpZU6XsYifqufyaxUtSKkp0ir3NdZI2crUo
         XK2stRaKxROq7s8PX42QSNVXJY1f60s2O/lkNUJK2h0AhgB3hK8WRnWr1CFF10EfFiOy
         AVpfubFjNi3MwhXXcf+a5Gk/L4qsIqe/LmQKWGrnuUg3zj6mF2Q0nh8ZNl/CCdQezMMC
         ITj80k2VVenX4A3LtV80QPtLoRuGmHlemLftaLrGH0rO7leP//WEmP82/oW9BJUc3v7i
         zPJgGylNVA1ux2Odwdk7IeTVQ0HoQtvwq34GFsK4CHzyXFSWDJQpWbZVPZQkdYYIGf8R
         qsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184151; x=1792788951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LL/5KO+A0v7ws7LJif5O2SK1+kZjEbYMlMBguWDN2NY=;
        b=nmVaSMlYVlewx2zzQAtWj3oCr1DXuQQGRVaJ18k5xQR+k73nWsyXNgJ6PCQFnKFZHV
         gaaSYpFXPephprCHG/e3VYcAatklQSe4nYQxTUIQEfI04fJfM9o/O7LTo0UUZRct9rtZ
         9E1As3hA+NjUZEjZUeY6Pt837Q/59iixhPCiejkEJ/YvZfjF6v2MnHVOH4i7z/Pqqe2b
         SOorNsr3XP0f43sOvtNkTq2ASWSHSupw4lsII9xKrZ6Nz2w+S7cacJWGSKPm1YNSjVAo
         javT9Ux8XdTgNQJNe3GfsWdYylZFk617k/9wOAaNjpdIKIhaG/jVHbRFMm+BY3iflnud
         rHRQ==
X-Gm-Message-State: AFq9FYJK57M9J2aUclgtK17meM5g+0P82fdl8bguomg940skiY4wyXMX
	+JeQkDX7/NVQ7KC9i7dKgmRhtFZwip8ymmksKKo2ekvgcQfN/GiaNui/2JsdoA==
X-Gm-Gg: AYBFou25bdOMZQF+Yh2GreTZMXBT9xnn3tm2X/Vp4CNUgGi62tQE/ubHNfaUhEHvFgo
	bvKOFFVhXgJLhs9QG6kVsL0N2z8QP/fE+q47W6gX0ikXwIikjzGkc4jjXVJHlIY2hYgXGBBQxn1
	5mUftrQPim3O960rlXEj8ali+6zxPOtJrvARS7ZA6/WgIAfGlI4SyyoDNNc5RB8qM8rEvKGB1rP
	GHjnbVUYJSlzaq/CnrLDVVHzScajAxavZ2tUSXiGu/8cA5wmX/elln0x7TeYyIh90BUo8LsEFsg
	uZsXTxXGwn5hVYYXvn0PsJUZA6NwH0PMa/BqGkK+Rz2eoE6c0sjZIg6vQOw5JMRvuIyOP9SjgWK
	BSwQbIF/MXo+5vPsRZ6s0jMqXwAx/zjo3JgKzz/hRqxc/k+npWHTXpuPo2vjcYSPiFqV5bvGwBd
	aX+3GLtpvBeakrZRiD5uL0TQEdiXi0cOnfM/ANhQdA5Mq8534hjfZ2sS/FZ1HD/weqc0s7GGn8F
	9A=
X-Received: by 2002:a05:600d:4444:20b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1d760098dmr15570695e9.18.1792183662423;
        Fri, 16 Oct 2026 13:47:42 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:41 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 6/7] ptest-packagelists.inc: re-enable tcl8 for riscv64
Date: Fri, 16 Oct 2026 21:45:35 +0100
Message-ID: <20261016204547.2328847-7-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248048

The previous commit skips binary-40.3, its only failure on riscv64.
core-image-ptest-tcl8 on qemuriscv64: 152 pass, 0 fail, 607 s. On a
VisionFive 2 (JH7110), binary-40.3 was the only failure.

tcl stays parked: under TCG, unicodeNormalize.test prints nothing for more
than 450 s & ptest-runner kills it. The binary-40.3 skip still helps tcl on
hardware.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 97c6e35050..1b76023621 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -164,8 +164,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_SLOW:remove:riscv64 = "tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 = " tcl python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
-- 
2.43.0


