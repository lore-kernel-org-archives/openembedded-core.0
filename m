Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503E0C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:14:55 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.86408.1701058494166320406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nUZqbEqc;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso2368892a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 20:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701058493; x=1701663293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlz2O2GRhymX9sXLtD19Udcwq9QMpg730+jGCy7Ewn0=;
        b=nUZqbEqc6CnkVb7n4agP5NyaD6wegwZi4RHH79KJwBLN9Aqt6aBiOytqMh938o9YMm
         OCdy+0w3chpbe8UfcHPfLM1bnUnqUUd+plx7rYJexx6cgL+wD4wtxAqh61ZRF3av3ugZ
         ElROB0eGiQise9YrJzo6Rr4iQw/Nsx5x3VYRqxVqjtPfaMuqZfg/y3RYqKqVjYUgOQOd
         qDmi8E9TSQcdzCc755zOhQrPYv66iM81wMnOm8ZuyC1zh8sX6GHlUZI9EQLFEVpky1tM
         z+6lhT7PJJDMKwxAtGU6Z86Gsln2q2sJ5o1qgFFQZFYoWHQGksjocnnhRTTGj10VxVbO
         I9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701058493; x=1701663293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlz2O2GRhymX9sXLtD19Udcwq9QMpg730+jGCy7Ewn0=;
        b=DMQGQMvX27OZ+Tr6vvnRrGVFAzBtyLBb7N/lYZ9zW/fs8ph896ukNuLHSyuiKFl2ju
         pCUZHc4X/EFhQZ3hMaUNKfnwe0qwZKm1lc8WevojwKxDgO1GpjMSphQbYU/F641ASCIt
         6Tn+qPTGSnkNYCPV4w5krmVkKgL0No5axbIkfADVhxws7iqGeD2kwGsuiNkisnJU13+l
         lFzCijeaWRWxYV/WfrMNre9HTmufGhhv+NtAAOhtzHI3kc75jkt8jNxI9yN01+h/BCHk
         lqT8k0Avm2v+SwM4cdeVE9rxLWtroMbAMiRsksVdKNkxx+vLxJTl6i3BZpfwyHckFnx0
         EHOw==
X-Gm-Message-State: AOJu0YwN3wHkpeIuV76u3YyoSX4dVJDfsIwtEb+Lf+0/YZg6Njw6V/PN
	TKac0uejjS39cgN78YavuIoPv6iWZE6zf4bwwcRaUzu/Gn0=
X-Google-Smtp-Source: AGHT+IG6BaHayKHoEaIEjIplWyNJHdVjoAaFJleM+HzzsSpp9eGAsTvJngfuOV8fSUhB2shrbtZO40wMXGIY/MsQS9k=
X-Received: by 2002:a05:6870:aa08:b0:1fa:27ff:1e70 with SMTP id
 gv8-20020a056870aa0800b001fa27ff1e70mr7391701oab.38.1701058493439; Sun, 26
 Nov 2023 20:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20231127040046.1024625-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231127040046.1024625-1-sundeep.kokkonda@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2023 20:14:27 -0800
Message-ID: <CAMKF1sqUZ3hghcwukQfB1qs5By89TMpJ2rb5uds15cNaA6rPxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.38 branch updates
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191250

lgtm

On Sun, Nov 26, 2023 at 8:01=E2=80=AFPM Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Below commits on glibc-2.38 stable branch are updated.
> 1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_en=
d in link map"
> 719866ab2f Revert "elf: Always call destructors in reverse constructor or=
der (bug 30785)"
> e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_m=
ap"
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 19b98bc11a..ccf9d505c5 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.38/master"
>  PV =3D "2.38+git"
> -SRCREV_glibc ?=3D "750a45a783906a19591fb8ff6b7841470f1f5701"
> +SRCREV_glibc ?=3D "1e04dcec491bd8f48b5b74ce3e8414132578a645"
>  SRCREV_localedef ?=3D "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191246): https://lists.openembedded.org/g/openembedde=
d-core/message/191246
> Mute This Topic: https://lists.openembedded.org/mt/102823529/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

