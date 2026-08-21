Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE72C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:21:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5215.1787311262273480193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kZZ/QBZF;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1324991a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787311260; cv=none;
        d=google.com; s=arc-20260327;
        b=Zg1oPJ4THIe9Vw4/D8Pf5Z2pKemEdbebBV99M2R4LO2p4dkfa4jsUQcV11Rov5qmAv
         yxHuygTLlnvgElJqG+e8AT6ghitEG2m276PAutN81G8dl99eIyKmHKJeX5l9Z4desgql
         tuEFUcE+yfcgl2JIpN0c1hgd3/g/LeOmd1oh3tSWQTG0cOyS9jRqNAstUDQs/ERJa/jF
         YS28/x4o3w/Ji3UtC9lokVswwah5dRdsY5urk7Km9Fzf76H2v3fEgQfS7ORP4kCFVlvB
         7uFmxyTke0iJTndR2cyPk+NhbdM43bfVp/rr/SUN4otiuLIPoBLCqJEOxvv2GZefP+JN
         Epjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JWSVFzOGXvFQ2lOAOKK+RYdY2pbz/5Q5EftHtRQFmIw=;
        fh=cE/BMIzazMRKtT9ayufiPurBUVd6cVKpZAYSGS7U6Vo=;
        b=b4qWAUQ0ck4qI8pBLbj1V66LjzxMwwapnJ+yDCgo9Bzwx/V8UV5A6/ScIXVnYVP/5+
         LoqxzYBL+lSkcGIPR00od0z8z1unF/qSMxDbPUvA1IxvY8rEvrBDsmcUsEO+NrSzKQC3
         muYuU/ajt033ZAYoe4e96rlmpVQ4n8C7W2RL5bYkTtS8Goz36F0tvnZiSUvgvydKvMvN
         J5kf+1TZ2qJlmMpBKrDxmqB0kcmQK09RnxnbBNWV7OAl/XbHplyJVt0LZ0L3TSj+AqfH
         XTgpQu8IbLlcRxQxXDELVE8fmFqiWNRXW7vh1ehYsXkzdQLe5IFvz7xfGVek4tyopBUF
         Mzlg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311260; x=1787916060; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWSVFzOGXvFQ2lOAOKK+RYdY2pbz/5Q5EftHtRQFmIw=;
        b=kZZ/QBZFeSvuaFlrI3cfp417sdx43xykHnXAr8VtxsvWSeyGiDv7AK/UCS92t7xMMV
         UgwfCf2qx53TwHq1Uw7wVOoB44aheTK4+xPvWYJ/qo3i1DpjVmStaw96CWLjnWcvuZOv
         6GQDuStTTLiDrkm9BrwsxokQLykRgRC9TezOkQgd0TkJRtDYfcqJizfTVApj38qzeSuP
         b5LMsX5uiKbktChUvh69s8M/hT+M506OqQ/d1P9ATa+sAEGWmyVgv7/k3CkMivFvAso9
         waX8l24GanVfwpH+yvhwaUtXDtc3gLqjXwX3bBnMIA0Z6RmrO0poKiYrAhoEutJANZ1M
         ZNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311260; x=1787916060;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWSVFzOGXvFQ2lOAOKK+RYdY2pbz/5Q5EftHtRQFmIw=;
        b=O0PSaRppT4NOhnz+26mttqNXMvd37WziV9IEl6UG5URfH8MSL+KxE63q7vQRuAoMe1
         934VOPzEhqyCbQc+C0XM64pcEaohSSWhiWGk6PruJxB8emdX86gNyrNI4PF6uvwu9em2
         7/IRy65+cQEn+23NcDC4cOBpyqIZfHERdU4FhfjyLBjruvo+ybWFssfXSXR6v8CYjpLc
         7cQxmUqvbOpdsrpfCxCsjVpfZh3ibzg4Hx9++IIisshzEWpcEMRL3RlUVulCELINKxLa
         SGUhJlaK0iM2T0/haZhvQHM5B5wZdyipqi8GVZqVnAHMMSizH1aOAKQ51Xv+iNJvFf/O
         rH1g==
X-Gm-Message-State: AFuF++mLOQu2642e6LPlCwDcd/0eGPJnugHpizEBAtIsr1KJbHohhYyX
	6V1tBeo47eKT/j0Lbugg6dTjO+XrG8ZvHr7gX90JfLG4XQXxZ4XbDo+3sHjliop8fCvrf7jP6cQ
	z3Pg2VKgBfSUf012b+0KFOoLdhZFK/EA=
X-Gm-Gg: AR+sD12x+9dcD4tiQBFqOjmpxDO3t9yHlZ+P5QpggPeXB1kfM5TZAW2NqmefpY3iIL3
	5/cUBwBMAkf4UpxZdH5jH7c7kVdRkIefuH5iT3gRfdwzIG+wYmOIm7Lmalb8Fci9vSOY7qTLDtt
	PZq4EkL8q6a/CZowGoIbv+6QQtaMNk74YXvvoy9IanY9BGfZc5WQM5Npzp8BWeJGHnlL7M4o4rP
	0qEf+5xJLkqhZ8hyNaAhrUo9yLFdyhe+C8Ih38tb+glqjdkZisag5jaCB8Vqp/vs8fXGcx+2x/r
	nAz7+Mb6PKsNKuHU9hGtLotREIlTZIEn6qJX4EBBlhil6kd3JKN2UonlPf7IOTCpB+llLkzEE+q
	KzOwCH7zM7TZTjuBb+7qmGfhrnY3I2XDldBBPakvf8AE98Uajcho0Mms81GQ/Piky
X-Received: by 2002:a17:906:fe4b:b0:c20:3402:bd35 with SMTP id
 a640c23a62f3a-c246a605e78mr605062466b.12.1787311259976; Fri, 21 Aug 2026
 04:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260813191749.48691-1-anis.bougrine10@gmail.com> <4c2bf3afcf60e78107f7d952fe90fd2b0d9521da.camel@linuxfoundation.org>
In-Reply-To: <4c2bf3afcf60e78107f7d952fe90fd2b0d9521da.camel@linuxfoundation.org>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Fri, 21 Aug 2026 13:20:48 +0200
X-Gm-Features: AcwNN1XPJFMHdCec9EXxuadp7oj1zdF8uBut9tw-lX4Sh8UPP6mZ6nS8KiVoATI
Message-ID: <CAGgtUzY_GxbwVPapeFpWLArqLWR-80XL6jZHwLmshyHo9Ahwzg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] kernel.bbclass: add strip process for signed
 kernel modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Antonin Godard <antonin.godard@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000c1095706598cd494"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243923

--000000000000c1095706598cd494
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Thank you, I appreciate your feedback.

However, I still cannot see the connection between the .debug files and
SPDX generation. Perhaps there is something I am missing.
In any case, you are right. I believe the best approach is to sign the
modules without impacting the existing build workflow, although the module
packaging workflow is already affected because signed modules skip
process_split_and_strip_files in the do_package task (see 4c47e5f).

I have looked for a better way to do this and found a window in the
packaging workflow where we can re-sign the modules after the stripping
process and before the package split.
The window I am referring to is between process_split_and_strip_files and
split_kernel_module_packages. This can be achieved by prepending a
re-signing function to PACKAGESPLITFUNCS.

At this point, the modules are located under ${PKGD}, with the same
directory structure they had under ${D}, where they were initially signed.
Therefore, re-signing them is straightforward.
I tested something like the following after removing the skip of the
splitting and stripping steps for signed modules in package.py:

In kernel-module-split.bbclass:
...

PACKAGESPLITFUNCS =3D+ "do_resign_modules"
do_resign_modules(){
    oe_runmake -C ${B} \
        MODVERDIR=3D${B}/.tmp_versions \
        MODLIB=3D${PKGD}/lib/modules/${KERNEL_VERSION} \
        modules_sign
}

...

This successfully strips and then signs the kernel modules.
If you are OK with this approach, I can submit a v4 patch.

BR,
Anis

On Thu, Aug 20, 2026 at 10:51=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-08-13 at 21:17 +0200, Anis Bougrine via
> lists.openembedded.org wrote:
> > Currently, signed kernel modules skip the stripping process in order
> > to preserve the file contents after signing. See commit:
> > 4c47e5f171fa2603355e2f9183065ce8137a18c7
> >
> > However, the kernel install Makefile supports stripping modules before
> > signing them. This allows signed modules to be stripped while preservin=
g
> > a valid signature.
> >
> > Make non-signed kernel modules follow the standard Yocto stripping flow=
,
> > while signed kernel modules use the kernel Makefile stripping flow.
> >
> > Fixes [YOCTO #12927]
> >
> > Reported-by: ross.burton@arm.com
> > Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> > Cc: Antonin Godard <antonin.godard@bootlin.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> > changes in v3:
> >
> > - Fixing rebase issue.
> >
> > changes in v2:
> >
> > - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
> >   duplicating the oe_runmake call.
> > - Use `scripts/config` script instead of grepping .config file.
> > ---
> >  meta/classes-recipe/kernel.bbclass | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index a82bdf7ecb..0998de1548 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -451,8 +451,12 @@ kernel_do_install() {
> >       #
> >       # First install the modules
> >       #
> > -     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > +     unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
> >       if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > +             # If the module will be auto-signed, perform stripping
> before signing.
> > +             if [ "$(${S}/scripts/config --state MODULE_SIG)" =3D "y" =
]
> && [ "$(${S}/scripts/config --state MODULE_SIG_ALL)" =3D "y" ]; then
> > +                     export INSTALL_MOD_STRIP=3D"--strip-debug
> --remove-section=3D.comment --remove-section=3D.note --preserve-dates"
> > +             fi
> >               oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
> >               rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> >               rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>
> There is another issue. If you strip the modules here, we lose all the
> debug symbol information later in the build. That doesn't sound so
> important until you realise we use the debug information to feed into
> the SPDX and it is then used for checking for CVE issues. I'm not sure
> we can afford to do that...
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000c1095706598cd494
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Richard,<br><br>Thank you, I appreciate your feedbac=
k.<br><br>However, I still cannot see the connection between the .debug fil=
es and SPDX generation. Perhaps there is something I am missing.<br>In any =
case, you are right. I believe the best approach is to sign the modules wit=
hout impacting the existing build workflow, although the module packaging w=
orkflow is already affected because signed modules skip process_split_and_s=
trip_files in the do_package task (see 4c47e5f).<br><br>I have looked for a=
 better way to do this and found a window in the packaging workflow where w=
e can re-sign the modules after the stripping process and before the packag=
e split.<br>The window I am referring to is between process_split_and_strip=
_files and split_kernel_module_packages. This can be achieved by prepending=
 a re-signing function to PACKAGESPLITFUNCS.<br><br>At this point, the modu=
les are located under ${PKGD}, with the same directory structure they had u=
nder ${D}, where they were initially signed. Therefore, re-signing them is =
straightforward.<br>I tested something like the following after removing th=
e skip of the splitting and stripping steps for signed modules in package.p=
y:<br><br>In kernel-module-split.bbclass:<br><div>...</div><div><blockquote=
 style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>PACKAGESPLITFUNCS=
 =3D+ &quot;do_resign_modules&quot;<br>do_resign_modules(){<br>=C2=A0 =C2=
=A0 oe_runmake -C ${B} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 MODVERDIR=3D${B}/.t=
mp_versions \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 MODLIB=3D${PKGD}/lib/modules/$=
{KERNEL_VERSION} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules_sign<br>}</div></=
blockquote>...</div><div><br>This successfully strips and then signs the ke=
rnel modules.<br>If you are OK with this approach, I can submit a v4 patch.=
<br><br>BR,<br>Anis</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20, 2026 at 10:5=
1=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2026-08-13 at 21:17 +0=
200, Anis Bougrine via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Currently, signed kernel modules skip the stripping process in order<b=
r>
&gt; to preserve the file contents after signing. See commit:<br>
&gt; 4c47e5f171fa2603355e2f9183065ce8137a18c7<br>
&gt; <br>
&gt; However, the kernel install Makefile supports stripping modules before=
<br>
&gt; signing them. This allows signed modules to be stripped while preservi=
ng<br>
&gt; a valid signature.<br>
&gt; <br>
&gt; Make non-signed kernel modules follow the standard Yocto stripping flo=
w,<br>
&gt; while signed kernel modules use the kernel Makefile stripping flow.<br=
>
&gt; <br>
&gt; Fixes [YOCTO #12927]<br>
&gt; <br>
&gt; Reported-by: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">=
ross.burton@arm.com</a><br>
&gt; Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gma=
il.com" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
&gt; Cc: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" t=
arget=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt; Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.qualcomm.com=
" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; changes in v3:<br>
&gt; <br>
&gt; - Fixing rebase issue.<br>
&gt; <br>
&gt; changes in v2:<br>
&gt; <br>
&gt; - Use the conditional INSTALL_MOD_STRIP environment variable to avoid<=
br>
&gt; =C2=A0 duplicating the oe_runmake call.<br>
&gt; - Use `scripts/config` script instead of grepping .config file.<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-recipe/kernel.bbclass | 6 +++++-<br>
&gt; =C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index a82bdf7ecb..0998de1548 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -451,8 +451,12 @@ kernel_do_install() {<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0#<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0# First install the modules<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0#<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP =
LDFLAGS MACHINE<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&=
#39; .config); then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If the module will =
be auto-signed, perform stripping before signing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$(${S}/scr=
ipts/config --state MODULE_SIG)&quot; =3D &quot;y&quot; ] &amp;&amp; [ &quo=
t;$(${S}/scripts/config --state MODULE_SIG_ALL)&quot; =3D &quot;y&quot; ]; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0export INSTALL_MOD_STRIP=3D&quot;--strip-debug --remove-section=3D.c=
omment --remove-section=3D.note --preserve-dates&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMO=
D=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INST=
ALL_FW_PATH=3D${D}${firmwaredir} modules_install<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${D}=
${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${D}=
${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source&quot;<br>
<br>
There is another issue. If you strip the modules here, we lose all the<br>
debug symbol information later in the build. That doesn&#39;t sound so<br>
important until you realise we use the debug information to feed into<br>
the SPDX and it is then used for checking for CVE issues. I&#39;m not sure<=
br>
we can afford to do that...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c1095706598cd494--

