Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50513C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 21:55:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6513.1717451711150722706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 14:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IWvGvdq7;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453LsuBf026963;
	Mon, 3 Jun 2024 16:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717451696;
	bh=jQnIavSDurfLrRu+oe1bbTkrKCFtMLvxuIJtlaxtVv0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IWvGvdq73QVwRjRPlPiIV4FJJkW6OzTDUC8NGnTjovwOU8X97J/hL9e9zDoz01LvY
	 7ScRWBsG8Hv0xcI5A6/6XzU719bQ01dVQ6BS4SRCh+keJqLBqVdaOlwqz5gMjwj+9+
	 12lnC3iL8rwL/aZxfXXUS9iGvyTcM9SUGlclqf/k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453LsuuO091817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 16:54:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 16:54:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 16:54:56 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453LstOE021950;
	Mon, 3 Jun 2024 16:54:55 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 3 Jun 2024 16:54:55 -0500
Message-ID: <D1QPTD0XR4C7.2WPS6QVDDILYQ@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Marko Lindqvist
	<cazfi74@gmail.com>
CC: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>,
        Ryan
 Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <cordlandwehr@kde.org>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
Subject: Re: [oe-core] [RFC] meson.bbclass: pkg-config vs pkgconf
X-Mailer: aerc 0.17.0
References: <f709a2b1-450a-47ab-9438-577c8d5e6bba@ti.com>
 <648acd46523f9be85df778aa235d082312ead1ff.camel@linuxfoundation.org>
 <CAF6bG8ePV1ti4E91k9=0RFZ5_i=OCHStde0few-qR+MKadQWvQ@mail.gmail.com>
 <43bdffe76547583062c308a8dc2474eb4365d474.camel@linuxfoundation.org>
In-Reply-To: <43bdffe76547583062c308a8dc2474eb4365d474.camel@linuxfoundation.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 21:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200285

On Mon Jun 3, 2024 at 4:37 PM CDT, Richard Purdie wrote:
> On Tue, 2024-06-04 at 00:32 +0300, Marko Lindqvist wrote:
> > On Tue, 4 Jun 2024 at 00:22, Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >=20
> > > Keeping it simple and saying "pkg-config behaviour"
> > > everywhere is simpler IMO.
> >=20
> > =C2=A0Do you think that pkg-config will still gain livelihood? I've
> > considered it a dead project for some time now. I was about to check
> > how many years it's since the latest commit to their repository, but
> > the repo URL from freedesktop site now gave 404.
>
> It hasn't really needed to change to be honest. I do agree the 404 is
> worrying and it has been a long time since there was a release.
>
> The trouble is, who wants to take on chasing down all the bugs and
> pushing changes to all the upstreams that will need patching? In
> general people fix a small corner of the problem then get
> bored/frustrated/distracted/whatever and move on to something else, not
> that I blame them. This isn't a conversion we can half do, it will end
> up as another flag day :/.
>
> Cheers,
>
> Richard

Don't worry about the 404. The freedesktop gitlab in in the middle of a
migration. The project is still alive :)

- Randolph

