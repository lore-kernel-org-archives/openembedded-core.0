Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3503C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 13:26:26 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.17742.1712841986320190555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 06:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B6R7TeVF;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61587aa9f4cso80232927b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712841985; x=1713446785; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctbSC/ciTKPHOQhPF8375E2Vo+mwFmNS9HSUlV5BDQA=;
        b=B6R7TeVFJtsI5IxqPXwnonndO7tqAyirghfobJC+0bYDiUr8b4x77BuRVpBw8BMBcR
         ENsbvEmer37jd2c1vE4lYolYfcYbQW62CUzfZpmTymafverxGUMHqgCyvdO4JVajVN6E
         DTtvcreoFFgXXPjIGhLfApjUXjDYPVDOTcjIBGStWxKedDeed1db9dYNMZhUktvjORRs
         qtCZ6FK8ywtrjNOyRWFsSAI9QsGvYDtn3aRHTJ11ckypEXk6I0RP7Nus1tO2PbtYpM45
         nHjC4JMWX/EhsrhxIeB5ODEZLHet86w2b5udQT3NMmATHG6MzD5owcZ2Zt6Urrspr9CR
         F1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712841985; x=1713446785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctbSC/ciTKPHOQhPF8375E2Vo+mwFmNS9HSUlV5BDQA=;
        b=HglWVWpduogauvDzYyqXFcVveRU28vxecXaGa90CtJFOxzaWemowlPwgYiD4lDvtS4
         PbEkmT/wwLuVI257nO9xpVC076ddUZJZJkslLhCopGeR9kiGbgpIYGhPPZS2xvUaFo3B
         6oWaJvOMrPyY2tdoTPmhvZNfSolI9yATqk5dm78uxqwRUy+Y1ylKaDCO/cqkFFz+A94m
         pgJgT8FqjARqCGwWZpUmp0GqNAyrJrQs05KMRgvOMvqddt+D3JFnnY99TpxLmfvOBbhr
         kyHxyBxEvbiXPS5tOpgVeuH25mxy8k+EZpFT1n0Vuakj4dOwtwaAYP+2+YS5Zi+KeiOc
         zCQw==
X-Gm-Message-State: AOJu0YxOplfRZWhgSJS7O6/5vRq0psBgWW+ZZLVoS3IIeNALOZ4G/yu4
	vrU7E8zulO5qf7n7zTV5k/n/3F03fzG0cflwMUOnBo+bGZwsXZ8oQywbW5XvPGxbR08UmC4eYuS
	ZpUqgV/d71KeHlDTgPDWwDYSg2Dz/M8oUdiibVA==
X-Google-Smtp-Source: AGHT+IEoGQiu8ApFQpv1UBLaKeHuktpsvl36tqjy8qscuD8VAjRt+f6DuAGT9y07FT3EsJZj+gzLNqfcL+Lb+I1olmU=
X-Received: by 2002:a81:9441:0:b0:614:3178:44ef with SMTP id
 l62-20020a819441000000b00614317844efmr5313516ywg.34.1712841985429; Thu, 11
 Apr 2024 06:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
In-Reply-To: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 Apr 2024 06:26:14 -0700
Message-ID: <CAOSpxdZzM3yBsH9wKp9s8bskxSrpzSsb5AJJ8-t=W1-7mtuH8w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] kernel.bbclass: check, if directory
 exists before removing empty module directory
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 13:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198129

This patch doesn't apply for me:

Applying: kernel.bbclass: check, if directory exists before removing
empty module directory
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/kernel.bbclass:452
error: meta/classes/kernel.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 kernel.bbclass: check, if directory exists before
removing empty module directory

Steve

On Thu, Apr 11, 2024 at 1:06=E2=80=AFAM Heiko <heiko.thole@entwicklung.eq-3=
.de> wrote:
>
> If the kernel folder does not exist, find will result in an error.
> This can occur if the kernel has no modules but, for example, custom modu=
les are created.
>
> Add check before deleting.
>
> Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index dbd89057f3..988a489396 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -452,7 +452,7 @@ kernel_do_install() {
>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/build"
>                 rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/source"
>                 # Remove empty module directories to prevent QA issues
> -               find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION=
}/kernel" -type d -empty -delete
> +               [ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION=
}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/k=
ernel" -type d -empty -delete
>         else
>                 bbnote "no modules to install"
>         fi
> --
> 2.41.0
>
> eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
> Gesch=C3=A4ftsf=C3=BChrer: Prof. Heinz-G. Redeker
> Registergericht: Amtsgericht Aurich, HRB 110388
> eQ-3 AG, Maiburger Str. 29, 26789 Leer
> Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
> Vorsitzende des Aufsichtsrats: Irmgard Keplin
> Registergericht: Amtsgericht Aurich, HRB 200335
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198117): https://lists.openembedded.org/g/openembedde=
d-core/message/198117
> Mute This Topic: https://lists.openembedded.org/mt/105458549/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

