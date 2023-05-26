Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A8CC77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 11:24:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5703.1685100288313672568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 04:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mJKBW/CR;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30ab87a1897so347005f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685100287; x=1687692287;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2aVqAv2pUotxlaHXRug2W4IRCCJVTXuB7e4ufekz3xs=;
        b=mJKBW/CRQW6i1sFYYuDtnVxA8CjL5lKHndLo9Z7kN5qpMJkRSiE5nNahHEFoXvyFc9
         U4h7yM+Ey41oJnjOK77Wa+DqpMkYmlyoVv+jQtQOUy0NkTuebMolqIIrFEFbaM1kIQ16
         3+iPWpVUVpEjbVjHjR84qQhwlHpWJMbHFOGCHDX9ljdaDigX4rmiLvzucRhpWRLP2J91
         Z7MZiOdFaAsApPuTJWG1ckZ7Gb0z1BsCaZlcwZlm12jbf+LikNGmZLVXpC+fXIr4qntR
         bOsHI9sr11ZRo6on1FLNyjmCf8Dl9ZkP1QYN69GaNzah2OSHhaj2D0G5MQSLKLsHQWyF
         bYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685100287; x=1687692287;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aVqAv2pUotxlaHXRug2W4IRCCJVTXuB7e4ufekz3xs=;
        b=fnQggiO3HvvIqfpWeVydBoJAClmcA/Z9ONrLoEzqtMMiKdCv/t5SO3qjjaNAX3bkA8
         9XifxqHaSOjnvi/Gvx0JckJARIJ94+d2SZDnP/sD9zTHVDObqSFfsL/QZH4slUpPkFq9
         j5fYffG6xicvnY3QdwihxinPuBm2rmd62vyQ3yd8D/M54lRytEg8OmYxrPMTyuaAzt+o
         svOcWeBGfBrjrVcprvqZ/5ZfPLPd5fvBgFk63BI0kHn2y5qnMTC+bdkJERN2XO+wls9p
         rMwIDIZ/cX8HYnIkPU9R1iPcUK1QLvu3SuFBHA6jVzq372Z/69XcmgYop9mZc26j3nSN
         oLlA==
X-Gm-Message-State: AC+VfDxPp6ZwTw+1hKpW3Ok1c+F9W+E8NI3LkjuuaWTf78N4YQKqgU+r
	l12StsRlUkKu8yd1DCx7CAvZdD45HZrh4ZZNYbU=
X-Google-Smtp-Source: ACHHUZ5fzPZ/8IVsLRkVTbJ6/cKSPcuTKIH4XXWFXWPNQL00UOVZ/6G2p3ru1LzZ1VBxcDeFRzfEXO9H9AiuyzJqYCs=
X-Received: by 2002:adf:e792:0:b0:306:340c:4737 with SMTP id
 n18-20020adfe792000000b00306340c4737mr1142948wrm.67.1685100286550; Fri, 26
 May 2023 04:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ec4e:0:b0:309:59d8:d065 with HTTP; Fri, 26 May 2023
 04:24:46 -0700 (PDT)
In-Reply-To: <20230526052555.381043-1-raj.khem@gmail.com>
References: <20230526052555.381043-1-raj.khem@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 26 May 2023 13:24:46 +0200
Message-ID: <CAEHkU3Vr3zhN_OyYV3g_kNBBRw0s2U9Ab1PUD6_R9B_QM0TmNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] perf: Make built-in libtraceevent plugins
 cohabit with external libtraceevent
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000fda57805fc96fb82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 11:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181766

--000000000000fda57805fc96fb82
Content-Type: text/plain; charset="UTF-8"

On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> This will package the plugins built by perf into kernel specific dir
> under libdir, so it does not conflict with plugins from newly added
> libtraceevent recipe
>
> Fixes
> do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so
is installed by both perf and libtraceevent, aborting
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> ---
> v2: Check if files exist before sed'ing them
>
>  meta/recipes-kernel/perf/perf.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
perf.bb
> index 67b01a7f65a..2d803381bb4 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -137,6 +137,10 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
>         unset CFLAGS
> +        test -e ${S}/tools/lib/traceevent/plugins/Makefile && \
> +            sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/lib/traceevent/plugins/Makefile
> +       test -e ${S}/tools/perf/Makefile.config && \
> +            sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/perf/Makefile.config
>         oe_runmake all
>  }
>
> @@ -364,7 +368,7 @@ RSUGGESTS_SCRIPTING =
"${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
>  RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>
>  FILES_SOLIBSDEV = ""
> -FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core
${libdir}/traceevent ${libdir}/libperf-jvmti.so"
> +FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core
${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
>  FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>  FILES:${PN}-tests = "${libdir}/perf/perf-core/tests
${libexecdir}/perf-core/tests"
>  FILES:${PN}-python = " \
> --
> 2.40.1
>
>
LGTM
Thanks for the fix Khem.
Regards
Max

--000000000000fda57805fc96fb82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, May 26, 2023, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; This will package the pl=
ugins built by perf into kernel specific dir<br>&gt; under libdir, so it do=
es not conflict with plugins from newly added<br>&gt; libtraceevent recipe<=
br>&gt;<br>&gt; Fixes<br>&gt; do_sdk_depends: The file /usr/lib/traceevent/=
plugins/plugin_cfg80211.so is installed by both perf and libtraceevent, abo=
rting<br>&gt;<br>&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt; Cc: Max Krummenacher &lt;<a=
 href=3D"mailto:max.krummenacher@toradex.com">max.krummenacher@toradex.com<=
/a>&gt;<br>&gt; ---<br>&gt; v2: Check if files exist before sed&#39;ing the=
m<br>&gt;<br>&gt; =C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb"=
>perf.bb</a> | 6 +++++-<br>&gt; =C2=A01 file changed, 5 insertions(+), 1 de=
letion(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"=
http://perf.bb">perf.bb</a> b/meta/recipes-kernel/perf/<a href=3D"http://pe=
rf.bb">perf.bb</a><br>&gt; index 67b01a7f65a..2d803381bb4 100644<br>&gt; --=
- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb">perf.bb</a><br>&gt;=
 +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb">perf.bb</a><br>&=
gt; @@ -137,6 +137,10 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el =3D &quot;-m elf6=
4ltsmip&quot;<br>&gt; =C2=A0do_compile() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Linux kernel build system is expected to do the right thing<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 test -e ${S}/tools/lib/traceevent/plugins/Makefile &amp;&amp; \<br>&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s|\$(libdir)/tra=
ceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#39; ${S}=
/tools/lib/traceevent/plugins/Makefile<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
test -e ${S}/tools/perf/Makefile.config &amp;&amp; \<br>&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s|\$(libdir)/traceevent/plugins=
|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#39; ${S}/tools/perf/Mak=
efile.config<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake all<br>&gt; =C2=
=A0}<br>&gt;<br>&gt; @@ -364,7 +368,7 @@ RSUGGESTS_SCRIPTING =3D &quot;${@b=
b.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;scripting&#39;, &#39;${PN}<b=
r>&gt; =C2=A0RSUGGESTS:${PN} +=3D &quot;${PN}-archive ${PN}-tests ${RSUGGES=
TS_SCRIPTING}&quot;<br>&gt;<br>&gt; =C2=A0FILES_SOLIBSDEV =3D &quot;&quot;<=
br>&gt; -FILES:${PN} +=3D &quot;${libexecdir}/perf-core ${exec_prefix}/libe=
xec/perf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so&quot;<br>&gt;=
 +FILES:${PN} +=3D &quot;${libexecdir}/perf-core ${exec_prefix}/libexec/per=
f-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.so&quot;<br>&gt; =C2=
=A0FILES:${PN}-archive =3D &quot;${libdir}/perf/perf-core/perf-archive&quot=
;<br>&gt; =C2=A0FILES:${PN}-tests =3D &quot;${libdir}/perf/perf-core/tests =
${libexecdir}/perf-core/tests&quot;<br>&gt; =C2=A0FILES:${PN}-python =3D &q=
uot; \<br>&gt; --<br>&gt; 2.40.1<br>&gt;<br>&gt;<br>LGTM<br>Thanks for the =
fix Khem.<br>Regards<br>Max

--000000000000fda57805fc96fb82--

