Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5687EC4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 09:31:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.32528.1702459850686678255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 01:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UEYkA8rY;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702459850; x=1733995850;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=i2vUWQnuVZRtTiouWwrncTOfHKdHrh6Ru5f2JyPsIg4=;
  b=UEYkA8rYYBMGi0XvlsPrDm0nkg3bt4Dwn9z7WsHG06m5g5u9RsQRH/6A
   Ed7CwPzdCt8WPnoTW/vIptNzOJ1ITerOvm9KHNQS73Z7Mc/TFer6+EFRH
   O+ee7VUDAtAeSB9ZqsDS5OjKyzA24Nio08H6WDOdqSI60i+0RsNUcmULw
   uI+QqrDCjPG6zL0aes9fn+FhmsQP3wehUmx3EFzHkD3FB/VWXE4b+sizU
   p3wWyOTiTNIBQeffEZ+H82D6hLlRQZOEsC6ESttEuvejdSrO54LlmwEUz
   qiu0SD5FBBCLvsIHGmGgbSHZIohso43PCRRRZhjILv0E+mhL3PmFLlq9b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397721768"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="397721768"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839796590"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="839796590"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Dec 2023 01:30:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 01:30:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 01:30:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 01:30:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 01:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0wHQqFt5BT/HEnKR3cVqF1gqOnAdfwQQoK2t6xdrLwCLra4h8oifKbtmW/PaBfXwyiQ8V6jQ5qQCITRWb7UyAXkPk2XyJJp56Cl8kheKM5357FkDAATu4dZpRwWSWsaLITrUnDn/zFd6FUTrfRTpINEtsrNt83IRlBEUPKQrkr1TkGS/ztRRVdD7+8KGl/ROwkJrJX+4BNaBGHQzu7ZUvVS/TtLyhlAgWvNDUEexpRPEHJ2fm6E3t6vQCZVLUKaLl6h5L5hQB8H7WZsFXGkgIuFfr1t5z3nS1vr2hHsTIOuyyXGHfwuRBOyMhSYZhPWaCqxtarSUOKGpzCJ6+SMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2vUWQnuVZRtTiouWwrncTOfHKdHrh6Ru5f2JyPsIg4=;
 b=GJ8k7LzjqInJOrV2+NC4qK6rT09lU1SxcB6rw56ZwxZ92P6IhWjMj4ZWnAvf1/LTvlZqOL/U7r1aeycOaQ7qupPLmJ+WWNkLsqBpjO1PaK1fM+mZOBnrS0gfFUbmCVuMpb98AwBm83Pes40wDqCJhq03HoaqJkzYwRyFz1ASufJt7mQlGH+JpTazXGFAl4Pr+fZYD9uccBMDuEiD52LAFoJGEXmNm/QfVdIOjoVxqVCQtCzpgAFfStWELb9p4vZHtESsNL1CvJCgbxvqNaMcP6eXukIwyn4P0seF64QMpjCY8DIYLm2BFFJw9SNKR56KWdXjPTxgQnlsEZ9piD1iqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 09:30:24 +0000
Received: from IA1PR11MB8098.namprd11.prod.outlook.com
 ([fe80::ef13:8654:e094:5972]) by IA1PR11MB8098.namprd11.prod.outlook.com
 ([fe80::ef13:8654:e094:5972%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 09:30:24 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH 1/2] python3-urllib3: update to
 v1.26.18
Thread-Topic: [OE-core] [kirkstone][PATCH 1/2] python3-urllib3: update to
 v1.26.18
Thread-Index: AQHaI4tuCxmObVKP80mLyddssQTtVrCm2M+Q
Date: Wed, 13 Dec 2023 09:30:24 +0000
Message-ID: <IA1PR11MB80980310EDFE0993FF608C6EB98DA@IA1PR11MB8098.namprd11.prod.outlook.com>
References: <179C676967C2C293.11889@lists.openembedded.org>
In-Reply-To: <179C676967C2C293.11889@lists.openembedded.org>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8098:EE_|IA1PR11MB6395:EE_
x-ms-office365-filtering-correlation-id: 4d0f1f54-c580-440b-91ef-08dbfbbe229c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kRKXNIrXjAj1ade1U1S77PL6HawQOxNbwT5k7ug8X8ImR7ecKyUGwopkbYVpAYQx5PzGTWCL9wqn6qHMpLID96OacPFjVQFBlzcUtKo1bSd/pZXDMBEEAE0lSJWb0mTkZwW17HJapomyc6lXlqn4gdR9d01HPzqLuaH/m9gx4SoCgSNYAUKE6Qb8gP2jHB5d9JDkhmYHF7Ug7VR/8uhkOioBfZaC0o8xnJDlz+N7x1geRRchc2vB7mnXOFa6xOX73YqQN0cBc7vBh+uHwRg8VWyk0kEtEVkeTfjHxT40Z0gDIqpOSHdxCtic2kn7mPY/f/xs8bhMTI2k1WKaywu8ywIPZDHNdkwbStYcVCQuKv9bZ92FeDv8mdTWOBYuB5RyY9TtDjece8oDuV5nA7tk6t9jE4fOzyyzQ63pQgDksax4xPqqKV17PD6s3HiS7EfWd7dBffVjJIZQMi1q+sKi8m1naEkAZz+7ISEVm8B4/HJ9v3Y76umk5nD8ewNV3IepgN3l1qO7X6qXWGwfXI+ET83u0l/OF1YKhS3btoOme32FJqtRsTUoAgG8ErsrDn3E3dDZHL0u56HZST9hw8CPkMJeROyCn27CzNd/zhK99CdNbSSudM46WjavY6Zrp9If4mFhMBLHN8UZZAwih1/1bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(15650500001)(55016003)(2906002)(52536014)(8936002)(8676002)(5660300002)(66446008)(66556008)(64756008)(66476007)(66946007)(76116006)(110136005)(316002)(966005)(122000001)(478600001)(38070700009)(9686003)(6506007)(7696005)(53546011)(71200400001)(26005)(38100700002)(83380400001)(33656002)(41300700001)(82960400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS9lbTNVQW9YTTNtOVN2R291bGNpWmlybTYwQVNRbHVJaEFsNml2UHBvVDVq?=
 =?utf-8?B?VVIySUV2Vkhaa0JtdDBGZVhjbm5NNTVaUG44T01kQkFjSlM4WjdwVnJUS0NC?=
 =?utf-8?B?em1wOFJPRm9RVHEzSDZhYnlFWnpqVCt2c2ovcTZxUjkyWWFHMGwzSk5BdFdP?=
 =?utf-8?B?S1h6S3kvZFQrcXVXWjREaEZYd0E0WFV5ekp2aWxCZU02T1owdVZac0JDOURh?=
 =?utf-8?B?M2JDVTQvQTdKdTJFOUtjajF2R3ZHYUUvdFlSWDNsZUh5NkE4b2JXU2tkZndD?=
 =?utf-8?B?M2h3RnV3MG11SFlEMFhjalBJMGNlbEpZbmRhd0NnYUlzMWdEc3Z1dEhwcTZM?=
 =?utf-8?B?bHNQcmQ0aFhFSCtJR2RxV1BvalBQV0x2ajNFQ0p4QjdBV1ZUZXk2TlYwcys2?=
 =?utf-8?B?VXRFQ0dnVm9UY2V2amNHUUdjeGtTd2lFbENKVHpYMU0zanpZcDJNWGV0Y0ZY?=
 =?utf-8?B?dTlNSHVLd0xGTXVEZEoyTlQyN01sSHp0VE1FRnBwcWIycFhCQ09rcklJdlVQ?=
 =?utf-8?B?NlEwZTNuVXdRU2dlNUtnWkhUbythVmd2dlg3c0RYTUN3bDhEczZHNnFBQ1pl?=
 =?utf-8?B?a2htRlRmZjZCN1B6cEJZbE90b1NhYmZleXVhRWhmSndtRnpPclY5MUYrVFBy?=
 =?utf-8?B?S1VRRzk1MmFseDRseldvQkRZTWROT1R3YVB5VXlhS3FNKzVmcUM3dFRwNDJZ?=
 =?utf-8?B?WVZXRlB2eWdLSmVDakwrQzJkSnVNMFRxb0FUdEtvdkMwVWxQbnlvdGtqN05z?=
 =?utf-8?B?UkJnUU1xSldNRllXelI1L2FHZ3BIMGJoRTZmamhYUzVHNXlzaEJOOFpKREdX?=
 =?utf-8?B?SHg4aFNNSXoxaDdUREMwZnQxSUJlYUZPT29Kd05IY2dVWER0YU1oYlBQNFFL?=
 =?utf-8?B?Q1hMQnRGdDZZbCtUY1l3bjBuSkdKSVhERUF3LzdSV1phY01naHhpTERhSVli?=
 =?utf-8?B?RXcvd09zaXgyRGM2T0tyWTQxU0lOMnkvOXpzUFJWaXJYb25SZ2JrcXA5RjFS?=
 =?utf-8?B?MG1QcDhtb3g2Ty9OMG1EUHhVU1NidEZGTmVvUjJLVEFhTXc2VEt4UlRBeHZZ?=
 =?utf-8?B?aXNzZllzQjJjbXFVYWtqWU8waXlYVlYxVU5ZdUJmNW41K1FMbTFGQ2ZnL0Z0?=
 =?utf-8?B?SWQ0dVlvaHczM3RRUXpKbllobWFwb29wNi9lSEhmM2owcFlMNHhPQmZGZEYx?=
 =?utf-8?B?dHJTeWZxRFBHWTAveE1GWlEyeGs3ZHRCbXNvVHVsNzJiRFlvYWdPV2xJWkdo?=
 =?utf-8?B?dS9jSXcwZFJiU28yKzR3eDQrY2RBZ0NQWEZCb1Q1Z3haNXhmZ1doY1M1MzlQ?=
 =?utf-8?B?elJlVmVOUEY1QWZKTFZvbVVLdC9ySVYxRkxmWmlRUERJb1NHNmg4WFZORjB1?=
 =?utf-8?B?Qjg5Nlo1eUYxdFF1c1oxeTFoUkhZWXlFald2cVpUMG54VmozbERSRnQ1Q2Jw?=
 =?utf-8?B?dEF3d24vYkZML3NkTHV1Y1NXaUMxZnNpRjZndkFra0RkM0lCK0xBVVNCQUpE?=
 =?utf-8?B?a3hYQzYxRFVPWG00NnFrMUNpNDZqWjgvQkkrR2YweUIwUjdtUGNmZXRzdkRu?=
 =?utf-8?B?WU1ISGZUWFJOdFNJYlFZYWxoU3lwa3hqSGdZbzdDSjE0dXpwSnY2QWtjSyth?=
 =?utf-8?B?VlJaMG5XL3pLbHlwN2dZSndEQ24wZjBhOHh4TjAvYWlFUDI0QVBodVJaT2J3?=
 =?utf-8?B?TGlXZDVZK2wyZ2NwdnUrN3htcCtlUUZrNEcxVHZqM2NCbFI4ZzNqeCtmNGtt?=
 =?utf-8?B?ZnlXZW1PZHhpOUNROTJ0OG5BSHJWVURKODFyYWJoR3lZSkVVRjJnYzlLYmsv?=
 =?utf-8?B?YVRLWHJhQThxd2JYU3k5VWh6TElHcTNyTGQ0OVBtRGxNcEdQbDJlN2IrVHJp?=
 =?utf-8?B?QUhLK1RRdXRsZGM2b2s2LzIvTTFsWU0zVTgyaEFGRnhmK1k1TUpJOWxvUmJM?=
 =?utf-8?B?MEtoL1ZNa0dqNk1LRzMyQ24zQVpMUjUzbWtYaGUyNGUyMStiNGRqeHEwRHFp?=
 =?utf-8?B?bU10ZnMxTS9WeE5xeXMrSFR4QVVqTjBEa2JydXNhYmRSUG5UOStYdEgvYnc3?=
 =?utf-8?B?a2JyTHZTT09kZnM5ZHp1L2MxTVpuWVpLUElOLzgzS3l2aU1hbjMySUFKL2RP?=
 =?utf-8?Q?4XOSGcI8RvY+1Yjmim390q5Zh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0f1f54-c580-440b-91ef-08dbfbbe229c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 09:30:24.5931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FGYauhQ+Q/fsyNxHJUlfW3K1/vRC2vVsbkSka6a9kxhdoHKhXp12WEO3CFHtK5a6whn4i/sy8FlXsJI+iRCoJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 09:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192276

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTGVlIENoZWUgWWFuZw0KPiBTZW50OiBU
aHVyc2RheSwgTm92ZW1iZXIgMzAsIDIwMjMgODoyOCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW2tpcmtzdG9u
ZV1bUEFUQ0ggMS8yXSBweXRob24zLXVybGxpYjM6IHVwZGF0ZSB0bw0KPiB2MS4yNi4xOA0KPiAN
Cj4gRnJvbTogVGFuIFdlbiBZYW4gPHdlbi55YW4udGFuQGludGVsLmNvbT4NCj4gDQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS91cmxsaWIzL3VybGxpYjMvcmVsZWFzZXMvdGFnLzEuMjYuMTgNCj4gDQo+
IE1ham9yIGNoYW5nZXMgaW4gcHl0aG9uMy11cmxsaWIzIDEuMjYuMTg6DQo+IC0gTWFkZSBib2R5
IHN0cmlwcGVkIGZyb20gSFRUUCByZXF1ZXN0cyBjaGFuZ2luZyB0aGUgcmVxdWVzdCBtZXRob2Qg
dG8NCj4gR0VUIGFmdGVyIEhUVFAgMzAzICJTZWUgT3RoZXIiIHJlZGlyZWN0IHJlc3BvbnNlcy4g
KENWRS0yMDIzLTQ1ODAzKQ0KPiANCj4gKCBjaGVycnkgcGlja2VkIGZyb20gY29tbWl0DQo+IDc0
ZGEwNWI2MzYzNGMyNDg5MTA1OTQ0NTZkYWUyODY5NDdmMzNkYTUgKQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogVGFuIFdlbiBZYW4gPHdlbi55YW4udGFuQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IExl
ZSBDaGVlIFlhbmcgPGNoZWUueWFuZy5sZWVAaW50ZWwuY29tPg0KPiAtLS0NCj4gIC4uLi97cHl0
aG9uMy11cmxsaWIzXzEuMjYuMTcuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTguYmJ9ICB8
IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAg
cmVuYW1lIG1ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXVybGxpYjNf
MS4yNi4xNy5iYiA9PiBweXRob24zLQ0KPiB1cmxsaWIzXzEuMjYuMTguYmJ9ICg4NiUpDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxp
YjNfMS4yNi4xNy5iYg0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzEuMjYuMTguYmINCj4gc2ltaWxhcml0eSBpbmRleCA4NiUNCj4gcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xNy5iYg0K
PiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNf
MS4yNi4xOC5iYg0KPiBpbmRleCA1N2IxNjY4NzBhYS4uZDM4NGI1ZWIyZjcgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTcu
YmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNf
MS4yNi4xOC5iYg0KPiBAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL3NoYXpvdy91cmxsaWIzIg0KPiAgTElDRU5TRSA9ICJNSVQiDQo+ICBMSUNfRklMRVNfQ0hL
U1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9YzI4MjNjYjk5NTQzOWM5ODRmZDYyYTk3
M2Q3OTgxNWMiDQo+IA0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjI0ZDZhMjQyYzI4ZDI5
YWY0NmMzZmFlODMyYzM2ZGIzYmJlYmNjNTMzZGQxYmI1NDkxNzJjZDczOWM4MmQNCj4gZjIxIg0K
PiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gImY4ZWNjMWJiYTU2Njc0MTM0NTdjNTI5YWI5NTVi
ZjhjNjdiNDVkYjc5OWQxNTkwNjYyNjE3MTllMzI4NQ0KPiA4MGEwIg0KPiANCj4gIGluaGVyaXQg
cHlwaSBzZXR1cHRvb2xzMw0KPiANCj4gLS0NCj4gMi4zNy4zDQoNCg==

