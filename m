Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id C3F27700F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:21:21 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id x130so24570603ite.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yOgH2GIREcjbK0Z5AZeynzK4/1zCFqelBfwgDPAxgAU=;
	b=f5qgqI0Quv435xHG1mWMiBbiibjI15Kki/6tFZ893hqaVvAD2Lah31aDXoWpvY6F8C
	OZQFUMoOdVnrtqrzrUhKst8kS16T0obtgEnTOzRnEuFO75N2GI4NyQWTeOi4fAego+Tz
	VdPfcp3Xdz1zl8GC5X23KiQTw0EKkvf74Rs8cNopHXYhjwVUobZnSzmLiYTV39I6suFR
	KGJBzPbY01YKPNCCQ3gwzZgFuK1h5hnC4H+CmMDk6XRmsPuV3rtzWKeDbfRkU/sC6wf9
	oouJhw2a1L1QM+2NsSZOyj7kjSWX45vZzIjfFK9S7ewqeHGu1oFSwhdmeyw8XKWwefRH
	hG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yOgH2GIREcjbK0Z5AZeynzK4/1zCFqelBfwgDPAxgAU=;
	b=OVm0zHtmucwWcd8WSxazNX3UHY6/wMZ73BkNeyTFQedAFulLV/WU8vc87d9TevT+s6
	/hbUyRlT3yssvW8u2YVyeQyuhkmgC22BOWOaxW3pNt4FTlWDcta/ScBFu8omUkfGx24N
	3joEciK/hnlIfSDAB5YjgH37EL5TOnz5tMvq564/enT+baKV66PfVGiOjkYZP8X7IxZ4
	GqHBblFLHeRuwBFghLB/4dchCSyUnxB3oJPYpHD98ac2PqmYyVDXsh3KS4AwrdsngY26
	UICV5G71gElxo3PQLEUSuik6itT1KuhWwXQuOCyeGRHShM2u30m/ov7ugRmXa+feiRxh
	60gg==
X-Gm-Message-State: AEkoouslcvSFN+SCpHcRxFkhLlG+BuqKXbZWKCT8Ea6vjwO6ePVAnpyLEP1qaoewda6rLp9X5jZHAyr3h2zDzINM
X-Received: by 10.36.57.211 with SMTP id l202mr5175598ita.22.1470410482070;
	Fri, 05 Aug 2016 08:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 08:21:01 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
References: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 16:21:01 +0100
Message-ID: <CAJTo0LYajtVoap4T8AmCCoPQpD9sxsjDFb2d6nRCnRGNoZ6ZxA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: where is the safest place to put a single-shot "run and reboot" script?
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
X-List-Received-Date: Fri, 05 Aug 2016 15:21:22 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca755fbb0539549e8c

--001a114ab3ca755fbb0539549e8c
Content-Type: text/plain; charset=UTF-8

On 5 August 2016 at 16:14, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i have a systemd-based image that, after coming up normally, i want
> to fire off a one-time script which, after completion, reboots. i've
> been told that using systemd's run-postinsts is discouraged and, for
> now, i just want the simplest and quickest solution.
>

Write a recipe with a postinst that defers (exit 1 if $D is set at the
beginning).  This will be ran on boot until it succeeds, and then deleted.

Ross

--001a114ab3ca755fbb0539549e8c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 16:14, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2xg" cla=
ss=3D"a3s aXjCH m1565b45a18e72eb5">=C2=A0 i have a systemd-based image that=
, after coming up normally, i want<br>
to fire off a one-time script which, after completion, reboots. i&#39;ve<br=
>
been told that using systemd&#39;s run-postinsts is discouraged and, for<br=
>
now, i just want the simplest and quickest solution.</div></blockquote></di=
v><br>Write a recipe with a postinst that defers (exit 1 if $D is set at th=
e beginning).=C2=A0 This will be ran on boot until it succeeds, and then de=
leted.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a114ab3ca755fbb0539549e8c--
