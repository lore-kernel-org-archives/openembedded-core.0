Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DC7C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 19:58:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.4098.1685476696943274138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 12:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nGuqhuLa;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2af28303127so52982201fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685476695; x=1688068695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rI4V9uWS1OXPsj6tRpHeoeuynoYaRxfNgS+9ZgYumT4=;
        b=nGuqhuLaRAaV6IY1vmbIRmjCLa7gWklbBJymj/TT7wXZpEadHNUwSgcMEqrk5x+Rww
         XJbop0jO8g5LWIbiZI6pEGV+09SJ/q2bNGFZPfZMJyjC4RYQ92oOxQQfGfU09qFcIF1P
         8pLIdvgnDGvST+eUgle0OtTqELHCBaNNmnMAaDTSVDtNwaWLq/zAjgNXHfm8t+VhG7EZ
         qio+Opb9VtMcm1+/1paIyUsZ0aIKeAgfghiPh7klV/hI3wBl3GiNsRiMtU/uib6B3gCQ
         ydgV3JJa2Q7E/ZYeToU1oP+1XiTvwVR966BRFy/GmnIw0ug9ZgjkwaQEaPmqZ2J4oYAa
         SjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476695; x=1688068695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI4V9uWS1OXPsj6tRpHeoeuynoYaRxfNgS+9ZgYumT4=;
        b=a4XNpt+icRa/tAoJgB9eGx0hXsLsFMW5dsF+Xo/KQuFEWfTShazO+uAiIdYowvwa/H
         i1xSF3iEMsihCzwAMcvMDdqb/zxJaQhN8k3jmQ0hSOEk4WGwMjiV3MgTF7rs1o2TGX62
         Z4Ar1dBxptFMVRpyIigIq4ao6PcbkC2DKt+I0gPsxaz2vZZOqTh7TVzQ2UVRQ78ehYvw
         9nDu3TB5rvSMaY7h5WzNOnhXaXpbwliWuN7Zdn5tlGbrNjxv6KNsvvU2WQCF1G3JFsPQ
         X+Q5RmKqoyAOWnNxngsUVJjuZnEnJ8bYLeWbHXJSnjF9gaJ5fFnCFX5JxWcAhpac1vUR
         3dMA==
X-Gm-Message-State: AC+VfDxfQrnGrH/iBaCl75NgdnlpRt/Y3777lleU6jLYtQQKzMPTd7tZ
	+0Wc7NILuH2HOyx0wELNgUeVEKPrseVwJIYP5bU=
X-Google-Smtp-Source: ACHHUZ7Ig/Lz8YszoSfqBZgDivURHjqM/Z6ZDjN/45x8mZqXOgltVq2gVCfp115D8HbTrcolL2cdKRVZMbR1V/oih9c=
X-Received: by 2002:a2e:6a17:0:b0:2ac:b63e:94a6 with SMTP id
 f23-20020a2e6a17000000b002acb63e94a6mr1458206ljc.21.1685476694799; Tue, 30
 May 2023 12:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <CADkTA4M63mwkQeEeb_D-8uRkqtmt8sU5xJ1jvGCtdxV6GHZMeg@mail.gmail.com>
In-Reply-To: <CADkTA4M63mwkQeEeb_D-8uRkqtmt8sU5xJ1jvGCtdxV6GHZMeg@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 30 May 2023 21:58:03 +0200
Message-ID: <CALatG=4TeChkii4ZKH8NqgDvfz=tupAG1a6na6ZVpGqjbYGP6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com
Content-Type: multipart/alternative; boundary="000000000000abba2805fcee9fa7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181946

--000000000000abba2805fcee9fa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce:

Please see my answers as below:

> You've confirmed that the result is the same as the touches previously
did when that variable isn't set ?

Yes, I have verified that on a qemuarm64 machine.

> Those comments are still valid

I think after we introduce KERNEL_LOCALVERSION, then we generate
the .scmversion on purpose, not as a workaround or fix so those comments
not valid any more?

the best,
thank you


Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:21=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> w=
rote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
> > to append a string to the name of the local version of the kernel
> > image.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 10 +++++-----
> >  meta/conf/documentation.conf       |  1 +
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index e634eabd49..3dd139eda9 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -616,6 +616,7 @@ do_shared_workdir () {
> >  # We don't need to stage anything, not the modules/firmware since thos=
e
> would clash with linux-firmware
> >  SYSROOT_DIRS =3D ""
> >
> > +KERNEL_LOCALVERSION ??=3D ""
> >  KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} olddefcon=
fig
> || oe_runmake -C ${S} O=3D${B} oldnoconfig"
> >
> >  python check_oldest_kernel() {
> > @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=3D
> "OLDEST_KERNEL KERNEL_VERSION"
> >  do_configure[prefuncs] +=3D "check_oldest_kernel"
> >
> >  kernel_do_configure() {
> > -       # fixes extra + in /lib/modules/2.6.37+
> > -       # $ scripts/setlocalversion . =3D> +
> > -       # $ make kernelversion =3D> 2.6.37
> > -       # $ make kernelrelease =3D> 2.6.37+
>
> Those comments are still valid.
>
> > -       touch ${B}/.scmversion ${S}/.scmversion
> > +       if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> > +               echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > +               echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > +       fi
>
> You've confirmed that the result is the same as the touches previously
> did when that variable isn't set ?
>
> Bruce
>
> >
> >         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f
> "${B}/.config" ]; then
> >                 mv "${S}/.config" "${B}/.config"
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.con=
f
> > index a27d7a53c3..66b8e2f24f 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel modu=
les
> for which the build system
> >  KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Default=
s
> to 'kernel'."
> >  KERNEL_PATH[doc] =3D "The location of the kernel sources. This variabl=
e
> is set to the value of the STAGING_KERNEL_DIR within the module class
> (module.bbclass)."
> >  KERNEL_SRC[doc] =3D "The location of the kernel sources. This variable=
 is
> set to the value of the STAGING_KERNEL_DIR within the module class
> (module.bbclass)."
> > +KERNEL_LOCALVERSION[doc] =3D "Appends a string to the name of the loca=
l
> version of the kernel image."
> >  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a
> configuration fragment. You use this variable in the .scc file that
> describes a configuration fragment file."
> >  KMACHINE[doc] =3D "The machine as known by the kernel."
> >  KTYPE[doc] =3D "Defines the kernel type to be used in assembling the
> configuration."
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#181939):
> https://lists.openembedded.org/g/openembedded-core/message/181939
> > Mute This Topic: https://lists.openembedded.org/mt/99224358/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000abba2805fcee9fa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>Please see my answers as bel=
ow:</div><div><br></div><div>&gt; You&#39;ve confirmed that the result is t=
he same as the touches previously did when that variable isn&#39;t set ?<br=
></div><div><br></div><div>Yes, I have verified that on a qemuarm64 machine=
.</div><div><br></div><div>&gt; Those comments are still valid<br></div><di=
v><br></div><div>I think after we introduce KERNEL_LOCALVERSION, then we ge=
nerate the=C2=A0.scmversion on purpose, not as a workaround or fix so those=
 comments not valid any more?</div><div><br></div><div>the best,</div><div>=
thank you</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2023=E5=B9=B45=
=E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:21=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu &lt;<a href=3D"mailto:liu.=
ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION<=
br>
&gt; to append a string to the name of the local version of the kernel<br>
&gt; image.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 10 +++++-----<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 +<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index e634eabd49..3dd139eda9 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -616,6 +616,7 @@ do_shared_workdir () {<br>
&gt;=C2=A0 # We don&#39;t need to stage anything, not the modules/firmware =
since those would clash with linux-firmware<br>
&gt;=C2=A0 SYSROOT_DIRS =3D &quot;&quot;<br>
&gt;<br>
&gt; +KERNEL_LOCALVERSION ??=3D &quot;&quot;<br>
&gt;=C2=A0 KERNEL_CONFIG_COMMAND ?=3D &quot;oe_runmake_call -C ${S} O=3D${B=
} olddefconfig || oe_runmake -C ${S} O=3D${B} oldnoconfig&quot;<br>
&gt;<br>
&gt;=C2=A0 python check_oldest_kernel() {<br>
&gt; @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=3D &quot;O=
LDEST_KERNEL KERNEL_VERSION&quot;<br>
&gt;=C2=A0 do_configure[prefuncs] +=3D &quot;check_oldest_kernel&quot;<br>
&gt;<br>
&gt;=C2=A0 kernel_do_configure() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixes extra + in /lib/modules/2.6.37+<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ scripts/setlocalversion . =3D&gt; +<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelversion =3D&gt; 2.6.37<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelrelease =3D&gt; 2.6.37+<br>
<br>
Those comments are still valid.<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${B}/.scmversion ${S}/.scmversion<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e ${B}/.scmversion -a ! -e ${S}/.s=
cmversion ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo ${KERNEL_=
LOCALVERSION} &gt; ${B}/.scmversion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo ${KERNEL_=
LOCALVERSION} &gt; ${S}/.scmversion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
You&#39;ve confirmed that the result is the same as the touches previously<=
br>
did when that variable isn&#39;t set ?<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${S}&quot; !=3D &quot;${B}=
&quot; ] &amp;&amp; [ -f &quot;${S}/.config&quot; ] &amp;&amp; [ ! -f &quot=
;${B}/.config&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;=
${S}/.config&quot; &quot;${B}/.config&quot;<br>
&gt; diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.co=
nf<br>
&gt; index a27d7a53c3..66b8e2f24f 100644<br>
&gt; --- a/meta/conf/documentation.conf<br>
&gt; +++ b/meta/conf/documentation.conf<br>
&gt; @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D &quot;Lists kerne=
l modules for which the build system<br>
&gt;=C2=A0 KERNEL_PACKAGE_NAME[doc] =3D &quot;Name prefix for kernel packag=
es. Defaults to &#39;kernel&#39;.&quot;<br>
&gt;=C2=A0 KERNEL_PATH[doc] =3D &quot;The location of the kernel sources. T=
his variable is set to the value of the STAGING_KERNEL_DIR within the modul=
e class (module.bbclass).&quot;<br>
&gt;=C2=A0 KERNEL_SRC[doc] =3D &quot;The location of the kernel sources. Th=
is variable is set to the value of the STAGING_KERNEL_DIR within the module=
 class (module.bbclass).&quot;<br>
&gt; +KERNEL_LOCALVERSION[doc] =3D &quot;Appends a string to the name of th=
e local version of the kernel image.&quot;<br>
&gt;=C2=A0 KFEATURE_DESCRIPTION[doc] =3D &quot;Provides a short description=
 of a configuration fragment. You use this variable in the .scc file that d=
escribes a configuration fragment file.&quot;<br>
&gt;=C2=A0 KMACHINE[doc] =3D &quot;The machine as known by the kernel.&quot=
;<br>
&gt;=C2=A0 KTYPE[doc] =3D &quot;Defines the kernel type to be used in assem=
bling the configuration.&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#181939): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/181939" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/181939</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99224358=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99224358/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000abba2805fcee9fa7--

