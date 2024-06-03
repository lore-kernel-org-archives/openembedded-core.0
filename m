Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED0CC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 22:03:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6834.1717452178952814547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 15:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q9om4Qf3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453M2j4t076673;
	Mon, 3 Jun 2024 17:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717452165;
	bh=tyobEhUdGjRKQkrO5Hwer2oA+LqmyltALvYUmlNFJmM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Q9om4Qf3PSQObKGboPBf0Ta+tPCUjQMgnHfFk2ii2PV1OIAXsDWTolnVCDE9cIptX
	 BcdIxDZsn5YOgpDDs8oswl0Mq47cawvTriRdGqTHsPuCnlQ56WIAr4uHIHGPSPihMT
	 Bm7xi3WEBrOQ5cVDRFCiEnpwtvFib7j7S0uwUcP8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453M2j2c015981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 17:02:45 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 17:02:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 17:02:45 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453M2jnu080573;
	Mon, 3 Jun 2024 17:02:45 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 3 Jun 2024 17:02:45 -0500
Message-ID: <D1QPZCIWWJOK.1SUMCYPNQHXTS@ti.com>
Subject: Re: [oe-core] [RFC] meson.bbclass: pkg-config vs pkgconf
From: Randolph Sapp <rs@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>,
        "Ryan
 Eatmon" <reatmon@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>, <cordlandwehr@kde.org>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
X-Mailer: aerc 0.17.0
References: <f709a2b1-450a-47ab-9438-577c8d5e6bba@ti.com>
 <648acd46523f9be85df778aa235d082312ead1ff.camel@linuxfoundation.org>
In-Reply-To: <648acd46523f9be85df778aa235d082312ead1ff.camel@linuxfoundation.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 22:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200286

On Mon Jun 3, 2024 at 4:22 PM CDT, Richard Purdie wrote:
> On Mon, 2024-06-03 at 13:02 -0500, Randolph Sapp wrote:
> > Forgive my ignorance, but is there any particular reason why pkg-
> > config is preferred over pkgconf for meson related recipes?
>
> Yes, as to try and mix both pkg-config and pkgconf would be a path to
> madness.

Fair enough.

> > It seems the two treat the usage of the PKG_CONFIG_SYSROOT_DIR
> > variable differently, resulting in issues when build scripts
> > attempting to use package config variables directly.
>
> Right, this is basically the problem. We have a long history of using
> pkg-config, we worked with upstream to merge sysroot support and it is
> the standard we built around.
>
> pkgconf then came along and decided it would be a great idea to have
> some slightly different behaviour. We did originally plan to have a
> switchable virtual/ provider but due to the differences in behaviour it
> doesn't work.
>
> Things are bad enough that there are two standards. Saying "if building
> with meson, it behaves differently again" would be a nightmare.
>
> I have been asked to switch everything to pkgconf however I suspect
> that would also involve carrying patches and would end up as ton of
> work to be incompatible with a different set of software. I'm therefore
> not keen on that either.

Also fair, I can understand not wanting to switch to a newer tool after spe=
nding
time to get sysroots accepted upstream. The virtual provider thing is doabl=
e
though.

Both pkg-config providers can be passed --define-prefix to yield something
usable to Yocto. It makes both assume the value of "prefix" based on the pa=
th to
the current package config file, which will work with current sysroot struc=
ture
Yocto uses. If that structure ever changes, though, this will no longer wor=
k. A
wrapper would be able to ensure both follow the standard.

> > If there's not an explicit reason we're preferring pkg-config, would=20
> > anyone be opposed to switching it out for pkgconf for meson related=20
> > packages? Of course, with a note about this behavior discrepancy. It=20
> > would reduce these Yocto specific patches and align meson behavior
> > with distros that currently default to pkgconf.
>
> Personally, I think it would just confuse things even more. xcb-proto
> might get used by meson or non-meson software. Mesa might get used by
> either too. Keeping it simple and saying "pkg-config behaviour"
> everywhere is simpler IMO.
>
> Cheers,
>
> Richard

Fair enough. Would the wrapper be a useful solution (if applied globally), =
or
would this be too much of a deviation from expected default behavior as wel=
l...

- Randolph

