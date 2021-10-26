Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E65C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:32:34 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web08.13940.1635262353501047841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48] (unknown
 [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB3521F426FE;
	Tue, 26 Oct 2021 16:32:31 +0100 (BST)
Message-ID: <83e703f86472f188406fa1f6004aca66ffb0ff0a.camel@collabora.com>
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
From: Martyn Welch <martyn.welch@collabora.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Konrad Weihmann
 <kweihmann@outlook.com>, OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Oct 2021 16:32:29 +0100
In-Reply-To: <c8a699291831478184b420e37a2b10ee@axis.com>
References: <e133da623f5a357c570efc036daa84098dbc691c.camel@collabora.com>
	 <63d5cd9f7264871df79099b1831d5a8a85ca34b1.camel@collabora.com>
	 <AM9PR09MB46428E00E810D2C55427FBA7A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <c8a699291831478184b420e37a2b10ee@axis.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157398

On Tue, 2021-10-26 at 14:59 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> > Sent: den 26 oktober 2021 13:24
> > To: Martyn Welch <martyn.welch@collabora.com>; OE-core
> > <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add
> > default
> > IMAGE_QA_PROHIBIT_PATHS variable
> >=20
> >=20
> >=20
> > On 26.10.21 13:21, Martyn Welch wrote:
> > > Note to self - remember to reply to list...
> > >=20
> > > -------- Forwarded Message --------
> > > From: Martyn Welch <martyn.welch@collabora.com>
> > > To: Konrad Weihmann <kweihmann@outlook.com>
> > > Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add
> > > default
> > > IMAGE_QA_PROHIBIT_PATHS variable
> > > Date: Tue, 26 Oct 2021 12:12:11 +0100
> > >=20
> > > On Tue, 2021-10-26 at 12:56 +0200, Konrad Weihmann wrote:
> > > >=20
> > > >=20
> > > > On 26.10.21 12:50, Martyn Welch wrote:

<snip>

> > > > > +# IMAGE_QA_PROHIBITED_PATHS
> > > > > +# Ensure images aren't including files in places that will
> > > > > be used as mount points or that are
> > > > > +# reserved for runtime data.
> > > > > +IMAGE_QA_PROHIBITED_PATHS ?=3D
> > > > > "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/*:/tmp/*:/var/run/*:
> > > > > /var/tmp/*:/var/volatile/*"
> > > >=20
> > > > I like the idea, but wouldn't make more sense to do that on a
> > > > package
> > > > level, as here the user is more or less left alone in guessing
> > > > where
> > > > the file actually does come from
> > >=20
> > > I like that idea, however it would make to assumption that there
> > > wasn't
> > > any tweaks being made as part of image generation that would end
> > > up
> > > violating this. A quick check suggests the "build-appliance-
> > > image_15.0.0.bb" image does this kind of thing in the core image
> > > types.
> >=20
> > As Alex just wrote, I might be beneficial to do both
> >=20
> > > Martyn
>=20
> We have an alternative solution that hooks into the package QA. It=20
> focuses on directories that are supposed to be empty. In addition to=20
> failing the build if there are files in such a directory, it also=20
> allows to specify for each directory why it should be empty. We have=20
> used this, e.g., to mark common directories that have been renamed=20
> to give an indication of where the files were supposed to have been=20
> installed.
>=20
> Do you want me to generalize this and send a patch for it?
>=20

Hi Peter,

It would be great if we could merge these approaches, i.e. have one way
to specify directories that need to be empty and test both as part of
package QA and also image QA.

I was just working on adding some package QA support to what I've had,
but can pause that.

Would you be able to provide show how you'd propose managing the
prohibited directories? I'll try and tweak the image QA stuff already
posted to fit that.

Martyn

> //Peter
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157397):
> https://lists.openembedded.org/g/openembedded-core/message/157397
> Mute This Topic: https://lists.openembedded.org/mt/86599458/6512429
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martyn.welch@collabora.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


