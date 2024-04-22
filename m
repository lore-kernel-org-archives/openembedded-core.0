Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA0FC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 15:38:28 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.434.1713800306822038858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 08:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfDtM3lo;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-23333ef4a02so2687402fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713800306; x=1714405106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2vFI62f0ysDzWFqLE2xq8HVnBhin+VfWoB6cFUgSsU0=;
        b=DfDtM3loMguK6Uz2g3IrOGavmo/KKWfvspsDSDUcpA0ioWJNs3sU4CnCEmlmNHZzfM
         zrRNJCTUfG2AMqzRwY6V3hL5nmqWLNSXDkWZh+mH05vPQLtE3tAUSYPENqOr9kpJ4Sg3
         xWItQLzg4y2UHsSjW3yKfzI1xYh0pirupdWB4sCbRug62Ok73D/rwuRFCmUOu/Dcol8a
         AO8VLBim3s4ZvZXaFA15Dqq8UrIywFDFo4badJ/GMIRrSpmDdWPzL0pdMOL918W1DPe5
         2DMc8YkDman6a+VXxmpLW+TXsFr6p2ByVAVeeudQZOHY4ACV4t+Tv924wkjCQtrOzc6z
         NrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713800306; x=1714405106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vFI62f0ysDzWFqLE2xq8HVnBhin+VfWoB6cFUgSsU0=;
        b=d/7F7qBzkgz0MZEKOON4NJMdoqXXJkmG2s+gXJrPEgorKGUdg4IMHdvodQQSw3YEG+
         nNSDXqLzF7xKoAuUhb3yxz0ENqM9NSGDDSodMmkYTLHaSM9/GFBlbnICmXDR4J4hjlRT
         UanMgyg27bTTu6H+nIXa51T71J3LTcySuSIH0ZscU0IT1OGDV6DE+oTNvsyImHqGV7Da
         sviSLee40WmRy93rWVgQqJmnE0IAvx8A+ilDBYo0YxZtMvNXzvlWWgdHcMg+HbCtZ7Di
         LQLPSKGgDPsR9whOt9Gr1Xgdmz8r9pmE6vcVqyH2+GYR/OoGs8OMptr8r1AmEKt1AdGU
         wb5A==
X-Forwarded-Encrypted: i=1; AJvYcCUFOTEAvTzmAnQOvwBG23N0DW3xLBtNwscYSqctn/PnUGqrhuFNX7MX/0wKjzICOjyjyvACct4VkTVSpHQkAVCktomijBVSLOBGgmDTto0bKVRja7LOeJES
X-Gm-Message-State: AOJu0Yxbe2sQX8Pla+VS2AtvoFrKLtRCOlvXZoBFma4dl6YFU6fsgfhD
	BOBW6b0BqEiWnxnufbDVM/3M1Cio2hguUNHL+k82Jymreapt0zuoRxDQ2Hi0pH8bZ5KdcgDAJMg
	tOoY6Blaq3Y2Hhdcz4Z6hc68QbuU=
X-Google-Smtp-Source: AGHT+IEOe1dWPbpz/OUFiNZBP3VVeIr0giQnZP+5aVybPTEx2iDl+pW/cgV1g5DJiRmfu3SWNqBCC1Ln21uGU9n3EB8=
X-Received: by 2002:a05:6871:3b2b:b0:239:7ad8:8653 with SMTP id
 pw43-20020a0568713b2b00b002397ad88653mr8319864oac.30.1713800305875; Mon, 22
 Apr 2024 08:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240419175309.214181-1-jose.quaresma@foundries.io>
 <CAMKF1sqndbA_ahF0uG=TTe14f0B9woY0HCDCsGPhxYWnYoE0rQ@mail.gmail.com>
 <CANPvuRkp_h_VcUs2CvBJHkK-z6ag6d_Fq8aoKOcZD4dGGLEnEA@mail.gmail.com>
 <CAMKF1sovfs=zK7tz+u8DuK9zijswcyR0Nkx3PnHpRFUN=5yE1A@mail.gmail.com> <CANPvuRnfz3-r-6BY0PuLZA0P-c=6a=ZXrQXLqjWh2aGCp_Sv0g@mail.gmail.com>
In-Reply-To: <CANPvuRnfz3-r-6BY0PuLZA0P-c=6a=ZXrQXLqjWh2aGCp_Sv0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Apr 2024 17:38:13 +0200
Message-ID: <CAMKF1spT7DODw43TQkP3zF+7C+deJtty9NM9Q+_V+jNMKMrVLQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] go: Drop the linkmode completely
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072a5510616b13ad3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 15:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198596

--00000000000072a5510616b13ad3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 1:47=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com>
wrote:

>
>
> Khem Raj <raj.khem@gmail.com> escreveu (sexta, 19/04/2024 =C3=A0(s) 21:43=
):
>
>>
>>
>> On Fri, Apr 19, 2024 at 11:28=E2=80=AFAM Jose Quaresma <quaresma.jose@gm=
ail.com>
>> wrote:
>>
>>>
>>>
>>> Khem Raj <raj.khem@gmail.com> escreveu (sexta, 19/04/2024 =C3=A0(s) 19:=
17):
>>>
>>>> On Fri, Apr 19, 2024 at 10:53=E2=80=AFAM Jose Quaresma via
>>>> lists.openembedded.org
>>>> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>>>> >
>>>> > This will make possible to restore the default dynamic linking
>>>> globally
>>>> > which is what we had before the 1.20.X release.
>>>> >
>>>>
>>>> Looks good overall. how do we support the static linking if user wante=
d
>>>> ?
>>>>
>>>
>>> To disable the dynamic linking, which is the default, we need to unset
>>> the GO_DYNLINK
>>> but this needs to be done with a machine arch override otherwise has no
>>> effect.
>>>
>>> GO_DYNLINK:machine_arch =3D ""
>>>
>>> As an example the below patch enables the static linkiging for all the
>>> architectures
>>>
>>> https://git.yoctoproject.org/poky/commit/meta/classes-recipe/goarch.bbc=
lass?id=3Dfd2e5e0b89d9c69acc9f813f07cd052630596ad5
>>>
>>>
>>
>> I wonder if it makes sense to have a variable for doing static linking
>> now that dynamic linking is default anyway and remove it
>>
>
> To do this, we would have to remove all the logic based on the GO_DYNLINK=
 and
> add this new variable to the static linking.
>
> Just to clarify, the default upstream golang linking is the static way bu=
t
> in OE we prefer the dynamic linking maybe because
> the binary size but I did some tests and surprisingly the result can even
> be better in terms of binary size when we link statically
> as can be see on this https://github.com/foundriesio/lmp-manifest/pull/42=
5
>

Yeah that=E2=80=99s ok for build time sizes but I wonder how does it do at =
runtime
since this will use go runtime as dynamic libs


> This toolchain is also a bit particular in the sense that the go-runtime
> conditions all other packages afterwards.
> For example, by having a static go-runtime we are conditioning everything
> to be linked in the same way,
> the opposite is no longer true and we can have the go-runtime dynamically
> but then have packages linked statically.
> The reason is because the /usr/lib/go/pkg/linux_amd64_dynlink/libstd.so
> only exists when the go-runtime is dynamically linked.
>
>
> Jose
>
>
>>
>>
>>> Jose
>>>
>>>
>>>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>>>> > ---
>>>> >  meta/classes-recipe/go.bbclass          | 2 --
>>>> >  meta/recipes-devtools/go/go-runtime.inc | 2 +-
>>>> >  2 files changed, 1 insertion(+), 3 deletions(-)
>>>> >
>>>> > diff --git a/meta/classes-recipe/go.bbclass
>>>> b/meta/classes-recipe/go.bbclass
>>>> > index cc3564c36a..d32509aa6d 100644
>>>> > --- a/meta/classes-recipe/go.bbclass
>>>> > +++ b/meta/classes-recipe/go.bbclass
>>>> > @@ -48,8 +48,6 @@ GO_RPATH:class-native =3D "${@'-r
>>>> ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
>>>> >  GO_RPATH_LINK:class-native =3D
>>>> "${@'-Wl,-rpath-link=3D${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPL=
E}_dynlink'
>>>> if d.getVar('GO_DYNLINK') else ''}"
>>>> >  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
>>>> ${GO_RPATH_LINK} ${LDFLAGS}"
>>>> >  GO_LINKMODE ?=3D ""
>>>> > -GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
>>>> > -GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
>>>> >  GO_EXTRA_LDFLAGS ?=3D ""
>>>> >  GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>>>> >  # Use system loader. If uninative is used, the uninative loader wil=
l
>>>> be patched automatically
>>>> > diff --git a/meta/recipes-devtools/go/go-runtime.inc
>>>> b/meta/recipes-devtools/go/go-runtime.inc
>>>> > index 3f1e795dd9..413cf6d33f 100644
>>>> > --- a/meta/recipes-devtools/go/go-runtime.inc
>>>> > +++ b/meta/recipes-devtools/go/go-runtime.inc
>>>> > @@ -15,7 +15,7 @@ export CGO_LDFLAGS =3D "${@ ' '.join(filter(lambda=
 f:
>>>> not f.startswith('-fdebug-pr
>>>> >  export GOCACHE =3D "${B}/.cache"
>>>> >
>>>> >  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
>>>> > -GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"--linkmode=3Dexternal -extldflag=
s
>>>> '${GO_EXTLDFLAGS}'"'
>>>> > +GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"-extldflags '${GO_EXTLDFLAGS}'"'
>>>> >
>>>> >  do_configure() {
>>>> >         :
>>>> > --
>>>> > 2.44.0
>>>> >
>>>> >
>>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> > Links: You receive all messages sent to this group.
>>>> > View/Reply Online (#198558):
>>>> https://lists.openembedded.org/g/openembedded-core/message/198558
>>>> > Mute This Topic: https://lists.openembedded.org/mt/105623011/1997914
>>>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
>>>> [raj.khem@gmail.com]
>>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> >
>>>>
>>>
>>>
>>> --
>>> Best regards,
>>>
>>> Jos=C3=A9 Quaresma
>>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--00000000000072a5510616b13ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Apr 22, 2024 at 1:47=E2=80=AFPM Jose Qua=
resma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt; escreveu (sexta, 19/04/2024 =C3=A0=
(s) 21:43):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Apr 19, 2024 at 11:28=E2=80=AFAM Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; escreveu (sex=
ta, 19/04/2024 =C3=A0(s) 19:17):<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, Apr 19, 2024 at 10:53=E2=80=AFAM Jose Quaresma via=
<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This will make possible to restore the default dynamic linking globall=
y<br>
&gt; which is what we had before the 1.20.X release.<br>
&gt;<br>
<br>
Looks good overall. how do we support the static linking if user wanted ?<b=
r></blockquote><div>=C2=A0</div><div>To disable the dynamic linking, which =
is the default, we need to unset the=C2=A0<span style=3D"color:rgb(0,0,0)">=
GO_DYNLINK<br>but this needs to be done with a machine arch override otherw=
ise=C2=A0</span>has no effect.<span style=3D"color:rgb(0,0,0)"><br><br></sp=
an></div><div><span style=3D"color:rgb(0,0,0)">GO_DYNLINK:machine_arch =3D =
&quot;&quot;<br></span><br>As an example=C2=A0the below=C2=A0patch enables =
the static linkiging for all the architectures=C2=A0<br><a href=3D"https://=
git.yoctoproject.org/poky/commit/meta/classes-recipe/goarch.bbclass?id=3Dfd=
2e5e0b89d9c69acc9f813f07cd052630596ad5" target=3D"_blank">https://git.yocto=
project.org/poky/commit/meta/classes-recipe/goarch.bbclass?id=3Dfd2e5e0b89d=
9c69acc9f813f07cd052630596ad5</a><br></div><div>=C2=A0</div></div></div></b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if it make=
s sense to have a variable for doing static linking now that dynamic linkin=
g is default anyway and remove it=C2=A0</div></div></div></blockquote><div>=
<br></div>To do this, we would have to remove all the logic based on the=C2=
=A0<span style=3D"color:rgb(0,0,0)">GO_DYNLINK</span>=C2=A0and add this new=
 variable to the static linking.</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Just to clarify, the default upstream golang lin=
king is the static way but in OE we prefer the dynamic linking maybe becaus=
e</div><div class=3D"gmail_quote">the binary size=C2=A0but I did some tests=
 and surprisingly the result can even be better in terms of binary size whe=
n we link statically<br></div><div class=3D"gmail_quote">as can be see on t=
his <a href=3D"https://github.com/foundriesio/lmp-manifest/pull/425" target=
=3D"_blank">https://github.com/foundriesio/lmp-manifest/pull/425</a></div><=
div class=3D"gmail_quote"></div></div></blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yeah that=E2=80=99s ok for build time sizes but I won=
der how does it do at runtime since this will use go runtime as dynamic lib=
s=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><br>This toolchain is also a bit p=
articular in the sense that the go-runtime conditions all other packages af=
terwards.<br><div>For example, by having a static go-runtime we are conditi=
oning everything to be linked in the same way,</div><div>the opposite is no=
 longer true and we can have the go-runtime dynamically but then have packa=
ges linked statically.</div><div>The reason is because the /usr/lib/go/pkg/=
linux_amd64_dynlink/libstd.so only exists when the go-runtime is dynamicall=
y linked.</div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
><br></div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"auto"><br>Jose</div></di=
v></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 2 --<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-runtime.inc | 2 +-<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.b=
bclass<br>
&gt; index cc3564c36a..d32509aa6d 100644<br>
&gt; --- a/meta/classes-recipe/go.bbclass<br>
&gt; +++ b/meta/classes-recipe/go.bbclass<br>
&gt; @@ -48,8 +48,6 @@ GO_RPATH:class-native =3D &quot;${@&#39;-r ${STAGING=
_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE<br>
&gt;=C2=A0 GO_RPATH_LINK:class-native =3D &quot;${@&#39;-Wl,-rpath-link=3D$=
{STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink&#39; if d.getVar(&=
#39;GO_DYNLINK&#39;) else &#39;&#39;}&quot;<br>
&gt;=C2=A0 GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${G=
O_RPATH_LINK} ${LDFLAGS}&quot;<br>
&gt;=C2=A0 GO_LINKMODE ?=3D &quot;&quot;<br>
&gt; -GO_LINKMODE:class-nativesdk =3D &quot;--linkmode=3Dexternal&quot;<br>
&gt; -GO_LINKMODE:class-native =3D &quot;--linkmode=3Dexternal&quot;<br>
&gt;=C2=A0 GO_EXTRA_LDFLAGS ?=3D &quot;&quot;<br>
&gt;=C2=A0 GO_LINUXLOADER ?=3D &quot;-I ${@get_linuxloader(d)}&quot;<br>
&gt;=C2=A0 # Use system loader. If uninative is used, the uninative loader =
will be patched automatically<br>
&gt; diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-de=
vtools/go/go-runtime.inc<br>
&gt; index 3f1e795dd9..413cf6d33f 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; @@ -15,7 +15,7 @@ export CGO_LDFLAGS =3D &quot;${@ &#39; &#39;.join(fi=
lter(lambda f: not f.startswith(&#39;-fdebug-pr<br>
&gt;=C2=A0 export GOCACHE =3D &quot;${B}/.cache&quot;<br>
&gt;<br>
&gt;=C2=A0 GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${L=
DFLAGS}&quot;<br>
&gt; -GO_SHLIB_LDFLAGS ?=3D &#39;-ldflags=3D&quot;--linkmode=3Dexternal -ex=
tldflags &#39;${GO_EXTLDFLAGS}&#39;&quot;&#39;<br>
&gt; +GO_SHLIB_LDFLAGS ?=3D &#39;-ldflags=3D&quot;-extldflags &#39;${GO_EXT=
LDFLAGS}&#39;&quot;&#39;<br>
&gt;<br>
&gt;=C2=A0 do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; --<br>
&gt; 2.44.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#198558): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/198558" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/198558</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10562301=
1/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105623011/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</blockquote></div></div>

--00000000000072a5510616b13ad3--

