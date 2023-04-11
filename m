Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F480C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:16:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.14939.1681222608948521866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 07:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=l/PeI29F;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id z26so10497862lfj.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681222607; x=1683814607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwT/XCsBMi8i1kv1zZT3XEumyV1fG/PD2xvsYc573CE=;
        b=l/PeI29FExGzzpc0IJomQmNbW4OYz2TEB56Jhwq7KiEiIAblN73uXocox8FO2jka/o
         XAHo0XVhFGoUGZemj4kKrlG9stLAA4GEG0OqzJCVYZoKieXY1wDBpkolr3j3tjKUB2kj
         azZmiPf+b72ap5QvLJP6oyoGk+abhlgH61gfxEx0exstHSdL+I46FGaO850pnkMBTxUt
         RFYTJvBX0SmPfMiW4fBN+13uEPayVtdHZHcq5bbrY7WdBmN3AZZaMtbZCzrASwuVs9QL
         e+GySGXN7OkOwZDAFyxqQ7v4Rbkf5E/KdS2qEx+mANsHJaGCBauVf2Vqx7p98l9pBMGw
         Ui3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681222607; x=1683814607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwT/XCsBMi8i1kv1zZT3XEumyV1fG/PD2xvsYc573CE=;
        b=S03T0mSKpcOovOWjkBQh7DH1Q0yBGoYzO2YF+5GS9ijjGv4B5nBRziSW1H8d7wgRiu
         sSN6jKNU0Iw+f7RczUpxCGfgaTwVznKRi+PlKzUyGqAag4CCi0d1xceBMFMhHf5ygLRt
         LfGpxADhNVvwKyuVJdR0BL4txF+eFIRpUyVbz5QTfp18ru+CZtiKCGbd9HpqzfMHr/m3
         VCYjE75nD3MO5YEds42VpkvKMWuWiIRPnbWc4QSwrftCw8jmFFLVkm7Yue9deLRCd6Mq
         tq8J4/lseOj8X1MijkIJscgBFs44n0liFShctIVfqj4vHXAoCnGKKdH5rQ0WYZitkG1l
         BUhA==
X-Gm-Message-State: AAQBX9d3HPXrzlbXKeUwD1G8Ird02BHgQReC2bav1HT9+7/SIzr/uXie
	uTL81GU8/RHW7E8HEzIBjpKd1S44Ef75d5gYQ4M=
X-Google-Smtp-Source: AKy350ahAQh2eTny/OqOq9HhcsXrdZSlPAAxodx0sfZp7ycZRb7DnRaSNEjc3J0Oh6Ki4bYKLsvo0kPUMaTpMRre8fg=
X-Received: by 2002:ac2:5549:0:b0:4ec:8087:b346 with SMTP id
 l9-20020ac25549000000b004ec8087b346mr3068811lfk.11.1681222606856; Tue, 11 Apr
 2023 07:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <20230331104025.1478393-4-ejo@pengutronix.de>
 <CANNYZj8qDFMKa5HhnK=k7+Le=h_rhmV2Mm_WreLwjfbYWxiUcA@mail.gmail.com> <5edb0cbe55f0b194b89b75a2c34b74b2f343f2c9.camel@pengutronix.de>
In-Reply-To: <5edb0cbe55f0b194b89b75a2c34b74b2f343f2c9.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Apr 2023 16:16:35 +0200
Message-ID: <CANNYZj84_aCYbEZ3kOQRYZqgE-Q_LQ9mmJZH7euN5YEYX0vH2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] barebox: set default BAREBOX_CONFIG for qemu machines
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com, 
	afa <afa@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179920

On Mon, 3 Apr 2023 at 13:42, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
> > > +# set defaults for oe-core MACHINEs to allow building barebox
> > > +BAREBOX_CONFIG:qemuarm =3D "vexpress_defconfig"
> > > +BAREBOX_CONFIG:qemuarm64 =3D "qemu_virt64_defconfig"
> > > +BAREBOX_CONFIG:qemux86-64 =3D "efi_defconfig"
> >
> > As all three are different perhaps there could be commentary in the
> > recipe explaining why that and how they differ? Note that there's also
> > a qemuall override if there's a single configuration that works for
> > all qemu targets.
>
> as these three are different archs/machines, I do not find it surprising =
that they require different
> configs. I assumed that this was self-explaining.

Not at all. What is this 'vexpress' thingy? What does 'express' mean?
Why does it apply to arm, but not arm64? Why arm64 is using
'qemu_virt64', but not any other targets, if that config does not seem
arm-specific? Why is x86 using 'efi' but not the arm targets?

The choices you made here should be explained.

Alex

