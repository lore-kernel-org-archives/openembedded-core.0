Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34045CD1283
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 05:55:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web10.11093.1711691698753649005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 22:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CCvUDYAI;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711691698; x=1743227698;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=FtJEJYhYKsxwdhrq/laxkS0E2OfFZ4N1fXN+IVw/bXc=;
  b=CCvUDYAI6GiIpTw7rKH3UQX+LXPjH14zC2diwZQtcI4xdJuw5py/XqFQ
   q864pBi2KN8kGcuXlHWeIPylAY1wNzVFbuzom0JNk40uAVXFTGwI1p+jb
   7xcQE8rpgEknFQcJ4Rz8+XuSYoWoWMY2kVhgruODtujoKALNttz/lkUC0
   7q+7UasTwPri65RnFXeNhmNnMnrltyAjxx7VOC391mdN9PP/OXLqS58KY
   gedZrQJkWyUx8ZW/LKv+fHHiRtXxkjfJRtbsKM5RrLsLcs9pPRJr2tUl4
   5yIbPCKER7pyrQyxAXtwbcqdho6TlbLms6PXasyXivB8pyPZWIEJIqWBR
   g==;
X-CSE-ConnectionGUID: ipm+9Lv2TUK23DzCBo9rRQ==
X-CSE-MsgGUID: sIZyst7oSXKwW7NW4u+iRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7091662"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="7091662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 22:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="21623517"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2024 22:54:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:54:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 22:54:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 22:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiDglvJTLGG345HlIL/DEc/7qYVcUysjfm7se5FJc4EGZdbga8YI+JvX8pEMl/fatM706AgHqXMkTTp7mSyosK7ZeaIBWwXaPCEV0QlO3C9s43TI94cZcydKu+ef8+V/uXvHz3x6mORB2Cz4KCzFdpTUTAsTytOZIoD8dkHYgOHfL2BYmISZsaqeVLvmmhTX+WWhtKZ0iwzDMfg18t4b8ISbmrcuQ6c4HnxBMHNRhjGTZ6R/JtIUPQjzx5oW8/ugoCmLlE/Y4Ytu+XCgKUPZmJN5/ZhemdwIAlel762X5WmoltSusm/PRsmK2/CFkYCYXX/GA3GhDrLiG7RKcUl5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtJEJYhYKsxwdhrq/laxkS0E2OfFZ4N1fXN+IVw/bXc=;
 b=NMrJDE6GA/4RLnf4kphdvNq7vt837Z5CKP139k9bRsJYka/lQSAiqDfqB7GAmRGq0d5FO+Jeh5SzBjedkKF4NEkJow51ufobBLylD+oMZbdprEH6dXuoLW4ZmJ8VEZGKJfg4EYUiOt3wsycc+ue/aCxWXK7Jt4Wj4I9VbGoRX3tQCWipWq0dddLsPB0UtHtvjQ0JHtphPhnKWkh1OUui14z69KAb9F4oqIcWxxVwSaSeFMyVj81Lu+EmyRUaQZ8oWvXOLGi+isGXTYyljcvbUlTQDF/sJKoMvvoNPgqSoJ6AWaJxv8crdXvEAXqI55YIS/ivSlBrjj5zKPktzE0u9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Fri, 29 Mar 2024 05:54:55 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f%7]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 05:54:54 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "meenali.gupta@windriver.com" <meenali.gupta@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52425
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52425
Thread-Index: AQHagZZ5MM6oEnBG4U6yAM4s6QOjZLFOOBCA
Date: Fri, 29 Mar 2024 05:54:54 +0000
Message-ID: <45c147e4af21914595b6db1a21a13aec19d2610f.camel@intel.com>
References: <20240329050250.3293077-1-meenali.gupta@windriver.com>
In-Reply-To: <20240329050250.3293077-1-meenali.gupta@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|DS7PR11MB7806:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QxOmoPx86HNtMqVuuGdf17oLnXbMnB6KFOaKgt8Vl+dHz1BQ0xVZoLgzsp5unHDn4sjnKTXXh5+9p4kB1OUJaNFFvdKZaY9mL2eTrkKfChHqfWGSHge9qAxI9CCGWvH+wpUxrvTVycNinh0LM2UBnI5dj05b1u+1QmyjaE69V+4o47NQa0wKFvJSpaHui9/Io9UKvElff/BewujIRrj5W71iQXwXgdawAPUo/sBPz2xfKjkktxtipz3HjcK8xR6ZEnlbBnZUxI4Ngn7iGQrfqx82iSks+8B6R1fo1USU/D4m8Mv2UMkhmjnze1SQYWegQr8JMoD6UBaTdPOKHqs6flx+XZzTLtRhkIcBKJ3cIFfEXzsKYlV8VbnJRqhxw4kdV0JS8KTtBjzSXPCU7LcGc14MnrXmCf5bThAOGhogivARul6tjq4KbVHxxtSajCN490LvOdV8XRvdmSNzOFaf5CMjs8z38zvHyEp+rcPnsEYMi3fJH1YsRZictpQgXOGYsdIghjv2509DgXhkFoaZiEtKj84elJdJTVMSe6G1V9yoXMXr7DgqehRpHsBXYRzo3w8maugcjX86QbX53tzFLC9ONExpNGJHAuBG+kJhk1zuxtONoiUQf4nUE5vEene+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2pycDF5M3lKcVBJcm1sazBtRXlFUHJLSm9rclpRdkdGRlZQdFBEWW5iaGlp?=
 =?utf-8?B?bnExU2hSVG5rZVJ1TEpUVVNWdEpUR3ArdklYK3YvaTdldmtrYXAvNG55YlIy?=
 =?utf-8?B?WEEzc0N4YytQb1l4K3U1WGRHdzJrR0FNdTVPOUk4ZmxwV212c2xHbTNheFJW?=
 =?utf-8?B?TW5GZC9uRUlSQklrbVY5NW9tS09rTFdZMlVpVnAvdGRMMjVmWUFmZ1VFNkN1?=
 =?utf-8?B?dWNSQ0kyWXFjMjdMb3M5d1hoUXpJL1VBMVRvU0tZcHoyY05ZdGJ6WUFSQ2hN?=
 =?utf-8?B?bnM4YnRrcWY5Z0RuL29UTXFlYTI3SXp0YVJsdmdqTXZab1pMbFE0eUE5djRY?=
 =?utf-8?B?UDV0R3h3cWdvbEZSUHJRblpiWlhZeEZETGtZV3MyYy9sZTlGeU5YVkVFcFh2?=
 =?utf-8?B?N1R1OWVCWnh6dW9NNUlpNjh5YXlrN1E0TVNaMHFvSU15WVAveXZQT1hpbzM5?=
 =?utf-8?B?c2tOQlJuNW4vOXk2OWVtYnVNcjJ4cnVwVnRXUVJueDNacUlJMFk4enhYcXZR?=
 =?utf-8?B?WFZpM01IckVJYUxUZ1hUazE1UE83Z2c1bVFYTGxZd2RYUzFsWmc2Z3VsMnFm?=
 =?utf-8?B?MUl2bFVkTHAxeHBkS0JLTHZFa1pVS3hpeWN0WVNTdFVBaXkwZDhOMHhoRm02?=
 =?utf-8?B?M0ZHOHQxcFh5U2htMHQ2TEpvRUpMQmJKbEM4Tkd1VEpKY094Q0NKN08wTmRM?=
 =?utf-8?B?Tm5IUUxMMkM4dVNpNjZJZ25UNitpRXE5ZHZ1TGxwS2Zub3Z3VVhrNHd0UkxN?=
 =?utf-8?B?UHlwYlhmY1NHc05SWE9PNW5ZL3FhSzlWdDJHamRHdXdKR1dGbHFWM0EzQU1L?=
 =?utf-8?B?M2pHTVZOdCt1djM3OGJlVTBua2tWSlFFRk00bktNeWl2ZUx2RDhQcnRNYmJQ?=
 =?utf-8?B?Zjd5SjZFYjFWM1V6WGdKa1p2cnJJVzJDVzFydktiUG85VXVLNGkwTjFiUnl5?=
 =?utf-8?B?Tk9jZHloeGlSUDhzbkYxYzFzcFJnd3kxV3B5bHBub2srREd5cmc3eXJDNVpS?=
 =?utf-8?B?Zi9qLzA0WWVKaWF1djlJaXFSRGFPUXNWQ0ZBNG50NTVMbkRNNEU3cHpQeGlW?=
 =?utf-8?B?d3dVZGV4WTFRYkJZcWMrNFBtN1lpb2MyNmFjVW5xWjdXRHVnS2lKR3MzU2N2?=
 =?utf-8?B?MnI2YmZZdkdqODMyR3BtT3JWZXVYc3VDQVR1eFc4NHo0cmgyMm0ycmMvNHJ0?=
 =?utf-8?B?UUNXM1NlVmRXRVpuQ1dUMzZKRmIySEdYc2F4djdxWHVOQ05VTCtHTlA2akpU?=
 =?utf-8?B?bysyZUFOM0pJT3MxQnJaZ2xzWW1RcUV2YllFemprNlI4cFdKOGxMV09XU0s0?=
 =?utf-8?B?ZW5aaFJBVFZXY3A4K2ZnSjNXbGNMaUtOTThLR2V0ZlppQ1laRGs2S0VjYjJi?=
 =?utf-8?B?UEJWWXJ6ZGQ4aXVqbnpVQVdleDZLSVdHUUtwNjZRZUFuTEtROFUzTVI1R21Y?=
 =?utf-8?B?Y2pnekdzTTVIRWU4SEt5VnFldjJDUzJLdnFCOXhkZ1NSZU9VRXRIT0o3SmRC?=
 =?utf-8?B?eDFQMnN4QjJXeHgzck5SOVQ2Q3pmTTBPbHl4Y3M1b3hsbjRHVldORkt3Q0xw?=
 =?utf-8?B?NUxZQUtrcUxpeFBta2lNdGVnSEc5S2RpYnpiTHI5aDlobVR4YlUrcm1RQkh4?=
 =?utf-8?B?VUh6ZEhmeE9ZT1hLRTRMS1BlRklVK1p0SmorRFRJYXd4WVI5UlJzNEloMnRu?=
 =?utf-8?B?S3BkNlIzVDllNlJjUFBTR3VlYTFicFNBQmJySVZEeXpOM0tMNUVvSWZieUpm?=
 =?utf-8?B?Vi9pR2dtVDh2NlY3YlZJaDhOTy91NzNLUFRYS2VxME5sdDEvNGlnYjFVSUJZ?=
 =?utf-8?B?V0JvSUJMYjJsd2hUOGkrNDJGeGh0V1N3eG5ncDdHcDkyM2lBRHZPU25rL3Jz?=
 =?utf-8?B?ekZNZFpRdjgrVGxjYXlJVGpnU2xiU3J1ZjZrb3lYVXVTRDMvaGNEbnJGWVRG?=
 =?utf-8?B?VUl1REI2WkZtVkNnRjhFbFJHQU1xRmxIcHlUaHR4RC9tWTcvZitna3FvY2FE?=
 =?utf-8?B?RU5QTnVhOGl2V1NnOXpuUXZ3SU01N0lYY1pXS0ZjMjdCWS9aSFArU1VpaEV1?=
 =?utf-8?B?NDlIcERLdTRTcy9JWUFVV3JCbFc2cG9rbi81YXcyVk1JTWxnSjlMeU1idE9i?=
 =?utf-8?B?ZE0wTkpubWhSclJQUHcxL3dZWkNKQjlUWmFxV1p6Y0J3Q0NTTlNEQjhuaWpv?=
 =?utf-8?B?Z09LWjJGTzIrWE5EMDNhMG4reE1nOTZhc1JOWGNuVk84S0Z0bHRrU1AwQWFP?=
 =?utf-8?B?ZkdIdm05UkFrM2wySkNoWUFDMHdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <638A054F2CF2E04BB4E58E08DDF38F1A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0639b388-a8b6-4309-5c0b-08dc4fb4c209
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 05:54:54.7570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VoSs+ii54tqMSniJsUycIP0ljqLma1cEiqiPzls2j0zBe1dy8ZS5pnXrVHv0cnQj5YxrZ0d8aWFK9827SM2x9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 05:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197626

T24gRnJpLCAyMDI0LTAzLTI5IGF0IDA1OjAyICswMDAwLCBNZWVuYWxpIEd1cHRhIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gKzIuNDAuMA0KPiBkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXQvQ1ZFLTIwMjMtNTI0MjUtMDAxMC5wYXRjaA0KPiBi
L21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDIzLTUyNDI1LTAwMTAucGF0Y2gN
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uOGNhMzY0ZTRlYg0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NW
RS0yMDIzLTUyNDI1LTAwMTAucGF0Y2gNCj4gQEAgLTAsMCArMSwxMTAgQEANCj4gK0Zyb20gNjBi
NzQyMDk4OTlhNjdkNDI2ZDIwODY2MjY3NGI1NWE1ZWVkOTE4YyBNb24gU2VwIDE3IDAwOjAwOjAw
DQo+IDIwMDENCj4gK0Zyb206IFNuaWxkIERvbGtvdyA8c25pbGRAc29ueS5jb20+DQo+ICtEYXRl
OiBXZWQsIDQgT2N0IDIwMjMgMTY6MDA6MTQgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gQnlw
YXNzIHBhcnRpYWwgdG9rZW4gaGV1cmlzdGljIHdoZW4gY2xvc2UgdG8NCj4gbWF4aW11bSBidWZm
ZXINCj4gKyBzaXplDQo+ICsNCj4gK0ZvciBodWdlIHRva2Vucywgd2UgbWF5IGVuZCB1cCBpbiBh
IHNpdHVhdGlvbiB3aGVyZSB0aGUgcGFydGlhbA0KPiB0b2tlbg0KPiArcGFyc2UgZGVmZXJyYWwg
aGV1cmlzdGljIGRlbWFuZHMgbW9yZSBieXRlcyB0aGFuIEV4cGF0J3MgbWF4aW11bQ0KPiBidWZm
ZXINCj4gK3NpemUgKGN1cnJlbnRseSB+aGFsZiBvZiBJTlRfTUFYKSBjb3VsZCBmaXQuDQo+ICsN
Cj4gK0lOVF9NQVgvMiBpcyAxMDI0IE1pQiBvbiBtb3N0IHN5c3RlbXMuIENsZWFybHksIGEgdG9r
ZW4gb2YgOTUwIE1pQg0KPiBjb3VsZA0KPiArZml0IGluIHRoYXQgYnVmZmVyLCBidXQgdGhlIHJl
cGFyc2UgdGhyZXNob2xkIG1pZ2h0IGJlIHN1Y2ggdGhhdA0KPiArY2FsbFByb2Nlc3NvcigpIHdp
bGwgZGVmZXIgaXQsIGFsbG93aW5nIHRoZSBhcHAgdG8ga2VlcCBmaWxsaW5nIHRoZQ0KPiArYnVm
ZmVyIHVudGlsIFhNTF9HZXRCdWZmZXIoKSBldmVudHVhbGx5IHJldHVybnMgYSBtZW1vcnkgZXJy
b3IuDQo+ICsNCj4gK0J5IGJ5cGFzc2luZyB0aGUgaGV1cmlzdGljIHdoZW4gd2UncmUgZ2V0dGlu
ZyBjbG9zZSB0byB0aGUgbWF4aW11bQ0KPiArYnVmZmVyIHNpemUsIGl0IHdpbGwgb25jZSBhZ2Fp
biBiZSBwb3NzaWJsZSB0byBwYXJzZSB0b2tlbnMgaW4gdGhlDQo+IHNpemUNCj4gK3JhbmdlIElO
VF9NQVgvMi9yYXRpbyA8IHNpemUgPCBJTlRfTUFYLzIgcmVsaWFibHkuDQo+ICsNCj4gK1dlIHN1
YnRyYWN0IHRoZSBsYXN0IGJ1ZmZlciBmaWxsIHNpemUgYXMgYSB3YXkgdG8gZGV0ZWN0IHRoYXQg
dGhlDQo+IG5leHQNCj4gK1hNTF9HZXRCdWZmZXIoKSBjYWxsIGhhcyBhIHJpc2sgb2YgcmV0dXJu
aW5nIGEgbWVtb3J5IGVycm9yIC0tDQo+IGFzc3VtaW5nDQo+ICt0aGF0IHRoZSBhcHBsaWNhdGlv
biBpcyBsaWtlbHkgdG8ga2VlcCB1c2luZyB0aGUgc2FtZSAob3Igc21hbGxlcikNCj4gZmlsbC4N
Cj4gKw0KPiArV2Ugc3VidHJhY3QgWE1MX0NPTlRFWFRfQllURVMgYmVjYXVzZSB0aGF0J3MgdGhl
IG1heGltdW0gYW1vdW50IG9mDQo+IGJ5dGVzDQo+ICt0aGF0IGNvdWxkIHJlbWFpbiBhdCB0aGUg
c3RhcnQgb2YgdGhlIGJ1ZmZlciwgcHJlY2VkaW5nIHRoZSBwYXJ0aWFsDQo+ICt0b2tlbi4gVGVj
aG5pY2FsbHksIGl0IGNvdWxkIGJlIGZld2VyIGJ5dGVzLCBidXQgWE1MX0NPTlRFWFRfQllURVMN
Cj4gaXMNCj4gK25vcm1hbGx5IHNtYWxsIHJlbGF0aXZlIHRvIElOVF9NQVgsIGFuZCBpcyBtdWNo
IHNpbXBsZXIgdG8gdXNlLg0KPiArDQo+ICtDby1hdXRob3JlZC1ieTogU2ViYXN0aWFuIFBpcHBp
bmcgPHNlYmFzdGlhbkBwaXBwaW5nLm9yZz4NCj4gKw0KPiArQ1ZFOiBDVkUtMjAyMy01MjQyNQ0K
PiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+IFtodHRwczovL2dpdGh1Yi5jb20v
bGliZXhwYXQvbGliZXhwYXQvY29tbWl0LzYwYjc0MjA5ODk5YTY3ZDQyNmQyMDg2Ng0KPiAyNjc0
YjU1YTVlZWQ5MThjXQ0KPiArDQo+ICtTaWduZWQtb2ZmLWJ5OiBNZWVuYWxpIEd1cHRhIDxtZWVu
YWxpLmd1cHRhQHdpbmRyaXZlci5jb20+DQo+ICstLS0NCj4gKyBsaWIveG1scGFyc2UuYyB8IDIz
ICsrKysrKysrKysrKysrKysrKysrKystDQo+ICsgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2xpYi94bWxwYXJzZS5j
IGIvbGliL3htbHBhcnNlLmMNCj4gK2luZGV4IDY3NDZkNzAuLjMyYzU3ZjYgMTAwNjQ0DQo+ICst
LS0gYS9saWIveG1scGFyc2UuYw0KPiArKysrIGIvbGliL3htbHBhcnNlLmMNCj4gK0BAIC0yMDUs
NiArMjA1LDggQEAgdHlwZWRlZiBjaGFyIElDSEFSOw0KPiArIC8qIERvIHNhZmUgKE5VTEwtYXdh
cmUpIHBvaW50ZXIgYXJpdGhtZXRpYyAqLw0KPiArICNkZWZpbmUgRVhQQVRfU0FGRV9QVFJfRElG
RihwLCBxKSAoKChwKSAmJiAocSkpID8gKChwKSAtIChxKSkgOiAwKQ0KPiArDQo+ICsrI2RlZmlu
ZSBFWFBBVF9NSU4oYSwgYikgKCgoYSkgPCAoYikpID8gKGEpIDogKGIpKQ0KPiArKw0KPiArICNp
bmNsdWRlICJpbnRlcm5hbC5oIg0KPiArICNpbmNsdWRlICJ4bWx0b2suaCINCj4gKyAjaW5jbHVk
ZSAieG1scm9sZS5oIg0KPiArQEAgLTYzNCw2ICs2MzYsNyBAQCBzdHJ1Y3QgWE1MX1BhcnNlclN0
cnVjdCB7DQo+ICvCoMKgIGNvbnN0IGNoYXIgKm1fcGFyc2VFbmRQdHI7DQo+ICvCoMKgIHNpemVf
dCBtX3BhcnRpYWxUb2tlbkJ5dGVzQmVmb3JlOyAvKiB1c2VkIGluIGhldXJpc3RpYyB0byBhdm9p
ZA0KPiBPKG5eMikgKi8NCj4gK8KgwqAgWE1MX0Jvb2wgbV9yZXBhcnNlRGVmZXJyYWxFbmFibGVk
Ow0KPiArK8KgIGludCBtX2xhc3RCdWZmZXJSZXF1ZXN0U2l6ZTsNCj4gK8KgwqAgWE1MX0NoYXIg
Km1fZGF0YUJ1ZjsNCj4gK8KgwqAgWE1MX0NoYXIgKm1fZGF0YUJ1ZkVuZDsNCj4gK8KgwqAgWE1M
X1N0YXJ0RWxlbWVudEhhbmRsZXIgbV9zdGFydEVsZW1lbnRIYW5kbGVyOw0KPiArQEAgLTk3NSw3
ICs5NzgsMTggQEAgY2FsbFByb2Nlc3NvcihYTUxfUGFyc2VyIHBhcnNlciwgY29uc3QgY2hhcg0K
PiAqc3RhcnQsIGNvbnN0IGNoYXIgKmVuZCwNCj4gK8KgwqDCoMKgIC8vIEhldXJpc3RpYzogZG9u
J3QgdHJ5IHRvIHBhcnNlIGEgcGFydGlhbCB0b2tlbiBhZ2FpbiB1bnRpbA0KPiB0aGUgYW1vdW50
IG9mDQo+ICvCoMKgwqDCoCAvLyBhdmFpbGFibGUgZGF0YSBoYXMgaW5jcmVhc2VkIHNpZ25pZmlj
YW50bHkuDQo+ICvCoMKgwqDCoCBjb25zdCBzaXplX3QgaGFkX2JlZm9yZSA9IHBhcnNlci0+bV9w
YXJ0aWFsVG9rZW5CeXRlc0JlZm9yZTsNCj4gKy3CoMKgwqAgY29uc3QgYm9vbCBlbm91Z2ggPSAo
aGF2ZV9ub3cgPj0gMiAqIGhhZF9iZWZvcmUpOw0KPiArK8KgwqDCoCAvLyAuLi5idXQgKmRvKiB0
cnkgYW55d2F5IGlmIHdlJ3JlIGNsb3NlIHRvIHJlYWNoaW5nIHRoZSBtYXgNCj4gYnVmZmVyIHNp
emUuDQo+ICsrwqDCoMKgIHNpemVfdCBjbG9zZV90b19tYXhidWYgPSBJTlRfTUFYIC8gMiArIChJ
TlRfTUFYICYgMSk7IC8vIHJvdW5kDQo+IHVwDQo+ICsrI2lmIFhNTF9DT05URVhUX0JZVEVTID4g
MA0KPiArK8KgwqDCoCAvLyBzdWJ0cmFjdCBYTUxfQ09OVEVYVF9CWVRFUywgYnV0IGRvbid0IGdv
IGJlbG93IHplcm8NCj4gKyvCoMKgwqAgY2xvc2VfdG9fbWF4YnVmIC09IEVYUEFUX01JTihjbG9z
ZV90b19tYXhidWYsDQo+IFhNTF9DT05URVhUX0JZVEVTKTsNCj4gKysjZW5kaWYNCj4gKyvCoMKg
wqAgLy8gc3VidHJhY3QgdGhlIGxhc3QgYnVmZmVyIGZpbGwgc2l6ZSwgYnV0IGRvbid0IGdvIGJl
bG93IHplcm8NCj4gKyvCoMKgwqAgLy8gbV9sYXN0QnVmZmVyUmVxdWVzdFNpemUgaXMgbmV2ZXIg
YXNzaWduZWQgYSB2YWx1ZSA8IDAsIHNvDQo+IHRoZSBjYXN0IGlzIG9rDQo+ICsrwqDCoMKgIGNs
b3NlX3RvX21heGJ1Zg0KPiArK8KgwqDCoMKgwqDCoMKgIC09IEVYUEFUX01JTihjbG9zZV90b19t
YXhidWYsIChzaXplX3QpcGFyc2VyLQ0KPiA+bV9sYXN0QnVmZmVyUmVxdWVzdFNpemUpOw0KPiAr
K8KgwqDCoCBjb25zdCBib29sIGVub3VnaA0KPiArK8KgwqDCoMKgwqDCoMKgID0gKGhhdmVfbm93
ID49IDIgKiBoYWRfYmVmb3JlKSB8fCAoaGF2ZV9ub3cgPg0KPiBjbG9zZV90b19tYXhidWYpOw0K
PiArDQo+ICvCoMKgwqDCoCBpZiAoISBlbm91Z2gpIHsNCj4gK8KgwqDCoMKgwqDCoCAqZW5kUHRy
ID0gc3RhcnQ7IC8vIGNhbGxlcnMgbWF5IGV4cGVjdCB0aGlzIHRvIGJlIHNldA0KPiArQEAgLTEx
NzcsNiArMTE5MSw3IEBAIHBhcnNlckluaXQoWE1MX1BhcnNlciBwYXJzZXIsIGNvbnN0IFhNTF9D
aGFyDQo+ICplbmNvZGluZ05hbWUpIHsNCj4gK8KgwqAgcGFyc2VyLT5tX3BhcnNlRW5kUHRyID0g
TlVMTDsNCj4gK8KgwqAgcGFyc2VyLT5tX3BhcnRpYWxUb2tlbkJ5dGVzQmVmb3JlID0gMDsNCj4g
K8KgwqAgcGFyc2VyLT5tX3JlcGFyc2VEZWZlcnJhbEVuYWJsZWQgPQ0KPiBnX3JlcGFyc2VEZWZl
cnJhbEVuYWJsZWREZWZhdWx0Ow0KPiArK8KgIHBhcnNlci0+bV9sYXN0QnVmZmVyUmVxdWVzdFNp
emUgPSAwOw0KPiArwqDCoCBwYXJzZXItPm1fZGVjbEVsZW1lbnRUeXBlID0gTlVMTDsNCj4gK8Kg
wqAgcGFyc2VyLT5tX2RlY2xBdHRyaWJ1dGVJZCA9IE5VTEw7DQo+ICvCoMKgIHBhcnNlci0+bV9k
ZWNsRW50aXR5ID0gTlVMTDsNCj4gK0BAIC0xOTExLDYgKzE5MjYsOSBAQCBYTUxfUGFyc2UoWE1M
X1BhcnNlciBwYXJzZXIsIGNvbnN0IGNoYXIgKnMsDQo+IGludCBsZW4sIGludCBpc0ZpbmFsKSB7
DQo+ICvCoMKgwqDCoMKgwqAgcGFyc2VyLT5tX3Byb2Nlc3NvciA9IGVycm9yUHJvY2Vzc29yOw0K
PiArwqDCoMKgwqDCoMKgIHJldHVybiBYTUxfU1RBVFVTX0VSUk9SOw0KPiArwqDCoMKgwqAgfQ0K
PiArK8KgwqDCoCAvLyB0aG91Z2ggdGhpcyBpc24ndCBhIGJ1ZmZlciByZXF1ZXN0LCB3ZSBhc3N1
bWUgdGhhdCBgbGVuYCBpcw0KPiB0aGUgYXBwJ3MNCj4gKyvCoMKgwqAgLy8gcHJlZmVycmVkIGJ1
ZmZlciBmaWxsIHNpemUsIGFuZCB0aGVyZWZvcmUgc2F2ZSBpdCBoZXJlLg0KPiArK8KgwqDCoCBw
YXJzZXItPm1fbGFzdEJ1ZmZlclJlcXVlc3RTaXplID0gbGVuOw0KPiArwqDCoMKgwqAgcGFyc2Vy
LT5tX3BhcnNlRW5kQnl0ZUluZGV4ICs9IGxlbjsNCj4gK8KgwqDCoMKgIHBhcnNlci0+bV9wb3Np
dGlvblB0ciA9IHM7DQo+ICvCoMKgwqDCoCBwYXJzZXItPm1fcGFyc2luZ1N0YXR1cy5maW5hbEJ1
ZmZlciA9IChYTUxfQm9vbClpc0ZpbmFsO10NCg0KWW91IHNlZW0gdG8gaGF2ZSBkcm9wcGVkIGEg
aHVuayB0byB0aGlzIHNwZWNpZmljIHBhdGNoIGhlcmUgYW5kIHJlbW92ZWQNCnRlc3QgZmlsZXMg
ZnJvbSBvdGhlcnMgYnV0IGhhdmUgbm90IGRvY3VtZW50ZWQgYW55IG9mIHRoaXMgaW4gY29tbWl0
DQptZXNzYWdlLiBUaGlzIHBhdGNoLCBmb3IgZXhhbXBsZSwgbmVlZHMgYXQgbGVhc3QgdGhpczoN
Cg0KaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3B1bGwvNzcxL2NvbW1pdHMv
MTE5YWUyNzdhYmFhYmQ0ZDE3YjJlNjQzMDBmZWM3MTJlZjQwM2IyOA0KDQpJIGRpZG4ndCBzZWUg
aXQgaW5jbHVkZWQuDQoNClBsZWFzZSBhbHNvIG5vdGUgdGhpcyBpbiByZWxlYXNlIG5vdGVzOg0K
DQpCYWNrcG9ydGVycyBzaG91bGQgYmUgY2FyZWZ1bCB0byBubyBvbWl0IHBhcnRzIG9mDQpwdWxs
IHJlcXVlc3QgIzc4OSBhbmQgdG8gaW5jbHVkZSBlYXJsaWVyIHB1bGwgcmVxdWVzdCAjNzcxLA0K
aW4gb3JkZXIgdG8gbm90IGJyZWFrIHRoZSBmaXguDQoNClRoYW5rcywNCg0KQW51ag0K

