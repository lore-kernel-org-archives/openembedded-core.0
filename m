Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88711C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:21:02 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.9892.1636449660977706570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=a+fOLoRr;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: chee.yang.lee@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293245242"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800";
   d="scan'208";a="293245242"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 01:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800";
   d="scan'208";a="563960899"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2021 01:20:59 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 01:20:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 01:20:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 01:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XequWDh77+T77ep+zYJi5Qlw0wrnOUGWZvgkmIJR2Pp7WHB5qc6rQxTFklogAgPeYPNUTuhCi1/aULWBThvTFgdCtzb/lRK7gx5pXyiMaNL+yVPad2JRAdw5SAT+MrNzLDLWpDme8P7sFIMehhxlgSq0ZZ/t9FkI/D4djqxUEgDSK5w7HuGo9nDIINPdG67fMuxuG3TifvXpdyDx5sgnZNd0h2IVriYiQweVtZZbAQZFc87iq+aaPB1DnpidpqWCcGavKDcV9bW0a8YPKWdkM90prwq7XWY2NZNXde808Shga7caem1jNgq3oI8ekc4B/sIX7vZ02XxDLO48I+XOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgZyifOc7NXeZDUiNxwuhQHwovOBQn+NsUGFgIYYQpU=;
 b=TIlieWQrO6mNngFRuddBR1Db1d3JN7zQHsH5AvhSKm/9DKiit92J4ALHwSxm8I0haHUjRnwXJJvIdAfrurzO0IwOaZ6K5ndlLYISI2Cw5xhUWV/jlIoBUDzJ5S9nPWo+mPL1NJzixPdqoq8mheqzaroXTeHVTgRhGqQ8tZELq5Q5FiiKrrb69aZTM40W93vpEqqImCFEP4AIhMm/Qo5wHjekT0lsyMwbUdpCKb5Q6kap0FeCrG3ozT0SONIFNKRD1jleJ0ct39Xgm0lOoSLyoAk5oBNiYNUU9D7gWXpqwIHbfbsg3ij4TrpRp2cYllucwzOo/ICnFKOKwRdgYPzEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgZyifOc7NXeZDUiNxwuhQHwovOBQn+NsUGFgIYYQpU=;
 b=a+fOLoRrI5+Hqpa8DV/XO2ju4s/AirK/2Z7S/FOjxebEwJ/0p+5CYaHEGCw7ix8UlzG/HPw4WdS11KINkWdxQEnRbvPcox8fVWdmz4kkovLKHxmX9Dmrbk20cPO4uYHEcEt0T3heTNvdJp0s/VV8aqCopZsVdRihYN0yqnoDJwU=
Received: from DM6PR11MB4105.namprd11.prod.outlook.com (10.255.61.158) by
 DM6PR11MB4475.namprd11.prod.outlook.com (52.132.248.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Tue, 9 Nov 2021 09:20:57 +0000
Received: from DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::8591:1046:fa7c:82d2]) by DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::8591:1046:fa7c:82d2%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:20:57 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: ?ukasz Majewski <lukma@denx.de>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Nathan Rossi
	<nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>, Adhemerval Zanella
	<adhemerval.zanella@linaro.org>, "Patches and discussions about the oe-core
 layer" <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] glibc: ptest: Add running glibc time related
 test suite (Y2038) with ptest
Thread-Topic: [OE-core] [PATCH v3] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
Thread-Index: AQHXy/N9dOw27KTlr0ih5nexb05Yj6vqiY6AgA9amoCAARdzwA==
Date: Tue, 9 Nov 2021 09:20:57 +0000
Message-ID: 
 <DM6PR11MB41050BCAF7D1ABF5EA7E01F5B9929@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <20211028120020.23276-1-lukma@denx.de>
	<YXxvkWzBlNaHkybQ@piout.net> <20211108173107.277af6a0@ktm>
In-Reply-To: <20211108173107.277af6a0@ktm>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adc2416c-3d7f-4f40-c087-08d9a3623d08
x-ms-traffictypediagnostic: DM6PR11MB4475:
x-microsoft-antispam-prvs: 
 <DM6PR11MB447547B8B831777A5CD14CC4B9929@DM6PR11MB4475.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Radxi4QQ68jERShW2jkvW0WAMwRcphn9MnpJo9q1lpYV/D+62dV3p5AOCaFq21JIHlmccq7sAqrBNqVBSUn7pAuT+MybodjkmjMs70bKYCB8u1wH5/v6cVCTxjnq7mejzGOKZeSbDNG6WDF/a/bHCtYHpIVLiZlJsumiS/iFM0vXNzA7BwtEv7n7JbDa3LnqRU4P3vDmXE0iifse1RwgTqrxbrMIVxAc7Z6qp9ElpuEMwxSMYh2dk1edPaM6L0W8lfs2djLo1PC/CEG20VLj2I1XSx7zTLkM/gUmQLxqqvbp/8CGlo6R6Nd8WqL8bH4NHsfy7UMU8+VfRwlBXB3QHORspomnhr+hKtC/mtip4GVtOYZqEYytGjwW5QbCznRB2O2yjaoYwIcQFVef8qjgE6S0buZp7/OM1V/RwgLQvW4GDL58pym3XZpvZQz+ITaNlFDiL9hooZW+kqMxjKVMGfpcH6TVG7vl4YMseHF1CwtFoIDciAgjxwA2JSEFHfw7w+gtPwG415Z6/K/S7tjkQUdUKSxtx+Yv/R7Kpj+hJ/TN0pEpWVkubqdYzNSXwdDVZJUFQ0vyJa+xY15eCsq0k0p0WL0RynXZwVyTrkxo6YcX3e4zFfE++8/ot+be71yuN663uU53njBDhyjlyaEWiuxVg5ATA3bkP2rBC4YLfnbtCrBPop9oaw4Q5kSEJLN1KYDxmZOsNBCMG+4pcntGjkyAG8rzXpR6wf82yX2YXC2lVY2ybcNr7GNyDUYiQVh00R8C8KYHcbNyWpG8a1LAN99qE/uWn1vpk1Ty0OdqwY9uvaEs/WNmrV2RwcMiKzO4Y0EPN9ZLyAQo/7L8gcSbsw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4105.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016002)(86362001)(38070700005)(7696005)(38100700002)(316002)(4326008)(110136005)(8936002)(54906003)(6506007)(122000001)(186003)(76116006)(9686003)(66946007)(26005)(66446008)(8676002)(66556008)(64756008)(966005)(83380400001)(66476007)(71200400001)(82960400001)(33656002)(52536014)(2906002)(5660300002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qQly4Klfh8M2nUN1vP6LmH5EEd4wL/6xWMmGLTonuiRrRcSBsm3kOmHtnHxC?=
 =?us-ascii?Q?d4qBaM7R39J4GR/muZxbV4sEKJ9VMrtF/J5xLNAo1XW0dHUHwa9ykI4bKVO0?=
 =?us-ascii?Q?ECqgvLEhEmdg/YNmhQR1+55jBfTn1qn5nuYexQmg9UbelfCmZbqrkLURt4bO?=
 =?us-ascii?Q?ejdKazurVvN1Obp6/bKXkKo18dAlP7Oupf4WtETgF17IYLc7VAF9xIt+Erux?=
 =?us-ascii?Q?e5ZaiQLYBCJqcDAJUa38dbF8iVYJWfJNVZGNEZE1S8Li+0Q9xUX64KPSZdI/?=
 =?us-ascii?Q?Ig1Q0NJF0GzrHFsCGXL/q6UKADFPRQw+XP+qU5equkZD8aZXVsOi2y06FCQi?=
 =?us-ascii?Q?pksHSTRGMunsbKJ3+h2Via7LrAFbWQefEl3/XPizmlZLutkSuHzGcM+w7WeW?=
 =?us-ascii?Q?xfvffqKmaejAosH+Wn/rJ9Cu89C4+SCDuqG12W/kpDGC6JJk3o8E/3HfU6n5?=
 =?us-ascii?Q?//G47o3UMrBIGT2On9WpjjbUUnk78MkdMc2xaNOr7agJKIHBmjLgSfJ5Gi+h?=
 =?us-ascii?Q?0ZooWGzHZvBu0jHDbrkrqad9hCYDIyFoJ+2U3aM+boM1YzQA8oHje3GNRq0e?=
 =?us-ascii?Q?I0Hg2J415oa/nXbhIq0v4K82wMIyxat1g81sWHZcL4Zc0K6BgX9oMV5PAcGe?=
 =?us-ascii?Q?iQEgnNpslqQY+EIO5kAjttlaQBO3Jl30g/bKMLRcLlu+TICyuAhVSC5Pwh1j?=
 =?us-ascii?Q?xH6ZechEQEmOwDWgOUPoAKy1gDDwwZg8eMQTFfJQ75u1QThHSUQNrBnDTqjS?=
 =?us-ascii?Q?TFycgEm7YX+nyUw8UFKm+CEN3hztIu1tqWaVXRy+wkXJx6kq7jhE5DfPtibf?=
 =?us-ascii?Q?pspvRkuAhKhePCPgwAKHysEzs6liBGJNJv0xOwmCYjQzsNmVYotQsKOVjlf4?=
 =?us-ascii?Q?mmcKgToqINgPSd6At6vPaSyWBEWYv327fZkic36HVk4rLIz2JVRu9714ojTc?=
 =?us-ascii?Q?NTm6IIjd84nrlBSX/mzHy7TBzrCVzn05o+dXNUXdCSmTzfJqBkyp+VttqZxE?=
 =?us-ascii?Q?cXhBa5fPzbk3l5l1Oar8eawu+40WUmsLpm8/tXLn1RqUWDDtPMJgd/LqvwnE?=
 =?us-ascii?Q?aLSmALA3o3J3aeTsSHnTMXFz/qXvg0bZOZFQj3uWGv8KfUDUXAsIzc4qzl24?=
 =?us-ascii?Q?kTeCvWN3el9V3MwtDSoviUG8M1h1IsjkXIaOHnqXrilqgVNHgvPl8nNhVnoy?=
 =?us-ascii?Q?KY573qpfc4NUSnwKGgi7lvHn3fK1gPjSq9c62HYEwHdmmh5vOZ4qzLkR0QlP?=
 =?us-ascii?Q?CD3OGifYh6UEWvslIXL5ZTfyfLgKcRNXacAHjfevrNJLmY0oHrh2nKHwEifw?=
 =?us-ascii?Q?uGmLQi4x583Q3RPCXQAOce2JXR0hLQBaZGFZwhPHELNOHKi9WtfWv7qITdXL?=
 =?us-ascii?Q?o45BWWnPP7feB+93tq11qb0oTWYwjStstA6kGOxvmi2FW07Oys1Vug/kL+L8?=
 =?us-ascii?Q?X6InzPg0ZxM2pK0St3EatvYC8JFSSRPNFG2TLG9PnrVQPWxrMvBl6IgtIM9l?=
 =?us-ascii?Q?sUAzM88ZC9ewH9Y1JAYvjzhMFkfE6h/+DJZfDEa4QlbutBT3FQIoxY8fI0fp?=
 =?us-ascii?Q?PF4oXRq5Aqd1kgqT998xakL56jQgkjZmUgp2bMmDvzYlcmIhNs324pHjyPBt?=
 =?us-ascii?Q?rA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 adc2416c-3d7f-4f40-c087-08d9a3623d08
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 09:20:57.4013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rEY1xtJJrRCvu8Z7LSZ0Eoo1erAthOabxt1WOEBzgZtSRvDwPOkyPmf4wyHLSLG6Y2OMQeJUa8wQEPocV8YfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4475
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158003

Hi,=20

I think need to fix this too=20

AssertionError:
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.
glibc-tests (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/rec=
ipes-core/glibc/glibc-tests_2.34.bb)

full log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2807/step=
s/15/logs/stdio


also for issue with=20
"Missing or unbuildable dependency chain was: ['nativesdk-ptest-runner']"
you may refer to these build for build config
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/4598/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3629/step=
s/12/logs/stdio



>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of ?ukasz Majewski
>Sent: Tuesday, 9 November, 2021 12:31 AM
>To: Alexandre Belloni <alexandre.belloni@bootlin.com>
>Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Nathan Rossi
><nathan@nathanrossi.com>; Khem Raj <raj.khem@gmail.com>; Adhemerval
>Zanella <adhemerval.zanella@linaro.org>; Patches and discussions about the=
 oe-
>core layer <openembedded-core@lists.openembedded.org>
>Subject: Re: [OE-core] [PATCH v3] glibc: ptest: Add running glibc time rel=
ated test
>suite (Y2038) with ptest
>
>Hi Alexandre.
>
>Sorry for the late reply - I've must overlooked this reply...
>
>> Hello,
>>
>> There is a remaining issue:
>>
>> WARNING: Nothing RPROVIDES 'nativesdk-ptest-runner' (but
>> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/m
>> eta/recipes-core/glibc/glibc-tests_2.34.bb
>> RDEPENDS on or otherwise requires it) NOTE: Runtime target
>> 'nativesdk-ptest-runner' is unbuildable, removing... Missing or
>> unbuildable dependency chain was: ['nativesdk-ptest-runner']
>
>Could you share your setup?
>
>I've been trying to reproduce this problem with:
>MACHINE=3Dqemuarm64 bitbake core-image-ptest-all -c populate_sdk
>
>but no warnings were observed.
>
>Thanks in advance.
>
>>
>> On 28/10/2021 14:00:20+0200, ?ukasz Majewski wrote:
>> > This patch introduces new recipe - namely 'glibc-tests', which
>> > builds and installs time related (to check if Y2038 support works)
>> > glibc test suite to OE/Yocto built image.
>> >
>> > It reuses code from already available 'glibc-testsuite' recipe,
>> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
>> > to execute remotely (via SSH) tests on some emulated machine.
>> >
>> > This recipe installs time related glibc tests on some rootfs image.
>> > Afterwards, those tests can be executed on the real hardware, to
>> > facilitate validation of it with Y2038 problem compliance.
>> >
>> > To test time related subset - one needs to call:
>> > ptest-runner glibc-tests
>> > then change the date after Y2038 threshold for 32 bit systems:
>> > date -s "20 JAN 2038 18:00:00"
>> > and then run ptest-runner again.
>> >
>> > To facilitate debugging, source files are provided by default with
>> > the unstripped debugging symbols. Such approach would reduce the
>> > already complex recipe (as it inherits base glibc one), so there is
>> > no need to also install *-dbg and *-src packages.
>> >
>> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
>> >
>> > ---
>> > Changes for v3:
>> > - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
>> >   RPROVIDES variables
>> >
>> > Changes for v2:
>> > - Just focus on time related set of tests as those can be run as
>> >   standalone
>> > - Reuse of already built tests (from glibc-tests.inc) and depoloy
>> >   them on the HW target.
>> > - Provide single 'run-ptest' script.
>> > - Update the recipe to run with newest poky's -master
>> > ---
>> >  .../distro/include/ptest-packagelists.inc     |   1 +
>> >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 112
>> > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest       |
>> > 37 ++++++ 3 files changed, 150 insertions(+)  create mode 100644
>> > meta/recipes-core/glibc/glibc-tests_2.34.bb
>> >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
>> >
>> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>> > b/meta/conf/distro/include/ptest-packagelists.inc index
>> > 2e324f8da4..fd52fa72a4 100644 ---
>> > a/meta/conf/distro/include/ptest-packagelists.inc +++
>> > b/meta/conf/distro/include/ptest-packagelists.inc @@ -61,6 +61,7 @@
>> > PTESTS_FAST =3D "\ slang-ptest \
>> >      wayland-ptest \
>> >      zlib-ptest \
>> > +    glibc-tests-ptest \
>> >  "
>> >  PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
>> >  PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
>> > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
>> > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode 100644
>> > index 0000000000..0a6920eef4
>> > --- /dev/null
>> > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
>> > @@ -0,0 +1,112 @@
>> > +require glibc_${PV}.bb
>> > +require glibc-tests.inc
>> > +
>> > +inherit ptest
>> > +
>> > +SRC_URI:append =3D " \
>> > +	file://run-ptest \
>> > +"
>> > +
>> > +SUMMARY =3D "glibc tests to be run with ptest"
>> > +
>> > +# Erase some variables already set by glibc_${PV} python
>> > +__anonymous() {
>> > +       # Remove packages provided by glibc build, we only need a
>> > subset of them
>> > +       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
>> > +
>> > +       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
>> > +       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
>> > +
>> > +       d.setVar("RRECOMMENDS", "")
>> > +}
>> > +
>> > +# Remove any lefovers from original glibc recipe RPROVIDES:${PN} =3D
>> > +"${PN}"
>> > +RRECOMMENDS:${PN} =3D ""
>> > +RDEPENDS:${PN} =3D " glibc sed"
>> > +DEPENDS:append =3D " sed"
>> > +
>> > +# Just build tests for target - do not run them do_check:append ()
>> > +{
>> > +	oe_runmake -i check run-built-tests=3Dno } addtask do_check after
>> > +do_compile before do_install_ptest_base
>> > +
>> > +glibc_strip_build_directory () {
>> > +	# Delete all non executable files from build directory
>> > +	find ${B} ! -executable -type f -delete
>> > +
>> > +	# Remove build dynamic libraries and links to them as
>> > +	# those are already installed in the target device
>> > +	find ${B} -type f -name "*.so" -delete
>> > +	find ${B} -type l -name "*.so*" -delete
>> > +
>> > +	# Remove headers (installed with glibc)
>> > +	find ${B} -type f -name "*.h" -delete
>> > +
>> > +	find ${B} -type f -name "isomac" -delete
>> > +	find ${B} -type f -name "annexc" -delete }
>> > +
>> > +do_install_ptest_base () {
>> > +	glibc_strip_build_directory
>> > +
>> > +	ls -r ${B}/*/*-time64 > ${B}/tst_time64
>> > +
>> > +	# Remove '-time64' suffix - those tests are also time
>> > related
>> > +	sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
>> > +	tst_time=3D$(cat ${B}/tst_time_tmp ${B}/tst_time64)
>> > +
>> > +	rm ${B}/tst_time_tmp ${B}/tst_time64
>> > +	echo "${tst_time}"
>> > +
>> > +	# Install build test programs to the image
>> > +	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
>> > +
>> > +	for f in "${tst_time}"
>> > +	do
>> > +	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
>> > +	done
>> > +
>> > +	install -d ${D}${PTEST_PATH}
>> > +	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
>> > +
>> > +}
>> > +
>> > +# The datadir directory is required to allow core (and reused) #
>> > +glibc cleanup function to finish correctly, as this directory # is
>> > +not created for ptests stash_locale_package_cleanup:prepend () {
>> > +	mkdir -p ${PKGD}${datadir}
>> > +}
>> > +
>> > +stash_locale_sysroot_cleanup:prepend () {
>> > +	mkdir -p ${SYSROOT_DESTDIR}${datadir} }
>> > +
>> > +# Prevent the do_package() task to set 'libc6' prefix # for glibc
>> > +tests related packages python populate_packages:prepend () {
>> > +    if d.getVar('DEBIAN_NAMES'):
>> > +        d.setVar('DEBIAN_NAMES', '') }
>> > +
>> > +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
>> > +
>> > +EXCLUDE_FROM_SHLIBS =3D "1"
>> > +
>> > +# Install debug data in .debug and sources in /usr/src/debug # It
>> > +is more handy to have _all_ the sources and symbols in one # place
>> > +(package) as this recipe will be used for validation and #
>> > +debugging.
>> > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
>> > +
>> > +# glibc test cases violate by default some Yocto/OE checks
>> > (staticdev, +# textrel)
>> > +# 'debug-files' - add everything (including debug) into one package
>> > +#                 (no need to install/build *-src package)
>> > +INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files rpaths"
>> > +
>> > +deltask do_stash_locale
>> > +do_install[noexec] =3D "1"
>> > +do_populate_sysroot[noexec] =3D "1"
>> > diff --git a/meta/recipes-core/glibc/glibc/run-ptest
>> > b/meta/recipes-core/glibc/glibc/run-ptest new file mode 100755 index
>> > 0000000000..f637986105
>> > --- /dev/null
>> > +++ b/meta/recipes-core/glibc/glibc/run-ptest
>> > @@ -0,0 +1,37 @@
>> > +#!/bin/sh
>> > +# ptest script for glibc - to run time related tests to #
>> > +facilitate Y2038 validation # Run with 'ptest-runner glibc-tests'
>> > +
>> > +output() {
>> > +  retcode=3D$?
>> > +  if [ $retcode -eq 0 ]
>> > +    then echo "PASS: $i"
>> > +  elif [ $retcode -eq 77 ]
>> > +    then echo "SKIP: $i"
>> > +  else echo "FAIL: $i"
>> > +  fi
>> > +}
>> > +
>> > +# Allow altering time on the target export
>> > +GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
>> > +
>> > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
>> > +
>> > +# Remove '-time64' suffix - those tests are also time # related
>> > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
>> > +
>> > +# Run tests supporting only 32 bit time for i in ${tst_time_tmp} do
>> > +	$i >/dev/null 2>&1
>> > +	output
>> > +done
>> > +
>> > +# Run tests supporting only 64 bit time for i in ${tst_time64} do
>> > +	$i >/dev/null 2>&1
>> > +	output
>> > +done
>> > --
>> > 2.20.1
>> >
>>
>> >
>> >
>>
>>
>
>
>
>
>Best regards,
>
>Lukasz Majewski
>
>--
>
>DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
>HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
>Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

