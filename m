Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ABFD13C0F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:56:07 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19882.1769435761516994416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zokox53t;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: colinmca242@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8870ac4c4eso423574866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 05:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435760; cv=none;
        d=google.com; s=arc-20240605;
        b=LhluSbEsN6d2snEA/mCpGQtSYcs3SJw7Zei4U6NFcpHdyPVuaUieWNlfL0psxC1zr1
         sxPiHJR+jDVvnmFSzxUmjW1btzT2Mgsl8jKzlrhul3vazgc483ycBQDYiiYrQ6qOgob1
         GJAnIbbIDTWoVawpCDUWayBvAoxDBLEpQEXZ5JKF1wLdPCEJBX66T4jwFUYXnT7pUUKR
         gqMQ6aTOxjolUqHXq8u3Ttcwrh0wVsYoyjAysNlfp7xkiSutWwym9pHbizdnpKeuY/OG
         sa2/Wsy83wHId9bTLsoY54gNO4ayQbglfGRiYdv9s3q4MLIu8W23TagMIjheaNPQAU1O
         Nu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gnFHN0nkCDXACJcFzluGi8sMF22yexPKFvs8derKle4=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=Jyfg7Ylaq6qKVpWMuaKYcagk88ak63suy41enXunL1+d1Id0oD/1N38NwwiIuyRyI9
         z2BHwQqM0HeEqjjafFh7YIeWg0RvxNjkhrQ7MFP002253jOPkkV4Alz566Gv59tve4+X
         QZ0/H+WzWbcSNdJm6LC3AmNmD3m2nk/6ebDFtKhuEeMACIWbeUGMSeV4l34LgaplnzEN
         cA15MYvWwF80ceB6nyXRDmD533ID0ejrWIc146UMqmbkQ4ueQuUCS3o0VXoDyCpruAeg
         8PycbJmthFzbgzmYkKbKpq5sfaGECGQX0UF4UtSdvkRaK0QvWWf4f/ebN8b1Z3tXUCW9
         525w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435760; x=1770040560; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnFHN0nkCDXACJcFzluGi8sMF22yexPKFvs8derKle4=;
        b=Zokox53tVPIBf0wHSwoTISTz66iJrhKUnlPzm5rH5hO4r8fbrNGghOmhPqbclZ60P8
         MVBCZ7/6tb8WjCrMK24K6KyVaXlAwoVFOX0QtG1xenRYkR3vV89jqc5BGiyfX+UoEqvV
         r4fphZCUWJmqFRFdhdx3YYrWSZEU3VgwmP/GkOYAI/L2hcfUMGLLEvLvhfcsG3AFBw1y
         ec216uQPQl4S7WA/oEMIJM64E8/VbQLfu8Xqmddqg0VU7bKyfb3twoNbNv043/Pw8AIA
         qiRlk27zyG2oBWE36Od0fI11TA8yERF7Om4Yodveczu0BosmbY1whjKutuXRlQlVZ24c
         wbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435760; x=1770040560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnFHN0nkCDXACJcFzluGi8sMF22yexPKFvs8derKle4=;
        b=kku+erR2+yIcPQdFL0JqfE4ju4g26GAoYqUUKBICZsNWAqcSXiI7hJ9Rk3IP/1tApm
         99PQL/Ih02nX7CJjS9/TRQ41h+bATMgWEAfAhqg+sEIzbgmudPC18Cqom4gll08x6khG
         iGx07Tu1lTrJN7X4G4ZrpmlOLXLycMkPP0ggA8oM6yTYHma32gskOjKK9h6ereywTHNR
         6qjRlFpHflrw/Qt3LzUXBX8OwnEhPw70MC04zfcaw2q7YY1G6nmquXo0U75+R70nQtxP
         DwWLCO01e94LH6u1F/7VI5jLUL+Waf6MfzF/APUCsAeYg8rLxKYryOmxeqFfHC1S0cNr
         DHmA==
X-Gm-Message-State: AOJu0YzEvOi+H2iRZIJFl2VIt0xbUrhPYYl1dxU+qysO8pHHnPJjfPVI
	G3iTDphA8tdlcxCynUXcjuaRBEO7H6KOrjs66EtUCX9J3ZcRhox3xjvKO6JNitbEsqlIeql/oNa
	/HVTG+fSzJ39Q/dpK+r/5GmWuyT7t0D0=
X-Gm-Gg: AZuq6aIYYNm9vYjRuliTQr5QY9AabZ9u0D1tuNv95WV5hALNMZjHVGDA+NzGaoNLMQQ
	GBVdl8ttwGoygRqdSkt5a1yPxBXuX7zwZutVl+CJ//9i3m/NGK0Va2nBSIzsPc8deDfZGNfdxY8
	ytvkaFl09BFiyZbHNiWAxCDEZ1UcFvdU/ksTYYoknLOVtD79E0OTmfA4srkd8SIraOo7tix0O0h
	uwD141u72xhIYUEz6bwTpFfHEadCFy31pHC0MDUoAaTdxrzNa9yMuqu9kEXIVgWCbH3/XAhp2Uj
	pjMhoKg=
X-Received: by 2002:a17:907:1c95:b0:b76:49ae:6ee6 with SMTP id
 a640c23a62f3a-b8cfee25b4fmr351306666b.15.1769435759186; Mon, 26 Jan 2026
 05:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260122025736.187410-1-colinmca242@gmail.com> <CANNYZj_2p1G8EseLFXAnbbUcuSbZxmQ-2V=TaZUSX5CKAiLdXA@mail.gmail.com>
In-Reply-To: <CANNYZj_2p1G8EseLFXAnbbUcuSbZxmQ-2V=TaZUSX5CKAiLdXA@mail.gmail.com>
From: Colin <colinmca242@gmail.com>
Date: Mon, 26 Jan 2026 07:55:47 -0600
X-Gm-Features: AZwV_QgMJX8y0IpJvuYCqXQT9qS3bdbydKF--8b--EIvW1yqk5frEedaMhiBO6M
Message-ID: <CAAyLwgRoRG6COWS5==ScEiG99rqRsEbjqgn60LixdwUqY3purQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Add legacy-openssl packageconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e1190b06494addf1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 13:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230007

--000000000000e1190b06494addf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

See my responses inline below.

Best,
Colin


On Mon, Jan 26, 2026 at 4:05=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Thu, 22 Jan 2026 at 03:57, Colin McAllister via
> lists.openembedded.org <colinmca242=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Fixes [YOCTO #15416]
> >
> > Adds legacy-openssl packageconfig option to allow users to specify
> > if they would like the cryptography module to support the legacy OpenSS=
L
> > module or not. The legacy-openssl packageconfig option ensures the
> > openssl-ossl-module-legacy package is set as a runtime dependency. If
> > the packageconfig option is disabled,
> > CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY will prevent the library from ever
> > attempting to load the legacy provdier.
> >
> > Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
> > ---
> >
> > I wasn't sure if this new packageconfig option should be enabled or
> > disabled by default. Leaving it enabled seems like the less disruptive
> > option, although it's leaving the module in a less secure state by
> > default.
> >
> > I'm happy to update the patch to leave the option disabled by default
> > if others think that would be better.
>
> It would help to understand what this legacy module is for. 'Legacy'
> and 'crypto' together aren't a great pair of words.
>

Would you like me to add additional information within the commit message
or the recipe itself?

Verbose thoughts follow:

The OpenSSL legacy provider provides algorithms that are either used
infrequently or have been deemed insecure.

https://docs.openssl.org/3.5/man7/OSSL_PROVIDER-legacy/

The openssl-ossl-module-legacy package in oe-core provides this legacy
module and the module is installed as a separate shared lib
in ${libdir}/ossl-modules/legacy.so.

The Python3 cryptography module supports the OpenSSL legacy provider.
Historically, if support wasn't disabled via an env var and this module
could not be found, the cryptography module would raise an exception. More
details of this causing issues in oe-core can be found in Yocto #15416
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15416

In Python3 cryptography v45.0.0, this exception was downgraded to a
warning. However, a build-time env var was also added that can explicitly
disable support as if the existing runtime flag is always set.
This patch is my attempt to integrate this support into oe-core where a
packageconfig option is used to enable/disable support for this legacy
module and also set an explicit runtime dependency on the
openssl-oss-module-legacy package.

In master it's possible to break such defaults. If the outcome is a
> more secure system, it's even desirable.


I am a little hesitant to disable this packageconfig option by default.
With this option disabled, after an upgrade, a user of python3-cryptography
will suddenly lose support for some algorithms. Based on my testing, the
exception is not super helpful and may be tricky to track down the root
cause. Since this is a general-purpose cryptography library, users should
make their own informed decisions on what OpenSSL algorithms are safe to
use. End users will not be unknowingly subjected to insecure algorithms
being used on their product. However, for those that may need to exclude
the algorithms from their platforms due to compliance/certification
requirements, the functionality can be disabled.

I do think the discussion within the Cryptography GitHub is worth
referencing:
https://github.com/pyca/cryptography/issues/11450

Lastly, the openssl-oss-module-legacy package is enabled by default in the
OpenSSL recipe, so by disabling this support by default, I'd be introducing
inconsistent behavior.

I'm happy to push up a v2 patch disabling this packageconfig option by
default, but I think that should be accompanied with a patch disabling the
openssl-oss-module-legacy package by default as well.

Please let me know what you think would be best.

Alex
>

--000000000000e1190b06494addf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Alex,</div><div><br></div><div>Se=
e my responses inline below.</div><div><br></div><div>Best,</div><div>Colin=
</div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><br>=
</div></div></div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 26, 2026 at 4:05=E2=80=
=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Thu, 22 Jan 2026 at 03:57, Colin McAllister via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;colinmca242=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Fixes [YOCTO #15416]<br>
&gt;<br>
&gt; Adds legacy-openssl packageconfig option to allow users to specify<br>
&gt; if they would like the cryptography module to support the legacy OpenS=
SL<br>
&gt; module or not. The legacy-openssl packageconfig option ensures the<br>
&gt; openssl-ossl-module-legacy package is set as a runtime dependency. If<=
br>
&gt; the packageconfig option is disabled,<br>
&gt; CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY will prevent the library from eve=
r<br>
&gt; attempting to load the legacy provdier.<br>
&gt;<br>
&gt; Signed-off-by: Colin Pinnell McAllister &lt;<a href=3D"mailto:colinmca=
242@gmail.com" target=3D"_blank">colinmca242@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; I wasn&#39;t sure if this new packageconfig option should be enabled o=
r<br>
&gt; disabled by default. Leaving it enabled seems like the less disruptive=
<br>
&gt; option, although it&#39;s leaving the module in a less secure state by=
<br>
&gt; default.<br>
&gt;<br>
&gt; I&#39;m happy to update the patch to leave the option disabled by defa=
ult<br>
&gt; if others think that would be better.<br>
<br>
It would help to understand what this legacy module is for. &#39;Legacy&#39=
;<br>
and &#39;crypto&#39; together aren&#39;t a great pair of words.<br></blockq=
uote><div><br></div><div>Would you like me to add additional information wi=
thin the commit message or the recipe itself?</div><div><br></div><div>Verb=
ose thoughts follow:</div><div><br></div><div>The OpenSSL legacy provider p=
rovides algorithms=C2=A0that are either used infrequently or have been deem=
ed=C2=A0insecure.</div><div><br></div><div><a href=3D"https://docs.openssl.=
org/3.5/man7/OSSL_PROVIDER-legacy/">https://docs.openssl.org/3.5/man7/OSSL_=
PROVIDER-legacy/</a></div><div><br></div><div>The openssl-ossl-module-legac=
y package in oe-core provides this legacy module and the module is installe=
d as a separate shared lib=20
in=C2=A0${libdir}/ossl-modules/legacy.so.</div><div><br></div><div>The Pyth=
on3 cryptography module supports the OpenSSL legacy provider. Historically,=
 if support wasn&#39;t disabled via an env var and this module could not be=
 found, the cryptography module would raise an exception. More details of t=
his causing issues in oe-core can be found in Yocto #15416</div><div><a hre=
f=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15416">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15416</a></div><div><br></div><div=
>In Python3 cryptography v45.0.0, this exception was downgraded to a=20
warning. However, a build-time env var was also added that can=20
explicitly disable support as if the existing runtime flag is always=20
set.</div><div>This patch is my attempt to integrate this support into oe-c=
ore where a packageconfig option is used to enable/disable support for this=
 legacy module and also set an explicit runtime dependency on the openssl-o=
ss-module-legacy package.=C2=A0</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
In master it&#39;s possible to break such defaults. If the outcome is a<br>
more secure system, it&#39;s even desirable.</blockquote><div><br></div><di=
v>I am a little hesitant to disable this packageconfig option by default. W=
ith this option disabled, after an upgrade, a=C2=A0user of python3-cryptogr=
aphy will suddenly lose support for some algorithms. Based on my testing, t=
he exception is not super helpful and may be tricky to track down the root =
cause. Since this is a general-purpose cryptography library, users should m=
ake their own informed decisions on what OpenSSL algorithms are safe to use=
. End users will not be unknowingly subjected to insecure algorithms being =
used on their product. However, for those that may need to exclude the algo=
rithms from their platforms due to compliance/certification requirements, t=
he functionality can be disabled.</div><div><br></div><div>I do think the d=
iscussion within the Cryptography GitHub is worth referencing:</div><div><a=
 href=3D"https://github.com/pyca/cryptography/issues/11450">https://github.=
com/pyca/cryptography/issues/11450</a></div><div><br></div><div>Lastly, the=
 openssl-oss-module-legacy package is enabled by default in the OpenSSL rec=
ipe, so by disabling this support by default, I&#39;d be introducing incons=
istent behavior.</div><div><br></div><div>I&#39;m happy to push up a v2 pat=
ch disabling this packageconfig option by default, but I think that should =
be accompanied with a patch disabling the openssl-oss-module-legacy package=
 by default as well.</div><br></div><div class=3D"gmail_quote gmail_quote_c=
ontainer">Please let me know what you think would be best.<div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Alex<br>
</blockquote></div></div>

--000000000000e1190b06494addf1--

