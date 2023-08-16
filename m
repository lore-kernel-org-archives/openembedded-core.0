Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A69C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:29:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.154575.1692163775229313091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nX3V2cGZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-64726360433so13755246d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692163774; x=1692768574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q7xSkKSg7Dtg4evH/EIRoHEzx+rcoGH0wqc7v9g6ORI=;
        b=nX3V2cGZM1feF081PJwIhq09t67kjzttoCs8hDq+JQOZ/DWeMHc50yBVBL0QFu+kqX
         u6N5Yu6hFYgt3/a9du+998XXT2OsMSvaEHMFdz4fT5G82aKEr30q6zCCbFDBIuL6Kg+T
         P7AwbhQf7aT9bZ/Wpo8sUuCg+eFCrgUkYgMotyarkPkES3eX1FjI7XLtVdWnVkb+0dvG
         AOhoBa5WO2rFYT039WPw4vPpSuVi8d3osCjxBepP1ihxkw/q3vfTbWhV094M96ekMsQx
         fyVE+KIeMjkXUThUjcp84zB62AGrLTrdCTbXz24zX13W2FspCTxGTFSRB4ZtanR5ea6y
         2DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692163774; x=1692768574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7xSkKSg7Dtg4evH/EIRoHEzx+rcoGH0wqc7v9g6ORI=;
        b=lp2XA6YM4qCbR+UIcxbz/JdqU09BXOyv5uoQsudFJ3TgAAsKMjgZw5+d/6mL3L7wfn
         FnPZbojkneJGnHlRIyq5waP1VxKmKnmjicC6kb1jQNY3m2M38E3Fvc4rLAjk0rZO4E4M
         bv/xN4gNpbMkqpwtLVKmD3N7LUM808fXdO0FUktHN2evs2LzMlz+0FneFHxOzQkcp9or
         m5ct3HEAZOZfwVhIP0y38wLWUNn9tiAx7U5/x5eClqwghMBNfnN6Zrvec0XYb9NnY6de
         28k30U71mxFjN89C/B4GhV6lHXpzusFsErCMtoiAy1yatramWYr/R71cEPwSeCqTatiQ
         4kfQ==
X-Gm-Message-State: AOJu0Yzv14nCZ35qcvRpDsgATqfT7aIZpYOmxsYBte8c8j3h0ZniP83U
	0a7FPaxQsM7knptjR+Bx0GOAJCKDtrP8tTZ0m6M=
X-Google-Smtp-Source: AGHT+IG+zYcMLKSxtcTPZrQV+DpfRDcztxucH9xZ7s9de79wQt/mEBiZZpjnUPuXxQ67f8m9Md5rCGj8QtSaXGBo2QA=
X-Received: by 2002:a0c:f154:0:b0:62d:edb2:b42a with SMTP id
 y20-20020a0cf154000000b0062dedb2b42amr677693qvl.45.1692163774068; Tue, 15 Aug
 2023 22:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692099121.git.frederic.martinsons@gmail.com>
 <fde568774cf2bd9174d1ecb4d9378a362a254f29.1692099121.git.frederic.martinsons@gmail.com>
 <DB5PR02MB10213E9034981C1D4121CD485EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E9034981C1D4121CD485EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 16 Aug 2023 07:29:23 +0200
Message-ID: <CA+cAkeojvNiJYpnr9+LpRwUvFZ8uUR9eLwH8PEa2FX-jTV7pTg@mail.gmail.com>
Subject: Re: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a7bd7d060303947c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 05:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186108

--000000000000a7bd7d060303947c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 16 ao=C3=BBt 2023, 01:11, Peter Kjellerstedt <peter.kjellerstedt@ax=
is.com>
a =C3=A9crit :

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Frederic Martinson=
s
> > Sent: den 15 augusti 2023 17:36
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This class can be used inside rust recipe to generate
> > a rust library that can be called by C/C++ code.
> >
> > The rust recipe which uses this class has to only replace
> > "inherit cargo" by "inherit cargo-c".
>
> Typo: cargo-c -> cargo_c
>
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 meta/classes-recipe/cargo_c.bbclass
> >
> > diff --git a/meta/classes-recipe/cargo_c.bbclass
> b/meta/classes-recipe/cargo_c.bbclass
> > new file mode 100644
> > index 0000000000..c083f69c08
> > --- /dev/null
> > +++ b/meta/classes-recipe/cargo_c.bbclass
> > @@ -0,0 +1,41 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +##
> > +## Purpose:
> > +## This class is used by any recipes that want to compile a C ABI
> compatible
> > +## library with header and pkg config file
> > +
> > +inherit cargo pkgconfig
> > +
> > +# the binaries we will use
> > +CARGO_C_BUILD =3D "cargo-cbuild"
> > +CARGO_C_INSTALL =3D "cargo-cinstall"
> > +
> > +# We need cargo-c to compile for the target
> > +BASEDEPENDS:append =3D " cargo-c-native"
> > +
> > +do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
> > +cargo_c_do_compile() {
> > +    oe_cargo_fix_env
> > +    export RUSTFLAGS=3D"${RUSTFLAGS}"
> > +    bbnote "Using rust targets from ${RUST_TARGET_PATH}"
> > +    bbnote "cargo-cbuild =3D $(which ${CARGO_C_BUILD})"
> > +    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
> > +    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
> > +}
> > +
> > +cargo_c_do_install() {
> > +    oe_cargo_fix_env
> > +    export RUSTFLAGS=3D"${RUSTFLAGS}"
> > +    bbnote "cargo-cinstall =3D $(which ${CARGO_C_INSTALL})"
> > +    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
> > +        --destdir ${D} \
> > +        --prefix /usr \
>
> Shouldn't that be "${prefix}" rather than "/usr"?
>

Yes you're right. I'll send a v4 with that correction and fix the typo you
mentioned. Thanks.

>
> > +        --library-type cdylib
> > +}
> > +
> > +EXPORT_FUNCTIONS do_compile do_install
> > --
> > 2.34.1
>
> //Peter
>

--000000000000a7bd7d060303947c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 16 ao=C3=BBt 2023, 01:11, Peter Kjellerstedt &=
lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.c=
om</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=
 -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</=
a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>=
&gt; On Behalf Of Frederic Martinsons<br>
&gt; Sent: den 15 augusti 2023 17:36<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>=
<br>
&gt; Subject: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass=
<br>
&gt; <br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; <br>
&gt; This class can be used inside rust recipe to generate<br>
&gt; a rust library that can be called by C/C++ code.<br>
&gt; <br>
&gt; The rust recipe which uses this class has to only replace<br>
&gt; &quot;inherit cargo&quot; by &quot;inherit cargo-c&quot;.<br>
<br>
Typo: cargo-c -&gt; cargo_c<br>
<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/classes-recipe/cargo_c.bbclass<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe=
/cargo_c.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c083f69c08<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes-recipe/cargo_c.bbclass<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +##<br>
&gt; +## Purpose:<br>
&gt; +## This class is used by any recipes that want to compile a C ABI com=
patible<br>
&gt; +## library with header and pkg config file<br>
&gt; +<br>
&gt; +inherit cargo pkgconfig<br>
&gt; +<br>
&gt; +# the binaries we will use<br>
&gt; +CARGO_C_BUILD =3D &quot;cargo-cbuild&quot;<br>
&gt; +CARGO_C_INSTALL =3D &quot;cargo-cinstall&quot;<br>
&gt; +<br>
&gt; +# We need cargo-c to compile for the target<br>
&gt; +BASEDEPENDS:append =3D &quot; cargo-c-native&quot;<br>
&gt; +<br>
&gt; +do_compile[progress] =3D &quot;outof:\s+(\d+)/(\d+)&quot;<br>
&gt; +cargo_c_do_compile() {<br>
&gt; +=C2=A0 =C2=A0 oe_cargo_fix_env<br>
&gt; +=C2=A0 =C2=A0 export RUSTFLAGS=3D&quot;${RUSTFLAGS}&quot;<br>
&gt; +=C2=A0 =C2=A0 bbnote &quot;Using rust targets from ${RUST_TARGET_PATH=
}&quot;<br>
&gt; +=C2=A0 =C2=A0 bbnote &quot;cargo-cbuild =3D $(which ${CARGO_C_BUILD})=
&quot;<br>
&gt; +=C2=A0 =C2=A0 bbnote &quot;${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAG=
S}&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;${CARGO_C_BUILD}&quot; cbuild ${CARGO_BUILD_FLAGS=
}<br>
&gt; +}<br>
&gt; +<br>
&gt; +cargo_c_do_install() {<br>
&gt; +=C2=A0 =C2=A0 oe_cargo_fix_env<br>
&gt; +=C2=A0 =C2=A0 export RUSTFLAGS=3D&quot;${RUSTFLAGS}&quot;<br>
&gt; +=C2=A0 =C2=A0 bbnote &quot;cargo-cinstall =3D $(which ${CARGO_C_INSTA=
LL})&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;${CARGO_C_INSTALL}&quot; cinstall ${CARGO_BUILD_F=
LAGS} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --destdir ${D} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix /usr \<br>
<br>
Shouldn&#39;t that be &quot;${prefix}&quot; rather than &quot;/usr&quot;?<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ye=
s you&#39;re right. I&#39;ll send a v4 with that correction and fix the typ=
o you mentioned. Thanks.=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --library-type cdylib<br>
&gt; +}<br>
&gt; +<br>
&gt; +EXPORT_FUNCTIONS do_compile do_install<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
//Peter<br>
</blockquote></div></div></div>

--000000000000a7bd7d060303947c--

