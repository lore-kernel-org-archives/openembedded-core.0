Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.19882.1590350171373942332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 12:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hl/KTrLc;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id g12so14105317wrw.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 12:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SeP1L5vuCAWkyU3YE/WXeOehc1rWZxoDbUAy9D/t00I=;
        b=hl/KTrLcCLJwI79jd2BoC6iLTbeTv83mI6ISKqnKvKoepsAxwK7GxoNBxbVahsnCdy
         EemMQv3q5mB8K6XDjt9o4n98SpZ7r2BaHzr+FTSiHB76Vu6+CE5Ka+7VQBMf2PGWDES0
         xPrYtN7VxBAfXcYFFHPlVbQk2JaJpRtk6sSyTfAzv/KZG5n6ykqaQuu3dUKwLEDgE1xI
         NzDcgS0RVXQx9nOB7vS+EeNYfNxiFhoqb8ymkGzAIedznsZTAkAMMBjlUeoiqySUXsmZ
         d6G+ntM1KeOrc3P/S8YIDsHnsVSTPKkyTkMB7EDnj8/o6Cn5CM97p1fKUdMZN/aKolla
         5fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SeP1L5vuCAWkyU3YE/WXeOehc1rWZxoDbUAy9D/t00I=;
        b=qTSlCOzLMv2ZRKOmrBDuvMKJWEhL88ZSgYrmZWfOou2r965QhYs5ahgWQ7EZuoq0IU
         AhBD4wzGMc1ZVDEdmrNuxCqAiwXYtwy0UWElWqlX6xR0/B/OWu3wklLWu+FhTy4cYFDi
         0kE6PDKrLkRs6YvuOBsoYlDVlrnOOj5c//B7z8q71ZCsK0bt7GsGIAiIIUI1m9pJ4ZeL
         dJVFhImOV/OHlJld7hnhyI89l0fFAEwEadFzvCZW9R7XDgXquTCyaDERC3eo1fuvW0me
         At7oZ+FlqMjPXBm/bRJsjv9PIuZsicoR047qiVr2QW3pd0K7CU3SkHaO4z3UHyDiHHlY
         DlBw==
X-Gm-Message-State: AOAM531GNaGorOwRh9hn5GMcB30XKpksaR0VhvwPgzemr1okV05LJOne
	hA8EGvDtWa2Ds9o+fBPPm2Wt3jDqpkuEpOkEcL0=
X-Google-Smtp-Source: ABdhPJxQTTcWP3xgPAAexzGPpnRtzHvoa5lAxsQhcywIMSkGndz8CfYWHehlM0kxWnFiaRJtg7TbSG4rJi7SpQDHEoU=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr12882472wrp.419.1590350169727;
 Sun, 24 May 2020 12:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200524161751.22577-1-liu.ming50@gmail.com> <AM7PR05MB688123B693168D342F209BB3A8B20@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB688123B693168D342F209BB3A8B20@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Sun, 24 May 2020 21:55:59 +0200
Message-ID: <CALatG=7XzURR0txnvmg59X-RXoAzxDkfLCR+D5wHS6BYgfeUuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: change ${PN} to u-boot when install/deploy u-boot-init-env
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef648005a66a40c9"

--000000000000ef648005a66a40c9
Content-Type: text/plain; charset="UTF-8"

Yes, that is a very good suggestion, will do that in V2.

//Ming Liu

I know of a project which requires building multiple u-boot-versions
> within a single run (secure and not-secure) so this hardcoding esp. of
> the DEPLOY fragments doesn't work there and may lead to completely
> nondeterministic outputs in the DEPLOY dir.
> If you could extract the currently hardcoded file name to a var, which
> then could be overridden for the specific context, the patch could
> really be helpful
>
> On 24.05.20 18:17, Ming Liu wrote:
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > It's really inconvenient to have ${PN} as part of the name of
> > u-boot-init-env, for instance, in BSP layers, it could be u-boot-fslc,
> > u-boot-qoriq, u-boot-toradex, and so on.
> >
> > Considerring there is only one virtual/bootloader for a build, we could
> > replace ${PN} with u-boot to not have to distinguish different names
> > when accessing it.
> >
> > Signed-off-by: Ming Liu <ming.liu@toradex.com>
> > ---
> >   meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
> >   1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> > index 80f828df52..188e5295cf 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -156,10 +156,10 @@ do_install () {
> >                       ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${D}/boot/${UBOOT_BINARY}
> >
> >                       # Install the uboot-initial-env
> > -                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> > -                    ln -sf
> ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
> > -                    ln -sf
> ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/${PN}-initial-env-${type}
> > -                    ln -sf
> ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/${PN}-initial-env
> > +                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> > +                    ln -sf
> u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
> > +                    ln -sf
> u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env-${type}
> > +                    ln -sf
> u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env
> >                   fi
> >               done
> >               unset  j
> > @@ -170,9 +170,9 @@ do_install () {
> >           ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> >
> >           # Install the uboot-initial-env
> > -        install -D -m 644 ${B}/u-boot-initial-env
> ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> > -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR}
> ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
> > -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR}
> ${D}/${sysconfdir}/${PN}-initial-env
> > +        install -D -m 644 ${B}/u-boot-initial-env
> ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> > +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
> > +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env
> >       fi
> >
> >       if [ -n "${UBOOT_ELF}" ]
> > @@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
> >
> >   RPROVIDES_${PN}-env += "u-boot-default-env"
> >   FILES_${PN}-env = " \
> > -    ${sysconfdir}/${PN}-initial-env* \
> > +    ${sysconfdir}/u-boot-initial-env* \
> >       ${sysconfdir}/fw_env.config \
> >   "
> >
> > @@ -269,10 +269,10 @@ do_deploy () {
> >                       ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${UBOOT_BINARY}
> >
> >                       # Deploy the uboot-initial-env
> > -                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> > +                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> >                       cd ${DEPLOYDIR}
> > -                    ln -sf
> ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> ${PN}-initial-env-${MACHINE}-${type}
> > -                    ln -sf
> ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
> > +                    ln -sf
> u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> u-boot-initial-env-${MACHINE}-${type}
> > +                    ln -sf
> u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
> >                   fi
> >               done
> >               unset  j
> > @@ -287,10 +287,10 @@ do_deploy () {
> >           ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> >
> >           # Deploy the uboot-initial-env
> > -        install -D -m 644 ${B}/u-boot-initial-env
> ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> > +        install -D -m 644 ${B}/u-boot-initial-env
> ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> >           cd ${DEPLOYDIR}
> > -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR}
> ${PN}-initial-env-${MACHINE}
> > -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR}
> ${PN}-initial-env
> > +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR}
> u-boot-initial-env-${MACHINE}
> > +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR}
> u-boot-initial-env
> >       fi
> >
> >       if [ -e ${WORKDIR}/fw_env.config ] ; then
> >
> >
> > 
> >
>

--000000000000ef648005a66a40c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div dir=3D"auto">Yes, that is a very good suggestion, =
will do that in V2.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">//Ming Liu</div><div><br></div><div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">I know of a project which requires building multiple u=
-boot-versions <br>
within a single run (secure and not-secure) so this hardcoding esp. of <br=
>
the DEPLOY fragments doesn&#39;t work there and may lead to completely <br=
>
nondeterministic outputs in the DEPLOY dir.<br>
If you could extract the currently hardcoded file name to a var, which <br=
>
then could be overridden for the specific context, the patch could <br>
really be helpful<br>
<br>
On 24.05.20 18:17, Ming Liu wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" target=3D"=
_blank">ming.liu@toradex.com</a>&gt;<br>
&gt; <br>
&gt; It&#39;s really inconvenient to have ${PN} as part of the name of<br>
&gt; u-boot-init-env, for instance, in BSP layers, it could be u-boot-fslc=
,<br>
&gt; u-boot-qoriq, u-boot-toradex, and so on.<br>
&gt; <br>
&gt; Considerring there is only one virtual/bootloader for a build, we cou=
ld<br>
&gt; replace ${PN} with u-boot to not have to distinguish different names<=
br>
&gt; when accessing it.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" t=
arget=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++---=
-----------<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-=
boot/u-boot.inc<br>
&gt; index 80f828df52..188e5295cf 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; @@ -156,10 +156,10 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/$=
{UBOOT_BINARY}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0# Install the uboot-initial-env<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sys=
confdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconf=
dir}/${PN}-initial-env-${MACHINE}-${type}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconf=
dir}/${PN}-initial-env-${type}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconf=
dir}/${PN}-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sys=
confdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${syscon=
fdir}/u-boot-initial-env-${MACHINE}-${type}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${syscon=
fdir}/u-boot-initial-env-${type}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${syscon=
fdir}/u-boot-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 j<b=
r>
&gt; @@ -170,9 +170,9 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_IMAGE} ${D}/bo=
ot/${UBOOT_BINARY}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Install the uboot-initial-e=
nv<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${PN}-initial-env-${MACHINE}-${PV=
}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${PN}-initial-env-${MACHINE}-${PV=
}-${PR} ${D}/${sysconfdir}/${PN}-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${MACHINE}-${P=
V}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${MACHINE}-${P=
V}-${PR} ${D}/${sysconfdir}/u-boot-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_ELF}&quot; ]<br>
&gt; @@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN +=3D &quot;${PN}-env&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RPROVIDES_${PN}-env +=3D &quot;u-boot-default-env&quot;<b=
r>
&gt;=C2=A0 =C2=A0FILES_${PN}-env =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${sysconfdir}/${PN}-initial-env* \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/u-boot-initial-env* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/fw_env.config \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -269,10 +269,10 @@ do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BIN=
ARY}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0# Deploy the uboot-initial-env<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDI=
R}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDI=
R}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0cd ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-=
env-${MACHINE}-${type}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-=
env-${type}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initia=
l-env-${MACHINE}-${type}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initia=
l-env-${type}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 j<b=
r>
&gt; @@ -287,10 +287,10 @@ do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_IMAGE} ${UBOOT=
_BINARY}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Deploy the uboot-initial-en=
v<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${PN}-initial-env-${MACHINE}-${PV=
}-${PR} ${PN}-initial-env-${MACHINE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${PN}-initial-env-${MACHINE}-${PV=
}-${PR} ${PN}-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${MACHINE}-${P=
V}-${PR} u-boot-initial-env-${MACHINE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${MACHINE}-${P=
V}-${PR} u-boot-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/fw_env.config ] ; then<b=
r>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000ef648005a66a40c9--
