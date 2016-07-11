Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id D71DC6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:22:49 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id f6so51385342ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a28xWt3OtzkSTiG5eMfEMSIR4mESWZugrWWZBulG6kc=;
	b=cRvPJRN4WPdJce5C7WOb5J0DGKuXe5fXl/v+rG7ZLSN1cSj6X3XgaG4XF4FOKn4Z0X
	hAhqdfE5XxELqvFsCJd/FK+2eLxfJYc7OU5+zkorkUYqQSU5fq/Jgbd6WlY7awQdSMIF
	4Lkc+clrvsTgky4bnFvlmvkNTk6F6XlDMDnVfCm3muXzTCgiZmGgzOQLNkBZGCIUWsWY
	vwPJp6bipc5IiECSm1v2JT34URFqhJrlfNbffdMfIKr4PbZNwwhCO9PtWjb2GIwOakzp
	tg6mkcRKTrwYddi2uHX4aovdlaCDAbXFlodn6yDX5GA/a06g/ROFqhU+fywbygu+6hKI
	gtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a28xWt3OtzkSTiG5eMfEMSIR4mESWZugrWWZBulG6kc=;
	b=IB8LCybS7mH4ndlOwRQ1wCkJqUCwZCGiB5Nw1nfsQJ1ozw5HSIySce/S5LDaUDJDnJ
	Z1JEUYgNTUiWbaCQYbMv76epoMt3XKHH1IrWarSRtMFH9VrhBQtpY3+buV6RITk6hgGw
	xnjHjlmPyPWoC5eGQ21mBXFPU9taJV6dFgK46/zxV40X1Xje9RYrM08wSeIWxCWWyRFp
	i9asSgyPttMnQZuhRvEiLiG+cNGw18vVr/gzQf7HK8MrhPijlUiVDgNHzaT5hnqCmpsS
	86UHdBD0KKchHTPTeo/Sfmq4afu0G9S7QvecC+fOiSjqCiSb8poLJicNQ2spsCSH/8pw
	eM+g==
X-Gm-Message-State: ALyK8tJtUBkt6E4zWGib8yaRETC6XVJrMGIpHfu4urGR8qMZ1dys5zhSk5iZRLffrS8iTMlrxkWANoZPvdfv17jX
X-Received: by 10.36.120.74 with SMTP id p71mr9699538itc.22.1468232570009;
	Mon, 11 Jul 2016 03:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 11 Jul 2016 03:22:30 -0700 (PDT)
In-Reply-To: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
References: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 11:22:30 +0100
Message-ID: <CAJTo0La2hOxuxNsEdoEVE2tKDsL_3nRd6zonG-iLn7_=HRtqyQ@mail.gmail.com>
To: Catalin Enache <catalin.enache@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub-efi: run autogen.sh before configure
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
X-List-Received-Date: Mon, 11 Jul 2016 10:22:50 -0000
Content-Type: multipart/alternative; boundary=001a114aa394c88d3b0537598893

--001a114aa394c88d3b0537598893
Content-Type: text/plain; charset=UTF-8

On 6 May 2016 at 13:13, Catalin Enache <catalin.enache@windriver.com> wrote:

>  DEPENDS_class-target = "grub-efi-native"
>  RDEPENDS_${PN}_class-target = "diffutils freetype"
> +DEPENDS += "autogen-native"
>

Because += happens after overrides this results in autogen-native only a
dependency in native builds, so you can't be sure it will be present for
target builds.

Should the configure_prepend and autogen-native be added to grub2.inc so
that every recipe has that dependency?

Ross

--001a114aa394c88d3b0537598893
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2016 at 13:13, Catalin Enache <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:catalin.enache@windriver.com" target=3D"_blank">catalin.enache@windrive=
r.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=C2=A0DE=
PENDS_class-target =3D &quot;<span>grub</span>-<span>efi</span>-native&quot=
;<br>
=C2=A0RDEPENDS_${PN}_class-target =3D &quot;diffutils freetype&quot;<br>
+DEPENDS +=3D &quot;autogen-native&quot;</div></blockquote></div><br>Becaus=
e +=3D happens after overrides this results in autogen-native only a depend=
ency in native builds, so you can&#39;t be sure it will be present for targ=
et builds.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Should the configure_prepend and autogen-native be added to grub2.inc =
so that every recipe has that dependency?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa394c88d3b0537598893--
