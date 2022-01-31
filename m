Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51222C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 05:17:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.28665.1643606254055449876
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 21:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LCvDoOB8;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643606254; x=1675142254;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BDgtFpGhoUlPqXckVvCnoUhl8mHBUxMsLTge40EN6l0=;
  b=LCvDoOB8PBH5jCJsavNUTfbqS+OhM6YqXHYI7wY8QYg8yJBiXojtWNZu
   i/gqCVRFj8NcjQANOI4O30rdlesmRzGZg/Zksaaqn9sDHySTOMjSPJnGL
   ydCIJma6ZzvEMDtFVw4OZBfSCP7vIQ/gIdtB47c99BpFZCt02klRL5W5U
   qRGklPzjOiyJ51S8P6iIMJo68LrwiltxitFrRoa+5JeRPhjwg4CG4fwJS
   VirxsbNgAyoFfMhhlumaoFxEy2bzPwGio4tNTKSay9lyy8PSCP6lNlJ9L
   +PmcJAuJCOvGBlIEBl+S+WZNaohBjc7H9RBvnp6Nx46Z7R+YvGRb1C4fC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="227373996"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600";
   d="scan'208";a="227373996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 21:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600";
   d="scan'208";a="626264186"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2022 21:17:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 21:17:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 30 Jan 2022 21:17:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 30 Jan 2022 21:17:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8mHf72LkMs1lQpKNEUIjEOzsfSQA2UVwCUf0GuHeZeA6SqVU+ceMFDXAM+o+rSMPvJnxZ7HBr0p4I8pz0AOwbELBZ+AskPTOMy3aYLBshikEyrrlD3t77peqNyDww7Tk0U+c5F7Wltp/1WF79PF672G2a0J3KG3moRC7PYnxxL3qgbTUaoN6Ey+ZfdksaP+sMlCBstgUkrnENNU9JR1VXP1rr86s6yhHUjFuIVZC23Pzttg5GNCLL6ZXmQP4gQm6CKtK5pl4zmTBi0qAsFQZYtCeNQYvDjmhR3hpBW7SkKgSUh/HcxRnAvUcZ0Q60/4Dqab2Sqb6ZKZAvNtZS/lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDgtFpGhoUlPqXckVvCnoUhl8mHBUxMsLTge40EN6l0=;
 b=GECG1hGaqEGh1sxxlzDTRZgaJwrxgUGQqULrAQKde+2fsbI9c40vB5UzDWfX2+d+sfh5A8FKsFpWXAZNMe0WdaXjXlCzj2XHmbYjyTBxDGTzUKOzydRZ/j38z9LnqVeoTaOlOoxQZqxwm1cr8t8KL8OSYhbpmQZi/ekRAkFKD2XAMXxp6IsQ2iZwjM3Z8HCAvgwRmzTTjAkZ7i7q6UYpif8DyPpW+AzBHA6Qjt5h55+TBhQZtS6hcERUr3lgd1ugj9msY4e52suIXQFgfM9jTusFM6e3WYRgFj5M9Kpz8QYljBfh9n/uMRdu/9r0XQa8eVn+5E+xvh2ShWQPQ0RyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 05:17:29 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643%4]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 05:17:29 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.5_M2.rc6)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.5_M2.rc6)
Thread-Index: AQHYEch2e6RecNA5vUiP2obGKCfqiqx8n2Mw
Date: Mon, 31 Jan 2022 05:17:29 +0000
Message-ID: 
 <DM5PR1101MB2348D70922D36032E150FEB0BB259@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <ba4c5ac88e9fb5f69bdfda0144f8f79fbd64aaf0.camel@linuxfoundation.org>
In-Reply-To: 
 <ba4c5ac88e9fb5f69bdfda0144f8f79fbd64aaf0.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 9c2f5a78-9adc-4ade-41bd-08d9e478fa4c
x-ms-traffictypediagnostic: DM6PR11MB2890:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB2890CEF34DD59E3DA5B9F938BB259@DM6PR11MB2890.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LJ0U8d9vfcXGnU/xuJ+IX/24PHABRwU7kfNGuGS2CMKOcq/6ysNrom/ZwaV4UXhzOas4PeL6h/oN1pWKvMaiicb5t/ozPc+l5wzeWmtONE73mBPPZlqyyGWb14TBmPmAVpXdchof0sCyv3mfViPtmr+Cb89t07F8pmBMFYSFYc7wOyZ4ZoT3AbldVosoW/+i/2ufh2fDeAB5GUMTpN+hpjKvYyLzDtzUzgFmt7ZxITTz95ZVFgI5CfK9PRMIUb4IItZ1XeMzbeboLVIHUXbTH3DCqmVSja/u2WY/5yWXmO7uUnCisJdut8HTQ48lQWzprgqLLGMH3tD1QHOLp8Pp4EQ6RTv+feM8hMQmwjfZnOjr2wB1ZRZHl9jYwvpPphYQAPa52HLZ+9E2ZTcPzAYH5MxI/z2/bCKAHWBAFe0+KmwNubfRy7r/9N+vDXPeK8V9RrZtoIWVud6PdnPt/2ZlXrGbxLFGZMJqPk4Zm4ZW4+7uwb0KYLXOpjRm/fZ4koxuVpMpxmxUGQc1jO81ec1AbdIiGmvAvRVuYdUhi49pE0uMOmL5AoPl67UtgtA4oLPOaC75Yq4E4a/LkymGLhwxCyHNeNy5Pcwc9ArhQrb5iSpbvV/d00fjmHR5+VZTe0bexzgdLNNBipp/fvHXWizlQ6cDbm6M/SOEbG6pGvjlpQ3yjG7cUUDaWZjOpeG6Q/5sUBq7OwHS+9Sqda/cxZaukJ8GnuwhZafFDEVKLO+gRxWE0YMDgfBoqaFrg7y2Iy/rc4lJLDHlOZo8bImxuPHXbeApVDQc9g0V8nekp/F2ekc5bI2bqMQ1wq/sWIKDDnct+MQ/BjHPigi9BRVyBUSCz61Xs48ErdM5tfrl7GptB2I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(55016003)(186003)(82960400001)(122000001)(38100700002)(2906002)(15650500001)(5660300002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(110136005)(966005)(55236004)(53546011)(38070700005)(508600001)(9686003)(83380400001)(7696005)(6506007)(71200400001)(8676002)(86362001)(316002)(52536014)(8936002)(33656002)(491001)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q3BoTHlJMWkzenJtOTlHVmwyLzBkelE1OGVQdEFoUXdwdkMzbUM5a3hYWkhm?=
 =?utf-8?B?cCtDaEllLzZBaFJ2aldLWTBlYUZBanltdldqekhSY2VJSzF6ZmR2eDhBampT?=
 =?utf-8?B?UUEwNEVFVEFaRzFXMm5GYW5FbkJGQ0ZzMHpSb1hLeWVCUExTQk1tQ1dTdUFR?=
 =?utf-8?B?bHUxTHMzZVltOHNHV0w2MFk2NE4wOXV3dXZydjlZQ1V2ZGV0QlNnQnp6ZEdp?=
 =?utf-8?B?ZU1Lc0VRdzViWGt2UXlVOU1LS0FlZUNSeU93c2p5K090SmluYUJBNDhURG9G?=
 =?utf-8?B?TGNra0JCRkNvSTNsQTZmYjRHb2U5S0krOVRzWERJWnByVk1qSWl2L0FzbENB?=
 =?utf-8?B?eEFKOFhIdVVSQWh2UEZaQ04wVjZDUUg5dWxwYWROTWRyYkcxZUNoN0hWTjJB?=
 =?utf-8?B?bzJHV3JqTjFIVWxqeElIbzhtbTF6R1hjelJidXFYSTYyNFBiT0kwVWkzSFkw?=
 =?utf-8?B?M21kVU9oYnRXWUFWdk1iaTVVRFZ6bDVHQW5BWW43MVVwWkpnS0tHL21jNnps?=
 =?utf-8?B?K3FJdnRaRmJPU1ZDZXZESFRlMm9TWmp6YnZyT0RDWTVVZjZ5cGZhcDNPNERk?=
 =?utf-8?B?UVRsc29lQXllWHpIZXB1azRrd1NySHJXU0dLeDM4aURhQWRwRDFJMDA1MUlu?=
 =?utf-8?B?VGxUU3FGbU9hcjczTHNubXdCWHpwUHdtWnlGY0xFcXVLRWx0VDA1WHd6Y2M5?=
 =?utf-8?B?K2Z0YVpmR1dNa3ZXU2pUT0gyTThRRU8xMEd5TktkMC9BZ0NsUVpISDFUSlRC?=
 =?utf-8?B?QlZhTENxWTJ2ckoyajRTMkw0RVoyOXZPUkQ1M3FOck1TekcxWEc3UjdkTmQ2?=
 =?utf-8?B?djBpYml4djgxWi84a05VK2MwNVdEbktjSldYeFdBVjVBa3FuL1pBTDFpMmpD?=
 =?utf-8?B?MmVtVzB2YktDZEVMTXRJaGRDTkowS0lRUzR1ekFMZk8reFMwUnM4dmh6bDNE?=
 =?utf-8?B?Tm9xTFZUOXBNY1FvNjJ1bU9zV3RuajNYNWNoOFMvODM1emlLZmowS3FZZlho?=
 =?utf-8?B?SEVMUzdvNGpUekFCcnlSZDQ3Njhra2ZNMDFkcGtyQlptT2U0a295Z1N5MnJI?=
 =?utf-8?B?UHI3TUxZc2xOTmlqaWVVcFRYc3A3YmFPcGx2NWhDajZyTFJoV1ZJVlhscmRm?=
 =?utf-8?B?dnhwdXBicGI0NHVIeHR1cXVKTjZ6bERINGhBR0NUbGxaSjBObDNPc1YrcTJN?=
 =?utf-8?B?d1VlUTk2RVVnV1NsYmJTeXFNWXgyUnFFZ1B1Z1VYZTYvR1NzSGQ3RVU3RDQ2?=
 =?utf-8?B?K1Rvbkl4MFlRamlOTjdqK2FMN1Q4SGJFNXBubXNaa1JlQ0VHUVNEYS9QaGRy?=
 =?utf-8?B?bUw3MGEvR3RRY2ZmRVlMZmQvSDlhYXNKYXNSZUdkSzhnSERXcDN5NTlWWXlo?=
 =?utf-8?B?OUtlM0QzY0FOdTJEaWJoamlxU2d5N0QvK0VsN1hncXhiNWtEZXlnVERETXFz?=
 =?utf-8?B?UUgrSVI0M0hKQndOQlRicktLd1hqVzZJZEFDcmE0WThnWmZrcFRkNldXdHZU?=
 =?utf-8?B?NmZIak84UGhFK2piNldLU2E0R3RNQTJCNVg1Y2ZoamVQWDhZY1IvOFpYck5o?=
 =?utf-8?B?UHMrb1IzZ3lDRFVOSDFxdHRnVm5uR2NOZ0w2ZTlvbmtSNTVGeGVHY1FJS09J?=
 =?utf-8?B?YWZGREVheVQ5K1N5MUltMWVvMDhsREtySzlSS0tJTk1NVzFwTzRxWEdHY0pi?=
 =?utf-8?B?VGlwV1VYdlRLQ0xjRFduNVZjOHd4K2hldmJPUGlrZk1IQ2x2WGdvb244SmVP?=
 =?utf-8?B?Sko4UlJNWWRveEVVVkh4V0dETE1vVU9EV1VxVEROM2VUeXA5djlrQ2FIOUdR?=
 =?utf-8?B?Tm5MdC81U2twbHczdGhTZGx2VzU3Mi9ES0tWWDljK29raFhDajJscldZQW1W?=
 =?utf-8?B?RzBxZUtBZi9NT3QrRDlqOW1OeTJEVENoZVNtTzF4aDV5ME00YXhjNm4zTnlF?=
 =?utf-8?B?U1BQdlJIYlJXVEJ0aWVuSFNGNE5iU2x2ZDhQQ1hTZ0hNSmx2alBTRnJSN2Qy?=
 =?utf-8?B?UmtGWGo1NWNlQ1gwQUlvTWI1RGJvOGxaY05telBFa3BnMUtuSGZxcnZLL0l5?=
 =?utf-8?B?dUdXS09nTVJxKzc0bERFNlhlNWhwOW5EQUo0S3RWeTdTYVR4ZEVya2JFNjlz?=
 =?utf-8?B?SHA1ejhvWUdiZk8zL2YwQnYveW0xWkkvSFEvYUdXblpwQzNXaFNFcTRnTGVi?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c2f5a78-9adc-4ade-41bd-08d9e478fa4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 05:17:29.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 3cE4f1ERie+6AENoQkET+VuS3XbktgHGp07x7ozhQFgR6o+MpVTvgKqCRze7avPwrWVCMLXFNCPSQrB7hH5v3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2890
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 05:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161116

SGkgYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy41X00yLnJjNjog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuIA0KDQpuZXcgaXNz
dWUgZm91bmQgDQoNCkJ1ZyAxNDcwOCAtIFszLjUgTTJdIEZhaWxlZCB0byBib290IHVwIG9uIE5G
UyB3aXRoIHN5c3RlbWQgIA0KICAgDQo9PT09PT09IEJ1Z3MgPT09PT09PT0NCmh0dHBzOi8vYnVn
emlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQ3MDgNCg0KVGhhbmtzLA0K
SmF5DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBxYS1idWlsZC1u
b3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+IG5vdGlmaWNh
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUN
Cj4gU2VudDogVHVlc2RheSwgMjUgSmFudWFyeSwgMjAyMiA0OjQ5IFBNDQo+IFRvOiA8eW9jdG9A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+
IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55
b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBu
b3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBidWlsZCAoeW9jdG8tMy41
X00yLnJjNikNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTMuNV9NMi5yYzYp
IHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6
DQo+IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2Vz
L3lvY3RvLTMuNV9NMi5yYzYNCj4gDQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiAN
Cj4gYml0YmFrZTogMWYwNmYzMjZmYThiNDdlMmE0ZGNlNzU2ZDU3YTkzNjlhMjIyNTIwMQ0KPiBt
ZXRhLWFnbDogN2E2NDRkNjM2MjM3NDU5YzU0MTI4YTcxZDA4M2NiNmY5ZTFiOGU2MA0KPiBtZXRh
LWFybTogMjU0NDgyMjg0ZDQ1ODg1MzJiZDdiOWQ5ODAxOTNlM2U0MWFkYWE5OQ0KPiBtZXRhLWF3
czogODg5M2UwY2Q0YzA5ODFlZWRhOTQxZWFhOWFkMmViOTM1OTY3MDUwMg0KPiBtZXRhLWdwbHYy
OiBmMDRlNDM2OWJmOWRkMzM4NTE2NTI4MWI5ZmEyZWQxMDQzYjBlNDAwDQo+IG1ldGEtaW50ZWw6
IDRmZjViMTliYTYzZWE2OWM0NzE5OGU2NDFhY2JjMTJlMzM2MzRjYWMNCj4gbWV0YS1taW5ndzog
ZGRiZjE0YjIyNDIxNWY0N2E1ZjgwZmM4MTU0YWRlOGQzYmMzMThlOA0KPiBtZXRhLW9wZW5lbWJl
ZGRlZDogYTU1OGQ1MWZlY2RhM2U2NmFjZTIxZDAyYjU3YWI2MWJmMTIyZmRjMQ0KPiBvZWNvcmU6
IGExNzk0ODUzNTFhMDU2M2QxMmEyZmVmM2U0OTk3MTEyMjI1NWVkODANCj4gcG9reTogMjdmZjQy
MDU0M2YwMTk1ZGFiMDI0Njk4ZDgwNGFjYTMzZjJhZTEzOQ0KPiANCj4gDQo+IA0KPiBUaGlzIGlz
IGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXIN
Cj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4g
RW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiANCj4g
DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM4Nyk6
IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRp
b24vbWVzc2FnZS84Nw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9tdC84ODY2NzkxNi80ODk5NDYzDQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9s
ZWF2ZS8xMDQwNjgwNS80ODk5NDYzLzcxNTM4OTk5NS94eXp6eQ0KPiBbamF5LnNoZW4udGVvaEBp
bnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

