Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81994F8A16A
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:05:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12363.1776341148127203332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 05:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EIFb1D10;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776341148; x=1807877148;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uOSHYk9HztxAkRmwt5/W1sDoA4yxyZ4oQ8Y0JeP2vBc=;
  b=EIFb1D10sdlX8mR5qvLWRkRBy4fReRT1nEQjHnhvHi1SH2d+DlXLd2de
   +timVY04NDAgmDEdHFN6AMTE9dTHMOBzG4JLJ5O9rXwaijj5hdQyF12fU
   VgTLpoYXG4nUcWTyZOHc4LCjfkianjYCbdI0uT+saq7QDdeHNJNnLdhCu
   2nrle/bu8mJE7mL8xS05Z8szkt7XzK4RuNLgBBlpeJBc5okJtz0KeoSzD
   MeEJW6VUIblzysYlzmxinWWlvnxSQsaMjFCWB51es3xLAewElhggTiHVx
   Kpp0d9J0OZ/Mz1YjNaDlJmCwjpFUhG8NsKyoGEVw7S72d2CGtAwzRohPS
   Q==;
X-CSE-ConnectionGUID: Zr5pTv/BT62U3mWBbtPfkQ==
X-CSE-MsgGUID: ewhX4JIdQuiUorJ9NkZARA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77409883"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77409883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 05:05:47 -0700
X-CSE-ConnectionGUID: AdX2eEtuTRG7kk3hlUL0zg==
X-CSE-MsgGUID: EmRCW7mNQrafnAkA73SssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226002318"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 05:05:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 05:05:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 05:05:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 05:05:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjaErI75+YMOMQI6ZfN+1Z0t3l/Cj6Ps6FrHqhVFfjxiWlYuagJM0EqQKz8HljsyO4vdUAXTQhvdGALrNbWeQdiii8UH1KoOjjQfM0HJPG6VLrV2LMWfUb6A4FTjBoNYEYACphWLHUDKKFnzbY5fvSofpXb79zoDgqQ8dwnaIBXfPN9jyCzQsvwfMnGUmccPA9s3O9HiW/bPoJvkWTFOjCX3U7y56cpRVYilo4wXXsXsgIw5BvWsBr3U9kWl/5NEgfhWTBK8O3Fz9QpfQmBU8ieSwM0rhXA/lYxc1tiXW4i1D4uNsp2snL0m6vIdc1CQ2zOCiefoy/xvOOMTt+yGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOSHYk9HztxAkRmwt5/W1sDoA4yxyZ4oQ8Y0JeP2vBc=;
 b=ZqaMpU+u3i2KKJlO73rYiXMrEQY3Y3MO/Ph3be+qsb+NNO8TvgmNzE8lZlcm6snJYj6usXylmws8ArYZnuFuCS/tnoQgkCXWHqc/ibzkR2nXhW336oPnrYs9cTFQv95HwT1S5Rs5Uo0RjyW17rILpRx0FaBuYKAVsz68ixk5cUdmo98PFuy1blOGjgrbaSBQj7v9FkLF4V4vf3+YetEhswDXHyJEzNoDtr1desXToI/h46z6clqBROLYcX2Z25I/b9n9fofpy8boP/lACgVl5E42JsovYRq/nGP2hnwAcPVUafKlsancLtigaem36NWBw5Cvr40AI3Xw6MKwkXsuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 12:05:43 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 12:05:43 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto ML
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.35.rc1)
Thread-Topic: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.35.rc1)
Thread-Index: AQHcySEzZGmAuduPnUScpYccvbGhO7XYz08AgAQdwwCABLEnIA==
Date: Thu, 16 Apr 2026 12:05:43 +0000
Message-ID: <SN7PR11MB7018CC2965F66F525ECB401AF4232@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d78e44a99-02fb8520-6c59-48c1-9ac3-64e44075a988-000000@us-west-2.amazonses.com>
	 <DHPSKCPED9UI.2AFCAORVY8PDM@smile.fr>
 <aef6ae9103b5a4ee85381fbaba4fab7e129bb4c6.camel@pbarker.dev>
In-Reply-To: <aef6ae9103b5a4ee85381fbaba4fab7e129bb4c6.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|IA0PR11MB8355:EE_
x-ms-office365-filtering-correlation-id: 8debd5af-94fa-4079-fd64-08de9bb07c1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 2vN0APGw8QFzVUCjKOW+aHInxStwSVQSRbJbkQLsE70/Rx0lhQE9olq8zqaKwoTYxgNbzb5/4XDFUDUa9NE4cKA8YCEPmQztEJlzv5d+KGkrAaK0e9aKZRCuegz6owgS0x0v6uHfVzmr/CEpiyvxJwU0Y0S21jmrGsPxm7s35odYkV/lhjV7sq2Q3H9ATPiN0SeTmxkqmvu6WMPTjblLY0JBVfoTS8TiDrtCWXtHgwL/2cItFchcDEhNEVK13pOhyaPUFdXc0pW1vrHFdFARUsxn8M4Pbs2QRKVP8O2N1DyYnpq1u5riklvvQV8194Zr02xtPBrpa/HKFZVp1sreAqM9fhEZDBkxpwi6ZNP2Vt1+FG+Jv/eXkqFlyJMKfyq2kSWs/WKmmMa0oBgmY7zQhPC7TRdHr5LDN+PwRkWtmUWdtxSVDrIi1/pcr9diJ2ccDsWq6RR9O0qUnr3KF5pb2bbW039uhpLCcLGD8yg1zfrOQhATTxqa/sGar1UnazoEuGYF+UFG10Ycw1clqKdYsEr7KRTx4IXQLC3t3+r5mFIQwV1onJfhJsXXXfl5H2r92dD98dgRV+06rRNwurUcEf09qnPltRCIu3B9dJ0XeCZxbffONRx9o0XoLgsItlk1aji0p5mklZyN0F71SYBJKBccN+oNdxLdSJxWYVL/TcKsII/dvwPDPpwMeKhF7mxhWVVpUSOtvkhDSlQsyR4qDiFoEf/OXww6xnRfUBe41b0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjRrcW1sbkxYNW5qSEMyYWJOR2FsVit3V1FkQytKOVJRWmRjWkhJYk80ZVRz?=
 =?utf-8?B?UmVyZnloTGVtMW5kSFVxc3o2eHpETlVtK1doOVQvYjUvdHNvNWNwOWUySlVu?=
 =?utf-8?B?MkFyWUxvMlNnZERUbHFWajN6TTQwcjEzOW1YaVoyZVdadk5XWDhwUkdtSmtX?=
 =?utf-8?B?ZHJUZXcwUkdFeW5nemlRck9BY2VMQWFaNUVibUUwQjRwbXFiTFYyZWRQYjJh?=
 =?utf-8?B?b3F2T1VKVFV1K3I4QVYxZEhBYytXSWZBdWtLMWlhdVp2TTFKRXJxUTdPMU1q?=
 =?utf-8?B?Q3pYZ2l4WWlBRlVTRmJXbFM4NHRVNGJRdnlMdzNXWGgxdTNocU11RXJZQWRJ?=
 =?utf-8?B?aXhmNysvdXhOZkxRdGFFT0NaUVRPRDVRUEM1VXdWRkw2Nnc4R2hRQUtkQzkx?=
 =?utf-8?B?VUxTeXFxbi9wTlhaVktHTzBTWXpiMUo1ajl6Z0NOWTJHNWRTOFRObzFrZXdW?=
 =?utf-8?B?cnVPT2xvSm9Eclo1M2FEVnE2c0o0MEtHbFptOU93dFNJcmVvS28zMC9HV0Zk?=
 =?utf-8?B?YjJTbGJxcnRSd2VEVHV1VlNhN01XNHNLVGNqcjJpSmtKNFVrdXBrdi9EaVdZ?=
 =?utf-8?B?RDVIbXZYRVlGbG5rVnRpaXI2MGNPK0o1d05MLy90RE9hZEZBc2hBN01UTVdR?=
 =?utf-8?B?S1kzUE1ISUJRYVpqZzZSQjVtMjhNRmxScWg4U1BLdHBkd3F2dmNqa2RxZmtV?=
 =?utf-8?B?N1ArbVFuMG40SXUvb2xwc1pBZHVHbnVablBVclRqRWwxQ0V2TUZIckVmMmhH?=
 =?utf-8?B?b3hiMUo0ZVFjZnFRbFNSR1E2N2w3WmFzeFJTc21XcEcwbGdXQkkybVIzYkZq?=
 =?utf-8?B?eGdETGN5TWh3Q2hjbktvUVVQczNOS25kd0RJUTR4VzQ1Qk5lU3hrVEZjZTg0?=
 =?utf-8?B?ZGFJdGNTdUMrbmlJQXRTS3dlM29OOUhyWlRYNUc2MnNiVVZkTmpjaHFqUHUx?=
 =?utf-8?B?TDZheU1nT1dIeUJ5bzRRaGYvS2xYVVBTRGRueTAyK2RRNmErK2poT1JsYUJ6?=
 =?utf-8?B?dUFjR1JFaEdjWk04dS8zRG54OFFvcGxKeHpWdlZaM2V6OUt3bGZvOU9vTTRm?=
 =?utf-8?B?S0hUVy9uMXprL3V5VU0xVlJDcHlncWdnMVdNOFhTNnZXWUxmOWwzbHdmRWhn?=
 =?utf-8?B?WkdLVitqVmFkZW4vdGh2dlpTUU83N0hBUVBSdDBtQnhYS2JDOWdXWUtjaFd3?=
 =?utf-8?B?a2lvK3poKzYzd1RjMFZpaittclBobHZIYUQ0N0xhVmlkV0hwUmtkY3h0V29a?=
 =?utf-8?B?U1hteU9VN1lCS21wK3hTdGdtZGh0aWxuM3A0clpPeFU0NllLVmpROU5ic1ZD?=
 =?utf-8?B?ZHJ0Z3ViU0wrSW1penU5OWMrRDh0STY3dnA4TEk1MzNNZk1uc0o1QzY3OTlC?=
 =?utf-8?B?QzNVYU80R2kvRGpIZVY5TlhCUTBQemI4d1hHdTdCSnFrTUxodWdBUWJYOVkv?=
 =?utf-8?B?WWVtSVNHMGxDZTZLN1VuTVlDZ0FsQThMTnFtckFmaTVJM1B6WlpSaDNtbzMz?=
 =?utf-8?B?STh4UDMyM3djN2dDRUIxRXNLejJXanN1MGJSUHE0SmkwYWJyWXhXTkhDeVJx?=
 =?utf-8?B?QlFYdWJKbEVMMDdWMVNNRnBmTzZjSmxIRCt2NG8xQ2JLdG9qcHlNWWZjZmRX?=
 =?utf-8?B?VFN5NTJ6a0o3SW5OWFBJcllDcXFMMzZkc3o4TFpvVHBjdmNLMlJ3NlN0dk1y?=
 =?utf-8?B?YzZnNGpscUxXQTBIb1JJOWVUYXo4YXNQMndDTVQwVk1hRFpkc2dnYjl2YVMx?=
 =?utf-8?B?bE5Cbmd6c1dmN2Z2VlZzNktBbjdsNjFDTTF5SXFWOFNoQjJzUXJ3L2ZjZTZI?=
 =?utf-8?B?TS8xQWdJeTJlOVQ0OXJZc0h6R0w3bmdxQjV0TWMrTzFCRnFNT2RLcDVpVEJk?=
 =?utf-8?B?L3BHS0JtRWg0WTdxMDNLSW0zcndLaUtJYzYxRUlVSXBjaTNKWVZYQVByMzBB?=
 =?utf-8?B?bmRwOExxRktnSFlhNEpFTXZtM2p1UVlMWDN2djBxejVDaDZSY0F1ZHY0dTBv?=
 =?utf-8?B?RHo2ZzFrTnpaUDlJcWN1WWtPckduWDBoRU1wcU10dWd6Q2ZqNFdSdk9rSU51?=
 =?utf-8?B?L2RORE9pQ0VqcTExd0JnNG9DaW1zdTgyQ1I5TXk0RHVPK3RIdkFhL0VYUzJE?=
 =?utf-8?B?Vk9hbDlQdnlCVzN4ZDhHclFqdEJxK3hobXE2bVpudFB3dUZQVmExRHBLN21z?=
 =?utf-8?B?eVN0SnFWU01WaEhOWjhmUjN3dXdNUjhoMnI1R2pkUzU4RGFsSnY4ZzIyeWtU?=
 =?utf-8?B?MW5WWi9BZDdtYS9VdXJLQUpYQU5NT25zb0dNVzFlVVBpblE3ZFZIYjNNczJK?=
 =?utf-8?B?THpnUDFrMnlacG1RREo2SEhlbXJwVkZWWjZBYjFZUlFUYU0yZkFIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rqixUuV7qD3+EVedTH4zSzSTJUwIZv+3Tyt9FrJXv+Pd/qh0NzdgLuQbvoDZN8BjQhAc6iwBgkO5U4iuBghcJuHmKAMFUBwzxv/3mlf8GAKvyVErvX4KA4ZF6GjarkX9lhELTg88q58RkFkxiqZiIt7IwXhIKEj/XyptA0yz1DfEDa4VIInmrgq4fxbr/9V3rTdE2KUBJ+uVXHwaCwO74uWcJUNrreBRXAtFEmSdbhSGmeuN+jcomJqkLpaHfp9gsKJsgvQpOqYCmGpgBLomA+cCdXAn91fmTmX+hyuDb25SiMvB2hgUoleZhwPzX4Wa9IUgnuHySnoUHjKmMB3eJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8debd5af-94fa-4079-fd64-08de9bb07c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 12:05:43.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6R+5MF5lwtgA8FfHzcYt4ubc51Na7oW5Bvnopj2ZhY3gInfkdNKrKGU9fEmi/W21G1arZy4SbC5V6jRMqB/Z5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 12:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235401

SGkgYWxsLA0KDQoNCkludGVsIGFuZCBXUiBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0
aW9uIGZvciBZUCBidWlsZCB5b2N0by00LjAuMzUucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhl
Y3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQoNCk9FUUEtbWFudWFs
IHRlc3RzIGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KDQpPRS1Db3JlDQpCU1AtaHcNCg0KUnVudGlt
ZSBhdXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQoNCjEuIEFtc3RvbiBMYWtlDQoy
LiBQYW50aGVyIExha2UNCjMuIEJhcnRsZXR0IExha2UNCjQuIEFsZGVyIExha2UtUw0KNS4gUmFw
dG9yIExha2UtUA0KNi4gRWRnZXJvdXRlcg0KNy4gQmVhZ2xlYm9uZQ0KDQoNCkVUQSBmb3IgY29t
cGxldGlvbjogMjMvMDQvMjAyNi4NCg0KQmVzdCByZWdhcmRzLA0KRGViYWwgR2hvc2gNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFBhdWwgQmFya2VyDQpTZW50OiAxMyBBcHJpbCAyMDI2IDE3
OjQ5DQpUbzogR2hvc2gsIERlYmFsIDxkZWJhbC5naG9zaEBpbnRlbC5jb20+OyBxYS1idWlsZC1u
b3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KQ2M6IHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc7IHlvYW5uLmNvbmdhbEBzbWlsZS5mcg0KU3ViamVjdDogUmU6IFt5b2N0b10g
W3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0
b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTQuMC4zNS5yYzEpDQoNCk9uIEZyaSwgMjAyNi0wNC0xMCBh
dCAyMzoyNyArMDIwMCwgWW9hbm4gQ29uZ2FsIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdy
b3RlOg0KPiBPbiBGcmkgQXByIDEwLCAyMDI2IGF0IDk6MzUgUE0gQ0VTVCwgUG9reWJ1aWxkIFVz
ZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+ID4gDQo+ID4gQSBidWlsZCBm
bGFnZ2VkIGZvciBRQSAoeW9jdG8tNC4wLjM1LnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0
b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gPiANCj4gPiANCj4gPiAgICAgaHR0cHM6
Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tNC4wLjM1LnJjMQ0KPiA+IA0K
PiA+IA0KPiA+IEJ1aWxkIFVSTDogDQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzMNCj4gPiA2NDANCj4gPiANCj4g
PiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOiANCj4gPiANCj4gPiBiaXRiYWtlOiA3ZmQwMTk3ZmQ1
ZmVkZDIzY2M4ODViNWU3ZTgxNmQ4NmEzOTJmZGY5DQo+ID4gbWV0YS1hZ2w6IDQzOWNkOTJiZDQ1
ODg5MTZhYTQ1ZGU3OGZlMjVhOGJmZGRjN2M4MmINCj4gPiBtZXRhLWFybTogYzNlOWZiMTJhYTMx
ZDI1ZTMzZDgzOTJjNGEyMzNlZDEyNzVhMzI3OA0KPiA+IG1ldGEtYXdzOiBjYWQ3ZmRjZjA0NmE5
MzVkMWViNjQxYjI1NGU0ZDA1ZDE2ZDUxZjFlDQo+ID4gbWV0YS1jbGFuZzogZWFmZGFhM2NkYTkw
MDBjNmQ5YmQxODE5ZmZlMTIxOWM3YjY2ZTRiOA0KPiA+IG1ldGEtZ3BsdjI6IGQyZjhiNWNkYjI4
NWI3MmE0ZWQ5MzQ1MGY2NzAzY2EyN2FhNDJlOGENCj4gPiBtZXRhLWludGVsOiA4MmViMjQwNmUw
NGE4OWQ2ZWQwNjUwYTk5YmExMzIyNGU0M2U0ZjBkDQo+ID4gbWV0YS1taW5ndzogODdjMjJhYmIx
ZjExYmU0MzBjYWY0MzcyZTZiODMzZGM3ZDc3NTY0ZQ0KPiA+IG1ldGEtb3BlbmVtYmVkZGVkOiA5
ZDhlZjI2YTk2OTNlMmM3MGFlMzRhYmUxYTc1Mzg3M2Q0MmVjNTg4DQo+ID4gbWV0YS1xY29tOiA4
ZDI3MzgwODMzNGRhZWY1OTIyMDAwYzhlMDU0OGI3ZmYyYjNkNzJjDQo+ID4gbWV0YS12aXJ0dWFs
aXphdGlvbjogOTJiNmFiY2RmYjZmMTJjNDkzMTI0N2YwZjI5YWFmNTMzMTk4NDUyNQ0KPiA+IG1l
dGEteW9jdG86IDM0ZTNjOWExOWI4Yjk1NTExNjEwOWEyZTk1Mjg5NjZkYjNmY2VkMzcNCj4gPiBv
ZWNvcmU6IDUxMjU5YzdlOTMzYTJhYzhlYmMwMTYwNGQ2ZTY1NjA3Yjc2YjdiNTYNCj4gPiBwb2t5
OiA5MzQzMTI0OWE2MjYwZGE3YmQyOWVlM2NhMzIxNDVkODllNWI4MjU5DQo+ID4geW9jdG8tZG9j
czogY2U2NzM0YzY4NjQ5NzM5YzYzNTY3NWExMzNmYTc3ZWRiOTg2NTAyOA0KPiANCj4gVGhpcyB3
YXMgYW4gImFsbCBncmVlbiIgYnVpbGQsIHNvIE9LIHRvIHByb2NlZWQgd2l0aCBRQS4NCg0KSGkg
RGViZWwsDQoNClFBIGZvciA2LjAgTTMgaXMgdGhlIGN1cnJlbnQgcHJpb3JpdHksIHBsZWFzZSBx
dWV1ZSB0aGlzIG9uZSBmb3IgUUEgYWZ0ZXIgNi4wIE0zLg0KDQpUaGFua3MsDQoNCi0tDQpQYXVs
IEJhcmtlcg0KDQoNCg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCkxpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KVmlldy9SZXBseSBPbmxpbmUgKCM2
OTApOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC1ub3RpZmljYXRp
b24vbWVzc2FnZS82OTANCk11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL210LzExODgwMzM1Ny85OTc2MTI3DQpHcm91cCBPd25lcjogcWEtYnVpbGQtbm90aWZp
Y2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC1ub3RpZmljYXRpb24vbGVhdmUvMTQ0
MjY5OTkvOTk3NjEyNy80NDAzMzQ1NS94eXp6eSBbZGViYWwuZ2hvc2hAaW50ZWwuY29tXQ0KLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCg0KDQo=

