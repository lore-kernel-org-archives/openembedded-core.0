Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C3C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:55:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.3079.1642215320370195371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ieoJWG7e;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642215320; x=1673751320;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=4yZxFTYDE1NHyuZbvtsIfqxWfJ4jfZfDMVTPiKbUmHw=;
  b=ieoJWG7e9+gAyEqyUUCCl/a4yUjhtBtBen4y/pbh3+gqkMnOvYtWlZ/l
   q8e8aTk7k4UXpq9zv8QKjXwYWxUGpTL5ovhanGSDsZ3D+aM/mZU226+iJ
   7AmyRCVfNM7K5McUjw4JtGWh6qRxMAdfRApGEQUDEOGZrEJwAr8/X/5xL
   kO04qSuR4ASx3RaqCcH7YG5kWD9tAb/btk00TuUfY2p7xUYdPvwcTuWFg
   3ydFxugK7ueZcT92f0W3sEXdOxIZKFfrbWpj1vljFkQ+6+BxDbMO1Wr5U
   cHbWScRcn07vydrBkko5X4O5hQ/eK/tRdsfsh8Gdi+ICVAfOyawOIaBif
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="330717899"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600";
   d="scan'208";a="330717899"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 18:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600";
   d="scan'208";a="529537892"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2022 18:55:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 18:55:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 18:55:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 14 Jan 2022 18:55:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX+aCAwSjQgXBXm9jiBzkD/NSm9zp2OQoXBeVV8/bB95FA5qc775UjAvC5X0K3cBPdt2RcvI269NvlpJFpfghPs9FdcKPgyu58Pg9hGvj2yCorvud7XQO7F4Jch/736wXREkvgDeFo3gnXCAfvCMyk4kx+KBsJpxV9Sb+nU6UYpHGJVV2dAP08WjHqIp8GEWG8bM15ndrv3+4rlpG0xnFHpq87YDGFR5krwoWkzkOnNArxslrsQ03twKx5DwX0pJ3PDVV+QgEFPvsrWaTPszNhI5XuAehsAllEbqFFrOkUzRZErBszhAsoxx63ql00NbAzID95gBoa/swibF5guUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yZxFTYDE1NHyuZbvtsIfqxWfJ4jfZfDMVTPiKbUmHw=;
 b=haUoWgDg8bvKytTnxkjhKjejTvSo92q3TNhM+73s9L79HaQlO1lz/myBhm8fcJzxZvN8nsaDlX3kmXnFPsyeJaK1Z9EvUh2rlmVj3NkvgxPaYxrOswmPNZ5oJr2Eave5LU+dZY6fKbSYSVzaWA45lV8om/goK0i/E58Ai2HJJiR3fGaMzC8zjiw/47C1hf6i5m0eKgqZcKEW+yo6P6BXsKlS5/A46r4gx9Dp1Y4ZLOSAANE+/TIWyG+X2iMImqKA4Kj17Jok/cwczdhzoBk9HoRiP+AjQMY9zYi0KuWY9uV9qhrKji8OCSzZM+Bv1k0Jgwb0NFQlhtwBlX1ZpM5Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 15 Jan
 2022 02:55:17 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 02:55:17 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sakib.sajal@windriver.com"
	<sakib.sajal@windriver.com>
Subject: Re: [OE-core] [hardknott][PATCH 2/8] qemu: fix CVE-2021-3593
Thread-Topic: [OE-core] [hardknott][PATCH 2/8] qemu: fix CVE-2021-3593
Thread-Index: AQHYCXIIf5sdspu5DUGeMLawcw+BnKxjY8EA
Date: Sat, 15 Jan 2022 02:55:17 +0000
Message-ID: <61e56242bae03fb44dc9a4c66c6a382fd0bbb119.camel@intel.com>
References: <20220114180320.3526-1-sakib.sajal@windriver.com>
	 <16CA351C3BA3B44B.29498@lists.openembedded.org>
	 <fec4cf3c-06bc-7d80-3369-8d83b74b8ff8@windriver.com>
In-Reply-To: <fec4cf3c-06bc-7d80-3369-8d83b74b8ff8@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4fd301b-2633-4e32-3044-08d9d7d275fa
x-ms-traffictypediagnostic: BYAPR11MB2839:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB28396B5A8EBDA21594E2530BF8559@BYAPR11MB2839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lsMivyJIgke3NH0xR8H5p/ap0fkHMQhWSbB3fgctTBLbprNsyAY4cJexDhDoF3d+LbLL9+6bivURyPr/D14R9eNaoeMEfELb+Q6KSYYh2OayLyV4M7PCbNcuix5zhZgnbcbMUtj07nxCAiV4eWvtcI54pPc5FME9cwjNQwkTMurtoqP/gTQGyH+F5iT8f97TVX1uxF73MJ+Ekd5f+oYizQntiV44yefBMMUI8TySexs1tGmpRRimNE7r3pLYqxSt5vCjJa5kcMGYSfs/7PsXZEd/GUEqhcYvuvQudA5DockBZhAbSS6nZhHvDF9MG3Oa/4JO8nwV90X8uFDcUWUYbU28LnbGlzqUvfQzMXA3x44RLexgCisMnposH5ij1FP+knT1KrlKSg1qD8Lv8b+fj1chkX5UzFlD/hpbqB101ahuRSvP4gxgSrlrp/CracI2wAlKiHSbNWCWmx9fUo6EEmt0Ty/G2p9BgkKCqT5X23J21T26gAlr99PNY4uEXvAMXJOEg+dWFkJ2+BMoXONvcibKRAZ+K+XP4rJfQ7rh7I9W8J98Oohqsx9WoVLlkGGlVWJ9Wb4j8e2beDdzrb2gDnZBFKh621WEIut6Mnq11Zz1cTSgUFGtbWEO7E0MgIQC1U3KLcZ5NbzDaGdHjZSbCzyZeGeOxzNpKx+xq5ghYUocequoDhGuR4ZkMawIXl/1M31a8f+D2qf/W73IKkq9gxhafqq1J4xGBAlTD0VqRdavycgTO9hrd5PLEzP+pS9jpGN/e99SGonIBznKblXt8VnyFyDbFn6WHSbFDt/QiS0zkFUe9dvwo8FPo7p6MOBBMGae/3oawhKqtErR0HWeBA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8936002)(83380400001)(26005)(186003)(71200400001)(2906002)(110136005)(122000001)(86362001)(6506007)(38070700005)(82960400001)(38100700002)(53546011)(8676002)(508600001)(6512007)(91956017)(66556008)(5660300002)(2616005)(6486002)(966005)(66946007)(66476007)(64756008)(66446008)(76116006)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SU1selp5K1ZzK2h0WHVuK1JQK0RKMURRTHJQd2JrMjlDVTZKOXlKcGRhNzdu?=
 =?utf-8?B?QmplZEFWVEJRa3dKdEJmeGtIbXlwN29xZGc5M3RPYm1aQzFkL2E4djdpRUUw?=
 =?utf-8?B?UEtHTkFVb0pJekRYbDNvNEEreENnVG9oamlWYVN3SGxULzRRbFlPTXlWTFJW?=
 =?utf-8?B?YzROaFg1Q3I4SVFCUWNTem4vZlZJbGlHMm9ZZi9KMGdSZHpENnc0K0NxZHli?=
 =?utf-8?B?Sk5MOExaSC9kekFQOWxoOTc4ekRxdWlOTVhMMnZISHlndUFHK3hKeUFVbENk?=
 =?utf-8?B?dURXUlNqdzJwZmlkbk1oVFczNnIyYlZteDFrUnZlbE5xT3dneFo0UlphaExo?=
 =?utf-8?B?dWlXNXBEUkdRempPZUR3cGM0WnhuMHQ0eWJCWXgxL1hCbGxsN0JiUmZ0OHpM?=
 =?utf-8?B?QVBHcWlJNEI0RlFLSi91VXpMRXFRQjhiVzFTcHByN295WnN2bENuQjdGZHNs?=
 =?utf-8?B?Q3l4L3NwQllPTlNURHpIY3NIV0ZWZktnSE03WllJaVV1RGExRDVRUEpzK2dM?=
 =?utf-8?B?N214ZGJsT29ObFd0dUpWQ04rYzdQbnAyRjE2THJzMlh1ZndVODgxcGhndHhK?=
 =?utf-8?B?eHh4NmowZnBoRzlZRXlsTHNlQ1pPV0dDNVFocG5YOWpiTkJLWm1ZSmFMd1NK?=
 =?utf-8?B?Mk1ub3Z5dzdSSURqSlBNVnVzT0xJcWx4RnNZMXlyZHZpZ21lbGswalRLSzBm?=
 =?utf-8?B?ZzhZOUVoNkt2QXQ2ZkRBTzJ0VWl2S1J4MnV4L1dzS1E5YXZkTWlrUkF1UStI?=
 =?utf-8?B?eVcvd0tGNWxKZ2hQczcyU1lldTcrSnduOCtqNy9GQzRBaVIzeXU1aXhTa2Zu?=
 =?utf-8?B?Ykh1ZjIra2JHSDQ1T3hMOStqdW1ETnhpUzZ0SXNzWGk3Z1U2Z3J2aU5Na0tJ?=
 =?utf-8?B?Ti9obXVYVUpoTDdOM05CZnRBeW4raUZQVElzamdmbFVIRFNCbmFvTGVsckFE?=
 =?utf-8?B?bmZCSlZUNUdibDZabWIxL3EwK3oxQVhINWdtTWY4K3ZiMkxFOWZYbVdHbGt1?=
 =?utf-8?B?Y3FEVFpZc2VHS0s2V1hZR05IcDFDb1M1MGpFcTFZOTdyMTR2Zmp0V08rU0V0?=
 =?utf-8?B?a3JtaVJZaExwMjhpWDA4Umc0TlY1WlV5WENQM21MWXdKeFdZQ3cvQnExOGVJ?=
 =?utf-8?B?b2tIOEU0Mk80dko5aXE5d3NvRDhMYzhPSXVDcEpHRkhMSzBpWHA0QzFmWUU3?=
 =?utf-8?B?QmNKbm5iVFZDaWhKVGtXZnRQb1JIV1FiTVV6MnVTOUJna2xST01kbjhPbnlz?=
 =?utf-8?B?TXpPQ213SDBkeGdBOFFsRmRtb2VwMkZncnAweFR3MDBUZmxiV1c2QXhwV1FX?=
 =?utf-8?B?NkNuSWIrUVRkbmhobDFQcE9pNzdWbHllT2NtdTkzMnF6U2FiVFQ5V2tKR0lH?=
 =?utf-8?B?MzlSZUNQdUFLQ2hBc0JOSGI2YmxsSXBHLzJTNW54OUx2S1hydTJEbFNXNklT?=
 =?utf-8?B?K2svekRESDlNV1Ftc0MzcEFtNU1scmh4VWVPSzFGQjVrbWJZL2xtSkg2WStL?=
 =?utf-8?B?c1VTUjJsdDVZUkNJY2cyaGxldkRvQnZZU1JnYncrNThlRm1GeGw0MTVpZ29Y?=
 =?utf-8?B?SVIweVBZSHRheEhFNkVCSkFCZ1B4M1RRN3lWT3lUWFFNckk1MEVFcGpyYjNy?=
 =?utf-8?B?VHYyMzloYnQ1Nm9MdHJCcHZpQXpXUHFjZWY4OHYwSEY4NDhmc3lnUlY1VUhs?=
 =?utf-8?B?eFFKVlgwajdzU0dMcEpWOEorWG5tSnAzaTFsWWRKTXZaN2ZqNXluRVRtOUxS?=
 =?utf-8?B?enhxS3dMR2pBUWpyaXpGaEFHdTR4QVludTl6cUNUblRlRFYzL2FNV0VyWUdM?=
 =?utf-8?B?RXArT2VlbUE2d0VnQzRDemdTaGJOeEZYWGl1bFJZc21PaTQrWjNwZ3ZPU1E3?=
 =?utf-8?B?UHpldWo4MkZpZG9HeGpSdW12WFVPbk9WWFU3LytKdkZrNkphTDJncW9RZWlW?=
 =?utf-8?B?cnlXekNoSkVPVFhaWHV5RkpBcUpGMWdtanhNZnRyb3hkUzFMWmFKSkl1eDB4?=
 =?utf-8?B?UTBTdVM1QXZlUFBEeHIyVUQraldGQytpZlB2MVo0NTBkOE1DTzV4QXM0MXIr?=
 =?utf-8?B?dWxhVDdXcldYRnlGdFVwODBjdnR5WXJTZ0VkRmVxOWtadDFoM0YyaXFWVGxs?=
 =?utf-8?B?M09yT3hXVnRrSGR6U3Zpam9GSTdHT2JRRjNoSHRtUlc4WWluVGJNUFN0dUJR?=
 =?utf-8?Q?RdXjSMI9SXLQudblR9+Jo3QPf+F+8yRjd8E5iCV/s60u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CD9301720020E40B057A87ED7728F7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4fd301b-2633-4e32-3044-08d9d7d275fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 02:55:17.1149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lveYyiyG10LfsdYXmRHqd8WYpVFGoq9gVm+popHEqTFXTR791TY/NfdauNUJ5siOZh/TIXbVc13y/S7jKMTRHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:55:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160600

T24gRnJpLCAyMDIyLTAxLTE0IGF0IDEzOjEwIC0wNTAwLCBTYWtpYiBTYWphbCB3cm90ZToNCj4g
UGxlYXNlIGRpc3JlZ2FyZCwgc29ycnkgZm9yIHRoZSBiYXJyYWdlIG9mIGluY29tcGxldGUgcGF0
Y2ggc2V0Lg0KDQpEbyB5b3UgYWxzbyBoYXZlIGEgYnJhbmNoIG9uIGNvbnRyaWIgdGhhdCBJIGNh
biBwdWxsIHRoZXNlIHBhdGNoZXMNCmZyb20/DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IE9uIDIw
MjItMDEtMTQgMTowMyBwLm0uLCBTYWtpYiBTYWphbCB3cm90ZToNCj4gwqANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0N
Cj4gPiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jICAgICAgICAgICB8ICAx
ICsNCj4gPiDCoC4uLi9xZW11L3FlbXUvQ1ZFLTIwMjEtMzU5My5wYXRjaCAgICAgICAgICAgICB8
IDQwDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0NCj4gPiAzNTkzLnBhdGNoDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVz
LQ0KPiA+IGRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gPiBpbmRleCA2YzAwYmYyNzRiLi42YjU0
NGE0MzQ0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUu
aW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gPiBA
QCAtNzMsNiArNzMsNyBAQCBTUkNfVVJJID0NCj4gPiAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9y
Zy8ke0JQTn0tJHtQVn0udGFyLnh6IFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmaWxl
Oi8vQ1ZFLTIwMjEtMzU5Ml8xLnBhdGNoIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBm
aWxlOi8vQ1ZFLTIwMjEtMzU5Ml8yLnBhdGNoIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBmaWxlOi8vQ1ZFLTIwMjEtMzU5Ml8zLnBhdGNoIFwNCj4gPiArICAgICAgICAgICBmaWxlOi8v
Q1ZFLTIwMjEtMzU5My5wYXRjaCBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIg0KPiA+
IMKgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRh
ciINCj4gPiDCoA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11L0NWRS0yMDIxLTM1OTMucGF0Y2gNCj4gPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvQ1ZFLTIwMjEtMzU5My5wYXRjaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMC4uZGQxNGMyNDBhOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDIxLTM1OTMucGF0Y2gNCj4g
PiBAQCAtMCwwICsxLDQwIEBADQo+ID4gK0Zyb20gZmU5OTYzNDA2NmUxMDc0YWFmNTVlODNiNTc2
Mzg1ODc3ZDdlNGJjYyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+ID4gMjAwMQ0KPiA+ICtGcm9tOiA9
P1VURi04P3E/TWFyYy1BbmRyPUMzPUE5PTIwTHVyZWF1Pz0NCj4gPiA8bWFyY2FuZHJlLmx1cmVh
dUByZWRoYXQuY29tPg0KPiA+ICtEYXRlOiBGcmksIDQgSnVuIDIwMjEgMTY6MzI6NTUgKzA0MDAN
Cj4gPiArU3ViamVjdDogW1BBVENIIDA0LzEyXSB1cGQ2OiBjaGVjayB1ZHA2X2lucHV0IGJ1ZmZl
ciBzaXplDQo+ID4gK01JTUUtVmVyc2lvbjogMS4wDQo+ID4gK0NvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOA0KPiA+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
DQo+ID4gKw0KPiA+ICtGaXhlczogQ1ZFLTIwMjEtMzU5Mw0KPiA+ICtGaXhlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNsaXJwLy0vaXNzdWVzLzQ1DQo+ID4gKw0K
PiA+ICtTaWduZWQtb2ZmLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVA
cmVkaGF0LmNvbT4NCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiBb
ZGU3MWMxNWRlNjZiYTkzNTBiZjYyYzQ1YjA1ZjhmYmZmMTY2NTE3Yl0NCj4gPiArQ1ZFOiBDVkUt
MjAyMS0zNTkzDQo+ID4gKw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIu
c2FqYWxAd2luZHJpdmVyLmNvbT4NCj4gPiArLS0tDQo+ID4gKyBzbGlycC9zcmMvdWRwNi5jIHwg
NSArKysrLQ0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBhL3NsaXJwL3NyYy91ZHA2LmMgYi9zbGlycC9z
cmMvdWRwNi5jDQo+ID4gK2luZGV4IDZmOTQ4NmJiYy4uOGM0OTBlNGQxIDEwMDY0NA0KPiA+ICst
LS0gYS9zbGlycC9zcmMvdWRwNi5jDQo+ID4gKysrKyBiL3NsaXJwL3NyYy91ZHA2LmMNCj4gPiAr
QEAgLTI4LDcgKzI4LDEwIEBAIHZvaWQgdWRwNl9pbnB1dChzdHJ1Y3QgbWJ1ZiAqbSkNCj4gPiAr
ICAgICBpcCA9IG10b2QobSwgc3RydWN0IGlwNiAqKTsNCj4gPiArICAgICBtLT5tX2xlbiAtPSBp
cGhsZW47DQo+ID4gKyAgICAgbS0+bV9kYXRhICs9IGlwaGxlbjsNCj4gPiArLSAgICB1aCA9IG10
b2QobSwgc3RydWN0IHVkcGhkciAqKTsNCj4gPiArKyAgICB1aCA9IG10b2RfY2hlY2sobSwgc2l6
ZW9mKHN0cnVjdCB1ZHBoZHIpKTsNCj4gPiArKyAgICBpZiAodWggPT0gTlVMTCkgew0KPiA+ICsr
ICAgICAgICBnb3RvIGJhZDsNCj4gPiArKyAgICB9DQo+ID4gKyAgICAgbS0+bV9sZW4gKz0gaXBo
bGVuOw0KPiA+ICsgICAgIG0tPm1fZGF0YSAtPSBpcGhsZW47DQo+ID4gKyANCj4gPiArLS0gDQo+
ID4gKzIuMzEuMQ0KPiA+ICsNCj4gPiDCoA0KPiA+IMKgDQo+ID4gDQo+ID4gDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNjA1ODMpOg0KPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2
MDU4Mw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
dC84ODQyNzA4MC8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWw0KPiBhbnVqLm1p
dHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

