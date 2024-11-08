Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F21D5E140
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 06:18:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.7068.1731046696178465821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 22:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYfTSsFf;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso16423681fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731046694; x=1731651494; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrR6jAaxtKlWF2HcL9wzjhwohcipFjhbEr4337NWFRU=;
        b=dYfTSsFf7mstAW4f/eIZS8JXVBfKMbADZ+ndJc6JK7MbtC6STa2qhEIRTb96hvBcPX
         pozOkisHvWnqwpPRMyaqExBM5En3BhBm+oLrhPGhCUatiW87NRzKC1ZrPGHCoKMtKWuY
         bAdGRMjCgtJv3V6zpZpWX320GQyFdWy7hRV7/JE+6t/FJfaPfC0osSWaIRjLBGnwoarP
         OY8eGqnKz5Um5wkHCCm8V6/oG265v69ytZ0g1q5/1Q8t3eWy5Zo2CXUjMH1RUkpOX8a5
         yEE2m15ro+cjKIKvmKKH+KODhdEXuwaqMiniNcEV/pYUbOlq1aO997OK9x5HAM0Oc7ks
         DxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731046694; x=1731651494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrR6jAaxtKlWF2HcL9wzjhwohcipFjhbEr4337NWFRU=;
        b=SE0BMtGvt/aiir5HjJCPIJfeV1UDRUC/xXEhcM4MwgxL0dGlMpm9gnzvHokBRgwqMP
         0iIQv8iumqHdaIyamH5rk0RuCZ7WRC7r6IJkXjTCGAQl8lIbfncm9n2eOZLvYU45JARU
         b1sqQCLQssUQFDh6ae8SARLYjonKflNUQxNCoKHy3rqIY9DoG+8qwn3qmhHTnCpzH+/m
         Cf26LnKiBlpc7D2i5tNX2CPzuaCHUN3qy8x1x1H0ePRW4ffZLQDKrNcFehWWCAtvFf0S
         Z5IlRiVKCKOxyavKAziWnBBAnFeUGEfNygiwD2fKFZEMxd9pIgUpky0hyaWAFLRYgEVO
         k4sw==
X-Gm-Message-State: AOJu0YwLs/9UjAJ3rnH46Q2ArFYTIVnWOUlg6bbtA+ZqplbbkUp5iyok
	81PR0/PkL8jV2e8/NagmIE8UgdKvRuN02A/HxuS88APWxbb6FJwWDEqX8GB0WpXQSTfR69ukfbb
	H8D8WvOWESbW7RbtW/gtuOQPlWJU=
X-Google-Smtp-Source: AGHT+IH0OAkZCFBLKgMRTKPCeuJEx2LpTK85ZIXUfgkFvxtyssQxEeH8Ejf8MKFW/bVTcMdslfrM4f7qS54EEj0Q9oA=
X-Received: by 2002:a2e:a553:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-2ff201119cemr6797561fa.2.1731046693795; Thu, 07 Nov 2024
 22:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
In-Reply-To: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Nov 2024 07:17:57 +0100
Message-ID: <CA+chaQeuvrHa10MSfDE7c5yJUtPCKS9Dox6cVkbOg+oSafnU1A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers
 race fix
To: Fabio.Berton@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206854

With this update it fails to build on hosts with gcc-14:

| pseudolog.c: In function ?parse_timestamp?:
| pseudolog.c:329:13: error: implicit declaration of function
?strptime?; did you mean ?strftime?? [-Wimplicit-function-declaration]
|   329 |         s =3D strptime(string, timeformat, &stamp_tm);
|       |             ^~~~~~~~
|       |             strftime
| pseudolog.c:329:11: error: assignment to ?char *? from ?int? makes
pointer from integer without a cast [-Wint-conversion]
|   329 |         s =3D strptime(string, timeformat, &stamp_tm);
|       |           ^
| pseudolog.c:337:19: error: assignment to ?char *? from ?int? makes
pointer from integer without a cast [-Wint-conversion]
|   337 |                 s =3D strptime(string, time_formats[i], &stamp_tm=
);
|       |                   ^
| pseudolog.c: In function ?plog_trait?:
| pseudolog.c:377:34: warning: ?calloc? sizes specified with ?sizeof?
in the earlier argument and not in the later argument
[-Wcalloc-transposed-args]
|   377 |         new_trait =3D calloc(sizeof(*new_trait), 1);
|       |                                  ^
| pseudolog.c:377:34: note: earlier argument should specify number of
elements, later size of each element
| make: *** [Makefile:130: pseudolog.o] Error 1

It's not caused by this change itself (it just triggers pseudo-native
to be rebuilt and not reused from sstate) but can we update to even
newer SRCREV which fixes this? Will check if
https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D15b4f4ca25593f6=
84e6517d0b809605b443d1953
fixes all of them.


On Wed, Nov 6, 2024 at 7:13=E2=80=AFPM Fabio Berton via lists.openembedded.=
org
<Fabio.Berton=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Update to pull in:
>
>     pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
>
>     In rare cases we see failures, often in linux-libc-headers for things=
 like:
>
>     |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
>     | abort()ing pseudo client by server request. See https://wiki.yoctop=
roject.org/wiki/Pseudo_Abort for more details on this.
>
>     Pseudo log:
>     path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/li=
nux-libc-headers/6.1-r0/image/usr'.
>     Setup complete, sending SIGUSR1 to pid 3630890.
>
>     Whilst this doesn't easily reproduce, the issue is that multiple diff=
erent processes are
>     likely working on the directory and the creation in pseudo might not =
match accesses
>     made by other processes.
>
>     Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile=
 things
>     so rather than error out, we should ignore this case.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
> Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 4dd9156238..6b0cb598e2 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk =3D " \
>      file://older-glibc-symbols.patch"
>  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d6=
040282b84c8d97b99072485aa"
>
> -SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
> +SRCREV =3D "cc1f6167cb5065daba1462056e2dce8ff72aa855"
>  S =3D "${WORKDIR}/git"
>  PV =3D "1.9.0+git${SRCPV}"
>
> --
> 2.25.1
>
> The information in this communication may contain confidential or legally=
 privileged information. It is intended solely for the use of the individua=
l or entity it addresses and others authorized to receive it. If you are no=
t an intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution or action in reliance on the contents of this information =
is strictly prohibited and may be unlawful. If you have received this commu=
nication by error, please notify us immediately by responding to this e-mai=
l and then delete it from your system. Critical TechWorks is not liable for=
 the proper and complete transmission of the information in this communicat=
ion nor for any delay in its receipt
>
> This e-mail is environmentally friendly, just like Critical TechWorks, wh=
ich lives in a paper-free atmosphere. Therefore, please consider the enviro=
nment before printing it!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206796): https://lists.openembedded.org/g/openembedde=
d-core/message/206796
> Mute This Topic: https://lists.openembedded.org/mt/109429860/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

