Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E7CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 07:59:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.29443.1654502345948843328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 00:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HXfHRSgD;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654502346; x=1686038346;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EYLXR++kM0tKwMJSP+jA8Hmsic4fc8mM8VDM6NKLDWI=;
  b=HXfHRSgDk40UNVQ8yJWvO0TBxZi+uyi3HM+QuOcybMAN5s5PsV2AMDL6
   iwvWBrOJ5PvMwYtt+iaiYzeRyP91jT12z4yBPKiO5m2y0e9emtU2uDUXe
   X0vx0Q19CgP07Sdoc1C7XxHpkAhqpcjVXzha7fVG7FGFpWFwy9Aa+ABEi
   aAZgaMHDmfT3HFWNL6l/MlMm21UO6WKujBi48O0WIj5crjXxC1fZO1oe0
   5BtoITWt0cqQzYlI2VnqlNBkurVIOQFhIXpf5eVKGc1QzAbsDEhGov32W
   HdBKa9ARclGIB3NTp/xMIcV7UX/UA+WUPyuFb9oC2i6JYSRCa5xSKDXhU
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="264469392"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600";
   d="scan'208";a="264469392"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 00:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600";
   d="scan'208";a="564817533"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2022 00:59:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 00:59:04 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 00:59:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 6 Jun 2022 00:59:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 6 Jun 2022 00:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7T22Oo/cSpRaVMyrvUo5ZjUwtm5pzmpcbbmK04/ECuMlVEvXAU4zbSUtqDt8E4e5vQ5wzo9j0L0ZQC37uyQyGQ48Ivya4IDPPgKtRcZfuofmoR+5IZyn20QH6wkaGVsFtr4gNgaBOU4q9hxZ4sVGIo1jgsVX6RzNeQvEzOEtch5554m6ujYsC3RdRfVwBS11jo4SPP5+OkfnBMipki2WHsm82Ja5I/p5xtAVwPt1oKWqv/82cwrc9k5rcd9ikfvpn/RsyXww6/HeDcv6LX+SuoWyI7M2sSpKZtNbV7AjrMWKvjWs8IyTHfYJlEUaG8/zTe7REyvg0sCrKuCiH+Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYLXR++kM0tKwMJSP+jA8Hmsic4fc8mM8VDM6NKLDWI=;
 b=RV7ZdjPURjgO6L/HmDkvD02Fntjzq+XgL/GYaEtMG1zyH3t3s/T8G9uLle99hznpht+iIEuzdikSMyy4S1nUgpJmVFbwT+JqpqAR3gxkKpDnWq06gNeF69cHxqeWLdfIAfAMwfcB3nkzXiGmpgYnQ7txjMi5NQ8iCHblrI43uC48n5Ub5+DzFMuq/thQBLDle50e5jTiKDaT92dxERHV+Co1LR6srCrUhlLuWzL8nJMLlLkrPtEhSk5oE2kUBU3hM+ohxE65dFWyfSg9RZKXEnirqUNj9Z2zAuqKg1r3QHVNNAR3qaqBBBdeeI0FEA8Czvng2s4BmUtkg8DkbxwdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 07:59:02 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::ed13:88f2:74ef:8098]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::ed13:88f2:74ef:8098%10]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 07:59:01 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1_M1.rc1)
Thread-Index: AQHYdcJ3WcfdHxGe/U2zPLW6AJ2d/a1CCdbw
Date: Mon, 6 Jun 2022 07:59:01 +0000
Message-ID: 
 <DM5PR1101MB2348CC46BDF8269CAD601701BBA29@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <a45336b97582ca801e52ce640752b0173306d3fb.camel@linuxfoundation.org>
In-Reply-To: 
 <a45336b97582ca801e52ce640752b0173306d3fb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24ac2167-c3dd-4851-9abd-08da47926b45
x-ms-traffictypediagnostic: MWHPR1101MB2223:EE_
x-microsoft-antispam-prvs: 
 <MWHPR1101MB22236EA8DA9B5F56A5DEC1C1BBA29@MWHPR1101MB2223.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +GVYiBqJEi8LC/+Jkw4ZXGSCAMJ9UMYKDka9YhcBHC7p1HvNAn5J+maa5KxeKFm1gK62RU0Bp6Lufe8UUVhC7basG5mG16/RUPT5xbWjp4YZqOJIgggp2CI/zy3EZ5MsA+4NCqYH2UxcYEZkcg9vrbc5eBUhO3GO42KoRo1z1HaUsdh+ckYAsWkf/klWoNO0iBz6CikyM+DWIltq6yHTKCGfgbVBZvuOPxf4WIf32o9SFna9TNv8z5g3DRkGcNxgUgI8HcrF8cYDVw+INsYhjb6m2KYSuNelMyfMyGK8XJGO5OAPsw5qLK52WHbDFCU12hsmvNCUFqZj7rWMhs/30o/Ek2PrE5PfYPhUOiYQbrPs0pjNwFRqLqhghzs2be60ZwJwJ4pa4g/FUY/wA25nPGyexKY83KqBNNatiV9gn8NMlfpnWl5E7vkKbMRkF42D3dpExXjBeHHjcB8mQVqlMk3ATDxhQwam3v45pNO9XgQiHwX6flN1X9aRqOGe6LuCjAt/GUF6Qu3AeKzpqPcZKxb/6caJA1V+PugbxIXG6CB/FLl+2eFbHu+E8fzQ6Ck04IHTtSWueJP03c9jQvtIhjGSo1Fzi9JSJXZrdV5DR8Zf8ydAb0IkwuMMzXrtARMhdR/phrr4CG26ARjRLA+I+8095YJq9xVIQWY31ZkBFme3Cin7EuL9xEJPZdSHxN8+uRAvxPNbgdX2ucJBCkblqqub21Hcfm1dWCi9ybJEG0PGxgKXIR66KWPonNeALCckRM7r7A+S9kDzvgXkxCYvTwk216GCXyNAsNzVJwqf73pVBCAKk8+z7DucDPyz+lFhlY9OG/ratDQ5AINhtGJf4H9nD6VhNzXBvNhQDkvlKUc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(9686003)(26005)(186003)(7696005)(122000001)(6506007)(82960400001)(38100700002)(55016003)(55236004)(53546011)(2906002)(33656002)(316002)(110136005)(15650500001)(64756008)(66476007)(966005)(66556008)(66446008)(5660300002)(76116006)(66946007)(52536014)(8676002)(508600001)(83380400001)(8936002)(71200400001)(38070700005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFcxejZqTWF0VTZrMUdVOEt6M1p4V3pTbW1ONEpJblZDOEFmQ1hBaVNjZjBM?=
 =?utf-8?B?NWxoRC9UMlhLS2xxbnBIL1VxNVVLM3BNb01KdlVTQXVnd1pSTzZVSk9YNzBK?=
 =?utf-8?B?TStET1ZyT1VPTFRMUkcyZE0yWm5hWWRhT1RVS2w3aWRFQkZlVEJSR0NNekpU?=
 =?utf-8?B?WVF2Y2RIYkRGQVVabjhub1dYN3VMdFIrdk9jUnIrNjZncFd5blE0c0NmZUNu?=
 =?utf-8?B?MWtYZXBFYjhvaDFlcDRpWXQySVp1YmJENU5ITlVvVDM4anlWMXdBSGc2Sit4?=
 =?utf-8?B?Q3VJQU13dXRSckRoc0pSVlR2M2tKL2NPcW9PYkRzeXVId1Rua05ieUg4eGJG?=
 =?utf-8?B?V3F6Nm5tOW1PcXF6MFBYa01LVHlYMTZGakoxZjlQby9iL29ueVhKeHFodE5r?=
 =?utf-8?B?Q0s3MkFZcFcrZ05BSzR3Q1ppYjRPZnlONUl1bDVNZFNQdllZWjJQMWFFeXZv?=
 =?utf-8?B?RGtNSy93NHhtbzZPTzRUL0kzOFlYOFlXWTVLVHA5dFZCUU9QcE1WZU1PeGJw?=
 =?utf-8?B?MFgvbjJVMWRjTFQzMTNBdVFxbUlXWFlLT0hpTURueWxJSTBMQ2FOdHh5N3cz?=
 =?utf-8?B?VHBJbWVqZWZNeWFnWkZRVDQvUFNBZ1hERUpLbE9ZbUNRMjJINjVXU3BEdHB1?=
 =?utf-8?B?Mit2dGtBMExoTWMybVk3TzhBNTdqUUxqNHRPNEcvTXFZYzZJZkxyTkxwak1N?=
 =?utf-8?B?dW1SMXgyb2Y3RDk0RGZaTytBbm8xemVNSjZSRE9UN1NFWHE4RktTWSs3a3Na?=
 =?utf-8?B?aHkxTkRhemVrd0VxMUJqbVpKb21HUFpuUlhlaVM3UTQ0NVBwV1dHNzJaVTBU?=
 =?utf-8?B?RW5nQTRQcXgzUjdSQlVibXd0WDlKdWhhTVRJSFk1S0QvZWhJZ1pBMndhUXdt?=
 =?utf-8?B?NWE4dlB3d2xLSmhvOEVZWSt2VElYTjBwWjhRLzJSU2plaWpBdUlUNkp1aHlH?=
 =?utf-8?B?Wlo5d21JdW5oWG5YSzBOVE9ZL05KUDg4V2lKSXdvclBxVmpjcjJzVnF6Z1Zw?=
 =?utf-8?B?RXdCcTNiRSs2M25oT1ZJNnJGQzJQaVMwSFZ6T3RxT1JVcDJzYUJjK1pHaSsv?=
 =?utf-8?B?SFQ4Y2E2TTl1TDFnQlhqdXVoSUVkdk1wcVExLytYb3BubVhVQ21tRWU0Z1lp?=
 =?utf-8?B?MmZuaEdpNlFUN1RVWkpYaDA4eVEzeWJycXNJVk9tdzVhcjBORzVTd0t6RGNO?=
 =?utf-8?B?QURYVGtrNUVTMjB0R1FEdzdqQ1hrRFlkWW4yMU5hS2pvYXZyZVNsekFhZGZT?=
 =?utf-8?B?a29vQ2x0eTJNQVo4V2Z3M21IZjlDQ1ZnR2lTRHBqY0hvMUZIcVRQNllUOWl2?=
 =?utf-8?B?ZnBqWDdmS0h3cTdOUlQ3Zk9XMTJ4M21MTmI5Zm5FZC9tREFwTXlsNzByaWYw?=
 =?utf-8?B?K1FFY2lkSmtIUmVZajAvV0tCbWdjNzh0VzFoNkpMRGsvczg5djhkUDZHWFRL?=
 =?utf-8?B?L2NWVGpnV2JFdkZseFRFZHlRbzJWTzRoUXVCV1hkR3FsWTRScTd3ZE85Rmsv?=
 =?utf-8?B?M1hhUHJoUkcxSjUrenFNajdUZUthNkhhSkRXYW1GQTl3UHFqVDlyejZENHpp?=
 =?utf-8?B?Z0t5LzNpczcrSDM3R0FaaC96YzFURCtxUWx5NHRUN1RJcDhWaHNLWGxVSEUr?=
 =?utf-8?B?SlBKT1lnTUpmamw2RHJZa0tNSVZQam9OSk5QVXpNaUZneXVIQjA5QmVwVVhG?=
 =?utf-8?B?WG8rRHM3bk1pZXpFdGtIem9BR3hCUGZEejljbjBOYWZLSUJFRmdpRit3VUZy?=
 =?utf-8?B?VFlUV241NTR5MCtuNW12K1dhVklIZzNqZWhZem00ZTd0dTdSR2NubnFHREdh?=
 =?utf-8?B?UjZqdGQ0MjVwcHNNN25ZYXBDenJPbVhRV0JMVFJBdVF6M01RTUZRakRjUjI5?=
 =?utf-8?B?VDd3aEs1WWJHVHF6SXowaXR3VWZ3bnl6Z2x3WEZiM0xYN0hSVGF0RXVaL2hU?=
 =?utf-8?B?VzNlR2l3SFpGeGZzejV1OHErQlJyVC9lRzc0S1VPZnExV01jKzRFYjEyMmdK?=
 =?utf-8?B?RGRlSFMwMVo3bTRlRjA1NGFzVk9ZSVUrVkJEczlYUjQ5MHRDYnpybHh0eFRZ?=
 =?utf-8?B?ang2Nk10b3QyY3lRQm9ZZllMUlprYnltMERlS0o4L1FmYzZ5R3M1SHpGREhN?=
 =?utf-8?B?Y253R0g1VGpJQVBzSXdydk9MT3R4dXhDazkyZjlTd3p3ZklUSXJGbis2NWUw?=
 =?utf-8?B?WWVoZjE3QitJTmVnZmFIWGNjOWtpWmx6K0xqWDM4ZE9MZU5zSFVNZ0JIYWlq?=
 =?utf-8?B?QjNBaDFPakkxVmVQN0ROYWwwZ0xVQmNYYzgweWNRZ2Ira2Y5bmNpeURHL0p2?=
 =?utf-8?B?b1U5MW5iNDVROGhJWnNSU3hHQkI3dW9oeUlYNEpJaVZaVXVpcjNidz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 24ac2167-c3dd-4851-9abd-08da47926b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 07:59:01.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PCdfWdAwpLH5V86+zZeNxn29I47EEqqmpJrE4dZo6wISdN2pDofvzzwS7XSVdn1tHsLDu5hVt9t+ksLrEQMLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 07:59:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166586

SGVsbG8gZXZlcnlvbmUsDQoNClRoaXMgaXMgdGhlIGZ1bGwgcmVwb3J0IGZvciB5b2N0by00LjFf
TTEucmMxOiAgDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9j
dG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQoN
Cj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4NCg0K
bmV3IGlzc3VlIGZvdW5kIA0KDQpCdWcgMTQ4MjYgLSBbUUEgNC4xX00xLnJjMV0gLSBic3BzLWh3
LmJzcHMtaHcuY2hlY2tfQ1BVX3V0aWxpemF0aW9uX2FmdGVyX3N0YW5kYnkgbWFudWFsIHRlc3Qg
Y2FzZSBmYWlsdXJlDQoNCj09PT09PT0gQnVncyA9PT09PT09PQ0KaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDgyNg0KDQpSZWdhcmRzLA0KSmF5DQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4gbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBX
ZWRuZXNkYXksIDEgSnVuZSwgMjAyMiAxMDoxOCBQTQ0KPiBUbzogPHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogcWEtYnVp
bGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9u
IGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXINCj4gYnVpbGQgKHlvY3RvLTQuMV9NMS5yYzEpDQo+
IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by00LjFfTTEucmMxKSB3YXMgY29tcGxl
dGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+
ICAgICBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by00LjFf
TTEucmMxDQo+IA0KPiANCj4gQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6
IDZhMzQ2ZGY1MWI5NmE2YzBlMWVlNTE2ZGYzNmViMGI2YzI5MmIwNjMNCj4gbWV0YS1hZ2w6IDNh
MGI3YTk2NWJhMzcwY2ExZmJlMmNhMGUyYWMzYmFiYWNlNTIwNGQNCj4gbWV0YS1hcm06IDBjNGMz
M2RlMDlhYTkyMWNhZmNlYTJhZDRiN2JjMGUxOWY4NDQyMTMNCj4gbWV0YS1hd3M6IGIyZjVlZjdl
NzI0ZDNhMjI3MWVmOTlkNzQ4NzM0NTc4Y2Y4ZmNiMWENCj4gbWV0YS1ncGx2MjogZDJmOGI1Y2Ri
Mjg1YjcyYTRlZDkzNDUwZjY3MDNjYTI3YWE0MmU4YQ0KPiBtZXRhLWludGVsOiBlYmI4YzFjMjZl
NTdlNzg1NjM3NjA0MzFhNTdiNmRhMzg4YjgyYmUyDQo+IG1ldGEtbWluZ3c6IGE5MDYxNGE2NDk4
YzMzNDU3MDRlOTYxMWYyODQyZWI5MzNkYzUxYzENCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDkwZmY1
M2I4ZGYxZTMyNTljYmMyMDFjNjU4YTRmM2Y0ZGRkZjNhYTgNCj4gbWV0YS12aXJ0dWFsaXphdGlv
bjogOGU4ZjU5ZDAwN2NhOGQ2MGVjNzc1NjU2NjNjZjYyODViOGFjYmJkNA0KPiBvZWNvcmU6IDE4
YTBjMzFiMzM4NmFhNWEwNGViOGVlOGU4MDRjMjQxNWE2MWVhYWYNCj4gcG9reTogOTUwNjZkZGU2
ODYxZWUwOGZkYjUwNWFiM2UwNDIyMTU2Y2MyNGZhZQ0KPiANCj4gDQo+IFt0aGVyZSB3YXMgb25l
IGJ1aWxkIGZhaWx1cmUgb24gcWVtdW1pcDY0IG9uIHRoZSBhdXRvYnVpbGRlciBpbg0KPiB0ZXN0
c2RrZXh0Og0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8j
L2J1aWxkZXJzLzc0L2J1aWxkcy81MjUxDQo+IHdlIGRvbid0IGhhdmUgYW55IGZpeCBmb3IgdGhh
dCBhbmQgaW52ZXN0aWdhdGlvbiB3aWxsIHRha2UgdGltZSwgSSBkb24ndCB0aGluayBpdA0KPiBz
aG91bGQgYmxvY2sgTTEgYW5kIHdlIHNob3VsZCBwcm9jZWVkIHdpdGggdGhlIG90aGVyIFFBXQ0K
PiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0byBQcm9qZWN0
IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0
b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+
IA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJl
Y2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxp
bmUgKCMxNTIpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj4g
bm90aWZpY2F0aW9uL21lc3NhZ2UvMTUyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy55b2N0b3Byb2plY3Qub3JnL210LzkxNDc3MDczLzQ4OTk0NjMNCj4gR3JvdXAgT3duZXI6IHFh
LWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj4gbm90
aWZpY2F0aW9uL2xlYXZlLzEwNDA2ODA1LzQ4OTk0NjMvNzE1Mzg5OTk1L3h5enp5DQo+IFtqYXku
c2hlbi50ZW9oQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

