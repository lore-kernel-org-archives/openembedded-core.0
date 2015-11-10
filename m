Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id C984375EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:08:57 +0000 (UTC)
Received: by qgea14 with SMTP id a14so85149694qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Cuf5a3uUCxGg7mdzccsClc9fWyY/CAAzfLWLxQa8uaE=;
	b=o14BLu3Hells6a3GD5jhSLSJBSeN6miThIX2kxZysJZ9Rcsr4X++2uIS1zbkCUB5mk
	o0ETpWOwqYfEQCqC8erdVAL9LOIGqFhUf/hhGgMZQjMu9jXGLK+6enucuMfuG7bFzkbD
	TMF1NUAUqS36B2oVSlOzEVCoJgKe7SDfwoGeGPVIYsFiV0ffZNMuoMyo5K0tGtFl9SgC
	g1pPsFrQD7o+LrZNkj8osGhwr/NR+i88U106ThZtezKJ3vqjPpKA60l7eHBaOD3WfN3a
	aFTjuzZTSRSSm/XKcJkpKd3DRBup+2Op6L/G+lBjOE+C2wHPfpMdstYBNb9kW04NobAd
	ylQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cuf5a3uUCxGg7mdzccsClc9fWyY/CAAzfLWLxQa8uaE=;
	b=Bwal9Lm6o7WJoiM+lux5AyyoRn/ucg5dAhjSBVSlKKoKKaGDDOUjIGkDP8Cv4m/Njt
	SZixkWNqwpvfsEPmM6GFXWY6UejSRJ2AkeoSF343Nj3oMWmynEU77EgsWx3cSC5mwmKk
	ZLvaeCmKCfTjGt/GJzjqJy9qgLgO5T1Rb7aEh5w/UkBrw3bDtmf+I4YS4C3fXfW0X/+P
	cNhoEdNSUsZ/QZSWy6OZbORAbWp7/lAebXcSnpJxqERrXDyOPwclpbJh+s8tzUW65b/9
	VmqdDZ45Xj92H8ioxbYUAToYycf62/vh/Tu+kqHq28Oy7K/vK19yndDMlWmnOBtKJSp3
	MJ4g==
X-Gm-Message-State: ALoCoQmjItMFEhJmm/+N/fueQ7wSZfcuSqRP2HSzOxX56MM5hKrFHWHShIcQhHoHsJpSva0gswYX
X-Received: by 10.140.46.119 with SMTP id j110mr3058309qga.77.1447150137335;
	Tue, 10 Nov 2015 02:08:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 02:08:37 -0800 (PST)
In-Reply-To: <1447131417-29782-1-git-send-email-rongqing.li@windriver.com>
References: <1447131417-29782-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 10:08:37 +0000
Message-ID: <CAJTo0LZ1x7vK=CJsCh4JxVJakWTCpkW=9Qi7JhuoAwZ-veJ0iQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: fix the ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 10:08:59 -0000
Content-Type: multipart/alternative; boundary=001a11395aaadf75be05242ce576

--001a11395aaadf75be05242ce576
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 04:56, <rongqing.li@windriver.com> wrote:

> ++            goal = last_goal - 1 >= 0; last_goal - 1, 0;
>

I'm guessing this was a ternary expression gone wrong and the intended code
was:

  goal = last_goal -1 >= 0 ? last_goal - 1 : 0;

This patch makes a *massive* difference to build times (see the header
comments) so please verify that large images (i.e. core-image-sato-sdk) are
both valid and constructed in the same timescale as before.

Ross

--001a11395aaadf75be05242ce576
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 04:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rong=
qing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5gv" class=3D"a=
3s" style=3D"overflow:hidden">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
oal =3D last_goal - 1 &gt;=3D 0; last_goal - 1, 0;<br></div></blockquote></=
div><br>I&#39;m guessing this was a ternary expression gone wrong and the i=
ntended code was:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">=C2=A0 goal =3D last_goal -1 &gt;=3D 0 ? last_goal - 1 : 0;</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This patc=
h makes a *massive* difference to build times (see the header comments) so =
please verify that large images (i.e. core-image-sato-sdk) are both valid a=
nd constructed in the same timescale as before.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11395aaadf75be05242ce576--
