Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17B8C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 14:38:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.12904.1690382315241789900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 07:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UTbV8vkb;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690382315; x=1721918315;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=9BW5gu2e1PbuN3NUUApKw2rY4OTjeLoyzWz5FaD0p3s=;
  b=UTbV8vkbR1u45rVMcwmJ4usNu5yxXb3wGNSIaEsbC0mz4wTnv2Qbcoet
   pYafe5iz+1drLzLn2pMlaCe9y9haKU6iQG4GlbHunY09uZbC7TtTwdLDw
   2nkLuRbY45eHjYN6H37VFXSIjOLzysHaq44Gw+vxZp5+JMGKwH6KhXYWL
   LyO7L1LiVLHx/wdermZ/lvHJ+JDWxUsGbVOSeAF1bIIID3GP1s9FFJ/+4
   fnyHKRS55j5wAEeewwOfS5dmPK2aCC+ubi6dLUI0jWJggPxKfzI1+49Lq
   82kY//ZihwZxoFT6uD9pmAXHnOBANfmP7kpQlCiSXx2+lYhdfV2ox5zng
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398965420"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="398965420"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676736797"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="676736797"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 07:38:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 07:38:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 07:38:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 07:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G44/XYhr3OCETaIJjMXXRy46toU1lMjAbw59IlM/thU2thOh6+OirxK5fNlI1aIHl+dQjmtah4UMmewh2TB6C2655VqOhLiBllVk8sYxaGJalwO6YlyOHNXh7LSX+xjjva3iCnGEiD3VNid7NHggomj6PmuVgDGvBaM3KY0wiP+SBufto6tbDS34uQo5qDBb5ATbaDABQ0gUM1iTzg+ykLgUu0SEY1aE+SvD+hOhs6SFpnzv5/oUqhSd0TgtgOoBrduff6EIrN9PbTzOgMGYNfIWDXI0FmCzL6ps9cfUQWMPp7ipSwCriwkAvwxvWveAERkWnPPAN0xpPhwaK4/z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BW5gu2e1PbuN3NUUApKw2rY4OTjeLoyzWz5FaD0p3s=;
 b=W1e/qCk6Vi9sr3sPmIFcSbVn6/9rbqm8szT92zVxO7Qo2UZ3UR91Ah1FT8+q0xJwr51Fu6TfKUqQoIF78Wkwph/l8Bg4Qhu5Lu7Ta/bMUVXL8mah3SrNCbuH2g1OKYhAWaNsagbS2/kp+Hdtl9fuLEEvdSsIHoXgsaC02GzwGZYvPh9cHHyA389VTmgeu4TN/0yA9RIkxm/z183NVqdfePfxzZzktLqBW+HJSAlK5R4FMV1m2JfpyQY1eDNEc7xrm/JLYqZTWlq0Vz070Hx2IwqSTB1DKVtx64SjfAEiL1/YMKxEF75IoHFEihH0NVquOYC3eqkzWbm4EGcuV70yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 26 Jul
 2023 14:38:26 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6609.025; Wed, 26 Jul 2023
 14:38:26 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "hprajapati@mvista.com"
	<hprajapati@mvista.com>
Subject: Re: [OE-core] [kirkstone][PATCH] tiff: fix multiple CVEs
Thread-Topic: [OE-core] [kirkstone][PATCH] tiff: fix multiple CVEs
Thread-Index: AQHZv7f2H8DVL+4wxEyCrayvXWeI5q/MHjkA
Date: Wed, 26 Jul 2023 14:38:25 +0000
Message-ID: <c89200ee08c6ff526e99c2793a54744969293221.camel@intel.com>
References: <20230726115012.73524-1-hprajapati@mvista.com>
In-Reply-To: <20230726115012.73524-1-hprajapati@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH8PR11MB8061:EE_
x-ms-office365-filtering-correlation-id: f5373f10-8019-484f-7c00-08db8de5f89b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D2Aew8FOGAPS65mAUnjVbzzcVIi6T5v9bOrkqlXdNpGmfjG4yn0FZtIJeid63f/AsWcwYPoHQQI2JKXRDh5VgpUzxFrJL5A+UjEhJFxvWFRlayceIxUjFRaHF245FJ7IWOObMT0HtQbRaRIlH/d4Enc5Rjt3aVZSLtgCB9zUcZQ6V3PvoR5wAO4p29MzapyAnmBZCkCqZVAB3OvB2tpBHFdTQp4mo01c+1OZceTIvW+vUT6PV4B7X/qtuIXD98OpPiijCi6WIYqiIGmFqeTb3FRt0VL7+WSIg2zWCHZayzBcIjHp2LGrMf+pUXxcn9q3Uc2C2M+C/q9TeWODlKZkaYkzeoCofDxonvRGcXHZs51oOaiNimTuxw86rJzsYNpkSSsr4yTuSHrr+l6o0kwP5UU8soOzBkVn68fuHaQ5Y4DXxVPBqaAIKuVnUbYNoCKfdwhQz+XpKu/fFAhau/Fppujexnf55JtkVXBBSyKJf+R3OcRsalBSMbv1u5mhbTWE2Xqu29gMbToTyO0gfrID0YIVDV7eYJ4vtQin/uMbrCLZlV97XHJriXQu52tK4//P5kunN2QtRI3PIyaE8LPhHQhsTPSyZvkcfaVI1dA2JKI0ncApj+VRuHB/6oAMDgzqZDENEl1er0tv+92qdi0Hjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(71200400001)(478600001)(91956017)(6486002)(110136005)(2906002)(66556008)(83380400001)(38070700005)(86362001)(64756008)(66946007)(6512007)(6506007)(2616005)(966005)(5660300002)(36756003)(186003)(38100700002)(8936002)(26005)(316002)(76116006)(66446008)(122000001)(41300700001)(82960400001)(8676002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1VHQ0FnV3kyMFpaS0RDZk03ZjVoZ3hKUXZndmRqaENhZWQvWHJIL3Uxb3hl?=
 =?utf-8?B?OHVtN0ZXcXYxSG1WeUZlcGIvcmg5ZDgxQ3lVTzFyZGZGR0k4R2FNdlBuOFdN?=
 =?utf-8?B?eVpjUk5Wc2tROWp0YmdYcU1hOEVWWkVGTllEVW41RUE5YWJzc2hKajVKNlVI?=
 =?utf-8?B?cUpSR0UyQjdlK0gwVVYxMFVtOG9Pb2xBZ1psTUhQRnFSakNTYTVERFc0aUh4?=
 =?utf-8?B?NTh4UXVYdGl6ZW9XMzZXeDFqbnZIalV6bVNOTnUxWGxEc1paOEExTmtZdEVt?=
 =?utf-8?B?MTg5bHE3SWlXY0ZPVUx6RjJoc0s3NnhaMk5BUUlOc2ZlR2lyL2pTbS9xTUkv?=
 =?utf-8?B?TDhOUFdydyt2SnA1SVdqS3JLSXd1L2krcSt2STdYKzl1dVMyVGRqZHdrK3Fr?=
 =?utf-8?B?OGd2emJkVUxBNFFxUUtxWTl2N2hiOURHMG5iWVZLenF1SkVINnoyREx2Yllz?=
 =?utf-8?B?dmRsS2FvV05nek51cE9XMXZpeWUrSVpRQWJUTXhFdmlZZ1ZnVFp1OVRCTWJX?=
 =?utf-8?B?VXBTb0FpdVZlaWR3eFRHSHlEcU9uUVEyUFlkYVpjUzQ1c252WWZ3S1BwZ096?=
 =?utf-8?B?MzdOUTNyZmxBZVRSWitwZjJ2OFNQd3pGM05uc0JvQlpoZ1dKTnpMRUpKSjNN?=
 =?utf-8?B?N1BrVkoyQUdqSUlVVzFQcVRiMmVwa0FqbTlSTTZVaXBYeFhhUlRJRGZLSktm?=
 =?utf-8?B?d1k1bnlmTzJsd1FWRVZZcCsraG5HMGtwSkNDVGFXV0JIQUVCOWZmK05CeGxt?=
 =?utf-8?B?ampNRUdHcU9ZT3lXYVZXeHJZQXpVbEFqNEppaDRxaDNEYXJQenRRVWVQcVV6?=
 =?utf-8?B?czZEeFZjbG1aMnlKWFlWWmJlNUVLTytibVVPSXhudmd5TW8yOEF2elM1NWQz?=
 =?utf-8?B?Y2Q2UDVobXQwaFdJVEdmWjBGeWUzVEhtVE9YandteXl1QTFyWVJCMGZxSzBU?=
 =?utf-8?B?bVNPVEVuUjZxUCs2Zmg4cU90ZWozelJrN0VFTXdaV29IMGd5TG9XVGlpeTBO?=
 =?utf-8?B?cGd5anVqZjZzbWY4YjQ1L0RDdTkzZEJvL0IxblFUc29VcFhscmU0RmVXV3Mr?=
 =?utf-8?B?eGFEZ0d2UzZrYjlBdTRlMURUaWRTQjMvY0g3Q1owOEhBOEhyMW4ydzViUk5m?=
 =?utf-8?B?WWtDQm1adi84NUovTlJYbVdyMXVnWGltNVFPYjZHOGRhU0tPWDFNS0xMNmdx?=
 =?utf-8?B?ekdFK3pWWENsdXYvajdyckFtaEJOc01MbkhQMjUrZEJVWkVqNzQxVjY0ZWhW?=
 =?utf-8?B?VnY0NEpQUkpYdVlDeTRWbGFDQVg1bzdiWURpbVZQZGhJdi91V1BELzFxQ0k2?=
 =?utf-8?B?YzZxbmd6YWZrR2pUeERLWmRKWFpON05maFFIaE40R0o2YVlIT1RMTmFWY25O?=
 =?utf-8?B?WVZ6TDRUTmFWcjRtV2EwcFcySjhrUy9yQ3BUMXlzZGFFVDBxVFUzRUdhSGl2?=
 =?utf-8?B?YlF1TVZ1OWNrRStXc0pPbWVuOG1FajVSWnJYb0RwakVDVnJicjdKQ2Zva3Fr?=
 =?utf-8?B?MWhIUndrUUdrTzdUMDNiWEpER3htbWhwVzRZaHN6VVNaSEdlZXNQU3h6QTkx?=
 =?utf-8?B?bkY4VnlkNDZBb0N4cXVqMEFZYlNFMjZQa2N2WFlnOWhqWktFYkF0Wi9nM0c3?=
 =?utf-8?B?bG1uVHVPd1RrbGxMdERPeTBJaytnaVIvV2tqSzg2Mys5L2lsblRiS0ltUG9M?=
 =?utf-8?B?QWxoOG9vVjQ1dHd3RXFwSkY5WmVqNU1UalN3R0d5ZndzSUFZQnlDNDlqOXdQ?=
 =?utf-8?B?RHc3Y2Qrb0oxZEJxKysyN1ovM3dpS2xDd3NVLzVrT1ppcmN6RUNGQ2ZIcUFs?=
 =?utf-8?B?ZHhtYnZwc0RDQlRDZGR4eXVlYzN1R2hlU1JCMWRvRUJMRDBpNERQZDFUV2tR?=
 =?utf-8?B?Y1VrSDF6RGdXU2NzdVNza0hONUlGdHcyRFU2ekZVVTJNbnZmN0ZWSSt3WFAz?=
 =?utf-8?B?M1lRcXlXZ3NHR05jUzJ6NGZoaVJXaGhOZ21hQkQraDkwQTNJOGExS25zaGwz?=
 =?utf-8?B?NXBObFU2Z3phejRqdlpIaVo4bUY5VEZvTWVRcWNKWHNBd0JtMjh2RUlqS1Vs?=
 =?utf-8?B?bmFZU0YrV0FNQlRsQkNVcDV3cVVLN2JISkdCQ0FwRjJ2UVVjaXFNQnFWa1Zh?=
 =?utf-8?B?aUd6L1JCL21GZ2twSjVLekhQUlQ5dStPZlJ2U1ZyM3loQjZrUkJwMXd4bkFD?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15626F83EFE3AC42B3D63A983175B960@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5373f10-8019-484f-7c00-08db8de5f89b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 14:38:26.0778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SW2P6eIS58EP0ioZWRJV1USTUTMx5vOeXfTEhO6TK7Twa7rIU9u1Ad08BbDdzRK0xPOnQWgpVeRGJiDsZ7yhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 14:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184886

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDE3OjIwICswNTMwLCBIaXRlbmRyYSBQcmFqYXBhdGkgd3Jv
dGU6Cj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKPiBbaHR0cHM6Ly9naXRsYWIuY29tL2xp
YnRpZmYvbGlidGlmZi8tL2NvbW1pdC9iNWM3ZDRjNGUwMzMzM2FjMTZiNWNmYjEKPiAxYWNhYWVh
YTQ5MzMzNGY4XQo+ICtDVkU6IENWRS0yMDIzLTM2MTgKPiArU2lnbmVkLW9mZi1ieTogSGl0ZW5k
cmEgUHJhamFwYXRpIDxocHJhamFwYXRpQG12aXN0YS5jb20+Cj4gKy0tLQo+ICsgdG9vbHMvdGlm
ZmNyb3AuYyB8IDE4ICsrKysrKysrKysrKysrKy0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvdG9vbHMvdGlm
ZmNyb3AuYyBiL3Rvb2xzL3RpZmZjcm9wLmMKPiAraW5kZXggY2U3N2M3NC4uMmM1NTNlMyAxMDA2
NDQKPiArLS0tIGEvdG9vbHMvdGlmZmNyb3AuYwo+ICsrKysgYi90b29scy90aWZmY3JvcC5jCj4g
K0BAIC0yNDU5LDkgKzI0NTksMTUgQEAgbWFpbihpbnQgYXJnYywgY2hhciogYXJndltdKQo+ICvC
oMKgwqDCoMKgwqDCoMKgIHvCoCAvKiBXaG9sZSBpbWFnZSBvciBzZWN0aW9ucyBub3QgYmFzZWQg
b24gb3V0cHV0IHBhZ2Ugc2l6ZQo+ICovCj4gK8KgwqDCoMKgwqDCoMKgwqAgaWYgKGNyb3Auc2Vs
ZWN0aW9ucyA+IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHsKPiArLQnCoCB3cml0ZVNlbGVj
dGlvbnMoaW4sICZvdXQsICZjcm9wLCAmaW1hZ2UsICZkdW1wLCBzZWdfYnVmZnMsCj4gKy3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtcCwgYXJndlth
cmdjIC0gMV0sICZuZXh0X3BhZ2UsCj4gdG90YWxfcGFnZXMpOwo+ICstwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAod3JpdGVTZWxlY3Rpb25zKGlu
LCAmb3V0LCAmY3JvcCwgJmltYWdlLCAmZHVtcCwKPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VnX2J1ZmZzLCBtcCwg
YXJndlthcmdjIC0gMV0sCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZuZXh0X3BhZ2UsIHRvdGFsX3BhZ2VzKSkKPiAr
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsKPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBUSUZGRXJyb3IoIm1haW4iLAo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlVuYWJsZSB0byB3cml0ZSBuZXcgaW1hZ2Ugc2VsZWN0
aW9ucyIpOwo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4aXQoRVhJVF9GQUlM
VVJFKTsKPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiArKwnCoCB9Cj4gK8KgCWVs
c2XCoCAvKiBPbmUgZmlsZSBhbGwgaW1hZ2VzIGFuZCBzZWN0aW9ucyAqLwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCB7Cj4gK8KgCcKgIGlmICh1cGRhdGVfb3V0cHV0X2ZpbGUgKCZvdXQsIG1wLCBj
cm9wLmV4cF9tb2RlLCBhcmd2W2FyZ2MKPiAtIDFdLAo+ICtAQCAtNzgzNiw2ICs3ODQyLDEyIEBA
IGNyZWF0ZUNyb3BwZWRJbWFnZShzdHJ1Y3QgaW1hZ2VfZGF0YSAqaW1hZ2UsCj4gc3RydWN0IGNy
b3BfbWFzayAqY3JvcCwKPiArIAo+ICvCoMKgIHJlYWRfYnVmZiA9ICpyZWFkX2J1ZmZfcHRyOwo+
ICsgCj4gKyvCoCAvKiBNZW1vcnkgaXMgZnJlZWQgYmVmb3JlIGNyb3BfYnVmZl9wdHIgaXMgb3Zl
cndyaXR0ZW4gKi8KPiArK8KgwqDCoCBpZiAoKmNyb3BfYnVmZl9wdHIgIT0gTlVMTCkKPiArK8Kg
wqDCoCB7Cj4gKyvCoMKgwqDCoMKgwqDCoCBfVElGRmZyZWUoKmNyb3BfYnVmZl9wdHIpOwo+ICsr
wqDCoMKgIH0KPiArKwoKVGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUgcGFydCBvZiB0aGUgY29tbWl0
IG1lbnRpb25lZCBhYm92ZSBpbiBVcHN0cmVhbS0KU3RhdHVzLiBUaGlzIGNoYW5nZSBpcyBjb21p
bmcgZnJvbToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9saWJ0aWZmL2xpYnRpZmYvLS9jb21taXQvODgx
YTA3MDE5NDc4MzU2MWZkMjA5YjdjNzg5YTRlNzU1NjZmN2YzNwoKUGxlYXNlIGJhY2twb3J0IGl0
IGFzIGEgc2VwYXJhdGUgcGF0Y2guCgo+ICvCoMKgIC8qIHByb2Nlc3MgZnVsbCBpbWFnZSwgbm8g
Y3JvcCBidWZmZXIgbmVlZGVkICovCj4gK8KgwqAgY3JvcF9idWZmID0gcmVhZF9idWZmOwoKVGhl
IGNvbW1pdCA4ODFhMDcwMTk0IGFjdHVhbGx5IHJlbW92ZXMgdGhpcyBhc3NpZ25tZW50IGJ1dCB5
b3VyIHBhdGNoCmRvZXNuJ3Qgc2VlbSB0byBiZSBkb2luZyB0aGF0IC4uLgoKVGhhbmtzLAoKQW51
agoK

