Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B946D5C0D1
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:47:25 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.14337.1731077235972193362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GoHDDXY3;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.173, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so2213453276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731077235; x=1731682035; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veHvCgba8l9OHF9ztrMJCDgtBARsnXuMGv+KqsGcqyM=;
        b=GoHDDXY3vLZZAAKY4/GpPX78QBGWA1pMSjg8+tKoCJGyT72DW0gNZ0UmaNNncC6bJN
         4AbJW+BUzCw+EUhQ3kcbBQbOIYsWo++1rUfDuGu5HDXBUSFjSADi3CcwN/ZnQC6ajIn6
         wOB1O5Xdtybdrs8G9fK8ifXVDwNzeRuqS0uMWL7JyOXg8MbR+chCmMu9n8uixJ98t1ka
         7wz3/Z9bERAS+3PSkemEuJ0QVkvjawQpWVY1+47lqiZ26ViCPHTtiJ1aJKP9T31lCZuh
         x1gnNaSJaFPq/55nGhmtB8jZol5uI5+C0ismAN14rHE7O9fAB7crhHXQJ4RFNRlZx+t2
         mkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077235; x=1731682035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veHvCgba8l9OHF9ztrMJCDgtBARsnXuMGv+KqsGcqyM=;
        b=Q2RSV+nttartt3CQ3B5KPQ/v3zKSQ6TDULtV0m5tjsYE+5q7MIiB+RyLfvcFRaEvit
         QwK2EQfSQ+rAj5FPmswhwILL6dWHOAbpalDYD5NQMUGWGIkTqiNcE/AYloZBZRB3YLDy
         xCIpi+A/cRRsLU4akZ+a3a/pTn2PWFM6FAQabk7napIFuACodwi5VjNspcUv2q+i9HaO
         JE7ATjv6d22JMRdG0ozgQ05WInfm+OyROuzvxkqw4p9Z7n8GkbFWhOZWQNSF2g+bCD9o
         zrYxXobWweZ6FVuhlyzYURPmnJhiPIz98ZFyzwnwSGS5M9Ly9WdxgUQ3SWUetfjdpPHl
         UhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0KCr9jdpp0FinM+Qx4J4y5bH3ZPJ03v2yNCjfA6MvXjJeTgdf3IT7l8pHv1nzaFZ1CaJiq110o8YB1YVyYoLTcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYMZQ2tSlJfwW42PK2uTyVL8BaJ5/56/sDe+a4E5f2z4lgE3k5
	BUOkqQr3rBliUqIcsCq+FHzJ5bQlEW40ukDOvEzFLK8a/k8qr4sLKRlZBb7OyuRmklsngFfw6Ys
	QNYcHA5WLEp2DA93jlRBWT0k4p11vfWhN42tnvQ==
X-Google-Smtp-Source: AGHT+IHAXfBMJprQNK/vbXgDPNgBqvZiWeK46JbfT/e46UxCLOMJhfE3JfqO52PpygWqFOsSK5hYAdlZdxaJqmClGf4=
X-Received: by 2002:a05:6902:a06:b0:e2b:a8b3:d650 with SMTP id
 3f1490d57ef6-e337f8815b4mr2783884276.24.1731077235027; Fri, 08 Nov 2024
 06:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
 <1805E9CC90672053.32267@lists.openembedded.org> <CA+chaQcfLfXBBvnr032b3rnXwJ=mhS7zhk8zJ_h85A3dv62F9A@mail.gmail.com>
In-Reply-To: <CA+chaQcfLfXBBvnr032b3rnXwJ=mhS7zhk8zJ_h85A3dv62F9A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Nov 2024 06:47:04 -0800
Message-ID: <CAOSpxdZo_NfUhG8UGLpDFoeSWKmUnmYhUnXJ2y+e0e9se=6d_A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers
 race fix
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Fabio.Berton@criticaltechworks.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206873

On Thu, Nov 7, 2024 at 11:16=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Backporting https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D1=
5b4f4ca25593f684e6517d0b809605b443d1953
> fixes the issue or instead of adding another .patch file we can import
> most of the pseudo changes from master (as they might be needed in
> future anyway as people will be upgrading to more recent host
> distros).
>
> I've queued the backports in 12 commits here:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/kir=
kstone-pseudo-sync-with-master
> and confirmed that pseudo-native builds again on host with gcc-14
> (rebuilding the image now)

If it passes your testing please submit the series and I can test on
the autobuilder too.

> scarthgap is missing the most recent one for python-3.13 on host
> "pseudo: Fix envp bug and add posix_spawn wrapper"

I'll cherry-pick that to scarthgap.

Thanks!

Steve

> On Fri, Nov 8, 2024 at 7:18=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > With this update it fails to build on hosts with gcc-14:
> >
> > | pseudolog.c: In function ?parse_timestamp?:
> > | pseudolog.c:329:13: error: implicit declaration of function
> > ?strptime?; did you mean ?strftime?? [-Wimplicit-function-declaration]
> > |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> > |       |             ^~~~~~~~
> > |       |             strftime
> > | pseudolog.c:329:11: error: assignment to ?char *? from ?int? makes
> > pointer from integer without a cast [-Wint-conversion]
> > |   329 |         s =3D strptime(string, timeformat, &stamp_tm);
> > |       |           ^
> > | pseudolog.c:337:19: error: assignment to ?char *? from ?int? makes
> > pointer from integer without a cast [-Wint-conversion]
> > |   337 |                 s =3D strptime(string, time_formats[i], &stam=
p_tm);
> > |       |                   ^
> > | pseudolog.c: In function ?plog_trait?:
> > | pseudolog.c:377:34: warning: ?calloc? sizes specified with ?sizeof?
> > in the earlier argument and not in the later argument
> > [-Wcalloc-transposed-args]
> > |   377 |         new_trait =3D calloc(sizeof(*new_trait), 1);
> > |       |                                  ^
> > | pseudolog.c:377:34: note: earlier argument should specify number of
> > elements, later size of each element
> > | make: *** [Makefile:130: pseudolog.o] Error 1
> >
> > It's not caused by this change itself (it just triggers pseudo-native
> > to be rebuilt and not reused from sstate) but can we update to even
> > newer SRCREV which fixes this? Will check if
> > https://git.yoctoproject.org/pseudo/commit/pseudolog.c?id=3D15b4f4ca255=
93f684e6517d0b809605b443d1953
> > fixes all of them.
> >
> >
> > On Wed, Nov 6, 2024 at 7:13=E2=80=AFPM Fabio Berton via lists.openembed=
ded.org
> > <Fabio.Berton=3Dcriticaltechworks.com@lists.openembedded.org> wrote:
> > >
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > Update to pull in:
> > >
> > >     pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
> > >
> > >     In rare cases we see failures, often in linux-libc-headers for th=
ings like:
> > >
> > >     |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
> > >     | abort()ing pseudo client by server request. See https://wiki.yo=
ctoproject.org/wiki/Pseudo_Abort for more details on this.
> > >
> > >     Pseudo log:
> > >     path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XX=
X/linux-libc-headers/6.1-r0/image/usr'.
> > >     Setup complete, sending SIGUSR1 to pid 3630890.
> > >
> > >     Whilst this doesn't easily reproduce, the issue is that multiple =
different processes are
> > >     likely working on the directory and the creation in pseudo might =
not match accesses
> > >     made by other processes.
> > >
> > >     Ultimately, the "NAMELESS FILE" is harmless and pseudo will recon=
cile things
> > >     so rather than error out, we should ignore this case.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
> > > Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> > > ---
> > >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipe=
s-devtools/pseudo/pseudo_git.bb
> > > index 4dd9156238..6b0cb598e2 100644
> > > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > @@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk =3D " \
> > >      file://older-glibc-symbols.patch"
> > >  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be41=
90d6040282b84c8d97b99072485aa"
> > >
> > > -SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
> > > +SRCREV =3D "cc1f6167cb5065daba1462056e2dce8ff72aa855"
> > >  S =3D "${WORKDIR}/git"
> > >  PV =3D "1.9.0+git${SRCPV}"
> > >
> > > --
> > > 2.25.1
> > >
> > > The information in this communication may contain confidential or leg=
ally privileged information. It is intended solely for the use of the indiv=
idual or entity it addresses and others authorized to receive it. If you ar=
e not an intended recipient, you are hereby notified that any disclosure, c=
opying, distribution or action in reliance on the contents of this informat=
ion is strictly prohibited and may be unlawful. If you have received this c=
ommunication by error, please notify us immediately by responding to this e=
-mail and then delete it from your system. Critical TechWorks is not liable=
 for the proper and complete transmission of the information in this commun=
ication nor for any delay in its receipt
> > >
> > > This e-mail is environmentally friendly, just like Critical TechWorks=
, which lives in a paper-free atmosphere. Therefore, please consider the en=
vironment before printing it!
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206854): https://lists.openembedded.org/g/openembed=
ded-core/message/206854
> > Mute This Topic: https://lists.openembedded.org/mt/109429860/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

