Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1F4C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:04:06 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.web10.5464.1748610245029010165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 06:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=dvx2FDwW;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=rIpKEEeT;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.151, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 1ECEF1140153;
	Fri, 30 May 2025 09:04:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 30 May 2025 09:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748610243; x=1748696643; bh=c50RG1m2BZ
	zfmjmp7/4i0YSOcVEnF6vAcXgqFpM62Ho=; b=dvx2FDwWHtsJQ+F9WZhV1yiTEO
	iWJ1TaJYB/q/kqLK/6F5+HrLyXlCYsLo7NUyeeaUfv91q4IO4VJ8YwJFcF/QqR/H
	JhUpZp5E9Jp84enRigRJBzxqht0ArXwr+lUKV02YY21oG6MUYKZyN4xNMsy8Y37H
	VAJOr/tPn1eWBwS60dDk2OdLpThQsvvB+iFoUrydmIPThJTyamEwvWe8CPSwB8hY
	sL4q2uBU/JfD1X5GP448bCIi4zahxtop+ICmjBMpExUiDu9KcUdDouVvOUcAC100
	9ZnJbolbhrkm6gCIcxsO+tZJvGOHuZOvmNhAbOXADjHZxg4gfJN3s0TEF97A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748610243; x=1748696643; bh=c50RG1m2BZzfmjmp7/4i0YSOcVEnF6vAcXg
	qFpM62Ho=; b=rIpKEEeT7lI+ijrlsZhDttc3VZj9bWBWgBTmMwLKG4RCw3UcN6w
	fAjlQ8u4AnQb1ArCNY9MU+g43GZCWwW5jpL9h/Yf7bCgRWylQfcJF7k5vUKyyDM9
	By48rg3KbDvN1RVisVtkx6CS6Ihmz5s96QZ6Q0t24BSoMnC3VavtoQtaHEAA6PUX
	jh3XO40foc/KpTyfMGqm1jNLMHbxg7CRXeSokjIWPgBlwxf3SHaEV2kxJBd0RnHf
	PTDaUlKEl2Nk0F7BxYHWm47IfqpX055n5gkM8S9UCPP8C5Shgq9gceSL7ixU0phL
	GORBGpeDqoxyNHaORh/zS/WSJY8kfPJkOMg==
X-ME-Sender: <xms:w6w5aCoNjh-lqyyszde_ivANy3thxbkn9FQa0poaF7fsYvnwQGrIjw>
    <xme:w6w5aApz_eVb1O26KVztaKQDsVerapi7l2KTOtqAD7KFXY8CPLz129mA-Mi3FcjLa
    p0EBWGAHwoQP2g-5PM>
X-ME-Received: <xmr:w6w5aHNP3VI0IK-y9xNVu0rzvq6zAtDuC_ghc8m3K4J-6gsTqKgQjxJ6TEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledtkeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
    necujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrth
    hrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecu
    ggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffefueefveegjeekleegueejveevue
    efiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiiipdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehoph
    gvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdr
    ohhrghdprhgtphhtthhopehmnhhssehgohhmshhprggtvgdrtghomhdprhgtphhtthhope
    hmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhm
X-ME-Proxy: <xmx:w6w5aB6Sg1oD_JJBKFAiH785xDbIg4w7c5cyl1KBanlMmcdDCtG9FQ>
    <xmx:w6w5aB7vN7NAuwr5ACORosup1wtdR2JWXgrg0Zt4KQ0IDSnrRyOzsg>
    <xmx:w6w5aBhgNIQcMoQrZvqCVaUm1TgeJHHsKAQ34gWj55RTeJwdynN6OQ>
    <xmx:w6w5aL4LYDF1XZA8yIzp8Do9oCpqCT2_600ZnxrOl8M3nHS_Qfw8uw>
    <xmx:w6w5aGKb-XIwd0BXnMc3fANpRBUmPYxDVzSW5Rg5t1QWpL2rSXJydmYJ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 May 2025 09:04:03 -0400 (EDT)
Date: Fri, 30 May 2025 09:04:02 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Martin Siegumfeldt <mns@gomspace.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix postinst for real
 systemd-systemctl-native
Message-ID: <aDmswtbTZ-Yd_GsF@heinlein>
References: <20250528035625.1262266-1-patrick@stwcx.xyz>
 <CANNYZj_5Wbvx0p54pqvnpHuOAX+nhpQenZKzn1YEduDs=tf2ag@mail.gmail.com>
 <aDdoTVtCmElpURYD@heinlein>
 <CANNYZj90G4sbA7LY06DjmqXnnU9UQ=vMKD22XzcRHbvDu87m4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W8lTj35x7gJrKL/V"
Content-Disposition: inline
In-Reply-To: <CANNYZj90G4sbA7LY06DjmqXnnU9UQ=vMKD22XzcRHbvDu87m4A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 13:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217504


--W8lTj35x7gJrKL/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 01:19:25PM +0200, Alexander Kanavin wrote:
> On Wed, 28 May 2025 at 21:47, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > Walnascar is currently broken for template services and so is master.
> > My suggestion would be:
> >
> >    - Revert 7a580800db39 in walnascar.
> >    - Improve systemd_create_presets to handle template services in mast=
er.
> >    - [Maybe] fix all the services failing per Mathieu on master.
> >    - [Maybe] apply this change so that `systemd_postinst` runs
> >              as it use to.
>=20
> Thanks, I appreciate you digging into the issue.

Thank you for the feedback Alex.

> That said, the plan to fix it needs to be reordered. We have a strict
> policy of fixing issues in master first, for good reason. Also,
> backporting the fixes to stable branches is much easier to get
> accepted than major reverts like that.

Agreed.  I tried to do a simple revert locally and it had conflicts
already.  It was easier to just do the needful in
systemd_create_presets.

This is done and ready for feedback:
    https://lore.kernel.org/openembedded-core/20250529174427.2731440-1-patr=
ick@stwcx.xyz/T/#u

> Also, if something currently quietly fails in poky-altcfg (it wasn't
> entirely clear from your analysis), then the fix shouldn't just
> address the issue, it should also make any possible fail a loud and
> hard one. So it doesn't quietly regress again.

poky-altcfg does not currently fail (or fail to perform).
    - There are no template instances in any package in poky-altcfg that
      rely on the use of SYSTEMD_SERVICE.
    - The only template instance in poky-altcfg is created manually with
      symlinks (see `systemd-serialgetty.bb:do_install`).

This problem only affects template instances:=20
    SYSTEMD_SERVICE =3D "foo@bar.service" # Template instance
    SYSTEMD_SERVICE =3D "foo.service" # Non-template instance

Prior to 7a580800db39, template instances listed in SYSTEMD_SERVICE
would have been enabled by the systemd_postinst hook that called [fake]
systemctl.  After 7a580800db39, the systemd_postinst hook silently
skips.

Prior to 7a580800db39, non-template instances listed in SYSTEMD_SERVICE
were enabled by systemd_create_presets files (and also duplicatively
enabled by systemd_postinst).  After 7a580800db39, non-template
instances are enabled only by the systemd_create_presets.

With my change linked above, the template instances will be enabled by
systemd_create_presets as well.  Thus all instances (template or not) will =
be
handled by systemd_create_presets, and the systemd_postinst hook only has
effect when installing via an RPM and not when building a rootfs.
entirely.

--=20
Patrick Williams

--W8lTj35x7gJrKL/V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmg5rMAACgkQqwNHzC0A
wRlpbA/9HEY8HWbU3PH2IXCpKvzALWZP+sismV+Xc1/I579uzXsH8e9eee/gFLhk
WSVcheosSt0kg9q1oZQ7PbuUbaEdZPDkK/uxJTc8cd7h77Obs4vkfZ+Cup52jYVC
HXtzdx/fsRZmb6BFqCYc+R9CsbC+Z6hfRDGskNRm+IbyQuJGfLlDnsGq3+56LGkk
8jcFj1sgRlCG2BJNVg5O4itQujBGuayKvuHzrV9vyeB7zwmXB5qnLN+ROB5j2j21
camJ+MtW7UjiZewvTMR4CfKv58GSV0n1A0PQWfaQNO8Zb5pZUP3k3i5V8cqNqPpc
mLVmExqMtYoniXAfJObDY7bSQPkZeXVxEJt0aqPLYfwBugm4+FM3Z/HgULE+1IH+
5/UWg8FyGommcvI2MfQqKmWajBhoDjHzubOGQI1IMhhHHrFdClt5jrAfLtLp0SZH
XRI1+5wc/SvCIpI994m7v7Ao2A0OFwSJrrdIYEYKpi0JrhDxRTnkO72weoEO5N87
Uv16xAK7KovPRUA02kjzEkZXDtt/fPTQbfRMfS2BAzJziSaFkfMGGj+/L0f/xSyq
Sphe3fBAHtbOFZvPHuvEOMYVet3VeCMJ8m/IBbXXsr18Vs8tOh6wrtacnqRlthVq
d0fUVEWhdspDh5oEEWffOg8qv7lZhARLW15SZavTBqvL2DvXtao=
=4EL/
-----END PGP SIGNATURE-----

--W8lTj35x7gJrKL/V--

