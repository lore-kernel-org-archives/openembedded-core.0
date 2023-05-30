Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39B1C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:11:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.4564.1685477513043561485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 13:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=eiC244EZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so5491521e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685477511; x=1688069511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbtez5vSsDqD5KeNC78w5H0OFUva5UGUe5oR6mwSmo8=;
        b=eiC244EZvKMnlKb8S4a2TRPArfUZjwpMe3ig1hv6Y9xTqezOLJs9avwuGlvYDiCk0H
         KNOqED6nyGRS5OvS7UMmnnqutHSN9cBKiUaQSy8+CK24gXqTtZFJtjUODv6pXoRjShUy
         N5kNXOGGQPH+uXHv7CdeZqo9MP3tTz/xxLSU9VHe4jViU9BVQ+BrG6hN5oBER6RDDA6V
         K7/YwcVqKhF3YzPdz2JeuRLCdzfcDZrX9bk7BU/Td3zI3dh4EYes8Tkcohvh1dkCBapb
         gJyaz1VSLrxx7EINYu9og3b/cel7lP2ETxdHoUzLuvr3Eke2/ycuTITle6MA0VRxHP26
         uJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477511; x=1688069511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbtez5vSsDqD5KeNC78w5H0OFUva5UGUe5oR6mwSmo8=;
        b=lO0IxUENkdHXh4MvsOlek/pUxB5w7/Dx1hLyUnCAeqx8caukot3k9DBzkZoMKsW06S
         tAeKFl2BdRdCjK65QMTBxlA1OjnfL8HJj0iypVcaZQgbbHFN6DtIjJlwBtVEjYPT1q5x
         ffK0vTaDTEUm9CET7z9zE5HAQsyFEBxuykzkZC5s9558LbbGHnvtXDnIzqmITLsT+4gm
         JNpEsFqgchu9icmNKfLLgEj6QgZGg8JCpJpC6XhzMwNzBmMhUS2Th1b9UqKeaJjYKeTx
         FuNzDqIsfXq4h/ms4YugEo8qyBGsr5ezECw5tkxMXZ6yuNiRuOSipniZO6LgymOhyL03
         jkyQ==
X-Gm-Message-State: AC+VfDyqv5CCJBTFvmwGZyL0LSBee2TBolb46IS/pDtF2+KwCsnzugm4
	kkEZ070CU8Wedr9xifn+yBNJteiH/j/f6zJwzXo=
X-Google-Smtp-Source: ACHHUZ7pwXJA2Yox6n7O6QIM/erkaGoinUj6e2nC8D54QrduhcpPatKagg9kuvT/VlWJqYevqUo/gnNswEe7WcS13p0=
X-Received: by 2002:a2e:9d46:0:b0:2ac:8cc0:bee5 with SMTP id
 y6-20020a2e9d46000000b002ac8cc0bee5mr1241673ljj.0.1685477510550; Tue, 30 May
 2023 13:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <CADkTA4M63mwkQeEeb_D-8uRkqtmt8sU5xJ1jvGCtdxV6GHZMeg@mail.gmail.com>
 <CALatG=4TeChkii4ZKH8NqgDvfz=tupAG1a6na6ZVpGqjbYGP6g@mail.gmail.com> <CADkTA4Ojqj8qVSqQn1fo6k1_DF4Ya58OYPo6spxvH5sTkyowOA@mail.gmail.com>
In-Reply-To: <CADkTA4Ojqj8qVSqQn1fo6k1_DF4Ya58OYPo6spxvH5sTkyowOA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 30 May 2023 22:11:39 +0200
Message-ID: <CALatG=6BRZzdK2y0YBhHG5uCjAmhzhWPK3Zkd1KUtnM+JgOPqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com
Content-Type: multipart/alternative; boundary="0000000000004b181a05fceed0be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 20:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181948

--0000000000004b181a05fceed0be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce:

OK, thanks for the explanation, that makes sense, will add them back in V2.

the best,
thank you

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:09=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Tue, May 30, 2023 at 3:58=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> w=
rote:
> >
> > Hi, Bruce:
> >
> > Please see my answers as below:
> >
> > > You've confirmed that the result is the same as the touches previousl=
y
> did when that variable isn't set ?
> >
> > Yes, I have verified that on a qemuarm64 machine.
> >
> > > Those comments are still valid
> >
> > I think after we introduce KERNEL_LOCALVERSION, then we generate the
> .scmversion on purpose, not as a workaround or fix so those comments not
> valid any more?
> >
>
> They are definitely still valid.  The files need to exist, or the +
> gets added. Other layers and kernel recipes have been touching and
> using those files in their own way, the kernel.bbclass was just a
> default to ensure if they didn't handle it, that those noise wouldn't
> be generated.
>
> That variable is completely optional, so we are not always generating
> it on purpose. Also CONFIG_LOCALVERSION is used by linux-yocto and
> other recipes, so the default of empty to ensure that nothing is added
> by kbuild is the case, and also makes them valid.
>
> Bruce
>
>
> > the best,
> > thank you
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=
=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:21=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >>
> >> On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu <liu.ming50@gmail.com=
> wrote:
> >> >
> >> > From: Ming Liu <liu.ming50@gmail.com>
> >> >
> >> > Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSIO=
N
> >> > to append a string to the name of the local version of the kernel
> >> > image.
> >> >
> >> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> >> > ---
> >> >  meta/classes-recipe/kernel.bbclass | 10 +++++-----
> >> >  meta/conf/documentation.conf       |  1 +
> >> >  2 files changed, 6 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> >> > index e634eabd49..3dd139eda9 100644
> >> > --- a/meta/classes-recipe/kernel.bbclass
> >> > +++ b/meta/classes-recipe/kernel.bbclass
> >> > @@ -616,6 +616,7 @@ do_shared_workdir () {
> >> >  # We don't need to stage anything, not the modules/firmware since
> those would clash with linux-firmware
> >> >  SYSROOT_DIRS =3D ""
> >> >
> >> > +KERNEL_LOCALVERSION ??=3D ""
> >> >  KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B}
> olddefconfig || oe_runmake -C ${S} O=3D${B} oldnoconfig"
> >> >
> >> >  python check_oldest_kernel() {
> >> > @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=3D
> "OLDEST_KERNEL KERNEL_VERSION"
> >> >  do_configure[prefuncs] +=3D "check_oldest_kernel"
> >> >
> >> >  kernel_do_configure() {
> >> > -       # fixes extra + in /lib/modules/2.6.37+
> >> > -       # $ scripts/setlocalversion . =3D> +
> >> > -       # $ make kernelversion =3D> 2.6.37
> >> > -       # $ make kernelrelease =3D> 2.6.37+
> >>
> >> Those comments are still valid.
> >>
> >> > -       touch ${B}/.scmversion ${S}/.scmversion
> >> > +       if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> >> > +               echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> >> > +               echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> >> > +       fi
> >>
> >> You've confirmed that the result is the same as the touches previously
> >> did when that variable isn't set ?
> >>
> >> Bruce
> >>
> >> >
> >> >         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f
> "${B}/.config" ]; then
> >> >                 mv "${S}/.config" "${B}/.config"
> >> > diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> >> > index a27d7a53c3..66b8e2f24f 100644
> >> > --- a/meta/conf/documentation.conf
> >> > +++ b/meta/conf/documentation.conf
> >> > @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel
> modules for which the build system
> >> >  KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages.
> Defaults to 'kernel'."
> >> >  KERNEL_PATH[doc] =3D "The location of the kernel sources. This
> variable is set to the value of the STAGING_KERNEL_DIR within the module
> class (module.bbclass)."
> >> >  KERNEL_SRC[doc] =3D "The location of the kernel sources. This varia=
ble
> is set to the value of the STAGING_KERNEL_DIR within the module class
> (module.bbclass)."
> >> > +KERNEL_LOCALVERSION[doc] =3D "Appends a string to the name of the
> local version of the kernel image."
> >> >  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a
> configuration fragment. You use this variable in the .scc file that
> describes a configuration fragment file."
> >> >  KMACHINE[doc] =3D "The machine as known by the kernel."
> >> >  KTYPE[doc] =3D "Defines the kernel type to be used in assembling th=
e
> configuration."
> >> > --
> >> > 2.25.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#181939):
> https://lists.openembedded.org/g/openembedded-core/message/181939
> >> > Mute This Topic: https://lists.openembedded.org/mt/99224358/1050810
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [bruce.ashfield@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000004b181a05fceed0be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>OK, thanks for the explanati=
on, that makes sense, will add them back in V2.</div><div><br></div><div>th=
e best,</div><div>thank you</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2023=E5=B9=
=B45=E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:09=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, May 30, 2023 at 3:58=E2=80=AFPM Ming Liu &lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hi, Bruce:<br>
&gt;<br>
&gt; Please see my answers as below:<br>
&gt;<br>
&gt; &gt; You&#39;ve confirmed that the result is the same as the touches p=
reviously did when that variable isn&#39;t set ?<br>
&gt;<br>
&gt; Yes, I have verified that on a qemuarm64 machine.<br>
&gt;<br>
&gt; &gt; Those comments are still valid<br>
&gt;<br>
&gt; I think after we introduce KERNEL_LOCALVERSION, then we generate the .=
scmversion on purpose, not as a workaround or fix so those comments not val=
id any more?<br>
&gt;<br>
<br>
They are definitely still valid.=C2=A0 The files need to exist, or the +<br=
>
gets added. Other layers and kernel recipes have been touching and<br>
using those files in their own way, the kernel.bbclass was just a<br>
default to ensure if they didn&#39;t handle it, that those noise wouldn&#39=
;t<br>
be generated.<br>
<br>
That variable is completely optional, so we are not always generating<br>
it on purpose. Also CONFIG_LOCALVERSION is used by linux-yocto and<br>
other recipes, so the default of empty to ensure that nothing is added<br>
by kbuild is the case, and also makes them valid.<br>
<br>
Bruce<br>
<br>
<br>
&gt; the best,<br>
&gt; thank you<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2023=E5=B9=B45=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:21=E5=AF=AB=E9=81=93=
=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 30, 2023 at 1:10=E2=80=AFPM Ming Liu &lt;<a href=3D"ma=
ilto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCA=
LVERSION<br>
&gt;&gt; &gt; to append a string to the name of the local version of the ke=
rnel<br>
&gt;&gt; &gt; image.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmai=
l.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 10 +++++-----<br>
&gt;&gt; &gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 6 insertions(+), 5 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classe=
s-recipe/kernel.bbclass<br>
&gt;&gt; &gt; index e634eabd49..3dd139eda9 100644<br>
&gt;&gt; &gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt;&gt; &gt; @@ -616,6 +616,7 @@ do_shared_workdir () {<br>
&gt;&gt; &gt;=C2=A0 # We don&#39;t need to stage anything, not the modules/=
firmware since those would clash with linux-firmware<br>
&gt;&gt; &gt;=C2=A0 SYSROOT_DIRS =3D &quot;&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +KERNEL_LOCALVERSION ??=3D &quot;&quot;<br>
&gt;&gt; &gt;=C2=A0 KERNEL_CONFIG_COMMAND ?=3D &quot;oe_runmake_call -C ${S=
} O=3D${B} olddefconfig || oe_runmake -C ${S} O=3D${B} oldnoconfig&quot;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 python check_oldest_kernel() {<br>
&gt;&gt; &gt; @@ -633,11 +634,10 @@ check_oldest_kernel[vardepsexclude] +=
=3D &quot;OLDEST_KERNEL KERNEL_VERSION&quot;<br>
&gt;&gt; &gt;=C2=A0 do_configure[prefuncs] +=3D &quot;check_oldest_kernel&q=
uot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 kernel_do_configure() {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixes extra + in /lib/modules/2=
.6.37+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ scripts/setlocalversion . =3D=
&gt; +<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelversion =3D&gt; 2.=
6.37<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# $ make kernelrelease =3D&gt; 2.=
6.37+<br>
&gt;&gt;<br>
&gt;&gt; Those comments are still valid.<br>
&gt;&gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${B}/.scmversion ${S}/.scmv=
ersion<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e ${B}/.scmversion -a ! -=
e ${S}/.scmversion ]; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
${KERNEL_LOCALVERSION} &gt; ${B}/.scmversion<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
${KERNEL_LOCALVERSION} &gt; ${S}/.scmversion<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt; You&#39;ve confirmed that the result is the same as the touches pr=
eviously<br>
&gt;&gt; did when that variable isn&#39;t set ?<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${S}&quot; !=3D &=
quot;${B}&quot; ] &amp;&amp; [ -f &quot;${S}/.config&quot; ] &amp;&amp; [ !=
 -f &quot;${B}/.config&quot; ]; then<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mv &quot;${S}/.config&quot; &quot;${B}/.config&quot;<br>
&gt;&gt; &gt; diff --git a/meta/conf/documentation.conf b/meta/conf/documen=
tation.conf<br>
&gt;&gt; &gt; index a27d7a53c3..66b8e2f24f 100644<br>
&gt;&gt; &gt; --- a/meta/conf/documentation.conf<br>
&gt;&gt; &gt; +++ b/meta/conf/documentation.conf<br>
&gt;&gt; &gt; @@ -253,6 +253,7 @@ KERNEL_MODULE_PROBECONF[doc] =3D &quot;Li=
sts kernel modules for which the build system<br>
&gt;&gt; &gt;=C2=A0 KERNEL_PACKAGE_NAME[doc] =3D &quot;Name prefix for kern=
el packages. Defaults to &#39;kernel&#39;.&quot;<br>
&gt;&gt; &gt;=C2=A0 KERNEL_PATH[doc] =3D &quot;The location of the kernel s=
ources. This variable is set to the value of the STAGING_KERNEL_DIR within =
the module class (module.bbclass).&quot;<br>
&gt;&gt; &gt;=C2=A0 KERNEL_SRC[doc] =3D &quot;The location of the kernel so=
urces. This variable is set to the value of the STAGING_KERNEL_DIR within t=
he module class (module.bbclass).&quot;<br>
&gt;&gt; &gt; +KERNEL_LOCALVERSION[doc] =3D &quot;Appends a string to the n=
ame of the local version of the kernel image.&quot;<br>
&gt;&gt; &gt;=C2=A0 KFEATURE_DESCRIPTION[doc] =3D &quot;Provides a short de=
scription of a configuration fragment. You use this variable in the .scc fi=
le that describes a configuration fragment file.&quot;<br>
&gt;&gt; &gt;=C2=A0 KMACHINE[doc] =3D &quot;The machine as known by the ker=
nel.&quot;<br>
&gt;&gt; &gt;=C2=A0 KTYPE[doc] =3D &quot;Defines the kernel type to be used=
 in assembling the configuration.&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#181939): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/181939" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/181939</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/99224358/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/99224358/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000004b181a05fceed0be--

