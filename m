Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249A9C54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 03:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.12485.1710473148039380581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 20:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=j73DYCEp;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710473148; x=1742009148;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=KLX2fGKFjuyKgoWv6vHI/QRh0Y4s/Lb5CosNBvT+x7U=;
  b=j73DYCEps04l+6dl68QuE1yCSC3sWKF4nTyHnZx/ybIzP8EeKNZFM9mr
   R/QeELO1nYCu9VQGltld19VspUFlqOa9v13ScRukTouMB0Z53s2Jdh+1C
   qEvIiCmW2bj20sOdFevFwpIiJJ92NoJexDog04HhWPBWADSDgh9NzT7z0
   dcUW5CG4PXY2+e/b4Q0rtCOFzQNTSSRiSKeSQpHvg8Vqg9SiraXXNuVG3
   RxpbCoAjbC06UvBKwoGGBl9KadvAiSETJcUq3tYE9KCCWPmgx5P8NE7KV
   icXbuMIXnINKFeWRp88YY2AWyhvfTYIgfdSel4HxneaBXd+J4KF86wmcp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22787490"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="22787490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 20:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="13136648"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Mar 2024 20:25:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 20:25:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 20:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYjub7VVljFCis/wyzYilRjZMjnZ0P9MyZt4EZJIyBiAZ1hSX23FOw7zL7U7W4mAl8dICfvMkS+gApw/YSBU6fwLlTmEs4cbNtcmiUMJFe3pmDSFN5GiAK58crqGyJTRA8yTO5lOJQ+pS3d8t97cikXFa3U+YBxW0kCFfrcBP742ovQvEPmOIuaKisjSKrSQCAsmOjPxBlPMLrkSaIRp368bzy4tOmjDb/K0mSKetzQf7HcIjpk8Q8buWiOhtzJBL0mi147GC4xAYxFfjk22X+Z7XXpV1T+WR3EvARqIbKkYVFIMhxY+DBzv+PDLBJPxceIbegrKB0llARrOFdTxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLX2fGKFjuyKgoWv6vHI/QRh0Y4s/Lb5CosNBvT+x7U=;
 b=B/kIs7UF3SLeMTlm3QnsiM/C61ELXEkt3T26nXaJlGjnxIPjPLOPgRKgofZP+LjPHBYXoX8v72EqA83riw95RFRWPVdgOfRjh7tvjTjeZfHb3Br+QDZHa4yC8q7vP+03BkeGf0S/pxsFv1GqRS7iatclZTRGw8bgMc6a4cV4fVlyOczFUf8EncEfBVM4lO+HXPZM7f8wRMhy+vcEYZ1Ry6go1ivohxAkFc7Y0Q/i31fYxluPlHfMSi96TzYqI2KGbwv0cc7CoqCX1LDfXzsdkm2fa7OIF5kCYUQ5S2U5ed6sxsYdI/JogruO3g1XxSnV995+eSDRYAroBKNwLJUM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1SPRMB0011.namprd11.prod.outlook.com (2603:10b6:208:389::10)
 by IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 03:25:44 +0000
Received: from IA1SPRMB0011.namprd11.prod.outlook.com
 ([fe80::7629:f6c9:6e29:c75b]) by IA1SPRMB0011.namprd11.prod.outlook.com
 ([fe80::7629:f6c9:6e29:c75b%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 03:25:44 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "asharma@mvista.com"
	<asharma@mvista.com>
Subject: Re: [OE-core][dunfell][PATCH] expat: Backport fix for CVE-2024-28757
Thread-Topic: [OE-core][dunfell][PATCH] expat: Backport fix for CVE-2024-28757
Thread-Index: AQHadYGjg+jLUfVI0UicDUjhFNrEvbE4JecA
Date: Fri, 15 Mar 2024 03:25:44 +0000
Message-ID: <e9294de747722b8b01e2bbe34dd5e78d30aa297e.camel@intel.com>
References: <20240313200343.15817-1-asharma@mvista.com>
In-Reply-To: <20240313200343.15817-1-asharma@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1SPRMB0011:EE_|IA0PR11MB7815:EE_
x-ms-office365-filtering-correlation-id: cd3b353a-a04a-491e-0821-08dc449f993b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RESKoNIJIQUc6PzSlEuAiCrKFfTLrIy/4nERuRQQqwE1RIViFZzj2FqqLTiNqNtvHVspTfOnTpB8PKZb2+5XCEpa9BDdpweK+kqELsLlT0Q1v0tFW5u41bAKZhmQGxn1+nsjKEaXq4YbhM9NjpEX1cevLGCqyfrDo/hYAbTAzZOAYZJoH32wZP9FbebVulX3kLGKl4cGbipXW4elDsqE/8roQS5orC3AbnxddXSr6MBaDuqGlFLwlkmmpA4FupWccYVZsNVDsF+4W/RMa25iGZVxlXE6iXDFbP/rWevaC0xA3UOqw9wGGW9QEvPMQP0uEVHdj3zuXI2NvG74xIK7rIpsHnMr6Ji2OT5TO7+U1CHia0raRHeUTm7YI94gnGMZGgfXmApNRXFXhYZXQ/swvUDMLLILxSq++FkVFf9t+QkbrRZM0e1y20A3abi5q/97ja365bWMtmrfxSV9stvf9+Nlg2ccBU1aN5QRsnD2MuF0EcoEUysxDzuVwfyqzNG1xSkhNL/RbCCkGNGBOifA+YtKMyzeH6758ihWUx04ZHNiLdINFurMOkSdbGNqX8NI4mTH1i4QrSagooLXZYv1DZ8I/gc2dPUK8cIJtj+d+8HdyFcTXhUDPvEc3vqsqfs3QRrqfrpjSs7kxr1xKDdsCCVMV8xlo33KHSVUmTi4k+ud9jmLFau9Q6zRaw9Wck4V
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1SPRMB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk0yM0c5L0g3NUdUblZRVHJOd0p2TE1USFl3bWV1QjZCOTJtRXFNSVFyc25I?=
 =?utf-8?B?ZmhMRTNtWXY4RWJIMFR0WnRVb1Rmbml1N2hMaCtlWWU4bi9wV3A4c1FCeFMv?=
 =?utf-8?B?VTFlVThyK1phWDIvY05lRVNXRjhNMUVBQUN6SDZNTUZsZ0JFZzZuL3JCYWVx?=
 =?utf-8?B?eVFqWEpJLzQ5YmRHM3pIVXQyMndXeWl1alF4V3B6SDFGQmRmSTQzMG93VjJE?=
 =?utf-8?B?dWQxanN1TlJ2TkIvWHNBVEFQV1o3M0grSm1KL3BmK2dRUFJjQVN1dTlPemJH?=
 =?utf-8?B?MlYzL1c0WThWQWJzZGI0Wnk2NWtodnBDOUxNR2hDUGhJWkNyZWJtVDJ1MzdU?=
 =?utf-8?B?MGlsSEdwdlhIR25Sby9lQmdhbmVRMGVkU2ltR3hYVVBpUSt3V0FIOE9USHlR?=
 =?utf-8?B?cm5PWjByTlVXcU1yUDF5dTRyTkxnak1heERzK0xQOHl3V29XYmg4dkIwa0I4?=
 =?utf-8?B?dm5jVUtNLzZjZERVSGJpRHlGQVY3QUlvZzVCbUMwbUd6U0haeVdmalNqVytX?=
 =?utf-8?B?VmJrbjRNcFNwZkhHQjFiUWZGMG5CNGJpdTNCZUJkTk5GMjBTeldNTjBBYnJQ?=
 =?utf-8?B?NHVPckZJQ1JtOS9rdGhkMGN5SFNLc3RlNDZlS0lFZ014Y2FaUUFyZTBvczZG?=
 =?utf-8?B?UkNiWC9Fa0NHVVhhL0VnNE8zME83KzJtOU5hbFRCeWYxWXlreG1sQUpsTzU5?=
 =?utf-8?B?cnlyTkNuY3ZFY2FVUDdkRzhscXJqcmxHbGJWOHEzT2xaMU1HMThlWEljSnNO?=
 =?utf-8?B?aVVyZkdsYUYwS3Yrd0lPanZZNFo5cTJwM1pDOEJ1eTg2QVp6OEljNkUzS0hp?=
 =?utf-8?B?R3BaY1ZlVkhrZ29ZOExkN2JjbFNJT1REZHc0c2lXMjJncFBHL2E5b2J1WFJY?=
 =?utf-8?B?NkZCZzFrZWdWcUhQaUJ5VzhGZE5OdXA3U0RCa2J2amcyR0psQ0JtM0wweXJF?=
 =?utf-8?B?L2V4MlRkZkF3UnY4NU4yN0VJRjdsR0ZyMTAzZklaazZVc05sK2FDVEhnVm9p?=
 =?utf-8?B?ZDE0NVJMaHIzVWtMK3Q0L2xzRnViakVRZkR2ZVYyWSsxZFRwS3NFSHlJNURZ?=
 =?utf-8?B?TTc0NVpNOE9tQ1RIaGJjR0xkajF1YndGTk94VG92RnJQN2YrbEUvYi8vZmVQ?=
 =?utf-8?B?a1RweUN2L3RhN3UreVl2Y0lEdWpWOFJTckJ4QndBY3N5bmVHZlFEQ2ZvSm91?=
 =?utf-8?B?aHlxQkhjMm0xNGhtTXoyMkRjZUpvSVJvOGoxSys5ejY4V3lTNkFBekwwMkdJ?=
 =?utf-8?B?UDNvZ21VVzc2R1ZHYkxJVnNERWI2Z3k1TXdQSHFZTWw1b1Z2ZENXdUdUZ0ZB?=
 =?utf-8?B?ZXlKZDZiQkVCYVNvMG5hYloyTjAzTTE0R0lPMkJwQitEenFtY3FQdnljeXNH?=
 =?utf-8?B?SGxSQmp2amp5YkNmRjhCOVZKRW5SSXhWdGNpR3JQS0JPRGRKdTVEdTdaVG9a?=
 =?utf-8?B?amJlQVZSK3BXcmJNOWtkeWJCNS80WVRiQ1psdjZkN0J2NVdUYnZlRTRIQ0hY?=
 =?utf-8?B?Qkk4bnVhLzRodFpXU2h6a2xsamI3VU14ZEdON2FBQnd4T2FERFhNdmswYk5M?=
 =?utf-8?B?NEJ0dzNZSnZ5Vm12RVZTVU1Ga1BxSVNsSEdoYUExWkgvdTI1VHg4b2JFQnhP?=
 =?utf-8?B?M1M1N1h4OVVsT0lwMEpvRnVjejZhUDZNMUdvbzJOTjUzY1NLVm9LSkFpaEhW?=
 =?utf-8?B?ZUFyc3BCR0pyWVdHYjdNL1lZWEZSbFpwSGFLNzNZaXRBWVlrUWVxZUEvZ3kv?=
 =?utf-8?B?dzdPNWVzV3MyWW9QZ2RiaEQxREx5ZVpXalAxNkI5akNNS1J2amJSZWYydFRp?=
 =?utf-8?B?MW44ZmdjUmNmTUlocGRERmVxM3pkdFV1cklFM3ZqcE9YTFpvbDNwRG9LWDVv?=
 =?utf-8?B?eENqRDEzQlljRmVlcmVuSlpFVTFoeTVLYjR2M01SSW5RSlFpc0pDWFhMRXU2?=
 =?utf-8?B?d0hLUFcrMDMrNnVsOUx3eVFHcklVbUxhRmZjS0xIQkxyNjZEVUFsSzhQSDlU?=
 =?utf-8?B?UFBoNVNjUC9rQzYrWk1NbUpmMk13bTl2Rmd3SHltay94MDd3U2RIdVhPN2Q4?=
 =?utf-8?B?R29hY1RkZkE1WkhSYlVsVkxkQmhJV1l5VnBDOURuUGlsQnZOd0YyeVFtNE9n?=
 =?utf-8?B?OXllY1ducVJjVFZxRWI1LzF3VW96TWtSdUFqamk5Rk9zYVZOb28wbWJCTGZt?=
 =?utf-8?B?L29MTU11bllud2phM1Fzdnl6Y3c0eXd6Sk5sU00rN3dnUWdGd3kvK2syQ3BW?=
 =?utf-8?B?LzZVRDVtZzRvQXFRampTTHJNRU1nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FB17DCF5EE7B843B1066E0FEA3CCB21@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1SPRMB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3b353a-a04a-491e-0821-08dc449f993b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 03:25:44.0998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8CDcdDR+5vNpBmSKLZuKLyYh5Qr8gmMO73acA/BRMC9WhjV71edODkoKXQKbGC5HxFX+bzc4iuzbktuwYAMiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 03:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197126

T24gVGh1LCAyMDI0LTAzLTE0IGF0IDAxOjMzICswNTMwLCBBc2hpc2ggU2hhcm1hIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gVXBzdHJlYW0gcmVmOg0KPiBodHRwczovL2dp
dGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcHVsbC84NDINCj4gaHR0cHM6Ly9naXRodWIuY29t
L2xpYmV4cGF0L2xpYmV4cGF0L2lzc3Vlcy84MzkNCj4gDQo+IFVwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQNCj4gW2h0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9jb21taXQvMDcy
ZWNhMGI3MjM3M2RhMTAzY2UxNWY4DQo+IGY2MmQxZDdiNTI2OTU0NTRdDQoNClRoaXMgbGluayBo
ZXJlIGFuZCBpbiB0aGUgcGF0Y2ggcG9pbnRzIHRvIGluY29ycmVjdCBjaGFuZ2UuIFNob3VsZCBp
dA0KYmU6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9wdWxsLzg0Mi9j
b21taXRzLzFkNTBiODBjZjMxZGU4Nzc1MDEwMzY1NmY2ZWI2OTM3NDY4NTRhYTgNCg0KPw0KDQo+
IFNpZ25lZC1vZmYtYnk6IEFzaGlzaCBTaGFybWEgPGFzaGFybWFAbXZpc3RhLmNvbT4NCj4gLS0t
DQo+IMKgLi4uL2V4cGF0L2V4cGF0L0NWRS0yMDI0LTI4NzU3LnBhdGNowqDCoMKgwqDCoMKgwqDC
oMKgIHwgNTcNCj4gKysrKysrKysrKysrKysrKysrKw0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2V4
cGF0L2V4cGF0XzIuMi45LmJiwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiDCoDIgZmlsZXMgY2hh
bmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyNC0NCj4gMjg3NTcucGF0Y2gNCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyNC0yODc1Ny5wYXRj
aA0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDI0LTI4NzU3LnBhdGNo
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmM0YmRiNDYyMWEN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9D
VkUtMjAyNC0yODc1Ny5wYXRjaA0KPiBAQCAtMCwwICsxLDU3IEBADQo+ICtGcm9tIDFkNTBiODBj
ZjMxZGU4Nzc1MDEwMzY1NmY2ZWI2OTM3NDY4NTRhYTggTW9uIFNlcCAxNyAwMDowMDowMA0KPiAy
MDAxDQo+ICtGcm9tOiBTZWJhc3RpYW4gUGlwcGluZyA8c2ViYXN0aWFuQHBpcHBpbmcub3JnPg0K
PiArRGF0ZTogTW9uLCA0IE1hciAyMDI0IDIzOjQ5OjA2ICswMTAwDQo+ICtTdWJqZWN0OiBbUEFU
Q0hdIGxpYi94bWxwYXJzZS5jOiBEZXRlY3QgYmlsbGlvbiBsYXVnaHMgYXR0YWNrIHdpdGgNCj4g
aXNvbGF0ZWQNCj4gKyBleHRlcm5hbCBwYXJzZXINCj4gKw0KPiArV2hlbiBwYXJzaW5nIERURCBj
b250ZW50IHdpdGggY29kZSBsaWtlIC4uDQo+ICsNCj4gK8KgIFhNTF9QYXJzZXIgcGFyc2VyID0g
WE1MX1BhcnNlckNyZWF0ZShOVUxMKTsNCj4gK8KgIFhNTF9QYXJzZXIgZXh0X3BhcnNlciA9IFhN
TF9FeHRlcm5hbEVudGl0eVBhcnNlckNyZWF0ZShwYXJzZXIsDQo+IE5VTEwsIE5VTEwpOw0KPiAr
wqAgZW51bSBYTUxfU3RhdHVzIHN0YXR1cyA9IFhNTF9QYXJzZShleHRfcGFyc2VyLCBkb2MsDQo+
IChpbnQpc3RybGVuKGRvYyksIFhNTF9UUlVFKTsNCj4gKw0KPiArLi4gdGhlcmUgYXJlIDAgYnl0
ZXMgYWNjb3VudGVkIGFzIGRpcmVjdCBpbnB1dCBhbmQgYWxsIGlucHV0IGZyb20NCj4gYGRvY2Ag
YWNjb3VudGVkDQo+ICthcyBpbmRpcmVjdCBpbnB1dC7CoCBOb3cgZnVuY3Rpb24gYWNjb3VudGlu
Z0dldEN1cnJlbnRBbXBsaWZpY2F0aW9uDQo+IGNhbm5vdCBjYWxjdWxhdGUNCj4gK3RoZSBjdXJy
ZW50IGFtcGxpZmljYXRpb24gcmF0aW8gYXMgIihkaXJlY3QgKyBpbmRpcmVjdCkgLyBkaXJlY3Qi
LA0KPiBhbmQgaXQgZGlkIHJlZnVzZQ0KPiArdG8gZGl2aWRlIGJ5IDAgYXMgb25lIHdvdWxkIGV4
cGVjdCwgYnV0IGl0IHJldHVybmVkIDEuMCBmb3IgdGhpcw0KPiBjYXNlIHRvIGluZGljYXRlDQo+
ICtubyBhbXBsaWZpY2F0aW9uIG92ZXIgZGlyZWN0IGlucHV0LsKgIEFzIGEgcmVzdWx0LCBiaWxs
aW9uIGxhdWdocw0KPiBhdHRhY2tzIGZyb20NCj4gK0RURC1vbmx5IGlucHV0IHdlcmUgbm90IGRl
dGVjdGVkIHdpdGggdGhpcyBpc29sYXRlZCB3YXkgb2YgdXNpbmcgYW4NCj4gZXh0ZXJuYWwgcGFy
c2VyLg0KPiArDQo+ICtUaGUgbmV3IGFwcHJvYWNoIGlzIHRvIGFzc3VtZSBkaXJlY3QgaW5wdXQg
b2YgbGVuZ3RoIG5vdCAwIGJ1dCAyMiAtLQ0KPiBkZXJpdmVkIGZyb20NCj4gK2dob3N0IGlucHV0
ICI8IUVOVElUWSBhIFNZU1RFTSAnYic+IiwgdGhlIHNob3J0ZXN0IHBvc3NpYmxlIHdheSB0bw0K
PiBpbmNsdWRlIGFuIGV4dGVybmFsDQo+ICtEVEQgLS0sIGFuZCBkbyB0aGUgdXN1YWwgIihkaXJl
Y3QgKyBpbmRpcmVjdCkgLyBkaXJlY3QiIG1hdGggd2l0aA0KPiAiZGlyZWN0IDo9IDIyIi4NCj4g
Kw0KPiArR2l0SHViIGlzc3VlICM4MzkgaGFzIG1vcmUgZGV0YWlscyBvbiB0aGlzIGlzc3VlIGFu
ZCBpdHMgb3JpZ2luIGluDQo+IENsdXN0ZXJGdXp6DQo+ICtmaW5kaW5nIDY2ODEyLg0KPiArLS0t
DQo+ICtDVkU6IENWRS0yMDI0LTI4NzU3DQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+
IFtodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvY29tbWl0LzA3MmVjYTBiNzIz
NzNkYTEwM2NlMTVmOA0KPiBmNjJkMWQ3YjUyNjk1NDU0XQ0KPiArU2lnbmVkLW9mZi1ieTogQXNo
aXNoIFNoYXJtYSA8YXNoYXJtYUBtdmlzdGEuY29tPg0KPiArLS0tDQo+ICsgZXhwYXQvbGliL3ht
bHBhcnNlLmMgfCA2ICsrKysrLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2V4cGF0L2xpYi94bWxwYXJzZS5j
IGIvZXhwYXQvbGliL3htbHBhcnNlLmMNCj4gK2luZGV4IGI4ODRkODJiNS4uZDQ0YmFhNjhkIDEw
MDY0NA0KPiArLS0tIGEvZXhwYXQvbGliL3htbHBhcnNlLmMNCj4gKysrKyBiL2V4cGF0L2xpYi94
bWxwYXJzZS5jDQo+ICtAQCAtNzc4Nyw2ICs3Nzg3LDggQEAgY29weVN0cmluZyhjb25zdCBYTUxf
Q2hhciAqcywgY29uc3QNCj4gWE1MX01lbW9yeV9IYW5kbGluZ19TdWl0ZSAqbWVtc3VpdGUpIHsN
Cj4gKyANCj4gKyBzdGF0aWMgZmxvYXQNCj4gKyBhY2NvdW50aW5nR2V0Q3VycmVudEFtcGxpZmlj
YXRpb24oWE1MX1BhcnNlciByb290UGFyc2VyKSB7DQo+ICsrwqAgLy/CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgDQo+IDEuLi4uLi4uLi4xLi4uLi4uLi4uMTIgPT4gMjINCj4gKyvCoCBjb25zdCBz
aXplX3QgbGVuT2ZTaG9ydGVzdEluY2x1ZGUgPSBzaXplb2YoIjwhRU5USVRZIGEgU1lTVEVNDQo+
ICdiJz4iKSAtIDE7DQo+ICvCoMKgIGNvbnN0IFhtbEJpZ0NvdW50IGNvdW50Qnl0ZXNPdXRwdXQN
Cj4gK8KgwqDCoMKgwqDCoCA9IHJvb3RQYXJzZXItPm1fYWNjb3VudGluZy5jb3VudEJ5dGVzRGly
ZWN0DQo+ICvCoMKgwqDCoMKgwqDCoMKgICsgcm9vdFBhcnNlci0+bV9hY2NvdW50aW5nLmNvdW50
Qnl0ZXNJbmRpcmVjdDsNCj4gK0BAIC03Nzk0LDcgKzc3OTYsOSBAQCBhY2NvdW50aW5nR2V0Q3Vy
cmVudEFtcGxpZmljYXRpb24oWE1MX1BhcnNlcg0KPiByb290UGFyc2VyKSB7DQo+ICvCoMKgwqDC
oMKgwqAgPSByb290UGFyc2VyLT5tX2FjY291bnRpbmcuY291bnRCeXRlc0RpcmVjdA0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgID8gKGNvdW50Qnl0ZXNPdXRwdXQNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvIChmbG9hdCkocm9vdFBhcnNlci0NCj4gPm1fYWNjb3VudGlu
Zy5jb3VudEJ5dGVzRGlyZWN0KSkNCj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogMS4wZjsN
Cj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogKChsZW5PZlNob3J0ZXN0SW5jbHVkZQ0KPiAr
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArIHJvb3RQYXJzZXItPm1fYWNjb3VudGlu
Zy5jb3VudEJ5dGVzSW5kaXJlY3QpDQo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
IChmbG9hdClsZW5PZlNob3J0ZXN0SW5jbHVkZSk7DQo+ICvCoMKgIGFzc2VydCghIHJvb3RQYXJz
ZXItPm1fcGFyZW50UGFyc2VyKTsNCj4gK8KgwqAgcmV0dXJuIGFtcGxpZmljYXRpb25GYWN0b3I7
DQo+ICsgfQ0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4y
LjkuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IGNvcmUvZXhwYXQvZXhwYXRfMi4yLjkuYmINCj4gaW5k
ZXggOGE1MDA2ZTU5YS4uZWE1MDUzM2VkOSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZXhwYXQvZXhwYXRfMi4yLjkuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQv
ZXhwYXRfMi4yLjkuYmINCj4gQEAgLTIyLDYgKzIyLDcgQEAgU1JDX1VSSSA9DQo+ICJnaXQ6Ly9n
aXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyDQo+IFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vbGlidG9vbC10YWcucGF0
Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjItNDA2NzQucGF0
Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjItNDM2ODAucGF0
Y2jCoFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyNC0yODc1Ny5wYXRj
aMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoA0KPiDCoFNSQ1JFViA9ICJhN2JjMjZi
Njk3NjhmN2ZiMjRmMGM3OTc2ZmFlMjRiMTU3Yjg1YjEzIg0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTk3MDc5KToNCj4gaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTcwNzkNCj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA0OTEzNTc2
LzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVs
LmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

