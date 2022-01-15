Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D402FC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:53:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.3014.1642215193049268341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=QlzhOs4F;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642215193; x=1673751193;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+TRLzDWmbRUG9FMtcThOY1o0GYoQ+YWam1xnJuo5wg4=;
  b=QlzhOs4FTudRWp2d8AAqdglGkMb94gxkgY1uveu1pZWVYjk7mV6HM65c
   0yR94qgFgQs1pYI8nojGir84sa0wYa/WNtH/C+3ZXvxGAZkb3NGRbqImD
   Tr/jZCQ+klCym8n3Za6Y6d6nUwdBgiJI9r7jKonLMUJBkOJnQP2OOcTrl
   cT17Dy6idlNhJ6AUQZeOUaC6A7Rl5Z03JPOFL85AhHxM6eLrNoJ1SMbiV
   dbP+uT7Pi0Um5oq8xJ+qx5sHQmabQsqaIbN2aU/rEB+9RFUYdULCEjiVo
   v0n0TS53rp/FLgXCDYt8nBUBfhm8qfpkcAJtZMBZNf55qNZ3vqX/VgZT3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="268740395"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600";
   d="scan'208";a="268740395"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 18:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600";
   d="scan'208";a="763784283"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2022 18:53:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 18:53:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 18:53:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 18:53:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 14 Jan 2022 18:53:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA7fQC5OL9zgzy5jNeuMa/8UkXBmWhgpzKBSGswZwUGFOLgXeX/IxNIUm+TZSAdpB3WlNA169P7XaNZihzby1gAxxrw4QIzJLrSDGD2OZUmOsfgNUAr/G/wrd20Puf2dZ3NpqmL+MepE6hYVeafW+d4N2XLWN0OvL7xUgqTnIZxtccZrIbwM1FEMOWqhbdbmUtajSHNfGuTLPkx9XFJx+TMSpo0tdaYWhUnOmLj87AyxqJc6gHgJiqrENGdC8rLQHfnDWIN1e88Y4TbTVDo8xX96YjRa98zJjsag74KF6bZhfpg+0wliYG9Eio3DXJ0C9xPyA1xQAbHnnILZALZaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TRLzDWmbRUG9FMtcThOY1o0GYoQ+YWam1xnJuo5wg4=;
 b=UJ0mgu12kYIgcIj3brhCfdv9HQFT0HZM5El6PIO8a7PddKTNj9yjNMjL6PKz1ls9DC3yVGxQ3pv1PkAcf5Njza9x1oFWDAVmHbY6jvLDlfSWb8NDY2wB0JxbU88zD95y6p2jCp90DAbQ5B+f5LmPUlsDEUyXLCILWGeoobddqrz3BlpJ1jzQTt3XFWXpGahwau8pohBBbxI2Y/u8xN+5JX6XtKqzOnL0n0g3dg1ABgEVZJbGbB1gJq9Hk8fAdxLNfFCoXFvTiCPdpSjyZQanFzhxFK4CXFxxdbWHkzyRwvKb5jDeQPv5ksQjSETNxwyGzNpwf3sYDhqW7aC9loV6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by MWHPR1101MB2141.namprd11.prod.outlook.com (2603:10b6:301:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 15 Jan
 2022 02:53:09 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 02:53:09 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "kexin.hao@windriver.com" <kexin.hao@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
CC: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Subject: Re: [hardknott 1/2] tune-cortexa72: remove crypto for the default
 cortex-a72
Thread-Topic: [hardknott 1/2] tune-cortexa72: remove crypto for the default
 cortex-a72
Thread-Index: AQHYCbldEGgac+k4a0WQEQqywg+O56xjYpoA
Date: Sat, 15 Jan 2022 02:53:09 +0000
Message-ID: <0062bdc2f2df9661d30b142d00eae710a9afbee1.camel@intel.com>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
	 <20220115023747.1154635-2-kexin.hao@windriver.com>
In-Reply-To: <20220115023747.1154635-2-kexin.hao@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 719a5d23-2f35-49cc-01a9-08d9d7d22a0e
x-ms-traffictypediagnostic: MWHPR1101MB2141:EE_
x-microsoft-antispam-prvs: 
 <MWHPR1101MB2141B62F8325ACE602374D0FF8559@MWHPR1101MB2141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vIrEkSuCCEZVa1TLjZoZxyzF2for53UGc67hM9v02d0vd4ygUVg4hY9+usfk6/agMB3gJ8VHwRLMfAyr9oFosvDIYjrdZ4MrORTV3qSUXS4VoKUktxPaUmL1wpX7xu6OLSFEKNGYhGyP6qKWxAvFiMtwcdt/uoOAFaslK+lszfEEMB2H7eXGdE9ApmOyaTNMkf7/KG9jBEs4ej+9vwca3VKBk3NBdsbP6RxRSubMLXXHuqkTNyWdEZcMQYKTiXw/S53alSOuofAbbkAy0ZvlQcL6oqXdaPqO6Irv3NJJhEaMzF4by+q9fiK5xjFQ2RQvTHsqD8bFjSQYeX7jP79JGgdCMCTlo0gfPbGXYLpSUy7bPdL8IH1lSpsyLLzHXviv+BUa8cVVZ91qDNn8P/ySZ8dQpuAOoJU7jbp8vD8Kr1exXdIl/4aF1dV0+SI778jboulQH4FoRHf+tfsWRPazeB018ugkkjghveJOwJlbezqnh6FD9Vs4QUlufd74MComltLLBGTIrKYpCaSNOfyr5tWHGOxFuNeU6h48ChC3a0bZ72PXXID6zuk6lMp6Fdb4xEb3xJgyq+wntduZ5KCPlVJBJ8/XXVhxWVCmbuTqGPLqcEpGSFKJ7jaQowzQre2s/Rv/3tTfsR25ci/OmuocFRiQQWEKlYtVEBkn9DLlSqrQ8yFnMCaLtUwIRiC+8+czi8G3OW77+SnJch87AylbAg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(64756008)(316002)(186003)(8676002)(76116006)(508600001)(6506007)(26005)(66946007)(38070700005)(36756003)(38100700002)(2616005)(66476007)(82960400001)(6512007)(8936002)(83380400001)(122000001)(91956017)(110136005)(6486002)(66556008)(2906002)(86362001)(66446008)(5660300002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXNpYmlZazVZaEN3Z0dvUHo2WUJadUdsQUhrV0JBVk5Ea1dGaG5GMVpnS1Fv?=
 =?utf-8?B?d3EyNU1LS1pVV2c2YXV2U1NkcmxwdU8zTFFCYkhnYmg4RE54bzBITDV4UU45?=
 =?utf-8?B?S0xIdzBGKzJzekhhT2NGemMwd2Mwa1JtQ09pUDRrWTV3Yk14SHJaUzBRS0JC?=
 =?utf-8?B?NjYvYlJwWlZFY1N1eUlxWGkxRXQ0QzBXRC9yK1dMME9yYkZQeG0zOVVBZWFS?=
 =?utf-8?B?Z3d1d1d4UDRHOHVZaTFUZ21xNWNKRGRiNUxYRjV1Q1Fackp1L2hPNWlRcHZn?=
 =?utf-8?B?NzhDSEZBY3dMSzlablFnZDBNcFZPbENlSjFFSkNvMjJGR2tZV0QzL0dnR3d5?=
 =?utf-8?B?WnhJZGk1UjA3S09ta2pkREpwMWYzblpWT2FLeHBaVTE3ZDhtK1h2S1Z6NGNz?=
 =?utf-8?B?dlNNWFB5bEdFMHl6SS9GaTJGYmdrQzBra29NSjZUMzVWc21MYWo1akM0TmFr?=
 =?utf-8?B?aWRUd3FHZ1UvbzkzNFpHUVhmaUtNTEJFeWxVZDFJektFWlZCdUVwVkpwUUtm?=
 =?utf-8?B?WHFiVW5LQ2NoTkV6c1Q3aTY0SldXaERwWHVSc0prZno4NFBGbEFTSXFGWUFl?=
 =?utf-8?B?K1EvTDVDOW1ERGhLWjZSd2J2NzRHTndvS0ZUU2hiOWFOT2tvU1MyRnlILysz?=
 =?utf-8?B?RWRUemZpdWYza0VMVjh1bDliNlJWSU5CZ0l6MHIwVjVQZWZYeE8yYkZlL05z?=
 =?utf-8?B?Z1l6cDJ5eXdCSk9xMlBRbHJNNkRXSzJtYk1NUklSNU9xcW1wdWdIaklJVGcy?=
 =?utf-8?B?TVhtRlo3d3MyWUcxYzdJRXZRSzc1ZXRSV3BvQTlQSW1DRkxWTkhRY2hKQkNj?=
 =?utf-8?B?bjFlWkxZdEp6aDRlZzhvbUVKcEhZdjNTVXRiS0E4SURTbVprZGJnRzJNdXUv?=
 =?utf-8?B?MEhkbEE1VmNCemQwNFZvUVVKQ2V3cmFiNTZVMzFsRlhxMzBJMzZHaCtsS0tH?=
 =?utf-8?B?aEVwU0lxcGZxNTNNWWdjcWczdjJxMVZyZDUvTmJaTXJSYlp1RVFEQmJHVjA4?=
 =?utf-8?B?dlFmNXUydWlsMnRJT2c0R040N0dHTWdjY3FqSXYvNlZPampueWxoQUxUR3pu?=
 =?utf-8?B?Q1hNUjZ2dVdaVUg2TFpLKzNoTlMxdVJQVm5mZXFCWHN1RkVRV1VnS2p2a3Zv?=
 =?utf-8?B?bHQvMk5GVXg2UERLdVNUT3R2NUp1RzZnL1FkSHAzQjdqTm9pYkRZMzBDUzE4?=
 =?utf-8?B?TlFtbThldEJaS2lRS1I4RWpzQU9NSGVHa09yTXJ1QTcwQVd1YitQQ0w1Vzhw?=
 =?utf-8?B?d2RUaTBKOGFLSWhnVXE1UFB4Z09nWE5lWmdhYTd2Y25kVklVQTZJY1REU2hy?=
 =?utf-8?B?SEVIN3ptdkMvUlovZUZLTWhKNjNreEVRU29lcG96QXA5NWRmN2hiMkFGeXV4?=
 =?utf-8?B?dU1vR0t4a3Btc2pkQzNQb0RvR0RLSlljakVGRnB0VFR6QTVJTTlLcVUrTk1k?=
 =?utf-8?B?cGM1WG9JTHhtczJzMlNCbWsyUHVCUllIc3JMWS92dHdsZ3NNR1EyeVdIdEc1?=
 =?utf-8?B?eXExTy80Q2xsbjd2c2dXVy9XWExVbmFOUkhWZlkyZkFYZUF0TWJuRTBYSC82?=
 =?utf-8?B?eGRZUGcxcWNEeUMrejBia1phTUovRlpoT1U5dWNTWUNKbUE1cmUwQmdTVnhy?=
 =?utf-8?B?YmdkOWFuQ0h0Tml3WC9vZnltK0dOZ3QwUU9oYzZSZy81SkxLWW43VWtlRU9q?=
 =?utf-8?B?dXk0Q2RtK1Z5OUxoOXMrLzhtcW52cEEyazZxVlJpTmk1ZUNBNUQ1eXg4Mzc5?=
 =?utf-8?B?eVF4RXlMcEt4K1RzZGFPdytobFFWWXd6VHY2ZXROMWM4bmVEVTNlTk5CeU0w?=
 =?utf-8?B?bHNaUGtuV1RoREdPV0gvck1jM21leGlmL1Jld0R3MUdzK2NqdWtLYUgzVk52?=
 =?utf-8?B?MEZ1aHNOT1dlME1iNklpWHgyK1ZxSXhoZlZNWGRnREk4Q2FvOXJRRmUyVVZw?=
 =?utf-8?B?SDUxdVBVZ0E1c0ZtWWtablAvdHF2dnQ4Z2oxQmJHa2UxUzE4NHBqLzZEL1ow?=
 =?utf-8?B?dmI5YjhoSFYrdDRON1NFV2FwMXNiRk56M2k5WnM3WnJrQ0ZZNWppaDRkRi81?=
 =?utf-8?B?a3k3YXpCWkNUdkwzSFo2Ri9SV2Z2bEdPYkRFWmQ3RjhIVXkwamhDZzMxSmNS?=
 =?utf-8?B?TWZWVWJXR2NBTGYvQS9jbHFoUk1Da28xWDUyVlpsWnExTGMwalpUbUNZY1gv?=
 =?utf-8?Q?Xmo8lQHtqWw3PZlqOmC8koMe60J3anwi1LWlJrnMgFWT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D84723D192F814D9875ABE07F3133AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 719a5d23-2f35-49cc-01a9-08d9d7d22a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 02:53:09.7363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 G38CKCivfApe+LznXH6kAZP58OBO6sMsnC9zNQIZDeWJxqErzw/XzCsi5vGy70VVJG3iY4bDf9kx3Snyg0cf0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2141
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:53:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160599

T24gU2F0LCAyMDIyLTAxLTE1IGF0IDEwOjM3ICswODAwLCBLZXZpbiBIYW8gd3JvdGU6DQo+IEZy
b206IEphZ2FkZWVzaCBLcmlzaG5hbmphbmFwcGEgPHdvcmtqYWdhZGVlc2hAZ21haWwuY29tPg0K
PiANCj4gVGhlIGNyeXB0b2dyYXBoaWMgdW5pdCBpcyBvcHRpb25hbCBmb3IgdGhlIENvcnRleC1B
NzIsIGJ1dCBpdCB3YXMNCj4gaW5jbHVkZWQgYnkgZGVmYXVsdCBwcmV2aW91c2x5LsKgIFRoaXMg
YnJlYWtzIGJ1aWxkaW5nIHN5c3RlbXMgdGhhdA0KPiBsYWNrIHRoaXMgZnVuY3Rpb25hbGl0eSB3
aGVuIHVzaW5nIHR1bmUtY29ydGV4YTcyLmluYy4NCj4gDQo+IFRvIGNvcnJlY3QgdGhpcywgYWRk
IGEgY3J5cHRvIGVudHJ5IGluIHRoZSB0dW5lIGZpbGUuwqAgU2luY2UgQ1JDIGlzDQo+IG9wdGlv
bmFsIGZvciBBUk12OC4wLCBkbyB0aGUgc2FtZSB0aGluZyB3aGlsZSB3ZSdyZSBhdCBpdC4NCj4g
DQo+IEZvciBwbGF0Zm9ybXMgdGhhdCBoYWQgYmVlbiBoYXBwaWx5IHVzaW5nIHR1bmUtY29ydGV4
YTcyLmluYywgYQ0KPiBzbGlnaHQNCj4gZGVncmFkYXRpb24gb2YgcGVyZm9ybWFuY2Ugd2lsbCBv
Y2N1ciB1c2luZyB0aGUgZGVmYXVsdC7CoCBUbyBjb3JyZWN0DQo+IHRoaXMsIHNpbXBseSBhZGQ6
DQo+IERFRkFVTFRUVU5FID0gImNvcnRleGE3Mi1jcmMtY3J5cHRvIg0KPiANCg0KSSBhbSBub3Qg
dmVyeSBmYW1pbGlhciB3aXRoIEFSTSB0dW5lcyBidXQgaXQgc291bmRzIGxpa2UgeW91IGFyZQ0K
Y2hhbmdpbmcgYmVoYXZpb3VyIGZvciBwZW9wbGUgd2hvIG1pZ2h0IGFscmVhZHkgYmUgdXNpbmcg
dGhlc2UgdHVuZXMNCndpdGggdGhlc2UgdHdvIHBhdGNoZXMgLi4uIFRoYXQgbWlnaHQgbm90IGJl
IHN1aXRhYmxlIGZvciBzdGFibGUNCmJyYW5jaGVzLg0KDQpQZXJoYXBzIFJvc3MsIEpvbiBvciBv
dGhlcnMgY2FuIGNvbW1lbnQgaWYgdGhpcyBpcyBzb21ldGhpbmcgdGhhdA0Kc2hvdWxkIGJlIG1l
cmdlZCBpbiBzdGFibGUgYnJhbmNoZXMuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IChGcm9tIE9F
LUNvcmUgcmV2OiAyNTY4ZDUzNzA4N2FkYjBiNTkyYWEyNTBiZjYyOGE3YjQ4YzNhOWQzKQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFnYWRlZXNoIEtyaXNobmFuamFuYXBwYSA8d29ya2phZ2FkZWVz
aEBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvbiBNYXNvbiA8amRtYXNvbkBrdWR6dS51
cz4gKHJld29yZGluZyBjb21taXQNCj4gbWVzc2FnZSkNCj4gU2lnbmVkLW9mZi1ieTogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFtLZXZpbjog
Q29udmVydCB0byB0aGUgb2xkIHN0eWxlIG92ZXJyaWRlIHN5bnRheF0NCj4gU2lnbmVkLW9mZi1i
eTogS2V2aW4gSGFvIDxrZXhpbi5oYW9Ad2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWNvcnRleGE3Mi5pbmMgfCAxNiArKysrKysrKysrKyst
LS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWNvcnRl
eGE3Mi5pbmMNCj4gYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUtY29ydGV4YTcyLmlu
Yw0KPiBpbmRleCBiM2Y2OGFiNmUzYmUuLjc2MDhhMjBjNDNmNCAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9jb25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWNvcnRleGE3Mi5pbmMNCj4gKysrIGIvbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWNvcnRleGE3Mi5pbmMNCj4gQEAgLTYsOCArNiwxNiBA
QCBUVU5FX0NDQVJHUyAuPQ0KPiAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMn
LCAnY29ydGV4YTcyJywgJyAtbWNwdT1jb3J0ZQ0KPiDCoHJlcXVpcmUgY29uZi9tYWNoaW5lL2lu
Y2x1ZGUvYXJtL2FyY2gtYXJtdjhhLmluYw0KPiDCoA0KPiDCoCMgTGl0dGxlIEVuZGlhbiBiYXNl
IGNvbmZpZ3MNCj4gLUFWQUlMVFVORVMgKz0gImNvcnRleGE3MiINCj4gK0FWQUlMVFVORVMgKz0g
ImNvcnRleGE3MiBjb3J0ZXhhNzItY3JjIGNvcnRleGE3Mi1jcmMtY3J5cHRvIg0KPiDCoEFSTVBL
R0FSQ0hfdHVuZS1jb3J0ZXhhNzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAiY29ydGV4YTcy
Ig0KPiAtVFVORV9GRUFUVVJFU190dW5lLWNvcnRleGE3MsKgwqDCoMKgwqDCoMKgwqDCoCA9ICIk
e1RVTkVfRkVBVFVSRVNfdHVuZS0NCj4gYXJtdjhhLWNyYy1jcnlwdG99IGNvcnRleGE3MiINCj4g
LVBBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1jb3J0ZXhhNzLCoMKgwqAgPSAiJHtQQUNLQUdFX0VY
VFJBX0FSQ0hTX3R1bmUtDQo+IGFybXY4YS1jcmMtY3J5cHRvfSBjb3J0ZXhhNzIiDQo+IC1CQVNF
X0xJQl90dW5lLWNvcnRleGE3MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAibGliNjQi
DQo+ICtBUk1QS0dBUkNIX3R1bmUtY29ydGV4YTcyLWNyY8KgwqDCoMKgwqDCoMKgwqAgPSAiY29y
dGV4YTcyIg0KPiArQVJNUEtHQVJDSF90dW5lLWNvcnRleGE3Mi1jcmMtY3J5cHRvwqAgPSAiY29y
dGV4YTcyIg0KPiArVFVORV9GRUFUVVJFU190dW5lLWNvcnRleGE3MsKgwqDCoMKgwqDCoMKgwqDC
oCA9ICIke1RVTkVfRkVBVFVSRVNfdHVuZS0NCj4gYXJtdjhhfSBjb3J0ZXhhNzIiDQo+ICtUVU5F
X0ZFQVRVUkVTX3R1bmUtY29ydGV4YTcyLWNyY8KgwqDCoMKgwqAgPSAiJHtUVU5FX0ZFQVRVUkVT
X3R1bmUtDQo+IGNvcnRleGE3Mn0gY3JjIg0KPiArVFVORV9GRUFUVVJFU190dW5lLWNvcnRleGE3
Mi1jcmMtY3J5cHRvwqDCoCA9ICIke1RVTkVfRkVBVFVSRVNfdHVuZS0NCj4gY29ydGV4YTcyfSBj
cmMgY3J5cHRvIg0KPiArUEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLWNvcnRleGE3MsKgwqDCoMKg
wqDCoMKgID0NCj4gIiR7UEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLWFybXY4fSBjb3J0ZXhhNzIi
DQo+ICtQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUtY29ydGV4YTcyLWNyY8KgwqDCoCA9DQo+ICIk
e1BBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1hcm12OGEtY3JjfSBjb3J0ZXhhNzIgY29ydGV4YTcy
LWNyYyINCj4gK1BBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1jb3J0ZXhhNzItY3JjLWNyeXB0b8Kg
wqDCoCA9DQo+ICIke1BBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1hcm12OGEtY3JjLWNyeXB0b30g
Y29ydGV4YTcyIGNvcnRleGE3Mi0NCj4gY3JjIGNvcnRleGE3Mi1jcmMtY3J5cHRvIg0KPiArQkFT
RV9MSUJfdHVuZS1jb3J0ZXhhNzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gImxpYjY0Ig0KPiAr
QkFTRV9MSUJfdHVuZS1jb3J0ZXhhNzItY3JjwqDCoMKgwqDCoMKgwqAgPSAibGliNjQiDQo+ICtC
QVNFX0xJQl90dW5lLWNvcnRleGE3Mi1jcmMtY3J5cHRvID0gImxpYjY0Ig0KDQo=

