Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71293D3515A
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 08:30:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8173.1775032239744280886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 01:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PfP4d9Et;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41c5a81d4b1so445218fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 01:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775032239; cv=none;
        d=google.com; s=arc-20240605;
        b=MmtfCZm/AAU5DWV2S/RPtRK5lGVG/GM1LQHNA+wtJJ3WCz56dj3HOpg3CFCgW+/Ah0
         b14XdQn8y4eLUeiORIvXtIzLbcbAzKHlkfBsUSd0ltWhoM+PDEHqBkwr3eiJYlTtTuzV
         RPPs92zHYmsdwyuOzxE8gzfPZB1car7Gqb1hP6D1/FZxaNnIgHO889fDBaaVxPoGh1K3
         pu1tvny0C2kEa/GpVeXpyjtoTYx16mYx869Y45XxDfE6mgF61EGsDVOKka7JRo7FN0+I
         4Uk6cP4fSYqpb1V8uGfpc4mVdTB3jZiCxgl/ubYC8E4dGdDmbFdoycqT5Z+QGJfcrQ91
         kx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joDcO6UcXpV2qE4zTG2Pe/L6o9RKng/P0jcpiNiY+Lw=;
        fh=lEwXzcRC3XeFemkHkWhnXNLhAdcwZw4QZejA9SYiknk=;
        b=V9GjDMwiGwbftMNXPMqbuU5KrABpoRfFhJLqmngBUuB3piroeKBQNJ4ae3Mj7epvv3
         I3eOsgufPcprdMvy9fT4pW1nsc40ghbqH79e0GKjcqddXdG9ajOu205uJEJgKDTotzBr
         CGZA899S87AVHfLZZ711U1BqUP9MR/tRUjQQcV8SyNhi3+qnV53vyMWK0KGgmG4gz6wT
         9bRv3zYCbVPpOYie9RuNRAahgTt+4QNlFJ+TFhFY1Q06htkhKvb4xx7YLhLCgCnugnZu
         dGadVqyw857bOR/5fi8Xo5rDCauHIZ+nHsvwGQ5d8h+4pskpVi4eYEScg7Eb0jSP2QWi
         4KwQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032239; x=1775637039; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joDcO6UcXpV2qE4zTG2Pe/L6o9RKng/P0jcpiNiY+Lw=;
        b=PfP4d9EtKEV6ICLqlQgwcy64YGZiI4TlDecw0ErvKabiSj21v+A/E91FuRNtMl3No3
         HkSc+05MKDZ+F1e7mGhm5qOY4TYqWB8qitws2a9wo+rn/n8nELkturmGyRIsmzfiOoTx
         kOzB2X1ZmXxfNcm5++eNYwGlPknkOym5XM+7wkhIRpqVIwNfcewLEXLwogq5nU4ekKyG
         /0boA+QdxLTfCm4WCYtm4nvEkTIcbyHP7juf/uDHbaZjpQPo/Vi26TTYJdwxeKcRCszC
         lHHjKPNoYD4NCoGL7780CbTJKr4heDHHVnp74Z6RegvPr3/zGRQ5w7Lf73eMzX8D8xig
         FW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032239; x=1775637039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joDcO6UcXpV2qE4zTG2Pe/L6o9RKng/P0jcpiNiY+Lw=;
        b=b/Mgx4BMr+VHwIPRcaQT6jghgK4fkI7D+OofGEDKpElDV9s6ywjd+q3iXRqyK5pA8X
         zPwj0cCt53OowfUQyJhZrqeXcyfJOzOYWZhYxRV75RK7ue0fpP6vxxXjzlGqVnwUDYCS
         mnAkvirWpM6rI/2/HDlBXCnWQGQQLklfk8WaTJVT5+LMNkyOGaakEb6AnwigiOiID3Dg
         VSBTbYmtn3UhjcTRhuo6oiaDAr5yOdEdttpy7fz1MSmXhPhYuukgiXJYXJPoBIV0xz1f
         ezr1t1l0kUbDPnKSvMDYsK5LCyNCwykY9lZRNEiDXZhEbDD32Hl4kv5g6ghEza285Ilx
         /JLg==
X-Forwarded-Encrypted: i=1; AJvYcCX0flJNlDJwEIAgMebXiGzwUIlhRCkFKK1ScgRb2qzlDCDqDsk3kuzNsA9/LkWU0LaqSILfiZD1v1HkDIEWVLAnUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylYsFyK2y0E/59LpLq72vcjizdV1PTeLKbyBqCEftdjmXIglxf
	Xa412/T0/PhLlipxuPQbfZmsT3K1rovssTrTV4ej7Cj0FWOTWbeiy5gw4FgK7MJG+2LkmZiFkxa
	98qbxSzm553qV10sV5bWCM6eYAfnToO4=
X-Gm-Gg: ATEYQzzo5mJpovq8Ugdpd0NUEqbj9UkysK3yMDdfHPCpkDDvWR7gUPm+y1dlhWa57xr
	jzvn+nB/CpiLTGI2nTSnqOJs1ipcYdA86nEQM2DpxWsmQC1ISopxodeGEVOrqT1yQtYDI+pVuCo
	LCIMivNJEBsddRfwzF+Okr85+uk59LefFLFgHSDrL803Rmrm5doxgvPkR8gZt82G8y9yehdfGnJ
	AUseCiAitMRGg43MuWjGB284QEPxchR9ZInR61+PS2TwGrQhbT4bW415zIqVZDIZhAAxLwA8zYR
	2kHWZ1JD
X-Received: by 2002:a05:6871:780f:b0:417:6f:9679 with SMTP id
 586e51a60fabf-422a54b6cd9mr3892064fac.19.1775032238910; Wed, 01 Apr 2026
 01:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
 <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
 <CAApg2=SPPo68XtvWioHO_T1=5EQiNABnntGJhM59hDkWhm6N9A@mail.gmail.com> <df72394376fdd01fe7d3298c4d3995f00705fc16.camel@linuxfoundation.org>
In-Reply-To: <df72394376fdd01fe7d3298c4d3995f00705fc16.camel@linuxfoundation.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 1 Apr 2026 21:30:26 +1300
X-Gm-Features: AQROBzAslam3t7g4q9uRQYZ8IKAUtznV0MmcKN0JPG8j1HjHvulxrfUiXUXXGPc
Message-ID: <CADySD0H+BrKnYc9ZG3QbkKv-mbj9Ow4ZB0VpUYURHRuhRfSwuQ@mail.gmail.com>
Subject: Re: [OE-core] Runqemu error on core-image-minimal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: rybczynska@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 08:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234332

On Wed, Apr 1, 2026 at 8:49=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2026-04-01 at 08:04 +0200, Marta Rybczynska via lists.openembedde=
d.org wrote:
> > On Tue, Mar 31, 2026 at 9:35=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmai=
l.com> wrote:
> > > On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via
> > > lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org=
>
> > > wrote:
> > > >
> > > > Hello all,
> > > > As mentioned on the call today, I have an issue in a configuration =
with bitbake-setup, oe-core-master fragments and runqemu:
> > > >
> > > > $ runqemu qemux86-64
> > > > runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e  ...
> > > > runqemu - WARNING - Couldn't run 'MACHINE=3Dqemux86-64 bitbake -e  =
' to gather environment information, maybe the target wasn't an image name,=
 will retry with virtual/kernel as a target:
> > > > ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHIN=
E has already got an assignment.
> > > > Please either disable the fragment or remove the value assignment.
> > >
> > > drop "qemux86-64" argument, it is not needed since the machine config
> > > fragment is set.
> > > "runqemu core-image-minimal" should succeed.
> >
> > Hello Ankur,
> > This leads us to another problem (also happens if I remove the fragment=
):
> >
> > $ runqemu
> >
> > runqemu - INFO - Running bitbake -e  ...
> > runqemu - ERROR - .zst images are only supported with snapshot mode. Yo=
u can either use the "snapshot" option or use an uncompressed image.
> > runqemu - INFO - Cleaning up
> > runqemu - INFO - Host uptime: 17100244.13
>
> Try "runqemu snapshot" :)
>
> We should find a way to fix the MACHINE=3D issue. We did briefly remove
> the support for using bitbake -e entirely but it was requested we put
> that back.
>
> The snapshot message was added recently to cleanly support compressed
> images (also relatively new) but obviously the new user interface to it
> could use some improvement.
>

You may also want to enable fragment
"core/yocto/root-login-with-empty-password".

And if you want the guest machine console redirected to your current
terminal, then append "serial" to runqemu arguments.

So your final command will look like -> runqemu core-image-minimal
snapshot serial

Hope that helps.

cheers
Ankur

> Cheers,
>
> Richard

