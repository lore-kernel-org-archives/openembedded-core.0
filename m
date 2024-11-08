Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712DDD5C0E2
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:57:55 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.14617.1731077865711082071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htKY0wq7;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a007743e7so2700694e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077864; x=1731682664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VrXmSFQpqlGWPJARoINWzDlisz8jx5BCYySF5QnWGM=;
        b=htKY0wq7STj36mxGO552jL7Csq+CFdM0xyhwmqfoUKyRECDWan08pJ+ZKF4N3zxjey
         cAa9QBjoRZXBUFFTVhVBp984qUlzV0Y+VBXQAI4BXWXmat4RgdSa7tHH1jW8YsmyB9jR
         TIPAjMjZKiHUyLaZN7HLjLSKuixWuPqrc6J7BkS1Mha7bVkt5Ch3H1kmGUyPGMpRbegl
         E6uSIWSRTXfLDPW1ogMGSmDMHaZr5qe2ivF5L1uC9GHMN2A+FzzIRltuxH4/48DCXkMX
         aqSzwdaDSRRtMarIUeEJxLQzEf+6t3W+/H3PpgqqLy8hEt8UD30ziR9MJbLjV4dv5SkB
         sILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077864; x=1731682664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VrXmSFQpqlGWPJARoINWzDlisz8jx5BCYySF5QnWGM=;
        b=oIeJnm1Xr0picskiluP3P7ggjGWy6KrW9rPQYxamiTcdBOYw4i3OiA9PuNQnYzQUdV
         c82QJPpmJVHo/cBd8UK04CcqJL8etYHXfTqzzxrclli1zePSj6eipokszO4J04lzcbwt
         0a/03iYBEC/4IeDatm0fy83PXfdB36YFn5QubYls8gMOkLRAn+bXVuqX8G0zNsxfNLVk
         FqRvg/XWFEWacvS+mXAJGFfGnhM1xd32IVixsg0jZDk5sz/NIPjJrL3giJU0EQ8dsd46
         VjWaBQQZvu62vlQeZi5NcAJKqSy5VIMpzhsN2Un4R0OGlPZ4Py2Xbms0+wQO+rAZjVw2
         vybg==
X-Forwarded-Encrypted: i=1; AJvYcCUIuaoDtxUw569Q5nZ0JYk1aE8C9ddQNMoHseEp2CQNC1lpfuzMYnwub/jXMcj+RvKcWI09TMhmO+EVjD6vZG/WiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZCZN7qnCUhNiHsW7gKgDgqLA3mtdT2p5QKxCnaT4elAqFyNcg
	bA1Mc3t0FLDf/4ore6hx8TbdV/6V7qK0HkhG+k0vCR92VxQW1Skj/NIbC6EEugVEPnoj+QGsf8E
	CXGtuod/SPEmBci3LRNvuC+o0NZbNDw==
X-Google-Smtp-Source: AGHT+IF54+oO1MBFLCHMssniVPFmf6U1Jqm21L8aFEcWKETzoFCZZL7g+sErD89fPzCrWWvh9zEaWEtVPwrohLx01t8=
X-Received: by 2002:a05:651c:988:b0:2fb:58d1:d9a3 with SMTP id
 38308e7fff4ca-2ff2016d290mr18725561fa.18.1731077863609; Fri, 08 Nov 2024
 06:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
 <1805E9CC90672053.32267@lists.openembedded.org> <CA+chaQcfLfXBBvnr032b3rnXwJ=mhS7zhk8zJ_h85A3dv62F9A@mail.gmail.com>
 <CAOSpxdZo_NfUhG8UGLpDFoeSWKmUnmYhUnXJ2y+e0e9se=6d_A@mail.gmail.com>
In-Reply-To: <CAOSpxdZo_NfUhG8UGLpDFoeSWKmUnmYhUnXJ2y+e0e9se=6d_A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Nov 2024 15:57:25 +0100
Message-ID: <CA+chaQfZKSKVNx+7jWr3jBPWm5UjKGyn-BYhEbh-AgopRPZq0w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers
 race fix
To: Steve Sakoman <steve@sakoman.com>
Cc: Fabio.Berton@criticaltechworks.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206889

On Fri, Nov 8, 2024 at 3:47=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Thu, Nov 7, 2024 at 11:16=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > Backporting https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=
=3D15b4f4ca25593f684e6517d0b809605b443d1953
> > fixes the issue or instead of adding another .patch file we can import
> > most of the pseudo changes from master (as they might be needed in
> > future anyway as people will be upgrading to more recent host
> > distros).
> >
> > I've queued the backports in 12 commits here:
> > https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/k=
irkstone-pseudo-sync-with-master
> > and confirmed that pseudo-native builds again on host with gcc-14
> > (rebuilding the image now)
>
> If it passes your testing please submit the series and I can test on
> the autobuilder too.

I've already built few images and sdk with these and haven't noticed
any difference (other than it could be built with gcc-14 on host) or
issue, so I've sent the series (which includes this commit as well).

All builds were in ubuntu-24.10 container, but I believe that if there
were some issues on older hosts, then it would be already discovered
with new pseudo in scarthgap or master).

Cheers,

>
> > scarthgap is missing the most recent one for python-3.13 on host
> > "pseudo: Fix envp bug and add posix_spawn wrapper"
>
> I'll cherry-pick that to scarthgap.
>
> Thanks!
>
> Steve
>
> > On Fri, Nov 8, 2024 at 7:18=E2=80=AFAM Martin Jansa via lists.openembed=
ded.org
> > <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > With this update it fails to build on hosts with gcc-14:
> > >
> > > | pseudolog.c: In function ?parse_timestamp?:
> > > | pseudolog.c:329:13: error: implicit declaration of function
> > > ?strptime?; did you mean ?strftime?? [-Wimplicit-function-declaration=
]
> > > |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> > > |       |             ^~~~~~~~
> > > |       |             strftime
> > > | pseudolog.c:329:11: error: assignment to ?char *? from ?int? makes
> > > pointer from integer without a cast [-Wint-conversion]
> > > |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> > > |       |           ^
> > > | pseudolog.c:337:19: error: assignment to ?char *? from ?int? makes
> > > pointer from integer without a cast [-Wint-conversion]
> > > |   337 |                 s =3D strptime(string, time_formats[i], &st=
amp_tm);
> > > |       |                   ^
> > > | pseudolog.c: In function ?plog_trait?:
> > > | pseudolog.c:377:34: warning: ?calloc? sizes specified with ?sizeof?
> > > in the earlier argument and not in the later argument
> > > [-Wcalloc-transposed-args]
> > > |   377 |         new_trait =3D calloc(sizeof(*new_trait), 1);
> > > |       |                                  ^
> > > | pseudolog.c:377:34: note: earlier argument should specify number of
> > > elements, later size of each element
> > > | make: *** [Makefile:130: pseudolog.o] Error 1
> > >
> > > It's not caused by this change itself (it just triggers pseudo-native
> > > to be rebuilt and not reused from sstate) but can we update to even
> > > newer SRCREV which fixes this? Will check if
> > > https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D15b4f4ca2=
5593f684e6517d0b809605b443d1953
> > > fixes all of them.
> > >
> > >
> > > On Wed, Nov 6, 2024 at 7:13=E2=80=AFPM Fabio Berton via lists.openemb=
edded.org
> > > <Fabio.Berton=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
> > > >
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > >
> > > > Update to pull in:
> > > >
> > > >     pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
> > > >
> > > >     In rare cases we see failures, often in linux-libc-headers for =
things like:
> > > >
> > > >     |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
> > > >     | abort()ing pseudo client by server request. See https://wiki.=
yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> > > >
> > > >     Pseudo log:
> > > >     path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/=
XXX/linux-libc-headers/6.1-r0/image/usr'.
> > > >     Setup complete, sending SIGUSR1 to pid 3630890.
> > > >
> > > >     Whilst this doesn't easily reproduce, the issue is that multipl=
e different processes are
> > > >     likely working on the directory and the creation in pseudo migh=
t not match accesses
> > > >     made by other processes.
> > > >
> > > >     Ultimately, the "NAMELESS FILE" is harmless and pseudo will rec=
oncile things
> > > >     so rather than error out, we should ignore this case.
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > (cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543=
)
> > > > Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> > > > ---
> > > >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/reci=
pes-devtools/pseudo/pseudo_git.bb
> > > > index 4dd9156238..6b0cb598e2 100644
> > > > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > @@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk =3D " \
> > > >      file://older-glibc-symbols.patch"
> > > >  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be=
4190d6040282b84c8d97b99072485aa"
> > > >
> > > > -SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
> > > > +SRCREV =3D "cc1f6167cb5065daba1462056e2dce8ff72aa855"
> > > >  S =3D "${WORKDIR}/git"
> > > >  PV =3D "1.9.0+git${SRCPV}"
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > > > The information in this communication may contain confidential or l=
egally privileged information. It is intended solely for the use of the ind=
ividual or entity it addresses and others authorized to receive it. If you =
are not an intended recipient, you are hereby notified that any disclosure,=
 copying, distribution or action in reliance on the contents of this inform=
ation is strictly prohibited and may be unlawful. If you have received this=
 communication by error, please notify us immediately by responding to this=
 e-mail and then delete it from your system. Critical TechWorks is not liab=
le for the proper and complete transmission of the information in this comm=
unication nor for any delay in its receipt
> > > >
> > > > This e-mail is environmentally friendly, just like Critical TechWor=
ks, which lives in a paper-free atmosphere. Therefore, please consider the =
environment before printing it!
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#206854): https://lists.openembedded.org/g/openemb=
edded-core/message/206854
> > > Mute This Topic: https://lists.openembedded.org/mt/109429860/3617156
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

