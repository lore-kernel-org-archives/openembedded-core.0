Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EC3CD1290
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 08:04:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web10.32877.1711958669208731590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 01:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mfaGf6I7;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711958669; x=1743494669;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9ig0cV1DfQwRKtywQHCkz6e/obJqsePkcCBxh5iko74=;
  b=mfaGf6I7yTZk1ipiLy9falYpVQUT2HH9+QUup42wz70x0EdtwOhHvC3M
   NUcFE6VPVR8M+m/3ezfUra1EW6jXZZMKD6BH4hWDBpfp5vhQmg9k6D3Su
   FSoSl9Kv5IBw4Q0GA4S5aXhMuUYDZ90y+yAEou3KCXf0h4u8szOGXLe2v
   znufGo+8OyjQViKly5RETJVkz92NjEI2EHRODaZk5iQLbmoYw3VK1B9b6
   hBkO40f3Wmn5pDyoUhSrD4gcm84CyqcSj4i1GDkMAwyLD1hJalzGoUk4v
   DRI9BmjMssA2kahD2u8ksGCapDC/FSM5IkH0FzrLAI14V05xryj2xAB++
   g==;
X-CSE-ConnectionGUID: H94H/3XyT5uOk6EdbefBfg==
X-CSE-MsgGUID: 5I6HcPl4QvKMs3wYIsMtIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10900701"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="10900701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 01:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="18035232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2024 01:04:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 01:04:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 01:04:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 01:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R79CugcJLCvwBC313XGklCY5Y2zgOy+YpAiM9jXjOpgc17IHFRMPfdmjsHDbmLwnCORMkb41SNw8qXhf0/FBfG3pLo7nskAiyMiE0HBOa+KaWZp4vn8RZjnt+o+90o0E38OeUjjyN9IsXDVbXRiz/cL3zdjFc3IxsskqgP2up7FH8B9Igi7kTo34huEx7G4F+aFxkY2s5rPpkxpESOWzpUeEK+BP/oZAYz+D6cxAODzaHSkA/uJ2yzPgI11MYi6HcUy4Twky62U1sBfEnbmL9MWp0w5v6RzsKEZhelx2pXKJV3MtiToAWn7M52iJVe7+6ZwV0QadhO5MqxqwjvyD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+b50SssuLB3Yyq8LU9mVkCeDmjvIZ5Vs2loDzDMPUU=;
 b=Kxe9/ylQVeL62sL5YU7JXXp8b98iGRqgehxxFAJnMn0iKEyXfgnyoEuthy+so9tBhp5PjH+GkdM/Kk7hsYGGIYcKGVZfndxuDhxKymO331HHrvJO4MuTYZe1lTL0mp4cQjTEZ0tLKwa5k6cpTOqN5D0yDUpk1Oi55ASJdyWIW3aT95mt/Wj98s/8a0HH0bbUg7GCw3r1kfh4zpE3W0Dl5k90iJVLFpUXi6lx+8O6h8tHq8bqfAakt2wv4cnMafYQh2GhUnnuaS4D9IIX1XU4qJ241HffqTpH7uPvxukXg9SwOGxUtC3T5wtpib0NNu9gAW/MBduehnROZN0ECrbXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Mon, 1 Apr 2024 08:04:26 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 08:04:26 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.4.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.4.rc2)
Thread-Index: AQHagwLBLQUhrxGsLkSF1GAS46PCOLFTD/+g
Date: Mon, 1 Apr 2024 08:04:26 +0000
Message-ID: <DM4PR11MB7760D2981564F547552B1974A13F2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e91eacff0-19ec5ff7-4f94-46f3-b8a2-3614dca53175-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e91eacff0-19ec5ff7-4f94-46f3-b8a2-3614dca53175-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB6549:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LKVPlfvxo3jhkGkCMn3TqWwwzwv0nGlOqM9yQ7FV0I4QahuowoEAYRZdIcHjOp1xZqOGM05rO81AU6194PWI03VfdRPSEYEkLDNtOZh55qiUUE3Ls90NVowPow7Aj06R2f6lY+5Jtlnec5XfMWqqn6a/8bqrmJzLz4hhNLjnK4PqeMkq03TBRLhRP/DMRdw+WIwdXycpz9u4U0M/fFWOS5YzJP4P808Qz7VSwpKZst6gRUHMRs0jJRg8aZFmZoSN79ccF+omIsMzWdt06ygKTImVxjDnMOKru4/XqvOjfWmIYp8QvQsSjTOE7ieqCdAf6T4YwyOCFz+UjgBHJlLWtoDMJiNCfgFB71EuiLQPJEBHayDDJuJ8cfv5H+A25oDnYjBO374CY4o97TVOr1J5g6RGK8DB1Pp7HVv3bAtLHeuES0gUK0Zb3XWh2BW+/riPpb17j9Qw3TDxAFO7BMSPHkOdG0VEzsT85l8Xl+iKD+U8XZ4vraJ4PvfumQYTDXb9XKYczqD1RAl1QG+IFRZdAnFPwdHJ3czZexrI7Laf6i0c2PWrOmCp9Nu2/oyh8Zlr/TBkOvd2DXp4N+wh7qZDDXoi0j54j+13rZte+nanCT6pyM3KhS76qyvVlR/NA0Ma
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iPgCbNl9AcZDsdsiT/1IF+2Ca5KHe7YWph6II9d+nYIn5vPsDpjg0jiHJSkJ?=
 =?us-ascii?Q?zuLUAzSvEbwcLeB4cRgcrssNV53WSJsSbRuBkTvTyRXc3VkesWY54f/D9TtY?=
 =?us-ascii?Q?XC34Kh1MbNHIWFlQcSSA5TBlPTmhulpOsm+63CaUv4PT6Y0Ix4Gf+JtKgKvn?=
 =?us-ascii?Q?/fydy/O4gdSmznQerxuNHHNoTvW4Kh/OKSwka4qWZ3j2mAiRKjAMtgQ/axJ4?=
 =?us-ascii?Q?J3JwKjDuYeaVaUnjw2NJZA6tnL2Y4FTRFdfN+NmPiKO/Z7zeTajldqJsHTFu?=
 =?us-ascii?Q?UFuqqAWhRnQt5BvR0lrnKTSS9ZHPD4Y5iWZb7tNgANpTsAqkFXScLW8tlGvw?=
 =?us-ascii?Q?0hkGn7Ti36eEDhGIH5e04qcQ4SQVFZU7tlW/KA8e3k78WbmsyDgNPVQN4akJ?=
 =?us-ascii?Q?kMyPYv6t6S18+24nSAOvtPkv1C5b+sZsbAVLy2WaCkmLfnz1mZ4lXN1tblKS?=
 =?us-ascii?Q?bvE7yE0AgTRcQy/Jws0U4SehbtQthRqFM0SuTR3GR1x3ohQNCQ5lQWcshbCN?=
 =?us-ascii?Q?dBgC1X6nn8pYyHQYhj/OKHu/pB8+ne+JS5tqLUNnAYfdB+0+5BKXxaxSgapd?=
 =?us-ascii?Q?3u0vfkVxL58ulxruCGFao4Lbqkhh8XCgAeopyQBohvwtFPvM40S5t1UVRPD2?=
 =?us-ascii?Q?FH64woo6PpFsi3bTbFJsssxRUqkkvfBysaB94qrd6MRxGl9ziAjx5aCpk8f+?=
 =?us-ascii?Q?Nn01fwjhJgXKac+j+stldQbXnBaQtPM2XoOdRaeawJq4U1COc5KkBdCZDoeu?=
 =?us-ascii?Q?/iUMpZTXPK1mfH2MsBX0WtV6ELR06oYTc6hSPQaf5Bm0mPPG5lXPMJDUcJdZ?=
 =?us-ascii?Q?BRCVtDmcbmuwkCb26Y72OpnKnN5WHhLDGkGqmRdNiwEeMBwh0Uy7PMmjSuCq?=
 =?us-ascii?Q?Ee/C0OSD/ETCkxmCYH9oJyJZh3oLB73ExcX5EMgJn0ri6aj/TQUX3ExFX7df?=
 =?us-ascii?Q?4PQXwU5sewgk8o3CiEYyaOnyc1Nh29YQkhhfgtqqL+8NX7zEfALhJPD1L/cv?=
 =?us-ascii?Q?wDtx9JT+dZEloQvlvVzLZzPagt7/g8UHscIsEoh/p1NOG7czTu+RjhnxsFEB?=
 =?us-ascii?Q?e/6B2ik0GpnZwqtGFL7OB5RhDHWPJB245zyrr2XZzt65B0B4ZDw3XlHxjCyn?=
 =?us-ascii?Q?eZ/pEhhAcubj0sWMgOcyK0ji2UHZHnt05ltfNy652OC7OFqPHmVEjKLasH56?=
 =?us-ascii?Q?Vyb+460PHk6phyKsp+m9rmpIVl4PcSMYPvaTSpMo9jddVqbKVsWhp/NUS6cI?=
 =?us-ascii?Q?Y8H0euAQgHJlcBJMWUUy/DKP4oPP8FVXWuuXN6tFryGjG7mFwcvmQlng4344?=
 =?us-ascii?Q?OTrAupCnNoLjhfbOPwe1jWFU6MkyAjfoVSXFHF+s++F/kAcjdL2Uxw9cK2cq?=
 =?us-ascii?Q?9w3R5oOjV4hG3jem7VHsmXupoeoNAy2h8FB7izFaXScZ1dnhVPO5Juq6HGBn?=
 =?us-ascii?Q?lMtF8wVAygHpT8aWnKfg5RLlQStl4IK7bOGnRn/AAxUkhYeWNag6zPtpQQ5A?=
 =?us-ascii?Q?V63cdJOoyxcLR3WmXDgl0ZR3d8qguAUS+JHQooRYzOxxR7sPzJ9HPRa3bYLo?=
 =?us-ascii?Q?1Il9DA3R1Y3KPZt8jTxg9lWqO41579is5EMkkwIk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57152c43-02cf-423d-4ad8-08dc522259b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 08:04:26.7067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RqcaPCfNkVyTSXUc3cczDvs0xWdOkIdADianR2aIUkvekhC/SmiZlS9UeIpVVjZ9omXP8gMob+TaJWJi+OP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 08:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197677

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto--4.3.4.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Beaglebone

=20
ETA for completion on Thursday, April 4.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, March 31, 2024 8:31 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.4.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.3.4.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.4.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6745
>=20
>     Build hash information:
>=20
>     bitbake: 380a9ac97de5774378ded5e37d40b79b96761a0c
> meta-agl: 5d487f3f281cd632d02b5aa16b2b1e0470f9afd8
> meta-arm: 150169d01f2f57dcd65854a2a43aebef87ee8d98
> meta-aws: 46ece2480cebc6be90a6056361f480d39976240e
> meta-clang: 73c00a5a0bebc871854e43cc1f0fe5bd5e5ad1d7
> meta-intel: e0c541c10f561b9c0087fd07ad5b79b0a534dab1
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: da9063bdfbe130f424ba487f167da68e0ce90e7d
> meta-virtualization: ac125d881f34ff356390e19e02964f8980d4ec38
> oecore: d0e68072d138ccc1fb5957fdc46a91871eb6a3e1
> poky: 7b8aa378d069ee31373f22caba3bd7fc7863f447
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#402): https://lists.yoctoproject.org/g/qa-build-
> notification/message/402
> Mute This Topic: https://lists.yoctoproject.org/mt/105241076/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


