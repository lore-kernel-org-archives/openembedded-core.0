Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B713FC5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 12:49:06 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12153.1786711739302818248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 05:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=daQnNAvX;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ff017d420so27159217b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786711738; cv=none;
        d=google.com; s=arc-20260327;
        b=rEEggYYq9UlnQrMY69H4uM4kl5xrthQvS6ruaE4rOZcTtVUkUTikL8G/niAllNNdlA
         WhhYGH5BYS6kUaW6NSErvwHeUuOgRxPqgWf7VihejvVVYjqfVWK6YEm9wuVw/cBFZOsY
         W6Q5rwqlAQ43C7IakfI2drf8yYbYM9n4GEWkKckioCHbzjNbhdr4onPU5mBqVOLzry40
         5cybv+rzwrtWFF4vtISpa0wEVN/SY4fijrhH1Z9fruBRUFUy2nIohDvZfEHlvz1ssuz+
         bS042tcFsC6zl4+M0hExvFRki+nn2H2gHSk4xIxiWLkRHCTPdAzu/SXxfD2zYU6D/r1c
         iNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlseqNNW/YeH5QA5KupLBmSsSsxGPT2DXOS/LV8zGF0=;
        fh=kWKt4UINZ1F4UonjK/V/OyGHrn7Nboyn6VF2ZUoMrMc=;
        b=fNAQ6BGuArHmpaBEhlMDVZ005XzJ2sb45c8IVhU84hKs62PUUMqFw9O9GQoFQRw6E9
         zM1WmiUDI4wDYc7WVFA/s+CnEIgpR7nKuvkDMoyWicWLsdMG/RepL01f0xIDpCNOFJZe
         0/6d9AuPQribbxjP8SbenWtnK4LqZJnzBJCeD8+TyyQm60AOUbkADA0xNeCrXlecmhE9
         tSVsJKkzRbyanD1Mxh6n+7bj9BlY+lyK7sNGKbWn6m8AzNLzf22qpQvLXFgDXguCVt9G
         H8ijant3290T4OkwcPB6+/0DG754goCJ+Ht2h5HL62EQHUx/kS6HJ/GgU3biz+W33czh
         hZgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711738; x=1787316538; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dlseqNNW/YeH5QA5KupLBmSsSsxGPT2DXOS/LV8zGF0=;
        b=daQnNAvX+FlzbTRzhB3AYlReZ1o/+y6RWOnSnyLjc0jrcvujVj3ZLQkEDTqaeQPeiL
         THSHsWiGNrOyhypx5E4UZ4/7R5wojWST+9nF0R+y5NNLI135uMzbvne/RFXKa/Ctc3Hj
         R91A6MeU+CPICIvm37A3TqETz6oeprrKD/O8rv10uEGPegglQf/JZfLpqRz79p/fdlgy
         GxVAgAm+K87uYR3nBgu2tWhLvpXZSz/c/DA5oK0PmKOH/Iqvjsxjc3Cq2bE/Y/jywT2v
         a/6ABOT3Wxhzx+2jPaKOHdh1/regzQjMZFzgpfaZGnGRI/k08zU1K2raDQ8cEtYkQIkv
         SSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711738; x=1787316538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlseqNNW/YeH5QA5KupLBmSsSsxGPT2DXOS/LV8zGF0=;
        b=loPtegneIoyq4ttfuekHEhCQVWdCLSMpY4SoUjuhydgBOky7ZY2BCoCf22qRCQ9BVq
         WLwJBrLpVhD1zCKWNwM1lhZ4IDsXI1nHNy4v5cRAwChNR7KJcYS8OmjrdCwPa60YmPR2
         oeXkjXr+XNiV4kXVwgnHw4bmFKU8s8EnHWtwOUK/0E988NDFgzAWkhKGFPqy+3augoAZ
         ICrmvrXxnfl3XjOq6SRZ01Bj9OO8udY8psuBmhGBUS/MIY4xgGjjhWjAZnloPCASdS0b
         faxoobGTFnYSzDyVn9bvKhCq3ClJi2KfO6AyUvgCWgdgsJrTRdCtqlC3uR64eoRhr1JJ
         1Fuw==
X-Gm-Message-State: AOJu0YxRluaCEtoakh8vJjOCFq+EOt5A5rsn7IrQHefM4Hcf28GhMXm/
	UvuvLCXs8S0Ctv5/Kr+BYIWTOY9qYPGR1ILw63RQQ09i+GkMOj486dwQRA0niiS3w9ufe+jHbiZ
	CeWC2HGvsVPblunDp42PN4i239knfKDg=
X-Gm-Gg: AR+sD12k88QGkrTwa8kVNI8jv7d6A7F83qDjBKsXhuHkeKrF2IMVC0l5QB+03+CAlrT
	qTK4J7XNtKd9b1nq5c/gTNjh0sGFRxNC7FkiBM3caN17FMmuMUhpjru+kadKbE3HwijHiqbeCOg
	LCfPB/qlFcOnSAT/N07e8s3D5MF2e60A4U7KpmJhXR0NS7Mw3I3ncxgLXstxPOUpBSUL8uC9MMy
	BIFWoUP20p82mlYE8/oLrQ2LEiTzFTXlj3v5iqOQXpCOEyZilUjdLBG91JRVa/1bBhV6wpudGgO
	e0k2Qq3qj14ibh2Dj3PMBecpiBfhLr6JxCT8RWoQEWhqUVa+dgFmIep3eQK6jlxspV8Vjmp1Y2E
	+vqp95jdbjHvEifcW7ARZHboQpzbJ7hzqcRJqKFcNfJM8xkfS3fgVeB1c0SbDkcw=
X-Received: by 2002:a05:690c:c510:b0:834:fadf:603c with SMTP id
 00721157ae682-8370d7e9fefmr22553657b3.2.1786711738212; Fri, 14 Aug 2026
 05:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org> <20260814064812.1071873-5-mikko.rapeli@linaro.org>
In-Reply-To: <20260814064812.1071873-5-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Aug 2026 08:48:45 -0400
X-Gm-Features: AUfX_mz-GXpCQoyG0_hqCWpxry_hHCmEZ-ZMGe24ym0F45iTOwxh2PDzYpd2-iA
Message-ID: <CADkTA4OfiyTA=V+6s_nu+27HK6PZXcojwm=H7AkOch1huwFDHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] kernel-devsrc: copy kernel/sched/ext directory
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 12:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243449

On Fri, Aug 14, 2026 at 2:48=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> ext_* files were moved there in upstream commit
> bba2c3615bd sched_ext: Move sources under kernel/sched/ext/
>
> Fixes oeqa kernelmodule.py failure with 7.2 kernel:
>
>   CC      kernel/sched/rq-offsets.s
> In file included from kernel/sched/rq-offsets.c:5:
> kernel/sched/sched.h:4214:10: fatal error: ext/ext.h: No such file or dir=
ectory
>  4214 | #include "ext/ext.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Erro=
r 1
> make[1]: *** [/usr/lib/modules/7.2.0-rc7-yoctodev-standard/build/Makefile=
:1408: prepare0] Error 2
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 0b52f5d48c..da33e9facb 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -368,6 +368,9 @@ do_install() {
>          cp -a --parents kernel/sched/ext.h $kerneldir/build 2>/dev/null =
|| :
>          cp -a --parents kernel/workqueue_internal.h $kerneldir/build 2>/=
dev/null || :
>
> +        # 7.1+
> +        cp -a --parents kernel/sched/ext $kerneldir/build 2>/dev/null ||=
 :

Is it actually all of the files we need from the directory ?

We avoid full directory copies wherever possible.

Bruce

> +
>          if [ "${ARCH}" =3D "mips" ]; then
>              cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
>              cp --parents $(find -type f -name "Platform") $kerneldir/bui=
ld
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243422): https://lists.openembedded.org/g/openembedde=
d-core/message/243422
> Mute This Topic: https://lists.openembedded.org/mt/120745544/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

