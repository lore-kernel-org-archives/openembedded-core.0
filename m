Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14ACC35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 01:21:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.817.1702948889064275649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 17:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=SJ8hsZba;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702948889; x=1734484889;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=9qJ6q64EMnrVR/YKWqANI8HJi1JOHM2TpL+doHRVals=;
  b=SJ8hsZbaePy674bIcHu0ILloq1hHOWqphEhCAbXJMTxaWFP9H0EmrKt8
   AWZwDHaPPSEUME4Q0pUkH2L0gEmrj0QPM7FPN1e/RnqufShwNH/RDCAO5
   sNzFoEIg3FTu4smDf9x/5QjdaSLtYSlsxm5r5S4UJQsb2W/kxmol5td92
   tdcZi9oQV9uemkd3Q66cH8CErSqK5pUAm83fLi5Y/AeksgtsW/sDAIyub
   w0WEYhZsXTScrxwlCnKXwpr/lAa/6SwFzLqY8jiY5aceCuNARqH4Ufhgq
   BuO7q82n+qWdrSAZW2qXuyBCXvGUK2nRwwnWz+9YIiVAD2Twkxsaf85ES
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="386009503"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="386009503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 17:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="948991398"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="948991398"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 17:21:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 17:21:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 17:21:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 17:21:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITJjdvu3R2VBjO6N2ovrbrZjzF2KOtoUWkeJKYDu8mN9ey6Ue2YGoHg9/R7CQkBS/EJiDrwNQSXh96fS0zhsmUnRzjdlq0TKaN7nXKv2DxTViiz80zENABsNEXkcHtSdQPF1XaDyUsoQc3DxW7nEnnZ8zqgFx8yqB/XC72jk2lNTCAMVyfTKfggzRvJNx/s/m+KoYyUIWDph3JMrKPdW6Ce+PqjcYw/IhI/R5a7Q1WmZ/OlOQO8F4cQjNNSitrC+RoaFks/e0d2XpYWzC9ILr+jc03kqGtpLXOaBlM/N+Myr/5wE81F6oeWimBjlMhvsK4LztAVV3ObO58DUrY1jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qJ6q64EMnrVR/YKWqANI8HJi1JOHM2TpL+doHRVals=;
 b=oFWpDJNBJCihj8tDZpwYlGziCZDWx+AGvbgc5b1jETUyjpN0FA/DNz9yG2+rDDUBJlfUT1oLRq+kTvO7lZortWL/MKxwZlXmnwPC61Ia7zLbUtoXdbVCZdX8sajGontcPO2bGG+f50+vgD4EsW5Dez+nGbe88XeW1hkPAsGoPotoUy+F3dWl66knZdXgOgjrILVJ2myC6MYy6DAoVDCSgvNUuGCg79KRSQQsNwYDk8l/3neA4XYrqJIn9e85ROXKv/mQ6w7BjMsDMz0qiBpUG0Td25RDdfnipKOSN/8PcjDzlTkV1z366ryoadW5Xf97vR7v/+2GJlyIY2LzWV+dng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 01:21:22 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 01:21:22 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 8/9] libusb1: fix upstream version check
Thread-Topic: [OE-core] [PATCH 8/9] libusb1: fix upstream version check
Thread-Index: AQHaMcE0DqLYY9FNIk+fkC9vpdexgLCvz9SA
Date: Tue, 19 Dec 2023 01:21:21 +0000
Message-ID: <3b584b8d0ab685bf2e52db09c200f4406f3e0bd2.camel@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
	 <17A1F46838A40031.24236@lists.openembedded.org>
In-Reply-To: <17A1F46838A40031.24236@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SN7PR11MB7137:EE_
x-ms-office365-filtering-correlation-id: e6a4f249-13c0-440d-5e4d-08dc0030cf11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oA52jq98CXpPc0zdQSb53hvwF7JbG/W5FWTPufSrSp575AIPDnvnibKaaYxtznK2Ssck5/ZAS7xIuZg4Wg5K9EHzAWB2W63+Vf3iHNYBYSwqrgiFfAgLrVsr0a7tGQRWnf5djUOVrdPnKH5ZBVtaP00nNNFQaCfH3Uw9TF4TbDZjDrPCrb88kqmrlHM79G8aDKUDKgMV5nzCGMA8dSuTZHmohTocFc6u+1L1Rk1BLVlehdkCN8gmYWHaXfdR5bAU15gkFptXJWoQLhY3dGDVotdAsQZlChTC2nkf8bZnZSmEvPeQJjlsvU3kNDW77lJEx1RmS16p5dB1t7GzDAili5J9j0/VJrPoAKLmRYgK3u8NHHT8sx+1i83tMsjujfggvIeZBltaFezqP9qFZ+pUkSIrYhSVpyH5OKqjszSWAitYZk+9IPw6g23eZ0aR8My2ikhvApW0kr3zoL90KjKDrC/9HZclvJkcDJ0ghN7YCNUr06LomYxWBP4zrSOjz0/39wFkdjSpxVwv4+YlPb8XOZMrHUJfyu3cf+T6BFCMfw20DX25+hd123krmv+MzYvvfsU0IixebGkLRpibTPi+z82+FcQTqda1lTsNAfIBTnM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38070700009)(316002)(6916009)(2616005)(66946007)(4744005)(6506007)(2906002)(83380400001)(26005)(4001150100001)(76116006)(66556008)(91956017)(66446008)(71200400001)(64756008)(66476007)(6512007)(5660300002)(38100700002)(122000001)(8676002)(41300700001)(86362001)(8936002)(478600001)(6486002)(36756003)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUtaV1ordFR4ZnY0WHBUdDdHSHpsUmkzSUIycm4rNUVRbk5zc01vaTlqVklQ?=
 =?utf-8?B?ZnlwbzZuZzljdDJ1RElQMHkrWEgzWTZ2ZFByMGZmMzI4cllSd3hLQ3czWXQy?=
 =?utf-8?B?MWlMaUVCMU1QdjlYR1RDZmk4aUQwNDJFMFNYRi9jYzJaOEJiN005b3oyUWJa?=
 =?utf-8?B?bzRKUDRMS20rajdESVRURGZjV29aaExMTW4wbXdkVkVpbVkxK1lpd0s4SXRx?=
 =?utf-8?B?RTdsZzVLeUZkSXM5MUJNRFpsRGFWMWU5Y3J6WjJNOW9OVXVKMjVtamtwOWlC?=
 =?utf-8?B?WnFhcGtoR2lEV1poSVFkYkk3Yk9Dc1ErdEVPVnNkbWJBSmRUeVlCcWRDMkhz?=
 =?utf-8?B?SGxEaGdtWkpxWVI2ZW5YOHM2WDNWeVpXSWx0SUdiQ2xzVFRUMEU5bnVyMlJo?=
 =?utf-8?B?V0NZUnRIWk0zU04yOUx4bXRDNnU4bTZTWk0wM2hKRmhpbkM2VlF6VGRGeFlJ?=
 =?utf-8?B?c05KTDdMNDBCNGRXSmM1NElPOG1SbWZndlNkdjhseFdWVW1iZmowYkx2dVE4?=
 =?utf-8?B?ZEoyRTZlc0VBV2pja2N5NE8wdVc2VC9ocGZaRExCS3g0ZTlhQ3ZITWRXWDRm?=
 =?utf-8?B?eC96K3ZicVkrclJiVE5ZWTJvVTRUR2J1VXZlazg4Q244eWRPZElSa2NwMW5j?=
 =?utf-8?B?THIyaURWTW96WStYK05veDBVUW5QVEd6ZHJsRGoyZGhaRHR0R3dpTUo4cnpy?=
 =?utf-8?B?U2FLUUUzdHZhSFZhRDBNcDBhblA4clp1R2VaeFdzTVU4OFR4WXlCTGJTS3Vj?=
 =?utf-8?B?S1MvQVdyNklqTHIvQ0dQU2EvYnorZWpTbzdmTlRKKzlHZkNBM2tldWk0em1u?=
 =?utf-8?B?V0l4SUJvRHJNU2xjOXU2SkdYL1A0QmNSV21JVENPWHJvcGFrVWV2dUsyWUlz?=
 =?utf-8?B?a3pPa1pGbG9pZVlWKzJQSG1wbVh1aFFmUEV2bng0NG0rTk9ZL1o4d0IreDcw?=
 =?utf-8?B?RFpJMmwyTFAvNTA2Y09SR2lmcGR0WnJOYzJmcEI4QlJJOGJycXNJWXFRSGdw?=
 =?utf-8?B?Ti9kVDN2YW1WZ2RuOTF4WVB2czNOOVZEcEtzNmxtL1dZamh2cFlhbXNvV3Rv?=
 =?utf-8?B?K0FlNHRlbHFQcjZla3gwTmFmTFd5Y3B6YTNaVDJLdmRxb2lLRUFmaVJGN0dX?=
 =?utf-8?B?Q2YwUWJvNEYwS25KbDVCRUhMbmd1SSthODRFeHE0RG0rcndTb3p0Q3pSWjJ2?=
 =?utf-8?B?UEJRZzd1cUlRWG85ZmMrcEwwamI4MUJtVS9IcEhOZUhIRFVpRFN3UzMzVGRh?=
 =?utf-8?B?TzhsOUhqN1pPTU9aUUFoeHdNbVAwclc5N0ovakJaTW9BZjU3T2t4TkxGdWR0?=
 =?utf-8?B?c01HenVCSGlsZzMyeWpleGFTYW1mMmliN21Lb3AyZTJIdlMxRW4yLzNreWhK?=
 =?utf-8?B?V0g2YTZpWTBDY2NjMGlIRjJOaGIvN0loSTNlSmxmUjh1N2NCSUFRUnNQVkQ0?=
 =?utf-8?B?bEVZQzFzQVowWnRUN2ZYR2E0TXYrNDZDWmFtTlpvZ2hnRjJKTURNQ3c5TnJp?=
 =?utf-8?B?a0pJOVgxWHRWYUQ2VDlWYW9qdlZKOEs0RXZRUlNqR0tuNVFad25PQ0tDQkts?=
 =?utf-8?B?c3c5STE5OEZOZFFWTDRxWVNlanR5V1V0eW4zTHdveDI0UUJkTkg4VVIvWmRM?=
 =?utf-8?B?cHNsMU5rV3VFYlZkQTgrZkY2TXJOODlETGZYUGVSUWRuNFpqMGZsY3pXOUtW?=
 =?utf-8?B?WjdJajdUUVV6czZvU2hDa09abmlNdEN3cWRGMDFqQ2NmemFvd3prZ0g3aWV3?=
 =?utf-8?B?aG9MbnhyOUJuZkwwQXNmQ3NaQjd0WDhrcUJiSHliWXpTVlZPK0NneUhlTWxU?=
 =?utf-8?B?a1M1dDJvdEZhS3B3MGdCcXJuQWYwNGcwKzU0RW5OK2YyanlwQ3IzanYydit2?=
 =?utf-8?B?NTBvTkNBenhNU283bGlYa3VTOFdkUDZ1M3FoSVlGSmtIUm50NEl3NFRnTzlC?=
 =?utf-8?B?endER2ZOcmN0dG54a1A3d3YvQmloSW9VZDVuRTlkazlBSjVFNXdnaDUzTXVT?=
 =?utf-8?B?aHJwb25sUlRZbGJTSXE2SGRwNTNOWG4xWkhZQk1kUHE0ZUhLTmZ5dEpGWEpZ?=
 =?utf-8?B?VHh6R0s2TkpSV2MvZGZzYjQxNGZ1bXN0eWRTOXlDMzUzc3YvMkQ5bmZpWGk4?=
 =?utf-8?B?djBYb3lFMU52ZUc3MGRzN2tlZVFDYWU3WGttT1hNQ2xXNUNRcFI5T28yTnJw?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D33209A579A1BD43A7FFE75E2E0BC7E8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a4f249-13c0-440d-5e4d-08dc0030cf11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 01:21:21.1792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLufIDrjwQV9HXXh3rs/L0+1BoBbSvHAA1BcLA9vcLOmQSEpQGdiMgQ+o4+AQOiBgyJJsDAzhsu8NGeaqGQPJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 01:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192684

T24gTW9uLCAyMDIzLTEyLTE4IGF0IDIyOjQ3ICswODAwLCBBbnVqIE1pdHRhbCB3cm90ZToNCj4g
Rml4IHJlZ2V4IHRvIG5vdCBtYXRjaCByZWxlYXNlIGNhbmRpZGF0ZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjYuYmIgfCAxICsNCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjYuYmINCj4gYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjYuYmINCj4gaW5kZXggMTIyYzNkNDhiNGYuLjFi
OTNhODBmM2U3IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGli
dXNiMV8xLjAuMjYuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVz
YjFfMS4wLjI2LmJiDQo+IEBAIC0xNiw2ICsxNiw3IEBAIFNSQ19VUkkgPQ0KPiAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9saWJ1c2ItJHtQVn0udGFyLmJ6MiBcDQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgICINCj4gwqANCj4gwqBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL2xpYnVzYi9saWJ1c2IvcmVsZWFzZXMiDQo+ICtVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykiDQoNCkkgc29tZWhvdyBt
aXNzZWQgaW5jbHVkaW5nIGEgbG9jYWwgY2hhbmdlIGhlcmUuIEl0IHNob3VsZCBoYXZlIGhhZCAk
IGF0DQp0aGUgZW5kIHRvIG1hdGNoIHRoZSB2ZXJzaW9uIGV4YWN0bHkuIEkgd2lsbCBzZW5kIHYy
Lg0KDQpUaGFua3MsDQoNCkFudWoNCg==

