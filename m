Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAD7C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 10:42:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.8204.1647600162187790329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 03:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=S+i/+NPZ;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647600162; x=1679136162;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XRnekhebpuNsxE+WEDojkXApBtgYVOrXM94mcacQ11c=;
  b=S+i/+NPZ2gZ2k2/yA0wdN2sh7gGdPxAG8bL+VKHgnvIzHm4HgucKSFI9
   kvyXl7WOW97L58l9xYMXn0b1x28QLJpL/xNzch4q8IAjwNT7JgkYM3umI
   lK4UotNaiDgxPDGm3hNWvq9s9OMeSIeOo+4iW489ok0toEBXj61Y2tYzR
   hRjlLtHphDCWpb8+Z5uYk/V2qqsmLIzsZLXAqoPYCOEGjGOLVNLecJlxM
   b7SvnIQ63iRym4ibFvNFFBoR81GnMfoSW8qDcut3juv8gaE6V+XtRA65N
   7xSzpqj37CNvBt8Z1kwGDz3RBfPbRb68EPIlndJVRjtMdNMSIMfpeDk0z
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="244567506"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400";
   d="scan'208";a="244567506"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 03:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400";
   d="scan'208";a="614321936"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga004.fm.intel.com with ESMTP; 18 Mar 2022 03:42:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 03:42:40 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 03:42:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 03:42:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 03:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHLtGngOeUCZ5rmdNmRlG2OOFtGcaoLQQAU9or1lyH0v5ejW8Zmo95vly9pb4xtbIXibCtoL1ShOFjpLBqQbfF3oyV7761YT+2RwjSGqxiv7R3ulVtYs4oTUr4/sgKZ1NKZSmSNe1+JPWn1sn3iN7KcyphMYNu8xT5xms/4e6Oa7NFXeFJeGfWDLFBd5Kfb84RX4O+DMZAzrhwerjh/huulb8sWuJp3FLmCxwOMY3YwgnWI01hrmP2ql/jiBRI2+uNMwK3uhCDsBb519/KNXr4QmKr/vSRcH1Mvcmc9dvNLEnE5Tc81YKaI/DUCG06nxRhemoakn6ILM2o6U1tXVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRnekhebpuNsxE+WEDojkXApBtgYVOrXM94mcacQ11c=;
 b=SKld1rgggC7jL8RFzQaDRvOrqZi0YHpxlJ6W/dnWioBBaPCv2KSdNhf+vYy2OI2FHZO6BU6Q8Yeq0Pgwk8y/KQFQjwCKELXNOHSiae7/G3CeH/dCWZlH4/EtXC7250qQyWYRJJDRenAleeORvgjwfxklKg5irWlhS2t3WN+xOJJWCxbWizF9I+OUsnqitulYzlCLAzT1FecOIU31oOvZOE8SeeZS8joc/JL89apwcyRCZtF00rALSys75qSa6hg6ravb97Rj7NXr6+XZF8sPaFmySEcHw8SE7GkOJVeYSIcBrb0p4vpWkLxSXR8qwJ5BgD8FkpPnresIBOnv4LSfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 10:42:38 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643%4]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 10:42:38 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	qa-build-notification <qa-build-notification@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.15.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.15.rc1)
Thread-Index: AQHYN/K2V624Fp+VLk6oPBA9NtqYL6zE+X8Q
Date: Fri, 18 Mar 2022 10:42:38 +0000
Message-ID: 
 <DM5PR1101MB234853E7CF9516509DC7FBA5BB139@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <8b4cbc719143fafed13c8a3ba6704510d3fa4e4a.camel@linuxfoundation.org>
In-Reply-To: 
 <8b4cbc719143fafed13c8a3ba6704510d3fa4e4a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9935c531-7e97-4608-2468-08da08cc058e
x-ms-traffictypediagnostic: SJ0PR11MB5182:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB51823281EE0D23FC0B990C18BB139@SJ0PR11MB5182.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NTTHJ5ddirJ2rWok5SQ64GbUcLLH9pLXxy+C2uZ3AHNKlveryfryCG2/qQAz7aau9wRsrJe32wHCXEPm/+PZjXL2k0pV7S4gv26TdLpN0WjjMth7Wt4mdEE71nxIG3HW5sAWj7WD9zDWaLpw+Au7/WzDJp6w9qI6CSV+hoLsYuuyCotMoD0DgbcsNFyMnoK2rwrI+Kq5KOs4vmwT4xdHUfcKZ1KwAZxbGAfKj0tzLAUEKEHESxaRZiuj0iwMuGmwEMoPAAHAhT1GaRcseOpb+Zb3IwD75bQPShmfweVScyfHVog0iS1jghSxYOjH1uCagPwS9YY1buMRar9DHFfiM4kTpYW7fUHTgVo0YqgGMqonR6xunxXUENTnTwuig+GqN4wZ7C0ZyUt7alpt/q/pA/c7aJ4+/+7gKYrkbMZ4ApElMwHHJwqzO4UZ5IoY7foKnIwzK875HU3jC8vmzLsLXg5U6kZniMe8wht20/xnmXX6NiBBIXKwUpQd0n8NZEEzi0j9ixVeI84ZTQ3S2w+N4FRXnxcaMqMRiVESMqupMgEoT41+ziAmE+btPv0/xjzOYttqH0hKdUhFJMvXNYI28K+nmHifBpv/m+a2CVK9lqhB06G3WoFZ2ro6upCct9dpgJHPryEI3EnE4DfT8jtUIK8qpXaVhkQkONfdxezX8jWyzIfODqDgsCgu7vjCY7+YcmOwVtwMsth1mmq/hRb9qwlmtOWlVMN9EzpJc6YvMD8WYZu1xfbPSwPo5bHc1GKF9/zJAW8ImkvzFj03RVEehRG9cTnD0UED2LXL2oU3TlDmq/ndbscpN+tjD0jmlPS8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(9686003)(110136005)(38070700005)(316002)(7696005)(508600001)(15650500001)(83380400001)(71200400001)(5660300002)(82960400001)(26005)(966005)(186003)(2906002)(52536014)(38100700002)(122000001)(33656002)(8936002)(55016003)(6506007)(53546011)(55236004)(8676002)(66446008)(66556008)(76116006)(66476007)(66946007)(64756008)(86362001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STE1Nk1RU1czZFVrNGpHU0dULy8wVG9qODF1cW9HSnFmOUxHMkhjOFJzSS84?=
 =?utf-8?B?UDVKZ0Rudyt5V3VaUkZFQ0I1N0lLc3VPUnc2UFhmbE9ZVzU0N0ZBdTRLQkdz?=
 =?utf-8?B?SjErWTBRRXlmcDZjS2ltRmcwci9RMXJjenNzblhndERrNHFNUVVueTBUMW1W?=
 =?utf-8?B?bHdYdVJpK293UmJYUFZRUndnNXAzTEI0N1JxMDFEaGIzODlJUDRvV2ZFaGZZ?=
 =?utf-8?B?UHJKYlkwMmZaVzhuVkFZTVozNXNCbmVhYys0Z3lIMFV5bmk1R1QwaVJNcFdK?=
 =?utf-8?B?QktINDgvTzNGZmQwWWRhdmtUL0VaY2d5dmlPVE5wbVRvSHllQjBmdkpEbEdK?=
 =?utf-8?B?Y2VpVk0zK1ZwUWNMTlpIME9HTDJSR0orM05zeHcwL2pzVzJIL2lvbnlhQTh5?=
 =?utf-8?B?VmJCWlYwYjdhNlJZOVFqbUZyamplL0dtUGNzak5RT3lYV2lwZm9WaWlHZGho?=
 =?utf-8?B?NzRZdktUSGlnYWpOOW5EdlAra2todWdMSXdVd2dFckdHM0JocURDZGhid2NH?=
 =?utf-8?B?akdaeVlHRDNQODJEQkV6ZWQveFNmUGVDeGFBcDV6QmpTUzVHMmFhVG5mNkM4?=
 =?utf-8?B?Y0FJSDJ2UnB0YitVc1pqNEVEVS9wVlIwUTd3KzhzVXVmaVBhL0JtdDcvTFdM?=
 =?utf-8?B?bjZmMXZsL2l1SC9aQ2RWSW5MQkdKOTBaNDJsNWtLeG5xM291bVhCeVorZlZn?=
 =?utf-8?B?enNYZXJBS3ZPTFI4UllmN0pUVWNaZmdWeitSVldzMEltZk1saWV3YStJcU85?=
 =?utf-8?B?R2w2NDJXT0hCeXdwVE5JaDZobmpGWlFuVjJDZ3J4NUVLZkx0UFJYalpKaUtC?=
 =?utf-8?B?a016TXVLRGVsMkpIckRmVG83RVBpTnEwbko4VktCVzlmMUUxTUlsbjJ5dVdF?=
 =?utf-8?B?RUtIMlA2SGNJY1dFRVpTVWE5ekthRzhmdC9ZdFVpeFZCb09yMzROb3BFWkdL?=
 =?utf-8?B?Zy90RzFDYUEvQTk4OFQrQWhYSDFWWW5VSkl2dktTc2xmbVgrYlJvYm5La2Nw?=
 =?utf-8?B?UEltYXU5UTFHM2NuQXR2VjAyS1ROQXBsVFY4cm9keUNwUTM3ekMxYktGWG9Z?=
 =?utf-8?B?UC9HaEJ3K0sreWJiZU9WeXR3ajdkODIvblFNeHNaSlR1dnBnckFMSlBVeVlZ?=
 =?utf-8?B?b0dCNW1HQ3l6bXlKZi9IM1cyZ0ZvTjRrNzJFN2t4ZndWTjZ6c1F6RmNEMzRM?=
 =?utf-8?B?R2YzRTg5R2RETjhuU0krb2JnWG9VQ1hjZUlnbHRnci9SZG5ub2tWSVY4eDRI?=
 =?utf-8?B?TXF3SFhncnBDMkVOdkJwdDc4aHBvUE1yeDk2bXArMW8vZEFaRG51S25ZQVJp?=
 =?utf-8?B?NXVleEZTaERtdGVrOGVjWDFpYThUTjZTOXlhR2NKdzRvUWFNaWUvc3dwTXRP?=
 =?utf-8?B?NW1jSVM5Q0ZMdllvd3NTQm5ZWmlXSmlBWHV0b21RbEpMSW9UQUVBUStnSHJm?=
 =?utf-8?B?bnJVZ2JONGJRWVVHdVNqTlFIRGxNdGpHTmZWZW9KQmovYWd5NkRMTHFWVnRW?=
 =?utf-8?B?aEZzSTJWTDBaWkJLQ3lLR3p3MWtPK296ejRnSFB0MGc3RHVuWnpIaVBrMUpT?=
 =?utf-8?B?UVdFR1dMR3FWb09QK3NraG1jWjNidGRxOHVkeStJL05ldVBHZDNKWkxnUXk1?=
 =?utf-8?B?WDhDT2ZzbjJJRW9UcUVyWlNWMWV5WEkydW5UbVRnQ2FZVnpUak9mSDFKNnhu?=
 =?utf-8?B?cGFCanVORTYwOERBL1VZOVNtV0o1VUt0N3pJblZWS3VKWlBZYjRnN3phSHpQ?=
 =?utf-8?B?SXhqZjErd2cxNWQ1ZE1BTW5NRDY3NnFJWGxTZ2o2VmtCVjBFVVVHbXJhYmdn?=
 =?utf-8?B?VTBJZlN3bWhzeTlSaGF6VmVJQ3p5YmtlMWRrR3dxblhLL0pQbnZLSXVGRlA5?=
 =?utf-8?B?WEZ2L0hLbkhudnp3ZVBGdm8zZVM5WjFteEFLczZsWExhSndGd1Z5TWpMNFRG?=
 =?utf-8?Q?ymy33CUblQorpQBQxoQOm2ko1/jAaPkP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9935c531-7e97-4608-2468-08da08cc058e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 10:42:38.5429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Jgewl+Aqq/4xwg4kTQx043yA9oT6fhM3Zs8DvFE+mdbKuBrp7rCMSUbWLrI4enzsYZNxhNr4bbZK+IeMA8QorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 10:42:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163445

SGkgQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjE1LnJjMTog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk5vIG5ldyBp
c3N1ZSBmb3VuZC4NCg0KDQpUaGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55
b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDog
VHVlc2RheSwgMTUgTWFyY2gsIDIwMjIgNjoyNyBBTQ0KPiBUbzogPHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogcWEtYnVp
bGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZz4NCj4gU3ViamVjdDogW3lvY3RvXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBh
dXRvYnVpbGRlciBidWlsZCAoeW9jdG8tDQo+IDMuMS4xNS5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZs
YWdnZWQgZm9yIFFBICh5b2N0by0zLjEuMTUucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRv
YnVpbGRlcg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+ICAgICAvc3J2L2F1dG9i
dWlsZGVyL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by0zLjEuMTUucmMx
DQo+IA0KPiANCj4gQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IGQyMmNj
MWU1ODdjNjUwZmQ1ZjkwY2RhMzJmNTcyMGY4YTMxMDVhYWMNCj4gbWV0YS1hZ2w6IDlkZjdhNDBk
ZDBiNWUzZWUxZWQ3MmU0NjBkYzk5MTkzZWViNGJkNmMNCj4gbWV0YS1hcm06IGQyMWRlZDA4MmMy
Nzk1OWM4ZDYxN2ZkMThkYTYwYjIzNmQyZWM2MmINCj4gbWV0YS1hd3M6IDk5NzljZmE2NzYxMDVj
YjY4Y2ZhZGZkYWVhYmYwNDRkN2M5MTkzMTkNCj4gbWV0YS1ncGx2MjogNjBiMjUxYzI1YmE4N2U5
NDZhMGNhNGNkYzhkMTdiMWNiMDkyOTJhYw0KPiBtZXRhLWludGVsOiA4NzgxZjgzNTJlNjc4MTRk
YjdhMjY3MDg0MzdmZDA4MjA1MjRkM2Q4DQo+IG1ldGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjcz
NjY2MWQ0NTMyZjVmOThmZWU4NTg5YjcNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDA3MjJmZjZmMDIx
ZGY5MTU0MmI1ZWZhMWZmNWI1ZjYyNjlmNjZhZGQNCj4gb2Vjb3JlOiA4OTA2YWE5ZWMwYTgwYjBm
ODk5OGZiNzkzZjRlOTQ5MWIzMTc5MTc5DQo+IHBva3k6IGI0MWQ0ZTQ2ZDMwZWQzMmUxMWQ2ODQ2
NjcyMWEwZjQwNTZiYWQ3MDANCj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVz
c2FnZSBmcm9tIHRoZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+IA0KPiANCg0K

