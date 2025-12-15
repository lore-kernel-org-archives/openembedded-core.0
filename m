Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC6D5B172
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:30:44 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47218.1765801835582247372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCdPPlk2;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78c33f74b72so29761927b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765801835; x=1766406635; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjEd1EGUqWzDEtxGIRtIXsuOnL/IR7BC7s8+zoklW0g=;
        b=hCdPPlk2FQB59K4Flz7QlxI5ZXAJ31d6uBLLnqfrEqzVEGkbzbg5VBHHTUltgJXEwO
         pp5S0mcSFJ1d7ADYxedAe4DoQ8azmBcAqCbLaLbh51nbi30TJ31johs9pR3nPvFN948o
         ZkJTImlCmygp7QQyWBw28dY8h1DdThPhsit+DR2vOBHapWQPyiCPYcv1t+d3o6Gs9CC/
         ZE1tFb/xQoZiH0laOI90GN0tl2Rypw+ppMbZ7MWUFpUQ2hBddNtMjyjESNsBFaTrV1U4
         zEDyzsvRyhIWco28/r2/BHkefVEhvOXW/wUQTN/ol/KpIEHH4w3XB225ipE/da2HkFU/
         xYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801835; x=1766406635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjEd1EGUqWzDEtxGIRtIXsuOnL/IR7BC7s8+zoklW0g=;
        b=J4S5GyPuoVSNfQZYZQcPf7nw2l/UIbqk62Qon9pu8Bm7wNFz4D6N+qeLnnj6ataocV
         ELnX3xSrlOcuAVSLiewPQwhv0qK4SgjQKVZmP6nHj/+/YtnQIm4N3DXKbEHI2+scd88W
         B3mayuORHRCjBumQvSPU1SBnYaYNqPgtztAEGUBtHZDj90l8zeKOwVmqb73evqkXbHXa
         N0IULEo9PB/Fkayx/tZkIQ0GxFaCZU/2jErHY787Y3eus8SIhhabcpVoWMghUzX3DFE0
         YnKRYWLGCcBzQ4CRbG08DtbXoKJkO3R6Hjei2TDeAgNX//jHCRfgihlKV/3xFc2EVske
         CMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzvDjt3nMIaF96sSCVx+UFOJ0iaVonZ5l9g4AovQkr1oTlwZEdfXsgw4XtUDCA5+G9QA8wlzHIBX7TAwP1rGSmzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9PFaf+qRdOnxaWixCj9BEIaA4VOgfOThI2wpnFw+6kCt/76Sa
	iIapUe59sUZexTQyCZhh1EPkhCOKUKmA8TL61kTxMZvdnaKxkdMC/ugzb758ZXi8sZnDUhtCRPw
	4yWJI2GBrZ+2h57zKuAP10UocF7rxn7g=
X-Gm-Gg: AY/fxX70ECTwbGsusjNTgIpLoLl3ccNLz68nIIl31letrO34zCFOggIN9om7/DsTh/y
	pVWHoOWT0TXBQpN92BBNAGOODi3BJQ+K9e5tRKEhGzgg2T2N85FhXaee+PzQG71nbtT+wVlH6JE
	Wv1D+9p+bZi03BeIGLuuRet/Ehpo92pgsxW6/+v8DXIAq06YnlOXD/C2tE+C8k2sJIRQPGjK2r4
	fRdigutjY9PdSYYVg5BfKtLDxP39jJUQpL80MApw6yLm1oTEx+YHhBkKRVfJoLcjpBR2agH/yCi
	eUe2fA3iT64ZRyVv3+aINgbENn9sxStuFbGSVTvfQAnmZT/pbYZisCEepbyVfpuTiM4LQeB59Xq
	4L/dr+Rip7TGKUWhpwOpevwle
X-Google-Smtp-Source: AGHT+IHDuQedK0CeKR3PWgnTaoMuwDKCdwx9I1BUUdzKgcQRjh71CzjCf9dJ14ZEPNIJqrwDsC4GajehKlZL32yxS4E=
X-Received: by 2002:a05:690e:169e:b0:641:f5bc:69a0 with SMTP id
 956f58d0204a3-64555664768mr8187464d50.78.1765801834287; Mon, 15 Dec 2025
 04:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20251010075258.2161972-1-hongxu.jia@windriver.com> <9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org>
In-Reply-To: <9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Dec 2025 04:30:23 -0800
X-Gm-Features: AQt7F2oqBPBZA2uwpZOvIQcZ3pk5-HXshWz7IWu8_LHZiQCq1IB0PNGuXRRytPw
Message-ID: <CAMKF1srxgx99MbA++M9gVA90M66eFr_vVQ2be_DZ-xW28AfHgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/5] distro/include: Add debug_build.inc when
 DEBUG_BUILD is enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com, 
	randy.macleod@windriver.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000001397e90645fcc77b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227736

--0000000000001397e90645fcc77b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:00=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org
> wrote:
> > In bitbake.conf, use ??=3D to set *_OPTIMIZATION, add a new include
> > file debug_build.inc to use ?=3D to override *_OPTIMIZATION when
> > DEBUG_BUILD is enabled
> >
> > When DEBUG_BUILD is enabled:
> > - Defer inherit bblcass debug_build, while setting DEBUG_BUILD =3D "1" =
in
> >   local.conf, the debug build is enabled globally. For the recipe (such
> >   as qemu) which doesn't work without optimization, set DEBUG_BUILD =3D=
 "0"
> >   to disable it for a given recipe
> >
> > - Use include_all to allow other layers to add their own debug build
> >   configurations
> >
> > Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  meta/classes-global/base.bbclass         | 3 +++
> >  meta/classes-recipe/debug_build.bbclass  | 8 ++++++++
> >  meta/conf/bitbake.conf                   | 9 +++------
> >  meta/conf/distro/include/debug_build.inc | 5 +++++
> >  meta/conf/documentation.conf             | 2 +-
> >  5 files changed, 20 insertions(+), 7 deletions(-)
> >  create mode 100644 meta/classes-recipe/debug_build.bbclass
> >  create mode 100644 meta/conf/distro/include/debug_build.inc
> >
> > diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> > index 6de17d1bb5..0f4398e26f 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??=3D "${PREFERRED_TOOLCHAIN_NATIVE}=
"
> >  inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
> >  inherit_defer toolchain/${TOOLCHAIN}
> >
> > +DEBUG_BUILD ??=3D "0"
> > +inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)=
}
> > +
> >  def lsb_distro_identifier(d):
> >      adjust =3D d.getVar('LSB_DISTRO_ADJUST')
> >      adjust_func =3D None
> > diff --git a/meta/classes-recipe/debug_build.bbclass
> b/meta/classes-recipe/debug_build.bbclass
> > new file mode 100644
> > index 0000000000..a917e9cbc9
> > --- /dev/null
> > +++ b/meta/classes-recipe/debug_build.bbclass
> > @@ -0,0 +1,8 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# Allow other layers to add their own debug build configurations
> > +include_all conf/distro/include/debug_build.inc
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 5406e542db..52ceb76bbb 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?=3D "\
> >  "
> >  DEBUG_LEVELFLAG ?=3D "-g"
> >
> > -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
> > -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
> > -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> > -SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZAT=
ION
> DEBUG_BUILD"
> > +FULL_OPTIMIZATION ??=3D "-O2 ${DEBUG_LEVELFLAG}"
> > +SELECTED_OPTIMIZATION ??=3D "${FULL_OPTIMIZATION}"
> >  # compiler flags for native/nativesdk
> > -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g',
> '-O2', d)}"
> > -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> > +BUILD_OPTIMIZATION ??=3D "-O2"
> >
> >  ##################################################################
> >  # Reproducibility
> > diff --git a/meta/conf/distro/include/debug_build.inc
> b/meta/conf/distro/include/debug_build.inc
> > new file mode 100644
> > index 0000000000..95e09e64f5
> > --- /dev/null
> > +++ b/meta/conf/distro/include/debug_build.inc
> > @@ -0,0 +1,5 @@
> > +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when
> DEBUG_BUILD is enabled.
> > +DEBUG_OPTIMIZATION ?=3D "-Og ${DEBUG_LEVELFLAG}"
> > +SELECTED_OPTIMIZATION ?=3D "${DEBUG_OPTIMIZATION}"
> > +# compiler flags for native/nativesdk
> > +BUILD_OPTIMIZATION ?=3D "-Og -g"
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.con=
f
> > index 741130a392..2a7418ccb3 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which
> layers to include during cve-c
> >  D[doc] =3D "The destination directory."
> >  DATE[doc] =3D "The date the build was started using YMD format."
> >  DATETIME[doc] =3D "The date and time the build was started."
> > -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging
> information. This influences the value of the SELECTED_OPTIMIZATION
> variable."
> > +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging
> information. This influences the value of the SELECTED_OPTIMIZATION
> variable and includes file conf/distro/include/debug_build.inc"
> >  DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and
> CFLAGS when compiling a system for debugging. This variable defaults to
> '-Og ${DEBUG_LEVELFLAG}'."
> >  DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selectio=
n
> priority."
> >  DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. other
> recipe files)."
>
> Sorry about the delay in getting to this, we had to focus on the
> release. I have been giving this some thought and it is heading the
> right way but I have a couple of ideas.
>
> The problem with DEBUG_BUILD is that we have a lot of debug information
> in builds anyway and this is now unclear what it means. The
> documentation.conf entry mentions packages which is now incorrect too.
> The variable is a very old one and the interface is poorly designed
> compared to other areas now.
>
> Rather than keeping "DEBUG_BUILD" alive, perhaps we drop that and
> simply document the INHERIT instead? I did wonder about making it a
> config fragment instead too instead of a class?
>
> I'm also wondering whether we should remove SELECTED_OPTIMIZATION
> entirely? Certainly DEBUG_OPTIMIZATION and FULL_OPTIMIZATION can be
> dropped. Whether that should be this patch or another, I don't mind.


I think simplifying this would be useful. All these variables have grown
overtime and adding one one will add to this. Perhaps the final value of
optimization settings could be computed from fragments.


>
> Cheers,
>
> Richard
>

--0000000000001397e90645fcc77b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 15, 2025 at 7:00=E2=80=AFAM=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, 2025-10-10 at 15:52 +0800, hongxu via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; In bitbake.conf, use ??=3D to set *_OPTIMIZATION, add a new include<br=
>
&gt; file debug_build.inc to use ?=3D to override *_OPTIMIZATION when<br>
&gt; DEBUG_BUILD is enabled<br>
&gt; <br>
&gt; When DEBUG_BUILD is enabled:<br>
&gt; - Defer inherit bblcass debug_build, while setting DEBUG_BUILD =3D &qu=
ot;1&quot; in<br>
&gt; =C2=A0 local.conf, the debug build is enabled globally. For the recipe=
 (such<br>
&gt; =C2=A0 as qemu) which doesn&#39;t work without optimization, set DEBUG=
_BUILD =3D &quot;0&quot;<br>
&gt; =C2=A0 to disable it for a given recipe<br>
&gt; <br>
&gt; - Use include_all to allow other layers to add their own debug build<b=
r>
&gt; =C2=A0 configurations<br>
&gt; <br>
&gt; Suggested-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.c=
om" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 +++<br>
&gt; =C2=A0meta/classes-recipe/debug_build.bbclass=C2=A0 | 8 ++++++++<br>
&gt; =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++-=
-----<br>
&gt; =C2=A0meta/conf/distro/include/debug_build.inc | 5 +++++<br>
&gt; =C2=A0meta/conf/documentation.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-<br>
&gt; =C2=A05 files changed, 20 insertions(+), 7 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/classes-recipe/debug_build.bbclass<br>
&gt; =C2=A0create mode 100644 meta/conf/distro/include/debug_build.inc<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/ba=
se.bbclass<br>
&gt; index 6de17d1bb5..0f4398e26f 100644<br>
&gt; --- a/meta/classes-global/base.bbclass<br>
&gt; +++ b/meta/classes-global/base.bbclass<br>
&gt; @@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??=3D &quot;${PREFERRED_TOOLCHAIN_N=
ATIVE}&quot;<br>
&gt; =C2=A0inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native<br>
&gt; =C2=A0inherit_defer toolchain/${TOOLCHAIN}<br>
&gt; =C2=A0<br>
&gt; +DEBUG_BUILD ??=3D &quot;0&quot;<br>
&gt; +inherit_defer ${@oe.utils.vartrue(&#39;DEBUG_BUILD&#39;, &#39;debug_b=
uild&#39;, &#39;&#39;, d)}<br>
&gt; +<br>
&gt; =C2=A0def lsb_distro_identifier(d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 adjust =3D d.getVar(&#39;LSB_DISTRO_ADJUST&#3=
9;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 adjust_func =3D None<br>
&gt; diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-re=
cipe/debug_build.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a917e9cbc9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes-recipe/debug_build.bbclass<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +# Allow other layers to add their own debug build configurations<br>
&gt; +include_all conf/distro/include/debug_build.inc<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 5406e542db..52ceb76bbb 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?=3D &quot;\<br>
&gt; =C2=A0&quot;<br>
&gt; =C2=A0DEBUG_LEVELFLAG ?=3D &quot;-g&quot;<br>
&gt; =C2=A0<br>
&gt; -FULL_OPTIMIZATION =3D &quot;-O2 ${DEBUG_LEVELFLAG}&quot;<br>
&gt; -DEBUG_OPTIMIZATION =3D &quot;-Og ${DEBUG_LEVELFLAG}&quot;<br>
&gt; -SELECTED_OPTIMIZATION =3D &quot;${@d.getVar(oe.utils.vartrue(&#39;DEB=
UG_BUILD&#39;, &#39;DEBUG_OPTIMIZATION&#39;, &#39;FULL_OPTIMIZATION&#39;, d=
))}&quot;<br>
&gt; -SELECTED_OPTIMIZATION[vardeps] +=3D &quot;FULL_OPTIMIZATION DEBUG_OPT=
IMIZATION DEBUG_BUILD&quot;<br>
&gt; +FULL_OPTIMIZATION ??=3D &quot;-O2 ${DEBUG_LEVELFLAG}&quot;<br>
&gt; +SELECTED_OPTIMIZATION ??=3D &quot;${FULL_OPTIMIZATION}&quot;<br>
&gt; =C2=A0# compiler flags for native/nativesdk<br>
&gt; -BUILD_OPTIMIZATION =3D &quot;${@oe.utils.vartrue(&#39;DEBUG_BUILD&#39=
;, &#39;-Og -g&#39;, &#39;-O2&#39;, d)}&quot;<br>
&gt; -BUILD_OPTIMIZATION[vardeps] +=3D &quot;DEBUG_BUILD&quot;<br>
&gt; +BUILD_OPTIMIZATION ??=3D &quot;-O2&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0################################################################=
##<br>
&gt; =C2=A0# Reproducibility<br>
&gt; diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/dist=
ro/include/debug_build.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..95e09e64f5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/conf/distro/include/debug_build.inc<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BU=
ILD is enabled.<br>
&gt; +DEBUG_OPTIMIZATION ?=3D &quot;-Og ${DEBUG_LEVELFLAG}&quot;<br>
&gt; +SELECTED_OPTIMIZATION ?=3D &quot;${DEBUG_OPTIMIZATION}&quot;<br>
&gt; +# compiler flags for native/nativesdk<br>
&gt; +BUILD_OPTIMIZATION ?=3D &quot;-Og -g&quot;<br>
&gt; diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.co=
nf<br>
&gt; index 741130a392..2a7418ccb3 100644<br>
&gt; --- a/meta/conf/documentation.conf<br>
&gt; +++ b/meta/conf/documentation.conf<br>
&gt; @@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D &quot;Defines=
 which layers to include during cve-c<br>
&gt; =C2=A0D[doc] =3D &quot;The destination directory.&quot;<br>
&gt; =C2=A0DATE[doc] =3D &quot;The date the build was started using YMD for=
mat.&quot;<br>
&gt; =C2=A0DATETIME[doc] =3D &quot;The date and time the build was started.=
&quot;<br>
&gt; -DEBUG_BUILD[doc] =3D &quot;Specifies to build packages with debugging=
 information. This influences the value of the SELECTED_OPTIMIZATION variab=
le.&quot;<br>
&gt; +DEBUG_BUILD[doc] =3D &quot;Specifies to build packages with debugging=
 information. This influences the value of the SELECTED_OPTIMIZATION variab=
le and includes file conf/distro/include/debug_build.inc&quot;<br>
&gt; =C2=A0DEBUG_OPTIMIZATION[doc] =3D &quot;The options to pass in TARGET_=
CFLAGS and CFLAGS when compiling a system for debugging. This variable defa=
ults to &#39;-Og ${DEBUG_LEVELFLAG}&#39;.&quot;<br>
&gt; =C2=A0DEFAULT_PREFERENCE[doc] =3D &quot;Specifies a weak bias for reci=
pe selection priority.&quot;<br>
&gt; =C2=A0DEPENDS[doc] =3D &quot;Lists a recipe&#39;s build-time dependenc=
ies (i.e. other recipe files).&quot;<br>
<br>
Sorry about the delay in getting to this, we had to focus on the<br>
release. I have been giving this some thought and it is heading the<br>
right way but I have a couple of ideas.<br>
<br>
The problem with DEBUG_BUILD is that we have a lot of debug information<br>
in builds anyway and this is now unclear what it means. The<br>
documentation.conf entry mentions packages which is now incorrect too.<br>
The variable is a very old one and the interface is poorly designed<br>
compared to other areas now.<br>
<br>
Rather than keeping &quot;DEBUG_BUILD&quot; alive, perhaps we drop that and=
<br>
simply document the INHERIT instead? I did wonder about making it a<br>
config fragment instead too instead of a class?<br>
<br>
I&#39;m also wondering whether we should remove SELECTED_OPTIMIZATION<br>
entirely? Certainly DEBUG_OPTIMIZATION and FULL_OPTIMIZATION can be<br>
dropped. Whether that should be this patch or another, I don&#39;t mind.</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think simplifying=
 this would be useful. All these variables have grown overtime and adding o=
ne one will add to this. Perhaps the final value of optimization settings c=
ould be computed from fragments.</div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000001397e90645fcc77b--

