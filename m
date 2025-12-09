Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BA5D3B993
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:54 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16659.1765309246899630785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SM1xW/v5;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-640d790d444so5152263d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 11:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765309246; x=1765914046; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CmzotCcwnhMLH6ZLEBzwwdSxfaiHttZwLXMgM2KLUds=;
        b=SM1xW/v5DEDubZetG0RQEzP4IyNBZ6mgnru8heKklXSbsEUP2/4kwTrIX1HDVTGYxb
         691QL9PfDS15G6Avc6UHRGsmYbrODlKg9nk9tMD5ESbRI/Pea4zkSuIXB8rxqU2YQLiy
         C72umNZp2k7urB8xvVF6yyoDydqf+TnEqQZq4ZmuT3AOopyyiR/7Nw/wH71gBKm4p2rR
         FcXBfKk0VNHdeN20PFP2gF8tKp5Lsg6jm3xNkD3fG02l0igtWIGqqcJpVBjSPOLRZYDx
         VG1HAF35pEgWTRQjeJ5OHwS2FgV4J+X6HQZrw6MBPy82ZxMDhXL+rMD2X7rR7jYEuMHt
         tWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309246; x=1765914046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmzotCcwnhMLH6ZLEBzwwdSxfaiHttZwLXMgM2KLUds=;
        b=CwRMsUERK/E0fsZUe7/6ayA07ZmYmb/oXYcBSVqjfZFRGnzEZpilQb0NywrlSfXRaY
         Jwi/EZ8bsqvD2EeSTDEpnNGxg1Ojmg8+w7Ls2p1sXJu5ReX09r6+NhDos22aI+XNJEo0
         hJfPGK/psBBaT0uVtwzB8omrq5UL7/h0XDAc4VzFbpRYpdphS0biidv8kvgTs5TObYpm
         +gEIdVTrSiaKuaXSR5/S+EXrsgZdOCMdwf0vXDNZlhTjgkr6YMCLzRusSS+0/Jq4+eG8
         2LUA8gxd+vOUdbd22ADP/c9DeHlLnsK7uWD/zItE7SE1HI2+xANu5eFVd1ElRTgixdqI
         KVig==
X-Forwarded-Encrypted: i=1; AJvYcCUML86el61SH+0NRrRfsyxMVjRqqBecMHFU9l8WxrTuT9qshAUu0tdGU0Vq0fmffzMms4BBf9QjKAhUbmg4tHNo6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDelsX3DWHouQXW1STLUuDo7SebWq0+jR15QTvbOYQwaYTs5ND
	Rwb6e3uKhLPV9WKzXEn7nutOcoAxTfp7ndkfTBGssa3NG8y77m9AhHpilB/EIVSNtRzw2qute8k
	gcA8w2uyaohgioin/zrkFIhUpzN7Gxgw=
X-Gm-Gg: AY/fxX4Xvi2B4WEgOq9GPx75HzddeB/3ZQPbK6p+CGDNEQVupVDK+uT4bfZNFPvRitQ
	ukOpo6vv/tzAMChFE9fumVK9INmren/AiQKuIPf9Puj+IMM5FqgYfpYpo57U01GywTnJqD1viBn
	EAUw+W7VX4FZbOI3iHyPfE6O3mzq/L1vtWirBmtzUTwYocEv3i+bJUHUk2BL+BKSykKB/oUkyL5
	3FWZ7y3RoMkvgg3DtG80bNiK6swJAsAShApDGBlO5xqhC1XKKSfw0lU+k6juvCb8/3yCDd+Bo6x
	aRmoZUtjURbEga/DAt+mK4QPKx/1hbsnzROC1rpzVZOcx8hXh467zPaeV/85cJ15kx/HwAqmpcc
	8Ens3S8GvwKOQimXUMOeF9fWBZPh9c7C7Mw/RwK4mhi+KTFqeg40=
X-Google-Smtp-Source: AGHT+IEeBJMqjegTF86vqwgoIA0JALj0dS33x8Yng7kwDMtOiJnIEEsLf5d6eY6An0thYZ9Gd7Z0WO19YYGiC7oDGHY=
X-Received: by 2002:a53:c049:0:10b0:640:b501:d7c9 with SMTP id
 956f58d0204a3-6446e982306mr53469d50.21.1765309245984; Tue, 09 Dec 2025
 11:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20251202075844.3270075-1-skandigraun@gmail.com>
 <96bf25fde10bb6d163ab8c268d5994fd862def21.camel@linuxfoundation.org> <e0819c20-eb5a-4af6-af5b-321f1021ce59@gmail.com>
In-Reply-To: <e0819c20-eb5a-4af6-af5b-321f1021ce59@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 11:40:19 -0800
X-Gm-Features: AQt7F2rXGvsCqKySlvdbLPIMJ50UUrwc5ozCPdxODk6swKGH9A0CV9Y9gHiKZVM
Message-ID: <CAMKF1spwZXbp1MbS7cH7X1fdW8c2MeSpcunAUHq97bfVQZXk5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc.bbclass: set -fcanon-prefix-map for
 class-target only
To: skandigraun@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Mingli Yu <mingli.yu@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000086943b06458a1648"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 19:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227446

--00000000000086943b06458a1648
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 6:22=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 12/9/25 13:11, Richard Purdie wrote:
> > On Tue, 2025-12-02 at 08:58 +0100, Gyorgy Sarvari via
> lists.openembedded.org wrote:
> >> -fcanon-prefix-map is not supported by all host gcc version that is
> supported
> >> by the Yocto project, which causes build failures when building recipe=
s
> >> for the host machine.
> >>
> >> This flag was supposed to be set for class-target anyway when gcc is
> the toolchain,
> >> but even when a native target is compiled with gcc, both gcc and
> gcc-native classes
> >> are loaded, and gcc.bbclass overwrites the DEBUG_PREFIX_MAP_EXTRA valu=
e.
> >>
> >> To avoid this, set this variable for only for class-target, explicitly=
.
> >>
> >> Reported-by: Mingli Yu <mingli.yu@windriver.com>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  meta/classes/toolchain/gcc.bbclass | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/toolchain/gcc.bbclass
> b/meta/classes/toolchain/gcc.bbclass
> >> index 0ed49ba892..5ec98bf7c5 100644
> >> --- a/meta/classes/toolchain/gcc.bbclass
> >> +++ b/meta/classes/toolchain/gcc.bbclass
> >> @@ -30,6 +30,6 @@
> PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian =3D
> "gcc-crosss
> >>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =
=3D
> "gcc-crosssdk-${SDK_SYS}"
> >>  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadia=
n
> =3D "nativesdk-gcc-runtime"
> >>
> >> -DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> >> +DEBUG_PREFIX_MAP_EXTRA:class-target =3D "-fcanon-prefix-map"
> >>
> >>  TCOVERRIDE =3D "toolchain-gcc"
> > Why are DEBUG_PREFIX_MAP being passed to the host gcc?
> >
> > We only use it in target flags or nativesdk flags, both of which would
> > use our cross compiler, not the host gcc. If it is being passed to the
> > host gcc, that is a bug and should be fixed.
> >
> > I appreciate there are some rust bugs in this area but those need to
> > get fixed, we don't want a global workaround we could then never get
> > rid of.
>
> Hmmm... looking a bit more into the original issue, I think you are
> right, and this patch should be indeed dropped.
> This change was triggered by a (not rust related) build issue reported
> for a meta-oe recipe, but taking a second look into that recipe, it
> passes the DEBUG_PREFIX_MAP directly to the compiler when building for
> class-native, which is most likely triggering the issue in the first plac=
e.
>

I think gcc-native.bbclass should clear it perhaps, not the gcc.bbclass


>
> Sorry for the noise.
>
> > Cheers,
> >
> > Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227440):
> https://lists.openembedded.org/g/openembedded-core/message/227440
> Mute This Topic: https://lists.openembedded.org/mt/116573246/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086943b06458a1648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 9, =
2025 at 6:22=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/9/25 =
13:11, Richard Purdie wrote:<br>
&gt; On Tue, 2025-12-02 at 08:58 +0100, Gyorgy Sarvari via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt;&gt; -fcanon-prefix-map is not supported by all host gcc version that i=
s supported<br>
&gt;&gt; by the Yocto project, which causes build failures when building re=
cipes<br>
&gt;&gt; for the host machine.<br>
&gt;&gt;<br>
&gt;&gt; This flag was supposed to be set for class-target anyway when gcc =
is the toolchain,<br>
&gt;&gt; but even when a native target is compiled with gcc, both gcc and g=
cc-native classes<br>
&gt;&gt; are loaded, and gcc.bbclass overwrites the DEBUG_PREFIX_MAP_EXTRA =
value.<br>
&gt;&gt;<br>
&gt;&gt; To avoid this, set this variable for only for class-target, explic=
itly.<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.c=
om" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gm=
ail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0meta/classes/toolchain/gcc.bbclass | 2 +-<br>
&gt;&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/too=
lchain/gcc.bbclass<br>
&gt;&gt; index 0ed49ba892..5ec98bf7c5 100644<br>
&gt;&gt; --- a/meta/classes/toolchain/gcc.bbclass<br>
&gt;&gt; +++ b/meta/classes/toolchain/gcc.bbclass<br>
&gt;&gt; @@ -30,6 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:cl=
ass-cross-canadian =3D &quot;gcc-crosss<br>
&gt;&gt; =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-c=
anadian =3D &quot;gcc-crosssdk-${SDK_SYS}&quot;<br>
&gt;&gt; =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cros=
s-canadian =3D &quot;nativesdk-gcc-runtime&quot;<br>
&gt;&gt; =C2=A0<br>
&gt;&gt; -DEBUG_PREFIX_MAP_EXTRA =3D &quot;-fcanon-prefix-map&quot;<br>
&gt;&gt; +DEBUG_PREFIX_MAP_EXTRA:class-target =3D &quot;-fcanon-prefix-map&=
quot;<br>
&gt;&gt; =C2=A0<br>
&gt;&gt; =C2=A0TCOVERRIDE =3D &quot;toolchain-gcc&quot;<br>
&gt; Why are DEBUG_PREFIX_MAP being passed to the host gcc?<br>
&gt;<br>
&gt; We only use it in target flags or nativesdk flags, both of which would=
<br>
&gt; use our cross compiler, not the host gcc. If it is being passed to the=
<br>
&gt; host gcc, that is a bug and should be fixed.<br>
&gt;<br>
&gt; I appreciate there are some rust bugs in this area but those need to<b=
r>
&gt; get fixed, we don&#39;t want a global workaround we could then never g=
et<br>
&gt; rid of.<br>
<br>
Hmmm... looking a bit more into the original issue, I think you are<br>
right, and this patch should be indeed dropped.<br>
This change was triggered by a (not rust related) build issue reported<br>
for a meta-oe recipe, but taking a second look into that recipe, it<br>
passes the DEBUG_PREFIX_MAP directly to the compiler when building for<br>
class-native, which is most likely triggering the issue in the first place.=
<br></blockquote><div><br></div><div>I think gcc-native.bbclass should clea=
r it perhaps, not the gcc.bbclass</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Sorry for the noise.<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#227440): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/227440" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/227440</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116573246/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116573246/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000086943b06458a1648--

