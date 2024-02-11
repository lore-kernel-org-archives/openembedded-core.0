Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EF7C4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 13:06:08 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.36501.1707656760350322142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 05:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=q/E1VZmB;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9CC49240027
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 14:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1707656758; bh=xdVcaftwH8b8cprMpfHqY2nOpNKqiCcJKZjoR1d87wA=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=q/E1VZmBR0zji5AWmNOnPovOnpDoGDGRe3DghtpW5KgCgc1Hmp0Ho2ZJGGJUj7fXh
	 6P5OoeLp1SnpQd/OBBL6NU3ywv8+xEUgCWSbxG5vnNnqwWcvKx3l4UpNUYnBxwtUzy
	 F51xZ8XRPbKVeX3RlwmY7wyWDOcu2xPoH4h+rXs5/AA/PZpA6I/u34P08RtczqGD0+
	 m43DUcKldwAKud6Yo33l0oN448HG4WuRXPzhVlP0q7djwCtbrsQz3oQAReKpR2AYZM
	 9/Z5wiFfFSPAuUECn3OdmN2rEVkdL8YSaJangkLRdrteMedvkwh9P/sc5RHnD8WG78
	 hGhZ/Mp4+G8bg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TXns13XKTz6tvy;
	Sun, 11 Feb 2024 14:05:57 +0100 (CET)
Message-ID: <cc8af6643d90dee131a5d1ac8d1907d926570092.camel@posteo.net>
Subject: Re: [OE-core] why does cpio recipe RDEPENDS on ptest-runner?
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Feb 2024 12:59:56 +0000
In-Reply-To: <4deb850-6761-e375-ab3d-b1f8c2cc23@crashcourse.ca>
References: <4deb850-6761-e375-ab3d-b1f8c2cc23@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 13:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195290

On Sun, 2024-02-11 at 06:52 -0500, Robert P. J. Day wrote:
>=20
> =C2=A0 in the midst of writing a ptest tutorial for some colleagues and
> wanted to embellish it with live examples, and noticed this in the
> cpio bitbake recipe:
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended=
/cpio/cpio_2.15.bb#n69
>=20
> this is the first recipe i've seen that actually *needs* ptest-runner
> as a runtime dependency. why is that? i always thought ptest-runner
> was entirely optional even when using ptests.
>=20
> rday
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195286):
> https://lists.openembedded.org/g/openembedded-core/message/195286
> Mute This Topic: https://lists.openembedded.org/mt/104292535/8071792
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.wei=
ss@posteo.net
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
Hi, this is a special case. cpio ptest runs not under the root user but
under the ptest-user.=20

This user gets created in the ptest-runner recipe=20
 grep -i useradd ptest-runner_2.4.2.bb
inherit useradd
USERADD_PACKAGES =3D "${PN}"
USERADD_PARAM:${PN} =3D "--system --no-create-home --home / --user-group
ptest"

Hope that helps,
Simone

