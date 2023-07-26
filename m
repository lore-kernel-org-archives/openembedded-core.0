Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75178C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:45:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.5568.1690353911124275403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UM9k5erm;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690353911; x=1721889911;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cIhzR7JxkKB/1Ym9acdSr0rjdSblaF0S2trjlhztKDM=;
  b=UM9k5ermGiCojQjufTQlIusDQ2TxGfGMgxhjHrNf4uohIGJ76qI2q5ix
   lv4kB5HOl/+8xXcelVM9reBMYn2ttI58HNUmDVnSqKDCgl2GrQGR73hxx
   jlCEcCi7Xaq4qvlt40jju0SvtzQ5G5DB00JyEDdbWty+2sXteC2mPWmRe
   8W506itmikDZklXty8qCwT8sXBBebD5/s5sDbs4a/V7yW5dRsn5xnHhlp
   dJ9xYqM9lVReYZX85OOQJ/lMGDcn1OBotlZDx9qu6gc154xJrgR0ZRuxJ
   nSDGc94mYRnh3wzN+l6tg1Vo4idon6Wa6BmpERi9E4C6tSJ6GLhOsVAb8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454310285"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454310285"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761520490"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="761520490"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 23:45:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:45:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:45:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qw2YE+0F6HMPU5T18scu+2ms/2NpdojdFFlRIMi0ce+5OXNlTV4lJ5hL8M0m52UJ9lTgAAPg5bFI2Gj3/zNwC2UiqU7JCXP4rUFcfjlccra6q6x9JEPTM4z3nYm+5HcLpnR8QfL+brvR14oNB8BsblMQg2HbPuyB0ikA/+ow2JCD59stZdHxPYzdMyGORUQt0UFjOcMzF4O9R0dvqihHwfyi8uNjB2v9XJN4ZndBjOXMbcWhNrj48dRRqxFVzAmaekYeDyFerrUf5y773tZY/vlxOMbU52QaGxmfHb0dPd7jGya5+v1rGOW6Q0+VDrVvSC8WBMrUqKOxI7kl8XKfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIhzR7JxkKB/1Ym9acdSr0rjdSblaF0S2trjlhztKDM=;
 b=RTsvcNxw6319XW0mlXhq32gwKsalLRuWHCAmUeeyRfMg4AjL4Rzlfw8A2bPxs8xEv7RTe7SnD0gWcaIdBKfXQS3MvcS+ZiBxBao6cydNlq70gVo/Qfm5mUfzYG2BHMY7YPu0vTjx9gOhlxgC+1BXAmk0ojEiKSuDVSPfY8F3kmrBAblcF/3h2OuKF876wWpvJogHw6qtVPYg9zDspHLWJMsBrsDpZ35fMATnMZie3Fj6vAO4OhgbzkTVpOlLKVSyRB2fnGOs2C1nkXEF1UxKCPyurMeue0vgl7kLdgSydiya+l4BDQd5duvo/g4WpzEpTWUHIpmYtTBCSTxjx2ekoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 06:45:01 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6609.025; Wed, 26 Jul 2023
 06:45:01 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "ross.burton@arm.com" <ross.burton@arm.com>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>,
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] Toolchain test results
Thread-Topic: [OE-core] Toolchain test results
Thread-Index: AQHZuv0eLeKLkpz+HEmePLstP3FOsa/LlwmAgAAIHYCAAARFAA==
Date: Wed, 26 Jul 2023 06:45:01 +0000
Message-ID: <b00580c642e9008554cce2d9fede0918ed0f46db.camel@intel.com>
References: <1772EB68FCA90E64.1400@lists.openembedded.org>
	 <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
	 <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
	 <CAMKF1soZWn6xa=+Xrafm62BXXwwm+BooOTU0P8u9kmq9CWB0fQ@mail.gmail.com>
In-Reply-To: <CAMKF1soZWn6xa=+Xrafm62BXXwwm+BooOTU0P8u9kmq9CWB0fQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB8202:EE_
x-ms-office365-filtering-correlation-id: d4f3ff7e-ecbe-478c-db1f-08db8da3d648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YeeLSSSEviiiJviwFoCEVchbGgNH/PvogLiu8re0T5IHZwfqy+Fq1jHKdun9uaxuEHZaB0qmENC8Ieri/MKXUBoZNFtXZxCSyhDbyPEKg2CQP87vspBK+zcvjR+sCa0GnITw0UYE6yqczYCwTYT95IFdQXuUef5oSUyQR00yQ7ScXdr+N3A9CqfZnzupeayh6LqxT8VeimdD969HxIiaocFodSDKuU5CU790xreyOyKCfjKOFGPaYz5Usnp+kSBZPLA2G6eh7aTWlKO8JTJ8NSNx+MpGXbbzsXxzBOL2S2Zyz3r1U2SSUR+9h/SOLBUEVfIs7OhZJtvlE8MUmAhqdBXogWsWXrQZkrTUYjIeJYHAc8QAUMkCsW5EGlorDTTQkmIps+lsDdcdrxtPNZVtcjjr0p6BWFblnxw5GrCvGJEllmdpfkQixw/Jab4GxZ+GOXlKBf4ftfKKdIx9ppoo+WcSo9ZrPeiO6ohzbUNP71tSb8Ke/d7oGm5ewxBy3LwjbjiAiZ8eJzEjE8S4+xlY8GsQBLs362zood/0AuIqhLJwsj8lloJzkdW4tOzE2YoHDHJOGk+jEN+19HfqPk+md63elt9f7nvxluwB66XazJ5cPd1QWa7ceVBHkYvX/FtlPAVHN5wFdioe6xNzoEaYIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(54906003)(122000001)(38100700002)(478600001)(6486002)(6512007)(966005)(71200400001)(82960400001)(41300700001)(5660300002)(316002)(8936002)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(91956017)(2616005)(186003)(83380400001)(53546011)(6506007)(26005)(86362001)(38070700005)(2906002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cllYam9TMzIxVGFVSVUrVGFXUitzOGZKdm4vK2VkTlBnNW5NMVhTRlVmbTZS?=
 =?utf-8?B?N2MyRG1zTlArNHFHOUUyQWI3WTNrcmdybW1idTFubVlWcTlNTFlxSFhYVWgx?=
 =?utf-8?B?Q2paTmZGdFZ0aWdVN2tBZG9zUlBqU2t0S0Zheng1S3J6bDNLY2dYcVNCUU8v?=
 =?utf-8?B?Zzl5VjJHaFByekxUc20waDNwbUFqQ29STFpHTDVCamx5cEVvSnVRMHFuWnU3?=
 =?utf-8?B?QjJpWVAyVytSSFNmUTBrejJpeFIzQ2ZMaUdnWHliVVV1OFhlZDA2R0UwL3lp?=
 =?utf-8?B?Tm5scHhyWWYxd25vZjdtc2ptTTRhY3hyV1RpL3BLWmRQbXRzSXEyY0FSVXJQ?=
 =?utf-8?B?NW00MGRhTUVBdGIyTEtjZHFHWjhEc3JURGVDUG5vdDluY25yYU1LSWh3WXE5?=
 =?utf-8?B?VS9KMTZNUzJxTGo0Wm9ISTJrc2Npa05LbGh5Mk1NWjhCZ21qTElwa1pIVTdI?=
 =?utf-8?B?d2tKYXRzODZ3bXc0ellYbDNMQVJubjZYMm1lb2UyWVRQdnhyazRGRVhUUHJZ?=
 =?utf-8?B?WmNSWXFJYWVZRVp2dDhUanVWZnJzQitYY0syNjdIK0s1QlJwT00zNElJeVRG?=
 =?utf-8?B?cVlnMjdWeHFwZjlJd1VxMGlOQnNkelJaWEFTQjRoZWNGMjVoalpaeHB4bzds?=
 =?utf-8?B?SGUxZkxTNkxicVJzNE80VE0ydVVpNFBWNTJKcTlhb0RrTW9kREQ3RzFjdTJh?=
 =?utf-8?B?c0o4dU8vQkh4cjdTQVNHajErQmJHUnBNZ2piQS9rWDk2bDBhVXNiQ2VJbzRt?=
 =?utf-8?B?VFhrNzJLZUxBeDdzMzRmNmNoUWh5UGYwSVlnNzFjK2NaeEdUWnk2RkE4cVZl?=
 =?utf-8?B?K29GemdsT3M1b2haWkZUZkdMYWY5K05ZbjVCQlNyRHN3NGxYeEJLS2lXb01w?=
 =?utf-8?B?cVhYT2M4ZmdtUXVDR2sybWhreitROVBGT04yQmVjTzArT1lXR3I2dEF4VE9C?=
 =?utf-8?B?NTBic3FaSU5oTGRYOExaR2NpVlpBN25USURDMk0wY0hmV0hGRWpzYzR5Zngy?=
 =?utf-8?B?OXRETCtUZ1JPOG04RlI3Vm9LVEtDNTFzSjl3L3lvdjRkbFZMcWtjdHQrOE0y?=
 =?utf-8?B?Q3VSWkF5MFpkUXFmLzRFc3N4NEI2dmNDZ29abFMxK2xRZEpuUlFScHBUMGtO?=
 =?utf-8?B?WVNoMWZ4aFBDcXpXeDlwN1p4MEJCeElockkvNk5OV2lBSGFiZVZVazducTRJ?=
 =?utf-8?B?M1MxcUhBU3JiNTRQaUJBd0k0YlNjYUcrU2pJNlJjNVM0ayt6SklNYjJ1djZS?=
 =?utf-8?B?Zmo3UDFoR00zdWgvK0U0WGNyVEgyY1dOQXZXeWN0RVFLMlgra1UrTlVDQ2xI?=
 =?utf-8?B?TWNZbVEvM3ZMNEVvSzIzdzBtYlVFYVhNK3RMVkZNbll3cG42NkpDZVVldERl?=
 =?utf-8?B?TzFFbUxETG5xS2dXd1R0VzhoNHFtOERHbzRMNlJYSUV0OTFndVV5SFBBZWJG?=
 =?utf-8?B?MC9tbWNaSG5LT0hyN21MTHZPMVN5MWZOYlBqUFQ1c2Jvc2p2clYwamNOUXhX?=
 =?utf-8?B?WDFsQkh5RDhjbndsRUNSalBOazBtcTduZkRwWEsvTkRYN01JYnk0UVhTRURi?=
 =?utf-8?B?NmZNNFllaXcvRzNHRzJQdTR4L2ptNHppV2VSM1N5WVpSZ3BVNWZpYUk3S2VB?=
 =?utf-8?B?R04wZlRtbmlMeDd5REdDSldKcDlHY1pUYVBFKzh5VEYrcUtxZ3FHeGRrR2x4?=
 =?utf-8?B?b3ljcmtsMy9BQjVaSlcyTERXZFpYcVhJUmRqYXBZb2NuUWFFTVF1Sm1OeERN?=
 =?utf-8?B?M1NEbEFWUlA1SDNpQUlYazhLaUxJMnMxSFdqeVdaU1NEOWdOdTJRMUkwRWlh?=
 =?utf-8?B?dFlVUk0vMlRJVTkrV3ZHa0lrTUhwM2p5eUtobzVPSkR2VDNvTHlmSXErZDdl?=
 =?utf-8?B?UWlqN0JsVmRoQ1hTeHpDdEp4b0x1MTVsRWxQbWJIRmd6Q1FCZUlUQUIwNVg4?=
 =?utf-8?B?YUYvcDg1SmVXSm5JN0V3bkhnVVpHMjBpVDRhOGlOUjlHQ2VQUFZhRFVxczVq?=
 =?utf-8?B?U1VxV2hBWjNzWE5FWnFkM0NZYWFBTDEzYW5mS3MzVDlIUzVrdFlndXpBVDF5?=
 =?utf-8?B?R2lpVFA2L2hmdUwzeFM0aWwvRU9Ha1lZU3dtV1g4ek5nTHBjdHdobmlMdlNW?=
 =?utf-8?B?bzFtTXFKRDN4QnlMbmlHcnJ5cnk5YmNHdTl0QW5FdXVReTl3RlNkQ3psbXF4?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF07B066426D7744A5C5FCD500EB076F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f3ff7e-ecbe-478c-db1f-08db8da3d648
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:45:01.6983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoEOInOAsVFZH2h4xx+/Z4FFH9rFyYqFdrHAum8OhmjYryyvxOejoA3GhvCOFeAA+aPyB9mK7DYqfL3MaUxAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184862

T24gVHVlLCAyMDIzLTA3LTI1IGF0IDIzOjI5IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VHVlLCBKdWwgMjUsIDIwMjMgYXQgMTE6MDDigK9QTSBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxA
aW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUaHUsIDIwMjMtMDctMjAgYXQgMTI6
MjYgKzAxMDAsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMDIzLTA3LTE4
IGF0IDEwOjE0ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWENCj4gPiA+IGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiA+IHFlbXVhcm0gaGFzIH4zNTAgZmFpbHVyZXMNCj4gPiA+
ID4gcWVtdWFybTY0IGhhcyB+MzUwIGZhaWx1cmVzDQo+ID4gPiA+IHFlbXV4ODYtNjQgaGFzIH40
MDAwICgzOTAwIGluIGdsaWJjKQ0KPiA+ID4gPiBxZW11eDg2IGhhcyB+NDAwMCAoMzUwMCBpbiBn
bGliYykNCj4gPiA+ID4gcWVtdXBwYyBoYXMgfjYwMCBmYWlsdXJlcw0KPiA+ID4gPiBxZW11bWlw
czY0IGhhcyB+NTAwMCBmYWlsdXJlcyAoYWxsIG92ZXIpDQo+ID4gPiA+IHFlbXVtaXBzIGhhcyB+
MTYwMCBmYWlsdXJlcw0KPiA+ID4gPiANCj4gPiA+ID4gQW51ajogQ2FuIEludGVsIGxvb2sgaW50
byB0aGUgZ2xpYmMgdGVzdCBmYWlsdXJlcyBvbiB4ODY/DQo+ID4gPiANCj4gPiA+IEkgcmVhbGlz
ZWQgdGhlIGdsaWJjIGlzc3VlcyB3ZXJlIGR1ZSB0byB0aGUgbmV0d29yayBiZWluZw0KPiA+ID4g
ZGlzYWJsZWQNCj4gPiA+IGZvcg0KPiA+ID4gdGhlIHRlc3RzIGFuZCBoYXZlIHNlbnQgYSBwYXRj
aCB0byBmaXggdGhhdC4gVGhhdCByZWR1Y2VzIHRoZQ0KPiA+ID4gZmFpbHVyZXMNCj4gPiA+IGZy
b20gfjM5MDAgdG8gfjMzMC4gV2Ugc2hvdWxkIHJlYWxseSB0cnkgYW5kIHJlZHVjZSB0aGF0IGZ1
cnRoZXINCj4gPiA+IGJ1dA0KPiA+ID4gaXQNCj4gPiA+IGlzIGEgc3RhcnQhDQo+ID4gPiANCj4g
PiANCj4gPiBBIGxvdCBvZiBsb2NhbGUvaWNvbnYgdGVzdHMgc2VlbWVkIHRvIGJlIGZhaWxpbmcg
d2hlbiBjYWxsaW5nIHdyaXRlDQo+ID4gd2l0aCBsYXJnZSBidWZmZXJzL2ZpbGVzIG92ZXIgTkZT
LiBTb21lIG9mIG90aGVycyB3ZXJlIHRyaWdnZXJpbmcNCj4gPiBPT00uDQo+ID4gDQo+ID4gSSBy
YW4gdGhlIHRlc3RzIGFnYWluIGFmdGVyIG1ha2luZyBhIGZldyBjaGFuZ2VzOg0KPiA+IA0KPiA+
IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjMwNzI2LTEx
L3Rlc3RyZXN1bHRzL3FlbXV4ODYtNjQtdGMvDQo+ID4gDQo+ID4gQWZ0ZXIgc3dpdGNoaW5nIE5G
UyBtb3VudCB0byBUQ1AgYW5kIGluY3JlYXNpbmcgdGhlIG1lbW9yeQ0KPiA+IGF2YWlsYWJsZSB0
bw0KPiA+IDEwMjQsIHRoZSBudW1iZXIgb2YgdGVzdHMgZmFpbGVkIGNhbWUgZG93biB0byA2OS4N
Cj4gPiANCj4gDQo+IFRoaXMgaXMgYSBuaWNlLCB0aGFua3MgZm9yIGRvaW5nIGl0LiBJIGxvb2tl
ZCBxdWlja2x5IGF0IHlvdXIgcmVzdWx0cw0KPiBlc3BlY2lhbGx5IGdsaWJjIHBhcnQNCj4gYW5k
IGl0IHNlZW1zIHNvbWUgb2YgcmVtYWluaW5nIGZhaWx1cmVzIGFyZSBpbiBuc3MgbW9kdWxlLiBJ
IGNvdWxkDQo+IG5vdA0KPiBzZWUgZGV0YWlsIGxvZ3MNCj4gd2h5IHRob3NlIHRlc3RzIHdlcmUg
ZmFpbGluZyBidXQgZmV3IHRoaW5ncyB0byBjaGVjayBpcyBpZiB3ZSBpbnN0YWxsDQoNCkFsbCB0
aGUgbnNzIHRlc3RzIGFyZSBmYWlsaW5nIGhlcmU6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9ibWlu
b3IvZ2xpYmMvYmxvYi9tYXN0ZXIvc3VwcG9ydC90ZXN0LWNvbnRhaW5lci5jI0w4NDINCg0KQ291
bGQgYmUgYSBORlMgcHJvYmxlbSBhcyB3ZWxsLiBJIGhhdmUgbm90IGxvb2tlZCBhdCBpdCBpbiBt
dWNoIGRldGFpbA0KeWV0Lg0KDQpUaGFua3MsDQoNCkFudWoNCg0K

