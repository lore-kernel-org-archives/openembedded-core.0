Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC81CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 23:32:31 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.456.1790897542593442447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 16:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eTIWflTR;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so3482450a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 16:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790897542; x=1791502342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdO26SS3axKM5w7L6+phO6OcjjXl9cPxa9A2LDSVyWw=;
        b=eTIWflTR/hPx6Oopi6Rb+E+rF2cGQuSxiQjhRzC8L4fwz0uK80vRyJ8ozkngX8SbrB
         6nfbS7XcZLvFdHuTgD9CM2e4OwfOkK2DvEP+UrUIpgA1fftuu0dr3h+ZeW1zal8dSMsD
         aYfSDSM/2hT+u9vXl8sKc9fquFk1tbWrSEAp6NjhgHK8M7l/qESLpR5VRyf2Yyu0H5zn
         8XrRYBnUPDRN+NY8d76KicVWVceSO2350zgacoV9hg/WZTlqqJIpsEJ91pp/yXMGSxSl
         SC4WydFyHoR7sV0nmb61VkpsKRhcNnBd1yIDYJ9xL/uRQ9XTFFCrbHnUbh/Byd+nFWhK
         l/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897542; x=1791502342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdO26SS3axKM5w7L6+phO6OcjjXl9cPxa9A2LDSVyWw=;
        b=XfDEGrRoG5Bhttwc8SrsAQjT0udQAR2QnO24QSlF7bEeS10g8fX/gFFQJzCcnxJIx8
         P6w8CPXmq2YNePej9uS4xNx4TXQVND1adEXZTUKwYvBAdCgDkKYxvVBUcBUxe1u6UnF8
         /SvdVRN6E2dQ4938FWDzfnZ+bGaV/1blpTl+o/anRcUR3I6dI0DukcPtAhkeRvHvZ1xt
         I7hJjsJmUGYJaJcT1EOWThptG3s32mav3lTGucaAMXfX4rKOXBkFH3YrRkjo/shCMzk6
         L8dR6Nsu4P0VA1WZasGRVmATken7xRPZm6h7QTDm4xjTJJHLZEBHEnHvgcPXlGgz69/q
         IhHA==
X-Forwarded-Encrypted: i=1; AKwUvBxh9Vm1C2f4cZSfhGTNFIywjkmXSIsXvz1RnojUEpulq8/9g2idiyJ5jUlUQ7Q33fYWPPI5d9ChYvd2+dOtMT0Kcg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mJdRbjUC8ZGklqBQqT6jKoc+XdLDV80hx/ihbk/8ulGmTA76Fl
	WWxDbsBBVXpx4oVG0Iwh+MOVGFHoheaZxKFs50BXjTPDwF+3oNXpuR5G
X-Gm-Gg: AYBFou3qXIDwJsCcUH0syCJNLmBuQh5MNxx/tT7J5uRW40JiFhjjU0EtT9MpbAUCYe1
	BEWaYFYbnIqQGfRhsRlmkDGA/WczSqdWXa9cmyTWjPRCFTWcrX3xYBnCRf7kEVeHSj7iLGPp9/s
	P+mV1BE/hqARQiem10XOTyeSnxSDVLEfs0QsSKXpZreUDWfxL73iVWOXp5lxFlQv6qKSa1ebwhO
	W7xXcH7j2Lb5FP/wIc/nw0/s3SQQCiZnApqVN4rXMEd8/qaq+roNM26XiqQrhVhMst5kcSQf151
	4RaxaU5wJGEttC2vjj4E6W6qakDvergTECDIQx5pSWmhAAUexJPj3tSn/UspJGi1linkl9TmlTQ
	ro2SJT4VGap3pebBD+36Y/mk9Np0sgeRs7egbvojTEWSV5IPpbqFWYWzKpjT6w8OnQqUmPZN9zj
	yy4zr/SHdVbGswyTiAIl9wQYSZ7l2HePGOLNAw1mID/e1Ir1qQQeuNipzvZgyYD7HW6z4wsGdwx
	fkr1Zmf
X-Received: by 2002:a17:90b:4b11:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3a6ce97b2ffmr910781a91.30.1790897541792;
        Thu, 01 Oct 2026 16:32:21 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm270055a91.4.2026.10.01.16.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:32:20 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Daniel R . Slater" <daniel.slater@thermofisher.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [scarthgap][PATCH] qemu: restore 64-bit file lock handling for 32-bit guests
Date: Thu,  1 Oct 2026 23:32:20 +0000
Message-ID: <20261001233220.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DL2XY8C5ZSTE.3K2H4I5KEF75F@smile.fr>
References: <DL2XY8C5ZSTE.3K2H4I5KEF75F@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 23:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247054

On Mon, 2026-08-31 at 09:12 +0200, Yoann Congal wrote:
> I don't understand how you can modify a 0002 by backporting 0001... Was
> Khem patch reverted? In that case, I think we better remove it and re-do
> the backport with non-reverted patches.

Fair, the trimmed 0002 is confusing. Nothing was reverted: Khem's patch
was never merged as such. What qemu took instead is two commits from
Michael Tokarev on 2024-08-29, both in 9.2.0:

  ac1bbe8ca46c linux-user/syscall.c: drop 64 suffix from flock64 &Co
  99174ce39e86 linux-user/syscall.c: eliminate other explicit LFS usages

The first covers the fcntl side without dropping the guest F_*LK64
cases the way the local patch does, which is the bug. The second is
line for line what was left of 0002 after my trim (truncate64, lseek64,
pread64, pwrite64). I only backported the first because it was enough
to fix the locks, and I agree that carrying half a local patch on top
of it is the wrong shape.

> Also, Khem's patch is merged now, can you fix the Upstream-status if we
> end up keeping it?

The Submitted link in 0002 points at a series that never landed, so I'd
rather not keep it. v2 follows in this thread: it drops 0002 and carries
both upstream commits as Backports. With both applied, syscall.c comes
out byte for byte the same as with the v1 stack, so the lock test
results from v1 still hold. qemu-native builds clean with it.

Thanks,
Baban

