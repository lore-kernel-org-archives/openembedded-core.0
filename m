Return-Path: <quentin.schulz@bootlin.com>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id B5D8278849
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 08:39:26 +0000 (UTC)
Received: by mail.bootlin.com (Postfix, from userid 110)
	id 29AF620858; Tue,  6 Mar 2018 09:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail.bootlin.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from qschulz (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr
	[90.63.216.87])
	by mail.bootlin.com (Postfix) with ESMTPSA id B52EA20644;
	Tue,  6 Mar 2018 09:39:15 +0100 (CET)
Date: Tue, 6 Mar 2018 09:39:15 +0100
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180306083915.tshzk7yyed6ekl7i@qschulz>
References: <20180305082233.8493-1-quentin.schulz@bootlin.com>
	<CAMKF1spU6xb3WEjSjphUtrZu0Kq-gY9XymO_6taCq+RpF0jKbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spU6xb3WEjSjphUtrZu0Kq-gY9XymO_6taCq+RpF0jKbw@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Cc: thomas.petazzoni@bootlin.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: mdev: make mdev auto load modules at boot
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
X-List-Received-Date: Tue, 06 Mar 2018 08:39:27 -0000
X-Groupsio-MsgNum: 108964
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oy2qi2qw4qtdghui"
Content-Disposition: inline

--oy2qi2qw4qtdghui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 05, 2018 at 07:12:01PM -0800, Khem Raj wrote:
> On Mon, Mar 5, 2018 at 12:22 AM, Quentin Schulz
> <quentin.schulz@bootlin.com> wrote:
> > Thanks to the MODALIAS line at the beginning of mdev.conf, mdev supports
> > module auto probing on hotplug.
> >
> > However, this does not work for cold plugged modules (i.e. modules for
> > devices that were probed before mdev is added as hotplug handler).
> > Running mdev -s to replay hotplug events does not work in that case.
> >
> > Let's manually modprobe all modules in the rootfs.
> >
> > Taken from:
> >  - https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a617603=
9c90be67e66c4c2e42
> >  - https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c=
595844331684c14f51
> >
> > We need xargs to support zero termination of args so let's enable this
> > configuration in the fragment for mdev.
> >
> > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > ---
> >  meta/recipes-core/busybox/busybox/mdev.cfg | 2 ++
> >  meta/recipes-core/busybox/files/mdev       | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-=
core/busybox/busybox/mdev.cfg
> > index 6aefe90e43..0d60fc9560 100644
> > --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > @@ -9,3 +9,5 @@ CONFIG_SETSID=3Dy
> >  CONFIG_CTTYHACK=3Dy
> >
> >  CONFIG_FEATURE_SHADOWPASSWDS=3Dy
> > +
> > +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy
> > diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/b=
usybox/files/mdev
> > index 8c9c06e96c..165b275256 100755
> > --- a/meta/recipes-core/busybox/files/mdev
> > +++ b/meta/recipes-core/busybox/files/mdev
> > @@ -9,6 +9,7 @@ touch /dev/mdev.seq
> >  #sysctl -w kernel.hotplug=3D/sbin/mdev
> >  echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> >  mdev -s
> > +find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 mod=
probe -abq
> >
>=20
> will this execute on every boot ?

This file is installed to /etc/init.d[1] and since this recipe inherits
update-rc.d[2] which takes care of adding those links to /etc/rcN.d/,
yes, it is executed at each boot.

I've also tested this patch since I need it for a USB controller driver
module and, in practical, it does get executed at each boot.

[1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/b=
usybox/busybox.inc#n303
[2] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/b=
usybox/busybox.inc#n53

Quentin

--oy2qi2qw4qtdghui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJanlOvAAoJEIS4mnU+4PGj3EgP/jz8aXFkkOBilgsbu7A3U18x
KHT/uXme4HliSBjSGF8MYvoMZh/pBzYVdqpEKs3LyNIeNc9IyOr8O9izgFXjkbro
S4KXxaFZqJBPvvWyT1HV95Il1+0pVi0iH6KIACsYjG8l639lOa8jPmVP+NwW+Xcv
JWMfPY1nPXlI/PD9ukUPwc82YBrYycTmqVWSVyJa0X5ffP9CKx7LZU60d+s7Cj/c
JuYKnpSS313PuIt8jEm7WmTKsvwthCI0SQmBBXpVK90HD94GJCTW2PeQ+DSQ7Fw5
qCB3xTk6sz28z++9rSIdCXmyk6I55j4Akdehkiz/PFz6LHbdXdzodb3a429pBusS
0gTP0Pu2eZgZpeyJy9uwXVYEG90hZvjdGEy5kGTgA+5Gyp6Hkn2E0QOCO1vjgHOZ
EH2JxW54FiIhEEXUzlWUGjYDJz1MUQMpaX3mCiavJFtmD/GfXUBwEfaFOa5OL2ws
rOdf1gyAAqz7AXXbq2MZ0Z04/xoAUyij5UfzgRejM07tIX0c1S0hvrBLWA0sjDXq
WHHj15VThru0tsBIQzedWa1a8VzbHUPJiKKnhiJQDANUGat71fjiNweQcBZTmJNt
foEJ2TJt5rBMNF/4DmcmKTDjmvBhiP/BdZlYLrPeCFQ+/HITddm27KBuvA6FRIhY
FTWNM+/KkPEYlKI7ReZN
=tVcy
-----END PGP SIGNATURE-----

--oy2qi2qw4qtdghui--
