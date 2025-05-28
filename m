Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D15C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 03:38:55 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.web10.7908.1748403531027912288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 20:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=ApDtYQym;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=KAz870bF;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.153, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2CE101140119;
	Tue, 27 May 2025 23:38:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 27 May 2025 23:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748403530; x=1748489930; bh=NAtJ7Nkv+O
	3UOh7we2rc4vJhF8K1MPh6MoDHQH4xOic=; b=ApDtYQymYdVYJ56QJMEMyg7aIA
	iAGHyjwTz3vbMf9MntpH9OTWrNSoElzg0/aCNvHb/g9k2SThayeLtaDODZzk8UbG
	3PrQ03Q4HT/FDsvf8x2+J8fdQMgXfXLKffl2B+lY+U40+Z1PgYkY/lyMD+24jCHV
	dpZvGQc+u+dR6Y7yn0VD4yLXrm/LuxjuwL23BI/iKpOnEIlIrfNNQeBnC31Cn2Y6
	6SQQkz+99waZ/pqRUgmqCL2OELcy0msBU4Eect2u9pm0L/Ap+YQvNrEjVP3EmrYH
	xy/WfWCzeZ1lsXWfsr+FFot3Bf35bNa4bAZy7sRbUfkdAj8to+OmgTRGQoyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748403530; x=1748489930; bh=NAtJ7Nkv+O3UOh7we2rc4vJhF8K1MPh6MoD
	HQH4xOic=; b=KAz870bFE1pzCplrmnmdo7m11yeNEnMVKi+RnRLMagx5ml+X2Cy
	qDM6fig0yPQGYvztowUp8k2yHKAcnPwJjsySLi0whYNSss+1LqL62c1z2PVaDrgw
	vB3Wu/ZvrBJ84gdX2/35oBAZZZMQEN0mqOEr4oMsmV7Qr8ghklvmc+5D494xCPYZ
	K5JGGwkYNZu+EoFG4KNs3TCuWjW2g0nCSVBoxjm4zLVQafDxFAVeo3oDudSTg4Pr
	e0h5xuiJwwlgY99Xe+HSeSvjy0ep9hEAEtM5MSsOOvDXNiaLVg8Ma491YV69SqFJ
	UXmPMunSS4kI258mz51YP+GsDXvyQFQhjPQ==
X-ME-Sender: <xms:SYU2aE_xPHOcEjOSo7ktWwCEDIDyKhY4jfgjAkc-ptrnxFYMWL9Nug>
    <xme:SYU2aMvUiRDrlq-bJAgiqazCQeBToJgVWu0Hqo0ZyJxSV9N9x1m2_t7YonH9Cs-8N
    7ZsMXOkKwU5IU4uYgA>
X-ME-Received: <xmr:SYU2aKBUYgyWAaWKcUTwvv0G1zT1uvfNbu0IUIcjT4ICBnQkFsi_Z2SB5DY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvddvtdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
    necujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtvdenucfhrhhomheprfgrth
    hrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecu
    ggftrfgrthhtvghrnhepkeduvedtkeeiiefhteejkedvvdetjeegueelfeektdevhefhvd
    ffvedtueehheetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiiipdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtph
    htthhopehmnhhssehgohhmshhprggtvgdrtghomhdprhgtphhtthhopehophgvnhgvmhgs
    vgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:SYU2aEc0Saah2gMexWbnmJduF7ucP0rpM5FRgAZQTVkG4tODekU-2g>
    <xmx:SYU2aJPQ2pH93kdEVnFs4MDD6SWX4yc6i3RW89TvvVRLjU1_1rEnXA>
    <xmx:SYU2aOl8-fOftaDYpOAKQdfWgDQb1BB7PBZj__Ql4K68TBi8_IQcRQ>
    <xmx:SYU2aLsW3a594TQbI304VJu81eZfPAD1YlQ1_ZuoiBR58gtia45nyg>
    <xmx:SoU2aM8fqo13cud06qQJhaUksdBpWAUKoHY3nLVcAhvRcu1EgQEJTlqn>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 23:38:49 -0400 (EDT)
Date: Tue, 27 May 2025 23:38:48 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: mns@gomspace.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Issues enabling systemd template service using
 WantedBy construct (Styhead -> Walnascar)
Message-ID: <aDaFSOfqodNDGXUV@heinlein>
References: <Z2ch.1747051947055246176.oktf@lists.openembedded.org>
 <CANNYZj_Fs1-_RHJgojgKPkobKe1eOCK4iwWGSXf+b1kuYr8O=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6OIdSerd+Wpi+0j"
Content-Disposition: inline
In-Reply-To: <CANNYZj_Fs1-_RHJgojgKPkobKe1eOCK4iwWGSXf+b1kuYr8O=Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217331


--A6OIdSerd+Wpi+0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 02:19:14PM +0200, Alexander Kanavin wrote:
> On Mon, 12 May 2025 at 14:12, Martin Siegumfeldt via
> lists.openembedded.org <mns=3Dgomspace.com@lists.openembedded.org>
> wrote:
>=20
> > As mentioned, it appears to be a regression during the styhead -> walna=
scar development. I notice that the systemctl-native is now built from the =
systemd sources - is this correct? Should I consequently report this throug=
h systemd?
>=20
> Yes, we've transitioned to using systemd's implementation rather than our=
 own.
>=20

I'm running into this same problem and I think there is a serious flaw
with walnascar / master.  We are using IPKs and what is happening is
that the `postinst` is not running correctly.  The `systemd_postinst` is
where all of the unit files are enabled (based on the SYSTEMD_SERVICE
variable).  If this doesn't run correctly, the image is missing all of
the default enabled services and templates.

The `systemd_postinst` has a guard "if systemctl >/dev/null 2>/dev/null"
and if this fails, none of the unit file enable code is ran.  The thing
is, `systemctl` will always fail because it by default is the same thing
as `systemctl list-units`, which needs to access the systemd bus
connection.

I modified systemd.bbclass as follows:

```
 systemd_postinst() {
+systemctl || echo "It failed for some reason"
 if systemctl >/dev/null 2>/dev/null; then
        OPTS=3D""
```

After this, my `log.do_rootfs` is full of:
```
Failed to connect to system scope bus via local transport: Operation not pe=
rmitted (consider using --machine=3D<user>@.host --user to connect to bus o=
f other user)
It failed for some reason
```

I think there needs to be some change in systemd_postinst to run
something other than the equivalent of `systemctl list-units` to
determine if the executable is valid.


--=20
Patrick Williams

--A6OIdSerd+Wpi+0j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmg2hUYACgkQqwNHzC0A
wRmZBA//Q0VsbDEnMSGVOxby5SCVQxyVJsSTu5WUHejUpY53eAKIT8QHM5AX43pD
gjvzoyAbxI8s4D9sJQNZWRypVFh3OaGQmkJGmmUS8sRAmTQ0VjUXtarXLmY8HB3r
fNQWUv+9gTBTUK6nZUE+Kdog9nHhfUu4qEMOPsucYFYrB/M7lRd0f3o35GIVWTEa
VuMfyf+n1IOII/2o9539pL8XC0gjWkDtXBoxaJxWpbl8ZIpUg78oTuFasr/uxXid
t6/R4Jk7JO5GHub+QbPZAimyw1pfT3gHmAx1rOtgXU24RrqAGJvMUq2on5m/iLQC
4qxVQOZ3RnUDc/ZM5LM4U6xkqFscbNNrs4bOeJW9V6MO4dNW6I/ovVUNMQsv0F/+
47DG6sbfDV8dINr6gxIqJ5rJ5mUupqPfX3glAQYSbrw6LqwbJEk7leFalA6hm/2g
5JglssYJj5dbAnagEdaqZhClMjnsk26Dl9JWr+bur4+ox12T6/YVscwhZmGiGZI4
YBxsBQEDJjsid6AGNt9nO2jYcNGTSY2YWEF0a8nIq/+OwZ7dzBxdhd5K9pQ4bdnf
cOpfVrUoaNmxZyt4TYLgHlvkYCxYB82jsriYpTgLZ28cSdj/yEwBIoE7adjGdIvH
eY4SW8gqCmE8iSG9/EKjrSuIIlvf5DRde8FYhSgF7Ehae7qDzsw=
=Q5QZ
-----END PGP SIGNATURE-----

--A6OIdSerd+Wpi+0j--

