Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD0BB6D3DD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 22:16:08 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so4837374lbh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Nov 2013 14:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6lLIe2vEVUid+K8Enui5dGPPSIa+//vPq+EsOl9jCyA=;
	b=COnuyVlhSGkkDZGcvvt6Kn3hn2COWl707xO37l5tRJOznnK0qC62L2YywzQMY9XxA7
	/X/qyHkEaLYqGqqqS3gqp3sPNYlWyR+UVEbd6mSebisvCPHbAoL1XauibK/62DUcgAxP
	9B2ocPAEDpasqt4qXuAyXG7aDFNoJo9zzbIvr6MXy2/Zn+Ii4CBf+/PA2dUEofJ7I5Ki
	0di1WxCe9CaUndw+sdld9MTRC8iRd2SxtIDqstTUjVLxN8d+yC+QBw4chCfzs1t1TZKl
	azSffJTZc543DqkEq516F2aNhZSuvoB2EJhYGiR4sdOJCsL2xP4BBensQNDG66WBW3zC
	6Bkg==
MIME-Version: 1.0
X-Received: by 10.112.167.3 with SMTP id zk3mr9064682lbb.23.1383516969642;
	Sun, 03 Nov 2013 14:16:09 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sun, 3 Nov 2013 14:16:09 -0800 (PST)
In-Reply-To: <20131102094725.14fb6902@e6520eb>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
Date: Sun, 3 Nov 2013 23:16:09 +0100
Message-ID: <CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
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
X-List-Received-Date: Sun, 03 Nov 2013 22:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2013 at 9:47 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Richard,
>
> Le Wed, 30 Oct 2013 15:15:12 +0000,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>
>> On Tue, 2013-10-29 at 08:28 +0100, Eric B=E9nard wrote:
>> > Hi Khem,
>> >
>> > Le Mon, 28 Oct 2013 20:45:21 -0700,
>> > Khem Raj <raj.khem@gmail.com> a =E9crit :
>> >
>> > > On Mon, Oct 28, 2013 at 7:10 AM, Eric B=E9nard <eric@eukrea.com> wro=
te:
>> > > > Hi Richard,
>> > > >
>> > > > I saw your patch fixing FILESPATH's and Kergoth's one fixing
>> > > > PACKAGECONFIG processing order and I think I'm also facing an orde=
r
>> > > > problem when SRC_URI is computed.
>> > > >
>> > > > So when building SRC_URI when two layers have bbappend which apply
>> > > > patches : the SRC_URI seems to be built using an order I fail to
>> > > > understand somewhere instead of priority or the overrides' order.
>> > > >
>> > > > The use case is a System on Module and its custom motherboard :
>> > > > - meta-fsl-arm :
>> > > > * linux-imx_xyz.bb :
>> > > > SRC_URI =3D "patchgeneric1 ..."
>> > > >
>> > > > - meta-som-support :
>> > > > * conf/machine/mysom.conf
>> > > >
>> > > > * linux-imx_xyz.bbappend :
>> > > > SRC_URI_append_mysom =3D "patchsom1 patchsom2 ..."
>> > > >
>> > > > - meta-custommotherboard (SOM + Cunstom Motherboard) :
>> > > > * conf/machine/myproduct.conf
>> > > > MACHINEOVERRIDES_prepend =3D "mysom:"
>> > > > include conf/machine/mysom.conf
>> > > >
>> > > > * linux-imx_xyz.bbappend :
>> > > > SRC_URI_append_myproduct =3D "patchproduct1 patchproduct2 ..."
>> > > >
>> > > > in the end I get :
>> > > > SRC_URI =3D "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
>> > > > patchsom1 ..."
>> > > >
>> > > > and of course as patchproduct* are supposed to apply on top of
>> > > > patchsoc* the patch fail to apply.
>> > > >
>> > > > I didn't found a way to build SRC_URI in the order I would like (I
>> > > > tested : changing MACHINEOVERRIDES 's order, changing layers' prio=
rity,
>> > > > changing machine's name to see if that was an alphabetical order .=
..).
>> > > >
>> > > > In the end the only thing which worked was to add an (empty by def=
ault)
>> > > > variable in som's SRC_URI and filling this variables from the
>> > > > custommotherboard's bbappend.
>> > > >
>> > > > Is the behaviour I'm seeing expected or is there something wrong i=
n my
>> > > > setup ?
>> > >
>> > > what is your OVERRIDES order.
>> > >
>> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${M=
ACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
>> >
>> > so it follows the MACHINEOVERRIDES order (and I tried both append and
>> > prepend to hack MACHINEOVERRIDES without any behaviour change).
>>
>> I think what Khem is asking is what OVERRIDES expands to?
>>
>> You mean patchso* and not patchsoc* above, right? Or should patchsom1 be
>> patchsoc2?
>>
> oops :
> I expect  SRC_URI =3D "patchgeneric1 ... patchsom1 ... patchproduct1 ..."
> and I get :
> SRC_URI =3D "patchgeneric1 ... patchproduct1 ... patchsom1 ..."
>
>> Its hard to follow and it might be easier if you could share a
>> simplified test case we could reproduce this with. I don't doubt there
>> is an issue in there but we need a way to reproduce and debug this.
>>
> OK, I'm preparing a simple testcase to reproduce that with oe-core +
> meta-fsl-arm + meta-som + meta-baseboard.
>
> Eric
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


I have to report an undesiderate behavior:

the formfactor files in our .bbappend are not considered :/
DEBUG: Searching for machconfig in paths:....
  /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
  /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
  /oe/oe-core/meta/recipes-bsp/formfactor/files/
  /oe/meta-handheld/recipes-bsp/formfactor/files/poodle

so we end up with the empty machconfig of
/oe/oe-core/meta/recipes-bsp/formfactor/files/

Surely this didn't happen when we tested the recipe.

Cheers

Andrea

