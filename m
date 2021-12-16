Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B61BC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:48:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.11362.1639666091623387733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Pga6aKF2;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639666091; x=1671202091;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7VXJNuGPb7rrKETEKE+k4cnKdwmjccX4WeIi7uOrbcY=;
  b=Pga6aKF2GPSJs/sXboQJ/9rE6P3As191AkDumQSklKPPqrl0gdjb0aXj
   pVIfGH1HHdUn5nh8A5aCAXWr/4M1sYqftv+rma39pchoBbAhEruLbp111
   R9yLHtb9ruooaLWHYWUcHRc/XjAAqjny+q4Htki0vhIp47Z+HyoI77ZEc
   gDBdVc2pOGFRPrA73PDOfW437BB2UzCWh1A6vZAjpDe/klcr/XWLbgseM
   tIXdcW32lVVmMhwFFmDsOQfbEVce1xRzEEBE7MKMOgVQevGI7D5Hwo0oR
   gKFXNziu0+Za1pelPtSDUEoElA2kh0fObeYzKwj1mZBfE3ifOyN+kKuJm
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239319727"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600";
   d="scan'208";a="239319727"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600";
   d="scan'208";a="466092040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 06:48:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 06:48:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 06:48:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 06:48:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwVsh+/Rw5vIXWAMcwFpOkT/PPGixokXTkYnncr3IvsGSf3VEi3ZIbdcnfMYT7vpMnu7T3++ymugZDvarxCn5qBXalsnPqzLuqO11IGNbyaHT0z/gC2VoHwibQLxfib7q5aQSvKxQimqvl/r+c7QaH1GaodPGgujkoXCS0Ifr7eSVtZll+lv3MK/0tch+KBy2YRg+ayIvxzYB5n63NtfkcVASbfYHtD7RQSQeecUdBGaX/WvTJuWxj/zm2+TwkLg2eBowiS5Q+W+24+yd1jdkCVa56bsKUOfXIGKi1WK51VQHag1pZAvJGkKc6dpjkGrozu/yLWrF0yc2s8rxd4LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VXJNuGPb7rrKETEKE+k4cnKdwmjccX4WeIi7uOrbcY=;
 b=BkfHzo7+xUHLPorWFZxnu//it30anwafxaf2iGC+gSxTdmlc+TEsg++UWWaYkcIgxFyI5XA+Ch4X3ZyZZHh9B3U0olputRJOvpnFw/ukt5KOAxGt63uype/ln3d5EGcits1DyT3iUizWefyZCxqKgCLuTV+oezZl11AW/BpZvRTbE3gje78zy52uscSo1SylqrErJNVBDxs5GJqQa6JtlxRJuwivSgiAfja16MF5Kcx6vJ/xbbPfo4Pw1fS1jl1PAaRoNWM/G3py541OiQH4S7uIN7Aly6a2podrnOuFy+EB2vEmA+IvJBsLYaOANWuuGOq65liRR3KBSjZ/GqDYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB2618.namprd11.prod.outlook.com (2603:10b6:5:c0::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Thu, 16 Dec
 2021 14:48:07 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892%9]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 14:48:07 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.13.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.13.rc1)
Thread-Index: AQHX8Yb110r9sfTKC0immUls0d7G2aw1NKNA
Date: Thu, 16 Dec 2021 14:48:06 +0000
Message-ID: 
 <DM5PR1101MB2348F1CC15F6EB62DFB411B7BB779@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
In-Reply-To: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: bf30dc77-e928-4c3f-c24a-08d9c0a3127c
x-ms-traffictypediagnostic: DM6PR11MB2618:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB26181F59E4E65073C1E0E5B2BB779@DM6PR11MB2618.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cmppctfLxiln8oSKcm3MF2cJ9k8dWmQhtrdgkH5i+rck8UQBBdYiJsQ3TcGH7xgOc29Imjv0nV/VNwykH/9VpwkHnoknXwX8QH4hWWylTQk/DU4kg5K+PCIrTbVb8zdordW9VeA3QCgv3lqSE6xKsgrteS6X6Zw+RVucC2BxTZuIREVV5FdMX4ox0HS6h0Qca9HOPGtMpxLsAhYImEGtXq7YL8rEtRiXCqONxhmbYMo6+qP+6ipIZ9jqKxLrJnucG7eglyMr3yGcH5KCHhQllyl7UK8HNwcC3Py/pVfQ8NX5+sw6iI6YW5VhVfn/olZJmWSJkoocOxuHW4EOS/ZzEeYmxRnXQu1p2EMykwrBAqyGruosa5otepi+dY78DXB2Vfdv8N8oEb0HrD8OgGBCni/96S0//av9g/bDRLO5ltSzkDdPLhwbxYG0YLlOhezV8DJ2l0H8G6ay86hk6HQb8tPwxig+m7wWUbzmnVODjy8JgOJmCagOaJTdpySa11rZjiSb9TSiMQ+aLy/IWYU4h8eOTSsFdhl5Q+/i+LM1r/H8V5ndSl/rQ8NpIaia8gZbfaZTF6VNsMs4u6EE8jyYra+sAWyZbeJ1EQImMo+GuDxEOjDYdGtZFL9VEieDybIn7w38uwCAAkV9jNo6E0MLbADZOnPGEOAxfBCPmP8SxaXM2A3sqQDNZ/7Fl1/DjmWVct/XoU+08e2KlbazYapNtyV6VyhPO2sov8WJmN+z6/CCVCcBtNxfTq/23QqxAm8n8FtI9nuVBXHv/9arTySX2in2oLjjdTNaiuVaJRoLj7LyCPyrP5YgQPQOmXmXuOmPdKN21LoJ+6PBzw3zhZRl9w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016003)(26005)(7696005)(38070700005)(508600001)(76116006)(66446008)(38100700002)(52536014)(55236004)(2906002)(186003)(66556008)(5660300002)(82960400001)(15650500001)(966005)(66476007)(122000001)(6506007)(9686003)(64756008)(86362001)(66946007)(83380400001)(33656002)(8676002)(316002)(71200400001)(8936002)(110136005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWNuOHhEVGdtMjMrRUwxSThTTFB5NXhPQitxK1VGVUdweDdnV240NjFXV1lu?=
 =?utf-8?B?QzN2MUJVZzNkTDhhZ3NvRzQzQVBBc0lMYmVYalJPMmtwakFFKzNrZjFjMjR5?=
 =?utf-8?B?Z0FjK0ZQeHg5RUtWT0xKamVnZkVmWVlrdGJsbUJhclk2ODlIdVhCcXRKclhQ?=
 =?utf-8?B?cE01SWwzUkd3RFYyWCticWZSZlc1eit4T05oZVlaVVptUGJWRjV2NnhsM09i?=
 =?utf-8?B?SmNDTGgyd3IvWjBlSFdhNDlSb3FVQkZzOHJOR1RHbUdTWGdCd3FGUXMrZHc1?=
 =?utf-8?B?REw0ejY2YkIrdENpNWpGa3llSDIvK2xWak5OTHNrTTh1c2tON0lUUDQ2b1Bz?=
 =?utf-8?B?T0NPUnliVnMzMitRbSsxMVhlMFUyRFVTOXM5UDZIOCs0RGlvb0lvRFdiemZM?=
 =?utf-8?B?OENPWW5YUk5qV1RBVm9KR2c3VXdHdms1dzNnTzdSZ2Rzb1h6SW1OdU5GSVhP?=
 =?utf-8?B?REJtclZ1aWdEUmpQc1F0VFZTNll1Z1BjYVZIS0dCMHM0Zlg0dHNtMFpuOWxk?=
 =?utf-8?B?MVRyWjhrdWdYUzBPT2R5eGppTXVJYjh6Yy9RL2J0S2FaLzJaTGh2ZEpINXRJ?=
 =?utf-8?B?Tm5BSjh5L0FOZmJRa1Ixc1ZNRDdPNnUrZGUxVUtjZElxcTZyVDdVYUZBQVgv?=
 =?utf-8?B?a1BCZzNMdTFhek9tdzVkNGlQa2pXZ2g1dCtmZ2UzNGgramNET2ZhSjAzdUY2?=
 =?utf-8?B?anNETnRrdUd1SW9mY0kxaUxqMGtyZXQybzhMNG5KaitqQ3g1VElXbVRieFNt?=
 =?utf-8?B?V0dONytDWHJGeGh4WmNZeU9FMGJUcHZrMVFPck1RY1FqVEt2YmdKUUZOSVZz?=
 =?utf-8?B?bmVDaGUzK2tuR3A3V0YvZTZGYlQrTFB6cWFxV1V0TEtqRjExUHNzRldicUhp?=
 =?utf-8?B?SlZidmJjL0YxUm9sZU5kM2xGblgwUUJlZC85cVdOQkcvM0NZZVFGdkljTjBO?=
 =?utf-8?B?bUNkVXRKRkZXd0svMkx1Sm10YXNETTVUZnBmek9oczRmVWh5cnA3djRxU090?=
 =?utf-8?B?Q2tNM2VmVmNtdTBHSEpmeDBZTjIrdWN1YzZEdzcxY1BNMklJeG9yYmtDNlhI?=
 =?utf-8?B?MDNSOEhydjFrVGZMRi9zQmxvRUl4bzlmNXE3T3EybWM2eExBZFFvUzhucE1w?=
 =?utf-8?B?NGk3Qi9rdyt3VmVncE5JeVhSQmVCbG11UmtGRlNncnBlNFo0bFluWEcySnRa?=
 =?utf-8?B?OUxuZytpUWlHbWhHdEtGNmt3RU9HUng4SzlvbXBPdUZmWEZGY0k2cjlWczU4?=
 =?utf-8?B?bXFYNEFlODdZcUJ5UjYwQ3E5bFRyc2V0QURFYzlScW1sRGhaNHBXUDRLcklr?=
 =?utf-8?B?ZWdkZkdsSGh3c2NDMVpEc0ZZTndmYjRzd1dxNGRjeC9Mdm9hRUdNQnlJVnFh?=
 =?utf-8?B?bGNGQXR3eVR1L3Z2M1JpdXpVR3NrbXpyS2l5L01IWlR5MkpqZVlaUUNRaWVm?=
 =?utf-8?B?QVFacDl0aTNCWS9sYTdIL0N6YkNPelpJWTR0SmlvWWVQT1RTWElWUEtPN3hq?=
 =?utf-8?B?YW9MY1ZKeWZ1b3RpWitJb2lpdzFsRUZnWS9lTjNiYmRUUmxGN0xzY25vdU1t?=
 =?utf-8?B?eVZHejFVaVpubDhVSlFDZEU1ZzJWVVZPSjc1OVNzd2tRUU1yN0dDaVpCSDlm?=
 =?utf-8?B?MXBXMzZUdGw5MjNCT1BxdVlPYUJ2MUs0cld1WFo4bVFZbG5XQUZLT3FXNzBn?=
 =?utf-8?B?aHpwL054YkZnQjMxdTRydGVncHM1a2dEd2R3MCsxcTluSmhsdXIwNnZFamhW?=
 =?utf-8?B?c1pNMjlkdUZIN0VWSms3WmJXTlNMbkpuOWpMb21TeWIyZkZiakhvaDJRZjlh?=
 =?utf-8?B?TXdnWU1WOGZxNmNManVYT2NDb2V1eGxTdXdsUC81dEpvREQwL1IxMStKZ2p6?=
 =?utf-8?B?RElZQ1BDbllOQmU0aW9veVdiNTVubW40eXlhNFVrRUlPd2J5bllMVFhESGph?=
 =?utf-8?B?S1pxRFIrR3Q5NDBWS01TVGhpRzV4WTFUb085VXB0TDBaM3dpZEhSV1pQZWV0?=
 =?utf-8?B?QWhVNDFtcDJEdS9jRlJpREdxUFlPYVhYZHZhVUJFUnQyc0x3ZTBOend3dWty?=
 =?utf-8?B?a3lRRWhsZXlOU2tZVWlBRzFHK3RNRzlad0RRNEFDZUZCelY3ckFGZEhkdk1X?=
 =?utf-8?B?eU0rOHZmR0U1OFNtTklIR3FNU3NXMjMwY3RHOE9hUGxHUFlrRWxTUnM5RE1D?=
 =?utf-8?Q?KFeOlsBuDMw/AZuHim8IxHk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf30dc77-e928-4c3f-c24a-08d9c0a3127c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:48:07.0285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 REANQkYnnAnJ2Aadl69ly8KcP4XS/fVVgHRZyXKXBKeZN22vIqSUb5/ij6uyfHyz6ShUHiva4myRxYvwjdSFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2618
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159788

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy4xLjEzLnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBm
b3IgZm9sbG93aW5nIG1vZHVsZToNCjEuIE9FLUNvcmUNCjIuIEJTUC1odw0KDQpSdW50aW1lIGF1
dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQN
CjIuIENvZmZlZSBMYWtlDQozLiBOVUMgNw0KNC4gTlVDIDYNCjUuIEVkZ2Vyb3V0ZXINCjYuIEJl
YWdsZWJvbmUNCg0KRVRBIGZvciBjb21wbGV0aW9uIG5leHQgTW9uZGF5LCBEZWMgMjAuDQoNClRo
YW5rcywNCkpheQ0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBxYS1idWls
ZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+bm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRp
ZQ0KPlNlbnQ6IFdlZG5lc2RheSwgMTUgRGVjZW1iZXIsIDIwMjEgMzo0MCBQTQ0KPlRvOiA8eW9j
dG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
DQo+Q2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+DQo+U3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEg
bm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQNCj4oeW9jdG8tMy4x
LjEzLnJjMSkNCj4NCj5BIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by0zLjEuMTMucmMxKSB3
YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlciBhbmQgaXMNCj5hdmFpbGFibGUgYXQ6DQo+
DQo+DQo+ICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3Rv
LTMuMS4xMy5yYzENCj4NCj4NCj5CdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPg0KPmJpdGJha2U6
IGYxOGI2NWQwYjlhNmI5ODNkNTNiZGU0OTFlMWJmMmNhNTY5NDk0NDQNCj5tZXRhLWFnbDogNmQx
YWI5ZjNiYjI3MGE3NzNlYzVkMmY3YzhjODU2Nzk2ODMzYjU1OQ0KPm1ldGEtYXJtOiBjZTUzNWRm
Yjk2ZGU0ZDI1MjlmMDkxZDdkODVhNzE3MmM2MjYwMDFjDQo+bWV0YS1hd3M6IDk5NzljZmE2NzYx
MDVjYjY4Y2ZhZGZkYWVhYmYwNDRkN2M5MTkzMTkNCj5tZXRhLWdwbHYyOiA2MGIyNTFjMjViYTg3
ZTk0NmEwY2E0Y2RjOGQxN2IxY2IwOTI5MmFjDQo+bWV0YS1pbnRlbDogODc5ODQxMTVlYjZlZDFh
NGMxNzIwNDYyOWRjYjEwMGY2Yjc2ZmU4Mg0KPm1ldGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjcz
NjY2MWQ0NTMyZjVmOThmZWU4NTg5YjcNCj5tZXRhLW9wZW5lbWJlZGRlZDogNjlmOTRhZjRkOTEy
MTVlN2Q0ZTIyNWJhYjU0YmYzYmNmZWU0MmYxYw0KPm9lY29yZTogOTBhMDcxNzhlYTI2YmU0NTNk
MTAxYzJlOGIzM2QzYTBmNDM3NjM1ZA0KPnBva3k6IDc5NTMzOTA5MmY4NzY3MmU0ZjY4ZTRkM2Jj
NGNmZDBlMjUyZDE4MzENCj4NCj4NCj4NCj5UaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZy
b20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj5HaXQ6IGdpdDovL2dpdC55b2N0b3By
b2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPkVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnDQo+DQo+DQo+DQo+DQo+DQo+LT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj5MaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj5W
aWV3L1JlcGx5IE9ubGluZSAoIzgyKTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cv
cWEtYnVpbGQtDQo+bm90aWZpY2F0aW9uL21lc3NhZ2UvODINCj5NdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC84NzczOTk2MS80ODk5NDYzDQo+R3JvdXAg
T3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxk
LQ0KPm5vdGlmaWNhdGlvbi9sZWF2ZS8xMDQwNjgwNS80ODk5NDYzLzcxNTM4OTk5NS94eXp6eQ0K
PltqYXkuc2hlbi50ZW9oQGludGVsLmNvbV0NCj4tPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0K
DQo=

