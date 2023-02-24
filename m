Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0470EC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 01:51:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.7920.1677203464631466907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 17:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=c9KB7PWM;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677203464; x=1708739464;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ktaR20iUSJeC2vYJTszSR3zIDHMkVuSB3K6hAjhtLIs=;
  b=c9KB7PWMJcQNbllCHO5GxzCyraEbM0mDt8cLgw1XuFtNA7EhLhutOKLV
   jgPOsRwJM8Jl/IqTCYTJWxsXgALRlVVYUYvMAsjs3NYix2/3vvbOrjCy7
   fIW65weTFGhQCzfR5g/zLXoNVsMfZuk6TyONrvcgqB1bWDsulONyfbyjx
   QDWPrn1TbFHXE15iPqhXaeWGswtxbrKX+eJqPPl+MbMACQ0VYi67hdbSA
   DrrBiYVLwM4PABOl/c1BEtFvLABWKJlXLw8kdVY2u5yivGEbwxuHs/DXm
   6PAsEdhJ3UZyzf/cfjgwk0qUEoWZ/zNY3A5S6NkRQy3Y4K+gT/fXVy3hx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313010684"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="313010684"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 17:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001656792"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="1001656792"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2023 17:51:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 17:51:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 17:51:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 17:51:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 17:51:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCrto17dwN0AbdJIEX+UJQtZuy2Bx+yuQzdDkulrWQJ0E7bno5xQ7IXeuy22sLNheTn7f4zMHVp0/OklXQZ0BAQs+GaXHAeZi6T2iudS66Ct867WWJBjwWcEpCU7RZypXj5YwW41P49mrMQ6SYqch4+Il1/+9SJeW0gWCMOzoko49jprOpHUpzAhm6bBLwzx7IDZNBbJCvUWTIUuZwLgb09jDRF0kIK80s1FLSzUyFp4N/shmjxPiHiqcKoHXJD6FFpOuW5B9gQbkH0Llm9mhQp/D8kL6ItK5Ormz/zXWy3uw0GHMhNzvz/fsPeq4Lisq3KkzjKvgZ/SImHs7FWdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktaR20iUSJeC2vYJTszSR3zIDHMkVuSB3K6hAjhtLIs=;
 b=TAk+AkCfw0Kq+1P4YU+e8ZL/TbG76gWu08lGz5shqBZi+JhT80IIz4+jdWHbNxUdl0LebUr4f5Cvb6yFGXxp4exPlHLo4OIa79Lh+EMnjS/7zROehVODAJgY2cN97r0TdY6ffclEQlTgrlgMxd4uTOcG9gBjjLFzZDolGZbCHOl3mQoVbpWR3IT2WY6xZRoZ4F/BomSpFjSy/q3TQ+DSASj/UXbHm19JpWpPPjh1pHDbVu2avOlN4IEyBOi3O2J31XaOxzFzItJBcktWPtqqvju1HTsgXWbI8mZC1dChXgmPR3PXOwgDFmLrhn0vNmLZZ4GdPNYCVopxsFu0OuUP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 01:51:01 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::4b28:81c2:96f8:acc9]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::4b28:81c2:96f8:acc9%5]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 01:51:01 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] checklayer: check for patch file upstream
 status
Thread-Topic: [OE-core] [PATCH] checklayer: check for patch file upstream
 status
Thread-Index: AQHZR4tVPoW9uXsI90aoIMbzYfvXr67ci+8AgADE0oA=
Date: Fri, 24 Feb 2023 01:51:01 +0000
Message-ID: <DM5PR1101MB2361A04D0CC9B8FE3A484225B9A89@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <20230223062754.3162249-1-chee.yang.lee@intel.com>
	 <CADkTA4MV5JMfhG6hSCHqRO2RSguE9k-DCYHX6h8R9_xRD_0TOQ@mail.gmail.com>
 <0383bf0d23cb729d492771f658b31c6ae6584c60.camel@linuxfoundation.org>
In-Reply-To: <0383bf0d23cb729d492771f658b31c6ae6584c60.camel@linuxfoundation.org>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR1101MB2361:EE_|SN7PR11MB7491:EE_
x-ms-office365-filtering-correlation-id: d7ae1901-86ce-4548-076a-08db16099526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sBZ0uqy1G1dMj7bW76wxGmABcqyFnRg5IG2474EFHvVjrqKbVaahzpSav/BF3q3l+4V9OlEKQKqfhACQiciHnkj7B3Hpn2GEXnwBia/Szl2N4kzJ3cXCrwIdP4Bqx3waVi4Zzg/jqazPGOVCFo7K6DGlaEH2Uoq6zm4POP+duU+2vZGWqg70b4GLXIobfjkW7KqnL58CF5UfXKeQEG0CNZ2i3ZQA3A1DuCuFjW+AJC0SNvqt2F8N5BA5ooeH/LuWc+yr4H4cXoBE315KlS6qonJ1GANLaL63e76YkWA+5ISlbq8KhardOE6a+HWY0sIyaZtzQaLDT5I3QUbT00SEJ60B5zjgVBn2KbIKge6ULH99s8ZxWi9DMobrQAHFY0Gg79QtqjDNsJOx4PpPzo8IqQxz4TQydYaqDaT7PvIGkZnDOtxEaA4AXuGNXiWTmwhqFZiGTLuTBeilw/cFmuS19RgKKsXcxtoHpkopE0Weogst3fkY6HTRsKLV83OZm1HpQDseCykRns3bQ+lL596h22DiHEq0liX+SHvKgsuXgbgEvqydaMfZKv/TGXkE7Xn1p4M1p5GRMil1pGQtvuSenrQArCTh2jV22RDdlOT7lLpMLAQhboNS51mpltaufDSWjPiAJ8UkKuoHqaP7HJKHImJ0yIpn4C7yueDg9M7HoYu8DoIEdR5OMmlsssQLZ2I4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(5660300002)(2906002)(83380400001)(38070700005)(9686003)(186003)(122000001)(82960400001)(38100700002)(76116006)(8676002)(66446008)(55016003)(66946007)(66556008)(316002)(66476007)(4326008)(64756008)(8936002)(86362001)(33656002)(52536014)(41300700001)(6506007)(7696005)(53546011)(478600001)(71200400001)(966005)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lOcTc3MjZHcXcyM0thWlJrNXREdG1kVmQ1ak5USVM3SU9PMUhpM0gzdTVD?=
 =?utf-8?B?RGl4T0p5TmJJdUpCYWNDOWV5dGFJbmk1a0NxeGo4YTlkRHZYMjVEN1FSa2xs?=
 =?utf-8?B?SkZ5VWJxWVpMeG5QSGV2Y0hvUytoMHJ4OEJ2cVF5M0tpS2VPdVAyYmpIZ0pl?=
 =?utf-8?B?VVIzVFZXYkdIT3BNS3NrV0dKSlpRd3RWSkJFTUJRWlRBem5SMkR3dXlIbG1r?=
 =?utf-8?B?K0EvbEJpeVNwbUNYVVBmMWtTc3ZkSE1UdGsyajAvRHBwNFcxeGRxWmZNM3NZ?=
 =?utf-8?B?SHFyZmR5S3JDSWFJNnBhVVJLUnZqV2xDcmV0UkRyaVBxd1FEdjRzT1JTOEVi?=
 =?utf-8?B?UkhSRktPeTFGV05rdURETE1XcGFZbVhUbDdicEpMcEJEN3lxTWZOWnROdVM0?=
 =?utf-8?B?cDJuSmt4QzVtUmNMbnNTMjlRQXAxbVJSQzdjMnVhSlJEUGRmUk40SU11L0p0?=
 =?utf-8?B?aXdyUUovZE9IZVdOV0d5UWl0WksxOE1rT1BldUMzelpwYmxwYzJpR1VTTml5?=
 =?utf-8?B?NEhGeUhUMnlVVUVhRlRJVmlzanF2RXBTYmRkMUc4MkZsQ1hudHNNeVJhamYy?=
 =?utf-8?B?MTBsTUFlRXdaWG51TmYrZWkxS25lY3gwUnlGWmdaUCtZQ0pDVzB1c290YjNF?=
 =?utf-8?B?N0JzcUJVVmU4a1lsM21XWW4zbFNGM1BoNC9VVmpleVo1ZG51UTN3V3pqV3RK?=
 =?utf-8?B?ZzdVSHZPSmR5a3pWNnRmZmN6enJ1OEk5cU9RcDFmU0F1cXkrRkhBYkJUL2tl?=
 =?utf-8?B?UkJrSE8wRS9YZDBjeVU5VUdZYzRreklNWDhLMlVsV1NGSWJ5dW8yblRsVjlS?=
 =?utf-8?B?YStqMjFGd1QwdTZ4elJyOUJkTnZVQmVWVkJMdHIyKzZubitGM3hHTStvRDFV?=
 =?utf-8?B?YkJZQUhsaitna0FEWFB4WnJ5cXp3b05sc0dQSGVGaEJiUFRPWS9OT0ZqQ2d6?=
 =?utf-8?B?dENlMkY5OFAwczF5WEtnUkpHSHRaamtyRFVBeFM2eHMvMHJSRk1yai80TmQ5?=
 =?utf-8?B?a3E2d3UwWGt3aVdhUCswMGR5MUZGbXdNQ1ZBSjd3a3BmMDQ0TzFrMkFxSHF1?=
 =?utf-8?B?YWZISnZoTE1hNmxZN3poQ05aTHZtRWd0ZEdONkNzcTUrbm9ZU3hqS2hrVkRv?=
 =?utf-8?B?RzR4emgzaVY3ZlJ6S0pXbHc2aDlBcEhVbnNoZXptZEhyM3ViaHZvN25jb3dX?=
 =?utf-8?B?ZDQ1SEp4WW1uTjBaY1oxNEtlWW5XSE5RZzNHNkEvd2tvcWsraktIK2JhdzZZ?=
 =?utf-8?B?ZjA1ci9Ca1FwcTZLczhIUW5oSmp6b0tzaFcxdkdKY3BTMUxBc0p0S1QrYkhv?=
 =?utf-8?B?L044SXNnN2FYb0JNYlV1aWVRVUNFaGdUdXpzV3hJdWhTUXlpWm10Mmh2MURH?=
 =?utf-8?B?c2xOLzhxQ3l3MlFPem9xSHRMSWNiQUFCZjRZd2wvZmNQbThsMFJncDh6ZWNq?=
 =?utf-8?B?OHlFeHMrdlQ5MEthTkpqSzgxZFkwNy95S3Q5bUVuQ2QweU1Kd2hiV0F2a1BH?=
 =?utf-8?B?V3gxYlhzMmVraUY2Vmp6REJRZGdHcm1hWUNPcTZYU3FyUVRlOHZ5T1lZRi9a?=
 =?utf-8?B?eXZ1Y0xLM0hZN0hHa0t1L2k0cDBYVVNvTWFrMWpRZXBCK1o5NGw2U3ZEMVdp?=
 =?utf-8?B?dWRTRWJ3aHEyT1R1ZDJnNkxyV0hCK0lpNFhieGtYbThzNU5hc0t5aWQ3ZFo0?=
 =?utf-8?B?c29FQm9Md1laOXR5eE9BamkzbzJockF5cnovT3ZEV3lqZXZYN0E0MEpaL3Ri?=
 =?utf-8?B?anAxcHdiSldERzJFcHFRM2FuRkRYcFE5SEd4WmNXK3JBSW4zZmQrRElJbjly?=
 =?utf-8?B?c3oya2E0M0haamVMT0prNHBtd1NQbEpoUU9kejNtTFBYYk9kcElld3hoLzRD?=
 =?utf-8?B?WEtsSlJiZ1MzZTNTL3NPL3FQYk9aR0xVcDNPakVzVnQwLzVHMG50eXJQZWNN?=
 =?utf-8?B?QlZad2ZqK1Nra1FWc1BvMFdHNytnUS9UcStZS2s4ZytzVVhQWXNWbkd1NVlY?=
 =?utf-8?B?NlAyYU5vN1NQY0VVUGpHZ3pqK2lqcGVVYmtXbk5vZEFvc0lIVGhYNXNRU1pB?=
 =?utf-8?B?KzZnVFdFWDhCS3lJOTcrbVNKTCtZeXRtSHFGMGxoSmNXWmJYVkg0bmQvK3dv?=
 =?utf-8?B?VmR0b2I3cHB5ZkltQWkwalBYVWloeWhPbXJ6T3dtUWU5NlpNZmlRTlAydjQx?=
 =?utf-8?Q?zbzh4zi9p/6RrBBf210huZw1icEcTrecHgDaLfrkfhJH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ae1901-86ce-4548-076a-08db16099526
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 01:51:01.5402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NMoA4meJEpIAM18OMjLVqyMUpPudUR9N1bTYIYVyT2u79+xYQ8wpLRlMv8WAaQCyQWGEnujrgaPgMqODBCkf6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177647

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1
YXJ5IDIzLCAyMDIzIDk6NDkgUE0NCj4gVG86IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVs
ZEBnbWFpbC5jb20+OyBMZWUsIENoZWUgWWFuZw0KPiA8Y2hlZS55YW5nLmxlZUBpbnRlbC5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjaGVja2xheWVyOiBjaGVjayBmb3IgcGF0Y2ggZmls
ZSB1cHN0cmVhbQ0KPiBzdGF0dXMNCj4gDQo+IE9uIFRodSwgMjAyMy0wMi0yMyBhdCAwODozMyAt
MDUwMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6DQo+ID4gSSBkb24ndCByZWNhbGwgdGhlIHVwc3Ry
ZWFtLXN0YXR1cyBiZWluZyBhZGRlZCBhcyBhIHlvY3RvDQo+ID4gY29tcGF0aWJpbGl0eSByZXF1
aXJlbWVudC4gQ2FuIHNvbWVvbmUgcG9pbnQgbWUgdG8gYSBkaXNjdXNzaW9uIHRoYXQgSQ0KPiA+
IG1pc3NlZCA/DQo+IA0KPiBJdCBpc24ndCBhIHJlcXVpcmVtZW50IGF0IHRoaXMgdGltZSBhbmQg
dGhlcmUgaXNuJ3QgYW55IHJlY2VudCBkaXNjdXNzaW9uIHlvdSd2ZQ0KPiBtaXNzZWQuDQoNClNv
cnJ5IHRoYXQgSSBtaXN1bmRlcnN0YW5kIHRoZSBkaXNjdXNzaW9uIGluIHRoZSBidWcgdGlja2V0
Lg0KV291bGQgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byBhdm9pZCBjb25mdXNpb24uDQoN
Cg0KPiANCj4gVGhlIHRvcGljIGhhcyBjb21lIHVwIG5vdyBhbmQgYWdhaW4gYXQgdmFyaW91cyBw
b2ludHMsIGluY2x1ZGluZyB3aXRoIHRoZSBZUA0KPiBUU0MgYW5kIEkgc3VzcGVjdCB0aGF0IHdh
cyB3aHkgd2UgaGF2ZQ0KPiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19i
dWcuY2dpP2lkPTE0NjQyIGZyb20gYmFjayBpbiAyMDIxLiBJDQo+IHRoaW5rIHRoZSB2aWV3IG9m
IHRoZSBZUCBUU0Mgd2FzIHRoYXQgd2UgcHJvYmFibHkgc2hvdWxkIHdhcm4gYWJvdXQgdGhpbmdz
DQo+IGxpa2UgdGhpcyBmcm9tIHlvY3RvLWNoZWNrLWxheWVyIHBlcnNwZWN0aXZlIGFzIGl0IGlz
IGEgYmVzdCBwcmFjdGlzZSB3ZSB3YW50IHRvDQo+IHJhaXNlIHRoZSBwcm9maWxlIG9mLg0KPiAN
Cj4gPiBBcyBldmVyeW9uZSBjYW4gcmVjYWxsLCBJIHdhc24ndCBvbiBib2FyZCB3aXRoIHRoaXMg
YmVpbmcgYSBkZWZhdWx0IFFBDQo+ID4gY2hlY2sgYW5kIGVycm9yLCBhbmQgSSdtIGFsc28gbm90
IG9uIGJvYXJkIHdpdGggaXQgYmVpbmcgYSB5b2N0bw0KPiA+IGNvbXBsaWFuY2UgZXJyb3IuDQo+
ID4NCj4gPiBJIHJlYWxpemUgaXQgaXNuJ3QgYmVpbmcgbWFkZSBhbiBlcnJvciBpbiB0aGlzIHBh
dGNoLCBidXQgSSB3YW50ZWQgdG8NCj4gPiByYWlzZSBteSBjb25jZXJucyBub3csIGJlZm9yZSBz
b21lb25lIHRocm93cyB0aGF0IHN3aXRjaC4NCj4gDQo+IFlvdXIgY29uY2VybnMgYXJlIGRlZmlu
aXRlbHkga25vd24hIEFzIEkgc2FpZCBhdCB0aGUgdGltZSBpbiB0aGUgZGlzY3Vzc2lvbiwNCj4g
dGhlIFRTQyBkb2VzIGludGVuZCB0byBhZGQgc29tZSBleHRyYSBjaGVja3MgYXJvdW5kIFFBIGlz
c3VlcyB0byBZUA0KPiBDb21wYXRpYmxlIGJ1dCBubyBkZWNpc2lvbiBvbiB3aGljaCBvbmVzIGhh
cyBiZWVuIG1hZGUgeWV0LCBJIHRoaW5rIHRoYXQNCj4gYWN0aW9uIHJlc3RzIHdpdGggbWUgdG8g
bWFrZSBhIHByb3Bvc2FsLiBNeSB2aWV3IGlzIHRoaXMgb25lIGNhbiByZW1haW4gYQ0KPiB3YXJu
aW5nLCBJIGNhbid0IHNwZWFrIGZvciB0aGUgcmVzdCBvZiB0aGUgVFNDLiBJIGRvIHRoaW5rIGhh
dmluZyB5b2N0by1jaGVjay0NCj4gbGF5ZXIgc2hvdyBtb3JlIHdhcm5pbmdzIGFib3V0IGJlc3Qg
cHJhY3Rpc2VzIGlmIHRoZSBkaXJlY3Rpb24gdGhpbmdzIHdpbGwNCj4gbW92ZSB0aG91Z2ggZXZl
biBpZiBpdCBkb2Vzbid0IGNoYW5nZSB0aGUgcmVzdWx0aW5nIGNvbXBhdGliaWxpdHkgc3RhdHVz
Lg0KPiANCj4gVGhlcmUgaXMgYW4gaW50ZW50IHRvIGltcHJvdmUgInF1YWxpdHkiIG92ZXIgdGlt
ZSBzbyBJIGNhbid0IHByb21pc2UgdGhpcyB3aWxsDQo+IG5ldmVyIGJlY29tZSBhbiBlcnJvciBi
dXQgSSBkb24ndCBoYXZlIGFueSBwbGFucyB0byBwdXNoIHRoaXMgYmV5b25kIGENCj4gd2Fybmlu
Zy4gQXMgYWJvdmUsIEkgY2FuJ3Qgc3BlYWsgZm9yIGFsbCBUU0MgbWVtYmVycyB0aG91Z2guDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiANCj4gDQoNCg==

