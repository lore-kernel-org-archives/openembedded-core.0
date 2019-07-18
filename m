Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 484927BD72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:13:28 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1ho4Ll-0007kD-2P; Thu, 18 Jul 2019 13:13:25 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1ho4Li-0008FA-Al; Thu, 18 Jul 2019 13:13:22 +0200
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
	<6rlfwx2atq.fsf@pengutronix.de>
	<5fc8a130cfb17be80c146dec31ab5ffd71eea247.camel@linuxfoundation.org>
	<20190718061948.GB27459@localhost>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Adrian Bunk <bunk@stusta.de>
In-reply-to: <20190718061948.GB27459@localhost>
Date: Thu, 18 Jul 2019 13:13:22 +0200
Message-ID: <6rk1cf7fzh.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org,
	=?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2019 11:13:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18 2019 at 08:19 +0200, Adrian Bunk <bunk@stusta.de> wrote:
> On Wed, Jul 17, 2019 at 11:57:42AM +0100, richard.purdie@linuxfoundation.=
org wrote:
>> On Wed, 2019-07-17 at 12:51 +0200, Ulrich =C3=96lmann wrote:
>> > Hi Richard,
>> >=20
>> > On Wed, Jul 17 2019 at 11:19 +0200, Richard Purdie <
>> > richard.purdie@linuxfoundation.org> wrote:
>> > > On Tue, 2019-07-16 at 15:54 +0200, Ulrich =C3=96lmann wrote:=20=20
>> > > > [...]=20
>> > > > -PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr"
>> > > > +PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
>> > > > [...]=20
>> > > > +PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
>> > > > +PACKAGECONFIG[reproducible] =3D
>> > > > "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_DEFAULT=3D0,"
>> > >=20
>> > > This fails in OE-Core since zstd isn't present and you've enabled
>> > > that
>> > > by default:
>> > >=20
>> > > e.g.:
>> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/827
>> > >=20
>> > > (but many other similar failures).
>> > >=20
>> > > Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
>> > > default.
>> >=20
>> > see my reply to Adrian: what do you think of transplanting the zstd
>> > recipe from meta-rauc to OE-core?
>>=20
>> I think right now that zstd is not common enough to be something for
>> oe-core. If multiple people reply and disagree I'm willing to reasses
>> that but that's my feeling right now...
>
> zstd not even being in meta-oe is a surprise that should be corrected.
>
> btrfs-tools would be the only user that comes immediately into my mind,
> but zstd support in the kernel btrfs driver is relatively new and not
> yet widely used.
>
> zstd has already gotten a lot of traction in the Open Source world,
> but regarding adding it to oe-core right now one could argue either way.

Nobody stood up and objected in the last 24h, so I will send a v2 that
simply drops "zstd" from the set of default options and refers to
meta-rauc's recipe.

>> Cheers,
>>=20
>> Richard
>
> cu
> Adrian

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

