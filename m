Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103BFD3ABFF
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:20:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.86688.1731417623721195896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tAqoe-0001T9-9i; Tue, 12 Nov 2024 14:20:20 +0100
Message-ID: <60716348d2a4c699ec70bfb4358b3e0d9f4b2fc9.camel@pengutronix.de>
Subject: Re: [OE-core] bitbake.conf: require lz4 instead of lz4c
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>, jsbronder@cold-front.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 14:20:19 +0100
In-Reply-To: <CANNYZj9Rmrpucd1mtj7jCkPa1b-GS+r5ZJtjS6-A82XjxYw0Kg@mail.gmail.com>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
	 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
	 <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
	 <CANNYZj9Rmrpucd1mtj7jCkPa1b-GS+r5ZJtjS6-A82XjxYw0Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207048

Hi Alex,

Am Mittwoch, dem 06.11.2024 um 17:03 +0100 schrieb Alexander Kanavin:
> Can we rather make the affected recipe depend on the native tool rather t=
han the host one?

we could and I agree this would be the more correct way.
The only concern I have is that this would require adding dependencies for =
all potential compression
methods currently supported by barebox (lz4, lzo, gzip, xz).

Or I have to add some more pseudo-PACKAGECONFIG options and enable only lz4=
 by default.
However, I fear that this would quickly result in accidentally using the ho=
st tools again.
Not sure if there is local way of filtering out allowed host tools?..

> And pls file a ticket with barebox upstream or maybe the maintainer can r=
espond right here.

Thankfully, Justin already contributed the fix to barebox upstream in the m=
eantime and as far as I
can see, it was quickly merged and should thus be part of the November rele=
ase.

Regards, Enrico

> Alex
>=20
> On Wed 6. Nov 2024 at 16.52, Justin Bronder via lists.openembedded.org
> <jsbronder=3Dcold-front.org@lists.openembedded.org> wrote:
> > On 06/11/24 07:50 +0000, Richard Purdie wrote:
> > > On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via lists.openembed=
ded.org wrote:
> > > > With bitbake commit 'bb: compress: use lz4 instead of lz4c' we requ=
ire
> > > > lz4, not lz4c [1].=C2=A0 Going as far back as Ubuntu 16.04/Fedora 2=
5, they
> > > > are packaged together so it should be safe to simply adjust the
> > > > requirement from lz4c to lz4.
> > > >=20
> > > > Note that the two are largely the same, but upstream has considered=
 lz4c
> > > > deprecated since at least 2018 [2].
> > > >=20
> > > > 1. https://git.openembedded.org/bitbake/commit/?id=3D907472034b344e=
4eb73cfd43059a413469f52e1c
> > > > 2. https://github.com/lz4/lz4/pull/553
> > > >=20
> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > ---
> > > > =C2=A0meta/conf/bitbake.conf | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index eda505c861..14e761e2e7 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -517,7 +517,7 @@ HOSTTOOLS +=3D " \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 [ ar as awk basename bash bunzip2 bzip2 ca=
t chgrp chmod chown chrpath cmp comm cp cpio
> > > > \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 cpp cut date dd diff diffstat dirname du e=
cho egrep env expand expr false \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getconf=
 getopt git grep gunzip gzip \
> > > > -=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4=
c make md5sum mkdir mkfifo mknod \
> > > > +=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4=
 make md5sum mkdir mkfifo mknod \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl=
 pr printf pwd \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink real=
path rm rmdir rpcgen sed seq sh \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sha5=
12sum \
> > > >=20
> > >=20
> > > This caused a failure in barebox:
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/l=
ogs/stdio
> > >=20
> >=20
> > I see, sorry about that.
> >=20
> > What would be the recommended path forward?
> >=20
> > - Add lz4c to HOSTTOOLS_NONFATAL so it's still symlinked.=C2=A0 This wo=
uld fix barebox and any other
> > recipes that still depend on lz4c on distributions where lz4c is still =
packaged but leave others
> > without an early warning system.
> > - Submit patches to barebox and others to use lz4 instead of lz4c.=C2=
=A0 This is probably more
> > correct but will leave Tumbleweed unsupported by default with other dis=
tros to presumably
> > follow.
> > - Convince Tumbleweed (and others) to continue packaging lz4c.
> >=20
> >=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

