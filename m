Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8CAC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 12:12:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.24840.1639483948324438267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 04:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=MK1c0i4e;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639483948; x=1671019948;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6Y8i7MM9wHgXdh033ENLi/Quj+CjdTl97HPVNfCj6V8=;
  b=MK1c0i4en1pWfP3lClCKGvZAtQnkiWejvs0wx7DkOPhq6NwoI7VwN/OY
   EIx7lwz8Wvz6RhBKMsI7o04hPWN0x88zq8+5OfYRRlp85NUyv1WZVnjhT
   zSiij5rlekladGyenZaRbwPdagdvOxDa4yX8wBJUI9swHwqr5QRlW8Hyl
   4rDY9VuVT8IDzqRvcal5lRbttmkKC+UJ/xogfrbG4xUm/LwDdRcl22fWh
   uOcOn+UO+KmbSTvv4I68q1fkcTxieL5cUMRuFti4fxqG/nwDP+5a+GdQg
   7Cw5HhE13EHIpR4UNNKUc1jmUg/hBd3+jXE/wFGYX21slcQdMo6x9Pf/h
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239187802"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600";
   d="scan'208";a="239187802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 04:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600";
   d="scan'208";a="545147404"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2021 04:12:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 04:12:27 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 04:12:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 04:12:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 04:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUw8/hlcNQ/QxOGmmpVbbF+8iGYUssdolDp9PgIwll6HoDNZBOYCme7oemlIwfV8P1PmT+MUJEiezKMykRH/d2r+GvJwaIB+dw/6QqGMQBysp1axtXY/Mh5Mc2jDxxXDVhsHuDpfhOnWz6DTySBtxr++bSgNHMP9g7G70xFfjq/w/GbDFY7KxVWM+wJnBl4vMFx2CJTtosWtrZCZ66Sc0aMJr6R4rDS6lxZczB91ovRmP0CO46xl3wiONkL+tG8lOJ6j9QoMkMB6uqUm3tylYfQFlzY76tGSc1YrthaQhJ5qmCoGVyk07vWq8XfLqiKpDdHHW9WY3t/E0OVfuon7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y8i7MM9wHgXdh033ENLi/Quj+CjdTl97HPVNfCj6V8=;
 b=CHm7wRvewlQxGJd2a4hNhlpOF6K+lWJqfDbatUkxOud8DsjngEtLP9VjNOcf5dfBALuV4cD1sBWQpBUmX26Qu4yfqdcKYRtcvlqkD4Hk9CQRUSTuYtKhF6aIC5cuJCByPEGqJY4lqRIfrhxu3/8iqfOHZiKykX+vd1UrgadNq86PYMeLn6fxLCcWo6952YL3oFSbmzhhI56BiAU6GNYGiP9D9qzh+4W6D00RbN9wnShDgNbm4wHhAuSKGl+MgvaotWlbBLmQhQEaEr/ceDmM135znLbGg05lG0IAHHxcHC5eyR21Kxxxw0C3wRYDO1gQg6j2thptMxl1peq7eicimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y8i7MM9wHgXdh033ENLi/Quj+CjdTl97HPVNfCj6V8=;
 b=SeF85uQLGdoLh21R2nE1Ns/JZDi+4uEnvvTn3PwshrJQnOQaMrjril2B4gO93DW6s7C81wSWhXVb0zw6+2IFxKIdHOS3mAjuQxU2jjjXcLTohpA3jM91BPtWXs2b23z1UTXuxlgUhsYUi4Eei75YfvWflsQ6PJOOLJRi1Rzx9EU=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM5PR1101MB2283.namprd11.prod.outlook.com (2603:10b6:4:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 14 Dec
 2021 12:12:25 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:12:25 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.5_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.5_M1.rc2)
Thread-Index: AQHX70XzBacqqXzRA0iocxwT+KIv2Kwx6Izw
Date: Tue, 14 Dec 2021 12:12:24 +0000
Message-ID: 
 <DM5PR1101MB23488CDA22781485E9784FEABB759@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <3b4444bb50e35c30897da7784a7726344cc0c629.camel@linuxfoundation.org>
In-Reply-To: 
 <3b4444bb50e35c30897da7784a7726344cc0c629.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ac80a46-5080-4136-3610-08d9befafd4d
x-ms-traffictypediagnostic: DM5PR1101MB2283:EE_
x-microsoft-antispam-prvs: 
 <DM5PR1101MB228386D2620945D981FBE882BB759@DM5PR1101MB2283.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k0W0OkDJMu8aSdq9gAIryDz1G2a74bKQtGwYBFC+JbXx7COAR9txBHNs7zf9fZOM7gpiKDu3lZ6pkimAfnm8imo0z8o08r9ueB0McwqYPQWebyOsqovwaD4sIBO3fxZo1qlarqu6xbEkQjPZVfUhyzxYy0g5RRGZwkAGMDt+Y8/DSbhDohsq3TbA0VsyKZFm4Gk69IIul5IWm6A9iTKZ2EBvgEOIcTY0kXIkBcBuePSC/40KClrTuL7hV2YHCggHk0/B15j0DccMih17ZgXbYqqUjMzMLlMUCLSA/V8hO1vpa1mMbHpdD2CLQZyHrCIz8tt4shgkSyzTD44ZhDwtyK/cdXglm1Nd4qU44Z76XLlqYpaPGXBcrTH41XNiONB/S/2grbSRPfCkO92DmTHzjdSEVmxkCwGRlCvg7LUqSq5ezPWVtn0NdmJhWQs7DMcUMExZqWCsWCM9JFe+xh8xRlDqv9EHJ8ZfBJ2uDDpdX+QqwDv8O+YUSTYgxB5vNvGTH+9nkHZbAVxUiv4Yo2jq7uIb3dtyhOdUj3T9Kq8BaZrIO9K7sn9Z2xJiECSXx7Kp92pTNGfRtD5HzBYFskhBJxbOSRTtYhIFt9dTAD/D0jgHHaAMIJs14yMU2/KJzeEbEFSgXv/MPTwXXTZQx7L6+Wq96uQq4nsDFVOIzm928iIWxTdwCjm1yHIGyTjAotr3wH8yQJDvrXCNdtNLzJpD5V/QXKDU1BiXOhQqviNxgHBhHAsYmlznHsUt1JctoA6ViXRm5vDC+THsuJ1KoDXA3k9nHlGCDAuE7oxzXXqUcvOFtFV6A7+NJIcjy6D5+rSSdbYI+cspIRbl1fFPb4w59w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(82960400001)(7696005)(6506007)(186003)(122000001)(83380400001)(55236004)(33656002)(52536014)(966005)(8936002)(55016003)(66556008)(66946007)(9686003)(64756008)(66446008)(38100700002)(76116006)(8676002)(5660300002)(66476007)(110136005)(508600001)(316002)(38070700005)(26005)(2906002)(86362001)(15650500001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K1B5RW52TUN0L2ZhbGhNTW1HSk1hWFkxTFdtcUlBNmpOcmY3SXQ4VWNIaFVU?=
 =?utf-8?B?c2ZLL2lKWUhwbENSZFZ0eVR4eUNYdE1RdmpOSGI0WW96V1JGdFdva21VTjJp?=
 =?utf-8?B?T3BoQUE0bUZwdFZpc21hT2JYZjJhMDhKY0JEajFINmxRSUZMY3YzVXZidG8r?=
 =?utf-8?B?c25hZUQ1VHdIZkFOYStTc0xRakNrRlpxQnBoMTZLcGNSVTgwWWZsazdXcy9C?=
 =?utf-8?B?MmpRNDZZYTh0RmFDT2hGT3ZOMXhWL1MxS00vZG5RQ2ZnUUlYR3pleUNRbi9j?=
 =?utf-8?B?VEdQTFBBaGxOSXY2V0ZORURYSnZuS3FxRERuQldKVXpLUTlxTGRDNmdDaHJn?=
 =?utf-8?B?a3o0eGwzd0hUcVZhV2hQOEZBSkxxMExSdVBZSUpQRC9iUEwrZVhjVk1WMURr?=
 =?utf-8?B?VDVQVmZ1VUVSeHY2MzgwbmZoYUhqdDZIUVEyQmF1L3M1MGxPTS95YkdQSmZk?=
 =?utf-8?B?YTR6Z0V3dm5qZ0N0NmlMU2VnZkZnVTVVTFQxZU5FbEthSklCdEVDRVo1V3Q3?=
 =?utf-8?B?OTQyY1ZkYnRDYTZkQmczM0VUS0N6alRIT296MjlrZ1A4M1pab1l6bnhncHhu?=
 =?utf-8?B?M1VNd2w1QlJuekV0YXdyeUhqdEJxZ1JIL0RkVXRGZjRnM0ZUWS82ZEMrTDg0?=
 =?utf-8?B?K1htalVIdUNma056dkZhUktLN3dEbFVYRU1pWHVUbXBsMnhEY2NMbVdvWStY?=
 =?utf-8?B?WWh5eHh0QVR5ZFcyTXRkclVLZHhLcU9lKzgzL3JYaEplUGxqUzJMUDU2dnpx?=
 =?utf-8?B?bUtBbGhnckdVRGkrd3E5T20zUWY5NGRUUEJGRHA4dXhPaE5TVllxZmM4T0xH?=
 =?utf-8?B?WmRoYTVUWDBBN3BLcHByZitrUDB4b3NMK01lNlhsVFhsaERoZjh0VHFYVTRI?=
 =?utf-8?B?ZTVabjNUVE1aU2JxWm5oSk92bjdKV3lTRnI2SWVMM29Wa3JqMnlMRXZiMlc3?=
 =?utf-8?B?cXIrUHBVUC9BTGRqNzlhU1hURjc1WWxnS01pNVBkVHVQSmtTYWxwSUxzR1pq?=
 =?utf-8?B?ZHNZSHRFMmVKejlsUGJrN0x1Q2ZWWmZEYzYrWm90TURDMnB4L2lYaW9vdDll?=
 =?utf-8?B?VDU5YnNxVmhrSG83VFMyYTdQd21DRi9NU2RXdmlkVkxhTUFrekkyTFcwcE1Z?=
 =?utf-8?B?Nzg1K1hVd0I4YWk1dnlzSnRMOXVTd1cyL2xiM2RWR0tRR2NyVW1RWnF6ZG1t?=
 =?utf-8?B?d0UrOGV4Y1RNRnYxR2p1RG5uR0lEQ29TTkxBb0J2eUlsZ3Ewb0FXMTVjckll?=
 =?utf-8?B?NmY1VG12Z2hWWUFIaUhzQ0ptRjB6bG5vdzFoZ2ZpZ1p5TkZnLzU5a09YUDhG?=
 =?utf-8?B?NDd6ME44Y005cFdNQkpQSG1ocmJNdVgxd0N0MnpMdFVld0grdyt3cG8xMjBN?=
 =?utf-8?B?UHBjZXQ4cXVzT0w3VDRTWWNNK1lNdnpDSTRCelprZFU0ZGlITWpHSDFmUDdy?=
 =?utf-8?B?YXdqWG5KL3NudVFTNVZNVU1adFpnMUpaMnlwTzNyaHFDbG5OMVB6TTZZN3BJ?=
 =?utf-8?B?VXBCMFA1OXZuQXp3RTBhWWtZRk9BemZSYkVyZHU4aHhTdlpIRDFxWnFJLzRi?=
 =?utf-8?B?M2IxVWhxbjRqelltYmR6c2VvN2psRCsxWEltV0tDd3hySTA4UVRxUmNVV1pQ?=
 =?utf-8?B?TkhqT3ptejBXS3dXYnovM3hzWDdvMGNMMjY4WUdQZmRTZTNNRFFnYXE3anlh?=
 =?utf-8?B?cU9zLy8wZG9YeEsvbDNWR2wwU1RuM0xkd0I4Slp5MlZNZ3M4cWJyODFQREY2?=
 =?utf-8?B?V2RhekxaZ0dJWldjbFkvanR0bTNFRlh0aHhTbGM0amxrMllzcC8zZjFoNlYz?=
 =?utf-8?B?U0pMTGpzQXBkT0llWWFReUo2VDlrbFV0azNOZmNvMFVEZ3A5ZWI1Mm5aTTJ3?=
 =?utf-8?B?TjI3SmNCTkUrcmIrVGNtMXpDNkhSRmRNdHVpZkNhaVpERVROQnhjQ0pCbnRk?=
 =?utf-8?B?dC9FYVZwOWRLZmFvUXBpOHloUVJwOE1pQSt0MUpaSHEzaDhiQVJHUnYvb0FW?=
 =?utf-8?B?UmQ5SkQrVlZjTG5UUHlWZGpQYllDOTV6V1c3YkZzV25pWUR1L2Jac3NUSStQ?=
 =?utf-8?B?YTFzTW5mVHh6YzVvTlNhRzUvTDBsUzhOMTRnNHJPR2tQZDViMnk2dUtzMXpk?=
 =?utf-8?B?eGNZZnF3VE1qb00xZWZzY2FXVTlDVWhBVDRYQVpabE55c2VxYWN4T0VUcFo4?=
 =?utf-8?Q?xlk+PAqPdoRebleni7Nm3+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ac80a46-5080-4136-3610-08d9befafd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:12:24.9651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PThc2hVzPVpRaYnBuhF3bF1tlzjJOeYod2L/xwsVyyIm6zSqefx3+mpq8dVP/O2NxiWzOmj8Qe2/D4Q1B9o99g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2283
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 12:12:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159686

SGkgZXZlcnlvbmUsDQoNCkludGVsIGFuZCBXUiBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhl
Y3V0aW9uIGZvciBZUCBidWlsZCB5b2N0by0zLjVfTTEucmMyLiBXZSBhcmUgcGxhbm5pbmcgdG8g
ZXhlY3V0ZSBmb2xsb3dpbmcgdGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRl
c3RzIGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQoNClJ1bnRp
bWUgYXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KMS4gTWlubm93VHVyYm90IDMy
LWJpdA0KMi4gQ29mZmVlIExha2UNCjMuIE5VQyA3DQo0LiBOVUMgNg0KNS4gRWRnZXJvdXRlcg0K
Ni4gQmVhZ2xlYm9uZQ0KDQpFVEEgZm9yIGNvbXBsZXRpb24gdGhpcyBGcmlkYXksIDE3dGggb2Yg
RGVjZW1iZXIuDQoNClRoYW5rcywNCkpheQ0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj5Gcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEt
YnVpbGQtDQo+bm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
ZiBSaWNoYXJkIFB1cmRpZQ0KPlNlbnQ6IFN1bmRheSwgMTIgRGVjZW1iZXIsIDIwMjEgNjo0OSBQ
TQ0KPlRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+DQo+Q2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+U3ViamVjdDogW3FhLWJ1aWxkLW5vdGlm
aWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQN
Cj4oeW9jdG8tMy41X00xLnJjMikNCj4NCj5BIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by0z
LjVfTTEucmMyKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlciBhbmQNCj5pcyBhdmFp
bGFibGUgYXQ6DQo+DQo+DQo+ICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3Jl
bGVhc2VzL3lvY3RvLTMuNV9NMS5yYzINCj4NCj4NCj5CdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0K
Pg0KPmJpdGJha2U6IDFlY2MxZDk0MjQ4NzdkZjg5ZmNkYTJmMjNjMzA2OTk4OTk4YTY1ZmYNCj5t
ZXRhLWFnbDogNmQxYWI5ZjNiYjI3MGE3NzNlYzVkMmY3YzhjODU2Nzk2ODMzYjU1OQ0KPm1ldGEt
YXJtOiBkNDQ2ZjdmODBiZjYxZTljZjA1ODQzZThlZjRiYzU0NzNmOTM2MTE4DQo+bWV0YS1hd3M6
IDg4OTNlMGNkNGMwOTgxZWVkYTk0MWVhYTlhZDJlYjkzNTk2NzA1MDINCj5tZXRhLWdwbHYyOiBm
MDRlNDM2OWJmOWRkMzM4NTE2NTI4MWI5ZmEyZWQxMDQzYjBlNDAwDQo+bWV0YS1pbnRlbDogYWE4
NDgyYWY3YjI4NmY4ZmU4ZjdhYWU2NDg5MzhkNGViZjAyODNjNQ0KPm1ldGEtbWluZ3c6IDk5MmZi
NDBiZGJmZTlmZTYwZjgxNWFhYzQ2ZTA0YzU4OTYzOTE4YjUNCj5tZXRhLW9wZW5lbWJlZGRlZDog
YmE2YTE2Y2RjYTY2MWIyZDUyNTFkZjI0M2RjMTliZGEwZThkYjY1MQ0KPm9lY29yZTogMWE2YzJh
NzM0NTE5OWQ3N2FkNWFlYWM4YWQzMzdlZDgwYThhYTM5Yg0KPnBva3k6IDY1Yzk0Y2EzMTk2ZTVl
ZjMzNDRhNDY5ZmVhOGUzMDQ0NGYyZTk2N2ENCj4NCj4NCj4NCj5UaGlzIGlzIGFuIGF1dG9tYXRl
ZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj5HaXQ6IGdpdDov
L2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPkVtYWlsOiByaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+DQo+DQo+DQo+DQo+DQo+LT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj5MaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj5WaWV3L1JlcGx5IE9ubGluZSAoIzgwKTogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+bm90aWZpY2F0aW9uL21lc3NhZ2UvODANCj5NdXRlIFRo
aXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC84NzY3NDMxNy80ODk5
NDYzDQo+R3JvdXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0
b3Byb2plY3Qub3JnDQo+VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL3FhLWJ1aWxkLQ0KPm5vdGlmaWNhdGlvbi9sZWF2ZS8xMDQwNjgwNS80ODk5NDYzLzcxNTM4
OTk5NS94eXp6eQ0KPltqYXkuc2hlbi50ZW9oQGludGVsLmNvbV0NCj4tPS09LT0tPS09LT0tPS09
LT0tPS09LQ0KPg0KDQo=

