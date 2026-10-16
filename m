Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220EACC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:45:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175.1792161917086509070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 07:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p/RQFwVv;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so826455f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792161915; x=1792766715; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AS4dQWi9au9RNchr5WSyu5s+chaHxojgdCXtB292EXY=;
        b=p/RQFwVvqR1bxEm7YrakG7DcT1HMRPnJC5XshaiR4TjJ4czlEqQZY7Sy7nDdrbxbSN
         bNpPtX/A4tEzDN0tXI2oY1DnJZxPPT4VoH5zWzGQRil+wCF76B1e7D63yIfEQUbCTzEz
         7vYm1gaz+xp+W69eujchaizdR8PBVjLVkQbPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161915; x=1792766715;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AS4dQWi9au9RNchr5WSyu5s+chaHxojgdCXtB292EXY=;
        b=EVjmu5hDAWBFPArEUNXGUu7MD0U1fovIUdKyIj79VPiexExjsTrogVzduc5PGCLKOL
         1Pyp4SBB05Ff+uEbY2cWhyla718lHclZ5WShtdEd5zGRSwv8AsYuBoh4xS0merkCDOi3
         vsBXYI7Jk4CavVJFI+La14qR/1d358D6IEwMrlRFUnnqFoORFtlDQRTkp1NGzRUKGmh2
         OSwXVy2gfOvXC2YgbIdFY/5MpGU0sXPhMOPmDFEkZ/Pi0KjyFfGbWakeSujM306qTrBl
         2Ne37N6zvlhoUfeQlG6PpRrlO4KbLyY++5jq+IRhoNfX9EPgdDl5sgGd7QRj8hOOI22B
         CuzA==
X-Forwarded-Encrypted: i=1; AKwUvBxIaVJAu7PNFriL89NxCxeii+V9DMtz8Ln9aitl+r/RIcVJutLgiWa+lZxWXcCntLsIppPOD2RBKG9spZaxYF0hVA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJkHCiedVJjkclXVwH6vSn3MgKPSiEKTqhQLJB6RC6dMq9Yt2zl
	sAr4hyE2oc0jFJekoodZz+UdZqfVUvlnpSTCpTg1Ik3Xhrwyzb/gdaRXNyQanCtnGe4=
X-Gm-Gg: AYBFou2tHFsJIoS+fBzTXRn+gXsHyElXJLQaIxbGj22Z7DE2cP5GBdCgeI/N2C+1IXn
	y6SURaaLKYyNMw3hR+kcDxPE6brRZLwIuHlyij5NFvL37ItckxtQCfYY/3ndU9nM8M2QDTgwzo3
	CM570BG1hqjHfetxuRfKrmXB/2ETyqaRgUVxgsaEq5N2AwSYQSKyWM96lem3X5PPfVWV7BAdUJi
	7Fn/x1IH5GueiASPxGUNSJ6YwINCWJ0q73eDuuPB9OVk0SzuSq77mqC1dSswyfG+Hn32BKb1vek
	Mns1j1oNyEh3ZMyjD8U15JEZbCGm16BdrVR9fqts2A953846FzYRxJmPahij/igiW5PNMNWjnft
	LCMPdfF4vgJrWdZZuAhQHDeXE+iiBzrn1UVPuGKaYWZb/bBkhajhz4a4r7BdTqOHMneGqCacYl0
	dElwRKcDz8fpUpQwbBW/fDtzDwR/dfkf1oEy00ORNy76f18DUiXLDMRx16dGG7DeVoB1P6ZoFCQ
	bQADwbQS+0cYN3O1Tzk3G9alJ7vJIXCQXzG2NI8E+zCqGOqPsw7As9sTVMQPA==
X-Received: by 2002:a05:6000:708:b0:48d:eae3:b9df with SMTP id ffacd0b85a97d-48deae3baa9mr17577632f8f.35.1792161914889;
        Fri, 16 Oct 2026 07:45:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm4726532f8f.1.2026.10.16.07.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:45:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:45:13 +0200
Message-Id: <DM6CDLB3C6G5.12D5Q0H2Y23W1@smile.fr>
Subject: Re: [OE-core] [PATCH wrynose 0/7] initramfs: backport startup
 optimizations
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <wenwfu@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016031657.690337-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20261016031657.690337-1-wenwfu@qti.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248036

On Fri Oct 16, 2026 at 5:16 AM CEST, Wenwen Fu via lists.openembedded.org w=
rote:
> Backport the initramfs startup optimizations already merged on master.
>
> The first three patches add an opt-in root-only udev coldplug path,
> including LABEL support. Full coldplug remains the default. The remaining
> patches remove short-lived commands from initramfs critical paths and
> allow platforms that do not need early EFI variables to skip the
> efivarfs mount.
>
> Wenwen Fu (7):
>   initramfs-framework: add opt-in root-only udev trigger
>   initramfs-framework: support LABEL with root-only udev trigger
>   busybox: enable findfs for initramfs LABEL support
>   initramfs-framework: avoid external commands in rootfs resolution
>   initramfs-framework: allow opting out of efivarfs mount
>   initramfs-framework: avoid processes when parsing cmdline
>   initramfs-framework: avoid external commands in module loop
>
>  meta/recipes-core/busybox/busybox/defconfig   |  2 +-
>  .../initrdscripts/initramfs-framework/init    | 37 +++++++++++-----
>  .../initrdscripts/initramfs-framework/rootfs  | 37 +++++++++-------
>  .../initrdscripts/initramfs-framework/udev    | 44 ++++++++++++++++++-
>  4 files changed, 91 insertions(+), 29 deletions(-)

Hello,

Sorry but I don't think boot-time optimisation like these qualify for
stable inclusion. Unless there is a real functionnal bug behind, I can't
accept this series, sorry.

Regards,
--=20
Yoann Congal
Smile ECS


