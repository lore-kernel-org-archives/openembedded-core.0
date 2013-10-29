Return-Path: <eric@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mail.openembedded.org (Postfix) with ESMTP id A4E2A6D2C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 07:35:26 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2E157822FF;
	Tue, 29 Oct 2013 08:35:19 +0100 (CET)
Date: Tue, 29 Oct 2013 08:28:52 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131029082852.4399ee5e@e6520eb>
In-Reply-To: <CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Tue, 29 Oct 2013 07:35:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Mon, 28 Oct 2013 20:45:21 -0700,
Khem Raj <raj.khem@gmail.com> a =E9crit :

> On Mon, Oct 28, 2013 at 7:10 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > Hi Richard,
> >
> > I saw your patch fixing FILESPATH's and Kergoth's one fixing
> > PACKAGECONFIG processing order and I think I'm also facing an order
> > problem when SRC_URI is computed.
> >
> > So when building SRC_URI when two layers have bbappend which apply
> > patches : the SRC_URI seems to be built using an order I fail to
> > understand somewhere instead of priority or the overrides' order.
> >
> > The use case is a System on Module and its custom motherboard :
> > - meta-fsl-arm :
> > * linux-imx_xyz.bb :
> > SRC_URI =3D "patchgeneric1 ..."
> >
> > - meta-som-support :
> > * conf/machine/mysom.conf
> >
> > * linux-imx_xyz.bbappend :
> > SRC_URI_append_mysom =3D "patchsom1 patchsom2 ..."
> >
> > - meta-custommotherboard (SOM + Cunstom Motherboard) :
> > * conf/machine/myproduct.conf
> > MACHINEOVERRIDES_prepend =3D "mysom:"
> > include conf/machine/mysom.conf
> >
> > * linux-imx_xyz.bbappend :
> > SRC_URI_append_myproduct =3D "patchproduct1 patchproduct2 ..."
> >
> > in the end I get :
> > SRC_URI =3D "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
> > patchsom1 ..."
> >
> > and of course as patchproduct* are supposed to apply on top of
> > patchsoc* the patch fail to apply.
> >
> > I didn't found a way to build SRC_URI in the order I would like (I
> > tested : changing MACHINEOVERRIDES 's order, changing layers' priority,
> > changing machine's name to see if that was an alphabetical order ...).
> >
> > In the end the only thing which worked was to add an (empty by default)
> > variable in som's SRC_URI and filling this variables from the
> > custommotherboard's bbappend.
> >
> > Is the behaviour I'm seeing expected or is there something wrong in my
> > setup ?
>=20
> what is your OVERRIDES order.
>=20
"${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHIN=
EOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"

so it follows the MACHINEOVERRIDES order (and I tried both append and
prepend to hack MACHINEOVERRIDES without any behaviour change).

Eric

