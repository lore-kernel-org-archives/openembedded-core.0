Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DB1C0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 22:31:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.39781.1737930706665844004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 14:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RD9OUikJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso30434105e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737930705; x=1738535505; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L8J2Qwkh6XWLuLZNEyS+KqQ9Qil1166VyOPLP6rAQ+4=;
        b=RD9OUikJES98WLm0lUQVvPMz4ftxknvXzqU2nk/5rLb9Gng24e5MoSBw9/xuphDs8N
         l576BtplVZVy7p6/vo2rTBIVflwQ1n2L9A5GlnMr46aos2qRbLz896HP8ZDP0qRFqoCr
         b4erlJPgGpwbzft6aTzNzilxM3MqQIvSujj4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737930705; x=1738535505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8J2Qwkh6XWLuLZNEyS+KqQ9Qil1166VyOPLP6rAQ+4=;
        b=AvzXkNZikI6vrrK7kdKBkVlmU6WYcd0gQH3VbcG2sg/VhoDrAJHKUIHT1ITmdEToX+
         42uNmG4jDGDoYERWhShLRh2a164IQn/ntZakC32yWvsW4mOEpVoJwQ4GAgxqhlxVkdek
         /TGB07UBr9/GZsYEMMELhOWCj8Ri/jJEmSzJa8cy0IdGba7DAX5qORnsdzYYyyemKwxN
         kUTt5IcT8RrqV7At16VjWuYzfkt8Cmpi+hRu+Sadj3x9WnlYH01da2trM9FBdyNT4z27
         Sj+N/5ysIu3k6S9sgzo+07KUH/5iz0/9keHN0cGYeZ38vdHBmaBHaeMIk0MDM57Kmtqp
         4X4g==
X-Forwarded-Encrypted: i=1; AJvYcCX1gaF+DDYvM50XLhaAlCMLc7cSyeX0W5uLjaXipAQhhAg9+ToQYWU35ubIWT9IwqvLmO3klmMsThoG1H7F0e9DDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaXkEvBYE3Yu+Ju8wmEinOK8SHKKPqEOdqe8Gm3GkoPVk6zNDj
	Hd8FuJ7TXJIafLtad9cqBTBJFPwbiNCJLsVPQ32LEHmEfbFQbZoEOXHqVuIgYtM=
X-Gm-Gg: ASbGncvlRFfCE5gJG358Qa3WSKaFLAm52xwSmGSAzBaP2DjfE0p3jrD/om5y7+i9vgR
	u8vu+2zIa6sDmye3MjeDGkM2ZnHcugORiv5pI4NtsFnbsbiSgqutQt4tt38xOHfo20LidrP/VC7
	LaFEGCT/ry46HJZQ6LnQGMbwUDkyg9sWLudmUf22rgFk3mueqSIc/oLsgC9s0+Ut1kXcSQQLN0v
	vQr/KMoCV/o1exhGQy8Rjd21vV6AI8C1km4hFNStfq1BnRIvAyw6O4gTL7eEFjgwXScNK8oE1qd
	Hm23R6eDoz6WYVYeO0XZbTC2n50NLXHnRGoZRy/y88Vw2e0FDYvwdxY++y39tYiatSQ=
X-Google-Smtp-Source: AGHT+IHOHT6v0EyS5vMxgU8JxrSbbxRgwAcgpOMiJAUQ6/U7Ob9EXmROQv57CcX1YxJbhC8eNJHC9w==
X-Received: by 2002:a05:6000:2a8:b0:38a:49c1:8345 with SMTP id ffacd0b85a97d-38c2b7c189emr8879290f8f.18.1737930704912;
        Sun, 26 Jan 2025 14:31:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6905:4568:b67b:291? ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb062sm9157564f8f.71.2025.01.26.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 14:31:44 -0800 (PST)
Message-ID: <6d440dedaa447a307ff33d9fb91cecee1b7196a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: drop net-tools from defconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Andrej Valek <andrej.v@skyrain.eu>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 26 Jan 2025 22:31:42 +0000
In-Reply-To: <0653df9c29975d272096a6eb5ced3f724de50942.camel@pengutronix.de>
References: <20250126115104.1148761-1-ejo@pengutronix.de>
		 <f62ca5e64bb174608d33f2f88c45da1c70830c93.camel@linuxfoundation.org>
	 <0653df9c29975d272096a6eb5ced3f724de50942.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 22:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210296

On Sun, 2025-01-26 at 21:30 +0100, Enrico J=C3=B6rns wrote:
> Am Sonntag, dem 26.01.2025 um 12:58 +0000 schrieb Richard Purdie:
> > On Sun, 2025-01-26 at 12:51 +0100, Enrico J=C3=B6rns via
> > lists.openembedded.org wrote:
> > > The 'net-tools' have been deprecated 15 years ago! [1]
> > > Let's remove their busybox pendants from the defconfig to prevent
> > > people
> > > from accidentally starting projects with ancient technology.
> > >=20
> > > [1] https://lists.debian.org/debian-devel/2009/03/msg00780.html
> > >=20
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > > =C2=A0meta/recipes-core/busybox/busybox/defconfig | 10 +++++-----
> > > =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > I did a quick grep of OE-Core and we still have a handful of sites
> > using this on target, particularly but not limited to our QA, the ones
> > that caught my eye:
>=20
> thank you for looking into this!
>=20
> Well, not that I hadn't done a grep before. =F0=9F=98=89
> I looked through the occurrences of 'ifconfig' but concluded that startin=
g with disabling it for
> busybox could be an initial step that should not break most setups. But n=
ot sure if I was too
> optimistic..

The udev/initramfs and some of the QA references do worry me a bit.

> I started working on a few patches to address occurrences of ifconfig, bu=
t I ran into challenges
> with testing my changes. I decided to send this patch on its own, hoping =
it doesn=E2=80=99t break the
> autobuilder, and also to check if there are any objections to removing ne=
t-tools in general.

I don't see a problem with switching the references over and
personally, I think we'll need to remove net-tools but one step at a
time I guess.

I think what I'd suggest is sending a series of what you have removing
the references you can. We can then test that on the autobuilder and
see what it shows. Please just make it clear you're asking for help
with testing. Copying Mathieu as he may be able to help.

> I've now had a second look to see what could be affected by the busybox c=
onfig change.
>=20
> > meta/recipes-core/udev/udev-extraconf/network.sh:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE
>=20
> Wasn't sure about this one but it seems to be used by the initramfs frame=
work and thus probably with
> busybox.

Right, that was my worry.

> -> Probably affected. Might make sense to replace it with ip anyway.
>=20
> > meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaste=
r.txt:=C2=A0=C2=A0=C2=A0 $ ifconfig
> > meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaste=
r.txt:=C2=A0=C2=A0=C2=A0 $ ifconfig
>=20
> Documentation that hasn't been touched since 2016.
> Also, the commands mentioned there are for the host machine commands.

Agreed, those ones aren't a blocker.

>=20
> -> Unrelated. ifconfig could be easily removed here, though.
>=20
> > meta/recipes-core/busybox/files/simple.script:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /SBIN_DIR/ifconfig $interface 0.0.0.0
> > meta/recipes-core/busybox/files/simple.script:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /SBIN_DIR/ifconfig $interface $ip $=
BROADCAST $NETMASK
>=20
> Both are guarded by 'if [ $have_bin_ip -eq 1 ]; then' and should also wor=
k with iproute2 equivalents
> though.

Good, I didn't check that, I was just trying to see what references we
had left.

> -> Related but no need to fix. Fallback could be removed maybe.
>=20
> > meta/lib/oeqa/selftest/cases/devtool.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D runCmd('PATH=3D"$PATH:/sbin=
:/usr/sbin" ifconfig -a', ignore_status=3DTrue)
> > meta/lib/oeqa/selftest/cases/devtool.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest(=
'Failed to determine if tap devices exist with ifconfig or ip: %s' % result=
.output)
>=20
> This is fallback handling for missing 'ip' on the host.

Ok.

> -> Unrelated. Could be removed anyway maybe (already had a patch for this=
).
>=20
> > meta/lib/oeqa/utils/qemurunner.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cmd =3D "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
>=20
> This I had overseen and it actually seems to be called on the target.

Right, that one does seem potentially problematic. I didn't look into
which set of runner options trigger it though.

>=20
> -> Probably affected and should be changed.
>=20
> > meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.target.run("ifconfig eth=
0 | grep 'inet ' | awk '{print $2}'")
> > meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.target.run("ifconfig eth=
0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 =
down" % (virtual_ip,virtual_ip))
>=20
> I had made a patch for this but did not figure out how to run this test o=
r if it is actually used by
> CI.

I'd guess a "bitbake XXX-image-XXX -c testimage" where the image
contains connman?

> -> Probably affected and needs more research.
>=20
> > but there are others too. We probably need to finish resolving these to
> > other commands before we can turn this off.
> >=20
> > If you aren't able to help with that, we should at least have an open
> > bug to sort it out.
>=20
> I'd try to address the potential issues first.
>=20
> Another challenge would be to remove the actual 'net-tools' package becau=
se ltp=C2=A0
> still seems to rely on it (with explicit RDEPENDS).

I'd guess there are tests in ltp which call ifconfig and friends?

> But we could start with removing it from packagegroup-core-{base-utils,fu=
ll-cmdline}.bb IMHO.

Yes, definitely agreed.

> Do you have an opinion about the host tooling? Could we drop net-tools he=
re, too?

If we don't need it anywhere now, I'd be fine with that.

Cheers,

Richard

