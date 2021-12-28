Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D657C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 04:20:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.34941.1640665215347844046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 20:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iW7L1qqG;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640665215; x=1672201215;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=cJG0/banXJJi0ogeQIiSRokkqbXyaXZu2kQ6XSNGTIc=;
  b=iW7L1qqGu/XAuQNv0n+FsaoWnxkm5CmjLP8I6nwDUDQ/yoz+oP1mymX2
   0/hjoL3vUcuDbvSnLWEaVY+N0MbXzARmKtVuYmuh4pr9RCLmlbxxTmyFU
   nCwIT0cRn4+8dTvd9EXZUt0jpybOjlgXIvNQYvVfMgxzLib7inkJNXKu6
   AYYHcjHq05kDUVF+IhCCAc1CHtTII/fX1Ei2i4aTuYgfup3K/p/lKlgno
   ySVGu9JH46SLfHMI0WmoV5K0WcVtwjDGX6lhpCEJaxjLCrU78QiMwcNNt
   ECMgHrJen9DdOxXjZHBya9FeWJVBGLoL7rlHt/qs26V7srSeMFLgtj1XP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241259367"
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600";
   d="scan'208";a="241259367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 20:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600";
   d="scan'208";a="615531723"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2021 20:20:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 20:20:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 20:20:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 27 Dec 2021 20:20:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 27 Dec 2021 20:20:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY5lKg0vCNb+QS4AIn4D4DvI/q9DDLevlNfGAERdEqBtl4SH40x3OUY8LpqU5zXZpnB5Wya6dppCAu9yNLhW343JBkOQ3EXjxsBwEEjgsc9BNKfWfh+ElAMWMPowHETpU8GQQ0w9iBqbqFr95jDxOxZc3ZLuWnAtlqidHglGVenGuhLgO2np9B7a77j9lFK0lVfR63YdVPZEVC61CeM538dnEMJJI9miM9IGN02TeD1UT1Ho0Owd7KQE9C5eekAJXNh6KjK43MIDN11mHbjDL6fGsyf+udpC0cWnAEZuc0oldQqgSfaGEcRMb0fmif80REw3VDojGsf2tt+4M72/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJG0/banXJJi0ogeQIiSRokkqbXyaXZu2kQ6XSNGTIc=;
 b=ah4yY9Ju0ytO2Lfi68j6Jrd6KLo3BlJ/TGfSUgoNvai/slJR4hAg2NWEVmVwcJjd8jMXTYbpISbnafgyhstOqYEJiFfTKk+RGT/tLYNVxPvNfwpfw74vaMqmHb9lSKUXTclO1DMHbrawjlPRgxOWKlrRiYbA1Ekk5LYIRrmszKqBpyjiGiKPTQ5qGAkqLIiA2ZF0kprAewATXCbvCR/xrkb0yFrG8fegTcZanr1pbKrqGYQocy5g5xTzoic3NaFnU7Ilz9buijaBWpCN4ugqLbCsf0w8gJ23+hPbMqBCvRGc+ikNBh6L4HJbBlNZs7BD64x0xk87poOslsvyUiBHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Tue, 28 Dec
 2021 04:20:07 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 04:20:07 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][hardknott][PATCH] core-image-tiny-initramfs: delete
 populate_sdk task
Thread-Topic: [OE-core][hardknott][PATCH] core-image-tiny-initramfs: delete
 populate_sdk task
Thread-Index: AQHX8js1r0n9oHRA6UKuyHYRIIemC6xHX+qA
Date: Tue, 28 Dec 2021 04:20:07 +0000
Message-ID: <04dfa079bec1b6ce8f204a5c4a3bf42b5907b032.camel@intel.com>
References: <20211216050940.91694-1-Qi.Chen@windriver.com>
In-Reply-To: <20211216050940.91694-1-Qi.Chen@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1782bd9-6b49-4bfa-879d-08d9c9b95476
x-ms-traffictypediagnostic: SJ0PR11MB4813:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB48137DE0C22C24598869442FF8439@SJ0PR11MB4813.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IM7KSkjvqyLnlHH5FAgHkixZ/Zyu+XQ+OeVeSXdPQ7FCHrlVwSs2UbkViE5NDWrYCflvBjZqZFoL6HV0d0brmmQrNJSJFduIvyslXQ6P2PoGONZTGl/Ap0rwhm9fjTYIfIXR9NVTyDB4URBTAThwfqCM2osVe/YWSgFeEk1cx/+d8jpEKaJ/cgbgtGLNb7cbLydSTLkWkzuJqe6MiodInp0FSaR8lYx714uEGyrH/CWhI52eKiYjgq7QYNRRWad/Z4OLXR3+m1NLXnKypy+pN9oWyw1l/GmQ1HHWUzpkHVkh1hcSr5xiiLY4LQrEQRXP/96HWdc1UgxnBLpVwSzx0bvD8CnDm07DWUXkzOp9hHrm380Gdw+mPA+MZ+HIkQ3BaJjAeu67blf1krNc1iycWDbQSPByqSVzuOfcHys/Vxy0GjuL3kKbAblPqiPzZJ/d6ibpNHG9sdVdvwEjh3eJUmWmnqrVaN4lu3/MKT67GDRdZAWQf4HR1Uc1+3CaLkpYKgYFtYsasrtaVaaLOG7FBQzB2E9uH4py+2Z9e9pZtas3KzE7AhTBEZL24hxnK/DhTdDkL6EyCkpieRDv8KdAqImY7Cn+ZolXtv9RkoIruRkZquAhJ5ZnFySqzrEO+k5m/N7JRQIDINto/sY4MSVAmm2j11f+XVdgigHoYy2rMF6STfBt6Hl74j9uyg00RVcAuTHFUR/cvd2Sh9d/LtYFDYlL2wIn6yCDXFr3CdUNWTr0cnjc7pYb21s1elM4CvdlyM1Lu8Yfds6eMjZdTqL0w3wfnFEyNXXF/iVxufICxGLBahkaDFgSX5DeIjTRxlAitrA9VWhUQXpPibQ3nEZFgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(508600001)(71200400001)(6486002)(186003)(122000001)(38100700002)(82960400001)(26005)(76116006)(966005)(5660300002)(6506007)(8936002)(66556008)(66476007)(2616005)(2906002)(64756008)(36756003)(66446008)(66946007)(8676002)(4001150100001)(86362001)(38070700005)(6512007)(110136005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0YxMmsxUVNXVzBXREZFQmxyV1NrZ0NpUUlXcTlEZlBEN3FYMGI3UFA3Tklt?=
 =?utf-8?B?c2RwWGhBRGxoQWtTQ3VKNlZsMXhXLzVMeFBmLzJXTU5wT3ZiVGszZ0ZKUk5G?=
 =?utf-8?B?S0p3WGNLQXFrbFZ1MEtNTkFpSGhjRnRKMUxabmlXM2FaTXc1bnVtNnpsMDlk?=
 =?utf-8?B?clNvdWNNNVM0NHdmVGNaYko4OUhXQnZFTXQwWkdiYWVUT2w5eVdvS3ZEeUoz?=
 =?utf-8?B?TDlpWDRleTJlbWo1RFYrK3ZidklGUFViK09YUlJ5dlB1d0Rsd2Z1YWVKeWtR?=
 =?utf-8?B?Y09rRDNPU0F3aHV3UU9ZNXdkWHljTHd0eUsrK0lQM3JGeDQ3Snd3bmkxek1Z?=
 =?utf-8?B?T1RnQWJ4T0R0RjZDUzNyTjA3NE5NZDI5czJIY2l1VURaK0FoWCtSd1VHUmc1?=
 =?utf-8?B?a1lFTFBLK0VTQ2xvLzVmZGJBdUJmZndjM2ZMMTR1aDdBVTBRWkY5WFFveVRH?=
 =?utf-8?B?b1lEdnpocHRObE1KRGc3Q0J1QWhES3FCUUlKbm1rWGtxLzlwWkhyQi95K3FC?=
 =?utf-8?B?bjN2dmlUSFhnN054WWU1MkhqdFJUMnhYc3A3WWNRWkJocm1JRmkvK1BKTmNm?=
 =?utf-8?B?ZXRrVzVQbmpoT1VaWjdsNzZvNVI3OE1pZFVSTWVGT000N3h1YzNjUlMzTnYx?=
 =?utf-8?B?b3NWdWVnRGNnUzNRV0ZYZlI5aTJqTXJhbklFV0FwWG5IUVRMRng2TlJRYTJx?=
 =?utf-8?B?akVDZ0NTSzJZT2E2K25zRUFpRG1kV0RpM1JMMjBsWTlEVlBEZmRnWXpnQlQ1?=
 =?utf-8?B?T0diYXZOcnptTWZ4c2crZEpKVHp1Zm0wWUQ0T3E4YnRaTGErU3RkUjBjMkZU?=
 =?utf-8?B?M3ppSmtNVkFuRklMRXJ6V0lPUjFsbVNhVVNKbkFENmk1aFZGOVF6V1VBWkk5?=
 =?utf-8?B?di9mL0V5WDYrNFhZVTN6RFpwam94dkoxNkxLMDNRd0cwMjZtbCtqTzlxNUpp?=
 =?utf-8?B?WUNMWTVZKy9nQ0JYYU5VODRiaW1DMFArVUp0bFBneWc4WnNzTS8ydnBOMG9U?=
 =?utf-8?B?SW9ScW11V1pnVHNjcnRXVHY2L3hNeEJvNzRGekI4UEQwSzR5TksxbHYrRFdK?=
 =?utf-8?B?VFBFenplZlc2QUd6K216VC96ekVpU3VmY2RWY09vMUtvV0crNGpXR012eElp?=
 =?utf-8?B?SDBBakJRZldSR1llR0hpOGE4d3ZRTDdreVNlWXJSWFdrMUlGcm0yWUZtNjhT?=
 =?utf-8?B?SUZ0VHByZWpNOWFWOEhMNkdWbWZNc0FIQ1FqbzBLUWlyYTlUMjcrRC85SWdC?=
 =?utf-8?B?ZDQ3L0NYcVgvTFQ4VFpQY1RlSzhjTUFaMG9JYUsrYkhoSVRkTVJsSFRCdWt5?=
 =?utf-8?B?Tm1EZFR4T3VONzN2VWU1T3NFSHFNTWdqMzZ5eHZlK0ZHcHBPeE9aVXNkVi95?=
 =?utf-8?B?RVdtN09hYnhGR2puaEdqSlVOSlN2bGpRSVFIWWZWMytqdlR0VjMxUUtNc00z?=
 =?utf-8?B?RDJFa0dFR1ZQemZJT2diVHYxc254ZVFLOUJKdXpkY2hMNnp4SjBBcmdoclVa?=
 =?utf-8?B?ZFV2V210ZHdvNVF0U2lVY011SVFkdytVT1BwTENMRXFUUkJpOXV3RDJ3akx6?=
 =?utf-8?B?cjh2K1VzMnhOVFRWUVJack51ZGdwWHVnRkV1ejY0R2lLdFhIZExHTk5SUlRF?=
 =?utf-8?B?NGNNcWwrQmN3QnFGOWU4bzRIbC9YZENnNnlPbmxYSkNBSW5YbVpHUXBkSXhR?=
 =?utf-8?B?cC85U016SHJjclJ0UnlLQThoZWRpeGVhZHJVLzBZeFZabnNLVWpXaXgxUFhS?=
 =?utf-8?B?K0J3WjFiY2dXeEhWNEtDenlxOVN5N0tDZ2tpdkQ2bSs1M0M4YXd6cXBRSkJQ?=
 =?utf-8?B?ZDFweXhqZXhrUkd5OE5XTEVoRkQ2K3hlcURYUm1ZeWJKMEwvK2hydXVPRFhD?=
 =?utf-8?B?cEUwNS9iMHBtNmd5REh5TmdZc1Z3UjVxN2l0QzlxSVh1RlpsMzR5RHNDcm1I?=
 =?utf-8?B?RndrbytkR2YzV0hzZG1Qd3dkdkJjSzIrKzZEUEJpRVZocGRoRUVqWlJPRkg3?=
 =?utf-8?B?NjZuNlpBSDVCK0VUQ0NBMEExYTFrd0c4WmpYSWxObEZUZmZETzRKZE1WOThO?=
 =?utf-8?B?eURMVURsTTBOZTNKamhVSkRFNm1HTVVzaDV3VmFkUkR3c3BzSDlmWkhMNDZp?=
 =?utf-8?B?aGpVa3NpV2phM1N1UWE1M3lTLzRYQjM2N2c0d1FER3VBNW96aTMyeGNucE8y?=
 =?utf-8?Q?Xc7Uh9VunbuF7NKfyhghStU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B144A88BEE41BF42A5A33C07195F31F6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1782bd9-6b49-4bfa-879d-08d9c9b95476
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2021 04:20:07.2197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hkuIl/ruCj0tFLv1z8jl00hXtEA5wgKUv2+MNeAFDniFSVIHJLFDV3HQ6PgmzyRGvZvNyokVHz5SjB0FmxS3jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Dec 2021 04:20:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160035

T24gV2VkLCAyMDIxLTEyLTE1IGF0IDIxOjA5IC0wODAwLCBDaGVuIFFpIHdyb3RlOg0KPiBDdXJy
ZW50bHksIGlmIHdlIGRvIGBiaXRiYWtlIGNvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMnIGFuZCB0
aGVuDQo+IGluc3RhbGwgdGhlIGdlbmVyYXRlZCBTREssIHRoZSBmb2xsb3dpbmcgZXJyb3IgYXBw
ZWFycy4NCj4gDQo+IMKgIHRhcjogLi9zeXNyb290cy9jb3JlMi02NC1wb2t5LWxpbnV4L2Rldi9j
b25zb2xlOiBDYW5ub3QgbWtub2Q6DQo+IE9wZXJhdGlvbiBub3QgcGVybWl0dGVkDQo+IA0KPiBU
aGUgcG9wdWxhdGVfc2RrIHRhc2sgZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlIGZvciB0aGlzIHJl
Y2lwZSBhbmQNCj4gY29uc2lkZXJpbmcgdGhlIGZhY3QgdGhlIGl0cyBTREsgY2Fubm90IGJlIGlu
c3RhbGxlZCwgd2UnZCBiZXR0ZXINCj4ganVzdA0KPiBkZWxldGUgdGhlIHRhc2suDQoNCklzIHRo
aXMgbm90IHJlcXVpcmVkIGZvciBtYXN0ZXI/IElzIHRoaXMgaGFyZGtub3R0IHNwZWNpZmljPw0K
DQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hl
bkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29y
ZS1pbWFnZS10aW55LWluaXRyYW1mcy5iYiB8IDIgKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2Vz
L2NvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMuYmINCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFn
ZXMvY29yZS1pbWFnZS10aW55LWluaXRyYW1mcy5iYg0KPiBpbmRleCA0NzQ3MDg0OWVkLi42NmM3
M2U0MjYxIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29yZS1pbWFn
ZS10aW55LWluaXRyYW1mcy5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29y
ZS1pbWFnZS10aW55LWluaXRyYW1mcy5iYg0KPiBAQCAtMjMsNiArMjMsOCBAQCBJTUFHRV9GU1RZ
UEVTID0gIiR7SU5JVFJBTUZTX0ZTVFlQRVN9Ig0KPiDCoA0KPiDCoGluaGVyaXQgY29yZS1pbWFn
ZQ0KPiDCoA0KPiArZGVsdGFzayBkb19wb3B1bGF0ZV9zZGsNCj4gKw0KPiDCoElNQUdFX1JPT1RG
U19TSVpFID0gIjgxOTIiDQo+IMKgSU1BR0VfUk9PVEZTX0VYVFJBX1NQQUNFID0gIjAiDQo+IMKg
DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTk3
NzIpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS9tZXNzYWdlLzE1OTc3Mg0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9tdC84Nzc2MTQ1Mi8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRk
ZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKg
Ww0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IA0KDQo=

