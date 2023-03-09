Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62E9C678D5
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 02:33:07 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.4317.1678329179557500511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 18:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=fngAbnhf;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678329179; x=1709865179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+zZ9sI/k+afMsZCFE/JRJv1UXUEmG5mpsuIySYwU8AE=;
  b=fngAbnhfMxhk7GzZlDGTo1PR4Am4xYG1PmJ0ryFJTYzxOVG1NX+NgYEM
   mE58rlSrBo3e+MB1ITL7IFFzMQ2gOjWoxt4/A+z7mFb2Sy50/sfpfDQDs
   tJ61BpG9JCFBLcjre/weu3cSg3ERQsDtZgvPCSKaJeUzaQgi6H38a6Tda
   nLNq8jGLgA4WeaxadxnihqE2tbgf5o5/euzj9xBAiN3nOfhd875HzX7Q0
   Evs4WZd90HSuJBe96LlrgyHpDpZOOnrhbiMKacKMCK7WZJM4FPzMWbVRP
   blp9GS9zaz2uvyjDuJjy8ZGMH7qcjcqEi/PBBZHKXXFQsgrgeIAo87nh5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="401170827"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="401170827"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 18:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654584344"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="654584344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2023 18:32:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 18:32:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 18:32:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 18:32:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 18:32:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hherFwka6rPcxd1kCOjg3oFf3EVWZy4a3ftTYyygyrbBBiqSGHq9lR+qRyTKKOnYwPokTdmB9/O+hSlpi9jjSAHwyNM1ITLWsE1WDn3q3mL8A5ZdZgPpQFyCqcEsfr883aB2ykMd9Q9b9N79aMk9kbi/5rwTEUBzs71YQiWt1ZIle/TKmy+zshpz5a2Zjcsm7t/3Lqilc1d1bjbRdy5UopOnI6s8+OYUS7VH78L7UoIKqtrbt5pVdkJ1EhdgWkeg87C22fYDiveSeitCcvlvAMVN5rDK5YvTjXB5xs3CkoTL5AFT1Xz5z5MCIRCuV4hdqA4Zgz4Rbv1eiTxMujy10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zZ9sI/k+afMsZCFE/JRJv1UXUEmG5mpsuIySYwU8AE=;
 b=Lls5geLQxXaMvypl0YsU5T0D/RIND2lROwno4/ZnUTQ5TPDYX1WFBZczwYI8opCwdjtYYWsJtdrMB+tEYtAoL2MrETewHGl90l5DokinyN5ga75S+rKRQR3dBt/ji6HX1vWqOTv06zrfUzGyIKsNOXKk5cHHC53YPQL9rkJOI15NSsYBRtgVf0251PmX5+xZ2+lIHbYmK3tC2bknZlMgaC6Zg4thITgP/ZRlduDz5L+oWzS/JWnNAv4sJ5jMtqg+ON3dcF+AFoGchk9sIJBUYRmGbjC6Nvi+jYWxI3tIcqPv71cOg9HYJyR/8Is2gNOxg26znGdFoXuQpDXiE6jd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Thu, 9 Mar 2023 02:32:51 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::4df0:3471:da25:4a9d]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::4df0:3471:da25:4a9d%4]) with mapi id 15.20.6156.019; Thu, 9 Mar 2023
 02:32:50 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "zboszor@gmail.com"
	<zboszor@gmail.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] Inconsistent libOpenCL.so.1 expectations
Thread-Topic: [OE-core] Inconsistent libOpenCL.so.1 expectations
Thread-Index: AQHZUeLA/X5btJYYA06h7Ut4pj0Yl67xuxoA
Date: Thu, 9 Mar 2023 02:32:50 +0000
Message-ID: <29be1b4493e3a719eacffcb62410d6e60f036112.camel@intel.com>
References: <174A81466EAA9EC4.23983@lists.openembedded.org>
	 <b1a311d7-2a11-66ff-9698-29b95f1192cc@gmail.com>
In-Reply-To: <b1a311d7-2a11-66ff-9698-29b95f1192cc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|MW3PR11MB4571:EE_
x-ms-office365-filtering-correlation-id: 153ab159-5b28-4b9d-2f42-08db204693fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2UnERYdgP4sryv88kKejT50C9T2pcDixAWiFFHhGUjsbxVsK2NXMkjzaz0xfBqbyQngaKAn99AO4i4mXYe/q+u9g5xj9XkFzBTaFWHfXTTEj5Tk7Ky6V+0NRVKL/OI2SYhBcg6x++7nwbOnK1JogN1vagRBmcQ5hs/72BPQNxJJoziGyYgyT/MxHNQifZSXKhozPdGSt9+ix2BuvgOqsh+MxQGzgayxh0fXqiDs9YYpA2sJiNuZjVBmwYWDbHjCXL5zoWLBM/Io7s1CQ1m32WYcM8rukMQFNPdakTUpSRDDnCHM4+B2fYO8Ht1JzVUpfcJlteeF7RLaNfsMwX1wYONDmJTJ0mWsCBIsz4FFp+n/2KZkZX2Tf3gzutVJ24OQpCiE3C4CIJvEMST6bfI+t9IS/XrHVi+SBdjWnJ5hYBlyZPI1Y5m4dyuU/s3H6+Us/oZHhuwR/Amye3PB2XY0OEvl/C0kjt4voLMntS2etiAqDzl14pvn4rFUrXW5+W3mYb3ya6qPHWKtstSJxdd6M2M3DU4n2FWBBPPjrWs8yxKDzbDpN/G0bmrWsdFsizF3+8EsViB55/pa1u3mR7WRhsmfsF1yv7L6NRfxVA4bfVHiuwXJHJ02IPAdVwSopDj8EoD4WrZAIGJo556GUBvjZJgR/i7DaLtP/wftZJVcMMpMx7BAYPIxLPz0V0O6BkIz4zXeNO5JpFoji8yrtgPVAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(82960400001)(38100700002)(122000001)(86362001)(38070700005)(8936002)(5660300002)(2906002)(64756008)(4744005)(8676002)(66556008)(66946007)(4326008)(76116006)(41300700001)(66476007)(66446008)(71200400001)(2616005)(186003)(26005)(316002)(54906003)(91956017)(478600001)(6512007)(6506007)(110136005)(6486002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzJMZm8vS2Z2anlYYXgrbzUzMTFpWFZDbkNNWUZPZXAvbmVXOGFNN3cvbzJq?=
 =?utf-8?B?V0MzRE96TkxYYjBTSTkyeU84VHFaQ3V0bWx6dGhCeVBnRG14UTNkSHd2aUJJ?=
 =?utf-8?B?QW1rMDBqLy9jcmplUE1EMkd3a3RVeG5BZktlNWl2U2dxSlV1cDB3dVo4TFlO?=
 =?utf-8?B?L1VxVHpDTjE0dVV4V3VhNGRmeDRnNlE1eXZrTUM4M0RTZ1NWZWFTNHMyemRM?=
 =?utf-8?B?YkRjblJLK3kxcEhOWEJ5L01YazRvRGp0MDV3VFNLd0NFTDhyUXZOZ2dlZ1hl?=
 =?utf-8?B?M2J0UUkwWjdDRDFoRU5PUU9iakZoZ1BueVBXbm53eUc0TnN6WExhU1VPb3Y4?=
 =?utf-8?B?aXdjei9palJHZXlSK2FhVGdiRWFXNlh4eWhobS9nMVJOd0g0WEpyM0F5TGls?=
 =?utf-8?B?alhPOTcwUVI2UmNYakx6UlpkcWRIWWpLa29RR3NCN1YrL0dxdC91WE04SGZ2?=
 =?utf-8?B?WVlyRllFWnZCN0ZGSGR6dzFDTjJtUnZTMUpZTkdGbm9sd0lablpMb2JtR0R2?=
 =?utf-8?B?RmRIWmJ2Tm5GMUFKL0NmOXpWc2kyM05LaXZhSEpJaEtQOWlzZXFRamMyYmFN?=
 =?utf-8?B?N0xkbmRRRkFlUGJvUGJpMU4wbk14aE5WbHVkbzNocXkvd2kvUzA1TUo1c3dI?=
 =?utf-8?B?RnRNZ1o3UmdYblljZHV5eko0YXVMZVRCSmxCaFJHbHI2b0ZZcDU1Tmh1MWtX?=
 =?utf-8?B?M0VOOXFXdXFJMndrTDl1T0pRMjgvVFJEcDZCUHRpSmI2SXI4bTFhR21nMkZ3?=
 =?utf-8?B?R0dra1EwOVVuZnpXNTBBNjArRHVsbHJpMlp0a0Q4Ui9kcGRBZ2s0cnVaQm9H?=
 =?utf-8?B?SGNDR29ybnFrbWZjK2Q5d3k5cEhIQXFiMVp3Y25UeFBEN0cvcDNEbzFQQjkx?=
 =?utf-8?B?NmJNOGpRNExMMjRWN082YXd2bUJBRTk1a0s5bEpvQnNFV2preHJEdXFVYnlR?=
 =?utf-8?B?U29ydDAzTmg3S3pnZUtVN0ZKZUhxOG1vc3BmNi9ESytLajRJS1FrNnIrWElT?=
 =?utf-8?B?dnJTRDFnMWxWMzFxaFh6N1E4VHoyMmVxOVV6czRack9IdUlueXJUS2Y3MVZG?=
 =?utf-8?B?OVVHWVJCL1gvRmhQaFV0THhVcmxxMnplcEp5OVBIZmk4dlpTN0g2ZlpNMDlW?=
 =?utf-8?B?VTltblVWQmd6OW5CRWlxS0JLRmZJaTh3TllpSWN5QUpKUERxMC9OWWc2RElT?=
 =?utf-8?B?S0prMzAxRmF0ZDJlb1lkNDhQUnF3UmFnUjk5eGRrUEVPNUYzNkRWeHhqSTFj?=
 =?utf-8?B?Wi9tRDB6LzF6RFBubDQyQ0dLUXpLc3ZMRWNmVTNuR3Jpc0QweVR4MmUvMXd1?=
 =?utf-8?B?RW9Qa3h4cjRGUjhHemdxZ2txUVJhb001U0phWlFZd0YyeUxLWVpxdUxXKzBW?=
 =?utf-8?B?ODlTaFlwSWFDL0xpSEw5NFFXWHlGZTlXN0luSnpld3dXWVZneWJ1VUwrWHNz?=
 =?utf-8?B?U0wwbnNLbW1TSlZnam0zWEpnaXZuNmpwMmgvdUp2NmZlYStrVis3b2tiNWtT?=
 =?utf-8?B?YnFtbnVvdXZCcUNMTHo0VWZFRytOT2lhMnh3UGlCQ2Z4SUk1Um4rdmt0THBL?=
 =?utf-8?B?UXJWNkRNRkFtbXhzMEpudVJ1WjROWE9scXN1ZUtvd3Q3a3djTE5FZTRDSmF6?=
 =?utf-8?B?ZVlyRS9pb1RSbDNYSXpRSUY4V3QvUFVHUzNKSEhUVnVwemc0TW9BdU9vRHVl?=
 =?utf-8?B?VzZ0VW5ueSt3SlRXTjdmMGlqWXJsY2gremVWM1VKM2owb05KckU0ejN4NVk0?=
 =?utf-8?B?bWNZTUcxY2FpdHExaU1iNkZuRDdEcGtYQ1hSOUFyeFhMRHZyVzFWV21zcWlE?=
 =?utf-8?B?SzZVcU1zQTZObVQ5Q2FvMGZjWHk1Umx5SlZXUTU1MlJjMGNUZ1dzRHhGc1oz?=
 =?utf-8?B?RmZUZ0V0TUxYeWVUVkJGSnhzbnN0WHJtZklXTXQ5TWlibEZVRU1sK3BuYmJq?=
 =?utf-8?B?VG1nWDRxTHlXeWNJNm9xdTBQcktuQ1FxZUVvczFlWEdIQ3FTMFJVSml2cTI4?=
 =?utf-8?B?VlJOellaRGdCYzR0WFFMQ2FwdW5WN1Qyb21saXUrdi9qaG1OM3ZZN2pKWHVU?=
 =?utf-8?B?UGdTbDh0UE04RXArNkhwM3hRbko2YS8zYmpsZ25OaHdKNENuOFJDcndaY2RC?=
 =?utf-8?B?VVZDY3loTjh5ZStrS29PWkZta3VyQ1Q1TXFsbVFsZCtQcXorUEQ4WmRRZ3ZC?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4D9436F9A83D24F9545AAD887419716@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153ab159-5b28-4b9d-2f42-08db204693fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 02:32:50.5478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: at6g2bzbTiEZxg4FTM1fRneOXCgKVC/8dcMGT4qLZYaktFNbuoOfmRtK+ELumybkJ4RiW0+NoBJ0F+GuiXG0TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 02:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178208

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDE4OjIzICswMTAwLCBab2x0YW4gQm9zem9ybWVueWkgd3Jv
dGU6DQo+IEFkZGVkIGNjIGZvciB0aGUgaW50ZXJlc3RlZCBwYXJ0aWVzLg0KPiANCj4gMjAyMy4g
MDMuIDA4LiAxODoxOSBrZWx0ZXrDqXNzZWwsIFpvbHRhbiBCb3N6b3JtZW55aSB2aWENCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyDDrXJ0YToNCj4gPiBIaSwNCj4gPiANCj4gPiBJIG9ic2VydmVk
IHRoZSBmb2xsb3dpbmcgaW5jb25zaXN0ZW5jaWVzOg0KPiA+IA0KPiA+IDEuIG9wZW5jbC1pY2Qt
bG9hZGVyIGFuZCBvY2QtaWNkIGJvdGggcHJvdmlkZSBsaWJPcGVuQ0wuc28uMQ0KPiA+IA0KPiA+
IDIuIG9wZW5jbC1pY2QtbG9hZGVyIGhhcyBQUk9WSURFUz0idmlydHVhbC9vcGVuY2wtaWNkIiwg
b2NsLWljZA0KPiA+IGhhc24ndA0KPiA+IA0KPiA+IDMuIG9lLWNvcmUncyBwaWdsaXQgcmVjaXBl
IGV4cGxpY2l0bHkgZGVwZW5kcyBvbiBvcGVuY2wtaWNkLWxvYWRlcg0KPiA+IChzaG91bGQgYmUg
DQo+ID4gdmlydHVhbC9vcGVuY2wtaWNkKQ0KPiA+IA0KPiA+IDQuIG1ldGEtaW50ZWwgcmVjaXBl
cyBSREVQRU5EUyBvbiBvY2wtaWNkIChzaG91bGQgYmUNCj4gPiB2aXJ0dWFsL29wZW5jbC1pY2Qp
DQoNCkkgdGhpbmsgYWxsIHNob3VsZCBiZSBjaGFuZ2VkIHRvIHVzZSB2aXJ0dWFsL29wZW5jbC1p
Y2QgYW5kIG9jbC1pY2QgY2FuDQpkbyBhIFBST1ZJREVTIGZvciBpdC4gV2Ugd2lsbCBoYXZlIHRv
IHNldCBhIFBSRUZFUlJFRF9QUk9WSURFUiBmb3IgaXQNCmFzIHdlbGwgdGhlbi4gTW9zdCBkaXN0
cm9zIHNlZW0gdG8gcHJlZmVyIG9jbC1pY2QgYXMgdGhlIGRlZmF1bHQNCnBlcmhhcHMgYmVjYXVz
ZSBpdCBoYXMgYmVlbiBhcm91bmQgbG9uZ2VyPw0KDQpUaGFua3MsDQoNCkFudWoNCg0K

