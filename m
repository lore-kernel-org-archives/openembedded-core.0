Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C94D5E143
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 07:16:43 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7839.1731050200370439934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 23:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcfnYZhw;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso19881491fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 23:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731050198; x=1731654998; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcxkEe9u48GtNTdcNP8PF3B0XEBm6EK2Vx9bJPykOsw=;
        b=gcfnYZhwIw17RsVesC0dusI1e/Y41eB/8w5gfVtO0oxQGbB6L0EjmqY2GZ7pbKNlhw
         WLvCkY9YBDLn6kggMSWJYnODZzYQ5isigfLmETV1wcg/Szprs5EEuvrssASrjE5DKLOF
         TXGSZJ/TcGWE+lE/EkQv+a4VVUSIpr/ln1AEzVflqQvdx7Xidf/oT+yLmT5OSMiBLboJ
         +jq5WqfN/k4XhW+Z8HjJ12Y7yxknfOIoPnMGhgqXt2JWVFrsx4WARlw27zZzpkR5XJMl
         N45PPU0/ZZjfkQxn9nuUuJItctiAc0MObx6pHAw4KUYRWgAEzp3/nM6nmzgrV/8wbn9Q
         QRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731050198; x=1731654998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcxkEe9u48GtNTdcNP8PF3B0XEBm6EK2Vx9bJPykOsw=;
        b=AI/d9GjAO5VZ644WWGji/2FkCGHDiaAn4rE7QLtBoFwTkjSlFru9n9empRNazeu9Qv
         dDhx6YDEP31ZkXkeH5OGxxnyT/A9sz1mEHl8SkJ2/QpxrhX8+IjM89eyc1NKvPuhhDXG
         uUkLISGFfGma4tvegcP8nuRsI8fMZZ3gJEWl97UDfC55hy/Om0EPcQQWOMOCIk4iTJeh
         Sq/uGCXsVsM9BHUAbeDNbZhSwse+IL4mSpYDcnY8fY9k50ZtX+UQ0/QGUPZzkRTnhUac
         wQKa1YIB+/nbjEhZPxp5J3yf7ANhg3x2tT1vt9HRWEsawpug1NKlaRZbN7EjOrDQgibZ
         EDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGnG8mAWXWlRpppQGms3mVyCVkBMQ1iCVhPTLfjKTTvxrpM7dQLJNBwuvTtMjv94nUjxg5KLfnhrqkovTZVYNOrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEvi6RBVSC9KAdzVr6plqWOoRKrDzqKEg7n3Usq5hOoMnn5sXz
	h0s3beoAOlea/4WJXef4y1yHrdNFSQdwcz5bmUC8AcgffylErGySp86LOen1pRK/J36jbFI57Dg
	pth4Y7W/LQEAnXuI4vk0X1L0sdWY=
X-Google-Smtp-Source: AGHT+IGWTkHlrx/w07bFqC12NwPYl5lK/TakYtlT/R6kwglxTQJZeNrIuhVFbBNQCD8o9XZeT3yApZWQHrlTkv5lHuw=
X-Received: by 2002:a05:651c:1542:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2ff20965ff3mr5027801fa.10.1731050198197; Thu, 07 Nov 2024
 23:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com> <1805E9CC90672053.32267@lists.openembedded.org>
In-Reply-To: <1805E9CC90672053.32267@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Nov 2024 08:16:21 +0100
Message-ID: <CA+chaQcfLfXBBvnr032b3rnXwJ=mhS7zhk8zJ_h85A3dv62F9A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers
 race fix
To: martin.jansa@gmail.com
Cc: Fabio.Berton@criticaltechworks.com, 
	openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 07:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206855

Backporting https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D15b=
4f4ca25593f684e6517d0b809605b443d1953
fixes the issue or instead of adding another .patch file we can import
most of the pseudo changes from master (as they might be needed in
future anyway as people will be upgrading to more recent host
distros).

I've queued the backports in 12 commits here:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/kirks=
tone-pseudo-sync-with-master
and confirmed that pseudo-native builds again on host with gcc-14
(rebuilding the image now)

scarthgap is missing the most recent one for python-3.13 on host
"pseudo: Fix envp bug and add posix_spawn wrapper"

On Fri, Nov 8, 2024 at 7:18=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> With this update it fails to build on hosts with gcc-14:
>
> | pseudolog.c: In function ?parse_timestamp?:
> | pseudolog.c:329:13: error: implicit declaration of function
> ?strptime?; did you mean ?strftime?? [-Wimplicit-function-declaration]
> |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> |       |             ^~~~~~~~
> |       |             strftime
> | pseudolog.c:329:11: error: assignment to ?char *? from ?int? makes
> pointer from integer without a cast [-Wint-conversion]
> |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> |       |           ^
> | pseudolog.c:337:19: error: assignment to ?char *? from ?int? makes
> pointer from integer without a cast [-Wint-conversion]
> |   337 |                 s =3D strptime(string, time_formats[i], &stamp_=
tm);
> |       |                   ^
> | pseudolog.c: In function ?plog_trait?:
> | pseudolog.c:377:34: warning: ?calloc? sizes specified with ?sizeof?
> in the earlier argument and not in the later argument
> [-Wcalloc-transposed-args]
> |   377 |         new_trait =3D calloc(sizeof(*new_trait), 1);
> |       |                                  ^
> | pseudolog.c:377:34: note: earlier argument should specify number of
> elements, later size of each element
> | make: *** [Makefile:130: pseudolog.o] Error 1
>
> It's not caused by this change itself (it just triggers pseudo-native
> to be rebuilt and not reused from sstate) but can we update to even
> newer SRCREV which fixes this? Will check if
> https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D15b4f4ca25593=
f684e6517d0b809605b443d1953
> fixes all of them.
>
>
> On Wed, Nov 6, 2024 at 7:13=E2=80=AFPM Fabio Berton via lists.openembedde=
d.org
> <Fabio.Berton=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
> >
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Update to pull in:
> >
> >     pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
> >
> >     In rare cases we see failures, often in linux-libc-headers for thin=
gs like:
> >
> >     |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
> >     | abort()ing pseudo client by server request. See https://wiki.yoct=
oproject.org/wiki/Pseudo_Abort for more details on this.
> >
> >     Pseudo log:
> >     path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/=
linux-libc-headers/6.1-r0/image/usr'.
> >     Setup complete, sending SIGUSR1 to pid 3630890.
> >
> >     Whilst this doesn't easily reproduce, the issue is that multiple di=
fferent processes are
> >     likely working on the directory and the creation in pseudo might no=
t match accesses
> >     made by other processes.
> >
> >     Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconci=
le things
> >     so rather than error out, we should ignore this case.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
> > Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> > ---
> >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-=
devtools/pseudo/pseudo_git.bb
> > index 4dd9156238..6b0cb598e2 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk =3D " \
> >      file://older-glibc-symbols.patch"
> >  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190=
d6040282b84c8d97b99072485aa"
> >
> > -SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
> > +SRCREV =3D "cc1f6167cb5065daba1462056e2dce8ff72aa855"
> >  S =3D "${WORKDIR}/git"
> >  PV =3D "1.9.0+git${SRCPV}"
> >
> > --
> > 2.25.1
> >
> > The information in this communication may contain confidential or legal=
ly privileged information. It is intended solely for the use of the individ=
ual or entity it addresses and others authorized to receive it. If you are =
not an intended recipient, you are hereby notified that any disclosure, cop=
ying, distribution or action in reliance on the contents of this informatio=
n is strictly prohibited and may be unlawful. If you have received this com=
munication by error, please notify us immediately by responding to this e-m=
ail and then delete it from your system. Critical TechWorks is not liable f=
or the proper and complete transmission of the information in this communic=
ation nor for any delay in its receipt
> >
> > This e-mail is environmentally friendly, just like Critical TechWorks, =
which lives in a paper-free atmosphere. Therefore, please consider the envi=
ronment before printing it!
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206854): https://lists.openembedded.org/g/openembedde=
d-core/message/206854
> Mute This Topic: https://lists.openembedded.org/mt/109429860/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

