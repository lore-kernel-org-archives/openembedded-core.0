Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0556CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:22:14 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id aq17so49479iec.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aNpnysMghWtH158Cf3PWVkdSjhu8+3wzjOgY35ikQQ4=;
	b=g80xxGY78N9ofy2wk8+zho4CI3DQxH+TmBzMb17eWfyJB3ebnfnCzfPnBHwAIRLBa8
	ebw1vVGmfXN3/jWoD76MdJNoBx3MaCOZtzwe0HrSQYE7FpAMPfII6ngneGXJAimW/ggz
	tO1QMu0Kd1EYU0ElkhZmt/vGTLIlmcIX1hzeM42yfSxfTQ6j+T+alncdWy/sDswRqXjX
	zJVoggrbe/1WOaX+oya8IsTAtMbA00DXYoltPWz9lYqYxhfJ2F0OquF2n+K6hitQgQyL
	hgU1FT/ii9aFoBGMCCh85UIDzTaGVdaFdDeB6NabFmBDoTWogl5xtRwiAhqJFyxRoWvP
	6G+g==
X-Received: by 10.42.121.132 with SMTP id j4mr21320icr.42.1382386936178; Mon,
	21 Oct 2013 13:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 13:21:07 -0700 (PDT)
In-Reply-To: <526556B1.2010908@emagii.com>
References: <526556B1.2010908@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2013 13:21:07 -0700
Message-ID: <CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
To: "ulf@emagii.com" <ulf@emagii.com>
Cc: Discussion of the angstrom distribution development
	<Angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using the correct "xserver-xf86-config_0.1.bbappend
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
X-List-Received-Date: Mon, 21 Oct 2013 20:22:15 -0000
Content-Type: text/plain; charset=UTF-8

Ulf

On Mon, Oct 21, 2013 at 9:30 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
> Trying to build a systemd-gnome-image raspberrypi under Angstrom, with a few
> extra layers.
>
> This fails on "xserver-xf86-config_0.1.[bb|bbappend]"
>
> The extra layer has BBPRIORITY = 20.
> meta-beagleboard has BBPRIORITY = 8
> meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)
>
> BBLAYERS are in the order meta-<extra layer> meta-beagleboard
> meta-raspberrypi
>
> It looks like bitbake will select the bbappend in the layer with the highest
> priority,

Not really. All bbappends are selected the order or sequence of them
is governed by how the layers line up in BBPATH

> even if that contains a COMPATIBLE_MACHINE clause, which does not
> include the current MACHINE.
>
> Is there any way to make bitbake select the correct bbappend file without
> modifying the BBPRIORITY?
>
> --------------------------------------------------------------------------------------------
> Looks like the xserver-xf86-config for the raspberry-pi fails on
>
> SRC_URI_append_raspberrypi = " file://xorg.conf.d/*"
>
> When I change to:
>
> SRC_URI_append_raspberrypi = " file://xorg.conf.d/10-evdev.conf "
>
> the raspberry pi version completes.
>
> Wildcards are not allowed?

This is a question of fundamental bitbake semantics/syntax for SRC_URI
and nothing to do with bbappends. and I dont think wildcards in
SRC_URI are reliable, so better be explicit about them.


>
> --
> Best Regards
> Ulf Samuelsson
> eMagii
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

