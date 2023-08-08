Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E573EB64DD
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 01:51:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.52663.1691459499790068444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 18:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RVCsCqgC;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691459499; x=1722995499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kODAe0CQEqBTBnAKeP8YU7/iTscgzuC0MrGqEzjjo3g=;
  b=RVCsCqgCYbwpb19Op3c3qD3Pd5/lf2XgTPodAGdHALtRcFGhAwhWD42n
   NJ3sEwxss8UGaRAnh7TL/5c65b5gYBTQFbCfzSIigDWobIhaTwEd/DHiV
   exHNNsygpoEmZ8pYYbWw0lQoq+QrSL8zmS7q0GcfhzBa2LqQr6q2uvaec
   JKR1wlBdpf0llsKexLlj38cGfiWoJl/iLZ9II9njW6GhFf03emskuqFWe
   cMF0yJnRVzP+fFMjLZM+jM2zf6aLJZQDnfnwh/i9xYceNXldJWiL8slnw
   B1OO+lQFZvilAy4dGWUXhk+RHknWFQ8JYY8lanHlj9vLYb/3s7C/ZbMv/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350286760"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="350286760"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 18:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766190967"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="766190967"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 07 Aug 2023 18:51:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 18:51:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 18:51:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 18:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdEU/E517kwhiVdXxJ2UzZfxQLjaCyPVNhtozh+VbTHnFMARqd8ukUnc29lk+Ulb3SJ5QKWTOURE6Z6tj+Ang7tqx8n/iQc4p6CBDPCA6laqN70v8hWvHfvdS1e2BGacs7tVnR+FVSsXYAv+UQiT/bRT8purxCAsTDD0Y02I4DTsXvSaCw69o77ZuZ/LddNNO6pVmIQ0fDZMbDK13WlRIBHrl1VE0d/tghQaidHCqEpbbQ8DkP07zYNxbH1IUn8tX+3CLunT5pRCTVB1E9uq/W9fZF6S367tfk27aJKilxwsRbiwR23FxoG2CL1maduVS+abP5vObCe1SYAEbQDhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kODAe0CQEqBTBnAKeP8YU7/iTscgzuC0MrGqEzjjo3g=;
 b=JiwhxdIQvtQSaK5t7Clr6TRRrJTmD6hBzHSPlWUzAsvWBCvd8jBydTu7uYQ/eqy7HVZ8RDGT+oxae3YVtwi/Ze15TFNuK81wkzELgWN3igNClO2iNAEqSTy1obEfUfBe6KvBupAkxpl1T9UC57DGhmBTRimkJWjUtwgsJfKBlc53/LqKbR8f4D1orJxQkW9mW+ZP8MaKCfnaSnRtoFCgDBxDxyJH/8BvAAFBqYey4t0Fd0wZxa12KGcxltGKJNd594dxWMEVNu1MQvwrmZAyjUmYFvdYInwucCyB4tZyoMF6h9lgRySMftEJhsntKoBZBY3MKUAewJgdVDRLzSRtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 01:51:36 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 01:51:36 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Hari.GPillai@windriver.com" <Hari.GPillai@windriver.com>
Subject: RE: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16
Thread-Topic: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16
Thread-Index: AQHZyVQVDJfML3W7BkOXOein/S1FCq/fn19g
Date: Tue, 8 Aug 2023 01:51:36 +0000
Message-ID: <CH3PR11MB8093ABF5920A956C7BBA0C22B90DA@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <20230807172414.3219478-1-archana.polampalli@windriver.com>
In-Reply-To: <20230807172414.3219478-1-archana.polampalli@windriver.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|SA2PR11MB5019:EE_
x-ms-office365-filtering-correlation-id: e64a4e10-1613-427f-dada-08db97b2002f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TUeAh0FvXOY4ogdwYzAP9cIEhHjzvs7nBQi3OwMBBpop9UG1yZ/l0fiUMb2XThVMgNimXBikCm1hFQYKTKqGuSf+IOSxFvrstz9eb9NQgGVJpHPVMGN9M5Uow5ELopoa1UMm54KEh/XhKdl1hG8QHiPfVEudK8nzV79TpaObtsqtzuD6bmyzrO9lgQT19c4P5Bbm/Y3/n+Bbx6nkegp9mrstUzUcejx99xzjBVopecSimS35587jfa3z9y8mlyFLoDLxp0i+GKO42qcwjb6kpbQmjgxN5tg+cuOij9374zR6jPGTPNvddpAOmXcCd4WTfZKEEfI1La5/6lXZ9R0qvv+s/+kjG513pQRgZkur1kXFgAsyb6VbGWTM1EOs3T/Isn+exstBB7UoX5/4KVL/F9+aYBatyu9lpfkZNX+eodM8S6/guOdHROy+OIIDhw+mKJghiMTrmicHMcdjJWT+Hg6OBnC7TZd8Oh4Lk5DMw5eMGRpJcsIqY6aaW4NKsmQWIs+ugJuJpjAHRxUTBjaplDcU+oWslpkTt8cqf5RbVu7VWg7Gccxh7a6k7MyWSAfG9CigY2nnvol5dqt/m/qA+o+E+rrUpq6G4qdRmO6hW8eU6x72MW0TLXu6WrqWsC2tg/FaiSHwXPowslsHL0VGl6+C9qX49H7C3vYofPOUIrU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(136003)(346002)(376002)(90011799007)(451199021)(90021799007)(186006)(1800799003)(38070700005)(8676002)(8936002)(52536014)(5660300002)(64756008)(66446008)(4326008)(41300700001)(316002)(86362001)(83380400001)(55016003)(2906002)(9686003)(71200400001)(966005)(7696005)(6506007)(53546011)(26005)(76116006)(66476007)(66556008)(66946007)(82960400001)(478600001)(122000001)(110136005)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3UvRlVRZUI1WGxoaU9VdklTR3FyZk1yZHhMbXdoL0hnMjgvZUp0a1pEbUM1?=
 =?utf-8?B?bjZlV3gvY3NScGJSV0o1OFJvZklYeUo2QlNRckN2S2tVRHpoZndQRnhNM1h2?=
 =?utf-8?B?cDBocmY0KytwODNOVEJTdmNwRy9qZUFJSFRYWG9ZMHBRMmx4dzJEOS9qZFJt?=
 =?utf-8?B?TlEzQ3RPUmoxTElrYjJTdUp4ZXdPSUpPR1BVZ3Z5b0hUVlVFTDBqNGNhc0Np?=
 =?utf-8?B?b2d2ckRuVHFJUmRqQkI1MnhnbERLQmZaZUlMSlZ0THJURHN4YTAvaWdQSHB3?=
 =?utf-8?B?emt3eWVwS3hQbW9KT3RHdjR3V0E5dDJzaDFEOXlQc3pVMWNXMCtjVEFxMXRK?=
 =?utf-8?B?Nm9CMVBHdmowa3VoTk80NWRGUXJ2dUJnbGlxK2JrNmJ2NUU3WDBhZ24rVjdi?=
 =?utf-8?B?aHlhQWlUTUViZllSdkp4ODl1ZWNDMTlGSjYrSmRCNStaNlRsd2NaMVFGelJ3?=
 =?utf-8?B?amxNRUEzelhyUkRtUjNKUTA1dTIxVlJFZEQrZjc4cTY0Z0M4a3B4OEFxdXlZ?=
 =?utf-8?B?MWZ2NmxESGREL2o2MnN4UENTYzQxVW5Xek9VZVQya1haYWh2eEJCZ1JWcFdr?=
 =?utf-8?B?ZUtzc0tLK0xHZ1hmN094bXBKZmhrRUlVeTVrSHB0QVJ1RW9xUllGVHlVTEto?=
 =?utf-8?B?R3p5eHdMWXJ6ZWFERWo4UTJ2blF4VERpam9YZGYwbGo5WDhCcG5TZFUrbkJG?=
 =?utf-8?B?YmhGblUyL25EL2JOdEwxZzNvczZnN2pYeFhVcXlVSnVVbUFDN043dEY1cGdK?=
 =?utf-8?B?L1l1U3N2ZS9QUjVyZmpnekJWc1pmaitRdXpZMlA5QVNYZ2F3Mmg2VGp0WEpC?=
 =?utf-8?B?MzRTaHNCeTUvM1NGSzRjd1cxbGdvS3ZyQWtQM3JKYjhic09HdEJ1dTZCM0dS?=
 =?utf-8?B?Q2g5cDZPTWNzRWxrdTJwcTM0OHBoem8wUVpUTnB1L1NSRWJITzJVdzFRZHRz?=
 =?utf-8?B?THJkUEg3K3ZaMXhpT2YrTVl4V0dNV3dDNlpwUUN4NnlWSFF3OW9kVEpnWDk2?=
 =?utf-8?B?UzA4YkNoWFI5SGl6b05hQUtieFdyc0ZHUndWbzhJM20vczNMQWh2M3ZNcWhh?=
 =?utf-8?B?Z2Rlc3NFdERVdVFkUzA1YzRSaURDRWJlYk4vWUcraGNTZUNYVWRHRWlSNlR3?=
 =?utf-8?B?ZGZJZmtaTHRKWnI3TXFzSWZZcVhXNEFJZDFDWk1oQm1nUEUzTE5MOHV2Uk5u?=
 =?utf-8?B?a1F1YzlyaWY2RWk3a1VLdkdiQU56RVBzSCtQc1hManJBeTh3SGxreVFmLzF1?=
 =?utf-8?B?bUVPVjBBVE1HTG5mNFlLb0ZseHN6NC8vbythSkNzRWREWmFwS2JUeW9DdkZ5?=
 =?utf-8?B?SlllS0k1VGN1MUNWSHdHT1dDWFVLTjhzRXg1d2MyTmgwMDMybFNPWEtYa0ZQ?=
 =?utf-8?B?bDBsMStBbHVSNjZrQ1JYem9FMFZzMTllWmRLY3E2K1hFSFFjUVRZY3dmcjF1?=
 =?utf-8?B?dHVBNjE2WERrWUZXcjVmRVloY09uanVxYWhMdnJRbGdBYnVLaXhIWFV2R2NO?=
 =?utf-8?B?bGhvbFE4SjBTWDA5MldTem5iSFUxRzlENzl0Y0ZxSklxVmZoSUh2UU1Bems4?=
 =?utf-8?B?S3U4emtiS2lhSDhOOTNvWGtkekRsKzhneG5VZWdGcjR0NlgxQ1J3WXhhVURU?=
 =?utf-8?B?N0w0WUcvVWplSDJNMklJTFB6bXFOemVOTHQ5TUkrR0RFRTBMdTJQK05uMW1L?=
 =?utf-8?B?SHRPVzMxQU9HSUZ3cSsyNVd6TVVDeHlCODJlUFkyQURWcVVpL0VWQXN4akhS?=
 =?utf-8?B?NzRwbHVseXo1QU5NVC9raHV5OGlKOWNwZ3ZXazlodGpSL0w5Qm11RkZ6eENj?=
 =?utf-8?B?QmtPRmxVU1g4S1JrdGUwUGdHYVhzbGxwdkdIWklJalpCWFJvejZ0cTRXbkpr?=
 =?utf-8?B?N2QxYk9LeU0xL3h3VTA2WE9kSXFBUFl5c2VsWkg2SEd0WHhMVGg0NDV3TlVl?=
 =?utf-8?B?REp3SGU1dFdFQW9FelVoQUlVaGFEdHBuZXlCaExsL29YYTMyMk41NmgzaTU1?=
 =?utf-8?B?aisyamU1Z0hWc2tZcDhHQ1RsS2xsVFBoR1pjOGFRS1V5am5tei8rMVV5K2tn?=
 =?utf-8?B?cEppdDVoYmVUNHBUR0UvTjc2WG43bGNLL1NlWENQc2w1ditCQjZiRUVXZUUr?=
 =?utf-8?Q?mHjzNUPdUFPYq4i4MdwfaP1ek?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64a4e10-1613-427f-dada-08db97b2002f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 01:51:36.6117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETewnl6kJGYQx1EyGWHGRympFTIujJg4iZeG+FCC8si4AiO+NHpFixh42Rxwdf9tUJLp6YuoR4TNEUT5b6lSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 01:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185629

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFBvbGFtcGFsbGksIEFyY2hhbmEgdmlhDQo+IGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDgsIDIwMjMgMToyNCBB
TQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzog
SGFyaS5HUGlsbGFpQHdpbmRyaXZlci5jb20NCj4gU3ViamVjdDogW29lLWNvcmVdbWlja2xlZG9y
ZV1bUEFUQ0ggMS8xXSBiaW5kOiB1cGdyYWRlIDkuMTguNSAtPiA5LjE4LjE2DQoNClR5cG8gaW4g
Y29tbWl0IHNob3J0IG1lc3NhZ2UvdGl0bGUgIiA5LjE4LjE1ICIuDQpUaGVyZSBpcyBzaW1pbGFy
IHBhdGNoIGluIG1hc3Rlci4NCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVk
ZGVkLWNvcmUvY29tbWl0Lz9pZD03N2QyZmE1YWMxZjM5NGZiYTJiOGUyNGYyYjZkZWQ2ZWE2YjY5
MWI0DQoNCg0KPiANCj4gUmVtb3ZlIC0tZW5hYmxlLWVwb2xsICBhbmQgIC0tZGlzYWJsZS1kZXZw
b2xsIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGFzIHRoZXNlIGFyZQ0KPiByZW1vdmVkIGluIGJpbmQt
OS4xOC4xNg0KPiAgICAgNmI2MDc2Yzg4MjogUmVtb3ZlIG9ic29sZXRlIGVwb2xsL2txdWV1ZS9k
ZXZwb2xsIGNvbmZpZ3VyZSBvcHRpb25zDQo+IFJlZjoNCj4gaHR0cHM6Ly9naXRodWIuY29tL2lz
Yy0NCj4gcHJvamVjdHMvYmluZDkvY29tbWl0LzZiNjA3NmM4ODJhMDAwMjgxOTdiMDRhODI3ZjZj
ZjhlN2E1MzY5ZGUNCj4gDQo+IFNlY3VyaXR5IGZpeGVzOg0KPiBodHRwczovL252ZC5uaXN0Lmdv
di92dWxuL2RldGFpbC9DVkUtMjAyMy0yODI4DQo+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4v
ZGV0YWlsL0NWRS0yMDIzLTI5MTENCj4gDQo+IENoYW5nZWxvZzoNCj4gaHR0cHM6Ly9naXRodWIu
Y29tL2lzYy1wcm9qZWN0cy9iaW5kOS9ibG9iL3Y5LjE4LjE2L0NIQU5HRVMNCj4gaHR0cHM6Ly9i
aW5kOS5yZWFkdGhlZG9jcy5pby9lbi92OS4xOC4xNi9ub3Rlcy5odG1sI25vdGVzLWZvci1iaW5k
LTktMTgtMTYNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFyY2hhbmEgUG9sYW1wYWxsaSA8YXJjaGFu
YS5wb2xhbXBhbGxpQHdpbmRyaXZlci5jb20+DQoNCg==

