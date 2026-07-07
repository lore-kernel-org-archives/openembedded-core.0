Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C34CC44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167194.1783401879022650745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=S2pvpU4v;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783401879; x=1814937879;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=s/dp1ExgG374ydgG4V4TBwK9mj7Otyaz9KsqoE4SeOs=;
  b=S2pvpU4v23gW+y4XKySpv0o/x9h1Z5YT7uD9Nr8Wad88lHVZy7vfmp1h
   ZizlwvdZomOKYQHTV/hvZuOcN8k8YX4Laz0pWytprOBHDDqur0Y8x3xUA
   StpqRFgiWSZOKRByqv3LxgGs/XdRqaTnLzfGRFP7iFzCd47PIHyXnKOuV
   qdq6FmKE5Uqvp3SxEr4WQOc47q3VRHRdB98Neg/1THPkzmotJPKm51QCG
   DbNQGD6i8APepFQuAgW2IItOmpBDcN1GjuCo1zEhxebVVy/IBM/Hnk3Va
   /YD7fXb+2KAkXkDDAN7FycL70EYeBNJ3Dwl9mNuxPRzHc30EVp3NQgHsD
   A==;
X-CSE-ConnectionGUID: 8FlQcuNFQbm0xp/gh2ItBA==
X-CSE-MsgGUID: A9V4OX1dRLWrusRp+uKUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83903919"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="83903919"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 22:24:38 -0700
X-CSE-ConnectionGUID: LL2tjH4DTY+iAGI28nBSZQ==
X-CSE-MsgGUID: EhwXv548RIaD3JGn/15nAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="255828240"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 22:24:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 22:24:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 22:24:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 22:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2UZdMB6GWp2g2NnBuZlLWNiipQklnJ0plChZJlZRN2hcfxujBRHO0aVFQyklb2aD5sci90Jntnq4UBC382KttwArjCtEiq5pXPURXtzauJKTM/jO1QAsWo4kOeaFiFMWPIWWCRxdFxC1fLGgh9F/FeF10WeeEp3b39PlLFqF+1/w8irdYxteVCqzWhg8Pd7Fg3g75NClT6YAd1p1xZ59qIrciLFvCf2BXEdVOI1jsyL8U34fyyJV1o4fUx/osqFAfxN3229sRlyhRVeXtWL6ugBBrhqlN12+bzBC+LmzX80Rif7ibHViZ7Noz5zhuZEeU/YsxmxSA+vkVsTXYwKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/dp1ExgG374ydgG4V4TBwK9mj7Otyaz9KsqoE4SeOs=;
 b=tZikCWINskgHmgWuNrasvYbG3VUlOJmLD2J7ON8EEj6yc+wd34gYvrMRKw4TBFelahV188E8WJ2IOLwVqrcx+mJG5RV8TL+nzlfMxNm+egUCEU8q0YwHs9zu6AKoPxf810nLA1TeKMPEWB+2973yWE8+i0JOj5/DLeVe8G1NqUJ9JW1L/b1HvqDkLzpRo+TKgyNVRTkQ9BZsORLRr4NMw0CuTcR7vOHOK51O0PzHzZB22IAanLQ/11agKMb/c3K0WhfzuMmWyg/GLA1Du9oqQBBgoAKbcDx+dYESIwvw/84NA+gJGO3yKNQcD99CJLyRztJxIwqoR7DyfCm5u2ggBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 05:24:29 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 05:24:28 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.19.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.19.rc2)
Thread-Index: AQHdCk8LEdpvsxjp70GYgaUf4NGvVLZhiucQ
Date: Tue, 7 Jul 2026 05:24:28 +0000
Message-ID: <MW4PR11MB7029D0D8C5AD35585D7679B8F4F02@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019f24094983-53d3f366-c7c4-4c6d-a05c-8c8377b42bac-000000@us-west-2.amazonses.com>
 <DJOAI4RT1KZV.3C0VW3WMNPM9I@smile.fr>
In-Reply-To: <DJOAI4RT1KZV.3C0VW3WMNPM9I@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|BL1PR11MB6004:EE_
x-ms-office365-filtering-correlation-id: 67393083-7dfa-48d4-09d5-08dedbe8046d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|366016|23010399003|376014|1800799024|18002099003|22082099003|38070700021|6133799003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: OSbjtyTCJTrGoGE687AWigTG7oN3dgYYfqJOTQWRCM7y7kleymplzl2wNJE/24yoSZAJh1NRYhVX3gtSGF0nabn++BEUGADvi6y4xEeWibv+DroG5GHuAhYlCriRLsHq3Y9CwWLFIcVcZDfgwdxSoJ2FlOCvyEKTEUTRk/KA4g+qJHojeKXFggzgt5XRhJSMySTAqLsyd7W+NTu/PAdKzX4kW6vruhCpUPM0WciWHSniGljEbExgJbUwiCdu5SELG9nFuGobhtkLSUhjtnn6m/Jk2rvbOVElDqOMNCGxAv44HEXndOsJYJX0UB8W9EdbF5+dAa0DpBAFSSnL/QVVbFg/LVMeZSVj5FsICBZLeux0PCUvLa+CAUHQYBaRV8PPrHzJsaIft3aryMkfe5cmp0JcpTh/FzwJkpmAyawLZtEUOoQGP5wb5JsCFHTXWHF5gixvgU69ClNZ1D9JLymxeV3iZeteD7Rti3jcfUJLnl9ghW/H1uwTUmYmF6jKOUoY7fhqAMsW+/CuVQf11DB8JQheyqnJyqW6msFe7u7jd2qumsHELgCEMW7DJbiXnegsZH+8ik/n77CK/czqKUTB4yosBrb/qd2BxsVJD5C4J65trUbSNkHc8UizYGEAQfnc/4VazZ/aOuaw3Fl1bbV09gX9O+5loZbBhf7I+qG4pCI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVBIODFUQkdxT1dieTBjeE1Pa1BwNmhVVFpWU01kYnA5V1dKMUFPM3o3dU5j?=
 =?utf-8?B?NFpocjN1VUhCVzRZR0grbnJoS1hLZ3doUGlZdlJzSEVIRStlbmFtWDZpcWQv?=
 =?utf-8?B?SkJkcjlRcmV4YThUbm5mS3crdFBXaVg2b1lNZ29lQnloNzA1WFZWYnRJSjQy?=
 =?utf-8?B?VWJwOERPODU1QmEzUUNiZmhBeHFsVytiekl4MVZndFp1Q1FFZUowTjdNeHdp?=
 =?utf-8?B?aFk1Z2U5UFlFTUpJVDFkRXRaWTVmUy9uVUdBS3hFbDlYNWJRbWpuWitrMDVL?=
 =?utf-8?B?NENkVXpPeEZxQzlEM25Rdmc3MFNud0M5a3RNMkdaWTRJYUEwd1ZRU0xkT282?=
 =?utf-8?B?VnE2cTNCU1lYQVJlb3J2dnpJb05qQ0gzYWpWblRUUjREdEVsbFlvdFdUS1Fp?=
 =?utf-8?B?eHJQQUM0WE5lUVpWeE5Hc004VHJBOHFyVDFpOFUySVRKb2VaOWZ6ejVlZUVZ?=
 =?utf-8?B?VkEvZStZZzM5NitONStQMkZYOGZ3S0oyUW4zekM0NDNidmJKQ0JUcHh1ZXpt?=
 =?utf-8?B?ZFREZ2pkWktmT25DK1B2UjQyTERtdHFDWmFkeHZSbkprY0RKOEF3dS96czdS?=
 =?utf-8?B?ckJlajA1YTNTdEFDOGh3RHZMQURFQzQ4blZRN29MK0t5bm5VTjI2YTAzRzcy?=
 =?utf-8?B?OXpvQk1Dc3BzRU8zVEVJV21VRi8zL3dtMFZaZG5aa1ZBY0w1TktHNHJ3cnNy?=
 =?utf-8?B?Vm1hN0JtdGhTVjRlOXp1c3Q3dWZTa1hEeG51MGRmaTRaaE51dlNEd0JQWlVY?=
 =?utf-8?B?N1prR1R4Z0J2RkN5NURENklNeWx6R2NoQW8rQnRjZkF1Y1lZVnR4cWd5UUNP?=
 =?utf-8?B?WDZvb2o1LzZTRlpQODhuVksrOVZUeFNONkZnZExoUHdUUzc2NGN0ejloRld6?=
 =?utf-8?B?Y05PRU9WYmxuQjV3Um5EcjNEWlVsc0F1U1lzcW5WOVp2M2Y2aFFVSEZSUXA2?=
 =?utf-8?B?eWYzQkRlTlJmd1RpODE3dWllYit0c05MVzJtcGRrbWNMaDhGNVh5SkVLbk8r?=
 =?utf-8?B?NmpTejl2bmZNVVM3N1ZuekNrcndzUW82dVM5UHFTaTZTR0dQclAwbUpPNVR1?=
 =?utf-8?B?RWlKZVZpdFRtSDZYZlpYbUEySTF6WlpCNmhVWUxza0lIejBkOU5lTm1WVEto?=
 =?utf-8?B?RHlVbDg5Q2lqL2dlR3N5bjIzREF6UE5WbTJxOGdsaGdGaEw4SlRnWndBNDFT?=
 =?utf-8?B?elloR1NIeVlNeHhSbThsL01KM08rWm0yeVV2UUtWZ2x6K1Jlc2xzdDZTTFo3?=
 =?utf-8?B?RU5qb3RjVXZqT2NaQnpoZjFDbUNDS0tsQzJSQlYwUktFTERBUkpXcUxZSnVo?=
 =?utf-8?B?TjlTZy9HV2hoejg2K2RXYU1uM0RSWG5KeGZLVEk0UzZxa3EwQ0ErL3hvK0pF?=
 =?utf-8?B?UG1vWnc4V0ZQV0FoLy8wUElmVXNhNFlURXRPYkhDNnVxcWVtOGRnWTkxemFo?=
 =?utf-8?B?Q2Z0RnVSR0hOREQxZFIyM3B1TEdCeStCaFZzRkpGbCtaeGsrcnhmU28wTzRE?=
 =?utf-8?B?YTMzUk9janBTSnZMWkdBUTFwSDIxNDY3S1VaUnU0V29YdDNWWWhzaVZxYXA0?=
 =?utf-8?B?SUtmdWttc29lV1MyYXBqUTU0VEIwTmlQNmRNRncveThuU2dURnFIS1JMbThT?=
 =?utf-8?B?MHB5MzdLQm1HVGJPQUtBMEtqWmpxem5jR1J6Z2VHWFNTZ3JZUUF6L0lWQnUr?=
 =?utf-8?B?SjltOXBFZjhWLzUxNzJUZlNVRU1oQlpIWVo1eHpuUDdYR3lzaWc0QWJXY09z?=
 =?utf-8?B?UVp3RnhqWXVpUmJLMFovb25WVUZoeXNjZFBZVVV6NnMrRjJJaHpmVWloMEtM?=
 =?utf-8?B?aVhQcXZXYjRJdmhHRWJYdlJhZkpBRmpyNXZSUFl1R0hDTUNQL1Z1dWc5SVo0?=
 =?utf-8?B?d0E3ZE1OeExxWVJHb05LTk5FK0R5Zlhya3NYTVJWL3JNTm9kd0VkUDd3V09o?=
 =?utf-8?B?SXU4U2tpVG8yQzRHWkxzSEUySkR2SjI1aVF6THJrRUNMWnhqMFZqdDlzc0R5?=
 =?utf-8?B?ZWY2anpqS0llc3M5eUt3R2JRdWVoNzBWSVVVanB5dkticGlnYU9SVzQ0TWg3?=
 =?utf-8?B?OXl2cmpMbzJoZU81YjZiSXp5M3o4Zk5lNEhaaVRnMlJ1WHR4cmFrRU56dDZv?=
 =?utf-8?B?dHNyTTYvaW5HWTdyVHNueUNpVWtYbzNiNmNaSHIwQ2hmUDN5YnNXczNEcDVU?=
 =?utf-8?B?b290cGNhMFBEVHIyTnRvcFJJaHdJVmlYbG53VWh2OFR0YVZrSVN3Z2xHUXBN?=
 =?utf-8?B?dVZ4ZDJIQ3p6TFB1aWpWYTlab2FLOW05NXBhZk8yMFc1cXVaM3RTbmI1M0lv?=
 =?utf-8?Q?XuKF3uH/nn5KCK9f9w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Lw81NNT5yQrS2IAeZREkDZz4gyR/V8r3SI379tm/+0ms3t12esMPH8TD+ILk/SmY7TuPTeOsuo2Xkg3LKg5iM3FGMSJ6p7HKLD18h9Fg4v7CPXcRauaePDyVwbLvY/xYSPMPDmBVlGmfGh+pWuPsSxHZFh+F3N24tI0HWWTGL9DmTfOo/7UEW07hfc8ml6bC+G7tKNmI9a/N3yIwo4MMc0L8zDCBXHMTKRUTuvd6asLumGmQzn3KBbWniBI78+MwrTHAxN7mbRVpNkWEJpLJG/w+EhUE3muYrh0fDfSfC7IPV+WEFyM2e03sxbknhsLPmes/KEb4UEBMaKWHa0LjBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67393083-7dfa-48d4-09d5-08dedbe8046d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 05:24:28.6046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVS5D5ZQLf2gZl7JMUokYGPC9lGeZdQ+KoP0sOUoA6VzOPtPl3hBODT9SO7wc1FaVGTxDpkbENihJs5rkJVkXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240348

SGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0aW9uIGZvciBZ
UCBidWlsZCB5b2N0by01LjAuMTkucmMyLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0ZSB0aGUg
Zm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBmb3Ig
Zm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRpbWUgYXV0byB0ZXN0
IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQoxLiBBbXN0b24gTGFrZQ0KMi4gQmFydGxldHQg
TGFrZQ0KMy4gVGlnZXIgTGFrZQ0KNC4gQWxkZXIgTGFrZS1TDQo1LiBSYXB0b3IgTGFrZS1QDQoN
Cg0KRVRBIGZvciBjb21wbGV0aW9uOiA5LzA3LzIwMjYuDQoNCkJlc3QgcmVnYXJkcywNCkRlYmFs
IEdob3NoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhIGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6IDAyIEp1bHkgMjAyNiAyMzo0Nw0KVG86IHFhLWJ1aWxk
LW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyB5b2N0b0BsaXN0cy55b2N0b3By
b2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZp
Y2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTUuMC4xOS5yYzIp
DQoNCk9uIFRodSBKdWwgMiwgMjAyNiBhdCA4OjEzIFBNIENFU1QsIFBva3lidWlsZCBVc2VyIHZp
YSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPg0KPiAgICAgQSBidWlsZCBmbGFnZ2Vk
IGZvciBRQSAoeW9jdG8tNS4wLjE5LnJjMikgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxk
ZXIgYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4NCj4NCj4gICAgICAgICBodHRwczovL3ZhbGt5cmll
LnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by01LjAuMTkucmMyDQo+DQo+DQo+ICAgICBCdWls
ZCBVUkw6IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1
aWxkZXJzLzI5L2J1aWxkcy80MTMxDQo+DQo+ICAgICBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOiAN
Cj4NCj4gICAgIGJpdGJha2U6IDA4ODA5NjNmZWE0ZDkxYTAzNGU0YTZlMDA3ZDIzZjk4NjU4YWI5
ODYNCj4gbWV0YS1hZ2w6IDc3MzhlNTE3MDY2NDJkMDYyZTk0NWRkZWFiNTBkMTBkMmM0YTU3YjQN
Cj4gbWV0YS1hcm06IDIzYjU3MmM0MGVhNjcwOWFiM2Y4YmQ3YWJiYjVhNzk1ZmMzNjMxYzINCj4g
bWV0YS1hd3M6IDZjYWQyYjE3OTVjYzc2Y2M4ZTk5NGQ0NzI5MjYyNTY0ODU5NDNmYzYNCj4gbWV0
YS1jbGFuZzogN2NmNTRmNzBjZWJlODk3ZDg0NGY2NDkwMjQzMjJiYjA5NmQ3Y2I1MA0KPiBtZXRh
LWludGVsOiA1ZDE1M2UzNWI0ZTc1MjUwNWVmZWFlMzY4ZjE4OGZhYzVlMzFjZjMzDQo+IG1ldGEt
bWluZ3c6IGJkOWZlZjcxZWMwMDViZTNjM2E2ZDdmOGI5OWQ4MTE2ZGFmNzBjNGYNCj4gbWV0YS1v
cGVuZW1iZWRkZWQ6IGIwYzJjNjQ4YTFhZjg5ZTdhOGRkNGMyZWM4NDFmM2JjMGVkMGNjYjkNCj4g
bWV0YS1xY29tOiBlYzgwYTM2YmNlMTFkODE4MmI0YmIyYTZmYTAzNTlhZGZlY2NkZTBhDQo+IG1l
dGEtdmlydHVhbGl6YXRpb246IDlkMDAwN2EzNjlkZWI0YTYzNDZmNWFiN2E5ZTZkNDMyYThlZDE0
ZmUNCj4gbWV0YS15b2N0bzogMmY3NDlhZTQ3N2MzYjk0ZGNlNzEwMzhmMDI1MTgwZDdmNjEyZGFi
MA0KPiBvZWNvcmU6IDI4MTRmMDk2MmY1NmM4ZDFhZmE0ZGU3NmQyODk1YmE5YjVjYjc2N2QNCj4g
cG9reTogYmI5ODM1NDY4NTc4MTI5NmUzYjM3MzdlNzc2MjQxMjEwMGYzNTljMg0KPiB5b2N0by1k
b2NzOiAxYjgxOWQzMjQ3ODBhNjk5ZDkzMDdhMmQ0ZTY4YzY5YjU3NmFiNzQ4DQoNClRoaXMgd2Fz
IGFuICJhbGwgZ3JlZW4iIGJ1aWxkLCBzbyBPSyB0byBwcm9jZWVkIHdpdGggUUEuDQoNCllvYW5u
DQo+DQo+DQo+ICAgICANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZ
b2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5v
cmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnDQo+DQo+DQo+ICAgICAgDQo+DQo+DQo+IA0KDQoNCi0tIA0KWW9hbm4gQ29uZ2Fs
DQpTbWlsZSBFQ1MNCg0KDQoNCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQpMaW5rczogWW91IHJl
Y2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NClZpZXcvUmVwbHkgT25saW5l
ICgjNzI1KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtbm90aWZp
Y2F0aW9uL21lc3NhZ2UvNzI1DQpNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9tdC8xMjAwODc2NTkvOTk3NjEyNw0KR3JvdXAgT3duZXI6IHFhLWJ1aWxkLW5v
dGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtbm90aWZpY2F0aW9uL2xlYXZl
LzE0NDI2OTk5Lzk5NzYxMjcvNDQwMzM0NTUveHl6enkgW2RlYmFsLmdob3NoQGludGVsLmNvbV0N
Ci09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

