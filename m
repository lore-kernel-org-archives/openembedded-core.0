Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FDAE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:43:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web10.130290.1734619393966700249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=aVzOaeFz;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734619394; x=1766155394;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=v+i1vg5aWgd3/UldOEnOLkEgVDC4lRL2sjFQXun1XRg=;
  b=aVzOaeFzhNK31ubeOD3XaawDHtnEjGt6mIpnBlCxDmP1iGKIrZIVM0Vh
   GmQXQEF4FiUC3YsSQFaiPNOam75J8zxIzXAh1Cg3OeDEUH5GZB1BPyz9Z
   Dry6vWkgLnoJ6WWuBajvmKo+/gRrOvykw5FTOnnxWeeRHwM0P18vTpq44
   zELF0dKCcMSTbDNpXoWVjTJTBP+Qbkpq+1jaVoCJa37ndca7YVy/w4QxN
   0LdKFkPko732xzXwtNGgfgYm5wXk5kuHI3vJXwkC3Q8nOnCtlCUqWpyyz
   eeAkXfd/jN4SobEaGas49eNyyp+lQ30Cb8cmoLvozypKidJ7Sdg4IRLQP
   Q==;
X-CSE-ConnectionGUID: Ilals4DbTDmwwNlWgnUudg==
X-CSE-MsgGUID: UtH5fBgrTvO7USb3lQrEgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35029181"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35029181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 06:43:13 -0800
X-CSE-ConnectionGUID: RW/7enmqSXCBivb6YWMsPQ==
X-CSE-MsgGUID: X7nobpszTl2G5vhT/qmXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98005670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 06:43:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 06:43:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 06:43:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 06:43:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ume1xY5f9Yer2sBUN0D+Oq945OVuBKT7x9uT4l09yKoMzAcHby57hiuhcyEfOAjLW9Oqbcsm7eDrIGxQBiEMQJhIC8G8HKbh/RrLFdtrgxvB0pwLnFO4/v7vqb24GIxAYZFGzt8LtmWngZ8Kg/ZUuCXoWnKCf98PB7D64oErC2jS7xD7vDwtY8DeRSObAIHwmwmLZ/XFX1w3HFj2PBrjSPzFERi8w8Ad75w4ABRJTPu0/7jLFzpPD4riSB0oXzJedq75+wHlpWj6URQOBXk2tL0yxC5dikJu+UinvrmAMPtLsO54R2ET4cng62J3lNhSKEHCUjv458F2UyU3nvUFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+i1vg5aWgd3/UldOEnOLkEgVDC4lRL2sjFQXun1XRg=;
 b=EwK9xKcPeHgGvcYZE6NcRdhgFt+BCVuCab9272FKyLXjyP+iIeUEvBiPHkLSXOArMVXDWIyRR4t4SK795s4mYCRhyRu/NLYJLxRju3jKwjCVKAIiHCOoPztCeuuCI8+fSVvbLSLetjnj1fOzLrh4iTjkhIKd5avbcC0zzJmy/QtJc7NAkxcK1vLOLJwpAyKDMz9k/Npj0+ZZvKyj964FEW4ueK9XqpJ6vYLtA4l/q5+jmgax8quP0+VKlTIezn6YyZZYYKeBbF7vEN/sQWTsEgq5HZEBsDmz63McyiduUrMyCmwy1RmU5qVDcI4NYenVc2aztrloAjevsxWN/GQ5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:43:10 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:43:10 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.6.rc1)
Thread-Index: AQHbTYeweFbKqynR8EeqbgIxtv62zrLtrOYA
Date: Thu, 19 Dec 2024 14:43:10 +0000
Message-ID: <DM4PR11MB7760A970BBABE6634C98BEA5A1062@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAGDS+nkB+EyEg8FOQUbjt+aeAs5DBLEtsMojDjyarvLM=ikT4g@mail.gmail.com>
In-Reply-To: <CAGDS+nkB+EyEg8FOQUbjt+aeAs5DBLEtsMojDjyarvLM=ikT4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|LV8PR11MB8680:EE_
x-ms-office365-filtering-correlation-id: a8deada0-9e1e-4683-57ec-08dd203b7574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bThKaGMyZWhyRkw5aURaZnhjV0xXOG5iMk1VTmVVVWdmaE5pa3ljT0hQSmtv?=
 =?utf-8?B?UmhyeEcydjYzRkliRWhINmpINElGUHgvZGRzYXpYQnllU2tCRkI2YUxPYzFN?=
 =?utf-8?B?RC8vUGlLNERvK3g0Z0kyb1ArYkFNbE9YOEhHbDFsbGFWWXBWUVhSbVdBL0lk?=
 =?utf-8?B?Z3RLcjFBMmVadmswVVRwU3Nkc2JaaDN2S0pkVHJVOGZocTVmWTBvdTFLU2ND?=
 =?utf-8?B?M0dnQTd6NXlwK2RiRXhYZlZ6bXY2dGRrOUJJY0tNVC8yMUNpbDJXbFdROG5l?=
 =?utf-8?B?Q0JUMEdOTHdzQTdScUI2eTdwb2o3Wm9VRUIxNHliNHRyYUFGSlFkc25XbmN1?=
 =?utf-8?B?QUVHb0lpTklGTDErRU02MzFFd1NodzFGa3FVaFJzdG52L3lrTWdoanJXQit0?=
 =?utf-8?B?elB4Y09WQUJHdzZ5L0d5YmxycWJ6NHJDNHptWFl6cXV1bjlhL0x6VnAwdW9D?=
 =?utf-8?B?S1JkTVpWeWJXRE9vK0dLY2R0THZUZTFsSmIrYno1TkpBMGdwNXJlcEZJWUVN?=
 =?utf-8?B?QStMQnZCc09pTExNb29YMzgzcUV2VS9SODgwUERQV3dhTTY1aHBjWEZocXJE?=
 =?utf-8?B?UmhtQ3lSdXAxSGQ3Sm1lODRodUZBM1RNVWgxUEROTDgxemZyMUxmM2JPaEVE?=
 =?utf-8?B?dkUxZmFBQ0VEUXcybExxV3JHc2NLaTFZaFE1Sm9aSElFeFM0NlI1Tm5VSE5i?=
 =?utf-8?B?VXdxWHdkMno3MGZNRVpKMjA3WE1hbW1UaDZjeWpzZ0cvdGt3aXVBNXdMYmpQ?=
 =?utf-8?B?MUNSaWF0RDJyWVlPaWV6NFNlQVR5OEJhSWg4NjMvbGZrMFhmV1BZb3BjMklN?=
 =?utf-8?B?UTdMYlN3enYwZ21jZDF1ZUFHTlpCSjJ6L0hzU1BUcGdsSlFoajNFWVpJdmRi?=
 =?utf-8?B?RGs3cWJaTmJNZzV5aXRnWE9wbUM3SGJwY0lnUTJLS1N3RE50d2NndkN5cUlY?=
 =?utf-8?B?RllEa2dOK0FxbUdVdHJkWW9oczF0SHZ2QjUrQkJXVVlGQXc2YjJwbndaMDhj?=
 =?utf-8?B?SnozRThuT2tOSHl0YjZKMWlKWWNaM0pWYkNVVmY2MWtwRVlMa2ZXZ0tIRCth?=
 =?utf-8?B?YlBhdThyWTJyMGZJaVEvdGFaQ3JmeHRmdE1qeUVENVVYUHBkeDNlUkRtSEpu?=
 =?utf-8?B?UFliKzBqZ0VXQ3J5dGRaYURMOEVXMzFieStPbmN1Q0RwV0JZVzZsdVNRMmVk?=
 =?utf-8?B?aHMxTDlZcXZ1ZjF0ejBkbUVBRXB2dDU0ZnBBK3FQNzNZWnYwZFZTQzRCbFB4?=
 =?utf-8?B?VGpiZjJKajRoLzcrblpUOGVNQzRCTWtIWm54OVg3VjJXWkpoRFFjUkF4a0Uy?=
 =?utf-8?B?UFlEVEhpWWFPKzZaSDBOc0hBY0xXbXBuU25sU0wyRWdETkQwelFtNTFocStP?=
 =?utf-8?B?em41SzRuTEk1SUNTaHU5RXVkUVhEam5LV2wvam42dXFLaDdLdkZONDNZeGlQ?=
 =?utf-8?B?QkI5dm83YTBVdWU2bWEraFJtdUgzVyswdFJZVTc3TVJvemFHK1pNYlhDMFJo?=
 =?utf-8?B?d0VpNlhodE41UHVtOE5TYWxSdzFPd1V3TitoSCsrZThrV3JnZWkxMzBCZU0x?=
 =?utf-8?B?YVo1VVo1VmR5ZTA3V29TL0lVdnkzMzVxV1YzdTdRWGRHem5FSjlReTE5MkQz?=
 =?utf-8?B?REFYVWE4MEI2OWFCcFgwZjcrcjB2clc0dVJuRlRQMVR4Rmp1RUxSbUNJL1BT?=
 =?utf-8?B?azhxMzkvZG92SC9SMG5TWTB4MXYvUXc1QnlrSXNkT3dGdXVCY3JKMGcxOFYy?=
 =?utf-8?B?TExCbGd6c2J4MFFTeGlRMzdTbi9nZmhNUDFOR0lBd3NpRjJZOUY0bm5pOWhw?=
 =?utf-8?B?aEZodTJwNFU3Ny9rMm96a0lWY01GNFFwVk96UHo3c1grOHh3cTdTNHV0NHor?=
 =?utf-8?B?QzJOMkhtbmVMZGdzV2QxdTF4QkRsaFpzbzByNUxKZGVMRFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUUwcDVsZjR1RStwaVFWbGlSREo5aDI2eWI0MnR5NHZNd1owRXovb2hoOTNE?=
 =?utf-8?B?YXpmcWRNVG95WEMvcjY1c1pURTVidlhGMGpPY1BXVFpqczRhS3JzTVFDWm8z?=
 =?utf-8?B?amJieThaK2tDV0ZtMWJZSWJPSEc1WHpEcmNKWHJHNnB4Qm9UUExDODRsbEhN?=
 =?utf-8?B?YXR3cHJON3pNWTFMMkUwcHhzckJlcVV4c3BqZytUZUtaV3hvUmFaZ0twYnhT?=
 =?utf-8?B?T1g5ZGJFbEJEM1I5bE5IME9IV1FyWWZ4RjRxTSsydS9HYXplK1pwRlYzNWRx?=
 =?utf-8?B?ZkYxVGZmUHd2ZFgyVFNUUFFzdnQyb2RSendmWitFL1ppU0M2dXVUN3dmQUhY?=
 =?utf-8?B?alRPRFJTbWxEbE83V3gzbEpKNHBpdWhmYkV0aktyeU9yUVArU1NUUVdNeU9Z?=
 =?utf-8?B?K0wxb3dUNWRjS0taODlVUXl1a3JmMko5OUZESUJZNXNaTkJDYm1qKzliTzBR?=
 =?utf-8?B?QnA3cEI4ek12RTUwbm8wVE5NZGpnUklneWJTcVRpUmdvUjVNZDh0VHlGNGNZ?=
 =?utf-8?B?R2Jlb25qbXpsWVRhWFI3d1BVRDV6TndxSklkcWNQUjdraFY1RmMvY2o3SHZU?=
 =?utf-8?B?akZBYzZTeWtZbnl1NVJ3V0h0Q25Od3NSUXE4K2RSQ2tzWUdjUHZ2LzRsWVcv?=
 =?utf-8?B?NUNUWlAzQUVzak44OW5rZ3JsbDhZVmhrQm01d3ByUHMrOHY4YmFnL2NoK1Nr?=
 =?utf-8?B?KzBaMmFhcUFUNWFHRHZKc2ZkWVFtUzBNSDdxNUFXQnpldlp5RTN4VHVEL1Iw?=
 =?utf-8?B?VzUwOWsrYVo4WktXQ2lZZ2NIckZiWGZvd0gyc2VPcUJXcW9ISmM4dFloWHkw?=
 =?utf-8?B?ZGwxRlBhYnpzT0thSld2YzJuR1Q2bFZPNndGcHJuUGNpMVUxM0U4RzlDMU1j?=
 =?utf-8?B?VXJ2a29FRU5BUWk4V3hpbS9OWGpVUlUwem5tUUQrYU1KYUt0M0VtTmErcGhR?=
 =?utf-8?B?aDcrb056dCt6U25oYkUxblRKNUdKR25DT3pYcTYxQmpGVktLTUVwL0FpcG5i?=
 =?utf-8?B?dkExWURDajBwSkNXSGt3ZlNydTNnaFVNVkxhQSttbTBzQm1BUjVrME4vTXBU?=
 =?utf-8?B?c1V4N0V0VmRDWFhodVNtTkE2a1lvcGVWL1l1c2pnZU8rMk9nMFk5SHkwU2tz?=
 =?utf-8?B?bG5KOU42c3NxQ0llbGQ2ZkI2RUNvazFmc1p5aDZFaktWWXR5WjVQdVYxdVRK?=
 =?utf-8?B?N2JEUGZCZS96MTA0MEtCZ0c0WFNCVnY2a0VOZUdFR3BWMGEyVCtYNkNQZmVI?=
 =?utf-8?B?TTN3d29NU3BjTVVCc3F2OFBnUHozeGhIZmJRYkVXYVVwNXRORjJFT0pDeTFv?=
 =?utf-8?B?WUhhZVVIZVI0cDdqOXVWanI0ZjN4alhQbEhIOU1DTk1NUW9iS2JTbVdEdldP?=
 =?utf-8?B?Myt3ZzNRT3BobFpVV1dkNG1KWHhCeXlQRXNtOWFua203NW1PZVpuRFJXbGRr?=
 =?utf-8?B?TEQ1OFhEbytoUWNTaVlrdlhKMVlCR0VYcWdsZ0pNeVovYXdOZEM1VmJBcU9m?=
 =?utf-8?B?RnhJeCs1akhDenc3bUFCclRPVTVTUE5ta1BmdU9KTGt3NFkrWlpnd3hqQnJV?=
 =?utf-8?B?THFTQ2dZanZ5NkVaTnBraVFzbGlOVXFNekRtSVErblgxVTZWUFpjV0VkSlov?=
 =?utf-8?B?OFRRY0lDZ2lwRTFGNE5nM1NuR1F3d1VFU1hYbnZwNG9Vb1F4SGtsa2lNeWh6?=
 =?utf-8?B?bUdrR25mRkx1Q2tqcHZuWDRVVlFrZWdtZGpnOTAvcXVGYVAxK1JDMnJvOFUy?=
 =?utf-8?B?SXBpM05kN2ZRRFloYVErQjZNTjl5Z0Q3dVZuVTNDSVdROVo0NjVvVnJFdmdY?=
 =?utf-8?B?V3hjSUtPQWlkR3p3NlVzaGtVV2J4RHpxd0pEVWdmT2JRbHpRMm9BQjY4SHUw?=
 =?utf-8?B?bUY0Mlc3WEFnc3ZGMmQwQUgxYnlwbE52cXl4c3hyRmF6NDRPV0hWemt1ay82?=
 =?utf-8?B?WjBZYWVmU0dienY3d1lNVGd1emtINXlYWlgzNjBmWDdML2ZFMHRUR0t0VFlG?=
 =?utf-8?B?V3JqdUwvMHpsZUF1UlA3TXpCby92c0VLdjZBbkwvYmxROHlMOEdwS1dxV0RB?=
 =?utf-8?B?clZ5TnNtMjRQUEdyY2VNaVV6VFI5K2x1V1ZvRVVoRGVmelNOcXR3dlM5UHZ6?=
 =?utf-8?Q?DF76KZQGE3DIZYyDwKj31HpnN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8deada0-9e1e-4683-57ec-08dd203b7574
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 14:43:10.1695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vY5+dcOiq6mf05uk19kdmI6Y88OPeiAJK89wcT2N87YX4QrCQPZsXhdNXDvkRogUWJaNWcnE2dPc9jWRxhZaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208918

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTUuMC42LnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6ICANCmh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvY2dpdC9jZ2l0LmNnaS95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9
aW50ZWwteW9jdG8tdGVzdHJlc3VsdHMNCiANCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8g
aGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4NCiANCk5vIG5ldyBpc3N1ZSBmb3VuZC4gDQogDQpUaGFu
a3MsDQpKaW5nIEh1aQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFh
LWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4g
bm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBTdGV2ZSBT
YWtvbWFuIHZpYQ0KPiBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFNlbnQ6IFNhdHVyZGF5LCBE
ZWNlbWJlciAxNCwgMjAyNCAxOjUxIEFNDQo+IFRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90
aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBi
dWlsZCAoeW9jdG8tNS4wLjYucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9j
dG8tNS4wLjYucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMg
YXZhaWxhYmxlIGF0Og0KPiANCj4gICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3Jl
bGVhc2VzL3lvY3RvLTUuMC42LnJjMQ0KPiANCj4gQnVpbGQgVVJMOiBodHRwczovL3ZhbGt5cmll
LnlvY3RvcHJvamVjdC5vcmcvIy9idWlsZGVycy8yOS9idWlsZHMvNjM5DQo+IA0KPiBCdWlsZCBo
YXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogZjQwYTNhNDc3ZDUyNDFiNjk3YmYyZmIw
MzBkZDgwNGMxZmY1ODM5Zg0KPiBtZXRhLWFnbDogMmUwNjA3MzI2OTFlZDhmY2VlNjcyNWNmOGVi
YzkyZTg4N2JmZDE4OA0KPiBtZXRhLWFybTogNzA4ODI3OWMwYWIwMGM3ZGFiZWZkZDQ1NDQ5NTFi
NDc0NmI0ODQ3Ng0KPiBtZXRhLWF3czogZWU1YmI1NTY5NzcyM2NjZjY5MjU5MmUwYjM3YWQyNjg4
NjllMWMwYw0KPiBtZXRhLWNsYW5nOiA5ZmJmYTlkYjMzMTMxYWJkZjM4NzBhOTRmMDAxOTllYjUz
ZTI3NmU1DQo+IG1ldGEtaW50ZWw6IGI2MWQ1MzEwZmNiNGU1MDc3YmI0YjFkZTAyMjhkYzQ1YmE2
OTUxMGYNCj4gbWV0YS1taW5ndzogYWNiYmE0Nzc4OTNlZjg3Mzg4ZWZmYzQ2NzliN2Y0MGVlNDlm
Yzg1Mg0KPiBtZXRhLW9wZW5lbWJlZGRlZDogYjhkMWExNGY3ZjNiNzY0NTdjMzY3NTIyMDJlYTdh
ZTU4ODFiNjY1NA0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiA0NTA5NDFhMWI2ZGY5NjI4NTY5MWU4
YzIzZDRmMzMyZDNjODhhOTk0DQo+IG9lY29yZTogMzM2ZWVjNjgwODcxMGYyNjBhNTMzNmNhOGNh
OTgxMzlhODBjY2IxNA0KPiBwb2t5OiAyNTQxYTgxNzFmOTE4MTJhNGIxNmU3ZGM0ZGEwZDc3ZDIz
MThhMjU2DQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0
aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZw0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzQ4Nik6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1
aWxkLQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS80ODYNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTEwMTAxODM1LzY0MjQwNDQNCj4gR3JvdXAg
T3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWls
ZC0NCj4gbm90aWZpY2F0aW9uL2xlYXZlLzEzNTgxODAyLzY0MjQwNDQvMTc0NjgxMzg5Ny94eXp6
eQ0KPiBbamluZy5odWkudGhhbUBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IA0KDQo=

