Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D9FC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 01:12:00 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.2976.1632877919292669575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 18:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=qSoc3ikI;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="222944383"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200";
   d="scan'208";a="222944383"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 18:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200";
   d="scan'208";a="562789235"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2021 18:11:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 18:11:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 18:11:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 18:11:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 18:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNvgll60QaC3Rd9WcnQHMli0HGNtxw8jDfqi0xxk2cMhga2O5xv/V//3fGK7DMgErcnXZRwZufbZUzPYIbNZG2Tv+S6DOGG81U5MhA9qDRfq7wh3Hb5cSGhCdGZkIBKJuni4Dfd6vCJ85/2+nJgdNOSstPKx1Ge4LgeqNehY4Bz5N0/gwxwYjbNPjGzgnZPNEe+0rL/Y6YwYtuZSzV9XWZCXo+OTFaQmAV4VW86Kq6E64biVsACJHw7Zr2BR8780d5ilnmW75pnTYVMVQiz8WBjSNTsZaneUNjCTI27JSSj/TeOQfUTtEdaC7mCyFeYmXk6jl4mdkCsICLUKkatWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iLIEVSLXZ44nEnUUGDh7i5U7b9kEf2Co8/kjIcM+a/U=;
 b=H7QMc+JLcgrENBkn9XNw41mDxTx/1+VwLhV03mNSPe+JfGPjl3AjZH5k7xwSFhHS2vXalnGE1U4QJlS1dV3zAbK2tB+x05DV8qEova/6mNIm01W51JiGPBrH9lglkOH4ff+rlIRiuWK50QYhbiIAtNknZbOujhgwOr6n0IhzNTH9GUEcpdGCMSNlsYmRpt5bkaYgMN0fGm1oEtXQnalHW31ravkgFDJuXEyyvsVhyGEv7FflyVuXE9DAwLP/xpsRaHA1HbEQOhC9DWb+UGAku/bHBnRUfHF3Gt7QxSShoW3vWjAoEOcaNXXBS41fnSy5hmG2jqvVSN60kD0NBiL8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLIEVSLXZ44nEnUUGDh7i5U7b9kEf2Co8/kjIcM+a/U=;
 b=qSoc3ikILxbGr5V1K0Qe6CT2Fce25vNY/KSv/kXQs3gv7/iZQ66e92EuGCk1d+jJZMI0W16W6EmSWVGlUcUZgSlab+uve/+EF6fKAvVdho6+nBKkrQO+rMePJOXRG/mO+SYv65qlr1VPN0laY5CCGnNZNM6LHpAq3rbcp6k6be0=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4387.namprd11.prod.outlook.com (2603:10b6:a03:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Wed, 29 Sep
 2021 01:11:55 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 01:11:55 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
Thread-Topic: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
Thread-Index: 
 AQHXWSIeAnGyGYZUsU61tI39mJYnxqsFiJfA//9++YCAAApTAIAAN0KAgAA+UgCAAVrjgIAP58EAgKQhmwA=
Date: Wed, 29 Sep 2021 01:11:55 +0000
Message-ID: <ae52185ed604614ff00bee7606b704e6c065107f.camel@intel.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
	 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
	 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
	 <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
	 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
	 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
	 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
	 <1c55d1aca45e746034b791b2f1712e8f335b502c.camel@linuxfoundation.org>
In-Reply-To: 
 <1c55d1aca45e746034b791b2f1712e8f335b502c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc128f64-3932-4896-cc61-08d982e620d0
x-ms-traffictypediagnostic: BY5PR11MB4387:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4387BD27B3B469F5AB675011F8A99@BY5PR11MB4387.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q5Adq4HOTvFW/FPzzAW4k6n6F+/zqiTQLk7lzsmcZcFXKY0KqU6ZcUxyh+lcExmpLBzyumcEkbrH91Vsbjb8vxH2cGQOA1Ap2NGCuFTd1Yox9HlMLwFkQaRWHbt1aMFnAu3LJfkOapCBfHKQqhcZlBHcfdfqDdQnKV9pqIVriNEw7XyLrwpJkgY6UZtGM98TJG81hNU1l8lRnOMgN1fKM0xLeKUSCebV/g+hVFFqYq3Ep0wxRioZ62sRMpFsHBKZtxBdSftcxlxWOID9GkRUgWijsYQzvXwg6PA1LlmHafrzsa4kcpJxsn14Xq6cocDrIu4Fx01N6tkiHIT4oRRxR4gbt6dptLrNQMIzvqfU4V8Kx/sbvPEuCLLZfN7GAvRh66ka5dBQzpvv0OyJMRWqkfrSVixmZgJucJMvLQeHXEyFb8ksx7McC7+bv1xXleWPGCgtdsQML6ZHpYEk7oTPZSrrMwvMMDkx1coq2K1vrZu2ahX8FQF3U3o0hbcpNI8gjIajezkaoGctEmIeUR1GACYNtXZe48hDvqFR4EEmwR7kcoxKDg9973pDBql5I7NyD8c3wvezx7YC8boHQr8IRwc2NqvEARL5keeMYuUqqcorBQWOweftcIUDnAgmIoiDEHV2vTEE55bG0NFom0yG24RKdsq+2hVQh+4cGIOBzPkBC6kMmBwqbt9vhbHzfAaYhw3hwAZJdzCi6IEVdQKBAd4QrumRR62p5KM8w1IJlbRQf076rPir/vswA5Zywdd2Y62ve6tN+dBch2K0j84vKrLTsTqpRpkEJsyvk0pjUgDE0hGl1t1qruk90y4mwaq+0jc/lgm/nRwIK2Zglmvypw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(38100700002)(966005)(76116006)(38070700005)(122000001)(64756008)(66476007)(66446008)(66556008)(508600001)(6512007)(8936002)(8676002)(15650500001)(4326008)(91956017)(6486002)(66946007)(6506007)(26005)(5660300002)(71200400001)(316002)(186003)(2906002)(86362001)(110136005)(36756003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VSthVkV3c1VXWE10Y3hNUm1RQ00zZElFWWg3YXQ1S0p4S3JYOWdXL1hOYU8z?=
 =?utf-8?B?bUNQZEMwWXd5K1FSVGtGaXZVa1AyY01YMlJCaGZ3bTMwMVRqcWY4TlR3SW9J?=
 =?utf-8?B?ZW1oUDJzLzhJTTg3b2d2Nkt1K3YwOVhnajJWTzBGV3luWUxMdXBkMDFrZUxh?=
 =?utf-8?B?V0tKRXFPTTFKNEptVlFvRTVWUStHenhmUWo5MXh5WmU5SmtHWGljenlGdGJB?=
 =?utf-8?B?RS9tdzZFalY2Sm9oQ0lySzVBbm9mM3Q5ZUc2bDYrRHEvTzMyczBqY0kvYjNP?=
 =?utf-8?B?Wm1xWjlKMXJqRCswcDAwZm1tVG9LZzJFSnJRRjBEb1RxRjdIQlNXdVEwZXk0?=
 =?utf-8?B?Nm5DUWZ0eFNFLzc4aFpkWFZkdStYNVB5VkZvc3BHUHJMVC9haWJ0MFpnK1cz?=
 =?utf-8?B?cDFNNEpRWXRtQUExcTA3Q2VMQWg0V0FtWE1tM2RkNUJCS3E1M0RxODcyWjZJ?=
 =?utf-8?B?MmRlNWFnT2twbExNNVRLc3R6eUNaV3JiRk1IeHY2cHVkNStXd1RRVmRzNWhX?=
 =?utf-8?B?ZjZia3hjV3BiTG9uSnNXbGIzdnVtR2lPOGhNY0JzV2IyQmJ6dDBCeWx0a25s?=
 =?utf-8?B?MjVPaldLSENvVy8wOTRpMi9rTDk3d1FiMGQzNXBzaXRwaFVEaEptL2R3SUhs?=
 =?utf-8?B?MVUvSWNJUDhQNmtGeGlIRXh0ajRpVm5QZVAyVlh3eEhFekZLSXBiNFVRUVJU?=
 =?utf-8?B?V3RIQ0I3Q1Rsb0xiZytVUk12dXRidkFnbnBMUW96cjBpczdXVTVMcjlsUlpz?=
 =?utf-8?B?QkI3N25HSGhPNndnWFozSzgzK1ZtanZNOXpQUzRxUjBqWFJQWmFCNG1NRXBJ?=
 =?utf-8?B?RTdlRWVQamhhbzB1NDU0a0hLdVRWK0JWeDdEcUxRT1VTaWtHYWIycFkxWk5I?=
 =?utf-8?B?OUtjUkJVMnhMZVZIRE5YOXNZUnpHZTJueEZIWWQwOTZaNis2Sk9HU3FhOFho?=
 =?utf-8?B?bkFvbUtRYUNUM1JqVVRuVlBYWEV4cjdPOWI1UmZwdWhDY2hicDZ3QnZjOXdk?=
 =?utf-8?B?Y0NzNXlrMGtST3lMcnMwS3d2T1FrSTNMNGp4cGlacHRPVVg5VFRaWE9TYnNv?=
 =?utf-8?B?MXZmQy8xWmdFc0hHWmgrMWhKTlk5eE9ybDlKd25oUExkYWdydGFCU1VGNlg3?=
 =?utf-8?B?NFpqdGwzV1d0RGJ4b3VTMmkveHJNd2loRWRXbW1xWGdMMW1Dd0VlTm1aRFQz?=
 =?utf-8?B?MWdGQWRXVE1acFIyNkVWMWhIcnZkMzUrZVMzemw2VTFWYlYvanFreTZiejZH?=
 =?utf-8?B?aXRsUmF3VVlTdHhHSm1mVHlDNHhHYU9nTGhVME9xSld6K3FySnNDUSswL21h?=
 =?utf-8?B?Y3Yzb1pPZGY3REV5MEZUVGxZOXZsd1YvcktnTk9zcUJKcmpvQVM5ZUx4c1E4?=
 =?utf-8?B?amVYK1lCRmxMNVNpSkd4QTZpdE9CZmVpaUVwTHgvQnJwS0wvN1JRTzNsQmhk?=
 =?utf-8?B?aHhnR3luQW03TytIZDcwMUlJSThZeUhIWFFhYVJycmpyRmFQeHFWa25adVI4?=
 =?utf-8?B?R2pMb2NqYjYrS2hsS0J4QTcwQUx0WkJUYlpvSWdIbE1CQUhSSFc4THNwQU1x?=
 =?utf-8?B?Nkx3K2tianB4bzRIV25vMkNzOCthVFpoV1RyeDJtT3hycnFvNWpuTDNGbzdy?=
 =?utf-8?B?MHl6NDZOV0g0aFNaTjkvT29nOWVDUEJkTHhRc1pqczJOVTZpT2wycXp4Njlr?=
 =?utf-8?B?eG9zNWlENzcyR04zZG1TbW1RTnJiMW5hZXdhMlF4TDhKWENPUk10TXJtV1lG?=
 =?utf-8?B?NUhQU3ZOTGNzUHJ5SEFjN0JYVUk4Ri81bjVOOFhSNGhLTFgyTnFxeC9WcEox?=
 =?utf-8?B?eXR6UUY5MWE5OVU2VWtQQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <555A31D51343C54F9E716D272B26E65F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc128f64-3932-4896-cc61-08d982e620d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 01:11:55.3144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pfIE50CTpPkFdL5UgigX+DGwk3KGEaycIMq1+CjF+WPI2jb/x0+0NI4OkCBV9exzb1lnxc+J5fgQ8t4OkPxlAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4387
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 01:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156435

RGlkIHdlIGZpbmQgb3V0IHRoZSByZWFzb24gd2h5IHRoaXMgd2FzIGhhcHBlbmluZz8gSSBoYXZl
IHN0YXJ0ZWQNCmdldHRpbmcgdGhpcyBlcnJvciBvbiBDZW50b3MtOCB3aGlsZSBidWlsZGluZyBo
YXJka25vdHQuDQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29u
LyMvYnVpbGRlcnMvNjMvYnVpbGRzLzQwNDUNCg0KVGhhbmtzLA0KDQpBbnVqDQoNCk9uIFdlZCwg
MjAyMS0wNi0xNiBhdCAyMzo0NSArMDEwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIFN1
biwgMjAyMS0wNi0wNiBhdCAyMTo1MSArMDIwMCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+
ID4gT24gU3VuLCA2IEp1biAyMDIxIGF0IDAxOjEwLCBSaWNoYXJkIFB1cmRpZQ0KPiA+IDxyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPiA+IEkgdHJpZWQgYWdh
aW4gd2l0aCB0aGUgYXV0b2J1aWxkZXIsIHN0aWxsIGZhaWxzOg0KPiA+ID4gDQo+ID4gPiBodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzQ4L2J1
aWxkcy8zNTE2DQo+ID4gPiANCj4gPiA+IHNvIHdoYXRldmVyIGl0IGlzLCBpdCBpcyBzdGlsbCAi
bGl2ZSIuDQo+ID4gPiANCj4gPiANCj4gPiANCj4gPiBJIGRpZCBzb21lIGRpZ2dpbmcuIFRoZSBp
c3N1ZSBoYXBwZW5zIHdoZW46DQo+ID4gLSBob3N0IGlzIGNlbnRvczgNCj4gPiAtIFNES01BQ0hJ
TkUgaXMgaTY4NiAoZS5nLiBjbWFrZSBpcyAzMiBiaXQpDQo+ID4gDQo+ID4gVGhlbiB0aGVyZSdz
IGEgZmFpbGluZyBzeXNjYWxsIGF0dGVtcHRpbmcgdG8gc2V0IGZpbGUgdGltZXM6DQo+ID4gdXRp
bWVuc2F0X3RpbWU2NChBVF9GRENXRCwgIi4uL2luc3RhbGwvdXNyL2xvY2FsL2xpYi9jbWFrZS9h
c3NpbXAtDQo+ID4gNC4xL2Fzc2ltcC1jb25maWcuY21ha2UiLA0KPiA+IFt7dHZfc2VjPTE2MjI5
NjY3MjMsIHR2X25zZWM9NjMxOTQzOTAyNjE5MzQzMjU3Nn0sDQo+ID4ge3R2X3NlYz0xNjIyOTY2
NTc5LCB0dl9uc2VjPTE3ODQwMDUzNjkyMzA5NDM4NDY0fV0sIDApID0gLTENCj4gPiBFSU5WQUwg
KEludmFsaWQgYXJndW1lbnQpDQo+ID4gDQo+ID4gT24gbGF0ZXN0IEZlZG9yYSwgdGhlcmUncyBu
byBpc3N1ZToNCj4gPiB1dGltZW5zYXRfdGltZTY0KEFUX0ZEQ1dELCAiLi4vaW5zdGFsbDIvdXNy
L2xvY2FsL2xpYi9jbWFrZS9hc3NpbXAtDQo+ID4gNC4xL2Fzc2ltcC1jb25maWcuY21ha2UiLA0K
PiA+IFt7dHZfc2VjPTE2MjMwMDI4ODYsIHR2X25zZWM9NjM2OTcyNDc3ODE3MjkwNzUyMH0sDQo+
ID4ge3R2X3NlYz0xNjIzMDAyODg2LCB0dl9uc2VjPTE3ODM5MTc0MDgzMDA3MjE3NjY0fV0sIDAp
ID0gMA0KPiA+IA0KPiA+IHV0aW1lbnNhdF90aW1lNjQgb25seSBhcHBlYXJlZCB3aXRoIDUuMSBr
ZXJuZWxzLCBob3dldmVyLCA0LjE4IHNob3VsZA0KPiA+IGJlIHJldHVybmluZyBFTk9TWVMgaW4g
dGhhdCBjYXNlDQo+ID4gcHJvYmFibHk/DQo+IA0KPiBJIGhhY2tlZCB1cCBhIHF1aWNrIHRlc3Qg
Yml0IG9mIGNvZGUgKHdoaWNoIG1ha2VzIGFzc3VtcHRpb25zwqANCj4gYWJvdXQgMzIgYml0KToN
Cj4gDQo+ICNpbmNsdWRlIDx1bmlzdGQuaD4NCj4gI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+DQo+
ICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4NCj4gI2luY2x1ZGUgPHN5cy9zdGF0Lmg+DQo+ICNpbmNs
dWRlIDxmY250bC5oPg0KPiAjaW5jbHVkZSA8c3RkaW8uaD4NCj4gDQo+IHN0cnVjdCB0aW1lc3Bl
YzY0IHsNCj4gwqDCoMKgIGxvbmcgbG9uZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqB0dl9zZWM7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIHNlY29uZHMgKi8NCj4gwqDCoMKgIGxv
bmcgbG9uZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqB0dl9uc2VjO8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyogbmFub3NlY29uZHMgKi8NCj4gfTsNCj4gDQo+IGludCBtYWluKCkgew0K
PiDCoCBpbnQgZmQgPSBvcGVuKCJmb28iLCBPX1JEV1IgfCBPX0NSRUFULCAwNjQ0KTsNCj4gwqAg
d3JpdGUoZmQsICJmb28iLCAzKTsNCj4gwqAgc3RydWN0IHRpbWVzcGVjNjQgdGltZXNbMl0gPSB7
fTsNCj4gwqAgdGltZXNbMF0udHZfc2VjID0gMTYyMjk2NjcyMzsNCj4gwqAgdGltZXNbMF0udHZf
bnNlYyA9IDYzMTk0MzsNCj4gwqAgdGltZXNbMV0udHZfc2VjID0gMTYyMjk2NjU3OTsNCj4gwqAg
dGltZXNbMV0udHZfbnNlYyA9IDE3ODQwMDsNCj4gwqAgaW50IHJjID0gc3lzY2FsbChTWVNfdXRp
bWVuc2F0X3RpbWU2NCwgZmQsIE5VTEwsICZ0aW1lc1swXSwgMCk7DQo+IMKgIHByaW50ZigicmM9
JWRcbiIsIHJjKTsNCj4gwqAgY2xvc2UoZmQpOw0KPiDCoCByZXR1cm4gcmM7DQo+IH0NCj4gDQo+
IGJ1aWx0IHdpdGggImdjYyAtbTMyIHRlc3Qtc3lzY2FsbC5jIC1vIHRlc3QiIGFuZCBydW4gd2l0
aCAic3RyYWNlDQo+IC4vdGVzdCIuDQo+IFRoaXMgd29ya3Mgb24gYWxsIHRoZSBzeXN0ZW1zIEkg
dHJpZWQgaXQgaW4uIEFzIGRvZXM6DQo+IA0KPiANCj4gwqAgdGltZXNbMF0udHZfc2VjID0gMTsN
Cj4gwqAgdGltZXNbMF0udHZfbnNlYyA9IDI7DQo+IMKgIHRpbWVzWzFdLnR2X3NlYyA9IDM7DQo+
IMKgIHRpbWVzWzFdLnR2X25zZWMgPSA0Ow0KPiANCj4gaG93ZXZlciBpZiB5b3Ugc2V0IChhbmQg
aWdub3JlIHRoZSBjb21waWxlciB3YXJuaW5nKToNCj4gDQo+IMKgIHRpbWVzWzBdLnR2X3NlYyA9
IDE2MjI5NjY3MjM7DQo+IMKgIHRpbWVzWzBdLnR2X25zZWMgPSA2MzE5NDM5MDI2MTkzNDMyNTc2
Ow0KPiDCoCB0aW1lc1sxXS50dl9zZWMgPSAxNjIyOTY2NTc5Ow0KPiDCoCB0aW1lc1sxXS50dl9u
c2VjID0gMTc4NDAwNTM2OTIzMDk0Mzg0NjQ7DQo+IA0KPiB0aGVuIHlvdSBzZWUgRUlOVkFMIG9u
IHRoZSBjZW50b3Mgc3lzdGVtIGJ1dCBub3Qgb24gbXkgdWJ1bnR1IG9uZS4gSXQNCj4gd2lsbA0K
PiBkbyB0aGF0IHVudGlsIHlvdSByZWR1Y2UgdGhlIHZhbHVlcyBvZiB0dl9uc2VjIHJpZ2h0IG5v
dy4gU28gaXQgc2VlbXMNCj4gbW9zdMKgDQo+IHN5c3RlbXMgYWNjZXB0IGxhcmdlIHR2X25zZWMg
dmFsdWVzIGJ1dCB0aGUgQ2VudG9zIG9uZSBkb2VzIG5vdC4NCj4gDQo+IEkgdGhpbmsgdHZfbnNl
YyBtYXkgYmUgYmVpbmcgY2xhbXBlZCB0byBMT05HX01BWCBvZiA0IGJ5dGVzIGJ1dCBzaG91bGQN
Cj4gYmXCoA0KPiBhIExPTkdfTE9OR19NQVggb2YgOCBieXRlcyBvbiBhIDMyIGJpdCBzaW5jZSB0
aGUgZmllbGQgaXMgYSA2NCBiaXQNCj4gbG9uZy4NCj4gDQo+IE1pY2hhZWw6IEhvcGVmdWxseSB0
aGF0IGdpdmVzIHlvdSBzb21ldGhpbmcgdG8gcmFpc2Ugd2l0aCB0aGVtPw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTMwNDYpOg0KPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE1MzA0Ng0KPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC84MzMwNDcw
My8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgW2FudWoubWl0dGFsQGludGVsLmNv
bQ0KPiBdDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

