Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499BCC77B7E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:44:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.355.1685069046075758507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HvvofRYq;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30a8c4afa46so242782f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685069044; x=1687661044;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhQzAKl5gFu+4zSXt7NoZUEL0dizox9aRmi4Cv+LUNY=;
        b=HvvofRYqUlOcb9qBq5f5YQt32B18N77QTGtdBNdkq929D6pNjoQQKaRyadkiRFfTQ1
         1KdY7cgznKVsWyFIrX8M0pGNIqlcNJDp2sbeaFcPDliF531mnHS5VMRzrIfgAQ8ejLpQ
         tbDKFDC60eiH/c2oGM6SqNZeL00fAduT00EDxDQByTzV7tVu6vQUeNnfnyx3xMosNEK6
         O9Sk5dLGQLpxMSHY2EJSC4LoNRZwTzy2mQ2Ncd+ID1HLBtFTpGGt3C2t0ZN1NbCs6Fx7
         8ONS9MgqFsQJvk/Dh1E6eXpNvdMNNmgNwF2V1ZnR6DydNrzl1XI80nUGK2nwAY4UQyR2
         boXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685069044; x=1687661044;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhQzAKl5gFu+4zSXt7NoZUEL0dizox9aRmi4Cv+LUNY=;
        b=F4bVKV+BuBrEO2tCErWebe3bDNZYOnN+ycSfHOaPQ+VScQ9VLFtb4It51jxU1N8iiO
         U/BAMNCxaPBmm9KMfHAC+FsAwIJXOZxWIz6xZOypVCz6fm4gbXqsf490tShNHM0zNj3Z
         wg9bJrRJkTjQO0DM6zQY9p6F9+KnfBDCEpISGktieQmNWOrF0Vh2D+v97JOYied2oww0
         MLd6G6Yj8ULhs1fQVE2AtJqylS7TwOUibr0lIg7zjvVZLM6TzfVzVatrhLoGqnI6rbaH
         dx7DuULs0RfAlVnVNMU7pTDwksD5dW57rYPepYv+9PxxURwHruJchbA7Kqcvy4+uibpf
         K0EA==
X-Gm-Message-State: AC+VfDwY9zZHuNMpOzUw/IXDfV2KgDJd7QqxgFE4w23mvyFHMWsuvAh8
	tZjfWRqHsiXUFrl6bkiXTdGIxu0G7D1wRnOAHIg=
X-Google-Smtp-Source: ACHHUZ5rv814MTEzWsqy83NyF9liIH6wN97yV38h8Pf7gSZdBJvjCiTD0eWAS8/rowo+X34ixIgEnFVMQqFK51/osSI=
X-Received: by 2002:adf:ed8d:0:b0:2f0:583:44be with SMTP id
 c13-20020adfed8d000000b002f0058344bemr239180wro.0.1685069044315; Thu, 25 May
 2023 19:44:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ec4e:0:b0:309:59d8:d065 with HTTP; Thu, 25 May 2023
 19:44:03 -0700 (PDT)
In-Reply-To: <20230526012356.175746-1-raj.khem@gmail.com>
References: <20230526012356.175746-1-raj.khem@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 26 May 2023 04:44:03 +0200
Message-ID: <CAEHkU3U5vcCOgDz6qAhGDtHMXnzq+Gv89uageghdYLKoh+smgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Make built-in libtraceevent plugins
 cohabit with external libtraceevent
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000cef9e905fc8fb5f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181754

--000000000000cef9e905fc8fb5f9
Content-Type: text/plain; charset="UTF-8"

Hi Khem

On Friday, May 26, 2023, Khem Raj <raj.khem@gmail.com> wrote:
> This will package the plugins built by perf into kernel specific dir
> under libdir, so it does not conflict with plugins from newly added
> libtraceevent recipe
>
> Fixes
> do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so
is installed by both perf and libtraceevent, aborting

Starting with kernel version 6.4 libtraceevent is removed from the kernel
sources and perf depends of an externally provided libtraceevent unless
explicitely opted out.

perf.bb with this patch will fail when built with a 6.4 kernel.

I guess as an interim solution building perf on 6.4 without traceevent
would fix the SDK issue you see with older kernels.
I could then try out how to build perf with an external libtraceevent also
for older kernels (LIBTRACEEVENT_DYNAMIC) so that it would work for all
kernel/perf versions.

Regards
Max
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
perf.bb
> index 67b01a7f65a..d31f59f460b 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
>         unset CFLAGS
> +       sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/lib/traceevent/plugins/Makefile
> +       sed -i -e
's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g'
${S}/tools/perf/Makefile.config
>         oe_runmake all
>  }
>
> @@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING =
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

--000000000000cef9e905fc8fb5f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem<br><br>On Friday, May 26, 2023, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; This will package=
 the plugins built by perf into kernel specific dir<br>&gt; under libdir, s=
o it does not conflict with plugins from newly added<br>&gt; libtraceevent =
recipe<br>&gt;<br>&gt; Fixes<br>&gt; do_sdk_depends: The file /usr/lib/trac=
eevent/plugins/plugin_cfg80211.so is installed by both perf and libtraceeve=
nt, aborting<br><br>Starting with kernel version 6.4 libtraceevent is remov=
ed from the kernel sources and perf depends of an externally provided libtr=
aceevent unless explicitely opted out.<br><br><a href=3D"http://perf.bb">pe=
rf.bb</a> with this patch will fail when built with a 6.4 kernel.<br><br>I =
guess as an interim solution building perf on 6.4 without traceevent would =
fix the SDK issue you see with older kernels. <br>I could then try out how =
to build perf with an external libtraceevent also for older kernels (LIBTRA=
CEEVENT_DYNAMIC) so that it would work for all kernel/perf versions. <br><b=
r>Regards<br>Max<br>&gt;<br>&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt; Cc: Max Krummena=
cher &lt;<a href=3D"mailto:max.krummenacher@toradex.com">max.krummenacher@t=
oradex.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/recipes-kernel/perf/<a hr=
ef=3D"http://perf.bb">perf.bb</a> | 4 +++-<br>&gt; =C2=A01 file changed, 3 =
insertions(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-kern=
el/perf/<a href=3D"http://perf.bb">perf.bb</a> b/meta/recipes-kernel/perf/<=
a href=3D"http://perf.bb">perf.bb</a><br>&gt; index 67b01a7f65a..d31f59f460=
b 100644<br>&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb">=
perf.bb</a><br>&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.b=
b">perf.bb</a><br>&gt; @@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el=
 =3D &quot;-m elf64ltsmip&quot;<br>&gt; =C2=A0do_compile() {<br>&gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 # Linux kernel build system is expected to do the rig=
ht thing<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libdir)/traceevent/plugins|\$(libdi=
r)/traceevent_${KERNEL_VERSION}/plugins|g&#39; ${S}/tools/lib/traceevent/pl=
ugins/Makefile<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|\$(libd=
ir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g&#3=
9; ${S}/tools/perf/Makefile.config<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_r=
unmake all<br>&gt; =C2=A0}<br>&gt;<br>&gt; @@ -364,7 +366,7 @@ RSUGGESTS_SC=
RIPTING =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;script=
ing&#39;, &#39;${PN}<br>&gt; =C2=A0RSUGGESTS:${PN} +=3D &quot;${PN}-archive=
 ${PN}-tests ${RSUGGESTS_SCRIPTING}&quot;<br>&gt;<br>&gt; =C2=A0FILES_SOLIB=
SDEV =3D &quot;&quot;<br>&gt; -FILES:${PN} +=3D &quot;${libexecdir}/perf-co=
re ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-=
jvmti.so&quot;<br>&gt; +FILES:${PN} +=3D &quot;${libexecdir}/perf-core ${ex=
ec_prefix}/libexec/perf-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.=
so&quot;<br>&gt; =C2=A0FILES:${PN}-archive =3D &quot;${libdir}/perf/perf-co=
re/perf-archive&quot;<br>&gt; =C2=A0FILES:${PN}-tests =3D &quot;${libdir}/p=
erf/perf-core/tests ${libexecdir}/perf-core/tests&quot;<br>&gt; =C2=A0FILES=
:${PN}-python =3D &quot; \<br>&gt; --<br>&gt; 2.40.1<br>&gt;<br>&gt;

--000000000000cef9e905fc8fb5f9--

