Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 64E986B0CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:35:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KIZRvH010366;
	Tue, 20 Aug 2013 13:35:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KIZRwj021188;
	Tue, 20 Aug 2013 13:35:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 13:35:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Otavio Salvador
	<otavio@ossystems.com.br>
Thread-Topic: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for
	kernels newer than 3.8
Thread-Index: AQHOndGlkBvSJeuq/kuFcGLOBvVMv5mevS+A//+u3IA=
Date: Tue, 20 Aug 2013 18:35:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5267D0@DFLE08.ent.ti.com>
References: <1377017488-32708-1-git-send-email-fcooper@ti.com>
	<1377017488-32708-3-git-send-email-fcooper@ti.com>
	<CAP9ODKp7OF=yREqDpGhqcSRNdYAC9+S_SsRhoE6KPR4bJR5V9Q@mail.gmail.com>
	<4800620.CZQFbUAUEs@helios>
In-Reply-To: <4800620.CZQFbUAUEs@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Tue, 20 Aug 2013 18:35:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Tuesday, August 20, 2013 1:24 PM
> To: Otavio Salvador
> Cc: Cooper Jr., Franklin; Patches and discussions about the oe-core layer
> Subject: Re: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for=
 kernels
> newer than 3.8
>=20
> Hi Otavio,
>=20
> On Tuesday 20 August 2013 15:17:16 Otavio Salvador wrote:
> > On Tue, Aug 20, 2013 at 1:51 PM, Franklin S. Cooper Jr
> > <fcooper@ti.com>
> wrote:
> > > From: Otavio Salvador <otavio@ossystems.com.br>
> > >
> > > The 3.8 kernel has change the default directory where the dtb file
> > > is stored. The change has been done at:
> > >
> > > ,----[ Quote of 3.8 kernel change ]
> > >
> > > | commit 499cd8298628eeabf0eb5eb6525d4faa0eec80d8
> > > | Author: Grant Likely <grant.likely@secretlab.ca>
> > > | Date:   Tue Nov 27 16:29:11 2012 -0700
> > > |
> > > |     ARM: dt: change .dtb build rules to build in dts directory
> > > |
> > > |     The current rules have the .dtb files build in a different dire=
ctory
> > > |     from the .dts files. The only reason for this is that it was wh=
at
> > > |     PowerPC has done historically. This patch changes ARM to use th=
e
> > > |     generic
> > > |     dtb rule which builds .dtb files in the same directory as the s=
ource
> > > |     .dts.
> > > |
> > > |     Cc: Russell King <linux@arm.linux.org.uk>
> > > |     Cc: Arnd Bergmann <arnd@arndb.de>
> > > |     Acked-by: Olof Johansson <olof@lixom.net>
> > > |     Cc: linux-arm-kernel@lists.infradead.org
> > > |     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> > > |     [swarren: added rm command for old stale .dtb files]
> > > |     Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > > |     Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> > >
> > > `----
> > >
> > > This change adds support for both places to backward and forward
> > > compatibility.
> > >
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >
> > Franklin, I agree this is the way to go but I think it is a bit risky
> > to change it in dylan.
> >
> > I think it could be included in meta-ti or other layers (in case it is
> > need for dylan) but it has breakage risk as noticed today in some
> > behaviour change as found in meta-xilinx.
> >
> > Paul, please be conservative about this and my previous linux-dtb
> > patch. In case it is going to be applied in dylan we need to let it
> > sleep some more time in master to find any other side effect due the
> > behaviour change.
>=20
> Agreed, I'd very much prefer to hold on this until it has had time to soa=
k in
> master.
[Franklin]=20
No problem. I will put this on the back burner for some time.
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

