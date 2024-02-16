Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56BBC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:50:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.19086.1708091393449781563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYtwRqRy;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29938dcb711so294181a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708091393; x=1708696193; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z4K1Czv2/du0NHN9lelVQs0WFZ9MGYaxP5EcVPlENQ=;
        b=kYtwRqRyWzsnsGyhqFPBI/gRE4gipeTjxrU1cFR1GU7A4DAnzyS7kupEWfTjp+6HRe
         RLoltjE91TNJ+6cEIBeDHZaSYSXg3Hdv2DdDCDgJs0O1nAH7x22/IC93CHj6yfdnQ6OY
         svAMi0KnLIpnwoXPRsFaoWPDIM3wmcUK6rpZmwm21Q+Guv87yvnWuID3WnGScZ6cfzEB
         +XS9NCJK5jjp5OXoS6Xa2x3exXN5QuQf70daOaPSyUJwOSHL0Sdu9cy5isiUzwMTyiLS
         UJj7oI27uc56grccuWkIA/YRuS+oWfBusXVc/npRYE7tnuhMOxNCfx1d4rNC8MIi5KPe
         CqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091393; x=1708696193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z4K1Czv2/du0NHN9lelVQs0WFZ9MGYaxP5EcVPlENQ=;
        b=isVaB1fnf8DRvAORkTqY8vDOUNSkbTsSKb+xvKm0wRimydYzctPfDqgDFEH2+aT+SY
         IsOU2go2PgBJ3CQGdLp/QNeSv0d8wAOVJ8vV1zGOAz/xba/RhEyNHl/t6y8QlApom6M3
         tWs6TMdWQLnh3ex8Ln3ZZ5ibXOl0NdwrbEukRv5+IhYmdlmNURC+joPDmHo+5hn/AXbR
         HtGwqXPYGrUwyHkDrOhKB99/JZMrTBbw9TrMm6O8LMxzZ1Qmcjn8ZX4J6Ti7217G2Ltm
         PgzXauExuC3XLiv8XprKKWEDBnDPTmCitAT7URLsanPR7y7qtq0JQUPRMRLKTfDgcdZV
         kMaA==
X-Gm-Message-State: AOJu0YwBRQCygiOlf7Ks6xk/0NVbPMpLDUziBfkb4UzT8h7WWa+yLdEt
	+9nzxEuosao0jCS8tn26Nji2O0GNX7HOl1QzeUa6ZPjRMHlfJ8gj6ZCcPuKkXUXyFywvCBRgwc8
	xJVR0BZcgfENshhxYEDsxmq+v9Dw=
X-Google-Smtp-Source: AGHT+IEkWPb9GVnMAAxh9L6LpD3guHMWk6eXxKK84Crt+EGAvWATcoG4IJAI261NcxNO0rxvZRAnscf/32hpvQH344w=
X-Received: by 2002:a17:90a:8548:b0:296:7d7f:7de7 with SMTP id
 a8-20020a17090a854800b002967d7f7de7mr4531317pjw.42.1708091392489; Fri, 16 Feb
 2024 05:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20240216131226.124806-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240216131226.124806-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Feb 2024 08:49:41 -0500
Message-ID: <CADkTA4N50A6CB_uHEz-+LwxTSJ9wGg-L-jZNcQS__PC_u5+PfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: Improve vdso-offsets handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 13:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195768

On Fri, Feb 16, 2024 at 8:12=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Fix:
>
> kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/6.6.15-yo=
cto-standard/build/include/generated/.compat_vdso-offsets.h.cmd in package =
kernel-devsrc contains reference to TMPDIR [buildpaths]
>

Did this just start happening ? I test this with all my kernel
releases and I've never seen it.

So it would be good to put in the commit log what caused it to start.

Bruce

> by adding to the list of files we do this with. Also drop the
> conditional since rm -f handles this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 55cac1fc817..fafab475f3f 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -130,13 +130,10 @@ do_install() {
>          # breaks workflows.
>          cp -a --parents include/generated/autoconf.h $kerneldir/build 2>=
/dev/null || :
>
> -        if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
> -             [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd=
 ] ||
> -             [ -e $kerneldir/build/include/generated/.vdso32-offsets.h.c=
md ] ; then
> -            rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
> -            rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
> -            rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.c=
md
> -        fi
> +        rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
> +        rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
> +        rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.=
cmd
> +        rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
>      )
>
>      # now grab the chunks from the source tree that we need
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195764): https://lists.openembedded.org/g/openembedde=
d-core/message/195764
> Mute This Topic: https://lists.openembedded.org/mt/104391979/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

