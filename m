Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB2A72283
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:06:25 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so7643664qge.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y+g0epPMCAWsCtTz4GJY7zq5y8Xck6cC1Uz2DaTXGF4=;
	b=DJekc3x/ineB8oiZcf4MELTPRNctosV847OY7N14fOQl5YYrRgr8cJfy9LiEDJcMId
	O7WSx4yecuZXNErHv0i4Z8+FUpi1MdVAMMrpIPHcjUARGi6bG49LBPFqlHbsZdwguhMM
	+MrdOPMPci3ab1j8VB3rzioBreAiNclG9Uu41N8zCKSeCp8jcX7AcPH034cnvlNgaaBs
	gcTVyN2xRgSoXOKHmzsQQEFsW2+1HfyI8CnvUgYg5WzP4bVj/IzXBkgad7cXVjpIFrQI
	7I3qbrTa6yL3pjAJpIk2drKg4faMOmmONHQy1ckgDwPiytBQ02YcOYBejNelgS01oSiA
	8szA==
X-Gm-Message-State: ALoCoQmXHDqvnGKoSuJ5fEXfV6H1kTZxRLpA7YXVz2GYbarGvBWrz1OBsbZyXePBGUPM4+omnZsO
X-Received: by 10.224.25.146 with SMTP id z18mr79590706qab.17.1417446377367;
	Mon, 01 Dec 2014 07:06:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 1 Dec 2014 07:05:56 -0800 (PST)
In-Reply-To: <201409211802.17872.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409190914.03281.marex@denx.de> <1411111512.4736.11.camel@ted>
	<201409211802.17872.marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 15:05:56 +0000
Message-ID: <CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Mon, 01 Dec 2014 15:06:30 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac0cfc356050928f31e

--047d7bdc8ac0cfc356050928f31e
Content-Type: text/plain; charset=UTF-8

On 21 September 2014 at 17:02, Marek Vasut <marex@denx.de> wrote:

> -TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host
> packagegroup-cross-
> canadian-${MACHINE}"
> +TOOLCHAIN_HOST_TASK ?= "                               \
> +       nativesdk-packagegroup-sdk-host                 \
> +       packagegroup-cross-canadian-${MACHINE}          \
> +       nativesdk-python-modules
>

Thanks to Laszlo for pinging this.  We fixed a similar problem in the
buildtools tarball by pulling in python-modules but the situation was
different there - the buildtools tarball always contained some of Python so
it's logical to make it pull in all of python.

It's nativesdk-packagegroup-sdk-host that's pulling in parts of Python via
it's dependency on smartpm.  This makes me think we need two changes here:

1) The toolchain should contain the packaging tools for the selected
packaging format of the images, not just smartpm.  So a SDK for a
opkg-based image should be shipping opkg, not smartpm.

2) Toolchains should either ship no Python or all Python, because dropping
a partial Python into $PATH breaks user's expectations (the same argument
that was used for the buildtools).  Not sure how to do this though, maybe
the construction should inspect the installed package list and if anything
Python was installed, ensure python-modules is also installed.

Comments?

Ross

--047d7bdc8ac0cfc356050928f31e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 September 2014 at 17:02, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">-TOOLCHAIN_H=
OST_TASK ?=3D &quot;nativesdk-packagegroup-sdk-host packagegroup-cross-<br>
canadian-${MACHINE}&quot;<br>
+TOOLCHAIN_HOST_TASK ?=3D &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nativesdk-packagegroup-sdk-host=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0packagegroup-cross-canadian-${MACHINE}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nativesdk-python-modules=C2=A0 =C2=A0 =C2=A0 =
=C2=A0</div></blockquote></div><br>Thanks to Laszlo for pinging this.=C2=A0=
 We fixed a similar problem in the buildtools tarball by pulling in python-=
modules but the situation was different there - the buildtools tarball alwa=
ys contained some of Python so it&#39;s logical to make it pull in all of p=
ython.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>It&#39;s nativesdk-packagegroup-sdk-host that&#39;s pulling in parts of Py=
thon via it&#39;s dependency on smartpm.=C2=A0 This makes me think we need =
two changes here:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">1) The toolchain should contain the packaging tools for the sel=
ected packaging format of the images, not just smartpm.=C2=A0 So a SDK for =
a opkg-based image should be shipping opkg, not smartpm.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">2) Toolchains should eit=
her ship no Python or all Python, because dropping a partial Python into $P=
ATH breaks user&#39;s expectations (the same argument that was used for the=
 buildtools).=C2=A0 Not sure how to do this though, maybe the construction =
should inspect the installed package list and if anything Python was instal=
led, ensure python-modules is also installed.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Comments?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac0cfc356050928f31e--
