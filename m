Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F28CA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 14:12:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16565.1791468763375004936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 07:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=B7XRPnVD;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791468764; x=1823004764;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tGPZlex29sZ0SD6sSWl1sWPJ29cyzlTSClmF1tnWkxI=;
  b=B7XRPnVD3iW5DjrHFSP0f3Py2dqW/ZAGo8ob7ASRZ2Xkj1CWwq3pwq0G
   Nb5XNgmB+zUfhISzuSHpilgcqTIxc/frD4NdGuvykOiGUcUwBlE94S4wz
   J6FjEoSdp6VkRiE7aOy972CuGq+JYGMy2uTUmRdC0b8nWFmB2c1LFywSB
   +BVaiZ/h4xCuIomSrVR1vAOXSiaiO3w/hwnPHeKAN1oy3OWdQsFik25qd
   ptllo1bnHhEQQ7Ssc8Z9BfUbwQRfYh5aazHwJZMZC4JMyQgn8aNYN0fmS
   6A2sOZP4aONFSujdgvLeR0DfSlrTN3Q3kh8zA/RUUosO4cEO7ZZlaBRr0
   A==;
X-CSE-ConnectionGUID: MwnZwqisRn+4B9/FqMNaFg==
X-CSE-MsgGUID: G0y3rfKhQ3yKQqNY1ESDrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="141076"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="141076"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:12:26 -0700
X-CSE-ConnectionGUID: clM2VcHQTiu2zzso+t9gXg==
X-CSE-MsgGUID: ejmQWJ1YQf6Vu0fIxMts6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1876806"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:12:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:12:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 07:12:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbcr3Ga928qH4kxGf3hj1dHBWekamuluySKz2gHGJHe5gSMDlmOxiR94HI/Sbv77nCyCS8oyCm4sLrqxoBLW3LW8l/OYTVsLSHl/nDHQPAJvFYhZ1Sz55V+xrR8m+NPQdlIi3LYzuFEjfDzqDvlz0hKa6pcIbELAmlgk10zLrpaNORb7Y1CiG4guBp/SxctUOi7BdP+8wReqsGW7xZ05bDJB/dP3YUfaz8fULW5q5yBMd6TqaWTdJiGFurjcyuESrLS9M+n1bCTwv3x/vl4IlbNw3TfZS6TA3mkv317kuOTlj35YvwhE48JIMODgTHZDnYwC/bmd2sz7qrcSJ3BBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGPZlex29sZ0SD6sSWl1sWPJ29cyzlTSClmF1tnWkxI=;
 b=gf+CmC/AVg/Py2MhO+NzVih8ITj/nRRTN9RbZ2ot3y+1rdANw+VebV67zXmxM+CqXvZzEhY5oqdgsihTLxXT1ulQt3sLsxlqDjrGuFgHSzv0+Kv91wokDdk9XHFqALCAF4+1kJQ9nJAa2i40Jk53rzYJ2RtDMcEG3QO572a+hR4ylMzAyI1+4C0stRYVlOsIo0VUlVAo43kM3fQ/ZRy0N4zk05bwETFZmDGS6nVbxH9ZWYZMI9bkYov6728ZGWhfkgv3VzhxfZr1YooDnXcSt00PCLsWKkySABDA+ONko+mpVGkzP8LhlkE2kTlHVe1j4Bc+NUWoKbTHSUa9LzNHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 14:12:14 +0000
Received: from PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9]) by PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 14:12:13 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.4.rc1)
Thread-Index: AQHdUOrryTCXWw6wskSmzIZaJE+JDrbzu1XA
Date: Thu, 8 Oct 2026 14:12:13 +0000
Message-ID: <PH7PR11MB70275D5CFC282F02740D79D6F4932@PH7PR11MB7027.namprd11.prod.outlook.com>
References: <010101a0f2bb1dc3-f7d94a5b-ddf5-4408-a5ca-9cfacb88f136-000000@us-west-2.amazonses.com>
 <DLSQG0G120BV.3CN1II58OGZMK@smile.fr>
In-Reply-To: <DLSQG0G120BV.3CN1II58OGZMK@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7027:EE_|IA1PR11MB6147:EE_
x-ms-office365-filtering-correlation-id: dfc811ae-5dd3-42f8-7fce-08df254626ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|4022899009|1800799024|260925021311599003|260925021911599003|56012099006|260925022911599003|10067099003|6133799003|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: KbFG1z10Se2bNiZOkqQsFW2q4vkqcPd722vWHZuy7V/iuS03LOkHrL1yEkIqRBozVMVgphIHaM8YCHZcNdzlegjq3/X+W6U+e1AoWp3nr6vRcnGEdvP7bKWEy8Est4izijVOv6LN7tAvGduv44IYrLPLymbTvR/SUrlMnwkaekg51ah/tpZCHDWbksBxZRCiuQd4fDp1dHE5mmUzHhCUs2Q/9NGS/NiIKJvaBSVrdwhE+QlEonIZnxpZBG6DqRyAmpyhxkgUsIojRGMuvILAHO+Jk1dag80V3FB988nYfa0nU9yHtllp82NbDYhFon7hXVuKx7+GWEsSwPvHP158sYrAn/+za7j6bRZLf4USu67TBiy7S3E5gchxt8cFqR/+osYgHJicUWOFHP8fDwc1TC6ntr6gygQ48TGmSJzLQagfhleAmxjUnfVt+QVmphQGFifRaPG6VsEGm7YEurv0J/zEhvvbHc+TpeRxfZpa7tDO/i80e0zHboZ1CQqamKEg+/qMiQ/03XIOltcVF7y4cjR3TVG/GyaCznjKpioTUfsgv30JThnvlmVQxuQFpQMzWBdvWIyTCN2hChXqyc8BFSR/l3qC0J6TTdQ+QahkL/g1ks44bYY30kYMyf1i13SkGk2bDCJKEqnJ5Nnd2LCWibsh/TTQPxogKz3JkLjBE4o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7027.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(4022899009)(1800799024)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(10067099003)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3JVT0VmMWRrbXA0U0oreGlmdkVRaGJaS3VQRmVIVUNHaGNKNHlzdXF5TzFw?=
 =?utf-8?B?LzRrN0tDM1djTXE5T1FtUTVOcThISmZrVktUTFhta3JmeTIySGNCM0hwOG5L?=
 =?utf-8?B?UVd1a0pTTkZrWXhBbUZOVys4Uk5QK0ZxcW9GUGxHSjFsSE5wZm96N2ZXTjJK?=
 =?utf-8?B?SU1vQjNUdjZyUkpJZXF5ZXZqSUs0YmR3cXYxOUZFVnhFVHM3RitURVRsQ1R0?=
 =?utf-8?B?dVdOa2F6aWZQY1E4bVFKbUR4ZzBPdWREQlhHVjRnN2JxRnliVHJ3YVBuam0y?=
 =?utf-8?B?SzVRaW5MdVArRi9ZclRtbXFwM3NGN0JVYmRhbHIyek03WHJIRDVoSU51T054?=
 =?utf-8?B?ZEFCSVF2djMrRGtlK21XY2FleW9rWUdabFhVNEQ4MEZ2dWt1R2Y2VytHS3d4?=
 =?utf-8?B?V2h0Tk5UMER6V3JaZlpNTTVsM0JRZEc1MnJJcGFQUGVzODZyTkpsSmhBQzBJ?=
 =?utf-8?B?enQ3bnY3RDZvUHd0aDZXZGtaVjhvallvM1IvM043RkxhTElJREdKMC9Eb0hr?=
 =?utf-8?B?K0xjd3daWEovMXg5V3EwREttNTk3bFZCenc4aUpVQktsZWRRdWpkWCtzVGVu?=
 =?utf-8?B?MTlRUFRLN3BWeUlCMCtWdzA0N2hQOUsvYkhWbjBxNWM1YTRVcEhEdU1KREFZ?=
 =?utf-8?B?KytsbXlsRnU3RGcxNEtoc0tQaXh2ZVgvbTVJUy9aZUVSaXJVNWRwTGNQamIw?=
 =?utf-8?B?ckdNZDhTSTNtUmN5WGJ0dzk0U2swRXgwbUVnakNYMW85bmI1M1plNFhGQ0JM?=
 =?utf-8?B?eHZIWFdLa0Ryc08wZjlVOEt6MXZ3Q0xWcnY5ZmNZM0crY3M2OEtSenJsbXRI?=
 =?utf-8?B?YTZtWmdLbnEzZmJWc05wcDVjdVN0M1B6YXNoSkZtTnc2NnhHakUyMXV2ckJT?=
 =?utf-8?B?ZGtQRC82a1FuZ1lRL3FIOFhpL2djZkhNVHovclRiVUFlaVhCeXhQbWJ1MTVS?=
 =?utf-8?B?bVcwcGhUcGExWHR2VHN4QW9hUzVQdUtoam1YaWxMSEl0czZSK0dySlVsRFJR?=
 =?utf-8?B?bXh3N0tvb01yUzNrS3l1OWd4SnpkVlloQzBQclhldVVtaVlnWE51RkExSmIw?=
 =?utf-8?B?bVhOT2JHb1lFQTEvdlF4bzFsTm0zMFdXaGhJdXVCQWhMNEE2SWdZSys1OFV5?=
 =?utf-8?B?SWJEOGlqYlJtSFQ2QW9RQlJSQVZJVzRvQ3dxb1pSZjNnb1dyd09SMStkU09Q?=
 =?utf-8?B?Z3lVZkZ2N0M3V2ZhT1dYZVNSUmk0bnE0ZjdjMmxNd01tZ0wyMzdyU1c2V3Q0?=
 =?utf-8?B?eHlENytXeC8xYUk2b2JkZVZUZDcraGRnOE5Kbkg5cmtRTmkzaE1ldTh3bjVz?=
 =?utf-8?B?SEhZZjNJc1ZjTTM3VFRUcXVtaG91YjlrZjZUVFhPTCs0S1dtY0J1WWpoV25D?=
 =?utf-8?B?M1JHeHY4MGhhaExzRGhuM1Nja25IMWREUUFjbTZDYzYraHQ4bTZoZzBWK2tI?=
 =?utf-8?B?QVJpQ21FSnk2UVRkeVRuekVuTCtrOEZveFh2d09XckdEN2lnaEJ4VjhwQzlQ?=
 =?utf-8?B?S1g4bTBlUVlxNXVHUWc3QUZCVS9jR2I3R2NGcWVxQzRINFpWc1duS2djdTZl?=
 =?utf-8?B?Q0lLUjQ4UVlsZEtEZzI3ck9uTnJVQ3d5WjUyL2Z1NHdTR1czckd2NUw0REZv?=
 =?utf-8?B?T1kvNU1ST0V1TFRQM1NWcUpyY1VuRjR5NkM4SDlxYWdMYWwyRDZ3UVNsczk3?=
 =?utf-8?B?eEZvaGFaYUJ2MDFDLzNJMExNSVZCTTRHVDF2VTFWc0UwR3I5MjFLRmViVm5J?=
 =?utf-8?B?MkRZRnRueU4rUnBaSjF5bzYxcnB0bnQ0VXhYOUJsemdOVkNWakZ6azRnb1pO?=
 =?utf-8?B?emp6WkxIMTQ5TDRENHNlMk9kZ1RXaiswOWY2Q29XSVJqcnR0VHF5U1dHWWNj?=
 =?utf-8?B?eCtWOE1pVU5YK0Y5UEFrZCsxaTFFWkRxOUM2dU9wUUVoSzI3R1FERE4xQ2Vq?=
 =?utf-8?B?UW1ZTmFMWnFGcWpNOGxocjJubjVvamVHM200cElMbjFScFEvWHh1UFhLS3Zl?=
 =?utf-8?B?YTc2Z01jTzhZanlnWUtwUDZpenB3S3pGdkJwQVM0Qy9vdTJSQk5wSnpnZnFp?=
 =?utf-8?B?YVVYNkVpQ2pnSW1CNFlZWFRCdjVLM1hnS20zRTdyZnhKeFROb1JxUzFMRmR2?=
 =?utf-8?B?MjA0c1kwdWxyMC9ndFJtTEVIN0hYMC9kVjhzbkt0bEtNUlVRN3FoWlpOYi9Z?=
 =?utf-8?B?UE9GYjJmaTc4YTl2YldjWWYxQVJEdDJpTHFOM1QzSVB6WUhxVUs4SWF3aVc2?=
 =?utf-8?B?WVJKeWJqUVVoRkExSFZoY0ZCRHhZcnJMdks1eElZaUIrOWVYWWcvemZ2S2Zl?=
 =?utf-8?Q?uSADYp0l+IRWJVUUuY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YrgknXVa3e5kbr7SY7+gUOgT4TCudXfJmQT05nBqNETKJg3Nbo+JX2CFWl1uGt4qDXoOXGu9JwhwqYsLLlJorvcn9krtx6PfGti/spcS50QL5o3Drxq5+aqKP5DWRecOJ1DjOuKrCEeQqP8pHURpFm0lzeIPUAawLPmwgP27ztBPYL2Li5g5Ape1ngOuaTTxELIzwgkcSNwt06s3tp5J9t2nty2HqGXCrzyGusIdLaRkeeumaHTB3MzuI+GgOOPSAoVBKC5jRQkdsnk2Ao9oqRY1LfBscEjM/3dEnSXG8Dt6wFZDlzpncc+knRNBXMWgwKAUgj3z6YlpMAZ8smVQ7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc811ae-5dd3-42f8-7fce-08df254626ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 14:12:13.6216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJGg/77RWFqCJO++KNmVoCTAdt64mMZRFf63kBCSjL/fzIiWAxu3eWVC4nkNtls49zf0UW3Eis3uAvh3X9soiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 14:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247432

SGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0aW9uIGZvciBZ
UCBidWlsZCB5b2N0by02LjAuNC5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVjdXRlIHRoZSBm
b2xsb3dpbmcgdGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRlc3RzIGZvciBm
b2xsb3dpbmcgbW9kdWxlOg0KDQpPRS1Db3JlDQpCU1AtaHcNCg0KDQpSdW50aW1lIGF1dG8gdGVz
dCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCg0KQWxkZXIgTGFrZQ0KUGFudGhlciBMYWtlDQpB
cnJvdyBsYWtlDQpCYXJ0bGV0dCBsYWtlLVMNCkFtc3RvbiBsYWtlDQpUd2luIGxha2UNCg0KRVRB
IGZvciBjb21wbGV0aW9uOiAxMi8xMC8yMDI2Lg0KDQoNCkJlc3QgcmVnYXJkcywNCkRlYmFsIEdo
b3NoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmlj
YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhIGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcNClNlbnQ6IDMwIFNlcHRlbWJlciAyMDI2IDIwOjE5DQpUbzogcWEtYnVp
bGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3Rp
ZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNi4wLjQucmMx
KQ0KDQpPbiBXZWQgU2VwIDMwLCAyMDI2IGF0IDQ6MzIgUE0gQ0VTVCwgUG9reWJ1aWxkIFVzZXIg
dmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+DQo+ICAgICBBIGJ1aWxkIGZsYWdn
ZWQgZm9yIFFBICh5b2N0by02LjAuNC5yYzEpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWls
ZGVyIGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+DQo+DQo+ICAgICAgICAgaHR0cHM6Ly92YWxreXJp
ZS55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tNi4wLjQucmMxDQo+DQo+DQo+ICAgICBCdWls
ZCBVUkw6IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1
aWxkZXJzLzI5L2J1aWxkcy80ODQwDQo+DQo+ICAgICBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOiAN
Cj4NCj4gICAgIGJpdGJha2U6IDUxZmQ5NGE2N2ZhMTc2NTBhOWZmNjIzNDkyMDA1OTcyYmJjN2Qy
NmYNCj4gbWV0YS1hZ2w6IGMzNmYwZTBiYmVkNjAwMGYyOGNmZDEwNDE3YzI4MGM5ZmRjYTM3Y2QN
Cj4gbWV0YS1hcm06IDY3M2U4ZDdjNWRjZDE0ZGU1ODA5MmViNzNlNmVjYzVlZWU1YzE3MzUNCj4g
bWV0YS1hd3M6IDNmMTEwMzAxYmVmODcxYzU1MmEzNDI0ZjQ0N2RlNTlhNTVkYjcxYzgNCj4gbWV0
YS1jbGFuZzogZWYwZDIyZjIxOTEwYTBjMzBjOTY3ZWViMTdkOGYyMDk4MDZlMmQ4MQ0KPiBtZXRh
LWludGVsOiA3OWE5NjgxY2U4M2Y2YmYzNmFlZGUzYWViOGMxNzA3ZDI5YmNhMzI5DQo+IG1ldGEt
bWluZ3c6IDU4NzZjMTkzZGEzYWQ4NmI1ZTIzMDEyMzc0YjUzNTBlNDliMGM3NTUNCj4gbWV0YS1v
cGVuZW1iZWRkZWQ6IDQ3ZDdkYmRkMTA4OTBiYmQ0MjliYzBjY2NiZTE0NDM1YzM3ZTVhZjENCj4g
bWV0YS1xY29tOiA1MDliNzcyZTU4MTQ0MjU1OGU3YjdlZmVhMDVjNWFlMDgyNTA0ZjUwDQo+IG1l
dGEtdmlydHVhbGl6YXRpb246IGEwN2JmNzhkYWIwZDQ2MDk5YTdlNmNhOGIyYWFkYjA3NTM1ZWZj
MTMNCj4gbWV0YS15b2N0bzogN2MyNWIxMTE1NjU1MzE0NWZhNmIyNDFhMmQ0ZjY1ZDk0NDM4Zjgw
NA0KPiBtaXhpbi13cnlub3NlLWxpbnV4LWZpcm13YXJlOiA3MWRmYjgxYmQ5OGY1OWNhMjEyN2Qz
OWIxMDBlY2JiOGNlMWUwYmEzDQo+IG9lY29yZTogMGYwM2M3MzJhMGEyZDA1MDZiNDFiMWFiZTYw
YjNmMzY4YjIzMDBkYw0KPiB5b2N0by1kb2NzOiBhMmNjMWY1Yjg2ZjNjZGM5YWQzMjU3YTI1NDUz
MjJjNTE2OWRhM2NhDQoNClRoaXMgd2FzIGFuICJhbGwgZ3JlZW4iIGJ1aWxkLCBzbyBPSyB0byBw
cm9jZWVkIHdpdGggUUEuDQoNCllvYW5uDQotLSANCllvYW5uIENvbmdhbA0KU21pbGUgRUNTDQoN
Cg0KDQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzc1NCk6IGh0dHBz
Oi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdl
Lzc1NA0KTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQv
MTIxNTA5MjAwLzk5NzYxMjcNCkdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3du
ZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2
MTI3LzQ0MDMzNDU1L3h5enp5IFtkZWJhbC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KDQoNCg==

