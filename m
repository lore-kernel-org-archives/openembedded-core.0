Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43428C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:49:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7249.1788266980575300145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQ2HXgxR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1316429a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788266979; x=1788871779; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ATHALydjOjxzJrL3J5+dRlSRByjAEIwONqEZRoksVIQ=;
        b=IQ2HXgxR6cjdbrPGzszJN7qJPonYLDET+ILKk103/2YG/UB+wrECoUuLx51JmdxnsQ
         xl5jWiT0UdbrGfWb7XoHaWxjqMUdZO4BFfdT8BHrtI76ZHyA4s9FYveFSzlPiemChSBR
         DhJUF25YtkDySKkRzcDwmHqdLuWK7D6PuE0lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266979; x=1788871779;
        h=mime-version:user-agent:content-type:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ATHALydjOjxzJrL3J5+dRlSRByjAEIwONqEZRoksVIQ=;
        b=LbSy4u/htaIK5OKNWAU/g864p4fIT5gXEnh8cyI1iNB2+/CiOeN8/GSQr5pzHipwDM
         guGGPU55qwb07RTNLo3A7xprnq5g+YjJ3Dg8Ul86lwr4JrCbI7ar6V7ikjY4WHmwCFoM
         yzV0fS3cqM1PMFnzewo9Mt4p6XOfgTKvi29IhUe12IKrBp/dq08AQVB1xqKUSkFUY6zO
         ykQuMDhq2TVU1Q5tliyQQshBHxfWrYvRtb5JXpGmw+uYYf/mA1p2wvvB6ugCpB9Tdtad
         v9h4xKRT8i2Ls/e17NdwGkaTJIjuG5tcdW8KQAv9Hidsap+h8BpeLrmgCLUgMq/OgVLO
         Xxwg==
X-Gm-Message-State: AFuF++n+8nMedWMJAMY3/xosGEGJ3IMZDKeUwy7eKnpo+ZBsss8MBoMH
	5APG4bTjiLIr8EuDzDjMEfWT/8ddzRCjJnL1S9fuk5v4G//tbCNEYufUz+KCsxwkziA=
X-Gm-Gg: AYBFou1hz4l5uAI02hGsy1a9zIY9vetGHUYdbvo/YO2OoovYC7szojpbX7CpyaJ6hrr
	tsVg/1CyPyYKckCT4nItp2RuXpXILQJldRsahCBdN18JsagHBEi9fpeMXx83DMTb4qo3N7s3QQs
	pWa8nBs/PN+byCtRDaVsMFy7npSBBQE8JbAnXjJ/tWVTcG/+VS4quziwMgL+kZ5d4KjMDy/NEuf
	5XRcuUNSnc2KB8dmpE1t6PYJettJtOUyJ1nn2yaZd2ss3bgJ2Mvz06KsRv+KkkMTyRrfXi15ckE
	p9wWZEuG2tEiYwAKJIaGNil/YWCw3Nh/Xv7liq8kDD9kAJ+jEkwSvwpx6wFUnZWN7pwl6/rZS94
	vj3kFcfFnLAkGa6XV4vuWMrM2m1s/UUR06HbqHbDxoBqCX3WRPEKTDa6cbWtUbHv5Ze8E2E8Tpt
	lYW+mM6NkiYd5SrbmQGHstdT/p5sw3Bz5s1B2xQQXoz1QKge700JKvnZf4QaZwQQ1HULS8WD6d2
	Qf06L5Wp+I8px/CWn67vFWNFxGDP+1nxCbJoq/LHQnB/0w/gs5OWg==
X-Received: by 2002:a17:907:ea91:b0:c16:6a42:c7d6 with SMTP id a640c23a62f3a-c2556fe5799mr2275711766b.9.1788266978499;
        Tue, 01 Sep 2026 05:49:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727? ([2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2822esm560370566b.17.2026.09.01.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:49:37 -0700 (PDT)
Message-ID: <3f3556469c9a41d77019782ab9f119e0fc5eeb39.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/11] clang/llvm: Upgrade to 23.1.0 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com, "raj.khem@gmail.com" <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	 <Randy.MacLeod@windriver.com>, "Kokkonda, Sundeep"
	 <Sundeep.Kokkonda@windriver.com>, "deepesh.vatharaj@windriver.com"
	 <deepesh.vatharaj@windriver.com>
Date: Tue, 01 Sep 2026 13:49:36 +0100
In-Reply-To: <732e75fb-f629-42d5-976b-ba4b0bdfa177@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
	 <20260830125853.1139807-2-sunilkumar.dora@windriver.com>
	 <CAMKF1spyZRNJjCNYg0UgqhVkoeRs5MBfBVfhqKdmFpcmBtgK9Q@mail.gmail.com>
	 <732e75fb-f629-42d5-976b-ba4b0bdfa177@windriver.com>
Content-Type: multipart/alternative; boundary="=-QdejcF1w29FQSfczYwFb"
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244826

--=-QdejcF1w29FQSfczYwFb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-01 at 03:37 +0000, Dora, Sunil Kumar via
lists.openembedded.org wrote:
>=20
> On 8/31/2026 1:22 AM, Khem Raj via lists.openembedded.org wrote:
> >=20
> > On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com>
> > wrote:
> > > -@@ -762,6 +762,7 @@ static Triple::EnvironmentType
> > > parseEnvironment(StringRef EnvironmentName) {
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("eabihf", Triple::EABIHF)
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("eabi", Triple::EABI)
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("gnuabin32", Triple::GNUABIN3=
2)
> > > -+=C2=A0 =C2=A0 =C2=A0 .StartsWith("gnun32", Triple::GNUABIN32)
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("gnuabi64", Triple::GNUABI64)
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("gnueabihft64", Triple::GNUEA=
BIHFT64)
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0.StartsWith("gnueabihf", Triple::GNUEABIH=
F)
> > > -@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &&Str) :
> > > Data(std::move(Str)) {
> > > +@@ -755,6 +755,7 @@ static Triple::OSType parseOS(StringRef
> > > OSName) {
> > > +=20
> > > + static Triple::EnvironmentType parseEnvironment(StringRef
> > > EnvironmentName) {
> > > +=C2=A0 =C2=A0return StringSwitch<Triple::EnvironmentType>(Environmen=
tName)
> > > ++=C2=A0 =C2=A0 =C2=A0 .StartsWith("gnuabin32", Triple::GNUABIN32)
> > > + #define TRIPLE_ENV(Enum, Name) .StartsWith(Name, Triple::Enum)
> > > + #include "llvm/TargetParser/TripleName.def"
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0.Default(Triple::UnknownEnvironment);
> > > +@@ -1106,6 +1107,7 @@ Triple::Triple(std::string &&Str) :
> > > Data(std::move(Str)) {
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Environment =3D
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 StringSwitch<Triple::Enviro=
nmentType>(Components[0])
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .StartsWith("=
mipsn32", Triple::GNUABIN32)
> > >=20
> >=20
> > =C2=A0 =C2=A0.def already has an alias mechanism (TRIPLE_VENDOR_ALIAS a=
ppears
> > in the vendor rework) =E2=80=94 ifTRIPLE_ENV_ALIAS exists too, using it=
 for
> > gnuabin32 would keep the compat spelling in the table itself
> > instead of hand-editingparseEnvironment, which will rebase more
> > cleanly next=C2=A0 =C2=A0
>=20
> TRIPLE_ENV_ALIAS doesn't exist yet, I checked 23.1.0 and current
> main. Only the OS and vendor sections have alias macros.
>=20
> Since Triple.cpp is the only file that includes TripleName.def, the
> patch can add the macro itself the same way the other two sections
> do. I tried it here, the alias line sits in the table next to gnun32
> and one extra #define in parseEnvironment replaces the hand edit.
> The stack applies clean and llvm builds fine with it.
>=20
> Is this what you had in mind? I can fold it into v2. We could also
> send TRIPLE_ENV_ALIAS to llvm as a small NFC patch, then this
> carries just two table lines going forward.

Can you both please trim quoted replies!

I tend to ignore it but trying to find this detail in hundreds of lines
was painful.

Cheers,

Richard

--=-QdejcF1w29FQSfczYwFb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>

<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>On Tue, 2026-09-01 at 03:37 +0000, Dora, Sunil Kumar via lists.o=
penembedded.org wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
<div class=3D"moz-cite-prefix">On 8/31/2026 1:22 AM, Khem Raj via lists.ope=
nembedded.org wrote:</div><blockquote type=3D"cite" cite=3D"mid:CAMKF1spyZR=
NJjCNYg0UgqhVkoeRs5MBfBVfhqKdmFpcmBtgK9Q@mail.gmail.com" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><div dir=3D"=
ltr"><div class=3D"gmail_quote gmail_quote_container">
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30, 2026 at 5:59=E2=80=AF=
AM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" moz-do-not-send=3D"=
true" class=3D"moz-txt-link-freetext">sunilkumar.dora@windriver.com</a>&gt;=
 wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><div>-@@ -762,6 +762,7 @@ stati=
c Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {</di=
v><div>-&nbsp; &nbsp; &nbsp; &nbsp;.StartsWith("eabihf", Triple::EABIHF)<br=
>-&nbsp; &nbsp; &nbsp; &nbsp;.StartsWith("eabi", Triple::EABI)<br>-&nbsp; &=
nbsp; &nbsp; &nbsp;.StartsWith("gnuabin32", Triple::GNUABIN32)<br>-+&nbsp; =
&nbsp; &nbsp; .StartsWith("gnun32", Triple::GNUABIN32)<br>-&nbsp; &nbsp; &n=
bsp; &nbsp;.StartsWith("gnuabi64", Triple::GNUABI64)<br>-&nbsp; &nbsp; &nbs=
p; &nbsp;.StartsWith("gnueabihft64", Triple::GNUEABIHFT64)<br>-&nbsp; &nbsp=
; &nbsp; &nbsp;.StartsWith("gnueabihf", Triple::GNUEABIHF)<br>-@@ -1087,6 +=
1088,7 @@ Triple::Triple(std::string &amp;&amp;Str) : Data(std::move(Str)) =
{<br>+@@ -755,6 +755,7 @@ static Triple::OSType parseOS(StringRef OSName) {=
<br>+ <br>+ static Triple::EnvironmentType parseEnvironment(StringRef Envir=
onmentName) {<br>+&nbsp; &nbsp;return StringSwitch&lt;Triple::EnvironmentTy=
pe&gt;(EnvironmentName)<br>++&nbsp; &nbsp; &nbsp; .StartsWith("gnuabin32", =
Triple::GNUABIN32)<br>+ #define TRIPLE_ENV(Enum, Name) .StartsWith(Name, Tr=
iple::Enum)<br>+ #include "llvm/TargetParser/TripleName.def"<br>+&nbsp; &nb=
sp; &nbsp; &nbsp;.Default(Triple::UnknownEnvironment);<br>+@@ -1106,6 +1107=
,7 @@ Triple::Triple(std::string &amp;&amp;Str) : Data(std::move(Str)) {<br=
>&nbsp; &nbsp; &nbsp; &nbsp; Environment =3D<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; StringSwitch&lt;Triple::EnvironmentType&gt;(Components[0])<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .StartsWith("mips=
n32", Triple::GNUABIN32)<br></div><br></blockquote><div><br></div><div>&nbs=
p; &nbsp;.def already has an alias mechanism (<code>TRIPLE_VENDOR_ALIAS</co=
de> appears in the vendor rework) =E2=80=94 if<code>TRIPLE_ENV_ALIAS</code>=
 exists too, using it for <code>gnuabin32</code> would keep the compat spel=
ling in the table itself instead of hand-editing<code>parseEnvironment</cod=
e>, which will rebase more cleanly next&nbsp; &nbsp;</div></div></div></div=
></blockquote><div><br>TRIPLE_ENV_ALIAS doesn't exist yet, I checked 23.1.0=
 and current main. Only the OS and vendor sections have alias macros.<br></=
div><div><br>Since Triple.cpp is the only file that includes TripleName.def=
, the patch can add the macro itself the same way the other two sections<br=
>do. I tried it here, the alias line sits in the table next to gnun32 and o=
ne extra #define in parseEnvironment replaces the hand edit.<br>The stack a=
pplies clean and llvm builds fine with it.<br></div><div><br>Is this what y=
ou had in mind? I can fold it into v2. We could also send TRIPLE_ENV_ALIAS =
to llvm as a small NFC patch, then this<br>carries just two table lines goi=
ng forward.<br></div></blockquote><div><br></div><div>Can you both please t=
rim quoted replies!</div><div><br></div><div>I tend to ignore it but trying=
 to find this detail in hundreds of lines was painful.</div><div><br></div>=
<div>Cheers,</div><div><br></div><div>Richard</div><div><span></span></div>=
</body></html>

--=-QdejcF1w29FQSfczYwFb--

