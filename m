Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6D97960691
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2671; q=dns/txt; s=axis-central1;
	t=1583236800; x=1614772800;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=DqqzjzTy2LVc1p1kppWVcbKxRFlzndVjpEpcX6lSmVc=;
	b=XGsX134Sp7XJ87VMbfSbkV19NemF30h9UxnVSyfBRhjmR60y6qTuhnzb
	GNPS6A/pV3Jp12m+HcYdFc2zCVi/7xrYYNtQ4POaqPZn6kd1tq8+79YPi
	P6iwCILstojFfsAWF0bGCQ71ZiWywZUpPwdBOZ3nYvnX69RYv2DWAHsto
	FeFy1jJDWpfEtdpLlFKvGPoxzQPm7zzfl+n1I12HmRJg8CTE3B5TJuvxE
	BY0I71SRA7JWWuhF2m7Mh7hzfjnknovkAdJK32gdZLvM2fklbtzme/Zem
	mGFyVpUoFj1T9B2lnPO5TT01uxWtpFtvkGq9g1E07ftMtKCINPtEl8M/u Q==;
IronPort-SDR: h3T/pus626RIvlV+sysqfE9hXXAwaJxfrdtdfj+PZvGGV42S2idZQDTafz27ztksChDkFIYqM6
	ewBymJMzlMXSU/xVvoGkHUrNeAgR2Zymi4lkKf0IVmwXWN2FE9iVWyjFquIVePzCALUtgcZmI5
	JcZrVK3UWzbGA/ZJOgTY6pkM2nCQPZ6ERIRAn3IdFntOFnd/nmmeORt0/KrpOLsfqL1xG2viiu
	0H5yI/RhD0l8PPjZEk3EVKENWFjiQ45E9eDf/IKIrtL4L+8bQvCqXmdmUOQW8OyPVLKbvHxefx
	ISU=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="6039082"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Junling Zheng <zhengjunling@huawei.com>, Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
	MACHINEOVERRIDES
Thread-Index: AQHV8MCOVPC5pfvw0keD/66VlGkIvKg2IGSAgACi7cA=
Date: Tue, 3 Mar 2020 11:59:58 +0000
Message-ID: <41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
In-Reply-To: <9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 11:59:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Junling Zheng
> Sent: den 3 mars 2020 04:11
> To: Khem Raj <raj.khem@gmail.com>; openembedded-
> core@lists.openembedded.org
> Cc: wangnan0@huawei.com
> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
> MACHINEOVERRIDES
>=20
> On 2020/3/3 2:29, Khem Raj wrote:
> >
> >
> > On 3/2/20 9:11 AM, Junling Zheng wrote:
> >> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
> >> "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
> >> So, for aarch64 big endian, the variable '<foo>_aarch64' will override
> >> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
> >> incorrect variable.
> >>
> >> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> >> ---
> >>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
> b/meta/conf/machine/include/arm/arch-arm64.inc
> >> index 53f4566815..32294bd218 100644
> >> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> >> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> >> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
> >>     TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
> >>   -MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'aarch=
64', 'aarch64:', '' ,d)}"
> >> -
> >
> > if its removed here, where is it being added for other machines,
> question is, should we treat aarch64 as LE equivalent of aarch64_be
> > or should be treated as common aarch64 and a new define like aarch64_le
> defined.
> >
>=20
> Currently, for arm64, we have aarch64_be to represent big endian, but no
> overrides to represent little endian only.
>=20
> So, IMO, we should treat aarch64 as little enaian only, like arm and
> armeb.
>=20
> >>   # Little Endian base configs
> >>   AVAILTUNES +=3D "aarch64 aarch64_be"
> >>   ARMPKGARCH_tune-aarch64 ?=3D "aarch64"

Please, before removing "aarch64" from MACHINEOVERRIDES, add "armv8a" or=20
similar. This is how it is done for the armv7* based chips. E.g., I would=20
expect to see tune-cortexa53.inc have:

MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', '=
armv8a:', '' ,d)}"

Which corresponds to how it is done for armv7*.

At least we currently rely on being able to do, e.g.:

COMPATIBLE_MACHINE =3D "aarch64|armv7a|armv7ve"

and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable=20
substitute.

//Peter


