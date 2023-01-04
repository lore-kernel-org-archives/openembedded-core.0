Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00952C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:58:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.3013.1672801133079990219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 18:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=QChuHzrO;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672801133; x=1704337133;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=+Umwdx8owjysPvSpuuHVqDZ1hvsHJYTXDjEj9A30OXo=;
  b=QChuHzrOEv8XOr7NjIWxJrIkHDEhRrFhReciQMVroaUdP5c4YteAkz1J
   zXZ2QuyP4b7pO0fQ4aynhTkOKN1BYgiUPjWcCoV/60nfSJ4D8XHWRFB6g
   0QFbQn5RNVN5yHMsyrwrhZMpLP65R1W4gyworBpsNsGKuewy+8THCQ9r3
   cDWjx+WsixIybu2QIiEc/R5eIoSGuL5uPkRt+hzucPLQs4vbGAdP9aGrt
   vbw1uGl+EX5Nhh2KIJxyLpifMO/Ak7qmt8oetmbZ8tQhRUbZdSYadPHyp
   TdAkISn126fZIhxaK8721G3Ni4wGE8aig8unziVo0AwSmO7mDmOA50mB+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="408073865"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="408073865"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 18:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762522184"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="762522184"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2023 18:58:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 18:58:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 18:58:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 3 Jan 2023 18:58:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3z1o5TkozrrswCqKSO/K1EPPJU1eNlMcXxrYBMPZEzFBgp3PE+w7koXbTh5wosx+a00MwcKysq+yYN67Zy4g6MCMpbwsZcmgyb1Z5D3B0J6DcqXlLzybCY3HfYy80HRRZnXvysHjW7X4Wu3M7bKG9m9/4blT/g6mxM0+BFkfhPrbtqReznX0UI6UxibcjUzltEiI+XUViL5FM6GYuu/lhKdhss7cFBfdr5tX04OntvL2iMyQB/W+NDuIlv+Z9HPobNKP+ES1fIGBLPUt/4CfaZCNjOKnVASB3qlC5TmqHSBJVIEcZLEwV7LAJLVnJYmbOLw1EMpPni70KkqAdVRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Umwdx8owjysPvSpuuHVqDZ1hvsHJYTXDjEj9A30OXo=;
 b=MsS6BmyAvEaPsLOT7IOaySOEvc9MRp25DUhhle7JsObNqWGQtsnkNCqCrsGM09D70i/QaRhaPnBAjNlXVdUfKuGbny9nO38FrquskavlGzuWWaDF/C1Zz/+h6Cx9qBZsRGCH6GPEeFuJqGZffjNFbYui+og/MSmR2znsLt1/J+dRKYutiGYdiZ+q3VjOcGeevBei3KHynwBUpkB+REBh31HEZ/DKU6/GuljwS2Wn+g2VuRUTlpvSmI/7loOUdzYyg5SAMf22FBuyMPKCSRN+Iusf7vOJLI5JFiDIfJv5AsJypOYpNOXBR6wIBGN/PAw2PhT7CmDVCa9NTjfTPRV8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:58:49 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::e4f7:a82d:dd09:a55d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::e4f7:a82d:dd09:a55d%5]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 02:58:49 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "shruthi.ravichandran@ni.com"
	<shruthi.ravichandran@ni.com>
Subject: Re: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a
 files to the staticdev package
Thread-Topic: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a
 files to the staticdev package
Thread-Index: AQHZH82vq9dy9KVEXk6yDNPlnbv+vK6NkVKA
Date: Wed, 4 Jan 2023 02:58:49 +0000
Message-ID: <ab73c2fdcfdf97e9074238449419e3c443af4876.camel@intel.com>
References: <172DFC4C6E297F75.13790@lists.openembedded.org>
	 <SN4PR04MB83654F02BE05C26FEF78AD05E4F49@SN4PR04MB8365.namprd04.prod.outlook.com>
In-Reply-To: <SN4PR04MB83654F02BE05C26FEF78AD05E4F49@SN4PR04MB8365.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB5213:EE_
x-ms-office365-filtering-correlation-id: 5a19b75c-268f-40b6-1523-08daedff9ab6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFpHZx06omD4QiR7ZGKp8gPMbcj780g2UNBPVMgoY4mDwLNyHU1NPTT1AEKm1nYNEfNu1IUpAeauMSEkeyOa/7hNvRoUUoiBHcC/V80pD/N2KG0BVM3W6v8R0YFi5xt2ldPDb3jQALsdghoS85gPwskcpFuZ+YYMTYqQoI371r6Cp569xrVtOqJZ2f/gH5Kn+KS1BTZmk3qOXxPLHiFVITlhDmBAocuLbRqGF8FTHEUDLKkPyhxOb5tZQv/MpfqocyJuE4+N0933mBvG0toHuGD6tRNxpC1BK3aByjC3+zkx0W/9O6lhnRbIScXUQ4ABp48zPh1/OwqpXFh3jSMZ6546iqvfRPzYX5zBI8Owhp2EWRgWa50ipR/5Wavr2480KeoT4QNEQ2Q28t1srpjpbVLFHhqlVERMcDENWoZ4kSOjmNSPkJImQKUbTtSFvsf8GVZotdDOsNQz7BNm+o2QXlKiU4N3PRZNDd9ef88BJ6Z09KxDAVJFXWauyATbQ514mjXYVD1p0/2hfcQX8XTGDQgebWBrB7wex5Vi2fSu/UHi07Z46jxOL0hVBA09DZYO5vuSGzO2J3b1/n3CPiYdhVLE/qFJa3O8Qa+uzXhuSgQiruRacOFruPeihwoq5hCzpO1NbCW1J81qQKaArMDK8nQetOGGQcvCXZ/DXydGpwzWPBK8rF1x0zWWSE464fI+hyRpIQKOhom+JSR9MZ3aqtEKOwVRhm60z8QUwO3qxdXghBJMwAUq57Kwe32A+9ZvzvKqFdkRb4Egvc3y3h0UCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(83380400001)(26005)(6512007)(53546011)(2616005)(186003)(6506007)(38070700005)(86362001)(36756003)(82960400001)(38100700002)(122000001)(478600001)(8676002)(41300700001)(66899015)(2906002)(5660300002)(8936002)(966005)(66476007)(6486002)(71200400001)(66946007)(316002)(76116006)(66556008)(64756008)(91956017)(66446008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE1MeisxWm9SSGVKUnBPL2Y5RGZyMXZkbm9VTHNnVUpCbFhNd3NvRmJ4cSsy?=
 =?utf-8?B?KzNhQkdQelJLOWxDWUFoUEZoMkluTW5aYS9zTUtQM1hmM0kzZEtmaEwzU09v?=
 =?utf-8?B?aFpyelE4T3k5bmN5OG4xMWVuS3drTzJsUnF6UWxseWpUQWhkSG9DYXFuaGZN?=
 =?utf-8?B?aVg1eFpHTVhiaVNrTy8vV3l5b1JWbUFuTis0YlU5MkRhQXlLVVpLMmd2eTF5?=
 =?utf-8?B?dDBGWkNkdTRyQ3lReU5FOTNKVDlTbmZDcU13TkFSYWdpTHdQL2RBeWFYT3Fz?=
 =?utf-8?B?ZG1hRDJrMWtQWGxnVmlib0VBZmMvMUVpbnZadHJ0MmplcS9Fb2g5VmMvWFU3?=
 =?utf-8?B?Z2ZjWjVkUDN5dHFSTHpPeEFWeEE5TTRiWEVYcXJOTGp6SkE3d0VtU3B4Y3lW?=
 =?utf-8?B?azJKT0pEZ1dLaHdnWGtWbFFEam1RYjJHVTJNY1U1TXk5K1BKTnYyYVJ3STZZ?=
 =?utf-8?B?U1Bza21SWlhLY1BDbDNpWkZFKzRXTHljMmdPck83b2FlbTJONVpmQ0FXU2Q3?=
 =?utf-8?B?TE04Tmw1M21DU1JzdXRBYXBhWXlzK2ZuSlQzaXRVeVhqV3BHOHcyN3RDcW9h?=
 =?utf-8?B?YnAxU2tzaVFwd0hQQjZjNzBRVHFDa2NQY0JxSnlVV21ZeHJldzdMR25yOENq?=
 =?utf-8?B?WTJ3TW1PeGRoR0tpL2srdXczcWVPV3JWZ1QrZ2pnNnp1ak41VDhZZVJtdFBM?=
 =?utf-8?B?eEwycVU5Unp6ak52c1VvekxObXR4d0tSYzRtL2FiL1FMSi9zeEVVeUxJMW0z?=
 =?utf-8?B?ZDV2aGNNNncwZmNYT0dpZUhUT2o5em01SkNDOTZ2cnlKbmI0S3lVMGRQRmhy?=
 =?utf-8?B?MnA3ck13NG1kVmRHYzlGTlB2dW5lc29idzc2RDVpeXQxdlVQb245Z2VXZ09B?=
 =?utf-8?B?ZGMzenN5Y25ySTVtVGdxdXN5MGJkM1ViaWpBQzZGTnJ5dHBoU2k3cmoydUFS?=
 =?utf-8?B?VWVtZjRaNnlqdHhqR0ZESEFBQTlIeG9Yd0NPNytuSis0ZjhOQTNTYTVRdkhx?=
 =?utf-8?B?ZUkzZjM0anBlQkVEVFZCeVN5elRnWjRXZVNLaEZ4bG0xU2p6Y1FONmlBM1F4?=
 =?utf-8?B?WEpmVXJKOTd2MFFaQWthRkFTR1Q3UzVoRml2WXBFNzFuaHRIQ3cyWXhianpU?=
 =?utf-8?B?UHg4Y2NTaE12ZnJqNDF6VE5CVTBWV1FqdURLcEFnVE4xM3QyTVZ6NkdaVkFU?=
 =?utf-8?B?WEhjMElCZWRPYlJOK2J4TmU5dVgvUk5CUWhrSHdTMkQ4bUhTVmVUWlRPeDJT?=
 =?utf-8?B?cjFscCtRcExvSkU0Q1Zjc2o1anRnQlllMzI2YXdHZkE2OTBsRTdEUWVMWEt3?=
 =?utf-8?B?S0Y3NDhvQ041ckNyZlZVUTduUTNScytRRGVKMU4zc2x6aDl2aVg2eW5CeDlh?=
 =?utf-8?B?YXdaTmZCWmN4bkowc2xyR0FMQi9IRHI5YS94MmdhbStuZks4SjhOcmFKbVh2?=
 =?utf-8?B?REd1OTRkMFVBTmtFSEN3YmZ0QXdPUEYvRWVFbnl5MG5VYnpDYmx6aXNBRHFB?=
 =?utf-8?B?b2FwWm5TZzh4bGlKSjNkVVJtYWxmQTQ0eUphUHcwbzBvYlRZNm03NDdoMVAx?=
 =?utf-8?B?QnB1SkNTYUxZRTlsbE96NjJ6b1RTa3VIaUhucU9mQmxjalMvZU1WRk83cS93?=
 =?utf-8?B?cXdCalZtcXFCU1RZWFVSZ1R6MFFpRGp6OGFyOENXMGtzT0tSY0RhSVFMMWlx?=
 =?utf-8?B?Y2NNVzRzRXhCQTBXRWs5eXZtanFLMTB1ZitqM0hzQ3FZWC9UaVdOTENRRXlI?=
 =?utf-8?B?Vjk2UEhpbTIvd1dlYm4xTitHUE8rdW1zYzBQWGQ3Ny8zS0FXSFJ2WU9JNHUz?=
 =?utf-8?B?eDluUWpNamtBUFJTYTA4d0MvczQ0WndTMTZ6WEphYmlZUnpobUIvc3ZVdmNs?=
 =?utf-8?B?M0hsL0xQMEVCNXNXMG0wdzZHcGZTbC83Y3NxR29yWjZpOStYR0V0UUpyc1hC?=
 =?utf-8?B?REhYYzhsc0FRU0tya1EwZktrRHQ1ZERXN211OXhxYlBEQnFZUFZJYi9HcFZR?=
 =?utf-8?B?Z3kzRFVFRGVCQkpkNVlSMWw2OWsyQUVpeWVoR1dhQUVodzVpUUtlalkrOFdQ?=
 =?utf-8?B?RVFWQ3hiKy9qdG9ienZRRWJkQ1FkZFpTTTlUT0xXcXJMWStXblJpa2ZkREl4?=
 =?utf-8?B?bC90NnJQd3Z2MnRhKzFFTHNEN3hGSnNhR0N4ZFBweWJReXZ5RjVkZDk3Rllu?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <852284827E1F324180224203ED543169@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a19b75c-268f-40b6-1523-08daedff9ab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 02:58:49.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cfvzQ8ojFNEhOGggWcJKBDNC/7+6lziNv1OZCfZOnpVYZA6O1i3LRJPP4Tugte3O/0AWoUQKAFxjckOtEIbLLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175377

T24gVHVlLCAyMDIzLTAxLTAzIGF0IDIzOjQ3ICswMDAwLCBTaHJ1dGhpIFJhdmljaGFuZHJhbiB3
cm90ZToNCj4gQnVtcC4gSSdkIGFwcHJlY2lhdGUgZmVlZGJhY2sgb24gdGhpcyBjaGFuZ2UgaWYg
YW55Lg0KDQpIYXJka25vdHQgYnJhbmNoIGlzIG5vdCBtYWludGFpbmVkIGFueSBtb3JlLiBQbGVh
c2Ugc2VlOg0KDQpodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1JlbGVhc2VzDQoN
ClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gRnJvbToNCj4gPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnwqA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gT24gQmVoYWxm
IE9mIFNocnV0aGkgUmF2aWNoYW5kcmFuDQo+ID4gU2VudDogTW9uZGF5LCBEZWNlbWJlciA1LCAy
MDIyIDExOjI3IEFNDQo+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBDYzogU2hydXRoaSBSYXZpY2hhbmRyYW4gPHNocnV0aGkucmF2aWNoYW5kcmFu
QG5pLmNvbT4NCj4gPiBTdWJqZWN0OiBbT0UtY29yZV1baGFyZGtub3R0XVtQQVRDSF0gYmludXRp
bHMtY3Jvc3MtY2FuYWRpYW46IEFkZA0KPiA+IGxpYiouYSBmaWxlcyB0byB0aGUgc3RhdGljZGV2
IHBhY2thZ2UNCj4gPiANCj4gPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgUUEgaXNzdWUgd2hl
biBidWlsZGluZyBhbiBTREsgZm9yDQo+ID4geDg2XzY0LW1pbmd3MzIgbWFjaGluZXMuDQo+ID4g
DQo+ID4gRVJST1I6IGJpbnV0aWxzLWNyb3NzLWNhbmFkaWFuLXg4Ni02NC0yLjM2LjEtcjAgZG9f
cGFja2FnZV9xYTogUUENCj4gPiBJc3N1ZTogbm9uIC1zdGF0aWNkZXYgcGFja2FnZSBjb250YWlu
cyBzdGF0aWMgLmEgbGlicmFyeTogYmludXRpbHMtDQo+ID4gY3Jvc3MtDQo+ID4gY2FuYWRpYW4t
eDg2LTY0IHBhdGggJy91c3IvbG9jYWwvb2Utc2RrLWhhcmRjb2RlZC0NCj4gPiBidWlsZHBhdGgv
c3lzcm9vdHMveDg2XzY0LXc2NC1taW5ndzMyL3Vzci9saWIveDg2XzY0LW5pbHJ0LQ0KPiA+IGxp
bnV4L2JmZC0NCj4gPiBwbHVnaW5zL2xpYmRlcC5kbGwuYScgW3N0YXRpY2Rldl0NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaHJ1dGhpIFJhdmljaGFuZHJhbiA8c2hydXRoaS5yYXZpY2hhbmRy
YW5AbmkuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxz
L2JpbnV0aWxzLWNyb3NzLWNhbmFkaWFuLmluYyB8IDIgKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3NzLQ0KPiA+IGNhbmFkaWFuLmluYyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zcy0NCj4gPiBjYW5hZGlhbi5p
bmMNCj4gPiBpbmRleCBlOThmMzFmOWMzLi5jMzg5MzZkYjQyIDEwMDY0NA0KPiA+IC0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zcy1jYW5hZGlhbi5pbmMN
Cj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtY3Jvc3Mt
Y2FuYWRpYW4uaW5jDQo+ID4gQEAgLTMwLDMgKzMwLDUgQEAgZG9faW5zdGFsbCAoKSB7DQo+ID4g
wqB9DQo+ID4gDQo+ID4gwqBCQkNMQVNTRVhURU5EID0gIiINCj4gPiArDQo+ID4gK0ZJTEVTXyR7
UE59LXN0YXRpY2RldjphcHBlbmQgPSAiICR7bGliZGlyfS9iZmQtcGx1Z2lucy9saWIqLmEiDQo+
ID4gLS0NCj4gPiAyLjIwLjENCj4gDQo+IA0KPiBJTlRFUk5BTCAtIE5JIENPTkZJREVOVElBTA0K
PiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBt
ZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTc1Mzcy
KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
bWVzc2FnZS8xNzUzNzINCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbXQvOTU0NzY5OTAvMzYxNjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVk
LWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsN
Cj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiAN
Cg0K

