Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85032C2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:58:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1783.1741802334906904721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YwutWFYM;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CHwZwq1584166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 12:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741802315;
	bh=Y5qJ/7ayND3aleuxbuCA0Tp2H6vlp2OouiScOyflCes=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=YwutWFYMlC+/rKn3WPWsLr3HlGv8VKupDHdmDxw10ulCjJVOeomiH/1MbvB055ju3
	 X1xMaUHlmVzct8hrR7yX3hLKpuLQomDFFiJpUOt25l85YYAmO2MwIir5sTrghn1Ouy
	 XHRqgrnvXRuNrEVTCqwmDdwuGnQLSzCuvLR3m9L4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CHwZ54086658
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 12:58:35 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 12:58:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 12:58:34 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CHwYnU047560;
	Wed, 12 Mar 2025 12:58:34 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Mar 2025 12:58:34 -0500
Message-ID: <D8EHE0V2MUOP.3AHY1TL4O6ZIR@ti.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, Andrew Davis <afd@ti.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon
	<reatmon@ti.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Pothukuchi, Vijay"
	<vijayp@ti.com>
Subject: Re: [oe-core][RFC] Display manager proposal for x11 and wayland
From: Randolph Sapp <rs@ti.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
        <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <40fd57cb-deaa-480c-8ec6-87ca1a55e21d@ti.com>
 <CANNYZj_p96AQaaPqW52m_gCKGrPqxKWmC3t2TOrPnmKP6A+Kcg@mail.gmail.com>
 <CAP9ODKqCBNLpUOBO=+W83x4vWydt12+=zZvJ-8ciNgMZdN1zNQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqCBNLpUOBO=+W83x4vWydt12+=zZvJ-8ciNgMZdN1zNQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 17:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212663

On Wed Mar 12, 2025 at 5:52 AM CDT, Otavio Salvador wrote:
> Hi Alexander,
>
> I totally get your concerns about long-term maintainability and how addin=
g
> new components to oe-core can complicate things. Still, Randolph's idea
> does make a lot of sense, especially since our current setup has code
> scattered in different places, making it tricky to maintain and potential=
ly
> causing issues down the road.
>
> Checking out Randolph=E2=80=99s proposal, or maybe something similar, cou=
ld really
> help tidy things up and improve maintainability for oe-core long-term.
>
> Looking forward to hearing more thoughts on this!
>

Thank you Otavio

> Em qua., 12 de mar. de 2025 =C3=A0s 06:39, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> escreveu:
>
>> I have a couple of concerns:
>>
>> - can this event handling be achieved simply by using udevadm which is
>> available in any init system?

Yes and no. Just detecting when a device is registered with the drm subsyst=
em
can be achieved with udev though. Udev events for display hotplug events do=
 not
seem to be easy to identify and cannot be handled without some custom daemo=
n
anyway.

One of our workarounds was to add a rule to make systemd track our main dri
device and register a .device unit that we could add as a dependency to the
desktop init service. Great for systemd init with a singe device, ignoring
hotplug.

That being said, emptty doesn't support hotplug events right now either, bu=
t I'm
thinking about contributing to that project if people are interested.

>> - who is the author? What if they abandon the component? We've been
>> reluctant to insert core graphical dependencies (e.g. more interesting
>> compositors than weston) on not widely used things with unclear origin
>> and support promise.

As far as the author goes, that's fair. This is one of their more popular
repositories and I'm not personally familiar with them. That's always a ris=
k
though, and when it comes to lightweight display managers with auto-login
capabilities the only other option is lightdm, which comes with potential
license issues being GPL-3.0.

>> - can you produce a patchset that showcases the benefits?

Certainly. Considering our current release window and the bug that brought =
all
this up, I'll have a little demo for Weston I can post in the next few days=
.

>> On Wed, 12 Mar 2025 at 01:46, Randolph Sapp via lists.openembedded.org
>> <rs=3Dti.com@lists.openembedded.org> wrote:
>> >
>> > We've recently run into some issues with weston-init attempting to sta=
rt
>> > Weston prior to all drm devices being registered. There's not really a
>> > good, scriptable mechanism to listen in to device registration events
>> > that works with the existing weston-init package. Well, at least one
>> > that doesn't involve polling files or introducing more dependency on t=
he
>> > init system being used.
>> >
>> > I also see there is also a lot of scripting around starting X11,
>> > xserver-nodm-init, that (from my limited review) should experience the
>> > same issue.
>> >
>> > I'd like to introduce the following display manager for oe-core, emptt=
y
>> > [1]. This display manager is, as described upstream, a "Dead simple CL=
I
>> > Display Manager on TTY". It supports both x11 and wayland sessions, wi=
th
>> > togglable build parameters to completely remove x11 and pam
>> > dependencies. It's licensed MIT, which shouldn't be an issue for any
>> > users. (It is written in Go, if you have opinions about that.)
>> >
>> > With this, both weston-init and the xserver-nodm-init packages can be
>> > re-tuned to leverage this display manager and simply add a user and
>> > emptty config for an autologin session. This can resolve the current
>> > behavior across init systems without additional scripting, and move so=
me
>> > development out of this layer.
>> >
>> > I already have a recipe for emptty, but I figured I would reach out fo=
r
>> > comment to recent contributors before I submit any patches playing wit=
h
>> > the existing init packages.
>> >
>> > [1] https://github.com/tvrzna/emptty
>> >
>> > - Randolph
>> >

