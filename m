Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE95C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 03:10:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.3094.1634094654208880086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 20:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=crLvvNnB;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214484821"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200";
   d="scan'208";a="214484821"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 20:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200";
   d="scan'208";a="659363352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2021 20:10:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 20:10:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 20:10:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 20:10:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQDcYyDK2rL3AzFV8gstMq6/A98EpjynzDYSUy6zLsTpLuDhSk+TuKyhIGrjX6xQYFqamzf1OrQS6sOdaEalFuq5qVXl6TtPiaAJUrFJHy17p344Vg4tSYDVmLh87XQc7+zGRqLnYIcS6OD62dxDXJIOemjCT9JPkToy9u3cYCP+ssLgDxag8PS8cuaAn+oSzRS1Z48au2Yn+P8A4Ww401/UWjWP7ByhClhtaLCaRXzf82gpkpKOKTWYxpoPcELTUkbje2jKU7Wwz/mjo3iE/JH7NKtSYFR1zFEQp51P+TVhVHpq4MVTmHkz51uEESxcp10LVeTuCc9BHT+3hJ117w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE2OhUSfuOIn9TtZ5ukbjYioFdxE2tvV/I1K14/IZJ8=;
 b=hwLhlRzm/oDlZHiRup76sEA06bc+PFYJk62yP5bHY+hLbfXnU4HAH9J+5wS6LvVxpw1Z+rh7T9+XH7i595JZJtr2LSnWsWlDlm6Qqs2NvPauNO8SeNhDU8mLTrVzBKF9RwALfed9i0YpfZWioSEjCYxH2QWGKJdLjpny/rJCaEF1wwl47rnaJEDOoGm2Sa1kKdE890+m/pGMyUCtqvN531we2d9/ownzXHa2YC4HCLP+tA9shNWM/hzfYsmI+0vaDFE3tRv6t8s0y5jm4RLN7OIUJ/nLO4JMR1IESUFU/Q3+o6j5FkNeCtUCkTC+STKkGYoBpuuqEiMzCdFbg8i6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE2OhUSfuOIn9TtZ5ukbjYioFdxE2tvV/I1K14/IZJ8=;
 b=crLvvNnB463uNA03N4gv42Z6zc1POismJMIBi3VxvYqauX9lU99Fvr+INRm6MLkJybdqC8TTgPHFk2d2TQompj2mENfwA/pKt6TPhU/hazBSE+ClrQh4LaY0mlK6Vq9kkMNa7RMduo9zdbyNt+D7LAqT1z/Ey1PCNWT/6WcMuUw=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN6PR1101MB2276.namprd11.prod.outlook.com (2603:10b6:405:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 03:10:51 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 03:10:51 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4.rc1)
Thread-Index: AQHXvsToIAiAE08XGEa0NbZmYdXFBKvQQfKw
Date: Wed, 13 Oct 2021 03:10:51 +0000
Message-ID: 
 <BN9PR11MB5372FCCDA5427B1623204375BBB79@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
 <4a91fd213b93c091a72f70e76ad1d3d6bc085a0c.camel@linuxfoundation.org>
In-Reply-To: 
 <4a91fd213b93c091a72f70e76ad1d3d6bc085a0c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e5e465d-d143-4ac7-9b4f-08d98df70fcc
x-ms-traffictypediagnostic: BN6PR1101MB2276:
x-microsoft-antispam-prvs: 
 <BN6PR1101MB22763757322B1C4744366F56BBB79@BN6PR1101MB2276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OvpcCnwYDYJDxZ4DOSrwyr8E5ZzA75KfKonBFfCXMw9GwxqhkYsJtOuH5GGWzF16FFoAPq9umaCYT9zCf4/1jiMOHitXxVADvAqgxL6eOzzkSz7DYFs0jTlC+SpwfoW+Bx3apTK987XnZDNlI1Wn/kI3UuLOFcB1z+NLuhx10+8SMnn9nrcB55curForLdFwTmCRxesNt7r/KJwy/OfghGXgvl5KdEUIIQ0xN5waG8IaxeqJp1ZEAXtvo/0IS76P7DZTm9WcP3E/XcILYctLaETN1cZoqSAdfPWAe9N7fDSNOrka+evVgi5nLeYO5uEcj3M6+CE3vO07LiY2ICLc9XikebzKuBtJj6az8Davkduws8Z0E4VMLTo8eBFYWI81Q58PZxSPmuuTjvBpx2jC70KvTOOcqC5niXZIhiAdUHeiVgrqlx226PvXr+zOTRai9khfODwMretehdWLV1YTsScjABW0oHcuVGGxEm/dbMC1/tV8fgCiqJlCmwdw6tgFkZ4v3eMdmzhXyJkHduxAwlydD0fC4VU/BytwHOl6G0vQhUgzS03JRm+aVOJI5+UqYTmZEV36n0EOsMA9WoCfYOibzFYbfBge+Dka0D+qRSeaB1knrP1CXMzR8KBmBk8hSjOKJ137DmDwiO6h8u22aM11UfCZE0dYmvRU1bsFpLoNvZkj6CfNTiBkZ8vMnqYEJXFUdTl+fT6/c0xs6kkIAwJI0QyoNtTq+8aE3iWBs7YgE7G+stwrGkba/qjkolfy5t2Xf6NN/9pUjl77/5To+dDfvxh14rIz9SeyF9Vn+Dp9uaLGu4kbetnRD+F4Czwbs4/CpPDnU3ashSIpSeT7Cw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(66476007)(66556008)(66946007)(66446008)(64756008)(38070700005)(76116006)(316002)(966005)(508600001)(71200400001)(110136005)(9686003)(82960400001)(26005)(53546011)(5660300002)(83380400001)(8936002)(6506007)(8676002)(186003)(52536014)(33656002)(86362001)(15650500001)(38100700002)(7696005)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aVZ6ZjlWaXU3b0RodjkyOFRTUzJRYTM0UUFXaXFreXBBSzZZTUdSRGU0NEhY?=
 =?utf-8?B?eE5zNURDTXFTSUNVa3I4RDJpY0VKc1ZDNHNVck9RSGVDdWV4ZHE2YlcyZHpk?=
 =?utf-8?B?SWdLSmFCVy9tWVhyYzV3QkRnQndBZEFyME5JSXRyUjdIaHZ0WHp3VGxvNldl?=
 =?utf-8?B?WUh2M1ZpeTExUU5zQTZtWE43QXEyajFQUjhxeFB0SjFwaGluOWhZTys0UWxE?=
 =?utf-8?B?a0EwdXFMaXM4SmJ3bGsxZmtRSmhCQ0xPT3V3ZUhPL21EYW5jeWlKaVlGbWIz?=
 =?utf-8?B?V3lzR2tiRDZqa00zcndoMVpsT3lXQk96ODBiWnk0cWswTUxZOGdqUVpieE00?=
 =?utf-8?B?VHArcHF2QzFBdk00T21VeitTYWtTRXdzUWJVY1NrMUxDM1Rsa0tSaXVnRmxu?=
 =?utf-8?B?QU1KaCtmRHovcFI3RERXRk1CTjlTaks2cTdlVmp2SmIvN3JtM0dPa0Vudktp?=
 =?utf-8?B?U0RmTkNIT1BSZ2daYWNXcnVObTFtaHNGOUxRbHIzNmpGRmcyVlNaR3EwY294?=
 =?utf-8?B?UVRPbUFnRVFrTU9KbWRYSEw2KzlGTWRpRGIxbmVBc2Y4bDFvdzg4dmVUZmc0?=
 =?utf-8?B?ZG5lV256SURBYUE5eDA4a1FVc2I3RFBMVnFDTEZjZmVPWCtVSjVOYWdLWk9F?=
 =?utf-8?B?SGFQejRxTXQ2Nnl6TnJycjZlcXhYSVdYTlUwSjBwV2JxMzRaZmNKN3BLZFhJ?=
 =?utf-8?B?aWk3bHh4UTE1SWkxMHNWVyt0Z1pvMnMxdkxuSFBHdzJ2TjhHUWVNeVJ3WHNT?=
 =?utf-8?B?QmhvYlhhcmJUdGR4KzVESFhEMmNjZHdrSGRTNmRtejNUMm41TzNuLzVHRzhD?=
 =?utf-8?B?SnowUkhkS1d1bGxhb1gxU1dIMU8xWEVxcHJXeEUzZkVMSlhyekFkQ2NGSWY1?=
 =?utf-8?B?bjlVS1dDK00xbXdXQjQ4UnZJaFJWcCtGeEpQUk5PTS92VElmRS9SZUtpajJU?=
 =?utf-8?B?Zkw4Si8rUlI0eFlHdUFnWktZdkcya2plVG1LV2FDYlRKSjNjQmhBaTJOcS93?=
 =?utf-8?B?UzVjenJTMzlrQzFuZkJvVmsvZmdNaFFSRmlPZDBNd1pxeldWOXhqcTg5K2ht?=
 =?utf-8?B?WTlPNmthMm44Z3FJYnp0N2dSL0VRRnVkL3pxMFlaeHdvekV2WThhUXlYMFli?=
 =?utf-8?B?N1Bma1BtR01jSzZFRDB6NHkwQkoxcHJKNjJRM3FYZzVwZnBPc0RlV0ZxRGlK?=
 =?utf-8?B?YUVSc3lZSkFkRXNGSDlHR2hrc1ZQajYzbmR6SXorNkRKd3dIajlabFN6aU11?=
 =?utf-8?B?NHl2VmtiOWFqOTNOT2RSTGJmU0RCTFNHaFhoRGtCYzUzbFRkVml5UER0SEc0?=
 =?utf-8?B?RCtJYWdrdUVhRThIQUZ5RkxjdWxWTGh3T3BKYno2cUFRaCtoWDdrNnlOYVY2?=
 =?utf-8?B?d2tQVHJUSFJaNFBPVW41N1h1ekRCcEthelhGaU1lM2FJK0hFMzcrbCs1bk1X?=
 =?utf-8?B?M1ZMejNCM2lEMmtOREc0WTZhWUNtZGNlV3B5cW5FTzBNd0FORVk2STlZNkds?=
 =?utf-8?B?TGl4elBLOFFJdUxtQVVaMWl3ckovNGxVUkFKMTdUZEVIYk4rSlFFNS9Td1Iz?=
 =?utf-8?B?aGFKeHN4R2FRVVBwWktERmJtVHU0dmdTeCszNUVqVWE4WFg3RmEwUGkrcHdY?=
 =?utf-8?B?djdwQ0owYmppc2d3Q3UxZlM0aWdJejJtVTdHUW9VbFd6MjNUZTB1THNHbUZz?=
 =?utf-8?B?TjdCRURLQURXN0lBeTZnRmp5ay9VbGJKNlRoY2VKaUVBenlsbTlOWFdwZks3?=
 =?utf-8?Q?gRmhn8ReLryfwNQ7bl7v9m3QMjQVyKRHQIza3E+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e5e465d-d143-4ac7-9b4f-08d98df70fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 03:10:51.0843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xArrF0yGmx1vAsQQvItEv1JN7xexwor8cbJRYr2//O8e/fvaQNlotJNy57nT0MxL86/g8rIsCkHA39yem7wvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2276
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 03:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156889

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy40LnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1dGUg
Zm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0ZXN0cyBmb3Ig
Zm9sbG93aW5nIG1vZHVsZToNCjEuIE9FLUNvcmUNCjIuIEJTUC1odw0KDQpSdW50aW1lIGF1dG8g
dGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQNCjIu
IENvZmZlZSBMYWtlDQozLiBOVUMgNw0KNC4gTlVDIDYNCjUuIEVkZ2Vyb3V0ZXINCjYuIEJlYWds
ZWJvbmUNCg0KRVRBIGZvciBjb21wbGV0aW9uIGlzIG5leHQgTW9uZGF5LCBPY3QgMTguDQoNClRo
YW5rcywNCkpheQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFhLWJ1
aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4gbm90
aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1
cmRpZQ0KPiBTZW50OiBUdWVzZGF5LCAxMiBPY3RvYmVyLCAyMDIxIDE6MjUgQU0NCj4gVG86IHlv
Y3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8
cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6
IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1
dG9idWlsZGVyIGJ1aWxkDQo+ICh5b2N0by0zLjQucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2Vk
IGZvciBRQSAoeW9jdG8tMy40LnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIg
YW5kIGlzDQo+IGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRl
ci55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tMy40LnJjMQ0KPiANCj4gDQo+IEJ1aWxkIGhh
c2ggaW5mb3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiBjNzhlYmFjNzFlYzk3NmZkZjI3ZWEyNDc2
NzA1Nzg4Mjg3MGY1YzYwDQo+IG1ldGEtYWdsOiAyMjhlY2MxZGVjMzkwMTM4YzQ0Mjk5ZDFjMjQ0
YWNkYTlhZDc1Y2UxDQo+IG1ldGEtYXJtOiA5ODE5M2YzYjYxNjdlMDdjYmI3OTRlOTZiODBkNzhj
YTE3NzllYTRmDQo+IG1ldGEtYXdzOiAyN2JjYTgxYzRkM2YwMTM4ZmRhNTgzZjllYTk4ZGY2MTUy
MzMyMzMzDQo+IG1ldGEtZ3BsdjI6IGYwNGU0MzY5YmY5ZGQzMzg1MTY1MjgxYjlmYTJlZDEwNDNi
MGU0MDANCj4gbWV0YS1pbnRlbDogOTAxNzBjZjg1ZmUzNWI0ZThkYzAwZWVlNTAwNTNjMDIwNTI3
NmI2Mw0KPiBtZXRhLW1pbmd3OiBmNWQ3NjFjYmQ1Yzk1N2U0NDA1YzVkNDBiMGMyMzZkMjYzYzkx
NmE4DQo+IG1ldGEtb3BlbmVtYmVkZGVkOiBmMjE1MmQ3OTA0MzYwMWVhY2I3MGRhMWEzYWIzNmY1
YWM1NmYzZTI4DQo+IG9lY29yZTogYmIxZGVhNjgwNmYwODQzNjRiNjAxN2RiMjU2N2Y0MzhlODA1
YWVmMA0KPiBwb2t5OiBmNmQxMTI2ZmZmMjEzNDYwZGM2OTU0YTVkNWZjMTY4NjA2ZDc2YjY2DQo+
IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8g
UHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lv
Y3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzY2KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEt
YnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9tZXNzYWdlLzY2DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzg2MjQyODIyLzQ4OTk0NjMNCj4gR3JvdXAg
T3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWls
ZC0NCj4gbm90aWZpY2F0aW9uL2xlYXZlLzEwNDA2ODA1LzQ4OTk0NjMvNzE1Mzg5OTk1L3h5enp5
DQo+IFtqYXkuc2hlbi50ZW9oQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gDQoNCg==

