Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3B9560116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 19:10:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vALJAr8P022412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Nov 2017 11:10:53 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Tue, 21 Nov 2017 11:10:53 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] backfill mechanism
Thread-Index: AdNf+226ORa9l6NuR/SCoUcn6/NVXgCv9+cAABAjvbs=
Date: Tue, 21 Nov 2017 19:10:51 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF4569D8@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>,
	<CAJ86T=Ub5KJK6nEUCDithboripFosi2w_f5JifOwEaq7LH4keg@mail.gmail.com>
In-Reply-To: <CAJ86T=Ub5KJK6nEUCDithboripFosi2w_f5JifOwEaq7LH4keg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.169]
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
X-List-Received-Date: Tue, 21 Nov 2017 19:10:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The problem is that when backfilling is done, TUNE_FEATURES, etc, all have =
values associated with the base arch, not the current multilib.  The "gener=
ic" solution, below, should work, although I would still use overrides when=
 available.=0A=
=0A=
Beyond what actually works, if the special backfill processing can be elimi=
nated and regular constructs used I think that would be desirable.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Andre McCurdy [armccurdy@gmail.com]=0A=
Sent: Monday, November 20, 2017 7:24 PM=0A=
To: Slater, Joseph=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] backfill mechanism=0A=
=0A=
On Fri, Nov 17, 2017 at 3:32 PM, Slater, Joseph=0A=
<joe.slater@windriver.com> wrote:=0A=
> The backfill mechanism is not compatible with multilib.=0A=
=0A=
Did anyone ever explain why?=0A=
=0A=
> This could possibly=0A=
> be fixed, but the backfill_considered functionality is also obscure, so I=
=0A=
> think in at least the machine related .inc files we should replace lines=
=0A=
> like=0A=
>=0A=
> MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D "=0A=
> ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"=0A=
>=0A=
> with lines like=0A=
>=0A=
> MACHINE_FEATURES_remove_mipsarchn32 =3D " qemu-usermode"=0A=
=0A=
That only works for TUNE_FEATURES which happen to have a corresponding=0A=
over-ride, so may not be a generic solution. Does something like:=0A=
=0A=
  MACHINE_FEATURES_remove =3D "${@bb.utils.contains('TUNE_FEATURES',=0A=
'n32', 'qemu-usermode', '', d)}"=0A=
=0A=
work for multilib?=0A=
=0A=
> There are two advantages:  the second line works for multilib, and it is =
far=0A=
> more readable.=0A=
>=0A=
> Joe=0A=
>=0A=

