Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39100C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:42:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.87.1660236163815681748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Hqu68zkh;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660236163; x=1691772163;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MKaW+lm1iWi3SwOCevLrZ/1FFmvwhmw0cEPd6ubUyX4=;
  b=Hqu68zkhHz82HG2OnM+A37HLo3A0yOt9FLIklTYcigkewd545p+ScnVh
   GwAiVwqurx2Nqruva3u6VJKkDuIzhqzVRdkTUAkKXO+lqNiRxQZDf0RqD
   93KcylxvZcfA6xRODVRyU2oE4BaYwzDqgfxB66dqr0l8daNPMGKAqgCG/
   nb564JYaEJFxHCFyZHbKdpEHryUkvJhaxdEbInhTolNjT9swBgIwl39Xu
   64v1ykEaRJuVDZixbhWqcksOAEvT5jgSEz9rP7dbvwgtvqv3y7p67Omj3
   i5GzxBBxyQV96UqcI1DYIFYkUSYr/8vECsB3jlwpQwqVcmtPi8/lUJXXn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="353141454"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200";
   d="scan'208";a="353141454"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 09:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200";
   d="scan'208";a="608986466"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2022 09:42:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 09:42:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 09:42:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 09:42:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 11 Aug 2022 09:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwgQy6GkZGH1kwcanLj8f56PZ6RHCn4HM+pr30qEpvdQXjd+OOOchOKPesGIQViJENFjY/WJpXaDGmIAhX4EpoRCg++CkZ3E9HNosLpDkysTpWXAfEv3rF8Z3Bf95zMEwgqI5O8y2LmDJAjVy5vdOMe3oRxwXY+xZA3xc1G+Ks/4sKRTvwHeRLmgj8U8XY2qvcbJ69tTVxouGE8rA0S3qzkGtQNikzEwGYSU9Z6O5qpq8nWJFR9vGZPDNx4oXfx7zN2AABRVOBwLPDmK9Ap010KJof0w0wTCSWjg6intqVrgmr85C1XoJyfx5BOpCgl4GtKfbdUnbFcyzvjFBwas1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKaW+lm1iWi3SwOCevLrZ/1FFmvwhmw0cEPd6ubUyX4=;
 b=Cedrl2H0laqiBGFwV+q9Y3yQUvMFwa4xWxeB07keXiPbzTZHNzblDvyRZ/ljzied8JZ8rAwGoFHYYj2R3szF4lY532hO+ZOvijenYSr37nrS1Izk2Lh5+kiQ04nVm5Jmy7o15C0GfUHLSWhaBM9M0Gp9ojrNDlMS5MGNsvYkckuBtBL+sSNoLlBR0ATiArgIezGpREns64V4Dvx11WEegdNqlx7LY03svUrt1eirG90J7yhjL14Cq71TmMPp+Ej5moIQ2vK7MT5KWkk3aWAlVJas7vOjaCfHnZQRdcUcvyHoFau3lrxyOWitSMwYeuBBzKQWK29MewLZw2/JdftmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 16:42:39 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8808:8f88:c15f:733a]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8808:8f88:c15f:733a%7]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 16:42:39 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "trini@konsulko.com" <trini@konsulko.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Allow higher tunes
Thread-Topic: [OE-core] [PATCH] qemux86-64: Allow higher tunes
Thread-Index: AQHYrZitKOkfMZx9EUilg2PXgT+xr62p2VoAgAAOLwA=
Date: Thu, 11 Aug 2022 16:42:39 +0000
Message-ID: <f037201c52a8acd0bbc42b521e40795fb30b0359.camel@intel.com>
References: <20220811154005.4084669-1-trini@konsulko.com>
	 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68e48ed8-d761-4d27-9660-08da7bb8810a
x-ms-traffictypediagnostic: MWHPR11MB1358:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z9Stpkp9HTqmMTEe2jAVQIIIwuDd4uvANBPZAx+yFwP+D3wu4J59Af/s83qZjo+JhN0oCdVGwAOgWR2a3WYDyQbHzgFVsEEDgE8bqgpqjRDlzxTEDEVbVPtqW9LMEXxjFdIKpllePc80Omql8q7elHjQUGVRhYqqlGeH78P7zDhA4VvF/ek5675E0wt4gDtwu/IBulDdlcHzUJR5+VEurQUhVQprOADtlOBFtyh7CEZQLf76DPMTV+vP4tAYjJBNZXSfSkofeixuZMHZ+EjErVnCjer0Vd8sjdo2lpskDsM0bquT8lnRP/oW8uF6cdiaKE+P1I7BHuXo8ZrKDb87kMyTSryezKN+MHUrmkEVApnGeHBIvB0sVpOAzgTR8jfz2BYfIMqReeUDW3y3iGlIIUTaqfhzwzLgZlExtPE+rhbaxdhJNDsopEWMGdgDs2uRAqFrsTsoXxwhvk37qWCCW9YMxnlJIZk7FEXMVZCjtxSLfcchf/iW8qKhWGlE9n74hbpST2lrG9wEE/XyM/zQ077VXKQrOmjnnaYHTN/mRaFkMIs8FyOpIKS+seuzu+NguY91qLbRuXq0auLYHF2ewVof3TKO1IPHih3cIq2gtMVa6Cz9TlJCkTdzjLH4UjmiV/e80hLBNACmcuqklJOxCja2KDgdVnJsEAa+aqJiX9wGzQdMpp84/woX5L7g4b/h3bsmEuSUL2Fwbz8orymwkdtk9VFybskT4Stx5CZFhAe9lcU9PG572SF3xAjQOZLlr6OM3Zvg5ExtSpe0ujsN/BzEPw/GtbcCPmDBzRmkLmSXC3jsIkdEIxV3jnVo9RWGLGGHatKnpYJR/l/WNyKaBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(366004)(396003)(376002)(316002)(38100700002)(91956017)(64756008)(8676002)(4326008)(66446008)(478600001)(83380400001)(66556008)(36756003)(76116006)(966005)(66946007)(110136005)(54906003)(6486002)(26005)(86362001)(2906002)(4744005)(5660300002)(8936002)(6512007)(6506007)(41300700001)(71200400001)(66476007)(38070700005)(82960400001)(122000001)(2616005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVJVUit2clpNOWtldWtacVRZL0Y2eDJIc3ZVU0w5Q0lhL1EwdDlWRHNqc004?=
 =?utf-8?B?VGYzTjgrZW1ZMVpicnpkVUZXYjM3NFVhaEdPNVpkYU95cnZ0dXVZYnkxUkJY?=
 =?utf-8?B?TGd2eU1KSjBlTEl0enNaRkpmTnZyUk5JVTZGUW02U2NkYUpJU2RvZkhBMWNU?=
 =?utf-8?B?MVl4OGJ0bFEwZXQzdXBJbUZ6c0dWaFU0YlMyVy9PVkpxU080QytrOXZZc0Nh?=
 =?utf-8?B?VEpqVW5wYmsyQ1JWVU5MMVdyU2J0SHZDbi81ckhMQ3VaMHRLVmIxVkgzS3Y4?=
 =?utf-8?B?QUVRUENRaDRHQW55aVVtT0RuUlh3ZHN1RjRXR3lWd2ltLzc0M3ZGM211Zm1z?=
 =?utf-8?B?YnhxaU5yakFSZjFkQ1VRcGd5bEZUSTBQRHg0NUIzTEtXSGRiY2tWdFFDbUVL?=
 =?utf-8?B?UzZ1Y3RmUVJjeDRRbnYxUW15N3J2d24rMm1xYW4rTzcrOHJ0S3A3UGp6ZmNw?=
 =?utf-8?B?RDdOZi9nL0RiOUpqOUNNU09zd3dCNktvZnVFaXlKRjJKSG1ySDlEU3UrRHNq?=
 =?utf-8?B?Nkp4VjB2QWEvU0IyZzVGNkduV3lsYTVTL09zbEMxZ2NFRWVtZkJ1N2tZM3BN?=
 =?utf-8?B?enhUeDJxK05SWE4rRThjT3crSytqUTZCZnpUM2N4V2dvQzl4ZzduUUcyMXQz?=
 =?utf-8?B?RGJId0p3VGYzY2VmZ2hCeUdXcWtaU2J1T2R4WGk4b3dPYndpL1ByRjBDZmhT?=
 =?utf-8?B?UC9wUldFU1NaN0hPNU4xcG90cWszRnB6UEloNndQZC9FaXIwTGM3OHVZVkpJ?=
 =?utf-8?B?S0pERDlKd25qSjgweGYrTDNJUEJnTkhHSW91aEpqczZ6YjcxZXZzOVpCMnhO?=
 =?utf-8?B?cGwrU3IwZGlnMG8zaEYyWExmaURTSVNzZFJpRU9vOG43NjA3aVJaMzlvaWFQ?=
 =?utf-8?B?YlYxc3BlZmNUOHBaV3NQWnkyRGxPTlZ1M3c3UDF0SitwbmY3L3I0MVg0ajBW?=
 =?utf-8?B?VEplbnRoOEZrUlFDamhncFplaU16dHE3YjFCKzFjeUUvd1RWQ0UxSHg1bVZ2?=
 =?utf-8?B?UzRHS0EwM1B1Nm1Cc241UTNhKytsT3RCTXgyZnFwVGJKRnhxMFNrMGM4RjNP?=
 =?utf-8?B?b1NscmZZMEtiSEtKWk53aWc5eTlDSjV2d1diL01BdWR1dWF5aDFldVNIcVVq?=
 =?utf-8?B?M1owejVWOEhtZmtWcVRtTTA5RGJZaHY1MS84clExOTRKYzJTOW1xYzZRUW0r?=
 =?utf-8?B?UGJ2Z050Szd0R0N5UFFHaS9oZ1drTFpjZVk5WjZXTnA2czYwL0FNQ2NqRWVS?=
 =?utf-8?B?TkI1Zlc5SnZZU1R2anQyUTlDY2lOeHZmYVZnZzhGS0ZuVXpaTEZ1R2RjLzMr?=
 =?utf-8?B?ZGlsclpRRFVsOWxRYnYzY2ZyZEorcG5ieGVtckJhaUJlV2txMXM2bVVxajJN?=
 =?utf-8?B?Z2FZSlFvNkJSemN4ZmJmRk4yb0xjWDBSeUdFVGNicy9xTlBWMDREa1B6SUFX?=
 =?utf-8?B?ZEMzQjBOb1ZhK0VJeDI0NnBxb0tJWmI4V2I4aVdNd1ZwOFZWNUVCVWJlV1dp?=
 =?utf-8?B?QlI4Z1NQQ2MxZTFjNS85UTI1NGVaUjBETmZXS1dHSDRlazRSU3J2SFE2UGcy?=
 =?utf-8?B?WTdIRTRhNUM1VS9xRDBBaWtya000YnlCazl3WmVCaGkzUzFSaHJFN1JOK205?=
 =?utf-8?B?N1FNUzBiMkhTMStBbEY3ZUFhM2dJU2dyR0hYMGlWL1pZdVcza1NzSlVyemtN?=
 =?utf-8?B?VFVXbzBzTlc5Z1VmZUNOeEFmWmJqS1g5WkxKUm41d0Jtb1BVT0YwV3JGSDFq?=
 =?utf-8?B?WDdQUG1ySHBCMGtmcVd3cWVoTWQxMHh0QUJtZ2MyUHFZMVprTDZlcCtmSEI3?=
 =?utf-8?B?d3JQYy91WTVyUFdzS1V4V2oyYmk0Y2xDM1hwamY5U2IxUmJaZUh2alUrY0Jh?=
 =?utf-8?B?OFFZTUJiUkdiQloralpreEpIbnE4ZnNUYUIvc21zL0E3dmMyZzRnT0dsM04y?=
 =?utf-8?B?K0luTDVta1p3UUNhZk9HNXlGTXFHbVo3bXhHeTlxWDhhdWNzdzNjYytpTXpK?=
 =?utf-8?B?emEzekQya2cza05GNnZNa042RzB6bklYOWc1UTJFNVZCTEF1U09FMTE1VnFz?=
 =?utf-8?B?YlovTHNFV0hHajM3WEQveG1UVzRhVlptcmx6a1orb2ZtOFRXU3ZCNW9tYjJs?=
 =?utf-8?B?TFpFOStWVXRaV3hOUXNkT3VpUlJyMEErVjFqajhnd3Y2V1NZdklyR25OeHVk?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08D30C1D10B44B49B49D6FC0A70622F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68e48ed8-d761-4d27-9660-08da7bb8810a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 16:42:39.5187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 cpJvaR6LC9EoX9mopovVFOyawaUwLCCadY/ZXHaBxXByxN8bRNb1nug44uoIDui506oM3dB/qLl+gccdXCallQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1358
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:42:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169257

T24gVGh1LCAyMDIyLTA4LTExIGF0IDE3OjUxICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gWW91IHdvbid0IGdldCBBVlggb3INCj4gYW55dGhpbmcgbmV3ZXIsIHdoaWNoIHJlcXVp
cmVzIGFkZGluZyB0aGVzZSBpbnN0cnVjdGlvbnMgdG8gcWVtdQ0KPiB1c2VybW9kZSAoYSBwcm9q
ZWN0IEknZCBsaWtlIHRvIGRvIGlmIEkgaGFkIHRoZSB0aW1lKS4NCg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjIwNDE4MTczOTA0LjM3NDYwMzYtMS1wYXVsQG5vd3Qub3JnLw0KDQpJ
IGRpZG4ndCBub3RpY2UgYW55IHYzIG9yIGFuIHVwZGF0ZSBvbiB0aGUgYnVnLg0KDQpUaGFua3Ms
DQoNCkFudWoNCg==

