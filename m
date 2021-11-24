Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCC1C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 11:53:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.5215.1637754814992992522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 03:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cr+66ilU;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 137so2069262wma.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=n3vIb7OSWN/lJqn0yJ+J8hcZs1rPLm6rJxwMzR3gGDU=;
        b=cr+66ilUNecFHoAl34AYdGNL42yY1sdLFIXaSDgiST4gPbwLaFnrVkxuj+aO84kPDe
         zJ7wjNt3LG5PrLlf34uaGbUBk/Z95mcsw6JIT8wt9/VA9x6LuVOaa1zb8OxrZCYQUhXw
         0H5GzC0/oUKNhosoIRL8MY3AnzQ8oDZlylcfxFY4ZPnLcc2mWr9G9DhuaE5Xu4B6zzjE
         K94QX2Ufqa54dirtfnKGIbnhMa4UX7G0wpQxCE+pxPqpfzx6+8/MgkR5rUIRVuUE7rXH
         YhRrGhCrv00Oy6NwSbhGmnKp0tHmkG+sgOrfzabz0bP9vE8ir40uhKWci28c6Qrk1Wbc
         XyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=n3vIb7OSWN/lJqn0yJ+J8hcZs1rPLm6rJxwMzR3gGDU=;
        b=Ab7bB6CDN/ZQAjsWyNA4tJTVDNcX7cPelMSY9vV42H8GiNQam9EYggRA4kIn5fyzdD
         UdxBfbFY0gnuw6b4bgfnFz9wRmU7NLQlGW4F9U6Q5JUmuwjLewrEPVVQjZwAGTmmV4RH
         eooAwb4hm4X6O5x8c4blm/X+d9iYGZaLUDRi+NKB/Y9dGKJhpVYrrcCkDjH+qaDZd8tP
         n34ePND4ZRDIQus5ubPJOj21+8D1GKaSej8G3nnaFWhtxnjupwvu3sHXQ/Nuk653NDw7
         yQBsBsEE4A51eW7qbAXyqlwmoZ/DePBSv4mML2REdxZ6U955GaMz5tk6PKmJXB1CqeuY
         Bk3g==
X-Gm-Message-State: AOAM533pgLOImWFmNiT1Fp7atMlaNPuauZuV1YHcHNW1mxSA1+PVDxMX
	nvy+9MyfsBrOkHK5AA8Swss=
X-Google-Smtp-Source: 
 ABdhPJzWOblgrF0Ig2to47tnie8JeMAcTbNnW8HlW9gHbWB0xJLi6AWWlER/SdPxABi+SearGO+tjA==
X-Received: by 2002:a05:600c:3ba5:: with SMTP id
 n37mr14346848wms.168.1637754813119;
        Wed, 24 Nov 2021 03:53:33 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 l3sm4280634wmq.46.2021.11.24.03.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:53:32 -0800 (PST)
Message-ID: <a1dabcfcecef7b217086447cf4d6c2b38a81b5a7.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Wed, 24 Nov 2021 11:53:30 +0000
In-Reply-To: 
 <AM9PR09MB4642AB2A320DD6BEDB0F835AA8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
	 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <b0ab6dd09c793181318adc5cc99127bd936b48e1.camel@gmail.com>
	 <AM9PR09MB4642AB2A320DD6BEDB0F835AA8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yu5L6+qPot8iTuxpmrXW"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 11:53:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158689


--=-yu5L6+qPot8iTuxpmrXW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-24 at 09:09 +0100, Konrad Weihmann wrote:
>=20
> On 22.11.21 23:47, Luca Boccassi wrote:
> > On Mon, 2021-11-22 at 14:57 +0100, Konrad Weihmann wrote:
> > > I have sort of a general question regarding this patch series.
> > >=20
> > > Last time I checked (and yeah it's been a while back) systemd-analyze
> > > wasn't self-containing, meaning it would have to have a running
> > > systemd
> > > process and at least a running dbus iirc.
> > >=20
> > > Is that still the case?
> >=20
> > That was the case only for some verbs - 'verify' does not need a
> > running instance. From v250 (next release) it will also be able to
> > operate on images/root directories.
> > The 'security' verb did need a running instance, but there's a new --
> > offline switch in v250.
> >=20
>=20
> Thanks for the background information.
> I kind of agree with the voices raised in the discussion so far.
>=20
> As the feature will be available only in a yet to be released version, I=
=20
> would propose to
>=20
> - wait for the release of systemd 2.50
> - build a native variant of the tools first
> - package only what is really suitable for "offline" use
> - add a nativesdk variant later on
>=20
> And I think there should be some demo patch to use maybe the analyze=20
> part in insane bbclass or so, so we could first of all see the actual=20
> benefit of it and even more important can easily track down future=20
> regressions.

As mentioned earlier, I have no use for 'native' variants and whatever
an 'insane bbclass' is, so I will not be spending several weeks to make
these things work, sorry. I've got no issue at all if you don't want to
take this series, it's absolutely fine, all of these changes can be
done via bbappend anyway. My experience of working with yocto software
is so horribly painful and time-consuming that I'm not going to spend
one minute more on it than I have to.

> BTW you said you tested this primary on dunfell, what kind of makes me=
=20
> think how these pieces fit together, as dunfell (likely) will never get=
=20
> the support for the tools mentioned

It's tested _only_ on dunfell. We forwarded the systemd recipe to v247
on top of it, and then additional patches including the ones for this
functionality are backported. It's very easy to backport them, if you
are curious you can see the whole tree here:
https://github.com/bluca/systemd/commits/dunfell-msft-247

--=20
Kind regards,
Luca Boccassi

--=-yu5L6+qPot8iTuxpmrXW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGeJ7oACgkQKGv37813
JB4irA//VzO4B78/uOM3/vyOIhLWFWyAdtDzsDOkTkoQWf7Ac3cG6ujGUl1AFhXF
mNeqAfGxXj09vgXiaqmBmZ/AQKn6YV2BwimfKJfQ1/msJMyTWeUw1w7y5hDq3mLS
X5hw3cQ4KwrG4eY09hy4zmoyOJuND2QgikkLA7rOjpF9y3n78bOVYfv0Pb0G8TG6
xrLZIN+EGt/DEtBUNqLFPfJ3gU3+ACsjN98Xh2LPIPbfbnNXuFqHaWZsRMjn6n87
V7PTDaMHOSEi5kRfl9I4KzCQpPRNHh2kOkNTVvKavpFvEGGtRTsnsevbMe+C4IMT
3wOG+dd1WH4REbkvhH1sttrAS89PtOY0y95lvzbdMEkOLQrBx/yGcot/2i8j8ydm
TPNcaFDNRhsTS3fKuYR6qTZK98fBvFLrWMeslv4XcUZtoyqAGAFIBzav8WIAklRh
rtfcMM4OCairmu6m6aWQfILmcnIe5jWYqb+qGiRYmVrQmOfk4h9iJL/V7UMiwMKp
nYXse099lGZUbs4Fklyua3tbZ1gW8Tv+3OQfZENaVMMJ+YftKgZt4cRQEW6SuSP+
znRgdU2PquLQCiRCmmVZFYa1fwWkXpb2L6ASUOYbTbTPCW+hh35cuKHJTqjxs4CP
ArlM/FknMniwDYBKgnqaexGNUTGhFHZzWmRvhZE4w49DsUeIODM=
=STvT
-----END PGP SIGNATURE-----

--=-yu5L6+qPot8iTuxpmrXW--


