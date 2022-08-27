Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A6CECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:24:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.51772.1661624636826638109
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C1k/Tfnp;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id t23so1181104lfr.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=ER7oSS/J651lsBSIL4KQ2ogl+LNztksvkt2V7M3ww+c=;
        b=C1k/TfnpKEu+4fYPUX6SF5SpanO8u2I94u2vndPXRei+0Nkc6aSSkYjgfbC2NQbX9D
         64fuPXp4qLlMl5+HXXGPU7xmCexOxdxTnXml/xIZi2YSLlp6YKhLjQwPXb0S1/s9i44g
         U/O9vPnlPey0CLbG7EO9UR+r4y6AjUJWAuBNySU3jowjAA+uMu/wt7svUACQ5rCh8x91
         N72IoOg8ZzwcY46y0gE5tB7GaubVu3bmsn9ydXgs/h6upPRDFKRdoD1vuXFN0IRSmM09
         rO8CYxpc1CLDwF2UKhdINhURLnI8xokiy7kWyc0ekLiAUKYf+kvWc4bofy7te8axZV3S
         wAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ER7oSS/J651lsBSIL4KQ2ogl+LNztksvkt2V7M3ww+c=;
        b=jAsZ9ivOco+scRmQleA9aC0e4vCJYBf9PziE4ou6A9QnQ4VPnOJ5eWacpO2EUuPPKm
         7Npfg01So5OPIQk5i97PzEMtxFet2Py5aC+UXlpJ1El0R4ie6fCuN3iJzmqFytlpFpI6
         JMKOLrKATokngPnK37HMbmFipPJ2WaDFvOkmPN+IRhbdpSCitHepaJKcgLQLLmk7nGLq
         ClQfpVrt4zJhmtxS9ZgGf57+vk4Y6SrU9zodVpHht60Ug+X35Lnw1rDSb0w/1Acy846m
         8VHqIYIJuUqHb7zj/KteDRti0ViaQBOX+bES+oErH9mv3Nzv9FNICarSz132s3w3cZMk
         +1yw==
X-Gm-Message-State: ACgBeo0pXFNu3Z4SNCThBItC2120B28hxFvcuFIUgvQ73j/r/LuADbde
	Gk/9fnqgdtUQjvaBVY5wb22wiXG9GPOBpIC9khA=
X-Google-Smtp-Source: 
 AA6agR7TB4Q9VK/QBM8JhOhv68oxLi7uG/GNG47Ylni0OYtVJB5w41BQuVwLwZX0jTtpYJgPwv1ALFNtPVLK6mVMBIc=
X-Received: by 2002:a05:6512:238d:b0:492:f11e:ca92 with SMTP id
 c13-20020a056512238d00b00492f11eca92mr3966908lfv.26.1661624635016; Sat, 27
 Aug 2022 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
In-Reply-To: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 20:23:43 +0200
Message-ID: 
 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
To: edwin@etorok.net
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169940

I'm not sure this is right as a global change. This fixes situations
where 3 xz instances run on your specific setup, what about 4? Or 5?
Or n instances for all n in N?

I think you need to limit the amount of threads rather to match
available RAM, and do it via site.conf and not bitbake.conf. ?=3D
assignment is used in bitbake.conf exactly for that purpose.

Alex

On Sat, 27 Aug 2022 at 20:15, Edwin T=C3=B6r=C3=B6k via lists.openembedded.=
org
<edwin=3Detorok.net@lists.openembedded.org> wrote:
>
> By default a build such as [1] might run 3 'xz' in parallel:
> ```
> Currently  3 running tasks (11878 of 11883)  99%
> |######################################################################
> #### |
> 0: demo-coreip-xfce4-1.0-r0 do_image_ext4 - 3m17s (pid 2088739)
> 1: demo-coreip-xfce4-1.0-r0 do_image_tar - 3m16s (pid 2088743)
> 2: demo-coreip-xfce4-1.0-r0 do_image_wic - 3m16s (pid 2088745)
> ```
>
> However the default memory usage limit of `xz` is 50% each, so this
> will
> attempt to use 150% memory, and it gets OOM killed by systemd-oomd on
> Fedora 36.
> ```
> Aug 27 18:38:57 fedora systemd-oomd[3150]: Killed
> /user.slice/user-1000.slice/user@1000.service/app.slice/app-
> org.gnome.Terminal.slice/vte-spawn-2d92eb7b-b005-41b4-a786-
> fc8c0d360ce3.scope due to memory used (66890584064) / total
> (67332812800) and swap used (7744446464) / total (8589930496) being
> more than 90.00%
> ```
>
> Even with systemd-oomd turned off it'd eventually start swapping
> heavily
> on a system with 64GiB of physical memory and 8GiB of swap.
>
> Reduce memory limit on xz so that we can run 3 in parallel without
> driving the host close to or OOM. 25% seems to work on this particular
> build and allows it to complete successfully.
>
> [1] https://github.com/sifive/freedom-u-sdk/tree/2022.06.00
>
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin@etorok.net>
> ---
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2a3cf6f8aa..48ba52c12c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -857,7 +857,8 @@ BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
>  PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
>
>  # Default parallelism and resource usage for xz
> -XZ_MEMLIMIT ?=3D "50%"
> +# A build might run 3 'xz' in parallel, so don't exhaust memory
> +XZ_MEMLIMIT ?=3D "25%"
>  XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
>  XZ_THREADS[vardepvalue] =3D "1"
>  XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_THREADS}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169939): https://lists.openembedded.org/g/openembedde=
d-core/message/169939
> Mute This Topic: https://lists.openembedded.org/mt/93294351/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

