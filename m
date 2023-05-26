Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89991C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 03:14:31 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.694.1685070862408296044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 20:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o6R7r30A;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-390723f815fso115993b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685070861; x=1687662861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hcxXVG+2ajsUJSsOc4ginOQhK+ZBBHGj4ujSWkcmR1w=;
        b=o6R7r30AMsqLt/JAd7pA0oRLK0gQ5KbNa/VjlPgtjM575ZIa2oqk1FD9/cy4PDn+lD
         9e+21aBRML/qrNwU68Qi+ZsrztSllm2/Z1QTg/aqTxJEW403glcdwz5wqXevtkLLcCKV
         BrXu4QNx+2GeI0uwnXqWCTK/L5pL+YVNwIPatvXj/yi+3uEbnOY+4+BfKk2DNne1G+3i
         I47dfNwVEKRJH22NFMLlr5fhieEPhyabuzHPPCLjQqmWBFSFeXFSFgNdDXmSw5m700E2
         B0pg3hUcE3nHTDOSEWxoqWF9MsrWHirR2yY6rFJyWr1ufwOvt3fYk3jLD9Ne0ZOWavuL
         fTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685070861; x=1687662861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcxXVG+2ajsUJSsOc4ginOQhK+ZBBHGj4ujSWkcmR1w=;
        b=MtNP0aeb/EMRMifA+8kVL6aP/YtPtM6wQY6LAqk/b3MpQuE4EkNdBJdYjvcgD7fGt3
         BmXxdAN8k4/1smdBKB8JPkhXMZgLwPXvM8QFn71TFEYR/oHYGCrGB2MKc/ObGbglhvZo
         EGo2+eIX0ZPJBMMHEOF2iDvKZJHfC9gsyLAn8NfsReXnWZcJr8fvOrffqmabwcNn6A3g
         yX5udhM20MHrOwDDeQgsUbhIAbkbpfmwUNXIOcMZ9RC+/OV6TTO2XKSX+Rkp2rkf/LOS
         SYXJvjqWZtHpi9H8vxt640svdWReBXZc3PpWJQIfnvAQBWmqjeGTFb7WquPQhrihvaMc
         pBYw==
X-Gm-Message-State: AC+VfDxuZW5VOwbjPlw1Z8x/Xswl1R3Q6TLgM7BmwM8wN+0a2kYHUK/7
	AM3YEk5WpDAbEqLbo+F3oWukL2V+XcjY720EHGY=
X-Google-Smtp-Source: ACHHUZ4DV4navMwvQTKBggW+BakHt9LkV+YjRcDFMTA9Mw7ka8UFnw8aT+jAOPKuHdEF8KKA/7btbeiC0wRSC0ZgpVg=
X-Received: by 2002:a05:6808:1288:b0:398:d799:bd37 with SMTP id
 a8-20020a056808128800b00398d799bd37mr374710oiw.38.1685070861368; Thu, 25 May
 2023 20:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230526012356.175746-1-raj.khem@gmail.com> <CAEHkU3U5vcCOgDz6qAhGDtHMXnzq+Gv89uageghdYLKoh+smgg@mail.gmail.com>
In-Reply-To: <CAEHkU3U5vcCOgDz6qAhGDtHMXnzq+Gv89uageghdYLKoh+smgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 May 2023 20:14:10 -0700
Message-ID: <CAMKF1sp9KXzt7Phfm6pNdXeCi-VD2KGwfGErOE8Ga7JMdWENMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Make built-in libtraceevent plugins
 cohabit with external libtraceevent
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001d043c05fc902224"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 03:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181755

--0000000000001d043c05fc902224
Content-Type: text/plain; charset="UTF-8"

On Thu, May 25, 2023 at 7:44 PM Max Krummenacher <max.oss.09@gmail.com>
wrote:

> Hi Khem
>
> On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> > This will package the plugins built by perf into kernel specific dir
> > under libdir, so it does not conflict with plugins from newly added
> > libtraceevent recipe
> >
> > Fixes
> > do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so
> is installed by both perf and libtraceevent, aborting
>
> Starting with kernel version 6.4 libtraceevent is removed from the kernel
> sources and perf depends of an externally provided libtraceevent unless
> explicitely opted out.
>
> perf.bb with this patch will fail when built with a 6.4 kernel.
>

Why will it fail ?


> I guess as an interim solution building perf on 6.4 without traceevent
> would fix the SDK issue you see with older kernels.
> I could then try out how to build perf with an external libtraceevent also
> for older kernels (LIBTRACEEVENT_DYNAMIC) so that it would work for all
> kernel/perf versions.
>
> Regards
> Max
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> > index 67b01a7f65a..d31f59f460b 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
> >  do_compile() {
> >         # Linux kernel build system is expected to do the right thing
> >         unset CFLAGS
> > +       sed -i -e
> 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
> ${S}/tools/lib/traceevent/plugins/Makefile
> > +       sed -i -e
> 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
> ${S}/tools/perf/Makefile.config
> >         oe_runmake all
> >  }
> >
> > @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =
> "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
> >  RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
> >
> >  FILES_SOLIBSDEV = ""
> > -FILES:${PN} += "${libexecdir}/perf-core
> ${exec_prefix}/libexec/perf-core ${libdir}/traceevent
> ${libdir}/libperf-jvmti.so"
> > +FILES:${PN} += "${libexecdir}/perf-core
> ${exec_prefix}/libexec/perf-core ${libdir}/traceevent*
> ${libdir}/libperf-jvmti.so"
> >  FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
> >  FILES:${PN}-tests = "${libdir}/perf/perf-core/tests
> ${libexecdir}/perf-core/tests"
> >  FILES:${PN}-python = " \
> > --
> > 2.40.1
> >
> >

--0000000000001d043c05fc902224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 25, 2023 at 7:44 PM Max Krummenacher &lt;<a hre=
f=3D"mailto:max.oss.09@gmail.com">max.oss.09@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Khem<br><br>On Friday, May 26, 2023, =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br>&gt; This will package the plugins built by =
perf into kernel specific dir<br>&gt; under libdir, so it does not conflict=
 with plugins from newly added<br>&gt; libtraceevent recipe<br>&gt;<br>&gt;=
 Fixes<br>&gt; do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_=
cfg80211.so is installed by both perf and libtraceevent, aborting<br><br>St=
arting with kernel version 6.4 libtraceevent is removed from the kernel sou=
rces and perf depends of an externally provided libtraceevent unless explic=
itely opted out.<br><br><a href=3D"http://perf.bb" target=3D"_blank">perf.b=
b</a> with this patch will fail when built with a 6.4 kernel.<br></blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Why will it fail ?</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>I guess as an =
interim solution building perf on 6.4 without traceevent would fix the SDK =
issue you see with older kernels. <br>I could then try out how to build per=
f with an external libtraceevent also for older kernels (LIBTRACEEVENT_DYNA=
MIC) so that it would work for all kernel/perf versions. <br><br>Regards<br=
>Max<br>&gt;<br>&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>&gt; Cc: Max Kr=
ummenacher &lt;<a href=3D"mailto:max.krummenacher@toradex.com" target=3D"_b=
lank">max.krummenacher@toradex.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/r=
ecipes-kernel/perf/<a href=3D"http://perf.bb" target=3D"_blank">perf.bb</a>=
 | 4 +++-<br>&gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>&=
gt;<br>&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb=
" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=3D"http:=
//perf.bb" target=3D"_blank">perf.bb</a><br>&gt; index 67b01a7f65a..d31f59f=
460b 100644<br>&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.b=
b" target=3D"_blank">perf.bb</a><br>&gt; +++ b/meta/recipes-kernel/perf/<a =
href=3D"http://perf.bb" target=3D"_blank">perf.bb</a><br>&gt; @@ -137,6 +13=
7,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el =3D &quot;-m elf64ltsmip&quot;<br>&=
gt; =C2=A0do_compile() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux kernel=
 build system is expected to do the right thing<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unset CFLAGS<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;=
s|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plu=
gins|g&#39; ${S}/tools/lib/traceevent/plugins/Makefile<br>&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libdir)/traceevent/plugins|\$(libdir)/=
traceevent_${KERNEL_VERSION}/plugins|g&#39; ${S}/tools/perf/Makefile.config=
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake all<br>&gt; =C2=A0}<br>&gt;=
<br>&gt; @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =3D &quot;${@bb.utils.cont=
ains(&#39;PACKAGECONFIG&#39;, &#39;scripting&#39;, &#39;${PN}<br>&gt; =C2=
=A0RSUGGESTS:${PN} +=3D &quot;${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTI=
NG}&quot;<br>&gt;<br>&gt; =C2=A0FILES_SOLIBSDEV =3D &quot;&quot;<br>&gt; -F=
ILES:${PN} +=3D &quot;${libexecdir}/perf-core ${exec_prefix}/libexec/perf-c=
ore ${libdir}/traceevent ${libdir}/libperf-jvmti.so&quot;<br>&gt; +FILES:${=
PN} +=3D &quot;${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${l=
ibdir}/traceevent* ${libdir}/libperf-jvmti.so&quot;<br>&gt; =C2=A0FILES:${P=
N}-archive =3D &quot;${libdir}/perf/perf-core/perf-archive&quot;<br>&gt; =
=C2=A0FILES:${PN}-tests =3D &quot;${libdir}/perf/perf-core/tests ${libexecd=
ir}/perf-core/tests&quot;<br>&gt; =C2=A0FILES:${PN}-python =3D &quot; \<br>=
&gt; --<br>&gt; 2.40.1<br>&gt;<br>&gt;
</blockquote></div></div>

--0000000000001d043c05fc902224--

