Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7DDEB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 01:34:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.24460.1687743267790411328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 18:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=QKQPOBHa;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687743267; x=1719279267;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m6dEFBdxPS+OVHbYnkM85e/fTMW/xDsQctn4uG+JyZU=;
  b=QKQPOBHaHQ3B/xvznpUWlCHAr6ao+8x5q+J+hLgnAqUB4bPQNgvpfep3
   xWQDafD8F11DlW63bCC3MHtKfmIbUCz7P2tFUO7L4N+aULM36TMUAN1Ca
   LNsL/nFPJK7zE27usJeHtAoDRK5hiPxAdMYsH0zb0H7lBhSYarJG0cmQ6
   uezRe+Ai8PekujyTragvCQ4d5a1gEN55RhFCu12VCu64tAqh4jZOBEl6I
   JO9ynfL9p4hrg/taNgt4qnaVHs9VneufPvhFmJRefgdT48taOYbMSnaZm
   MaRFur3/orXFkEeOWuX6baVTZMQN/NAZCiZPRn9ZPKpdxLLGpyK+5KK7O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="391354188"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="391354188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 18:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="719157319"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="719157319"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2023 18:34:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 25 Jun 2023 18:34:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 18:34:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 25 Jun 2023 18:34:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 25 Jun 2023 18:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6L7g/g/IT9myPHPZ23uU9ad5ME3L6JK4Nq1nOpIDcpjWpop9YhVAiLlZ7RfRuie16lxmJ7/V4xVupM4kDBb3UIySHfyKazgHti0g2bVqHOWE4/aVhrk5gUT7xuIdyBDHq/l0a+TGEAj7PlHJNajZIqy3csIcfCNuqRcQ8ewP66Ktdm6gXHbXLdX5kJ85ek6+LIlRQcQH8gPTt4wCIk0IQKV5/JD8kFTR+WQqIM3FPNT/kSdmNYDVOgFYHnyNVUzktW6dBs/q5pxSYU6CukqJxDbcRGhw7adzm+3Em2f6shxBG5yilbHUM0s20JOVp2Od7cczFSJ8ZUFE7K64veHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6dEFBdxPS+OVHbYnkM85e/fTMW/xDsQctn4uG+JyZU=;
 b=TMSPzVL+z3zueq7b4TdDLqqC6w/Q4h20SgwYiLkvDfGPo7S0vWiALGd3tEINY8Qtk8Co/onlN0GyVuLyINKDBZLTQa7oBD2xo5tLe8x63xt/xQTTv0HF09Vo7mAtng8hvEbWZ5XqT/mPcWzP9Bmk0nerJMmQ3N5pXz9Pk/LDiTJ2kPVZ6aOMaRPXjgjcIESfjQkYrIfUDL/Dq135IlJ/GZFixhrQ+U/h12ydeFrnkKLsQJZFLON80/sLlgAGs4s8YkdAx8RswF7kGmS7Huy3g8s5st3h7YO8uef5ZcEQBA52by8fKCg70yj75DGmQLZ0sUAsM0cG+wGIrBUeWrAF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 26 Jun
 2023 01:34:21 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 01:34:21 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
Thread-Topic: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
Thread-Index: AQHZpWBpGCLJqb8QTkqfuvy+T5jIqq+cUYoAgAAAXIA=
Date: Mon, 26 Jun 2023 01:34:21 +0000
Message-ID: <ecb3ee101804ea84dbcde3caf0f23100e2fbbf5a.camel@intel.com>
References: <20230622232211.928913-1-bruce.ashfield@gmail.com>
	 <20230622232211.928913-3-bruce.ashfield@gmail.com>
	 <dbd74e45917a899a54fcf18e89ba759c46da8651.camel@intel.com>
In-Reply-To: <dbd74e45917a899a54fcf18e89ba759c46da8651.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.3 (3.48.3-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH8PR11MB8106:EE_
x-ms-office365-filtering-correlation-id: a68071db-078c-483f-67ca-08db75e5775f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ybjrjAdKj6ulWMLwYOZqhWDi8KIRiTjKDH/2oHgbelgVfvGLqi18CnnM//piyO9OLi7uVR3sUdPyDTvpZdbCe2nPjEmLRXkn/JRfrqRWAW3S3d4a7GvUpRFuzejkdcUlKvpzzmwc1XHtJJC3YbQK8UBYlXi7KSF0RCHPLsExEad19b5DHSwjIo0VQWE9bfPUezJwLP4JhIvTyXP+gdQumbK6Gdj1sVTDv6uiemTERKI4vYrqaPskni73Bqgh8JWuHzpVY12FG+R8N1fvw3WcHKy39kfrVwMJQiM0KfHZ9v58rEkHa7bp9gbjD7/gyacIaP03qOcnkLsd67T8VAFqBe9x4LoY86TZfWGopytqG23RTsAFK8ni+aYuS8ediqtn8xPrVCZNIbqswirIg2lPjq7SYjJi7+SSc+lB4Zl6kQMW/XbrXROelCe2NblgJv30u2CSa5cK5h8Tsd432yQdBiSJztZkmyNjWS2Zdjxcn9ebdNznbEnI27TGYrSN0/bxpqjwkO92/E4kyyryTzCYEewecMCcjp+dWwGw/O/rq0dJnRsdQWnpdhn0sfrE8zLjTPUsxZiNsmtKmTUu0KSMeH2NSs3mkSUPeFxJ8HoMK/hyPk2orn8F+R6k7UKD6ZL9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(83380400001)(478600001)(71200400001)(6486002)(66556008)(82960400001)(38100700002)(122000001)(76116006)(110136005)(91956017)(316002)(6506007)(186003)(26005)(66946007)(64756008)(6512007)(2616005)(86362001)(4326008)(66476007)(8936002)(15650500001)(5660300002)(38070700005)(2906002)(66446008)(36756003)(41300700001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eC91WFhiWUdnU01kelkrLzhtK2gxcUlxaXVoa3hwTWVJeWYxeElQZmNkcUVD?=
 =?utf-8?B?R1VyMGtxa2lXZ3dMcWMyZVE1Y25qY2o5QVN5ZWNjZ3BadTJoaTdTRlJlNzh1?=
 =?utf-8?B?MTgyelB1MUZ0aDdRcFAzMHBoVmVSVkFUT3NiQ3p4ekNOSVY4RTh2aU5sUTMx?=
 =?utf-8?B?amtKRTlDWm9hUXJZNm9JS25HdXVmcHZwN0dSQ3lXR2hvQTFoSHVYWW82ZnR6?=
 =?utf-8?B?dE43NGZKaWhuNDUreHE2b3lPSkVjdDQ0Rm90L2x3c1V1V3JEQ2NYY3JEYVFt?=
 =?utf-8?B?NzQ2ZnRPMXBldVIrbWhjVWpRMjFnMDZER1YyWCtSbXdsV3RzZEZkUjVCSDBy?=
 =?utf-8?B?VVRneWo1ZzM2aTlSZEY4TlBXSlU4WVdxNEdwTlg5NjVSQVB6WkQ0YmNnTmZC?=
 =?utf-8?B?VEJyNWZoN2lYNDFoWW5ncUJCaVRVOEZ3ZUV5bkF0N1l2anVicWRuUzJITmZ3?=
 =?utf-8?B?NmxGd09wMVNmVDBMQlp4TGpmYWhJNXJBR0ttRlEzNlk3Vmk3eHMvREFBd1pz?=
 =?utf-8?B?VXpQZitMak9nUUdCby9kaHE2N3Q4QkIxeVZDNXNpSnBCMFBnTXRnTS9pVjQx?=
 =?utf-8?B?RzJKak90WDk1eHl3emxsSnA2WEsrTmVzNW11SUpBWFZ4RzlMMHlWK3NMSGZo?=
 =?utf-8?B?R2VUaVFjaVB1K1E4emhBWENIUkxqbXY2eHpVM3FDM1d3ODM0a3pKWVBnYmhQ?=
 =?utf-8?B?dXVCeG9xVkJ4aXdmUmkyK0xIRmtyeVE2TnVMVXFmYSsrK2g2d0s5RzQ0RlVj?=
 =?utf-8?B?Ly8wOURWZWVZdWhXMjNFM1VWbnlrcWJJNDZvazBESkZucExZTkFMV250SlI2?=
 =?utf-8?B?RGtad0ZMRmxtb25DdzlHM2cwVmdMeGJlanBoSjRMaUdlWWtaQWVXQTRWVTRj?=
 =?utf-8?B?clRHTmJ0NDRFbExEcFZCZGg3THdpT3ZZTlQ0MVpvZFp0UUhaR1IyZ20rUHha?=
 =?utf-8?B?M3VWNjNJQ0JGR1NZZlVqUHVrdEF5cjhpUSs2cnpHRU1TOUx5enIxU1pISSta?=
 =?utf-8?B?TWtPZkRhUVdpdEZiSXlxVCtFRFE5UlVnZE8rZkNGdEJVVGk0S29DNnYzczV3?=
 =?utf-8?B?cEd5UThZZFZRbThhank3UXBSaXFMNXk1TjBaWTZQMkFmRThpZXRxOFpzdDZV?=
 =?utf-8?B?RllXbzlmUjBteGIyeFRIcUhnT2dBcjA0b3dkM0gyWnliSGM5WUtIN2l4YzV5?=
 =?utf-8?B?NTBTaVFGSHNheVpTTnZ4YkhqRlpKSjI1K3dFT0Rwcm8wK1dWQk5KbHhWSDVt?=
 =?utf-8?B?ZG9tRm1ReGVucytnUGdYWE1sYVdabG1VMVlCSm5XbkVzMXBEa1FjYSswT0I2?=
 =?utf-8?B?eWVIbWJhcVJHcStmZWxFOGZCRksxUVRpOVhxZW5taUlzZ1hlRTQyeUorcGVu?=
 =?utf-8?B?R09CVlFaQm1MY01JNXlVZ3U2WWh5YjRYNGxUZ0NINGIrbkNBMmVJbGxKVWRo?=
 =?utf-8?B?SUdPRno5YTl1V2FZTlV5cXoxR2NHa1lwMDF3SlZSZTkrQVB1WnJ0YVBJQVZu?=
 =?utf-8?B?WHFjbnQ2ZUh0WUVpVUxxRWxhcDRMT0x5bldNdm5GekpKbWdKRmFIQVNXYnMr?=
 =?utf-8?B?VWNleXJSam13YURrNE45OFZZb2ZzMXZYekx4cVdWckR0bTA5VUgvMzlQVFkr?=
 =?utf-8?B?RzRGTWxPZ3NZZUZpKzVheWdtUEJjeVJNRUMxcUFrWkNLYUxCMGx4R3ZNZ2Fl?=
 =?utf-8?B?ZWdEYXlEMzlDWEhBRXRVZFlxTGV1YVlIYVZJM0Qvb2ZKL25jZ1pmVEh5L1Nv?=
 =?utf-8?B?WEg1anRFRVpMYTdGVGFzSUJmVlZTZUl4N1hTbEVENk1yM0pSRlg2a0ZSMW9E?=
 =?utf-8?B?YVdDR1lTZzVwcU9jSnFwOXhob1FXTWdEWGlGSmd4bjZHRHNPVkpLYVdWMkxa?=
 =?utf-8?B?WTRkcjlZaFJBbEFJSCs0UVowdk9ub2cvUlJ1aGd4TkpYVldUeWVCNFJDT0pF?=
 =?utf-8?B?aGxRZXF2WGFNY2dpOHlVZlhQemI5eDBFc3B3N1cvb1RSLzViNGxtbFFMV1No?=
 =?utf-8?B?WVdxc0FhcVpSbEQwQ2gwaG1OQXJEcGJGcGZXVGtjT1pxLytjNTBXeEMwSWcx?=
 =?utf-8?B?dWt2RFlnZVU4WFM3NDM3REtTckRrdW50VTJJc1ByemFWQWE0emhzT0tJMEZS?=
 =?utf-8?B?Y1dNTjdnN0JWdERXNUpzYzgxSlJSTjFDdTlMZ21VRU5OZUx3YVFJYmJEdklu?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0231A9409DE37847A953143AD0F1C34E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68071db-078c-483f-67ca-08db75e5775f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 01:34:21.3548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AChIFzoK+ieROYvtmQyyupWW7CZTPOyc4godUB3iy3kHXJhiTIPNNB95stCKiDN4f6BKa9hmO+ZQFz2IdU3lvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 01:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183399

T24gTW9uLCAyMDIzLTA2LTI2IGF0IDA5OjMzICswODAwLCBNaXR0YWwsIEFudWogd3JvdGU6DQo+
IE9uIFRodSwgMjAyMy0wNi0yMiBhdCAxOToyMiAtMDQwMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6
DQo+ID4ga2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzUuNC5iYg0KPiA+IGluZGV4IDhlMGY3
YWUyMTcuLmE5OGE2NDExMGEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
aW51eC9saW51eC15b2N0by1ydF81LjQuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMta2VybmVs
L2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzUuNC5iYg0KPiA+IEBAIC0xMSwxMyArMTEsMTMgQEAgcHl0
aG9uICgpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIGJiLnBhcnNlLlNraXBSZWNpcGUo
IlNldA0KPiA+IFBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5lbCB0byBsaW51eC15b2N0
by1ydCB0byBlbmFibGUgaXQiKQ0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gLVNSQ1JFVl9tYWNoaW5l
ID89ICIzZWMxMGQ4ODBlMzhlYjU4YWYzOWMzMzA5NGU0NTVkYTU5YWZkNDJiIg0KPiA+IC1TUkNS
RVZfbWV0YSA/PSAiYjA5NTExYWQ2ZGJiNmYzODMwM2FkZDQ4ZDJkYTc4OTA2YmFiMTM4MCINCj4g
PiArU1JDUkVWX21hY2hpbmUgPz0gIjg0NzJlZDM0MmUwYWMzZjUyOWMxMGI0NzRiMTJlZjBlMDU5
OTU3NzgiDQo+ID4gK1NSQ1JFVl9tZXRhID89ICI1YzkxMjk2OGYyY2I5MzhhZDA4NGQ0NTdkYWU5
OWJmOGViMTYwMzJkIg0KPiANCj4gVGhpcyBydCBrZXJuZWwgdXBkYXRlIGlzIGdpdmluZyBlcnJv
cnM6DQo+IA0KPiAwOToxNzowMcKgIHwgL2J1aWxkL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVk
L2ludGVsLXNreWxha2UtDQo+IDY0L2tlcm5lbC0NCj4gc291cmNlL2tlcm5lbC90aW1lL3RpY2st
c2NoZWQuYzogSW4gZnVuY3Rpb24NCj4gJ3RpY2tfZG9fdXBkYXRlX2ppZmZpZXM2NCc6DQo+IDA5
OjE3OjAxwqAgfCAvYnVpbGQvcG9reS9idWlsZC90bXAvd29yay1zaGFyZWQvaW50ZWwtc2t5bGFr
ZS0NCj4gNjQva2VybmVsLQ0KPiBzb3VyY2Uva2VybmVsL3RpbWUvdGljay1zY2hlZC5jOjkwOjE1
OiBlcnJvcjogJ3RpY2tfcGVyaW9kJw0KPiB1bmRlY2xhcmVkDQo+IChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAndGFza19wcmlvJz8NCj4gMDk6MTc6MDHCoCB8wqDC
oMKgIDkwIHzCoCBpZiAoZGVsdGEgPj0gdGlja19wZXJpb2QpIHsNCj4gMDk6MTc6MDHCoCB8wqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+DQo+IDA5
OjE3OjAxwqAgfMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXNr
X3ByaW8NCj4gDQoNClNvcnJ5LCBub3QgdGhpcyBvbmUgYnV0IHRoZSBvbmUgdGhhdCBpcyBsYXRl
c3QgaW4gZHVuZmVsbDogdjUuNC4yNDMuIEkNCmhhdmUgbm90IHRlc3RlZCB0aGlzLg0KDQpUaGFu
a3MsDQoNCkFudWoNCg==

