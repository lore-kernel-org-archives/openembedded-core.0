Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1132C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:58:15 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.543.1752771492393993367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DIo0gdEv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8bd171826cso1164619276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752771491; x=1753376291; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BB2/ZYBH2j95f+IFvqlGPjuPCYQx+kOJLM4gtT2p1o=;
        b=DIo0gdEvEuXNWbT0N3YHtSe6Jpiy89qUvcEqSdQS0cdBdBofZmJCy57QRxmFyi2cR4
         9yMpr2l+3VLVMshOVbBfArX3UkVNcr/dzDZMJIi1F/QK94XR7A0sKpxt+5IjowmVWtWD
         8eminfpy2hHwkwBqFQ7NnXdt247MeE9FGTLIpXt3ui8LDj+VHMNnprjkgi9uy/G3TCxU
         Nlqvvtkv4lZxP71X4vkOWDkRNkNxCwrdnvaUPkh8XX1qJSFtuRZshN1I+5J8xYVV1lrN
         Wnd4vL0KgaFCqPTAVmQvAVyriCyAnk5OGhb092tZfwf9NUVtY0sHbvBnuZD4n/vIkU+R
         GIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771491; x=1753376291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BB2/ZYBH2j95f+IFvqlGPjuPCYQx+kOJLM4gtT2p1o=;
        b=LlGvQwOgxHzpA4/IkHCCqGPbEWuamf9s2HhqlCO2xJ4n9R0nOAFmGjG72Q8T1eeFzy
         672sMsBZlksaMqHZa85/oFvSFPlW/vBfQcAMsShlkpEE8qRiFGVbxCvCON1urRqhIln8
         rZBZbGjrDmnYVHxYqSS7dapBvb5YvDYQxtw6EqoJeHDyNxGNHgr591nWAqIoTGO312Pz
         DQWRh8bJ9Q5g77YxvWjtwcqKiCvLmQVT3kwENzKGxA8rbawDf1IcA8/VhbJ6VBkiBgbn
         nDjOJlvAPfNQTm0ELiYzJYxmdYvJYOozyscXScLkpCjLEtTWV1IlsJDfiqpHtWbZEd1L
         xcUQ==
X-Gm-Message-State: AOJu0Yy944v5nzXbMFmZQrfeS9uueDEsxVh3kNRBfjQpk6+I5Xj0QRjT
	PDpLz/e5FF3Pa3ZRs8hWKQ77C3YKZ7E7spxBhLsTUxjJEb5BQzSgVS5C1DG0hYiS42wX8Wfiy4j
	Ltoxjj8AGJ6W7gbIGtCa48u2ZT7mVj0YKNl8z2gE9Vrlgl+IClyzc
X-Gm-Gg: ASbGncvOX1oy4FGCOfgwrcndIMr7feWAmWsP9gb93vhcSuveLBB7+1przpd4E0U0BVA
	B87hY0XwSXYDB8xknqwU9mP/QkjWZsCNWe/8sNa8R9gdkB2p7xltu9/jrR8jm/pfA4JMa6dASE5
	eP2+bReOcfKNC/kxXWkFgnuzRuc5weGPErXxrNLmjPXA1qYDnG1xPjEBWa4tDAAM44u9HzQPuC3
	2+o1c6q8bQjJduB5RkrU9FXDGN2PUf1u013AeU=
X-Google-Smtp-Source: AGHT+IFecU9HZlYciTch6VNUJCtJ6/jfS8H01UAVSKK+VYV4uKsjx5871sh5tI/eedh2YXfPwmXrzIlHVX1V0guM1FE=
X-Received: by 2002:a05:6902:2003:b0:e82:1a1d:8479 with SMTP id
 3f1490d57ef6-e8bc2479462mr9144056276.21.1752771490955; Thu, 17 Jul 2025
 09:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250717080929.3619031-1-libo.chen.cn@windriver.com>
In-Reply-To: <20250717080929.3619031-1-libo.chen.cn@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Jul 2025 09:57:59 -0700
X-Gm-Features: Ac12FXz0zRY0lAD8Y4axRL6ow12ctVJ6YApQInzJYtAwn_zGccgAUv3R7d6rMYQ
Message-ID: <CAOSpxdZSTfm3Y3wuHNmarJyAz3SezOCj9_R9a_kfcSbzqrzX9Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] runqemu: fix special characters bug
To: libo.chen.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220555

This should be submitted (and accepted) for the master branch before I
can take it for the stable branches.

Steve

On Thu, Jul 17, 2025 at 1:10=E2=80=AFAM Chen, Libo (CN) via
lists.openembedded.org
<libo.chen.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Libo Chen <libo.chen.cn@windriver.com>
>
> Fix the following bug for runqemu with a file path which contains
> vmlinux characters.
>
> runqemu - ERROR - wic doesn't need kernel
>
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> ---
>  scripts/runqemu | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 2ab36fd03d..f189dbfb60 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -368,12 +368,13 @@ class BaseConfig(object):
>          - Check whether it is an NFS dir
>          - Check whether it is an OVMF flash file
>          """
> +        n =3D os.path.basename(p)
>          if p.endswith('.qemuboot.conf'):
>              self.qemuboot =3D p
>              self.qbconfload =3D True
> -        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
> -             re.search('zImage', p) or re.search('vmlinux', p) or \
> -             re.search('fitImage', p) or re.search('uImage', p):
> +        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
> +             re.search('zImage', n) or re.search('vmlinux', n) or \
> +             re.search('fitImage', n) or re.search('uImage', n):
>              self.kernel =3D  p
>          elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or =
'.rootfs.' in os.path.basename(p)):
>              self.rootfs =3D p
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220518): https://lists.openembedded.org/g/openembedde=
d-core/message/220518
> Mute This Topic: https://lists.openembedded.org/mt/114199800/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

