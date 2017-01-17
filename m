Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8DB71ADE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 16:20:20 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id x75so95597219vke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 08:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wMpI9tb4w62Qsd0N0eI+xO/6NjEUW804B90H0WUIXVI=;
	b=b7u22OBMq1K6Dl9cHpPFNJ70HX1GCuOdBkWvxg37cuLlEvVDPRUMsCd2HNTvfJZMwn
	2REsF7Z9ESJwd7IvukkdlAaZ93AcjGHMIxd5dty0VQt7wd3N1Uy55UjYmbMOfeuU238D
	giDHgV8MRwiuqp09l8pX0Jj6KtCCwXwGwih6nqMdrJoHQXwDGr58IpTwxU93atTTOmPH
	ecrAQp5ex120A3Z784hjxb8xPHtRpOVkKO2j5TlQeruB13FptEPN907v0XbGi/tDGiJD
	d77rbQUTGAtTmXlapc+EFWr0xEYwMud+6OsS+RQe3p91NCavZJ5TJnENkxOZB5Nsrwf5
	Zg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wMpI9tb4w62Qsd0N0eI+xO/6NjEUW804B90H0WUIXVI=;
	b=GTJIPbRmxXjQQwvrJNhEO+Dsp9Yn60ZxeBWjnntSzWsB+xRv+Ezwm0TDDGNY/EVuRL
	h16pTqzGnQ+Ia+zQFwZqeGTeMXOrLuskO0y+j/MSJd2CaWDOShk4KsiZ2ACPhFHg51Lr
	1J4rO1HlBikoXIkv9NN0i/aNdD3g7VoLJj90/ZjwDBc1abQkTzVjN40qOs5+z1ucSvPK
	1SE+ybZVEPeRF0gqRk1v8XL3587095aMYuOzNBCFTJI8ulHg2op9bLtyMDgy6ttFM20S
	jcuXeHKFo3UIKv6s0+flvozEo4c27vAApxdq6tMRwKZgprOQyDSOqD78JUVCLAaWlKaL
	TyCw==
X-Gm-Message-State: AIkVDXLnLpxrD10vPWEDcCaaonJdLccE3KtNmMXfxxPpxIIG8kkC2L/h+6MpVuvFXPGmG+74izoPXDDjTkP9bg==
X-Received: by 10.31.36.151 with SMTP id k145mr13444604vkk.29.1484670020788;
	Tue, 17 Jan 2017 08:20:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Tue, 17 Jan 2017 08:20:20 -0800 (PST)
In-Reply-To: <20170117152828.10729-1-git@andred.net>
References: <20170117152828.10729-1-git@andred.net>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 17 Jan 2017 17:20:20 +0100
Message-ID: <CALbNGRRUhGWsDwr8WdVnaZmuqj8W+aaY8fQ41bXYzYoT1rT1cQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pygobject: enable cairo only when a display is available
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
X-List-Received-Date: Tue, 17 Jan 2017 16:20:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 4:28 PM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> It doesn't seem to make sense to unconditionally enable cairo
> support, as this pulls in lots of other dependencies, where
> none of these can actually be used without some sort of
> graphical interface.
>
> Not having a generic distro feature to detect this, we just
> use any of DirectFB / Wayland / X11
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  meta/recipes-devtools/python/python3-pygobject_3.22.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.22.0.bb
> index 5a895441fc..143048d9ef 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
> @@ -19,7 +19,7 @@ SRC_URI[sha256sum] =3D "08b29cfb08efc80f7a8630a2734dec6=
5a99c1b59f1e5771c671d2e4ed8
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>
>
> -PACKAGECONFIG ??=3D "cairo"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'dire=
ctfb', 'wayland', 'x11' ], 'cairo', '', d)}"
>
>  # python3-pycairo is checked on configuration -> DEPENDS
>  # we don't link against python3-pycairo -> RDEPENDS
> --
> 2.11.0
>
Looks good

Andreas

