Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id E6C056D554;
	Mon,  4 Nov 2013 22:13:32 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id u14so6031378lbd.29
	for <multiple recipients>; Mon, 04 Nov 2013 14:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=F59WeEjwHkohNfJIRVJDEUZa72N8l/glgPZO34NzqKA=;
	b=vrjeTKsOnGoAFrDXMFiDCFSw9XKs0YXdzK4I0EHTzYwf9meJ77IyWJhDH70yhPwg5i
	g1snyp6I5xaAdaIQLWxBliwGdOUIrqKqPI4HDh24eODE+NMvZ/g9dWQMOmo27DTP9ZLi
	pLd5lmUUq1nj6jSRXzQ2kU5OdJOOL8uyn9U87jaw974hCroiR7qr4k5LYAuzUtEpcBY0
	Cwix+e93UF25IJNrd5FNUE8FgaHxmApJHSYQLUstcORclHaGh34uYH0gLSn7iBUMszkP
	GahuaLDDnNwVfmujJF2M+EU37JUJwSRMOJf/irek1oo7lXjp60igxlXRVKUZrLvTC+7C
	nRYA==
MIME-Version: 1.0
X-Received: by 10.112.136.163 with SMTP id qb3mr12733574lbb.14.1383603213966; 
	Mon, 04 Nov 2013 14:13:33 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Mon, 4 Nov 2013 14:13:33 -0800 (PST)
In-Reply-To: <1383520239.6271.96.camel@ted>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
	<CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
	<1383520239.6271.96.camel@ted>
Date: Mon, 4 Nov 2013 23:13:33 +0100
Message-ID: <CAAQYJAsRd=4bXxG8h42EbJgnspo_3ge=__GYpqShQom9-n11RA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <Openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 04 Nov 2013 22:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2013 at 12:10 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2013-11-03 at 23:16 +0100, Andrea Adami wrote:
>> On Sat, Nov 2, 2013 at 9:47 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> > Hi Richard,
>> >
>> > Le Wed, 30 Oct 2013 15:15:12 +0000,
>> > Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>> >
>> >> On Tue, 2013-10-29 at 08:28 +0100, Eric B=E9nard wrote:
>> >> > Hi Khem,
>> >> >
>> >> > Le Mon, 28 Oct 2013 20:45:21 -0700,
>> >> > Khem Raj <raj.khem@gmail.com> a =E9crit :
>> >> >
>> >> > > On Mon, Oct 28, 2013 at 7:10 AM, Eric B=E9nard <eric@eukrea.com> =
wrote:
>> >> > > > Hi Richard,
>> >> > > >
>> >> > > > I saw your patch fixing FILESPATH's and Kergoth's one fixing
>> >> > > > PACKAGECONFIG processing order and I think I'm also facing an o=
rder
>> >> > > > problem when SRC_URI is computed.
>> >> > > >
>> >> > > > So when building SRC_URI when two layers have bbappend which ap=
ply
>> >> > > > patches : the SRC_URI seems to be built using an order I fail t=
o
>> >> > > > understand somewhere instead of priority or the overrides' orde=
r.
>> >> > > >
>> >> > > > The use case is a System on Module and its custom motherboard :
>> >> > > > - meta-fsl-arm :
>> >> > > > * linux-imx_xyz.bb :
>> >> > > > SRC_URI =3D "patchgeneric1 ..."
>> >> > > >
>> >> > > > - meta-som-support :
>> >> > > > * conf/machine/mysom.conf
>> >> > > >
>> >> > > > * linux-imx_xyz.bbappend :
>> >> > > > SRC_URI_append_mysom =3D "patchsom1 patchsom2 ..."
>> >> > > >
>> >> > > > - meta-custommotherboard (SOM + Cunstom Motherboard) :
>> >> > > > * conf/machine/myproduct.conf
>> >> > > > MACHINEOVERRIDES_prepend =3D "mysom:"
>> >> > > > include conf/machine/mysom.conf
>> >> > > >
>> >> > > > * linux-imx_xyz.bbappend :
>> >> > > > SRC_URI_append_myproduct =3D "patchproduct1 patchproduct2 ..."
>> >> > > >
>> >> > > > in the end I get :
>> >> > > > SRC_URI =3D "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
>> >> > > > patchsom1 ..."
>> >> > > >
>> >> > > > and of course as patchproduct* are supposed to apply on top of
>> >> > > > patchsoc* the patch fail to apply.
>> >> > > >
>> >> > > > I didn't found a way to build SRC_URI in the order I would like=
 (I
>> >> > > > tested : changing MACHINEOVERRIDES 's order, changing layers' p=
riority,
>> >> > > > changing machine's name to see if that was an alphabetical orde=
r ...).
>> >> > > >
>> >> > > > In the end the only thing which worked was to add an (empty by =
default)
>> >> > > > variable in som's SRC_URI and filling this variables from the
>> >> > > > custommotherboard's bbappend.
>> >> > > >
>> >> > > > Is the behaviour I'm seeing expected or is there something wron=
g in my
>> >> > > > setup ?
>> >> > >
>> >> > > what is your OVERRIDES order.
>> >> > >
>> >> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:=
${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>> >> >
>> >> > so it follows the MACHINEOVERRIDES order (and I tried both append a=
nd
>> >> > prepend to hack MACHINEOVERRIDES without any behaviour change).
>> >>
>> >> I think what Khem is asking is what OVERRIDES expands to?
>> >>
>> >> You mean patchso* and not patchsoc* above, right? Or should patchsom1=
 be
>> >> patchsoc2?
>> >>
>> > oops :
>> > I expect  SRC_URI =3D "patchgeneric1 ... patchsom1 ... patchproduct1 .=
.."
>> > and I get :
>> > SRC_URI =3D "patchgeneric1 ... patchproduct1 ... patchsom1 ..."
>> >
>> >> Its hard to follow and it might be easier if you could share a
>> >> simplified test case we could reproduce this with. I don't doubt ther=
e
>> >> is an issue in there but we need a way to reproduce and debug this.
>> >>
>> > OK, I'm preparing a simple testcase to reproduce that with oe-core +
>> > meta-fsl-arm + meta-som + meta-baseboard.
>> >
>> > Eric
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> I have to report an undesiderate behavior:
>>
>> the formfactor files in our .bbappend are not considered :/
>> DEBUG: Searching for machconfig in paths:....
>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
>>   /oe/oe-core/meta/recipes-bsp/formfactor/files/
>>   /oe/meta-handheld/recipes-bsp/formfactor/files/poodle
>>
>> so we end up with the empty machconfig of
>> /oe/oe-core/meta/recipes-bsp/formfactor/files/
>>
>> Surely this didn't happen when we tested the recipe.
>
> With which revision of OE-Core? Was this with the dora release tag,
> current dora head or master?
>
> Cheers,
>
> Richard
>
>

This was with fresh master:

Build Configuration:
BB_VERSION        =3D "1.21.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Gentoo"
TARGET_SYS        =3D "arm-oe-linux-gnueabi"
MACHINE           =3D "poodle"
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "armv5 thumb dsp"
TARGET_FPU        =3D "soft"
meta              =3D "master:511b4194165ed7a5645169e09c27db280d5a5316"
meta-initramfs    =3D "master:4d62e7f575e2a87197c74ab4639561b45eec0e60"
meta-handheld     =3D "master:55a310666b543e6beca47fa3c197492d5a6cf8ff"

Cheers

