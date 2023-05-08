Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80A6C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 18:33:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.116237.1683570796430654121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 11:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A188940C5D;
	Mon,  8 May 2023 18:33:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsgwgaEV6l3N; Mon,  8 May 2023 18:33:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48F2840A03;
	Mon,  8 May 2023 18:33:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 731EF1638C9; Mon,  8 May 2023 14:32:25 -0400 (EDT)
Date: Mon, 8 May 2023 14:32:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Martin Jansa <martin.jansa@gmail.com>, "afd@ti.com" <afd@ti.com>,
	"detheridge@ti.com" <detheridge@ti.com>,
	"reatmon@ti.com" <reatmon@ti.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] kernel-devicetree: allow specification of dtb
 directory
Message-ID: <20230508183225.GQ9226@denix.org>
References: <20230505163601.6708-1-rs@ti.com>
 <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
 <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CA+chaQfuTxjoqm8RJO6RARF031YEmBa2g3dZo_A0b5TX7XB9vA@mail.gmail.com>
 <DB5PR02MB102130440F80045AD512A1668EF719@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <b305b819-8772-61d0-5ec6-3e23fd190d62@ti.com>
 <175D3DFC66A1C041.2502@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175D3DFC66A1C041.2502@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 18:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181025

On Mon, May 08, 2023 at 02:18:57PM -0400, Denys Dmytriyenko wrote:
> On Mon, May 08, 2023 at 01:13:58PM -0500, Randolph Sapp wrote:
> > On 5/8/23 01:13, Peter Kjellerstedt wrote:
> > >That is most certainly a good alternative.
> > >
> > >//Peter
> > >
> > >*From:*Martin Jansa <martin.jansa@gmail.com>
> > >*Sent:* den 8 maj 2023 00:20
> > >*To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >*Cc:* rs@ti.com; afd@ti.com; detheridge@ti.com; reatmon@ti.com;
> > >denis@denix.org; alexandre.belloni@bootlin.com;
> > >openembedded-core@lists.openembedded.org
> > >*Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow
> > >specification of dtb directory
> > >
> > >or
> > >
> > >if "${@'true' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED'))
> > >else 'false'} <mailto:$%7b@'true'%20if%20oe.types.boolean(d.getVar('=
KERNEL_DTBVENDORED'))%20else%20'false'%7d>";
> > >then
> > >
> > >to avoid test as well (like systemd recipes is using) and I did
> > >here as well in:
> > >
> > >https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dj=
ansa/master&id=3De2a6da5202a6671113758f9746ddbd8141a75757 <https://git.op=
enembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&id=3De2=
a6da5202a6671113758f9746ddbd8141a75757>
> > >
> > >On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt
> > ><peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>
> > >wrote:
> > >
> > >    [ Outlook does not support commenting inline for HTML mails, thu=
s
> > >    I=E2=80=99m top posting=E2=80=A6]
> > >
> > >    The problem is `=3D=3D`, which is a bashism. POSIX shells (like =
dash)
> > >    only support `=3D`. When it comes to quoting, you typically want=
 to
> > >    quote shell variables in tests in case they are empty. OTOH, sta=
tic
> > >    strings without whitespace or other special characters do not ne=
ed
> > >    quoting. So the correct way to write the if statements is:
> > >
> > >     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if [ "${KERNEL_DTBVENDORED}" =3D false ]; then
> > >
> > >    (In this case it is actually a bitbake variable being quoted, bu=
t
> > >    unless you can guarantee it is not empty, the same rule applies.=
)
> > >
> > >    //Peter

<snip>


> > Ah, my bad. I need to figure out a way to get shellcheck to run on
> > bash blocks in bb recipes. Would save everyone some time. I'll
> > submit a V2 with your modifications Martin!
>=20
> No V2 - it already got merged into master. Moreover, due to this oversi=
ght, it=20
> defaults to "vendored" DT install in some builds, where bash is not the=
 system=20
> shell...
>=20
> We should merge Martin's fix from his contrib tree ASAP.

BTW, there are other nuisances with this change:

https://patchwork.yoctoproject.org/project/ti/patch/20230508181551.240414=
1-1-denis@denix.org/

Not sure how common the use of third level in KERNEL_DTBDEST dir structur=
e is,=20
maybe we should add a third level generic glob to OE-Core to be safe...

--=20
Denys

