Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744B0C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 18:52:54 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.2157.1709751169915550736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 10:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/EDcEv7;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-22007fe465bso4213405fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 10:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709751169; x=1710355969; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6ioEkOmmLiYs2zGIj5gXz0C49NMPPEURWGCEiV08kw=;
        b=M/EDcEv7bVo2YLwVejmE/9mD1RYOCfMRAi8UHC1GyRhp0sVAKGGeIAmrCs6ZlbLn+S
         n3nhScZPM1sH5hK7miuFD6x+/jFAmpJMv7sCc5xZfKulOCSsXH1IPMQ7kriMxB0LFE+4
         zy19flNPknnBXvL7M4ohCfQhIeloOPJPnp38imYeXFNFZarEDerKsGodhAQHquDjryR6
         6AOnVper43jWdwH3g2rrLu2ovlQwS0T6k9xMbfWDw/M2BwQIqajwu6HrjH9oRVsfZ6go
         2RTNAHNnKk2qTJHi9W8v+8nVAy6AxBN+fF9CFRHjIGzLYB66kfuBDOPE/Tq7TuKu+MxG
         KQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751169; x=1710355969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6ioEkOmmLiYs2zGIj5gXz0C49NMPPEURWGCEiV08kw=;
        b=qkOpylUGJbIG3kOsRn814s38SqxG/Jh0nhgUNWDoyXbi3dkojsvhFXblCb/hdf++aW
         s7YIvzTw0hN5vwBs3U2klkNpqImjFAOWuwRz1vNxYXnnt7TtXJKc3E+Da/rTZFhH0Rj5
         fiFTjETujQRBEpTdcF5xXja2hGNDMtAY9DFULjzaYIIuD9SO0PUpzUBO8976QtVk8bUb
         NE5RLN3wZ9cl91oBhJuUvofbUGL0ATwr5KJIMKVClic/mtmPfx25bj5PTWfaNwgDI6iu
         tad8kutZ/PNBkofRJ7QG6t31US7rqyS4B5mTXZiwljaLcYCOnkdTrpnjUXpuP/lmnqlz
         KQTQ==
X-Gm-Message-State: AOJu0YzaBep3LL4OVuY9GByjUA0aojGXA+xJlNNHn8YYl5SMrXIXsXMP
	Pa+pPkVkLvMVTmjE5JDX2Fs94VIyIz2xH+ED1W+cthW5oK3D/zO25T8Ykl/EmwrTmI2OPEp6H74
	F6KpbiCl2FLGmF3h6CS2yaTJklek=
X-Google-Smtp-Source: AGHT+IGpWQmEB+7dgdv5NnCEduTtwddPEBZPzTRdco/BMTskHBenMkLJSfjsft0tUI8VdI0RIq+RP31sa+4CrRSlwzI=
X-Received: by 2002:a05:6870:c391:b0:21e:bd75:1947 with SMTP id
 g17-20020a056870c39100b0021ebd751947mr6015327oao.59.1709751169005; Wed, 06
 Mar 2024 10:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org> <20240306162341.2267587-7-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240306162341.2267587-7-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 10:52:22 -0800
Message-ID: <CAMKF1sr84E-VvgKDMor9Bx_7BtZtQ1VwSCi_4R4Qi=S0+b6MdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] oeqa/runtime/login: Exclude qemuriscv64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 18:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196751

On Wed, Mar 6, 2024 at 8:23=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> From: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com>
>
> Excluding riscv64 due to mouse rather than a touchscreen which adds a
> moving cursor, so the diff ends up > 0. Need to fix the image to use the
> touchscreen rather than mouse input.

Is it an option we are using to start the qemu which is causing this issue?
I would like to understand more

>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  meta/lib/oeqa/runtime/cases/login.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime=
/cases/login.py
> index ac8a0454f38..edbc48ac205 100644
> --- a/meta/lib/oeqa/runtime/cases/login.py
> +++ b/meta/lib/oeqa/runtime/cases/login.py
> @@ -28,7 +28,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
>  class LoginTest(OERuntimeTestCase):
>      @OEHasPackage(['matchbox-desktop'])
>      def test_screenshot(self):
> -        if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuris=
cv32", "qemuloongarch64"):
> +        if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuris=
cv32", "qemuriscv64", "qemuloongarch64"):
>              self.skipTest("{0} is not currently supported.".format(self.=
td.get('MACHINE')))
>
>          pn =3D self.td.get('PN')
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196741): https://lists.openembedded.org/g/openembedde=
d-core/message/196741
> Mute This Topic: https://lists.openembedded.org/mt/104768948/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

