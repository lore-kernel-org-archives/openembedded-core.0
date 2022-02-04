Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2549C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 08:39:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.6970.1643963961285476652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 00:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OMJd+jrR;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643963961; x=1675499961;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=/UAPSnLLDaD7qvUngEmHztw+NR8ubCQ8o2IEupQAiBw=;
  b=OMJd+jrROwIVgzcekOJbuZlNDA0bXWq1KNu4Dx7PuXH/GvpyJIiLgdYm
   GfjgOBZzGrXC2/zEbo3nViln1GyrQZL0hnor/HJyhC1VwqAxmH6O+H6Um
   JWaScah4zKqddLd2f/4TGTu/6fJdGyTkA6AbkpcaDciAjcZxCcf6++JRv
   yE34jZ1PBYnZ91MQe8z6gHstesQ6w30TCIA5i5WbnLGM2J7cN7qtodFo0
   dyYB4whO3rztOOeTjy7QSgmvVrwwKe1SsbdgAAbR7lUnqfbFfqSl4Jfdk
   ZAUgZGkkB6BDLPQsyC3+voH18CWYMHnng77V6n4HhS3BszPvPFMVHUlII
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="231901094"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="231901094"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 00:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="677044777"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2022 00:39:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 4 Feb 2022 00:39:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 4 Feb 2022 00:39:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 4 Feb 2022 00:39:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpZkebQw058BGIUYD+Q7OCa9HXU+9SGRzOxKVex8XH5U/3pzq/ty0iT+lWbog16Uy/hFYfR5EpBjo2g40U0/zVCQcGlMWFrWIzGjEdqlvt0i+5Z33aURSP1iQ1IGjk9gDa3UMFSA3h6Iw0aajNTraC5XhgKpKI4dsqQD3MGZsMHdRnS7c4TitupCg3wR+Uxoqqa+6Ltdr+HZ6+O+1XQ6655YzyfSvzWdNDhWm6CzeVVXH79lKZbXo/amuTp7GXCJ6aSlQlq//LYJs8u3XN6of1lyUNwOf0bqf5ZHNi30LlUX9fO2N5B0XeqUxwUsy+m4ZtIpeQcN7cxvRRuQS2LCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UAPSnLLDaD7qvUngEmHztw+NR8ubCQ8o2IEupQAiBw=;
 b=RLBpu7jFwM9DunZjWcgCj9HT/GuAFkV6LlDO1Se7To3C+LxyO/ZBKXQz3iFns0OANxhzbYvbWZGCdriIp0m0HWWqOJDbEXrU37EzaIYQqX8NjGnAcwhuKa1Fe2ZPB00CtEiBcl8hY1/FVI69Jn9+ZcOxXshVejNSq7RXqzjMZ0PclRkoSCHXosp/RDXTJPN6mQVvmnmicgWwbYObd9G6AzWac+3XSPFm62JA1vvRv7odR3SQHgkiofkSLuoO68Mlc5iEImsgGCPHuLCCcfgHmz+UhLFgLqxsbk+jKvV8ycAr5FbKHnze/krqESrfywM3NJW+QKv5l7P5VgdQcvANtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by CY4PR11MB1416.namprd11.prod.outlook.com (2603:10b6:903:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 08:39:18 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 08:39:18 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sakib.sajal@windriver.com"
	<sakib.sajal@windriver.com>
Subject: Re: [OE-core] [hardknott] qemu CVE backports
Thread-Topic: [OE-core] [hardknott] qemu CVE backports
Thread-Index: AQHYGFhKAux3cVqHoEiplc6r+R0zPqyCwASAgABUrYA=
Date: Fri, 4 Feb 2022 08:39:18 +0000
Message-ID: <182579ff199aab46ec81d3be509f57e121cdda08.camel@intel.com>
References: <16D00495D34D3FEC.20712@lists.openembedded.org>
	 <69dd692e-28b2-7787-2582-16f9c5f0c662@windriver.com>
	 <16D077FA82954948.24434@lists.openembedded.org>
In-Reply-To: <16D077FA82954948.24434@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1504827-7118-42c3-faa9-08d9e7b9d593
x-ms-traffictypediagnostic: CY4PR11MB1416:EE_
x-microsoft-antispam-prvs: 
 <CY4PR11MB14162B8CAE581A33BA427A55F8299@CY4PR11MB1416.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zoQdRBPqAylbEAwFCi+q1y84iKRx2CAoyH04qUc+ZRdw+m3I9UktQnH/ybWJkCtmwg8c8CUSFWx23elEKfcaEqxSKYOkRWyyAg3eU6uhblcLbZJYv2puaUuUZ60iQw1oulQuv+4lD9utKziwd/Ph+dZByfUOtR5nf0JBj6LN2S21ZJouUvT47eItAyB/r/ZrHgd+L1DCvkuZDROYw9fhDKiuacf0TvTvitMq7i0r75lha/YzjnRD9WjM8mLOkd8VL2wn7w/PWeQqmDhdJ4R5UIvsn61Hb+3tDkQDekM+EcCWIaacIgSjn46WvhOuy87nKPJpmycRi5InuSxrmVmTRvnYlDuTCPr4mrqhLuBWqzw8Q+xyiMN76yN2ZIFSpscDaOslzLfnbaakHeQfMqNIjY48IcjpwzFqr3hRt14W0AX2bQ7Cqs1NzNuBrtPrOvKlysosxaZmo1cE8nEKB7+vYnLSz+D15718rAPYPi2rVhWLbXvmwvMFgLAN4CUOkEzN6q4fyFKt1MYP6/P4anFQEkbxNaC5YsqRBW/TyfPoNsrBScF3nAW2hBaBDAlT/DwaeQmWv+pVGIK2nHU/RwxrN0GSJiJ48H9eBeLUk4JXtBAlqqdbSxSuEwEdTB0Jeh9zIF/9P4+DKWa5Q799DdMJreYjvaLkGTJN2lbIe9et5ohk9FwYv/L6GGeoz28Szp2ASirqxLCAyrVNwVppCFE2xXW49BWpXDYFmD/uxwtaa2lVC94+Lqv3WMoo6myntbxsRHihovO23cBAlgHPBJnm/NUWvPZgH+imL4VnLihZn0iFlxWjyADFxc/rkaR+7btfO4L0I5XUeR1Kb7LGJsfwSA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(64756008)(66446008)(66946007)(8676002)(66476007)(82960400001)(66556008)(86362001)(6512007)(4744005)(122000001)(76116006)(91956017)(110136005)(5660300002)(38070700005)(316002)(2906002)(38100700002)(71200400001)(6486002)(6506007)(26005)(186003)(2616005)(966005)(508600001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzdBUGhWdXMrZjF0YVJLUlJNYlVHUVE0L1VRSFhUWWg1Y0V6NGtnRjlhZmQx?=
 =?utf-8?B?VnlENVk2WExYWmoya3lhRXArT1FMU1hsVHlPbXM3U0JUdHUxaVBsclRLdjJp?=
 =?utf-8?B?ZmM5SmRibFdHSDN5TVZySy9hb3FDbEw3M1hDRzVLejFVNy9MamVpK1ZDOUZ5?=
 =?utf-8?B?bWlqNTBiU3QvQlc2NHhSRU5tVTd5RnhLLytJMG1xZ1RWUGZ1dlRESS9mN21R?=
 =?utf-8?B?ekdRdjU1ZmRQL3FNaVJraDBwdG5FVDdSeUh3STFkaWV2UE15S0xic0Q5aUxy?=
 =?utf-8?B?aHorc1hma0M5VmhydlZKNGZlSEVvQnhhWHlseXNSNkNyWkJBbVhIalJOT200?=
 =?utf-8?B?R241M3VUNEdHcFNNN3h0dWRTZTJUdVcxVHZJSUg4NENRZkJwbDJRYXNqOTZ5?=
 =?utf-8?B?U25pZ05JRnhVd09vQjNSUHhyVGk4MkQ4M3hlcDRTUHhpa2I4R2RreTdXNitq?=
 =?utf-8?B?Mmp0QndOeFVUS3k0MFhmdzdXTVhaZm5vMkx3NGZoZ0lVUVVVUDE5N2Q4L0sw?=
 =?utf-8?B?ZENPZ05pdExJeWFTWHEybDZQcWlMTnNIMnVNYkpWK3JIVUpYYTFrcFlZb095?=
 =?utf-8?B?N1FTak5XcU9QVFpsMGhLZFlmdTR1YjVSWTViQjdkNGRtbDVkVVJlLzJxTERh?=
 =?utf-8?B?WDJiUTNLRTNDeVNYRGxUVk56dlQ1M3BlTkRpbGh5VGtOQjVTUElPWitONUhJ?=
 =?utf-8?B?Q3FqRFJEKzY5RUZMbklMc3RZaEdkWklVUlFNL1ZOcjloNW5kWWs2cy9NcjhK?=
 =?utf-8?B?cnBmTmIzSURuSlQ5Q1owa2NrTUtSK1hqQ3NiTVN0dnRmRkR3TzlGRmpiQ2g5?=
 =?utf-8?B?VzNFL3FvK1lTWGdTc0FxbnJNcFc3U3NiT3pwV1dJQlV2eHhMMFpEYXM3TjY5?=
 =?utf-8?B?a1FCZDJyNzduQUlHTDZ2c3lMSlVidkRkTnJDaUNKSCtwWHIyazFkVUxzeURV?=
 =?utf-8?B?alFSa2tUWE1BSmMrM3VEN0FKV1JBTXpWL1ZkU1dCYUs1VS9NTGZUVEpkekpH?=
 =?utf-8?B?WlF5azFGeTBuLzlIYnIvajdiajdFUTl1LytOVjgrOVQ0ZW8xVUUyb2E5UWcx?=
 =?utf-8?B?cElUTFQ2cHhoZlNtWDUvVUk3V3Vob1FCM2xoWDk2bTB2blI3YlVmUVVSbEZN?=
 =?utf-8?B?MFEycktaQUVPNHZzaDZzSmJOZ2RSdjBFdWJWYlFNdUk5Y09HUUNiVmpnSFVj?=
 =?utf-8?B?Q1JqOTdvYlBPSkdsUlhwV3prT2dwbDBrd3l6ZzRBQi9JbkU5M2tKT251bVdl?=
 =?utf-8?B?a0lXckJkZnYrbU5IbEYxWGRmUEN6NVY3SURTVFR0U1FKZldXSVZBUFkvazYv?=
 =?utf-8?B?UWM1RzNKemMyQXZUREdwWHk0ZTFBOGdrSUQ2VmIyM25xVHhuajcxSmNoNTNv?=
 =?utf-8?B?UzdsZ3BjbEVlMU02ZDhVcTRqdHlwb3dPUEJuVk04SmM3anN0YTc0U0xBalZm?=
 =?utf-8?B?MXNRU3NkM29KcGhFQjJBNkZnVk8rUldxdENUb2R6cFZxa2VFT3JsN2hXSUdl?=
 =?utf-8?B?clNpNGN0RDVFWEladW9teldmZTFQQlhoRzk2MExKK3pwaCt3YngzalVTUVhX?=
 =?utf-8?B?eVQ1MTYyZi9kSUoxMThKUUdNZDBlRzhqek85TGFvSzIyYnkycFZzbWhTUDgv?=
 =?utf-8?B?blNQc0QyeFhhaFhoRU5ZSHdJUmVMb1AyVEt0MGcrQ1dicGM5QUY5c1dTdUs5?=
 =?utf-8?B?ZU5mSUNPUk9iQjArTkZzTTF4VS8yNVBzRTRuNWVOcFlyTStTeExtc2pVOERN?=
 =?utf-8?B?eDU2NFFLK3V0dGw1R0UxK2NuUytIb3I5NG96bFBhMTZjS25WcWM3Q3hpTURB?=
 =?utf-8?B?a3RiOTRDQ0pHVUdiYXZ2MnpxT1VXalhaY1U1NkJ0SFhld0hPeTVSWjNreFRT?=
 =?utf-8?B?RFRHdjNadEVUeVArbDdlTDRQQVE2WkFIWk5yVENnOFVERUd4enVLd1NxNFQ3?=
 =?utf-8?B?dTNlb1F5SU5OeUZ5M0hEWnI1U2h6NzBKQ1RIclh2NzBvUTc3czVRV3JwNllt?=
 =?utf-8?B?YXY0Vk56LzBOWFk5YW9kT29RUDNxKzN5RnY4TXlDMTBUcXI2SFRtWm9iRjFD?=
 =?utf-8?B?dlg2WFpPQktSemhBMG1jZ1pDa1F5dmhHS0RYbXJxazExSDdLWExtUmsyZXJD?=
 =?utf-8?B?cjJNS2RERWlJKzBhZ1JLOEo5ZU0zZURqM2NuZFh6VVFZS3A3ZWtwRXM4WEU4?=
 =?utf-8?Q?T2eNGRcWEN+1dINaL/3Z07E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DB5154BFA55634DBCA30458EEFDBA01@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1504827-7118-42c3-faa9-08d9e7b9d593
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 08:39:18.6909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YGYkWRyR4lksKkfIeTsgMlKqmo9/G9p9+0laAHvtx/31+8l0qsnqKI5zv8BRnfrm5uIXNip7NHaGkZlXRhSTMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1416
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 08:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161341

T24gRnJpLCAyMDIyLTAyLTA0IGF0IDAzOjM2ICswMDAwLCBBbnVqIE1pdHRhbCB3cm90ZToNCj4g
T24gV2VkLCAyMDIyLTAyLTAyIGF0IDEyOjAxIC0wNTAwLCBTYWtpYiBTYWphbCB3cm90ZToNCj4g
PiBIaSBBbnVqLA0KPiA+IA0KPiA+IFRoZSBwYXRjaGVzIGRpZCBnbyB0aHJvdWdoLiBIb3dldmVy
LCB0aGUgcGF0Y2hlcyBhcmUgc2VudCBpbiB0d28gDQo+ID4gZGlmZmVyZW50IHRocmVhZHMsIHRo
ZSBmaXJzdCBwYXRjaCBpbiBvbmUgdGhyZWFkIGFuZCBwYXRjaGVzIDIgdG8gOA0KPiA+IGluIA0K
PiA+IGFub3RoZXIgdGhyZWFkLiBQbGVhc2UgbWVyZ2UgdGhlIGNvbW1pdHMgYWNjb3JkaW5nbHku
DQo+IA0KPiBUaGFuayB5b3UuIEkgaGF2ZSBpbmNsdWRlZCB0aGVtIGZvciB0ZXN0aW5nLg0KPiAN
Cg0KSXQgbG9va3MgbGlrZSB0aGlzIHNlcmllcyBpcyBjYXVzaW5nIHRlc3RfYm9vdF9tYWNoaW5l
X3NsaXJwIG9lLQ0Kc2VsZnRlc3QgdG8gZmFpbC4NCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84MC9idWlsZHMvMzA4Mw0KDQpodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg3L2J1aWxk
cy8zMTI1DQoNCkNhbiB5b3UgcGxlYXNlIHRha2UgYSBsb29rPw0KDQpUaGFua3MsDQoNCkFudWoN
Cg==

