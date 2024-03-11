Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BCFC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 06:36:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web11.56490.1710138987847438367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 23:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=A90Fe9cd;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710138988; x=1741674988;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=x5IrVlt6404dr4CKM2To2u3C2Kvtql/hNASBxGNvogA=;
  b=A90Fe9cdhYMjMmI29D9dtdj5+GxIoZSpXxTfqdSAYENGDxi/ruOX8FLm
   ILVu35IP+25Ee34p0HAA4KCp2lKmso1224b/yYZHglLRYfVQODOV6xMXC
   cwxwu/mcrGxn9ANlQe5EwpgjtOcO1nWopwmamxDSyztcHwH86HDQZdtf3
   dqc5dFbNnbdRsFvfLxTvbhIbvBHQAhAQXGh81PjrMKjyG/f0JD4BKZEHL
   xmAuAn/Ka3DPF9bdsarWaypT+0nYfHm9fQfp/fiwbbhlhZ3PIeMjQPhbo
   7XQ2lqhxrH6FVBL5Z8E5uZMhuhDU/AKq9NYMEWWP0GNYRtu06fEKnUJ6M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30227263"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="30227263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15660187"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 23:36:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:36:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 23:36:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 23:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqTytlaZrd6maRaqY9h7b21pdQMkzuZISWYvwh2/j5pfNYxVs3vqpVvSZxFTLt/bKU0JRX0LX0RYfn0R1IRCLaCvaIVvZHXGQB1gY7S3EIP1tlsi9RRHNhsT0J3oMhvCNLMNP3nrisGrqth6Ce03z8HJ/Zbhb7SbHAID9/Ny/VX+xHj+a6Pa1Hv/RMzuOSNrWl29FQ+VXGPOIBN9JYivCJb66jjxBgFj9sqTzOhKw0d1nutuyLkckV7fCx8+dQYLy33G4QzvUk5cirHjN6f6ybIE5IFfjOM7ajABhRbdxejBtGaf0ka/ISk0ghdLTkqFs6LQ3Voy3tp7nxXocod5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5IrVlt6404dr4CKM2To2u3C2Kvtql/hNASBxGNvogA=;
 b=en65EjZTGxs8PWTMY1eV1MH1FWFKHzqfjjd818eEjDpo3DwOrUq+vSktv4+4iW++kjUkbFLpB0RI1ew/QR7PPvsX2BYT5QtJ/W52bnuIeoKNWJR0ODY6BvVfSNBPZnHNStoWnMR9wNPOCMxGwoK/6sQUylF3R6gDPvpuJMCaZgtIijfqV20mLmABuDiqx5EJtxpgrFwWG2nylsmydEtFY5PdlF9zUaYRQoQwfg9X/7eImN8AMuE0pEULO65PkXEpEgVi4vAPb3JkqzjMpNB800RNNgSakBSBUThrLRSetawqdz/WDfg1k4yNkd22yL97fWQlq7oKRSA80pTl+cqprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 06:36:19 +0000
Received: from CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::a7c:edea:a899:a263]) by CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::a7c:edea:a899:a263%4]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 06:36:19 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][kirkstone 03/15] python3-cryptography: fix
 CVE-2023-49083
Thread-Topic: [OE-core][kirkstone 03/15] python3-cryptography: fix
 CVE-2023-49083
Thread-Index: AQHaKX8AaOXIVdQLpEqlqrxACwvLyrEyqWgAgAAAcgA=
Date: Mon, 11 Mar 2024 06:36:19 +0000
Message-ID: <9f79ff06ce062812344177e1e2d6ca17ee6f01cc.camel@intel.com>
References: <cover.1702002667.git.steve@sakoman.com>
	 <2d104f78cd13a10640bc284c7fc8358bf305279c.1702002667.git.steve@sakoman.com>
	 <17BBA241C3FF523B.17779@lists.openembedded.org>
In-Reply-To: <17BBA241C3FF523B.17779@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6414:EE_|SA2PR11MB5211:EE_
x-ms-office365-filtering-correlation-id: 9ee0ba96-49dd-4715-47ad-08dc41958f5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXd3pUvJJMiCfkswtAIPwV06o2CM0UsAzWIKIIgs/S3JOsUU9au5g/O0p+fnOU9B4AfSe4ZwZIgESjBFRYGVJA7CUBYtso09wdZFvfQz+PoV0MJQzvBa+WukxBFwnZpN7YCyBRH0HaVHgfuBu7MpTvcnO3GRClQDUKXVH0IkAWY7fyr6En0bGatKZwNONfks7vrGEJADfWqRincCqSDyGMtMSLmc9RS///wBeF4Auu6DBiZhpYtsXGk9XkHJ8AZVaHsK0y7iCGgnEZq6anQVuKzcQLe0C6HqvML0o6cMHSuMOKuoacVwhRQpw1Or22z387kq77VusmBhkg9OCCAIv4Uuhu73EEPdjzhDo13T6/KmgJEKpqErio6g9KHKBW2kz3VbifaKjSlXl01WEBgunJ1AqODY1Avk5LA0BoiMfv+uZVWs+QrF/mXA2ADCyhe7vR6Q0OLxd+PrfED3n7MC6eyVkrK1L4ye06qO/b7d85TDV7KQ4YMN5WB4VoXkE8otRVH8V2rWGAXw7MKW+xGCktJI7Lo7Au8XXQ4qDEg+tbiR5RF/UfYHBQs4CrNoos74y1kmapyQ7yR1yDZ5xEN9vVcdcwMCjch/jpozwd1pB5UtabQhYvgnCF8SxgWJEgS0zJ5tPX3HMQwrG+Iphz0YZb5cqNC0q2SZST3mFAzqhdM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW1IbEVUcEk3eEdPeSt6bWJPRVlSUGtyUnhwTXR0WEFQdTNoUmJ1NzVaMDhs?=
 =?utf-8?B?aEVGY0cvQkpUMWIxcnVmN1J4UHNwOUEwb0NvSG1EWEV6Q2VhR2FVczhnOFIw?=
 =?utf-8?B?YUV3enBCVFFrZGZUMkM2RERrNnVLUDlYNmxxK01IcGJsakVVZUJPSitOcmNa?=
 =?utf-8?B?dlNMSmxWNCtvTUY3T1Y2OEd1clVweFowbzgycHF5eEhXanBrbXlvMDhiVlBn?=
 =?utf-8?B?U3RPbDM3Vm1qRW1FVW5yaTJpMjFQNnhicGJmUUVpVi9RZWtTR3JEam1vWTMy?=
 =?utf-8?B?d3BQc1dEN29acVgzQVpldVVRYlJvbnJKWUxXaW1vN29iNTJ3T0l5K1BUT3B0?=
 =?utf-8?B?aVZlM2NNeDJtMFIrTTQxbXgyUWtoYVZEQ0pVaVh4MXpPdHZhMnVwRmVBQjdE?=
 =?utf-8?B?WUh2UkowbXc0eHczMzlBWjdRM0hEbitMcUhlTjNkVEg3bHN0OVU1K3pWblph?=
 =?utf-8?B?N0QrZ2JScmNJcU9UenZUSm55RERvS053Q2I3MU9IZDByWTFJdkp6cUxvR21u?=
 =?utf-8?B?cXFreTBqdHZUeWlrMSs2eWZ5MmtyeEtOMW13WVNob3VEc05CRGlsVVZkTzc3?=
 =?utf-8?B?eWNnckw5d2VoZUdZM0xaVHBZVmRYQVFuTjFvTEs0eTVpcG5FZzB5WHFxZWdS?=
 =?utf-8?B?U3ZqbXFKOUZsT2k5cVFPTkl3V1hPSDJHK3BXNHdwcHNXUU5Jb28zRGpJTmVv?=
 =?utf-8?B?RU9UenlBRkNQaEFlbkE2VkNnbkk2NWhBYWJiWWcxNHRHQVN0WXZmRGNIK0wv?=
 =?utf-8?B?azA4TFJBaWRubyt3MTNzNVd1RFgzb0FqcDVtRmZjY083a29XdmN3djZBbHd3?=
 =?utf-8?B?TkpLNlNqRnRISjZpZTA1bGVNdzhSZUJUWG4yQUFOK05pRitrWG9idGN6bzhF?=
 =?utf-8?B?TG4xOVFtUHpqbDI5Z2xEVEFna0R6ellPOUlSV3lXWVl3dEV6RVg3SHVSK1ZB?=
 =?utf-8?B?NmlydW1HR29ZSGJuRWVrZnRpRFk4NEpUeVN4a21KbW9yL2o0Znk2dzBvaWpn?=
 =?utf-8?B?L1U1RjJQMERqOWx1cjJNSUdMOVhZN3ZRcWxoLytKQm16MVRRcVV2R3gwL2tC?=
 =?utf-8?B?U0FUb2svOW9JWXFhM2hSTW9ONko5ai9tUWlicjc0RlNNU1A5ZUtYQ2RyVXFM?=
 =?utf-8?B?TEdSVllXYkF5a212OEQ0b3cvdWtlR293eStLWHEya2tHQ1o4R0VpVVptbU9w?=
 =?utf-8?B?ZWxhZjl1a3ByM2N3dWtDWEhyY3kwS3QyTDlhUjFab0UrV29oa0I0SE5MSWtM?=
 =?utf-8?B?ZHJDMzhjd2I5WHpXbjB1ZW9qSjllZFB3Mmk3U3UwZytLQmJUVWhSU0pkeGVU?=
 =?utf-8?B?TzExa1RSTzZJTWJhQzFvNDBGUU00Q3dFRUpoc0JMaFJpbEppR3RtdWxlZTUv?=
 =?utf-8?B?MnpYNlJZeStpVFZ5TGxJV1hBNmNSc2tidmtpZWxYcEpzZWdSeUlhZE1GUU1h?=
 =?utf-8?B?NGs4Z3hwa3JKeUFDNDlMcVlEdENkOU52cWhIam1hcmhBT0xDRk0ySHlsUWhM?=
 =?utf-8?B?ekZ5dklVOGlZTWNWS3V0ZndsNlBJSE83NmRydFN6eHRLeC8ySCswVkNnaXND?=
 =?utf-8?B?VnBROFB6cWtoRFB2WmNvaFQ3QXFxSFNtVmFTcGYrUkJJbDBpczVwRnlySEZD?=
 =?utf-8?B?QmIydzdSaTUrTVcyN2VWZVE0WFl6VkZrN1JnTVRSN1VLdlhPZzF0YSs0K0hm?=
 =?utf-8?B?N0FFSzBCZGZmTkV6TC9hcmJBeGhLNUx5TU83bG96WVlqNVRvL3dQUVlDTkkx?=
 =?utf-8?B?VWNENDNhN3BhNU5hY09lWVdYaFhHZGRIeUY0a2RVYmNGZ2NwNHpjcTZKR1JG?=
 =?utf-8?B?Z0kxRXdVOWhoOHhFeWNDMzBYUm81dW1XT0hGMFRqbHorU2MySGFWVlJldW51?=
 =?utf-8?B?cTV2eENxY0xBY0dUV09yMFFNek1IV0NObW94MVJBRFdWYlg4T255bHZ0WG9n?=
 =?utf-8?B?OHEwTjZYdWJRZFdxR2NkQmFsbUo5SU9XQzdpOFRTTGx5S3NaUzlXS3lJeWZJ?=
 =?utf-8?B?R2pGamZpRjJrcURvUzZXVDRTSnlNQmdIVGJMUjZ4QXNleTk5a244dE5meVJ2?=
 =?utf-8?B?VHlQZ3BnVmxFRzVDRHJVMzdGdHh6Vm5BQ1hHNWRuNndsR1h6cUVsbW5uL2tD?=
 =?utf-8?B?aDFnMWJTVVUyUnVwN3RIM3FHN1BIa0o2OG9wN0lHS3ZLaTFYWWdkNEJ1VHNO?=
 =?utf-8?B?Zkd2enJHYkRzUEJhRFFLWktxNVJram8xWEFWNXdzVDdVaCtZN201Qkp1N1N0?=
 =?utf-8?B?ZjVxWElQaWJ1endMZkhHaDRsd0hnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E00720061F813949845FDF9D7464DCA5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee0ba96-49dd-4715-47ad-08dc41958f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 06:36:19.0608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByCCdS1D0SQ3m9ONnvY6VMN45Wff32FL93nINXB1Hg5eyOLTyS+rKIGGvwwRki+cZx+Q3bsTYmGXew+Nr2aXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196914

T24gU3VuLCAyMDI0LTAzLTEwIGF0IDIzOjM0IC0wNzAwLCBBbnVqIE1pdHRhbCB3cm90ZToNCj4g
T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE2OjMzIC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiA+IEZyb206IE5hcnBhdCBNYWxpIDxuYXJwYXQubWFsaUB3aW5kcml2ZXIuY29tPg0KPiA+IA0K
PiA+IGNyeXB0b2dyYXBoeSBpcyBhIHBhY2thZ2UgZGVzaWduZWQgdG8gZXhwb3NlIGNyeXB0b2dy
YXBoaWMNCj4gPiBwcmltaXRpdmVzDQo+ID4gYW5kIHJlY2lwZXMgdG8gUHl0aG9uIGRldmVsb3Bl
cnMuIENhbGxpbmcNCj4gPiBgbG9hZF9wZW1fcGtjczdfY2VydGlmaWNhdGVzYA0KPiA+IG9yIGBs
b2FkX2Rlcl9wa2NzN19jZXJ0aWZpY2F0ZXNgIGNvdWxkIGxlYWQgdG8gYSBOVUxMLXBvaW50ZXIN
Cj4gPiBkZXJlZmVyZW5jZQ0KPiA+IGFuZCBzZWdmYXVsdC4gRXhwbG9pdGF0aW9uIG9mIHRoaXMg
dnVsbmVyYWJpbGl0eSBwb3NlcyBhIHNlcmlvdXMNCj4gPiByaXNrDQo+ID4gb2YNCj4gPiBEZW5p
YWwgb2YgU2VydmljZSAoRG9TKSBmb3IgYW55IGFwcGxpY2F0aW9uIGF0dGVtcHRpbmcgdG8NCj4g
PiBkZXNlcmlhbGl6ZQ0KPiA+IGENCj4gPiBQS0NTNyBibG9iL2NlcnRpZmljYXRlLiBUaGUgY29u
c2VxdWVuY2VzIGV4dGVuZCB0byBwb3RlbnRpYWwNCj4gPiBkaXNydXB0aW9ucw0KPiA+IGluIHN5
c3RlbSBhdmFpbGFiaWxpdHkgYW5kIHN0YWJpbGl0eS4gVGhpcyB2dWxuZXJhYmlsaXR5IGhhcyBi
ZWVuDQo+ID4gcGF0Y2hlZA0KPiA+IGluIHZlcnNpb24gNDEuMC42Lg0KPiA+IA0KPiA+IFJlZmVy
ZW5jZXM6DQo+ID4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtNDkw
ODMNCj4gPiBodHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0y
MDIzLTQ5MDgzDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFycGF0IE1hbGkgPG5hcnBhdC5t
YWxpQHdpbmRyaXZlci5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8c3Rl
dmVAc2Frb21hbi5jb20+DQo+ID4gLS0tDQo+ID4gwqAuLi4vcHl0aG9uMy1jcnlwdG9ncmFwaHkv
Q1ZFLTIwMjMtNDkwODMucGF0Y2ggfCA1Mw0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDC
oC4uLi9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfMzYuMC4yLmJiwqDCoMKgwqAgfMKgIDEg
Kw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiA+IGNy
eXB0b2dyYXBoeS9DVkUtMjAyMy00OTA4My5wYXRjaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5L0NWRS0NCj4g
PiAyMDIzLTQ5MDgzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LQ0KPiA+IGNyeXB0b2dyYXBoeS9DVkUtMjAyMy00OTA4My5wYXRjaA0KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZDM5OGVlYTFkOQ0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5L0NWRS0yMDIzLQ0KPiA+IDQ5MDgzLnBhdGNoDQo+ID4gQEAgLTAsMCArMSw1MyBA
QA0KPiA+ICtGcm9tIDYyN2FjNWUzMTQzMDNhY2MwMGExOWQ1OGYwOWViMWVhYmQwMjlmZDEgTW9u
IFNlcCAxNyAwMDowMDowMA0KPiA+IDIwMDENCj4gPiArRnJvbTogQWxleCBHYXlub3IgPGFsZXgu
Z2F5bm9yQGdtYWlsLmNvbT4NCj4gPiArRGF0ZTogV2VkLCA2IERlYyAyMDIzIDA4OjA0OjUzICsw
MDAwDQo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgY3Jhc2ggd2hlbiBsb2FkaW5nIGEgUEtD
UyM3IGJ1bmRsZSB3aXRoIG5vDQo+ID4gY2VydGlmaWNhdGVzDQo+ID4gKyAoIzk5MjYpDQo+ID4g
Kw0KPiA+ICtDVkU6IENWRS0yMDIzLTQ5MDgzDQo+ID4gKw0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0DQo+ID4gWw0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9weWNhL2NyeXB0b2dyYXBo
eS9jb21taXQvMWU3YjRkMDc0ZTE0YzRlNjk0ZDNjZTY5DQo+ID4gYWQ2NzU0YTYwMzlmZDZmZl0N
Cj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weWNhL2NyeXB0b2dyYXBoeS9wdWxsLzk5NDcNCj4g
DQo+IEl0IGxvb2tzIGxpa2UgdGhpcyBjb21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgYXMgd2Vs
bCBzaW5jZSB0aGUNCj4gb3JpZ2luYWwgY2hhbmdlIHdhcyBub3QgcXVpdGUgcmlnaHQuDQo+IA0K
PiBodHRwczovL2dpdGh1Yi5jb20vcHljYS9jcnlwdG9ncmFwaHkvcHVsbC85OTI2I2Rpc2N1c3Np
b25fcjE0MDk5MzY5MzkNCj4gDQo+IA0KDQpTb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IEkg
d2FzIHJlcGx5aW5nIHRvIGEgcmVhbGx5IG9sZCBlbWFpbC4NCg0KSWYgdGhpcyBpcyBubyBsb25n
ZXIgcmVsZXZhbnQsIHBsZWFzZSBpZ25vcmUuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+ID4gKw0K
PiA+ICtTaWduZWQtb2ZmLWJ5OiBOYXJwYXQgTWFsaSA8bmFycGF0Lm1hbGlAd2luZHJpdmVyLmNv
bT4NCj4gPiArLS0tDQo+ID4gKyBzcmMvY3J5cHRvZ3JhcGh5L2hhem1hdC9iYWNrZW5kcy9vcGVu
c3NsL2JhY2tlbmQucHkgfCA1ICsrKystDQo+ID4gKyB0ZXN0cy9oYXptYXQvcHJpbWl0aXZlcy90
ZXN0X3BrY3M3LnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYgKysrKysrDQo+ID4g
KyAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAr
DQo+ID4gK2RpZmYgLS1naXQgYS9zcmMvY3J5cHRvZ3JhcGh5L2hhem1hdC9iYWNrZW5kcy9vcGVu
c3NsL2JhY2tlbmQucHkNCj4gPiBiL3NyYy9jcnlwdG9ncmFwaHkvaGF6bWF0L2JhY2tlbmRzL29w
ZW5zc2wvYmFja2VuZC5weQ0KPiA+ICtpbmRleCA1NjA2ZmU2Li5jNDNmZWEwIDEwMDY0NA0KPiA+
ICstLS0gYS9zcmMvY3J5cHRvZ3JhcGh5L2hhem1hdC9iYWNrZW5kcy9vcGVuc3NsL2JhY2tlbmQu
cHkNCj4gPiArKysrIGIvc3JjL2NyeXB0b2dyYXBoeS9oYXptYXQvYmFja2VuZHMvb3BlbnNzbC9i
YWNrZW5kLnB5DQo+ID4gK0BAIC0yMTg5LDkgKzIxODksMTIgQEAgY2xhc3MgQmFja2VuZChCYWNr
ZW5kSW50ZXJmYWNlKToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX1Jl
YXNvbnMuVU5TVVBQT1JURURfU0VSSUFMSVpBVElPTiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICkNCj4gPiArDQo+ID4gKyvCoMKgwqDCoMKgwqDCoCBjZXJ0czogbGlzdFt4NTA5LkNl
cnRpZmljYXRlXSA9IFtdDQo+ID4gKyvCoMKgwqDCoMKgwqDCoCBpZiBwNy5kLnNpZ24gPT0gc2Vs
Zi5fZmZpLk5VTEw6DQo+ID4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjZXJ0cw0K
PiA+ICsrDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgc2tfeDUwOSA9IHA3LmQuc2lnbi5jZXJ0DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqAgbnVtID0gc2VsZi5fbGliLnNrX1g1MDlfbnVtKHNrX3g1MDkp
DQo+ID4gKy3CoMKgwqDCoMKgwqDCoCBjZXJ0cyA9IFtdDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAg
Zm9yIGkgaW4gcmFuZ2UobnVtKToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHg1MDkg
PSBzZWxmLl9saWIuc2tfWDUwOV92YWx1ZShza194NTA5LCBpKQ0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2VsZi5vcGVuc3NsX2Fzc2VydCh4NTA5ICE9IHNlbGYuX2ZmaS5OVUxMKQ0K
PiA+ICtkaWZmIC0tZ2l0IGEvdGVzdHMvaGF6bWF0L3ByaW1pdGl2ZXMvdGVzdF9wa2NzNy5weQ0K
PiA+IGIvdGVzdHMvaGF6bWF0L3ByaW1pdGl2ZXMvdGVzdF9wa2NzNy5weQ0KPiA+ICtpbmRleCA5
MWFjODQyLi5iOThhOWYxIDEwMDY0NA0KPiA+ICstLS0gYS90ZXN0cy9oYXptYXQvcHJpbWl0aXZl
cy90ZXN0X3BrY3M3LnB5DQo+ID4gKysrKyBiL3Rlc3RzL2hhem1hdC9wcmltaXRpdmVzL3Rlc3Rf
cGtjczcucHkNCj4gPiArQEAgLTgxLDYgKzgxLDEyIEBAIGNsYXNzIFRlc3RQS0NTN0xvYWRpbmco
b2JqZWN0KToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZT0icmIi
LA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQ0KPiA+ICsNCj4gPiArK8KgwqDCoCBk
ZWYgdGVzdF9sb2FkX3BrY3M3X2VtcHR5X2NlcnRpZmljYXRlcyhzZWxmKToNCj4gPiArK8KgwqDC
oMKgwqDCoMKgIGRlciA9DQo+ID4gYiJceDMwXHgwQlx4MDZceDA5XHgyQVx4ODZceDQ4XHg4Nlx4
RjdceDBEXHgwMVx4MDdceDAyIg0KPiA+ICsrDQo+ID4gKyvCoMKgwqDCoMKgwqDCoCBjZXJ0aWZp
Y2F0ZXMgPSBwa2NzNy5sb2FkX2Rlcl9wa2NzN19jZXJ0aWZpY2F0ZXMoZGVyKQ0KPiA+ICsrwqDC
oMKgwqDCoMKgwqAgYXNzZXJ0IGNlcnRpZmljYXRlcyA9PSBbXQ0KPiA+ICsrDQo+ID4gKw0KPiA+
ICsgIyBXZSBoYXZlIG5vIHB1YmxpYyB2ZXJpZmljYXRpb24gQVBJIGFuZCB3b24ndCBiZSBhZGRp
bmcgb25lDQo+ID4gdW50aWwNCj4gPiB3ZSBnZXQNCj4gPiArICMgc29tZSByZXF1aXJlbWVudHMg
ZnJvbSB1c2VycyBzbyB0aGlzIGZ1bmN0aW9uIGV4aXN0cyB0byBnaXZlIHVzDQo+ID4gYmFzaWMN
Cj4gPiArLS0NCj4gPiArMi40MC4wDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy0NCj4gPiBjcnlwdG9ncmFwaHlfMzYuMC4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiA+IGNyeXB0b2dyYXBoeV8zNi4wLjIu
YmINCj4gPiBpbmRleCBjM2FlMGMxYWI5Li5jNDI5Yzc1ZTFiIDEwMDY0NA0KPiA+IC0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfMzYuMC4yLmJi
DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeV8zNi4wLjIuYmINCj4gPiBAQCAtMTgsNiArMTgsNyBAQCBTUkNfVVJJICs9ICIgXA0KPiA+
IMKgwqDCoMKgIGZpbGU6Ly8wMDAyLUNhcmdvLnRvbWwtZWRpdGlvbi0yMDE4LTIwMjEucGF0Y2jC
oFwNCj4gPiDCoMKgwqDCoCBmaWxlOi8vZml4LWxlYWstbWV0cmljLnBhdGNowqBcDQo+ID4gwqDC
oMKgwqAgZmlsZTovL0NWRS0yMDIzLTIzOTMxLnBhdGNowqBcDQo+ID4gK8KgwqDCoCBmaWxlOi8v
Q1ZFLTIwMjMtNDkwODMucGF0Y2jCoFwNCj4gPiDCoCINCj4gPiDCoA0KPiA+IMKgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzM19ydXN0DQo+ID4gDQo+ID4gDQo+ID4gDQo+IA0KPiANCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTk2OTEzKToNCj4g
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2Fn
ZS8xOTY5MTMNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbXQvMTAzMDQ4MjI0LzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3Jl
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+IGFu
dWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

