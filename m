Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57564C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:00:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.5240.1690351247048612078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=G5ZyvUPF;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690351247; x=1721887247;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XkE+zU+xcRipyMNagVDPgu7kIvC9JRqvvAuEUgOeMno=;
  b=G5ZyvUPFuj4BSZ8o9dCJk8rlqg1mlEo3p5lZdmpxX+xvUAx7wzDdG41U
   RhazZknH4FdcQB3hbjxcy7+BRut/JxCbgIxc/B7gIgXkx84DV40U0TpT9
   omuGiHM5GWX/tUap+FPp5/+LgNDJhDlzTKD6Fav+ep7KlirLZ5ufagsSj
   2/Q8zGA27lSgToc6k0cADDeSmAZQzhgf8lNLvRhtHGb47mgxZDBPTH6jo
   eemqc7p+WrUoB0A8N7p0bLbMEL7xd9EOOb3WmM+TeS0R4nCwDtoTgQ426
   XBpZL80Yn4sG9ba6/8u/0P2n7IChOjj0vF5h3K+S1erWrXK7qnUlLVi6G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370600415"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370600415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720320645"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="720320645"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 23:00:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:00:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:00:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:00:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/lkQR93nf18raLXRH2MKbcs9GFzslwfKX6uuPG92lL3hwxzFYDtB3XWeaG0/9z9C5QcA04rzXgJo7q70PPkwiS1vs2TiCHEywS4R9iHK1VXJQVnzlSxUbcTYQWvqvjCjLod0iK1z1fWI6f4PM1eR3HH3X+r6nKJX3zcoVwzwq1vfFICEIoBI1AIbX6mY76p/Nwowx2ZqAKxlkNTaajIJIyN6hwN9gRrZKJiD4WeZ1aqfIV3bS359D82zMmOW7TxL67WBbYc4s0MHD1bOClOUSd28ZWJ/guT5sA3YSkgiL8wABIqMV+1zmPS2WRgnmiiiDVVBrM+al0pbivk6juuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkE+zU+xcRipyMNagVDPgu7kIvC9JRqvvAuEUgOeMno=;
 b=Qs4GYth1ZBzgNHmX1+JyIhih/BuFVFm2aLfX3BZKEVnnciQUMAEYbLyWjE/wx4HmvFlz+yCJ2nMTfCiRj7pWENARt0CdEckDmZu2D2GRhzq3CrDeiQ128r493SZY+FU06gSTkAgNkfdaInStMCnsIeb24p7EseD9xVyoAehjN1CYkjmNueIp1zsj3RzwSriKlVibrgWfzmM9m3NEQtX0Dv0N90T26A+XcFp9unHqhVMa5967u+UiwSo1U/FXkLseXJFUc2PzLbzqWNAq4pyk2uK/3UKBMHg23iGFgyYKZA3sWbzYkvgVWYgaXU30RqShalK4o+ZBO4WGCPVszjLV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:00:42 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6609.025; Wed, 26 Jul 2023
 06:00:42 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] Toolchain test results
Thread-Topic: [OE-core] Toolchain test results
Thread-Index: AQHZuv0eLeKLkpz+HEmePLstP3FOsa/LlwmA
Date: Wed, 26 Jul 2023 06:00:42 +0000
Message-ID: <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
References: <1772EB68FCA90E64.1400@lists.openembedded.org>
	 <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
In-Reply-To: <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CH3PR11MB7937:EE_
x-ms-office365-filtering-correlation-id: cbf4d3f0-d619-41c5-b605-08db8d9da54d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7Sg8gh0tcaOorAEOc3+BZP9zk3RW3phYD4g9zmCfyPeGRbv/Npy/9VZJZsfOd7LWFWp/CD1JLtFbW4FLjLOs/I9REc7HGTHH3P4VvE1rwqjTjxICh2IonLzXS/CYTq+gEZbhrWgso9eXI//4LeLh5WdpMHDAhWJrPrGaUiOTD60POMHipfhiStBZBuTWPGWYfotuJAVppb8dkVvLvA1ZFIdXhtMOMhsXHv8scjxgZrmPxvS19GnoXExp9hhhZeW756J9LcwphH57OkAjY3rbghVr2HtmRp5YHcCIfh5bDkhe1xFRWRb06/y4+5pLyehhlbFuZCbrr/sYA+Ap8f+O+wU9RuUqCIkLse9NnAgm1u1FhzeTZRT39HedfKfBSM55w6h0Nengk5ZsfVqYLVghOnfcNYtnMBVLqBMVb5o24+Cy3ifxuxWE4FpB56zepc0H+RqIKSL3FcaTHEnhKaFqPmachvntyi3yIbIXyvrjNC8OxvUzzW6IoQuucGDPmhW59/r7IZxJYAAY8pJjyFnJon1776aHZ9Zh80GBEoPu1oxXDOguDeD2FdneSywrLCOh1Ga4QZZNUzKZBFt6mieA32DZCWHZK26xxQcgUCkrUE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(966005)(6512007)(6486002)(54906003)(478600001)(110136005)(83380400001)(36756003)(38070700005)(86362001)(2906002)(66476007)(66556008)(2616005)(71200400001)(186003)(6506007)(26005)(66946007)(82960400001)(122000001)(66446008)(38100700002)(91956017)(41300700001)(316002)(4326008)(64756008)(76116006)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFc1QkFpTFZta0tSRHRsVG12bnBRbWsyK3ZQMEpJalF2TjZnTTNFQURwRjZz?=
 =?utf-8?B?ckhBOUJ0d253N3ppZU1FYVduczM5d0JLV29acjBRRkFnM3dtdjlBNTk1Mm1w?=
 =?utf-8?B?Um9PWW40VFhwTGJEaVkzc3lBR3N1VGxHWHBVT1JiR01kLzZnMXUvOGJxWWNk?=
 =?utf-8?B?MURSaDc1Zjdoa0Y3ZnNkSThrSVcvc1hqYzFQbnJNZlIxN1N3S0hJVmFCSHlI?=
 =?utf-8?B?ckxneVhidG14NHdhYjZkNDRENythaXJwL0FWRVp3SmgvTTRXL25oeWg0OTdE?=
 =?utf-8?B?WWNPR2xsWlpVVE5uM3hJdGcrR1NiVFlIWEp6M0pDNFNmbjMrTXNJS2tuYzFI?=
 =?utf-8?B?TEVTWkVJSi9RQW9ZU0U5R3l4UGlvQkg3c0lSMzVyTTZQMzEzblV2YWorQ0J6?=
 =?utf-8?B?QXg2KzZpQm1TeEV0Ly9jR2ZyemFXV3BobkhaVzJkUWdKMGRCMURyYWQ0b1Rz?=
 =?utf-8?B?NWdtWmh5eW5mL3drczZTMENhckswZlFhbURkK04vNldyNG5wL0NjSzRnWlNi?=
 =?utf-8?B?TG81cGlNUjlRTmJFbktlLzZvVmsyMFlxMFVzdEVtUnRpSG8vSm1WTkRzWk5Y?=
 =?utf-8?B?RWo0NDRuNlhXMjNRbWVUNnZCS2lMbi9rYzNNTUlMeUpYMlcwclcvSnB2VlBl?=
 =?utf-8?B?S1ZobzgvZXIwWDBZWWFDdThuazJFMURrQWc3YllqeDJxSlFMVVM5YWwzODU5?=
 =?utf-8?B?Zkc0L1Ztb0NBT281UWdzNzF6RlBJbVJnd2FXbU00SnluVTVlaEJ6L2o3aGxT?=
 =?utf-8?B?KzB0QzJzRVhFOHhjTnp0aUpoZnNmQnZMV29lbnNKU2gzdGVYM091MmdBUnE5?=
 =?utf-8?B?L0N2NnRjU1U0dVZsdFdITXVwVS9lcnROUFZYaHNlVUc0TVZLV2d0VkRkNWk4?=
 =?utf-8?B?WTdRTlVTMEIrNHV2QzZlbTdyTUJMZXl0VkM4eHprV2JOOERGRUZjejFNNW5B?=
 =?utf-8?B?UEMwOExhamsraW5rTUs2b2h6ZDUyYmxScWt2RUxwM3U4Q1hlNFl6NUdxZEY1?=
 =?utf-8?B?Y2RZNTZFTTE0OGdHZkxXNFVHeWhlK28xNm56SUNVSVcvRWs2Z29MR0crc29E?=
 =?utf-8?B?ZzEyQXpjdzdCcHdqMnZ3K1JKbFdPMFpYSHZPdzF1STRxZUJSREt4dzMvQnor?=
 =?utf-8?B?R0hSeGJYRlJMK0lzR09VbGdRaCtJa1BUWXVXTGNKWFlTQjNWb1Nib3poUTJR?=
 =?utf-8?B?czJBNTNGMUlCUy9wcHdpeUs0UHR3YkFXVExkVFBoTEtvMVQwbDRENWpZc0pE?=
 =?utf-8?B?YkUrK3FkS2F0Z0pCNW5QaVpRa2U0KzFkcGZyUHZWZVF3aWxFUVVJbm1JL2M1?=
 =?utf-8?B?V2dpZ1FwdjRHWjRVYTZJUDB3U0Y0anhmVk1CUjNSVEVYLyt2SUJNT3Q2S3VN?=
 =?utf-8?B?VDVPaW9pT2laR1dGWkkwTmVkU2VzcEVTanZvbnJmOWJWQTdSVHJrc2VGaW5U?=
 =?utf-8?B?dzllQjBXTXN4UTB1Mk40MEpxbmdsSTdvNjF6d1RoMURzSXpINHdhUHBzeXpG?=
 =?utf-8?B?TFJVcEh2Qkh1VzRSMGtVZC84bkZzdVR1NVFhcXUrc3pxUVZyaXN4Q1RrMFpr?=
 =?utf-8?B?SEJ3dm1wNDBTdkR6SWNDSHN1bUNrMElqMFdFZkk0Qy9Oc2p5ZS9MemRLSExB?=
 =?utf-8?B?dDVlcng3cFFjN2h4bzVDdHBVVFI2VHdwdFdjMXJXalNqT09yWUdyUFlabTV0?=
 =?utf-8?B?L2VTQ003eFlTU254S29PMUM4L2h4TTlUTVVrWklnSXdubzVWVVFjM2JnUWsz?=
 =?utf-8?B?ZVpJK3I3UXNKNHozZzVHZ2VrYkt1TVJYTmwrQnhiU01SY0o0WENRNUdiQ3JZ?=
 =?utf-8?B?c2E2UWJTTG1jckdNNzd0RmZzNDQ3OTYzWnE3YWFrUThONjVPL2pxaVFPNEVU?=
 =?utf-8?B?YUE4UTNFZlliakVaRnRqSUR1THU3MG5zSXVJRHlXN2tUZUVGWVVBL1k2RFVD?=
 =?utf-8?B?UjhQeUtleUhXOHhNZTZ4RGNTQmsxbkk0YXUyRUp2eFlkNW1idTdCS2diTmo2?=
 =?utf-8?B?U2dScFpsQzA5T256SmhtYXZIbjRrdFJ1SGxZNEo5UEtkWXZ1bGFyTUxuaFN3?=
 =?utf-8?B?eEIxWVlXRllOVGtMeUVUdmo4NDdnN3hMMmh0V1BHalVsNXNTT1FCZGk1QnRq?=
 =?utf-8?B?MENCcWlRL2JBL2c0aXdEL3pQbGs1VDIrMEI0MjJ6Rjd0VVBTdklYUlRZSERF?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36F521A8D8B91E408AF9A0F7C4B65A43@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf4d3f0-d619-41c5-b605-08db8d9da54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:00:42.5384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1aY4/gMmtr6aM6dN9toPa7zWELD09iTdNJqXIlj4O5Q0v0dEi9ZHmBH1M0avV2zt/i3cMqJ/R2OA9gqoK183Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184858

T24gVGh1LCAyMDIzLTA3LTIwIGF0IDEyOjI2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVHVlLCAyMDIzLTA3LTE4IGF0IDEwOjE0ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBxZW11YXJtIGhhcyB+MzUwIGZh
aWx1cmVzDQo+ID4gcWVtdWFybTY0IGhhcyB+MzUwIGZhaWx1cmVzDQo+ID4gcWVtdXg4Ni02NCBo
YXMgfjQwMDAgKDM5MDAgaW4gZ2xpYmMpDQo+ID4gcWVtdXg4NiBoYXMgfjQwMDAgKDM1MDAgaW4g
Z2xpYmMpDQo+ID4gcWVtdXBwYyBoYXMgfjYwMCBmYWlsdXJlcw0KPiA+IHFlbXVtaXBzNjQgaGFz
IH41MDAwIGZhaWx1cmVzIChhbGwgb3ZlcikNCj4gPiBxZW11bWlwcyBoYXMgfjE2MDAgZmFpbHVy
ZXMNCj4gPiANCj4gPiBBbnVqOiBDYW4gSW50ZWwgbG9vayBpbnRvIHRoZSBnbGliYyB0ZXN0IGZh
aWx1cmVzIG9uIHg4Nj8NCj4gDQo+IEkgcmVhbGlzZWQgdGhlIGdsaWJjIGlzc3VlcyB3ZXJlIGR1
ZSB0byB0aGUgbmV0d29yayBiZWluZyBkaXNhYmxlZA0KPiBmb3INCj4gdGhlIHRlc3RzIGFuZCBo
YXZlIHNlbnQgYSBwYXRjaCB0byBmaXggdGhhdC4gVGhhdCByZWR1Y2VzIHRoZQ0KPiBmYWlsdXJl
cw0KPiBmcm9tIH4zOTAwIHRvIH4zMzAuIFdlIHNob3VsZCByZWFsbHkgdHJ5IGFuZCByZWR1Y2Ug
dGhhdCBmdXJ0aGVyIGJ1dA0KPiBpdA0KPiBpcyBhIHN0YXJ0IQ0KPiANCg0KQSBsb3Qgb2YgbG9j
YWxlL2ljb252IHRlc3RzIHNlZW1lZCB0byBiZSBmYWlsaW5nIHdoZW4gY2FsbGluZyB3cml0ZQ0K
d2l0aCBsYXJnZSBidWZmZXJzL2ZpbGVzIG92ZXIgTkZTLsKgU29tZSBvZiBvdGhlcnMgd2VyZSB0
cmlnZ2VyaW5nIE9PTS4NCg0KSSByYW4gdGhlIHRlc3RzIGFnYWluIGFmdGVyIG1ha2luZyBhIGZl
dyBjaGFuZ2VzOg0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFz
ZS8yMDIzMDcyNi0xMS90ZXN0cmVzdWx0cy9xZW11eDg2LTY0LXRjLw0KDQpBZnRlciBzd2l0Y2hp
bmcgTkZTIG1vdW50IHRvIFRDUCBhbmQgaW5jcmVhc2luZyB0aGUgbWVtb3J5IGF2YWlsYWJsZSB0
bw0KMTAyNCwgdGhlIG51bWJlciBvZiB0ZXN0cyBmYWlsZWQgY2FtZSBkb3duIHRvIDY5Lg0KDQo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpx
ZW11eDg2LTY0IFBUZXN0IFJlc3VsdCBTdW1tYXJ5DQo9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpSZWNpcGUgICAgICAgICAgIHwgUGFzc2Vk
ICAgICAgIHwgRmFpbGVkICAgfCBTa2lwcGVkICAgICB8IFRpbWUocykNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCmJpbnV0aWxzICAgICAg
ICAgfCAyODkgICAgICAgICAgfCAwICAgICAgICB8IDggICAgICAgICAgIHwgLQ0KYmludXRpbHMt
Z2FzICAgICB8IDE1ODIgICAgICAgICB8IDQgICAgICAgIHwgMSAgICAgICAgICAgfCAtDQpiaW51
dGlscy1sZCAgICAgIHwgMTYyMiAgICAgICAgIHwgNiAgICAgICAgfCAxMTEgICAgICAgICB8IC0N
CmdjYyAgICAgICAgICAgICAgfCAxNDk2OTYgICAgICAgfCAyOCAgICAgICB8IDI3NTk5ICAgICAg
IHwgLQ0KZ2NjLWcrKyAgICAgICAgICB8IDIxOTI2MCAgICAgICB8IDMwICAgICAgIHwgMjExMDgg
ICAgICAgfCAtDQpnY2MtbGliYXRvbWljICAgIHwgMjcgICAgICAgICAgIHwgMSAgICAgICAgfCAy
NyAgICAgICAgICB8IC0NCmdjYy1saWJnb21wICAgICAgfCAzNDI2ICAgICAgICAgfCAxICAgICAg
ICB8IDE5NjIgICAgICAgIHwgLQ0KZ2NjLWxpYml0bSAgICAgICB8IDI0ICAgICAgICAgICB8IDEg
ICAgICAgIHwgMjQgICAgICAgICAgfCAtDQpnY2MtbGlic3RkYysrLXYzIHwgOTY5NSAgICAgICAg
IHwgMzIgICAgICAgfCA1NDU5ICAgICAgICB8IC0NCmdsaWJjICAgICAgICAgICAgfCA0OTg0ICAg
ICAgICAgfCA2OSAgICAgICB8IDE0NyAgICAgICAgIHwgLQ0KcnVzdCAgICAgICAgICAgICB8IDE1
NzY4ICAgICAgICB8IDAgICAgICAgIHwgNTU0ICAgICAgICAgfCAtDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClRoYW5rcywNCg0KQW51
ag0K

