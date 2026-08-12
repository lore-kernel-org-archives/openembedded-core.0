Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CC8C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 15:41:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11056.1786549256904238285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 08:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N1jWVoHR;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1677c91969so128216666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786549255; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3SGYoP/o3R4TFodwYke6RVULQ/33O0pFvmuMVhzEQ4dfQemXhpg40YdTsBZUtWD4e
         1h0v13C/NiFe5dxocP0Wef1VTezmri5h1rc6fjZ9PvBmwYUWWV043RxCFSqmUiJO1IVn
         WzylhpDe6dRJ+xemFTTyGuzXkwBSEjHtetFO01nG2EYFYnvktw0GyyUILIBHgS5DuVEi
         YDY2/bYJlVoH9cZHGJ7mjeXaMYw8YddqhOhf6ulfJyq3VahAd5FAYHbJ6V7v6ufyMtmf
         OesXqkKmwwAGfWXPq91TAmHNa5Bu0++E3p+UyyM670K4rgEZJ2pAW17uxmKwL9lQLqig
         mFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DGqx4yGN0zJTxfjWYU38Lg2+xR7faqXltRaJ6Ug9hOY=;
        fh=EZBFJje0aYviFMLRlaIQ/qwWhJT/0RyfoZzHAw0RIo8=;
        b=ja9HI5R5s+61ovJBHZRe0H0JgSNPMoGeHrupSzCEjyKNOxxZw0k1uXZgTGRGjQPbRq
         Evd8viJviGb9hO60qCtd0c5BRPIYrLJGqz2lW7bTx+x1sL4RG9WzhmLrgfRGCnwI09h7
         m51jesCrFdmZcnCLSzxliZKphcLYKVBth19KEtS9Ot4WI0Ejl6MS36Z7PpHRU1mlTHtL
         KmdrtAi0iybUCa7C9Xtdi2CvA7/BKL886S8eBxw5lSfnbYpLRPcyzcqI13CkRoIYUpms
         FrDMKbimN7l652KzS5HO5EMU57bhKTjdLGZfKwYUSQ7psBizhbWA3Eh0+NXhXAIrpiKN
         SGag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786549255; x=1787154055; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGqx4yGN0zJTxfjWYU38Lg2+xR7faqXltRaJ6Ug9hOY=;
        b=N1jWVoHRWrPN56HXNG14lJ/HA0sU4uWZNKGTPUTEqbzyN98idGpdctWTr6q+s0PKO1
         zYISEqMOgyTaxvClZUbCgDfzxcdfYmt2hUAV/vVO1nST5HKOrDxe1BeqUHujX/YGgrbu
         JeZiMDvQFfigtWVCNQwu+6xE1yk4VhROfcq2V2VZZpfDDEneXVbL2/6utC+Zx/YBcsS0
         YRVT3sn/KAskOC2xeXgJ02xxRXavxL4PvYC4Y7olAvFEudykUxoqnjmVrEACXZXQatRy
         DiCEUMbEm2oWAbSlhsZj+l4fdrTtZi/A6BT3lz1gVymq4DBFtbPMjTppMiglIFdcULmK
         JbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549255; x=1787154055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DGqx4yGN0zJTxfjWYU38Lg2+xR7faqXltRaJ6Ug9hOY=;
        b=Wtg6GChW68pM54EjUaXCh4Iout3jM5hT+quMoe9i5gR2VX9EgrhBluv6SgF1JrOIFj
         OYtn+rfWp8YCUVJDx/s54f1FySYiPSt7P678J0768DkgO1E8xntcRqS0pkXEpSPA39bW
         jsN80cz+/1NtyGDzG684GrumfHz6LBuYb6O830RRDS4nd3+Z3xyrFkCHossuK8xbBqyy
         4bqNl3gMlwj2YJFR4xOVtw8kgAAOh/GF2MWPUsT6357kIDZZ9AaG6JlMG0pznrl5djSA
         74VnhKl7WDPAe8UtHlXBXdpVk+gpYLAmykCZoJbY/Qhr4dTk4F/RyzCV/5bvwXeqDQEa
         RzCQ==
X-Gm-Message-State: AOJu0YyMkrM1GLN1C+rJnTKseNxa8nHdgem7eLsfBnpMr45DdvadCeTb
	V90AqTwLQd0wgCKnx50P12tAIF9nFZsYpGG8DEJdf94PiPokdDGvMs9Zh/3NoIAHa4947ggTSiu
	i/jv22+u6xKFluIhsoXP5XRYOyH0QIkQ=
X-Gm-Gg: AR+sD13yHmqfIlgbyVuRUMxAzFcoomGWJHXdCv78lwzhSHiRp7PlC4GZisdLjZG5cQ4
	ctSTflXqWQMrXwkdN8uV+z1yJTkl3gLQ0Ua1qh5LwG9Qnp7r9VqApdjOwNA89kZXhiko7dOkDbz
	kc6bNWZtAPX8g7qwtmtJb26kp0/79CiSVLUakA/vEXyFMj5k6RFjJ2dwOnVnEsyIznDdSu6yXcy
	lhD/6mnB0yRS7UXcy52eNUntcHxPqM5c/wB4Z4cuOn8mzFIuqE1MDSlXrNRaXefjtrEpV4SXP/D
	AG87Udp0UorJNjGoyZiOOIbEfFFbFZXwJMphN80gC/PqSg8YdUJsY99HYSTDfvZC2V5USKvuJXm
	agG3gGD5ejhpXETneYBr1D/2wLHG66xvfyyziJMgS5MreB4gfYJY/S9r2puXRvoc=
X-Received: by 2002:a05:6938:a092:10b0:c20:fda7:1856 with SMTP id
 a640c23a62f3a-c20fda718d8mr115594666b.8.1786549254733; Wed, 12 Aug 2026
 08:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260812130655.15109-1-anis.bougrine10@gmail.com> <CADkTA4MeK0aFZ8-TtybH6ZrfOnwfxKJNQmUc3TfF6E_B0BfGQw@mail.gmail.com>
In-Reply-To: <CADkTA4MeK0aFZ8-TtybH6ZrfOnwfxKJNQmUc3TfF6E_B0BfGQw@mail.gmail.com>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Wed, 12 Aug 2026 17:40:43 +0200
X-Gm-Features: AUfX_myHyXDLcPQKm6PXNtR3oyxESTYQzjv8RGBS4y5aI11rExqZnVJQ8mCau2U
Message-ID: <CAGgtUzagdr5jKjXj+kSSi9W5_sCyPGAJRBGGR-TmeAoCC6dcmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add strip process for signed
 kernel modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Content-Type: multipart/alternative; boundary="000000000000b3c1070658db69ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 15:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243294

--000000000000b3c1070658db69ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

You are correct, INSTALL_MOD_STRIP is the only difference between the two
branches.

I initially tried using a variable as you suggested, but had issues with
the variable expansion when passing the strip options to the kernel
Makefile.

Using an environment variable keeps a single oe_runmake call:

    if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
        # If the module will be auto-signed, perform stripping before
signing.
        if [ "$(./source/scripts/config --file ./.config --state
MODULE_SIG)" =3D y ] &&
           [ "$(./source/scripts/config --file ./.config --state
MODULE_SIG_ALL)" =3D y ]; then
            export INSTALL_MOD_STRIP=3D"--strip-debug
--remove-section=3D.comment --remove-section=3D.note --preserve-dates"
        fi
        oe_runmake DEPMOD=3Decho
MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
    fi

If you are okay with this approach, I can send v2.

BR,
Anis

On Wed, Aug 12, 2026 at 3:26=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Wed, Aug 12, 2026 at 9:07=E2=80=AFAM Anis Bougrine via
> lists.openembedded.org
> <anis.bougrine10=3Dgmail.com@lists.openembedded.org> wrote:
> >
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
> > ---
> >  meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index a82bdf7ecb..0d8d370e9d 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -453,7 +453,21 @@ kernel_do_install() {
> >         #
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > -               oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
> > +               # If the module will be auto-signed, perform stripping
> before signing.
> > +               if grep -q '^CONFIG_MODULE_SIG=3Dy$' .config && grep -q
> '^CONFIG_MODULE_SIG_ALL=3Dy$' .config; then
> > +                       oe_runmake \
> > +                               INSTALL_MOD_STRIP=3D"--strip-debug
> --remove-section=3D.comment --remove-section=3D.note --preserve-dates" \
> > +                               DEPMOD=3Decho \
> > +
>  MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
> > +
>  INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware \
> > +                               modules_install
> > +               else
> > +                       oe_runmake \
> > +                               DEPMOD=3Decho \
> > +
>  MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
> > +
>  INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware \
> > +                               modules_install
>
> Am I misreading the patch (it has been known to happen :)) ? is the
> only differnece
> between the two conditions the INSTALL_MOD_STRIP ? if so, why not just us=
e
> a
> variable and put $INSTALL_MOD_STRIP (or whatever) in the oe_runmake line =
?
>
> Better to have the variable be conditional, than duplicating the
> actual call to strip
> the modules.
>
> Bruce
>
> > +               fi
> >                 rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> >                 rm -f
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> >                 # Remove empty module directories to prevent QA issues
> > --
> > 2.50.1 (Apple Git-155)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#243287):
> https://lists.openembedded.org/g/openembedded-core/message/243287
> > Mute This Topic: https://lists.openembedded.org/mt/120717114/1050810
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

--000000000000b3c1070658db69ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bruce,<br><br>You are correct, INSTALL=
_MOD_STRIP is the only difference between the two<br>branches.<br><br>I ini=
tially tried using a variable as you suggested, but had issues with<br>the =
variable expansion when passing the strip options to the kernel<br>Makefile=
.<br><br>Using an environment variable keeps a single oe_runmake call:<br><=
br>=C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39; .config);=
 then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the module will be auto-signed, p=
erform stripping before signing.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;=
$(./source/scripts/config --file ./.config --state MODULE_SIG)&quot; =3D y =
] &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;$(./source=
/scripts/config --file ./.config --state MODULE_SIG_ALL)&quot; =3D y ]; the=
n<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export INSTALL_MOD_STRIP=3D&=
quot;--strip-debug --remove-section=3D.comment --remove-section=3D.note --p=
reserve-dates&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/mod=
ules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmwar=
e modules_install<br>=C2=A0 =C2=A0 fi<br><br>If you are okay with this appr=
oach, I can send v2.<br><br>BR,<br>Anis<div></div></div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Aug 12, 2026 at 3:26=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug 12, 2026 at 9:=
07=E2=80=AFAM Anis Bougrine via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;anis.bougrine10=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently, signed kernel modules skip the stripping process in order<b=
r>
&gt; to preserve the file contents after signing. See commit:<br>
&gt; 4c47e5f171fa2603355e2f9183065ce8137a18c7<br>
&gt;<br>
&gt; However, the kernel install Makefile supports stripping modules before=
<br>
&gt; signing them. This allows signed modules to be stripped while preservi=
ng<br>
&gt; a valid signature.<br>
&gt;<br>
&gt; Make non-signed kernel modules follow the standard Yocto stripping flo=
w,<br>
&gt; while signed kernel modules use the kernel Makefile stripping flow.<br=
>
&gt;<br>
&gt; Fixes [YOCTO #12927]<br>
&gt;<br>
&gt; Reported-by: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">=
ross.burton@arm.com</a><br>
&gt; Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gma=
il.com" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index a82bdf7ecb..0d8d370e9d 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -453,7 +453,21 @@ kernel_do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAG=
S MACHINE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grep -q -i -e &#39;^CONFIG_MODULE=
S=3Dy$&#39; .config); then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEP=
MOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} IN=
STALL_FW_PATH=3D${D}${firmwaredir} modules_install<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If the modul=
e will be auto-signed, perform stripping before signing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &#3=
9;^CONFIG_MODULE_SIG=3Dy$&#39; .config &amp;&amp; grep -q &#39;^CONFIG_MODU=
LE_SIG_ALL=3Dy$&#39; .config; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0oe_runmake \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_MOD_STRIP=3D&quot;--strip=
-debug --remove-section=3D.comment --remove-section=3D.note --preserve-date=
s&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPMOD=3Decho \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MODLIB=3D${D}${nonarch_base_libdi=
r}/modules/${KERNEL_VERSION} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_FW_PATH=3D${D}${nonarch_b=
ase_libdir}/firmware \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules_install<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0oe_runmake \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPMOD=3Decho \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MODLIB=3D${D}${nonarch_base_libdi=
r}/modules/${KERNEL_VERSION} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_FW_PATH=3D${D}${nonarch_b=
ase_libdir}/firmware \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules_install<br>
<br>
Am I misreading the patch (it has been known to happen :)) ? is the<br>
only differnece<br>
between the two conditions the INSTALL_MOD_STRIP ? if so, why not just use =
a<br>
variable and put $INSTALL_MOD_STRIP (or whatever) in the oe_runmake line ?<=
br>
<br>
Better to have the variable be conditional, than duplicating the<br>
actual call to strip<br>
the modules.<br>
<br>
Bruce<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &qu=
ot;${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &qu=
ot;${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove =
empty module directories to prevent QA issues<br>
&gt; --<br>
&gt; 2.50.1 (Apple Git-155)<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#243287): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/243287" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/243287</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/12071711=
4/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/120717114/1050810</a><br>
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
</blockquote></div></div>

--000000000000b3c1070658db69ef--

