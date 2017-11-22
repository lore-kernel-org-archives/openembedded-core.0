Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 795EC7872A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 06:03:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAM63Kha026933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Nov 2017 22:03:20 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Tue, 21 Nov 2017 22:03:19 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>, Andre McCurdy
	<armccurdy@gmail.com>
Thread-Topic: [OE-core] backfill mechanism
Thread-Index: AdNf+226ORa9l6NuR/SCoUcn6/NVXgCv9+cAABAjvbsAFuFbUA==
Date: Wed, 22 Nov 2017 06:03:18 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B91E68C@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>,
	<CAJ86T=Ub5KJK6nEUCDithboripFosi2w_f5JifOwEaq7LH4keg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF4569D8@ALA-MBC.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF4569D8@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: backfill mechanism
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
X-List-Received-Date: Wed, 22 Nov 2017 06:03:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Slater, Joseph
> Sent: Wednesday, November 22, 2017 03:11
> To: Andre McCurdy
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] backfill mechanism
>=20
> The problem is that when backfilling is done, TUNE_FEATURES, etc, all hav=
e
> values associated with the base arch, not the current multilib.  The "gen=
eric"
> solution, below, should work, although I would still use overrides when a=
vailable.
>=20
> Beyond what actually works, if the special backfill processing can be eli=
minated
> and regular constructs used I think that would be desirable.
>=20
> Joe
> ________________________________________
> From: Andre McCurdy [armccurdy@gmail.com]
> Sent: Monday, November 20, 2017 7:24 PM
> To: Slater, Joseph
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] backfill mechanism
>=20
> On Fri, Nov 17, 2017 at 3:32 PM, Slater, Joseph
> <joe.slater@windriver.com> wrote:
> > The backfill mechanism is not compatible with multilib.
>=20
> Did anyone ever explain why?

I think it should be a defect, so I just opened one:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12373

Thanks,
Jackie

>=20
> > This could possibly
> > be fixed, but the backfill_considered functionality is also obscure, so=
 I
> > think in at least the machine related .inc files we should replace line=
s
> > like
> >
> > MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D "
> > ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
> >
> > with lines like
> >
> > MACHINE_FEATURES_remove_mipsarchn32 =3D " qemu-usermode"
>=20
> That only works for TUNE_FEATURES which happen to have a corresponding
> over-ride, so may not be a generic solution. Does something like:
>=20
>   MACHINE_FEATURES_remove =3D "${@bb.utils.contains('TUNE_FEATURES',
> 'n32', 'qemu-usermode', '', d)}"
>=20
> work for multilib?
>=20
> > There are two advantages:  the second line works for multilib, and it i=
s far
> > more readable.
> >
> > Joe
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

