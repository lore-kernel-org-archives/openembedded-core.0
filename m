Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED10FEE4EC
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 10:50:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116937.1772275823009515193
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 02:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aKIIm0W6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43945763558so2009360f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772275821; x=1772880621; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gRvwh4J2MLenMQIrK6s4ttsBd3NOtVMiPhoSHxfu9do=;
        b=aKIIm0W6lBprs3LAxxXjdjOIZ/TpbbrKZzZTofC8NPVUEpsCXs3hCse07naEJs+psJ
         heCBpxkljGj8PsS830HlPEljmNzSTbb49EyhvsQu4rWDY+5hzSoMSkKdv5szwGYBBEGM
         IVz/mN3idI7baQqbhhMJQZYsR4wsbOogIaKio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772275821; x=1772880621;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gRvwh4J2MLenMQIrK6s4ttsBd3NOtVMiPhoSHxfu9do=;
        b=pnnWaRcYzhx9rmY9wVnwFB3Y71Y3kmu8UvjsOEJUVSnHEweOO06B/Iqbg6Fi77KHYY
         vG0D/kYLMBsix9S5F0IX7JP9ANdelcR3nh/lev1TDvxIAlMc0BWgUqAoWY6l8F/NPvj8
         caYf+YSZ5WTtlEqbR/pffyRdV+zZJE7BpxGCLRyz5vzEEaqrtna+bsSrx3oGutOPDIaY
         NWvnMKUlKf4oeFbM+yZf5/bAM+EHeC/kWOa3hy0ZpBytJ7xluvBOhPZ/f+GT7odZrOjj
         285M9I0AivXNRQthQWY5biI0wbR1UkXEEyHJAZ/eoSCXowD5Rn++a8H913661geo/yZe
         Mrkw==
X-Gm-Message-State: AOJu0YwB9+dywceOzqrIpHQYCh78p6CqU0DKgcn/lAE92ytOaGYAFQo7
	BnjH2XobtIasLi011KLooUi92NHameYMWi5bNdmizs1Id26wMg176omXjFeZlwQSDp4=
X-Gm-Gg: ATEYQzxz7jXguQKM+gLoBcPgWoAm+bi3dNEL8tR7I9YVvBumb1TYrP4z/eOGi8H+Ncr
	wYVAdSFB82EQkMLgISxq9Vry2uywu7G6qYnvqalAQL6d+WhC9KutWhX80gy83b5VkM0VC6hrkTI
	YHdaWDH5qZyXN9lAaCfj5msOCBZSYu7UktM0C7XWN4lkGMoHekcZ11ye8x3ZofaJi6ngZboMnke
	9ngrJVwkcVCzPtLovTgSUxFjFYe28yHaP21XBhHGl7gyNHGgL1bOw9zykBhnAOIY1XnNgI1QRmy
	R/+3eCdpFvAOwFIQtCKAfufSqs3TNxn1P/MhbBfSjXKsaCRuLwmHrJ8Fxc2lh89XlN9JpL6AWtO
	NrduoSW0gq1qgk2cmwbGVtSMiTfAjwLiOAcGLw1FwtqhF1O9XI1pwf9ryb6it7NgQ7lTdtAVFXa
	nCtKjmkrZTTv7TOYOkpnP5dVMNhyzIyyKNhTDrZNQBcIU3YSdrDPuroHiNet+vtPPzD/vvEScU/
	wX22VigqnCq
X-Received: by 2002:a5d:5d85:0:b0:439:8f0c:dcf1 with SMTP id ffacd0b85a97d-4399de28a5emr10709982f8f.33.1772275821043;
        Sat, 28 Feb 2026 02:50:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d2:3fd4:e5d5:cbb4? ([2001:8b0:aba:5f3c:6d2:3fd4:e5d5:cbb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm1955098f8f.6.2026.02.28.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:50:20 -0800 (PST)
Message-ID: <c60d35e74e13c5d4c93eaac67dcb726c25e61f76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/yocto-check-layer: allow to
 explicitly skip check_network_flag in recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@windriver.com, Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 28 Feb 2026 10:50:19 +0000
In-Reply-To: <7c4ae514-f95e-43b6-8e3c-c5fbe4ad3048@windriver.com>
References: <20260227072110.2807435-1-hongxu.jia@windriver.com>
	 <CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com>
	 <7c4ae514-f95e-43b6-8e3c-c5fbe4ad3048@windriver.com>
Content-Type: multipart/alternative; boundary="=-ZTB7XaKtiyQ2iUxGBHn0"
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 10:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232127

--=-ZTB7XaKtiyQ2iUxGBHn0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-02-28 at 11:27 +0800, hongxu via lists.openembedded.org
wrote:
> =20
> On 2/27/26 17:39, Jose Quaresma wrote:
> hongxu via lists.openembedded.org [1]
> <hongxu.jia=3Dwindriver.com@lists.openembedded.org> escreveu (sexta,
> 27/02/2026 =C3=A0(s) 07:21):
> > >=20
> > > +# Format: "BPN1:task1 BPN2:task2", separate by space
> > > +# build-appliance-image uses pip at image time
> > > +SKIP_CHECK_NETWORK_FLAG =3D "build-appliance-image:do_image"
> > > +
> > > =C2=A0# Check that no tasks (with rare exceptions) between do_fetch
> > > and do_build
> > > =C2=A0# use the network.
> > > =C2=A0def check_network_flag(d):
> > > =C2=A0 =C2=A0 =C2=A0# BPN:task names that are allowed to reach the ne=
twork,
> > > using fnmatch to compare.
> > > =C2=A0 =C2=A0 =C2=A0allowed =3D []
> > > -=C2=A0 =C2=A0 # build-appliance-image uses pip at image time
> > > -=C2=A0 =C2=A0 allowed +=3D ["build-appliance-image:do_image"]
> > > +=C2=A0 =C2=A0 allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_FLAG') or
> > > '').split()
> > >=20
> > =20
> >=20
> > =20
> > =20
> > This could introduce severe reproducibility problems for someone
> > who claims to have a Yocto compatible layer.
> > =20
> >=20
> > =20
> > =20
> > =20
> > =20
> > =20
> =20
> The meta-tensorflow, who use bazel build system to build, it requires
> network access at do_compile if download mirror is not available.
> =20
> The bazel is similar bitbake, has fetch, configure, compile, but it
> combined as one command and invoked at bitbake's do_compile=20
> =20
> In order to support offline build, I've apply a local patch to bazel
> to save download tarball as download mirror [1]
> =20
> [1]
> https://git.yoctoproject.org/meta-tensorflow/commit/?id=3D88ca1af3768e5a0=
1e6ba8b2f09d6cf2a0bfb621e
> =20
> If dowload mirror is available, the build will reuse it and network
> is not required, the reproducibility problems should be detected by
> binary comparison from two builds, we have oe-selftest case in oe-
> core by the way
If the fetching happens outside of do_fetch, it means meta-tensorflow
cannot be marked as Yocto Project Compatible.

The point of the standard and this test is to move people towards
reproducbile builds with full manifests of the contents. If you bypass
the fetcher, we don't have any of these guarantees.

Our plan was to work out a way to remove the fetching from build-
appliance too but we didn't want to hold off the implementation of that
on the rest of the standard. The fact we've not done that yet is
frustrating to me but it doesn't change what the intent of this plan
is. We don't want to add a way to bypass it unless there is really good
reason. Good reasons might be 'publishing tasks' where we're writing
data out to a remote, or we're running tests. I'd likely suggests these
be in specific well defined tasks similar to fetch with known
properties though.

Cheers,

Richard




> =20


[1] lists.openembedded.org
    https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26=
B0ju3x5wCHfoAWuj9pQ$

--=-ZTB7XaKtiyQ2iUxGBHn0
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
  <body><div>On Sat, 2026-02-28 at 11:27 +0800, hongxu via lists.openembedd=
ed.org wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><div> </div><div class=3D"moz=
-cite-prefix">On 2/27/26 17:39, Jose Quaresma wrote:</div></blockquote><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><div class=3D"moz-cite-prefix">hongxu via <a href=3D=
"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!=
aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0j=
u3x5wCHfoAWuj9pQ$" moz-do-not-send=3D"true"> lists.openembedded.org</a> &lt=
;hongxu.jia=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" moz-d=
o-not-send=3D"true" class=3D"moz-txt-link-freetext">windriver.com@lists.ope=
nembedded.org</a>&gt; escreveu (sexta, 27/02/2026 =C3=A0(s) 07:21):</div><b=
lockquote type=3D"cite" cite=3D"mid:CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ=
7cPn6jeMyC5w@mail.gmail.com" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div><div dir=3D"ltr"><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote type=3D"cite" style=3D"margin:0 0 0 .=
8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><br> +# Format: "=
BPN1:task1 BPN2:task2", separate by space<br> +# build-appliance-image uses=
 pip at image time<br> +SKIP_CHECK_NETWORK_FLAG =3D "build-appliance-image:=
do_image"<br> +<br> &nbsp;# Check that no tasks (with rare exceptions) betw=
een do_fetch and do_build<br> &nbsp;# use the network.<br> &nbsp;def check_=
network_flag(d):<br> &nbsp; &nbsp; &nbsp;# BPN:task names that are allowed =
to reach the network, using fnmatch to compare.<br> &nbsp; &nbsp; &nbsp;all=
owed =3D []<br> -&nbsp; &nbsp; # build-appliance-image uses pip at image ti=
me<br> -&nbsp; &nbsp; allowed +=3D ["build-appliance-image:do_image"]<br> +=
&nbsp; &nbsp; allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_FLAG') or '').spli=
t()<br> </div><br></blockquote> <div><br> </div> <div>This could introduce =
severe reproducibility problems for someone who claims to have a Yocto comp=
atible layer.</div> <div><br> </div> </div> </div> </div><div> </div></bloc=
kquote><div> </div><p>The meta-tensorflow, who use bazel build system to bu=
ild, it requires network access at do_compile if download mirror is not ava=
ilable.<br> </p><div> </div><p>The bazel is similar bitbake, has fetch, con=
figure, compile, but it combined as one command and invoked at bitbake's do=
_compile <br> </p><div> </div><p>In order to support offline build, I've ap=
ply a local patch to bazel to save download tarball as download mirror [1]<=
br> </p><div> </div><p>[1]<a class=3D"moz-txt-link-freetext" href=3D"https:=
//git.yoctoproject.org/meta-tensorflow/commit/?id=3D88ca1af3768e5a01e6ba8b2=
f09d6cf2a0bfb621e">https://git.yoctoproject.org/meta-tensorflow/commit/?id=
=3D88ca1af3768e5a01e6ba8b2f09d6cf2a0bfb621e</a></p><div> </div><p>If dowloa=
d mirror is available, the build will reuse it and network is not required,=
 the reproducibility problems should be detected by binary comparison from =
two builds, we have oe-selftest case in oe-core by the way<br> </p></blockq=
uote><div>If the fetching happens outside of do_fetch, it means meta-tensor=
flow cannot be marked as Yocto Project Compatible.</div><div><br></div><div=
>The point of the standard and this test is to move people towards reproduc=
bile builds with full manifests of the contents. If you bypass the fetcher,=
 we don't have any of these guarantees.</div><div><br></div><div>Our plan w=
as to work out a way to remove the fetching from build-appliance too but we=
 didn't want to hold off the implementation of that on the rest of the stan=
dard. The fact we've not done that yet is frustrating to me but it doesn't =
change what the intent of this plan is. We don't want to add a way to bypas=
s it unless there is really good reason. Good reasons might be 'publishing =
tasks' where we're writing data out to a remote, or we're running tests. I'=
d likely suggests these be in specific well defined tasks similar to fetch =
with known properties though.</div><div><br></div><div>Cheers,</div><div><b=
r></div><div>Richard</div><div><br></div><div><br></div><div><br></div><div=
><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><div> </div></blockquote><div><br></d=
iv><div><span></span></div></body></html>

--=-ZTB7XaKtiyQ2iUxGBHn0--

