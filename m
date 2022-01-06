Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9CAC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 14:27:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.9154.1641479277889723296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OBm/akYU;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641479277; x=1673015277;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ydc7CDcJXQe5Uo0WYx7wrTBURqMXkLd4tA7hSJLYSTg=;
  b=OBm/akYU3jvw+rlquvWnPbW6cpLCs/Isxm6ajK3wgE74Tr1h+CYl94hG
   TlQgwzWHuV+NtmOB1PBrpDiVdgdGRxP6vHTSCn73yn4G3bTjKFLbAhsIf
   U6He0MXFFXGeeLzWUoXMipExsPyjhRkQonqcYDyMEz6xVLUBXpRlimDyS
   4H8Q/D3Bn1uQkaIMONlkZKsptJd2m0u1tEXWGbjEVpArrEHfU8CMeIEfg
   swJBHhyxzz55+4F6wTgR/+M9dlSPvId9s72XFtK3qUJo4WeI2qSR26GrS
   7iOTdSz0jcYjK0Zn3zro3U1jPiXm8K9bvYwiVSkhFUpyFFYLXAUbZKHGA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222657803"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600";
   d="scan'208";a="222657803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 06:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600";
   d="scan'208";a="574774719"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jan 2022 06:27:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 06:27:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 06:27:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 06:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5m7IJ5FIjcv6yg7WL3ENc51mLp2RQVxUjT9PHw1LCBBBI32SefgbVLR1PTUnh3k4AO07ZAbdIkSHaNAPSd8ZXiXMWJpVB+zWXN7r0HIBW44YgHCrk3wm/1XBXHyW545NFsuPz65fS16GVs8NapitLA4una2ixYqNNH2Z3EK2wcR9FBhoGjL64LnD/ZWJH1LOv1jMj7dXFmbOP9c85TXnWdN0XP6p8AldXw5jd4PsxjbUMjC0ymR2OX4TDDPswalikBeaKrpFiTlvbnf2xDlK553kSfHCZ+IwuQWz8Tk3eAOu5LZgRTL/eLv7RxJQg2OZXYjc8qc/oq6bFv8lnXsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydc7CDcJXQe5Uo0WYx7wrTBURqMXkLd4tA7hSJLYSTg=;
 b=L4rOs66Sf+Gj/fI9AZL587cnK/6x+cCJ+HoHiNPWkAxZSZh4RZEszoeSpThDxtrfwPeFbX+xXp4KgozQFPavFoNYEc9uMsLhYA1Mx8kriGrANLtTo2M85rq9hpMM9lljfJ5RlPxuI9qRpH7LHIGbYhrijPUUZSMbgxqH5Yk1b9pUSwKliVDRUs7q8t8AAQItvnAO/UdQUWTayOXWHB3LCxZpOD+tVxgTCVhyP5aUgmUTyOue2uBeNfy/fbeM6qbWUnkO6VIlzCM8iioeq1cku3vH6K2UTUyMeJpxfspilUGl7gInxOVY2BEGFr2ZB00PyIG3NdYgpIBi2lWdDwNeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 14:27:55 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 14:27:55 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Liu, Yongxin" <yongxin.liu@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Topic: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Index: AQHX+u8I+M0X74xWF0aFf0Z/G/RoW6xVVYrQgAC3+wCAAAwNwIAAA78A
Date: Thu, 6 Jan 2022 14:27:55 +0000
Message-ID: <d3c895a688c5c44b6dc5e04de245b012b2a17a86.camel@intel.com>
References: <16C48A4E435FADD8.12001@lists.openembedded.org>
	 <PH0PR11MB51750B7FDC8104AD362275C4E54C9@PH0PR11MB5175.namprd11.prod.outlook.com>
	 <35e0b2db53eaf44c64d7505e5b70f983e928cc99.camel@linuxfoundation.org>
	 <SA2PR11MB51806AD50344C16F1EF667CAE54C9@SA2PR11MB5180.namprd11.prod.outlook.com>
In-Reply-To: 
 <SA2PR11MB51806AD50344C16F1EF667CAE54C9@SA2PR11MB5180.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8793a231-54fe-4f0d-33ec-08d9d120bac9
x-ms-traffictypediagnostic: BYAPR11MB3480:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: 
 <BYAPR11MB3480D504FB207F30CBD6215EF84C9@BYAPR11MB3480.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 obZDet4KOiLoJLD0VNl0UlkxunOzq5BRE9KmRsAe2Mr6+SneNXLM4KnjUeF+cpVrYaCyH9SBGDy1/SoUEafrTK7zFpDSsSduCvQL3llzItvaZmK9jFo46uxngiZCEJSc2kIkypbdJ4X9RTBTzGu4oC9v1iweIAGH6i0cwdh/E1ZQJBUnWD+4IuoUoaSOnqeeYeOlNQFSlbn44dMIusnpOvr8bCQ1UDWYfABBn794aqSGKfqLEb/53nmdg2DFdJ1tiVXJID770oBuevEwRrPauv+OWIHRL0Y1koMzVKf1OlsP7zrvngPrplHkqDhFtNXunzuz8kzc+6jl3JbkaFwU1BzK6GNhA1IqyvOIgpiNBNGhumZSus4dTGvrhOJppoX0b84xV1UfnlVkn8TN/fYaZMcxEsK+lqy68xrkJmnKRlj4X68tXgGPitc2gQjJd1Sin4xD2kYWg/q4w41mjDQE/UYASF5gXdA3J4VwoOTc12ONR7xsrf1dhI8GnZqyfuCEHiV9yRs7FbS1FX16L4/W9ZTQeo+tLNJbewntG43f8a5txfRcDl75X7pbbrmdzNbwVA7fRnRG9NygCwvzcbazbKfl6XWW/XGTXhDBIlmSWftAGVW0tErFNST6IEO1CQjpVsbsIbRtoNMbSo2WK1MLk8nWpQlr0GHHohcLeq5d7wxcy9v3QYz3tNQQOYCESf1+h6xIRX0huPFTgRDhjmiLWQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(316002)(38100700002)(4001150100001)(8676002)(186003)(76116006)(36756003)(66556008)(71200400001)(86362001)(2616005)(122000001)(8936002)(38070700005)(6506007)(66446008)(6486002)(64756008)(82960400001)(6512007)(26005)(2906002)(91956017)(66946007)(66476007)(4744005)(4326008)(5660300002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXlYdms1OFdlcVRGdDhoNEU3YndKc1NTRWdxN09SMW9iSWNEblFIUkNhanMr?=
 =?utf-8?B?SDJRcE9GWWZkQkxleHhFTlREcVJtRWxaeGU0cHZRdUg1dnBpTDFsNE5EQk5K?=
 =?utf-8?B?UUcwMnJCTkd0c2hMVzBnUCsxd0txOVI1QzhXK2RlWjZjempDWGg3MXFEVll3?=
 =?utf-8?B?UWdEMDJOV2RYcWFXbnVkQzBVOXZQTlVGUHF0NHkrdnM0MFh6ZDdaUFJKZjNC?=
 =?utf-8?B?aWh6dTl2ZHBqZG8rNDJlclluUktHL28wU1VGQksreFVCQmhiV0RQdW16WjhZ?=
 =?utf-8?B?VzZSN2FmTGZVc0ZGM1pVWVN4UzFLYldmc0Y1U0pOcnhjSk41aEdXWWN0TG9C?=
 =?utf-8?B?Y3dMYnZhRjFITzZtdzY2Y2tYZnZMWGxwSTBUOVVlWlRUYUxGc2ZCaW8vY1Nn?=
 =?utf-8?B?SkNoZm9NbG5ub2d3RHk4YSt5NVdyZVVqR1RhWDZHVFV6cnZweFArWTdHdjRx?=
 =?utf-8?B?eXJqVU9nVG5la1ZaZzZaL0dYUkVDLzhWN2NlbXZ0Zkl0L2w2Nld5VEtwdlVH?=
 =?utf-8?B?TmRTa05INUdLVk1xUGRKUnVnZm9qNW1SeFZwWE1UMVdOVzdFUHdRdFNwYi9M?=
 =?utf-8?B?WmthcjBLS3pTelFhSG5pOFVFTVZhSEVjUFZqNFIyQ0RCMHZPY3A4TEg2YTF0?=
 =?utf-8?B?ZGNzZ0oxTGZseFVuZVRiaU1BckZlSnA5dlVRdUNZa0swWjkyaXEzeGlBT3pB?=
 =?utf-8?B?UDVPdW93dFFuZmM1TWFrUXZyZnNFdmlCZW5kbGlIc0cyUmRhQUtTaFhZeFlN?=
 =?utf-8?B?QWNITzc4Y2ZaQkgxUy9DTFV0K1RldTIxVDRjcHVzOTJPSWtsc3VRa3JuUzly?=
 =?utf-8?B?ZGNKVzI5cFVTQ0F5TytwelU3T3dleTgwM2pqd0NQcGZieWNXNG5CRXBoUnBm?=
 =?utf-8?B?S1J1K1VVUVFPckR5bzBLRFAxcTNGOVhxQW5WV3U1d3l1VXYvT0hFaVBzbFIv?=
 =?utf-8?B?ays3RkZXaWtocllwTElIQTBKVllRdUhEZHc5SHh3MTAzVVNmZlZCdVJLSm5s?=
 =?utf-8?B?ZHQxUjg1QURVRWVvaGdYZVphTWJGS29lWHFsWndQWmF6NGtQNVliZGU0aTJI?=
 =?utf-8?B?YmZhWlkwSVZNeXRlc1gyZ1R5dFZMZGpKMCtUQWxseVdLbU5iR09mUi9zdFV3?=
 =?utf-8?B?WGo2U0IvS2hmTlV5SGZ2c244RFZlejdnekgyaW5YbEZtem95QjhUUHBQOHZu?=
 =?utf-8?B?YkR4dnl5NXBWVm5YaWt1cmgxWVAzQmt3cjYvZGYwVStNYmRGcjJMZk80RUo2?=
 =?utf-8?B?L1JzWld2aEY0N2pESFJXYUdxR1pYNmo2MW9OMDlMMUxSR3RCN2ZxWW81SU5Y?=
 =?utf-8?B?cjV1d2l3cS9XWWxzbE5mOVBzWTR5Qk4xS1R5T2NycGU5TkFMQzgyR0NicDdW?=
 =?utf-8?B?TmlmckFqYlpuSUx6M29KZEd2N0kzS01zVjBBOWE2Um1xaW8xcHQrT2huY1lj?=
 =?utf-8?B?SjgwQk9mOE1STWdiVVJMUHVGVVJIMktNTXZMajdjU1pvVFFyRXFMaVd0d3Va?=
 =?utf-8?B?aDVMMmpwRE8xU2hEVE5IdThjZHZsbTVnMEVPeUVNS3ppYlVIUGszTTNBYXZw?=
 =?utf-8?B?SHJLbHBUUGMvY0QrOHovZHBLZTdCM1VEejMyb2NuUTBVZUc0K3lXYkxvMkRQ?=
 =?utf-8?B?RUgrVlJqcnZ4c25tUmlUaGloTlFjRnhiMG9qdWt6bGE1djFKOW5TQStFVVpJ?=
 =?utf-8?B?SFh5VDJWSmVQMi9SaS9Mdnl2WW1MVzJONkwxc1RMMGwzbDVsMmkvait4TVZq?=
 =?utf-8?B?Y2ZFdjlybUg3YzV1TnJleEx3QUZHSHozb0RtbHo2dGZ3aWJUS3BOZjNoanZx?=
 =?utf-8?B?Qm9pbHVpNkRCb3draE0xRE1UK1NTeHQ4SGk1ZHYrMlIzdUtYUmFxZmRxVVZo?=
 =?utf-8?B?UGsvek9QSDlLZEdDR0I1K0RQSUx1Q09OM0hFYnhQTXRoOGFVQ1U3VXB4MDVi?=
 =?utf-8?B?eXFtWndkTVZHT3lSRlhSWHNiQzFmZnVoS3NDaW9GZ3diYUl1MlZSYjZoWUtS?=
 =?utf-8?B?RTBlRHBCMHd4T0xPYm04WVNQaFNnUW55aGVYajdRdnBKbmtOdjBWNFdVRWM2?=
 =?utf-8?B?UjJrL3lnU09IVnV1WXl0bE9WM0tGbkJnaUV1bkRSdG5ld0dsLy9jMGoyNVNZ?=
 =?utf-8?B?QnNiOFdnVzV4dXVBY0tjSGNxWndYL0JNMnhIdERlZlJUcnJ4TDQ3SVVWb01X?=
 =?utf-8?Q?LcM/xORMyzk9fmylLnVNMk3bvdVuhOHhhUoxe2vUd9ib?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AB9B8D342DE144E8E89B077B16A3B48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8793a231-54fe-4f0d-33ec-08d9d120bac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 14:27:55.1761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 eaO6AfQgmMnG0nm8CLhWV0vPcCIFSHtKunyZZTyPfJH5ln/v8XTMf1JT0nAS7cEpIo77LMa7YLuUpoXHYjhsrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3480
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 14:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160234

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDE0OjE5ICswMDAwLCBMaXUsIFlvbmd4aW4gd3JvdGU6DQo+
IENvdWxkIHlvdSBoZWxwIHRvIGNoZXJyeSBwaWNrIHRoZSBmb2xsb3dpbmcgcGF0Y2ggZnJvbSBt
YXN0ZXIgdG8NCj4gYnJhbmNoIGhhcmRrbm90dD8NCj4gDQo+IGNvbW1pdCBiYjU1NGQxNDE0MmY5
M2MzOWZkMTUxNmEzMTc1NzAwNjUzMWMzNDhmDQo+IEF1dGhvcjogWW9uZ3hpbiBMaXUgPHlvbmd4
aW4ubGl1QHdpbmRyaXZlci5jb20+DQo+IERhdGU6wqDCoCAyMDIxLTEyLTI3IDE0OjU0DQo+IA0K
PiDCoMKgwqAgZ3J1YjI6IGZpeCBDVkUtMjAyMS0zOTgxDQo+IMKgwqDCoCANCj4gwqDCoMKgIFNp
Z25lZC1vZmYtYnk6IFlvbmd4aW4gTGl1IDx5b25neGluLmxpdUB3aW5kcml2ZXIuY29tPg0KPiDC
oMKgwqAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+DQoNClllcywgSSB3aWxsIHRha2UgdGhpcy4gRm9yIGZ1dHVyZSBw
YXRjaGVzLCBpdCB3aWxsIGhlbHAgaWYgeW91IGNvdWxkDQpzZW5kIHRoZSBwYXRjaCB3aXRoIFti
cmFuY2ggbmFtZV0gdGFnIHNvIGl0J3Mgbm90IG1pc3NlZC4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

