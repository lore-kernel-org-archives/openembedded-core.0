Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC0BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9412.1785238456574837693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=N/zMMgF9;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785238456; x=1816774456;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HAt1OjOIeI0mtY3HqjmwW+Bc9uV42CywV3diCfziQms=;
  b=N/zMMgF9GsSgKCotrV2q1oECLwmH8YeODr9nkTlsBIMBSe1cO4QS1DOc
   jGa5H0kBHNei8udy/dmuZUsoQfTE1x4Gg1ZIyCGMO1Mr3KJbIhNiJSZzj
   RDX2sGuYWXil4RmheTObqcKxslovWmfqAN/DHvjkv/Gzw3C3BnSwiW7zs
   yNgJEQ4RELX5w9nJPESrj8GdY/HOg3zeWYjV3vpIfAYvJaS/SBytbkuVp
   p34bpT0roxJaiFAkdeBiwX5/z8NJ13iZ55A8cdmzVTle6d64fpK/zT4Hu
   RYlWPEItqyPOWpFcnvgov9tBz1MvnQiGOcxMoTBiv44vhPNpROuTrmbxC
   Q==;
X-CSE-ConnectionGUID: Dxaz4LuEQCSRfkTdvLy8IA==
X-CSE-MsgGUID: MOV2GEZyTVCSas2DFNatgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111364315"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="111364315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:34:16 -0700
X-CSE-ConnectionGUID: 9AK411LNTyCGEXN7gQHPWg==
X-CSE-MsgGUID: TFBd/bjvRT+8SFhfy7CCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="259113483"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:34:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 04:34:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 04:34:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 04:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9l0RwCI+lyPlqKQftiDJJV2WF8iMadVl+htoiiWU8OGUq09cdP3g9Ds4gJVzDO7J196CP6HL1Crei4WwrJ7c9EyiC5TiZ+9FqDfFtqkTEfKw9u7Y+anAnIRS3+vP0iBKV9nN7Qf0k4P6XqYcOhm7egpITjrVjYK6Uk4+tiQjpSeyt9G6L70nDGcHV6OyKZJNJNKoL5aqe3+kztoIEes680/oUMVzIbMFOgvf+i27SmpmmBmfQBonJvu9ru5Trn/772u/POfPzmIoE2k1L2aQFVj5SMifHXYNOQ40S65KlgtYdxe1HqJpadnMfTopdCVFdqQ5XNXZKzD7PR1PX9kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAt1OjOIeI0mtY3HqjmwW+Bc9uV42CywV3diCfziQms=;
 b=p7sVrlug6fchIfKjgpfJEKjVFUUZtxN1sxOJ8aj35OjavySRWyVHvn68d9/IjGkMgVLI3d5xyxkGbEGn6A+tVbLBl0pQDrP7vgZYSwvtNPcK71sS7T/UsA+cyrE/KS2Fg/ihrnTcqUwRx9qBQYw1y7YhRK8l9WQXPH4Q916hTzBuYrkfttPNht+0DKxu4GW3kiUWTF8l3oZkYbl8cY6RQDqVi/SKiADZBYakm4zm7TfLGnd9aFwenHtD6yyAGMKuDsvqrf8PkeFQo6+IOoQVfv/GRLk3TjQZzAD0TQvcRSaYRY3NvwalIpRvUV/FCXN9hU7J7JeLWYSqcquTzAWrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 11:34:13 +0000
Received: from PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9]) by PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 11:34:12 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M2.rc1)
Thread-Index: AQHdGzFWAwJlWoojOE6xskoOWFVxZrZ8TckAgAaC+nA=
Date: Tue, 28 Jul 2026 11:34:12 +0000
Message-ID: <PH7PR11MB7027BAF8E6852FEC2C698CEEF4CB2@PH7PR11MB7027.namprd11.prod.outlook.com>
References: <0101019f915a92a8-79648cca-c930-4256-9147-708fad3e7515-000000@us-west-2.amazonses.com>
 <bcb8e9d6ef10a03f17b67baa7aacf7bdba848f0c.camel@linuxfoundation.org>
 <18C52AF3EA22EFE5.2782685@lists.yoctoproject.org>
In-Reply-To: <18C52AF3EA22EFE5.2782685@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7027:EE_|DM4PR11MB5310:EE_
x-ms-office365-filtering-correlation-id: 5e41004a-0000-4544-e78f-08deec9c25bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|23010399003|4143699003|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: odMo540IYboNlN5jtkD+7VlseBvTNWsRf72NyRWNvXFgpAh2PLzSJQDShRenV21/jjWm9xQ2fXy1G5L5J2N6IpsaBvbhDwJztUxdCaiOjv0so4QmuRsZerNjZbjxFRzgPE9S9moRx7dezvki+zlm2nFLnr5gu2yxbyquhZ8PwE9/kjnKdj9I2KgeAE2DrFfJYtoWkzql1wAFdd3LWA/kphq1e3ZDUzehnCW5Wa8Eojs74UIyBs6iiTa9KE/I2g9c7UK23PQIxVTNaisnYfkE3EkUUDwNBWiTguc5IsNizxUsZUcQFJugnjzJVNO3iFNpf6A/JE3ga6kdSTfVidOfPL+jhqt44Q4Lq7OE6tER9I3RasZZU2wXgaY+XG4tG+oF24eFD3kDWVHYnvvbdazAHJxd+sKWSQrXV3ggpo8Fj/C9r5c6QzvikBO+8dgZNSxhgVrimElla7aHmSucZuN4S95XVuLmcZLFT/2zDLeevIlbdw3HSI/nqDil/77WgcgMEZ23VwcJvsV3xxvOryHX1lI7wjt3qtmPWtFaGvL4cfhgwkCl6LkFSpkvM+6vTufdGWNEm7vS83FTncSe+mgWd27QDFOyS0WUg7c5h+9bie+/EI2yPy144HiGRj3/n6LC5T/Zec9lQYH3iwzP2jB74VnVY4QsT2LnMLOKUcmA7uo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7027.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REhBRmZON004bTlJUHYyOVJMWWFKOHZ2MG15WFI0R0NCam9RMGdDR2NZR3hU?=
 =?utf-8?B?RWdOeXZVOUpQTnM3akJqMVBoTlFyVFlDNnoyVFdoWHV5M3J6N2kzWThBR3Vj?=
 =?utf-8?B?RnJiRmtodFZVOHhWZU5DSjVIOFZ0TThSZ3JuNFpOZEJ2b3hGb2djT3hBb2k3?=
 =?utf-8?B?S1Vjc2kzT2hJZkF1aE1ncjFqS3ZZY2I2a05uTmZRVmROaEpqdEZmR08xY29s?=
 =?utf-8?B?V3RjVXd1RmR3WWxFeksvQUM1aWpsRFBTaDBXNmpHWitzRFpFLzhvdjF3WThu?=
 =?utf-8?B?U1YwU25iQXM4UjMvTUVmNTAzZTRNQzRsbVZ5SlhJWnZoN2FXcXlrbjA3TWxY?=
 =?utf-8?B?YUxuS0NXQ2JocmN0aXhYcEhjOUxQTGtHRDkvVlhEK0VtaG8wekMvNzNBRHZo?=
 =?utf-8?B?Q0plZ0laV0FYY2IwZXJxa3BYbjFXSlJTU1dyVEorcENMWWhoc1BSakFxRTFu?=
 =?utf-8?B?MVN4RGx1WCtMRTN4MnRkbGRkRDRscnBTd1N0SjdzVngxTlFRMGdXUXJhc1By?=
 =?utf-8?B?TDByOGdhYXhWMEFOWHhxcXNkSlcyZ2lzWDdUV2JoYytHOVdXcGJLVTJ3OGVk?=
 =?utf-8?B?T0NLMGxSQ0d3b3dnY1RDSUMzMDBBQUNDdEVieTRDbmZFQlVFcmV5eWtTbmll?=
 =?utf-8?B?UmZCemRHRXhDZ0tPU3pCeXl6UkFWcHJ5WHQvb0NTcUlhNmVaVmg3aVVVdExL?=
 =?utf-8?B?OFlEalpBMW5MUDBiUkY4UnppRzJCZ3pBZmVQN0JjQ3A1d0dxaFRKd2UzS0Zr?=
 =?utf-8?B?bVlxUE53a2k3bWhPRDd1eGNLQXNheGp5emVrSFQvamtBTlVQWDZoMm9kSmN1?=
 =?utf-8?B?OVh1UHVveHJTbk5UaDVmZ2FETmNyeXArYlJ3M3lqS3lsL1Q2N21yRWtnZ0pz?=
 =?utf-8?B?aHFtSFpqb1lGYVVIWktKOUo1OG9pVDBUbEJoVzFIZ2lqNzRCYzVkN0wrUGZv?=
 =?utf-8?B?d0hHblJTcjduaEcwT1YzQy9Hb3MrTjA4THQzV09OcjhuTFlKTnREV1V5U0Rs?=
 =?utf-8?B?KzlCRWdxRGdEWU9lOXY1YnlXQVpnM003b3F1Q1R6M0dFNVlnN2FTOXBOeXVR?=
 =?utf-8?B?cUw1UXozYTJNY0laZXU0aldGQWh0bVB1ZVlTZTd6R0QvMTUrUG5CWFAzc2tM?=
 =?utf-8?B?YzJmSllSd05PMnduZzg4NVZ5WEJPaENKUFpxdTY0Z1I4T2g1eUcxdlkxeHFY?=
 =?utf-8?B?czEzWmQ1TFdKNUVHSk5Xc056b1JxVlptaWZJR1NGb3I4cHV0WmlRVEZaZDQr?=
 =?utf-8?B?cG1ZRXJRYjQrV3RpVHY3L3MrODFwZzhnNklDcXZVMCtaamFrcUsrM2xWMy9L?=
 =?utf-8?B?NUQ5bVRTa1NFUFVyY3pBVFRvUWF0TVJPQWJaRkJUZFVqSzg5Z1lGY0FyZHlS?=
 =?utf-8?B?Y3Q2TThLcnFLZUhzWElLenJ6ZFVzRGxMdU1HQ2dlZzB6RkVXdHNKNXcyZ3F5?=
 =?utf-8?B?QW1lamNCdjRCRjlQR2c1Rm1nN3NaQmZsMTdVV29OdXhQUHlaZEpxZG80UWFD?=
 =?utf-8?B?T200M1JQVDA3QXJCR0tZeWpWT2lnSzRFUWlaK0dLYnhNb1pCWnBaZFZPMnlG?=
 =?utf-8?B?RjY1NG9yS09OOWZuNmZUcW9zdnRlTW1QZWRlRGtFOVpPb1B6NnRPYWdkelh3?=
 =?utf-8?B?MHRVVmhoQTNPaytkcU5SVmdCQ3ArVTIyNW1HUEMvcUxDOHkyV2NnbmpiWXpU?=
 =?utf-8?B?b2dZUk0zODNaTVRPR0hJVlRDWkZmcDJSbUgvSFpDOTNOajdob1JZbUxTY2to?=
 =?utf-8?B?WlpxbWZFNXo5MVhZZ2xjcEVFWnZZM3lUcGlkS0taWTJJUHVHb3BFZkxaUE5M?=
 =?utf-8?B?MHBhckE5eDZDcUNpTnl1dDY3UWVxSGl1UDVuTmRmMlZOc1RWaWQwS3RRQVk2?=
 =?utf-8?B?NTIyMzNNUUw3N3lHakUwYUhCUlhseVQrc01kc0Jkbmx1OHB2cmJrdzYvU0xj?=
 =?utf-8?B?cVpwU0ZWbGp5eUppZTJsdmRXU0JtckVmSjR0OEJzbDB1NTlFSHo0MVNVZFhR?=
 =?utf-8?B?SllHVkVIc1JsYW5zRzJrUW1UMVVSTXJ4QW1JK29XZlNXYzk2ZjVJMmdmak5w?=
 =?utf-8?B?bkdHR1lzUkVpcmpHTjBnSit2WjJ0K0t4S3k5bUFPYU9rc0l1V2psR1BoYUlu?=
 =?utf-8?B?Uk5UaVRzWkpCR0EzVVhrSXFLdndGVStEUGRzcGI1V2xUL25uekRBdEFyUWRt?=
 =?utf-8?B?WW1iRktKMHNtQTF3Vnc0dUphNEhvQ0Y4WDZoS3NKcFFtbDdYd3hSNjRJWGxB?=
 =?utf-8?B?Y0ZaclJQT3Y1NEwrVitFQmpVSEx1djB5YWh5R1d4YnZ4bTJlVm9WNmpMRjZn?=
 =?utf-8?Q?Fnkd/So4LgaQUYh/co?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XQFNIXa9HJbQMelML25U1Tv+VoQFLhuPngAi4CQsoeYTAH6S8xiwnBy6EXe3xtFxit2wd7ChfklVTASqKGgIfD1jkJZKjT0oIu9H2tBnA+SViqHd9/b6jdrn4V1dc3I2TNTvTQ6bPvB39um7oRK1u4J+BGs8FHesKupj4ymY3D4eu0oarovefV2CQcjWTwZMawZEBumonfMKjqRACxbPfc27geT0n1yxW3I0JW0irUJfAeu7kX9tKgF+XBw9nbdgQhgcIZTL0OWUhBeMaEAri9zM8K4U21FW9VwZuTOQfD7U1/bIjxv82lfMf0tCjtHOPTyZXYzSo7nitb/sBTIH3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e41004a-0000-4544-e78f-08deec9c25bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 11:34:12.5038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3uGSRznYhquXWNUSa6ji0UXT4+hfM1hMOt0LOrYhalTuzDUb507W1iKO1vX1S7aElP5Pd5Mp+0/2tVvV7SMqJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 11:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242185

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNi4xX00yLnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9aW50ZWwteW9jdG8tdGVz
dHJlc3VsdHMNCg0KPT09PT09PSBTdW1tYXJ5ID09PT09PT09DQpObyBoaWdoIG1pbGVzdG9uZSBk
ZWZlY3RzLg0KDQpObyBuZXcgaXNzdWUgZm91bmQuDQoNClRoYW5rcywNCkRlYmFsIEdob3NoDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBHaG9zaCwgRGViYWwgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNClNlbnQ6IDI0IEp1bHkgMjAyNiAxMzozMQ0KVG86IHFhLWJ1aWxkLW5vdGlmaWNh
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBZb2N0by1tYWlsaW5nLWxpc3QgPHlvY3RvQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+OyBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBva3lidWlsZCBVc2VyIDxwb2t5YnVpbGRAeW9j
dG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBu
b3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNi4xX00y
LnJjMSkNCg0KSGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0
aW9uIGZvciBZUCBidWlsZCB5b2N0by02LjFfTTIucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhl
Y3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0
ZXN0cyBmb3IgZm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQpBbGRlciBMYWtlDQpQYW50aGVy
IExha2UNCkFycm93IExha2UNCkJhcnRsZXR0IExha2UtUw0KQW1zdG9uIGxha2UNClJhcHRvciBM
YWtlDQoNCkVUQSBmb3IgY29tcGxldGlvbjogMjcvMDcvMjAyNi4NCg0KQmVzdCByZWdhcmRzLA0K
RGViYWwgR2hvc2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxk
LW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRp
b25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZp
YSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTZW50OiAyNCBKdWx5IDIwMjYgMTE6MjcNClRvOiBx
YS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgeW9jdG9AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KQ2M6IFlvY3RvIFRTQyA8dHNjQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+DQpTdWJqZWN0OiBSZTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9u
IGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTYuMV9NMi5yYzEpDQoNCk9u
IFRodSwgMjAyNi0wNy0yMyBhdCAyMzo0MCArMDAwMCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+IA0KPiDCoMKgwqAgQSBidWlsZCBmbGFnZ2VkIGZv
ciBRQSAoeW9jdG8tNi4xX00yLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIg
YW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBodHRwczovL3Zh
bGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by02LjFfTTIucmMxDQo+IA0KPiANCj4g
wqDCoMKgIEJ1aWxkIFVSTDogDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9y
Zy92YWxreXJpZS8jL2J1aWxkZXJzLzI5L2J1aWxkcy80MjcNCj4gNA0KPiANCj4gwqDCoMKgIEJ1
aWxkIGhhc2ggaW5mb3JtYXRpb246IA0KPiANCj4gwqDCoMKgIGJpdGJha2U6IGMyNTE4MzNkMjA2
MmVmOTJmYzdlNzdhYjY0NTZhZjkyOGFkMWQzMWENCj4gbWV0YS1hZ2w6IDNjNTViNDViZjkyMGJl
YzkzOTM4YWYwMmYyNDUyY2Q2OThkM2JhY2MNCj4gbWV0YS1hcm06IDE2NzY2MTc2MmI3ZDM5ODU3
NTFmZmYwNjZiNWU3MzU1MzI1ZjNlY2MNCj4gbWV0YS1hd3M6IDY0YWFmNWM5MDViNDdiZmY0OTA2
MGUyMTdlZTk2YmRkODQyMzcwN2YNCj4gbWV0YS1jbGFuZzogMGJhZWRkMDZlNzhkMjZkM2I5Mjc0
NzFjZmQ5MTk2MGI3MjI5YTE3OA0KPiBtZXRhLWludGVsOiA4ODc3Y2FjYTZiMWZlNmVmZTMzYzc1
NjY5OGNlNmVjZGNhZWEyMjM4DQo+IG1ldGEtbWluZ3c6IGUyYWFjMDZlYzc0ZTQ2ZDA4YjdlNjhm
NjEwNDMwNDdjNzYxYWU5ZjkNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDJkYzUxZTcxNzFjYzk0YjU1
YWU4Y2Q3MmNhYzE4M2JjNzI5M2VhMzUNCj4gbWV0YS1xY29tOiAyZWI2Y2VmM2IzYzI1Y2Y4MGM1
N2U4Yjc2YjFiNTczNzcwNDY1YTJiDQo+IG1ldGEtdmlydHVhbGl6YXRpb246IGE0OTg3ZjBhZjZm
MzA4ODNlMWRjZDUyY2VjNjYzMTEzNDMyNDFkNmYNCj4gbWV0YS15b2N0bzogZTQ2OTA1NTdmYjBm
ZmZjYjVlOWE4NmQxYzFlYmM1NTBiYjBkYTA5MA0KPiBvZWNvcmU6IGMwNTA4ZmJlYThkMjYyNDJl
MGM3NjFkNDEyZDcyNzk0M2Y5ZDYzNTUNCj4geW9jdG8tZG9jczogMzU4NTE5Y2E2NDA2YTg5ZmVl
NDJjNDVkY2FmNjNhMzdhMzc0ZjMzYw0KDQpUaGlzIGJ1aWxkIGRpZCBoYXZlIHNvbWUgaXNzdWVz
Og0KICAqIG1ldGEtcWNvbSBmYWlsdXJlIC0gZnJvbSByZWNlbnQgdXBkYXRlcyBuZWVkaW5nIHVw
ZGF0ZXMgaW4gdGhlIGxheWVyDQogICogbWV0YS1hd3MgYW5kIG1ldGEtdmlydCBzaG93aW5nIGxp
Y2Vuc2Ugd2FybmluZ3MgZnJvbSByZWNlbnQgY2hhbmdlcw0KICAqIHdlaXJkIHNlbGZ0ZXN0IGNv
bW1pdCBoYXNoIGlzc3VlDQogICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3ZhbGt5cmllLyMvYnVpbGRlcnMvMjMvYnVpbGRzLzQ0MTINCiAgKiB3YXJuaW5nIGZyb20gYWxt
YTggd29ya2VycyBiZWluZyBvZmZsaW5lDQoNCmhvd2V2ZXIgSSBiZWxpZXZlIHdlIHNob3VsZCBw
cm9jZWVkIHdpdGggUUEgYW5kIG5vbmUgc2hvdWxkIGJsb2NrIHJlbGVhc2UuIENhbiB0aGUgcmVz
dCBvZiB0aGUgVFNDIHBsZWFzZSBsZXQgdXMga25vdyBBU0FQIGlmIGFueW9uZSBkaXNhZ3JlZXM/
DQoNClRoZSByZWdyZXNzaW9uIHJlcG9ydCBkb2VzIGFsc28gbG9vayBsYXJnZSBmcm9tIGxvdHMg
b2YgcHRlc3QgbWlzbWF0Y2hlcy4gVGhpcyB3YXMgZnJvbSB0aGUgbXVzbC9nbGliYyBzcGxpdCB3
aGljaCBpcyBjb25mdXNpbmcgdGhlIGNvZGUuIFRoaXMgd2lsbCBuZWVkIHNvbWUgZnVydGhlciB0
aG91Z2h0LCB0aGV5J3JlIG5vdCByZWFsIHJlZ3Jlc3Npb25zLg0KDQpDaGVlcnMsDQoNClJpY2hh
cmQNCg0KDQoNCg0KDQoNCg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCkxpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KVmlldy9SZXBseSBPbmxpbmUg
KCM3MzEpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC1ub3RpZmlj
YXRpb24vbWVzc2FnZS83MzENCk11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL210LzEyMDQxOTE5My85OTc2MTI3DQpHcm91cCBPd25lcjogcWEtYnVpbGQtbm90
aWZpY2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClVuc3Vic2NyaWJlOiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC1ub3RpZmljYXRpb24vbGVhdmUv
MTQ0MjY5OTkvOTk3NjEyNy80NDAzMzQ1NS94eXp6eSBbZGViYWwuZ2hvc2hAaW50ZWwuY29tXQ0K
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg0KDQo=

