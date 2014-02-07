Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 974EC6E706
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 14:02:39 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id B6F9384D; Fri,  7 Feb 2014 15:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 0110B81E;
	Fri,  7 Feb 2014 15:02:26 +0100 (CET)
Date: Fri, 7 Feb 2014 15:02:24 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140207140223.GA30901@piout.net>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com> <20140129131021.GH24156@piout.net>
	<52F40344.907@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52F40344.907@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Fri, 07 Feb 2014 14:02:40 -0000
X-Groupsio-MsgNum: 49933
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

So, I did the same tests with an x86_64 config and an ARM config.

On 06/02/2014 at 16:48:52 -0500, Bruce Ashfield wrote :
> > git branch --contains fbe98bb9ed3dae23e320c6b113e35f129538d14a
> * master
>=20
> > grep -C 2 ^VERSION Makefile
> VERSION =3D 3
> PATCHLEVEL =3D 14
> SUBLEVEL =3D 0
>=20

I'm also on 3.14, commit 9343224bfd4be6a02e6ae0c0d66426c955c7d76e

> So we have all the relevant commits, and a up to date tree. Operating
> on the .config from a 64 bit x86 build:
>=20
> > grep USB_ETH .config
> CONFIG_USB_ETH=3Dy
> CONFIG_USB_ETH_RNDIS=3Dy
> CONFIG_USB_ETH_EEM=3Dy
>=20
> > make savedefconfig
> scripts/kconfig/conf --savedefconfig=3Ddefconfig Kconfig
> .config:5333:warning: override: USB_ETH changes choice state
> .config:5336:warning: USB_G_NCM creates inconsistent choice state
> .config:5337:warning: USB_GADGETFS creates inconsistent choice state
> .config:5338:warning: USB_FUNCTIONFS creates inconsistent choice state
> .config:5342:warning: USB_MASS_STORAGE creates inconsistent choice state
> .config:5343:warning: USB_GADGET_TARGET creates inconsistent choice state
> .config:5344:warning: USB_G_SERIAL creates inconsistent choice state
> .config:5345:warning: USB_MIDI_GADGET creates inconsistent choice state
> .config:5346:warning: USB_G_PRINTER creates inconsistent choice state
> .config:5347:warning: USB_CDC_COMPOSITE creates inconsistent choice state
> .config:5348:warning: USB_G_NOKIA creates inconsistent choice state
> .config:5349:warning: USB_G_ACM_MS creates inconsistent choice state
> .config:5351:warning: USB_G_HID creates inconsistent choice state
> .config:5352:warning: USB_G_DBGP creates inconsistent choice state
> .config:5355:warning: USB_G_WEBCAM creates inconsistent choice state
> .config:6201:warning: symbol value 'm' invalid for VME_BUS
>=20

I don't get those warnings.

> > cp defconfig .config
>=20
> > yes '' | make oldconfig
>=20
> > grep USB_ETH .config
> CONFIG_USB_ETH=3Dm
> CONFIG_USB_ETH_RNDIS=3Dy
> CONFIG_USB_ETH_EEM=3Dy
>=20
> So far so good, this matches what I'd expect. Now with olddefconfig
> / oldnoconfig
>=20

Exactly what I have and what I'm trying to fix.

> > cp defconfig .config
> > make oldnoconfig
> scripts/kconfig/conf --olddefconfig Kconfig
> #
> # configuration written to .config
> #
> yow-bashfiel-d3 [/home/bruc...rnel/linux]> grep USB_ETH .config
> CONFIG_USB_ETH=3Dm
> CONFIG_USB_ETH_RNDIS=3Dy
> CONFIG_USB_ETH_EEM=3Dy
>=20
> .. CONFIG_USB_ETH is still =3Dm.
>=20

That is where I end up with:

$ grep USB_ETH .config
CONFIG_USB_ETH=3Dy
CONFIG_USB_ETH_RNDIS=3Dy
CONFIG_USB_ETH_EEM=3Dy

> I've also been running a whole series of configuration tests on the
> defconfigs found in the various arch/platforms in the mainline kernel,
> and on a modern (3.14-rc) kernel, getting the same results from
> yes "" | oldconfig and olddefconfig. i.e. migrating their configs with
> either technique results in the same resulting .config,
>=20
> Which if you recall the above question was my big concern, was the
> migration between kernel versions using the different techniques going
> to yield different results on the same .config.
>=20
> The answer to that is "it appears not", and really, taking a Kconfig's
> default IS the right thing to do if you must make a choice, and aren't
> familiar with the option.
>=20

But it should be different because using 'yes "" | oldconfig' is wrong.
Let's have a look at qi_lb60_defconfig:

$ ARCH=3Dmips make qi_lb60_defconfig
#
# configuration written to .config
#
$ grep USB_ETH .config
CONFIG_USB_ETH=3Dy
# CONFIG_USB_ETH_RNDIS is not set
# CONFIG_USB_ETH_EEM is not set

$ cp arch/mips/configs/qi_lb60_defconfig .config
=E2=80=98arch/mips/configs/qi_lb60_defconfig=E2=80=99 -> =E2=80=98.config=
=E2=80=99
$ yes '' | make oldconfig
[...]
$ grep USB_ETH .config
CONFIG_USB_ETH=3Dm
# CONFIG_USB_ETH_RNDIS is not set
# CONFIG_USB_ETH_EEM is not set


> ** So, that leaves me with agreeing that the change should be ok from
> that front, and that we definitely need the fallback to the yes "" |
> oldconfig variant if the newer targets don't exist. But from my tests,
> the commit log is slightly off .. again, maybe I messed something up
> in my tests with 3.14, but it is worth double checking.
>=20

I believe my commit message is actually right and something went wrong
in your tests.

> And finally, to allow someone who really doesn't like the command full
> flexibility, I'm running with the following change, and it offers
> an easy way to change behaviour .. opinions ?
>=20
> --->----->--->----->--->----->--->----->
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b76a65699755..9510996d52c1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -313,6 +313,8 @@ python sysroot_stage_all () {
>      oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
> d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>  }
>=20
> +KERNEL_CONFIG_COMMAND ?=3D "yes '' | oe_runmake oldconfig"
> +

If we go that route, shouldn't we have sane default and use
KERNEL_CONFIG_COMMAND ?=3D "oe_runmake oldnoconfig || yes '' | oe_runmake o=
ldconfig"

I understand that it may change the behaviour for some existing
configurations but I believe it is the correct behaviour to actually
respect what is in the kernel config provided by the user.

>  kernel_do_configure() {
>         # fixes extra + in /lib/modules/2.6.37+
>         # $ scripts/setlocalversion . =3D> +
> @@ -325,7 +327,7 @@ kernel_do_configure() {
>         if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>                 cp "${WORKDIR}/defconfig" "${B}/.config"
>         fi
> -       yes '' | oe_runmake oldconfig
> +       eval ${KERNEL_CONFIG_COMMAND}
>  }
> --->----->--->----->--->----->--->----->
>=20
> Doing a v3 of the fallback version, with a checked commit log and
> perhaps even the command flexibility would keep everyone happy and
> I can add my Acked-by to that version.
>=20

BTW, I've been told by the kconfig maintainers that the preferred way of
doing it would be to copy the provided defconfig to
arch/${ARCH}/configs/oe_defconfig and then oe_runmake oe_defconfig. But
unfortunately, that doesn't work for architectures without a 'configs'
directory. For 3.14, this is only alpha and frv but x86 got it starting
with 2266cfd50de3872e877eeca3dd4a6f940f22ba60, this is v2.6.24 and I
remember being asked to support older kernels.


--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBCAAGBQJS9OdvAAoJEKbNnwlvZCyzEwkQAKTEQOAAgX4KKiT1X2n6JcAf
3hhimVDQUk79N9WaOxqmqAz+24mtkyg1+jV6q+po5kSioP4SjJ8jzwGaDzKwgt2Y
z3S/7+xM5vG1hTv3AweAyBjCm5bA7Y7Gn3Rl3w4iWqQ2weUr+/HncypsIWB5tBJq
IRiG78z50tpwAIgTY6ZVmE5Ek7iAH4jBSMxDQJQSM7q2eMNyFHms2o3E7QQpwjOz
8BpBqJXpE5M53hLEB7CIP4RBdwHDQXd++EvbznrnBDiRF8Uh9c6ZcmR4447q6NgV
/Oxssv5yeWMuggk2A6EdTkmf6b4q92j/ZOW5CLthkzblLVHrwlCykFsqQHwUbnsf
qnrT5SO76W757LI5HpDjnQcpTJCXHcNceDeg2c+JlFMQRQbUaO9wPyTdz6YL4Nsc
phstqeSUBC0mAuapwPgIRSFhbdy67Kuz2S2+07vXtbvI2aOhxcy0twO0KP45K8cl
GNRm+xRLKcwBRDGWe2fk/4AIePsR2byRZcgYw+Graw7UNh+kJ4lDJEVeOLcqW+1m
4OO3Db3ebM+3CyFp8cTjjeqYGghr7w6/t0WY4rvzeqIJ6MIRirnFOUEz+B/G9T9y
rb18ON2grcN6itoLt0wYJtQhY7bbTzD+HyLjb+SHBLtAmlEQjdF3MmiZIun4IdxZ
qSCVTIDemdqXiNxSGGY4
=GhOl
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
