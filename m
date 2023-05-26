Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C10C77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 05:27:12 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.2051.1685078826840279251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 22:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hDXCUBLI;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-19e68e38226so428005fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685078826; x=1687670826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTs9OfwvuEGNO9V3LmQlCX3Jh6E+JiXg2/Czeoz378k=;
        b=hDXCUBLIUl6vTtDeqeBn8YooUETo01z0xSBJSuujYnCZlD7VHcgV7vJm6mid+oyvds
         y1wK6wuIiTJF4fMey4y550PlHw0XETxftv+1dOU1xst2slp7PdPkwjUu/BPCImhLhCY5
         3l2Uo+9azVp3hN2+ghe6JzVx4szlsjFA/SY75x9kYNgM32FFG0l0Pdc8K0CAdu+oHqtC
         Qs/QGRvDwdGYdFQSGTM+rFbomqUhRShae80uWipzEDl37rS6DcylIkCL1PB/epAd4gLf
         99EwJi9QwO/Qh8fAMTyghyRjFWXv/lhuS7hEy3uzSjk8PbKXkHlbghQB1QBl4ondMTCv
         psEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685078826; x=1687670826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTs9OfwvuEGNO9V3LmQlCX3Jh6E+JiXg2/Czeoz378k=;
        b=KfETUncIsqPKPuX/HvECSCAa9rMAyKKflYlK4vb/8W+8/MP/UTgssI8L4QCGWfjrAl
         jx7H8bkDXMdA6gS0f8B1lkwjtwRcCi9anKYI0F5XI1BCeRR63PWlE0YdIw23pQReed1l
         TemiMYRpUJ9iDsNJdDoTx4SjnkD09cdQZGr5AP0+ZOrphGi5bM5YqA3/CBUE9PMFFvPQ
         11s3PgkO+ZtXzDi6PV6NAcRxgrZwuIBOq+maQH7mNcuAplwOQRmaPCqqHNv5xshAbF/6
         0bDe0O8o+y+ARqx7jQwwJt+CMhS4ZB46SiYJzOCjfFUyEg2reeC+IIZp3uIqzmWp/vYi
         Tq6Q==
X-Gm-Message-State: AC+VfDxoe220vW5ToFLM6YqK9SUMuf3HeXwmovM4qUbAvMJHYqnQhDrf
	6oXx3TiBE5sP4BQmZcTDqNriW/+H8kzvOuVwuQ0=
X-Google-Smtp-Source: ACHHUZ4lFOM5O7U/I7I85x3A05LJBdCzIU5/LWQodVx0guJnmIOH1msmfixK/AeH7c6uH3TgHHo8aQNET0ajCTkBLFQ=
X-Received: by 2002:a05:6870:3844:b0:188:c684:5ca5 with SMTP id
 z4-20020a056870384400b00188c6845ca5mr344179oal.37.1685078825841; Thu, 25 May
 2023 22:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230526012356.175746-1-raj.khem@gmail.com> <CAEHkU3U5vcCOgDz6qAhGDtHMXnzq+Gv89uageghdYLKoh+smgg@mail.gmail.com>
 <CAMKF1sp9KXzt7Phfm6pNdXeCi-VD2KGwfGErOE8Ga7JMdWENMg@mail.gmail.com> <CAEHkU3W0RL2buVxpsqHnYZoB+OOYgKof40-tZ14CV0P5Go+ETA@mail.gmail.com>
In-Reply-To: <CAEHkU3W0RL2buVxpsqHnYZoB+OOYgKof40-tZ14CV0P5Go+ETA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 May 2023 22:26:39 -0700
Message-ID: <CAMKF1so6kPWFaWhruABsB_CLBm02LnVfrCmP8396g6ohN6dQuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Make built-in libtraceevent plugins
 cohabit with external libtraceevent
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 05:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181760

On Thu, May 25, 2023 at 10:09=E2=80=AFPM Max Krummenacher <max.oss.09@gmail=
.com> wrote:
>
>
>
> On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> > On Thu, May 25, 2023 at 7:44 PM Max Krummenacher <max.oss.09@gmail.com>=
 wrote:
> >>
> >> Hi Khem
> >>
> >> On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> >> > This will package the plugins built by perf into kernel specific dir
> >> > under libdir, so it does not conflict with plugins from newly added
> >> > libtraceevent recipe
> >> >
> >> > Fixes
> >> > do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211=
.so is installed by both perf and libtraceevent, aborting
> >>
> >> Starting with kernel version 6.4 libtraceevent is removed from the ker=
nel sources and perf depends of an externally provided libtraceevent unless=
 explicitely opted out.
> >>
> >> perf.bb with this patch will fail when built with a 6.4 kernel.
> >
> > Why will it fail ?
>
> The file which sed works on, ${S}/tools/lib/traceevent/plugins/Makefile, =
no longer exists.
>

Right, sent a v2 to address that

> >>
> >> I guess as an interim solution building perf on 6.4 without traceevent=
 would fix the SDK issue you see with older kernels.
> >> I could then try out how to build perf with an external libtraceevent =
also for older kernels (LIBTRACEEVENT_DYNAMIC) so that it would work for al=
l kernel/perf versions.
> >>
> >> Regards
> >> Max
> >> >
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >> > ---
> >> >  meta/recipes-kernel/perf/perf.bb | 4 +++-
> >> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/=
perf/perf.bb
> >> > index 67b01a7f65a..d31f59f460b 100644
> >> > --- a/meta/recipes-kernel/perf/perf.bb
> >> > +++ b/meta/recipes-kernel/perf/perf.bb
> >> > @@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el =3D "-m elf64lt=
smip"
> >> >  do_compile() {
> >> >         # Linux kernel build system is expected to do the right thin=
g
> >> >         unset CFLAGS
> >> > +       sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/tracee=
vent_${KERNEL_VERSION}/plugins|g' ${S}/tools/lib/traceevent/plugins/Makefil=
e
> >> > +       sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/tracee=
vent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
> >> >         oe_runmake all
> >> >  }
> >> >
> >> > @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =3D "${@bb.utils.contains('P=
ACKAGECONFIG', 'scripting', '${PN}
> >> >  RSUGGESTS:${PN} +=3D "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTI=
NG}"
> >> >
> >> >  FILES_SOLIBSDEV =3D ""
> >> > -FILES:${PN} +=3D "${libexecdir}/perf-core ${exec_prefix}/libexec/pe=
rf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so"
> >> > +FILES:${PN} +=3D "${libexecdir}/perf-core ${exec_prefix}/libexec/pe=
rf-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
> >> >  FILES:${PN}-archive =3D "${libdir}/perf/perf-core/perf-archive"
> >> >  FILES:${PN}-tests =3D "${libdir}/perf/perf-core/tests ${libexecdir}=
/perf-core/tests"
> >> >  FILES:${PN}-python =3D " \
> >> > --
> >> > 2.40.1
> >> >
> >> >

