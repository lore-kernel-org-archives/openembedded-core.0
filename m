Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DD9C433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 23:58:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.14583.1646006322191093881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 15:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=l1e0EfYs;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646006322; x=1677542322;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=N8+0FMtZSW0VRReEPACY68uqn8a7k4Ge6xq0BeArNWQ=;
  b=l1e0EfYs+mcQUtdU9izcqX3S70ofLgxwqqga1tWLI8z03d8roZaZ4tpM
   U+UlZWHKGWsn1nmmXxkekI4fRcC7UWJZZYX/6M9JbDgWqbYS1sojiNhYH
   Zx/lT7qAxEUBa2lybuaknAovVWeOlxWWBT6j6BbctXd+Ioy6UENgNYdbB
   /5EoHHNSluPRmS67uSSTjC17n4ZIXWVcjXNJ4O4j6mTR9E0ip7xf4hZdF
   nl3qCzZl6fg1MOOffA0U93CBPrQitwJms1T301YD9K90XxE0B3Dly5uN4
   M4gv0g3L9s1T+/BNfb0zy3Tqk+ft/KAgGFABNEW0xq0+pBwCZO2yJidI6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="240181020"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="240181020"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 15:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="575140601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2022 15:58:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 27 Feb 2022 15:58:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 27 Feb 2022 15:58:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 27 Feb 2022 15:58:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 27 Feb 2022 15:58:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNZ7U44pWy71qT/EAiHhGoeIDlPJPoZa5b4bpmVRq6GTXle1V0Zu1MjwSXpg4aUuDibW8EQ549pspgJDN/k3w9Jvf+YVqvEGFn0bt8vBWn4JxVO0rIZ9+WOMMDpoB6siEbDvcPfozFa6ApzgkZKQVNmEcpskTbj8HNR44Fe8nKaSR5LSibAHmTCkTtny3gWVAitJvsM+8euhNf4qnwhSFdTiRPdrhjmeMBMirfOrWT/aE2Ev+G2IFEC36bbxLeeuSrG3nt+xMAd81tNKJhzXrjm2ugeKblvBf2pNEtNgwxJcZMOk912yJwgmyRU0MJvEpsvPoSf03cZJ83MfwDCnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8+0FMtZSW0VRReEPACY68uqn8a7k4Ge6xq0BeArNWQ=;
 b=RpM0N8xbBWzY5kQef67hwsrAnHGUo8tfwKPwUambQYHpxZhuWmc6FpBaeuuEioHY5qdXoVdnyaVbh8dqdieI73xz7zs1xcDJUEPk6BawkOrIE+/20qfVItH1IN8JC+rkBev7EI1oRIG30NpETcKONN7ftRI0ratdPM0vveENvhscZMcZh/8kk4iAFCOn3hc9zwk64BpwvMk3TodXYD/akoKJRB9L4yB4/8H5pfXM1WQceH+JTEtd7Bipsv4uVenrgNUgpWKKls4J2FV/lj5QLS3yIZPAAqk9Kq8bUaau/hO63agXrRxOX7/wz+DjsCYsbCVD1d8yqLiRlyQI2i8fVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3157.namprd11.prod.outlook.com (2603:10b6:a03:75::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sun, 27 Feb
 2022 23:58:37 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::5d33:9c3c:f79a:2a4b]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::5d33:9c3c:f79a:2a4b%5]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 23:58:37 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>
Subject: Re: [OE-core] Yocto Project Status WW08`22
Thread-Topic: [OE-core] Yocto Project Status WW08`22
Thread-Index: AQHYK+65JFzUG4vCK0GjUwByALV0YqyoFAAA
Date: Sun, 27 Feb 2022 23:58:37 +0000
Message-ID: <35da6ceb355fdbe5dfeba6623c9caf390ff16d05.camel@intel.com>
References: <319f01d82804$7d7576e0$786064a0$@gmail.com>
	 <2455ee0c-6386-f3ea-39d9-7a8f93e64d38@gmail.com>
In-Reply-To: <2455ee0c-6386-f3ea-39d9-7a8f93e64d38@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bc87db3-35e2-4cb6-35e4-08d9fa4d121c
x-ms-traffictypediagnostic: BYAPR11MB3157:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB3157CA38D3FF04DAF2391FD7F8009@BYAPR11MB3157.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SUe3i3akYxNTNzYJ2jd4co4PWSlEeA7+DpSdHCr+wqrJ+OmCahVMK7GIT9qHjKq62o1yD7UM3qnX8l7mOaOLBRcCG3MBVcmJUZgd1zILi3y8kzfdCMJWxfemdejf5nYPxW9dBZaGLcY/FP2QoJaOu4/razceHmASCUxWJYSp4W1v/L9W+C4xp6XnZXwpgWQaOtGNpIPN2Gzf+pWYhfN4sUq8zoO30+thXKwQ3A0OCJcS6A+o75uK5PhseRMIgEAq224F68gSnZbV+EyHr3K4u8mNGjcJwMH+uqCUkXvdHJJESnGaJ92vXaMqu4XND4m7MARB0Gt9tnXTyUUIMHxrPdNaNPfW1eZRDfWf5l9YVxNaPvJrXWj0kMshBpfszWnOUrjPgUwo/3nD3xGmrGbhewrOtqVW/+VsfaJFIgDmZXdI8StboXQKZ0pJo/wUsc9RNzbkN3hZMBq1t+GalcLyUNDPQofFSBIUgeBm1LHyijGKpSFbHUDLrfr3LCtdQo6MywfWpphTZikfpT1mpJ8JqxseU5VrDP3OjB6khV4nznnN9UjlHQEtEJM/dRia/b7YFSq/AFsQTWluBkb8pLmyWzL8gG/WfAT0nL4AwroqGOrzxHwy/Yqpr27zmgFniyi3koG/HreQpW/3jcOnilPe95IKMZfKKPEYoAuk2shFwYNsoDZq75B/QI7bWYpN+WlkeRRzDw7tD+9yYk+tqzmeXPWnhqxkrE/QqDBLKeQEZkpnT/gupT2yxrtlucN8R3kRZu87t8bqen9dtqxCBuGpd2rohZL0y3HthJ+wSlQryP2JjtbAYZ6VFFkso+ldjyjLPLrdNqS1m4KKfhYWAcZQsA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(76116006)(40140700001)(82960400001)(508600001)(38070700005)(5660300002)(2616005)(186003)(83380400001)(91956017)(38100700002)(66556008)(66476007)(66446008)(64756008)(66946007)(966005)(8676002)(6486002)(122000001)(71200400001)(53546011)(6512007)(8936002)(2906002)(6506007)(110136005)(316002)(26005)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUZyVjEwQ2ptUTZMN1RDWE5FWGkyVGdSSWt5MDM2QXlwM1BxYmZrVDI2dVpW?=
 =?utf-8?B?YWRXaEgvVWpaOW9JZFpyTktHRDByeUh6cThMZGNabzFKUCtBNnJOUVpmbXhB?=
 =?utf-8?B?bk1TTHRpNjhLZUtjV2pNQXpCOGl2aVN0MUg5eFFVTVd4UExQWWNweGdaeGNE?=
 =?utf-8?B?Tysya2x0YmFCcHc5OFdhbG5obzY2c3phT01SbVFmemEwSERtaVlqdm9YdVdr?=
 =?utf-8?B?QVdHMm1oNDcrZU5VYk9uTG1DWFAwY2dTMjdKK0hBQi83NXY1dzYzR0xPSXM0?=
 =?utf-8?B?TFVVM2NvV0gwaGt0S1VQNk1hbGNLQzIxWDFUZHRnaDZSQ3k2Rms1ZmFNYTFI?=
 =?utf-8?B?OUZnRHo3a1BJV29CdVg3NjJDUHVnOXNKbzcvZzA3Wm85M0dNb3ZWZ0NZRHd0?=
 =?utf-8?B?ZVlHMEpiNFlQczJFTFZTSEtoVXY1YlVjYUFoYmNoeXEvM3JSM0hiTGJYYXM4?=
 =?utf-8?B?U090eGRjNkt2Z2JBdUhlajZvdzRQUmdlMXdMaHcrTE9GVTZ2NHd2NXZ0MnY2?=
 =?utf-8?B?S2YxS0EwQUpDK25qdVZaU1J0dG1kVFNNZXUrMTNxaE5LUkZCUE9vMTA2Wmcy?=
 =?utf-8?B?NXdpZS9TS09xOHh3SDRhM2FHSEx3bmtHRUxxdTJUZ3ozZEtNcnZTdkNHWW5t?=
 =?utf-8?B?MXAxUlVzYThYeUY3UUFqa3MxTVV6Yysrd0UzWkhKeGQrR0h3dWpyZXQwYzZm?=
 =?utf-8?B?Wk13cEZtaUFTUk9rVERXeXNYcG53VXVMOThGRkZsQmNJVlM2UnFBWGtyZEVM?=
 =?utf-8?B?K0dqSFdRMDQxZnVpbVc1eUNyZk9DOGZRZlNTbFZSZ1lsNS9hMEY2UlUzQlNU?=
 =?utf-8?B?NnVoTERjTWRTRWNRa2VhclJSZll3KzJ6QkZHK2Njb1ZjVnM3NG5nRnYvNFE2?=
 =?utf-8?B?NFY2Z3BWYzJmU2x5d29TaGVBS1BuT3VvZzRoNGNXM3cxcVdnbTF5K3diQ1Fr?=
 =?utf-8?B?SS9Cem9KbkVVeXdnaXpyMXFoMnJUaFFReEk4QWhlUW1RdlIvVHlFOHpqRzVl?=
 =?utf-8?B?eHlJQUQyY0xUbmJXR2k5WVB5c0lJanNMKzJPYjVoN25pYmFmUllIWktpSURR?=
 =?utf-8?B?UVdad3J4NlBKVisyYXY4aG11bmNKdFBDTDNqaGFDSTJLVytNcjY3b1ViLy9N?=
 =?utf-8?B?SExvVWVJNjdYR0plT1ZsaCtuTHBSUjBnNmFLMFRuMUlMNGlHOWV4emx6Q204?=
 =?utf-8?B?Z3pyS3ZYQUVoMXlFbm5JSnpvMTVTUVhieXJsSElvMThIaHVmMGR6ODU5eTN1?=
 =?utf-8?B?TllZSjEvbGlsNkMwNE8rbFozTUhQTVR3S2VvK2RFT1BLMUpHM2lOMHdFZ2ln?=
 =?utf-8?B?Nmh0N0dCU29NVktUYXF2NnAyckFia0h5dUJkRkkySmJNN2k4V096bFlzazlL?=
 =?utf-8?B?NVJJb2lkMXAyZ1ZiMkhKaVR3dUVJd3UzRS8xZXBuVzUxb3MybVhuazIrV25J?=
 =?utf-8?B?UXF2aWkzSFd0MTNJSHhacEZsYjVVWjliMm9SMlBTa29pZnRvRFpiT1NHVGhP?=
 =?utf-8?B?QkdaM2VIbTNELzFpTE5INW0ySFJsK3FEVU00VVZzdURzZkozNGxiV1VYcisv?=
 =?utf-8?B?T3VLUDd3bWJRbDhjQnJoYVQ3c2dCRERWdmx4QWFyWWRXTHdPWEJKanN3QVQx?=
 =?utf-8?B?TUwrYU8vZWdIUkVXc05PaVgvNDVJMzBrbDlsdFB6dUl1SFVJUXNLcFpST2U5?=
 =?utf-8?B?TnZEOGhSdytpMXQxWk5kaDBRQjhaaWJISWk2aG96ZFl0Z1BMUmNGUnd5cnk5?=
 =?utf-8?B?cGEzNkE0V29sSWZUT0p5L3YwaGY0dHFVNk1CUCttSWIzNWNvL0RlN2pCd0tU?=
 =?utf-8?B?VUhyelZaOEdJZEQxSm1VczNGL0dKTEdpMUtFQTZyZkF2VC9hYVRUZktkb0dx?=
 =?utf-8?B?WWd2ZDBSL0VpcWhNcTlmR2RLaE5PMit5b3lJUmx3L2U5N1RPckFpUnZNRjdo?=
 =?utf-8?B?VG9rZk96aUhSQnhUc2c0M0x1YVZzRXBMUys4RmxCTEJPOElQc1pmQzdyNEhu?=
 =?utf-8?B?cElWVUtwWXBPRC9xYnhoeWhCOEFuZUJha0dUcXhuejgxRnVuUXNPejZyZ05F?=
 =?utf-8?B?RndXMlFjVEE4WDhBcnBlMGJoK2s4bWIxZ1ZKWjJYRENkSXMyOFo3TnFDNzRT?=
 =?utf-8?B?by9hdkY3UVBSWS9DVzQzcExhYklibGFVSm1VTjd5S3gyYmY0NlFFYWtudXF6?=
 =?utf-8?Q?ke39PiAXUC5F54yr+HOnvcP8KLXy9rsaV2iJmp2vx0aY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC46E80EA139494B94B0C750E19E6510@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bc87db3-35e2-4cb6-35e4-08d9fa4d121c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 23:58:37.1650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lzsPVjxaWfE+Txz9aptKdyBT58dS357A8vMOr1FaoyQjAKrPtM+uoYG1kEh33AwjTdkYCxNk1iYm2UJyouecyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3157
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 23:58:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162445

T24gU3VuLCAyMDIyLTAyLTI3IGF0IDA3OjI4IC0wODAwLCBBcm1pbiBLdXN0ZXIgd3JvdGU6DQo+
IEkgc2VlIHRoZXJlIGlzIGFuIEFwcmlsIHJlbGVhc2Ugb2YgSGFyZGtub3R0LsKgIElzIHRoYXQg
dGhlIGxhc3QNCj4gb2ZmaWNpYWwgDQo+IEhhcmRrbm90dCByZWxlYXNlIGZyb20gdGhlIFlvY3Rv
IFByb2plY3Q/DQoNClRoZXJlJ3MgZ29pbmcgdG8gYmUgYSAzLjMuNiBhcyB3ZWxsIGFuZCB0aGF0
IGlzIGdvaW5nIHRvIGJlIHRoZSBsYXN0Lg0KRnJvbSB0aGlzIHN0YXR1cyBlbWFpbDoNCg0KICAq
IFlQIDMuMy42IGJ1aWxkIGRhdGUgMjAyMi8wMy8yOA0KICAqIFlQIDMuMy42IFJlbGVhc2UgZGF0
ZSAyMDIyLzA0LzA4DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiAtYXJtaW4NCj4gDQo+IE9u
IDIvMjIvMjIgMDc6NTQsIFN0ZXBoZW4gSm9sbGV5IHdyb3RlOg0KPiA+IA0KPiA+IEN1cnJlbnQg
RGV2IFBvc2l0aW9uOiBZUCAzLjUgTTQNCj4gPiANCj4gPiBOZXh0IERlYWRsaW5lOiA0dGggQXBy
aWwuIDIwMjIgWVAgMy41IE00IGJ1aWxkDQo+ID4gDQo+ID4gTmV4dCBUZWFtIE1lZXRpbmdzOg0K
PiA+IA0KPiA+IMKgICogQnVnIFRyaWFnZSBtZWV0aW5nIFRodXJzZGF5IEZlYi4gMjR0aCA3OjMw
IGFtIFBEVA0KPiA+IMKgwqDCoA0KPiA+IChodHRwczovL3pvb20udXMvai80NTQzNjc2MDM/cHdk
PVpHeG9hMlpYTDNGa00zWTBiRmQ1YVZwSFZWWjZkejA5DQo+ID4gwqDCoMKgDQo+ID4gPGh0dHBz
Oi8vem9vbS51cy9qLzQ1NDM2NzYwMz9wd2Q9Wkd4b2EyWlhMM0ZrTTNZMGJGZDVhVnBIVlZaNmR6
MDk+KQ0KPiA+IMKgICogTW9udGhseSBQcm9qZWN0IE1lZXRpbmcgVHVlc2RheSBNYXIuIDFzdCBh
dCA4IGFtIFBEVA0KPiA+IMKgwqDCoA0KPiA+IChodHRwczovL3pvb20udXMvai85OTA4OTI3MTI/
cHdkPWNIVTFNamhvTTJ4NmNrODFia2NyWWpScmNtSnNVVDA5DQo+ID4gwqDCoMKgDQo+ID4gPGh0
dHBzOi8vem9vbS51cy9qLzk5MDg5MjcxMj9wd2Q9Y0hVMU1qaG9NMng2Y2s4MWJrY3JZalJyY21K
c1VUMDk+KQ0KPiA+IMKgwqDCoCA8aHR0cHM6Ly96b29tLnVzL2ovOTkwODkyNzEyPg0KPiA+IMKg
ICogV2Vla2x5IEVuZ2luZWVyaW5nIFN5bmMgVHVlc2RheSBGZWIuIDIybmQgYXQgOCBhbSBQRFQN
Cj4gPiDCoMKgwqANCj4gPiAoaHR0cHM6Ly96b29tLnVzL2ovOTkwODkyNzEyP3B3ZD1jSFUxTWpo
b00yeDZjazgxYmtjcllqUnJjbUpzVVQwOQ0KPiA+IMKgwqDCoA0KPiA+IDxodHRwczovL3pvb20u
dXMvai85OTA4OTI3MTI/cHdkPWNIVTFNamhvTTJ4NmNrODFia2NyWWpScmNtSnNVVDA5PikNCj4g
PiDCoMKgwqAgPGh0dHBzOi8vem9vbS51cy9qLzk5MDg5MjcxMj4NCj4gPiDCoCAqIFR3aXRjaCAt
IFNlZSBodHRwczovL3d3dy50d2l0Y2gudHYvdGhleW9jdG9qZXN0ZXINCj4gPiANCj4gPiBLZXkg
U3RhdHVzL1VwZGF0ZXM6DQo+ID4gDQo+ID4gwqAgKiBXZSBhcmUgbm93IGF0IGZlYXR1cmUgZnJl
ZXplIGZvciAzLjUsIG91ciBuZXh0IExUUyByZWxlYXNlDQo+ID4gwqAgKiBZUCAzLjEuMTQgYW5k
IFlQIDMuMi40IHdlcmUgcmVsZWFzZWQNCj4gPiDCoCAqIFlQIDMuMy41IGlzIGluIFFBDQo+ID4g
wqAgKiBBZnRlciBhIGxhc3QgbWludXRlIHB1c2gsIHRoZSBiYXNlIHNldCBvZiBpbmNsdXNpdmUg
bGFuZ3VhZ2UNCj4gPiDCoMKgwqAgY2hhbmdlcyBoYXZlIG1lcmdlZC4gVGhlcmUgaXMgYSBjb252
ZXJzaW9uIHNjcmlwdCB3aGljaCBjYW4gYmUNCj4gPiBydW4NCj4gPiDCoMKgwqAgdG8gY29udmVy
dCBsYXllcnMuIE5vdCBhbGwgY2hhbmdlcyBuZWVkZWQgaGF2ZSBiZWVuIHdyaXR0ZW4geWV0DQo+
ID4gwqDCoMKgIGJ1dCBlbm91Z2ggYXJlIHByZXNlbnQgdG8gYWxsb3cgdGhlIGNvbnZlcnNpb24g
cHJvY2VzcyB0bw0KPiA+IHN0YXJ0Lg0KPiA+IMKgICogVGhlcmUgd2VyZSBhbHNvIGNoYW5nZXMg
dG8gY29udmVydCBMSUNFTlNFIGZpZWxkcyB0byB1c2UgU1BEWA0KPiA+IMKgwqDCoCBpZGVudGlm
aWVycyBhbmQgdGhlcmUgaXMgYSBzZWNvbmQgY29udmVyc2lvbiBzY3JpcHQgZm9yIHRoaXMNCj4g
PiB0aGF0DQo+ID4gwqDCoMKgIGNhbiBiZSB1c2VkLg0KPiA+IMKgICogV2UgaGF2ZSB1cGRhdGVk
IHRoZSBjb3JlIGxheWVyIHNlcmllcyBuYW1lIHRvIGtpcmtzdG9uZSBhbmQNCj4gPiBvdGhlcg0K
PiA+IMKgwqDCoCBsYXllcnMgd2lsbCBub3cgbmVlZCB0byB1cGRhdGUgdG8gY29uZmlybSBjb21w
YXRpYmlsaXR5IHdpdGgNCj4gPiDCoMKgwqAga2lya3N0b25lLg0KPiA+IMKgICogVGhlcmUgaXMg
YSBwYXRjaHNldCB0byB1cGRhdGUgcHl0aG9u4oCZcyBidWlsZCBwcm9jZXNzZXMgdG8gdXNlDQo+
ID4gdGhlDQo+ID4gwqDCoMKgIHVwc3RyZWFtIHByZWZlcnJlZCB3aGVlbCBhcHByb2FjaCB3aGlj
aCB3b3VsZCBhaWQgc3VwcG9ydCBvZg0KPiA+IMKgwqDCoCBweXRob24gb3ZlciB0aGUgbmV4dCBm
ZXcgeWVhcnMuIEl0IGlzIGxhdGUgaW4gdGhlIGN5Y2xlIGZvcg0KPiA+IHRoaXMNCj4gPiDCoMKg
wqAga2luZCBvZiBjaGFuZ2UgYnV0IHdlIHdpbGwgZ2l2ZSB0aGlzIHNlcmllcyBhIGZldyBkYXlz
IG9mDQo+ID4gdGVzdGluZw0KPiA+IMKgwqDCoCB0byBtYWtlIGEgZGVjaXNpb24gYW5kIHdlbGNv
bWUgdXNlciBmZWVkYmFjayBlaXRoZXIgd2F5IG9uDQo+ID4gdGhlc2UNCj4gPiDCoMKgwqAgY2hh
bmdlcy4NCj4gPiDCoCAqIEFzIHN1Y2gsIHRoZSBNMyByZWxlYXNlIGJ1aWxkIHdpbGwgbGlrZWx5
IG5vdCBoYXBwZW4gdW50aWwNCj4gPiBlYXJseQ0KPiA+IMKgwqDCoCBuZXh0IHdlZWsuDQo+ID4g
wqAgKiBUaGUgYXV0b2J1aWxkZXIgaW5mcmFzdHJ1Y3R1cmUgaXMgcGxhbm5lZCB0byBiZSBvZmZs
aW5lIDI2LTI4dGgNCj4gPiDCoMKgwqAgRmVicnVhcnkgZm9yIGEgZGF0YSBjZW50ZXIgbW92ZS4g
UHVibGljIHNlcnZpY2VzIGxpa2UgdGhlDQo+ID4gd2Vic2l0ZSwNCj4gPiDCoMKgwqAgd2lraSBh
bmQgZ2l0IHNlcnZlcnMgd2lsbCByZW1haW4gbGl2ZSBidXQgdGhlIGdpdCBiYWNrZW5kDQo+ID4g
wqDCoMKgIChwdXNoLnlvY3RvcHJvamVjdC5vcmcpIHdpbGwgYmUgb2ZmbGluZSwgYXMgd2lsbCB0
aGUgZG93bmxvYWRzDQo+ID4gYW5kDQo+ID4gwqDCoMKgIHNzdGF0ZSBzZXJ2aWNlcyBhbmQgdGhl
IGF1dG9idWlsZGVyL05BUy4NCj4gPiDCoCAqIENhcGFjaXR5IGhhcyBiZWVuIGltcHJvdmVkIG9u
IHRoZSBzc3RhdGUgc2VydmVyIHdoaWNoIHdhcw0KPiA+IGNhdXNpbmcNCj4gPiDCoMKgwqAgaW50
ZXJtaXR0ZW50IHRpbWVvdXQgaXNzdWVzIGZvciBkb3dubG9hZHMuDQo+ID4gwqAgKiBJbnRlcm1p
dHRlbnQgaXNzdWVzIGNvbnRpbnVlIHRvIGJlIGF0IHJlY29yZCBoaWdoIGxldmVscyBhbmQNCj4g
PiBoZWxwDQo+ID4gwqDCoMKgIGlzIHZlcnkgbXVjaCB3ZWxjb21lIGluIHRyeWluZyB0byByZXNv
bHZlIHRoZW0uIFlvdSBjYW4gc2VlIHRoZQ0KPiA+IMKgwqDCoCBsaXN0IG9mIGZhaWx1cmVzIHdl
4oCZcmUgY29udGludWluZyB0byBzZWUgYnkgc2VhcmNoaW5nIGZvciB0aGUNCj4gPiDCoMKgwqAg
4oCcQUItSU5U4oCdIHRhZyBpbiBidWd6aWxsYToNCj4gPiDCoMKgwqANCj4gPiBodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvYnVnbGlzdC5jZ2k/cXVpY2tzZWFyY2g9QUItSU5UDQo+
ID4gwqDCoMKgDQo+ID4gPGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9idWdsaXN0
LmNnaT9xdWlja3NlYXJjaD1BQi1JTlQ+DQo+ID4gDQo+ID4gSW4gcGFydGljdWxhciwgd2XigJly
ZSBzdHJ1Z2dsaW5nIHRvIHVuZGVyc3RhbmQgdGhlIGludGVybWl0dGVudA0KPiA+IG5ldHdvcmsg
DQo+ID4gaXNzdWUgd2l0aCBleHRlcm5hbCBob3N0cyB3ZeKAmXJlIHNlZWluZyB2ZXJ5IG9jY2Fz
aW9uYWxseS4NCj4gPiANCj4gPiBXYXlzIHRvIGNvbnRyaWJ1dGU6DQo+ID4gDQo+ID4gwqAgKiBU
aGVyZSBhcmUgYnVncyBpZGVudGlmaWVkIGFzIHBvc3NpYmxlIGZvciBuZXdjb21lcnMgdG8gdGhl
DQo+ID4gwqDCoMKgIHByb2plY3Q6IGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kv
TmV3Y29tZXJzDQo+ID4gwqDCoMKgIDxodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtp
L05ld2NvbWVycz4NCj4gPiDCoCAqIFRoZXJlIGFyZSBidWdzIHRoYXQgYXJlIGN1cnJlbnRseSB1
bmFzc2lnbmVkIGZvciBZUCAzLjUuIFNlZToNCj4gPiDCoMKgwqANCj4gPiBodHRwczovL3dpa2ku
eW9jdG9wcm9qZWN0Lm9yZy93aWtpL0J1Z19UcmlhZ2UjTWVkaXVtLjJCXzMuNV9VbmFzc2lnbmVk
X0VuaGFuY2VtZW50cy4yRkJ1Z3MNCj4gPiDCoMKgwqANCj4gPiA8aHR0cHM6Ly93aWtpLnlvY3Rv
cHJvamVjdC5vcmcvd2lraS9CdWdfVHJpYWdlI01lZGl1bS4yQl8zLjVfVW5hc3NpDQo+ID4gZ25l
ZF9FbmhhbmNlbWVudHMuMkZCdWdzPg0KPiA+IMKgICogV2XigJlkIHdlbGNvbWUgbmV3IG1haW50
YWluZXJzIGZvciByZWNpcGVzIGluIE9FLUNvcmUuIFBsZWFzZSBzZWUNCj4gPiDCoMKgwqAgdGhl
IGxpc3QgYXQ6DQo+ID4gwqDCoMKgDQo+ID4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2Nn
aXQuY2dpL3Bva3kvdHJlZS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5j
DQo+ID4gwqDCoMKgDQo+ID4gPGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9w
b2t5L3RyZWUvbWV0YS9jb25mL2Rpc3Ryby9pbg0KPiA+IGNsdWRlL21haW50YWluZXJzLmluYz4N
Cj4gPiDCoMKgwqAgYW5kIGRpc2N1c3Mgd2l0aCB0aGUgZXhpc3RpbmcgbWFpbnRhaW5lciwgb3Ig
YXNrIG9uIHRoZSBPRS1Db3JlDQo+ID4gwqDCoMKgIG1haWxpbmcgbGlzdC4gV2Ugd2lsbCBsaWtl
bHkgbW92ZSBhIGNodW5rIG9mIHRoZXNlIHRvDQo+ID4g4oCcVW5hc3NpZ25lZOKAnQ0KPiA+IMKg
wqDCoCBzb29uIHRvIGhlbHAgZmFjaWxpdGF0ZSB0aGlzLg0KPiA+IMKgICogSGVscCB1cyByZXNv
bHZlIENWRSBpc3N1ZXM6IENWRSBtZXRyaWNzDQo+ID4gwqDCoMKgDQo+ID4gPGh0dHBzOi8vZG9j
cy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kL2UvMlBBQ1gtMXZSZ05JU21IMERpdGYwYlJ0Uw0K
PiA+IGV6ZVIyWHNnS0lpU0ZKS0Y2S0pVSHBuem9jTkd6dktaYnVTREtmbVYzbjY0QkZYRFJxRWxC
U0puaEh0RzQvcHViY2gNCj4gPiBhcnQ/b2lkPTE5OTMzNzU0ODgmZm9ybWF0PWludGVyYWN0aXZl
Pg0KPiA+IA0KPiA+IA0KPiA+IFlQIDMuNSBNaWxlc3RvbmUgRGF0ZXM6DQo+ID4gDQo+ID4gwqAg
KiBZUCAzLjUgTTMgYnVpbGQgZGF0ZSAyMDIyLzAyLzIxDQo+ID4gwqAgKiBZUCAzLjUgTTMgUmVs
ZWFzZSBkYXRlIDIwMjIvMDMvMDQNCj4gPiDCoCAqIFlQIDMuNSBNNCBidWlsZCBkYXRlIDIwMjIv
MDQvMDQNCj4gPiDCoCAqIFlQIDMuNSBNNCBSZWxlYXNlIGRhdGUgMjAyMi8wNC8yOQ0KPiA+IA0K
PiA+IFVwY29taW5nIGRvdCByZWxlYXNlczoNCj4gPiANCj4gPiDCoCAqIFlQIDMuMS4xNMKgIGlz
IHJlbGVhc2VkDQo+ID4gwqAgKiBZUCAzLjQuMiBpcyByZWxlYXNlZA0KPiA+IMKgICogWVAgMy4z
LjUgaXMgaW4gUUENCj4gPiDCoCAqIFlQIDMuMy41IFJlbGVhc2UgZGF0ZSAyMDIyLzAyLzI1DQo+
ID4gwqAgKiBZUCAzLjEuMTUgYnVpbGQgZGF0ZSAyMDIyLzAzLzE0DQo+ID4gwqAgKiBZUCAzLjEu
MTUgUmVsZWFzZSBkYXRlIDIwMjIvMDMvMjUNCj4gPiDCoCAqIFlQIDMuNC4zIGJ1aWxkIGRhdGUg
MjAyMi8wMy8yMQ0KPiA+IMKgICogWVAgMy40LjMgUmVsZWFzZSBkYXRlIDIwMjIvMDQvMDENCj4g
PiDCoCAqIFlQIDMuMy42IGJ1aWxkIGRhdGUgMjAyMi8wMy8yOA0KPiA+IMKgICogWVAgMy4zLjYg
UmVsZWFzZSBkYXRlIDIwMjIvMDQvMDgNCj4gPiDCoCAqIFlQIDMuMS4xNiBidWlsZCBkYXRlIDIw
MjIvMDQvMjUNCj4gPiDCoCAqIFlQIDMuMS4xNiBSZWxlYXNlIGRhdGUgMjAyMi8wNS8wNg0KPiA+
IA0KPiA+IFRyYWNraW5nIE1ldHJpY3M6DQo+ID4gDQo+ID4gwqAgKiBXREQgMjY1MiAobGFzdCB3
ZWVrDQo+ID4gwqDCoMKgIDI2NjIpKGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL2NoYXJ0
cy9jb21iby5odG1sDQo+ID4gwqDCoMKgIDxodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy9j
aGFydHMvY29tYm8uaHRtbD4pDQo+ID4gwqAgKiBPRS1Db3JlL1Bva3kgUGF0Y2ggTWV0cmljcw0K
PiA+IMKgwqDCoMKgwqAgbyBUb3RhbCBwYXRjaGVzIGZvdW5kOiAxMjAyIChsYXN0IHdlZWsgMTIw
OCkNCj4gPiDCoMKgwqDCoMKgIG8gUGF0Y2hlcyBpbiB0aGUgUGVuZGluZyBTdGF0ZTogMzM0ICgy
OCUpIFtsYXN0IHdlZWsgMzM0DQo+ID4gKDI4JSldDQo+ID4gDQo+ID4gVGhlIFlvY3RvIFByb2pl
Y3TigJlzIHRlY2huaWNhbCBnb3Zlcm5hbmNlIGlzIHRocm91Z2ggaXRzIFRlY2huaWNhbCANCj4g
PiBTdGVlcmluZyBDb21taXR0ZWUsIG1vcmUgaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGF0Og0K
PiA+IA0KPiA+IGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvVFNDwqANCj4gPiA8
aHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9UU0M+DQo+ID4gDQo+ID4gVGhlIFN0
YXR1cyByZXBvcnRzIGFyZSBub3cgc3RvcmVkIG9uIHRoZSB3aWtpIGF0OiANCj4gPiBodHRwczov
L3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1dlZWtseV9TdGF0dXPCoA0KPiA+IDxodHRwczov
L3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1dlZWtseV9TdGF0dXM+DQo+ID4gDQo+ID4gW0lm
IGFueW9uZSBoYXMgc3VnZ2VzdGlvbnMgZm9yIG90aGVyIGluZm9ybWF0aW9uIHlvdeKAmWQgbGlr
ZSB0byBzZWUNCj4gPiBvbiANCj4gPiB0aGlzIHdlZWtseSBzdGF0dXMgdXBkYXRlLCBsZXQgdXMg
a25vdyFdDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+ICovU3RlcGhlbiBLLiBKb2xsZXkv
KiovLyoNCj4gPiANCj4gPiAqWW9jdG8gUHJvamVjdCBQcm9ncmFtIE1hbmFnZXIqDQo+ID4gDQo+
ID4gKCpDZWxsKjogKDIwOCkgMjQ0LTQ0NjANCj4gPiANCj4gPiAqICpFbWFpbCo6X3Nqb2xsZXku
eXAucG1AZ21haWwuY29tXw0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2MjQzNyk6DQo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTYy
NDM3DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
Lzg5MzE5MTE2LzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+IGFudWoubWl0
dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

