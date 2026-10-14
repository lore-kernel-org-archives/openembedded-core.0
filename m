Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95043CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 17:09:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19628.1791997767973800387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 10:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fZCoykBe;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791997768; x=1823533768;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wqX73KMUYxuXmY/vyCcaE4O6L4k+5ejSHVlyYudqzyc=;
  b=fZCoykBe7OvZAdsfbyIUdbQmQBFBFYI+XnhqcwE+d60GTB1uABJTLa3p
   s0Y1XVU+xkqO2tV3vxPXVoKreIfsPmBopb4HMmPXc7pwgtMEZAn3UlIcw
   NfJTshuP9nLyKHITz4mt7FCAxgJCc/TEo97c1rqDMBXq27Fw0keE9MHuP
   wT718QcPZ6M5NqRR21F1yNotrpQpM+bg4HeJIbshXMegLnIMJzNXz5uIn
   RDUFfNuzE9rLDlSYlJsZkdRIO3CR7Pk8HxdGGoEo2+dl0WY9tM4ivi0ur
   K4SirhKMs0N4l8DiEDbt7noFtngHGJ3fDzmuQUyTzoq4aLrNDVy6r88XH
   g==;
X-CSE-ConnectionGUID: 66+XHjDfSBuT2xeT4kWNFQ==
X-CSE-MsgGUID: 7C83+UbrQzactWYXEsea0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="759373"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="759373"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:09:28 -0700
X-CSE-ConnectionGUID: zunNYArnTLCyjGsdfL9o4g==
X-CSE-MsgGUID: yVlmvWwIQ6qmNj3uJ7/RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3318742"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:09:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:09:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:09:26 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRxNvQOdy4JITX34xMDEpO0DagyuzPk6akBBmaxXfpy+0ZROwIaqSwevVXFaz0UA90qIGoQ1WpTZqZiGegI4Jg6pBKestEOja/LJA/oaepCYkGCWPffSxi/USJCEYMLmgCdWFhn+34UEMyHBBLdavqnh9f/Wai9Bb81sRLdEWgItkLBBD12TkMIpTFABy63hoMGfJoYfWSNU17OI87XWqyi6oZNh3cX/Vupt1pkymQLQXpzH+yI/oNGBxvK9DcQBOHMzIP0ICs480S3g4UnWJafm/NGtn15wbnUo4JSizfAxOsPtHFflINOxoEgdm2B626fHHf9Hxo6xD288qgyPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqX73KMUYxuXmY/vyCcaE4O6L4k+5ejSHVlyYudqzyc=;
 b=SytyVPCSPcszX/kTSm5QGNglqZ3rfhnNPhqAyfxfg3w1QNbNu84pumkL6e27yrsalgBAs93VPgkOnTpj37JtYBF4Xppk++K933mWNTYZl9Aro/Sx4Khtc9UTFPHI+jUX+EmIRmFp+YvCvRrtvvDqvt62UowwFRZ9h3UbVT15yTshs64PFzxutuFc12GPPAZvNwh4Kntc/Fwaszcn02wojykDs3sgU6oIttdxceVrGfh8ml25NxoFNC6+AnFvX+GMswW1x6Xx14SOquvKpSXYB2zXypLRff5KOlVMrpZJBclfLQZvVWKhCnivLMekmoGENRHTiJOo0r0ISCGQeDcqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:09:24 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%2]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:09:20 +0000
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
Thread-Index: AQHdUOrryTCXWw6wskSmzIZaJE+JDrbzu1XAgAmgIJA=
Date: Wed, 14 Oct 2026 17:09:19 +0000
Message-ID: <SN7PR11MB70184C9A275BDC8B5BC0DA60F49D2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <010101a0f2bb1dc3-f7d94a5b-ddf5-4408-a5ca-9cfacb88f136-000000@us-west-2.amazonses.com>
 <DLSQG0G120BV.3CN1II58OGZMK@smile.fr>
 <PH7PR11MB70275D5CFC282F02740D79D6F4932@PH7PR11MB7027.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB70275D5CFC282F02740D79D6F4932@PH7PR11MB7027.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB9614:EE_
x-ms-office365-filtering-correlation-id: 9af9a09d-6426-44dd-10cc-08df2a15e2f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4022899009|38070700021|56012099006|11063799006|261009223027099003|4143699003|260925022911599003|260925021911599003|10067099003|22082099003|18002099003|6133799003|260925021311599003;
x-microsoft-antispam-message-info: 0s0TamDUYpYXgUTfTKlZI0Bu8uLsbmDlS72qjo+qzpi5ejZvi/7j6FD6+u1U9CDTI2FXx4WX35DWKWhwoVzKmvTYxW1xKK5dEbfvfleHeifKSQv7fP0ObPrA5jGEA9t7wB73pEZv2o8LFSULHphVgX6cA2eIECvl0zzpnW8xxFRfKdbvXA/NyuPzUEQx6ZTp6zVb9FP75IauBTHcu6MaMIMVds7TiOx2lx41eFw6U/5tVvlvohmaBZdqiRrJ55LnzeWf7RRezDtno3IvKuiZD5h7rA7EGKVrexRQ/GBrKSBn2IMlBUDBm+p/iOM4jmEovqWsm2DjfzopLT6yyzFOFmIGL79FrWNCcobTGe+zm9/nn1u7lOQJ48Gs/+s0p80i7SCz9ke9u+iI3LnbRALbOpDSGrYWLVmjDqwblkB0p8XB1viq0+ASu+souscpPqJSsWxnjEDv7a7awg7alDDU3c8x6LKjc6xdyWJYwFwA95irBAz47Uh4wqABAZ+OKF1vIKcO+mqvYHcUdxRf+agcrYLEwRoCh6RzREYrCdyBwSmvzk3iPU1aQzfMBb98oug09qhPMkYC9VYETEM14cDbcCpzgabbRjuwnaUTQVl0SI7RsWHF8wFgrHbzTVz63g8c+fkjkRX+5fs3bVW6aedx57qZ//VECNFDze4j/749d3g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4022899009)(38070700021)(56012099006)(11063799006)(261009223027099003)(4143699003)(260925022911599003)(260925021911599003)(10067099003)(22082099003)(18002099003)(6133799003)(260925021311599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eit3TnA3cTVVUWlFM2Q3NG9zYnp5OUF5V1VLaTRFUFFZTmxFcUZRLzVQc3Fi?=
 =?utf-8?B?T25aVUIxQ0N3eEh0eWxWUzZBZnl2a1RMcmJFcHBzNDJ6Sm9kVDhUTjhBVlNu?=
 =?utf-8?B?NXhYT21mazZrcXRkVmM3bDhMcW95RVNucTlVVVlMblFiNFliSmV5VTVBdlNM?=
 =?utf-8?B?YVM0SENkQkF0a0w3UTl5d1BFUDZLZ2twSmh2SGZSY1BPclc5Kzg4R1dQNUZr?=
 =?utf-8?B?djlGR2c2UjUvK3BRbENNeDVUUkhXdEl6dmVhQndyMWZ3bkNQQnFBTFlncjhV?=
 =?utf-8?B?ekVXSGczSWhRbi9oWXA3UjF3K1VBQkxteGR3N1lvODFnbERjdG0yUVYweHg1?=
 =?utf-8?B?YU9HdUpKLzhheE53Vi9OYWkxQmdzT3lHTVdOcUlqRGtNZnpSV2IrTmFVZ29V?=
 =?utf-8?B?Z3l2MFRqaVgxWm02bm43TktPTjR4eC9VeWFHRlprekVVSis3R3FMYXBRcE9L?=
 =?utf-8?B?Nm5aUjBScVBjdkpwbWxyTkt3SVNNV2VNRGI1ZkJWTXJsSVo0MkxwclV4WmZH?=
 =?utf-8?B?NEh3VjdhZnJkVFFaS1I5RGZ4OVlnN0VHRHc1YWdJcU1lOFFyWS9KYlMwVWdG?=
 =?utf-8?B?YkM3dUlrMHZDejhEVzE1R0lKZ1RnR0paQVY1ZUlxc1pOcU52QzhGQ1lEMEZU?=
 =?utf-8?B?Nm9Pa2VQMHVYdUNKcnFQUEJlaisvbS95NnJ5VDlVWFUxcmtHUWdHYmxpQlV5?=
 =?utf-8?B?TTZYTitNZ2UzNHRpZ3NvaVhTK1BzS0xXdE13OEVDMWtsNzgrcXBvcEV6Ris4?=
 =?utf-8?B?ZzVTQjNLU0ZKQ3lyN0MwN0JXNGEvd2JiT04zUlVoSFBsL3NXL05MVVIvVFd0?=
 =?utf-8?B?Q2tIRGlnN2pGSnZtbDNGcW1mOVlBY2dMb0lFRlVtQk9SNnFDNEZsQlMyaG8r?=
 =?utf-8?B?YndCSXd6UCtyOVkxL0dWOWdzemNDL2FENEhIcFNvcmEyTkFYWWNXeEVMMWNU?=
 =?utf-8?B?UkRmamtqWEpzNVNrQ1BlTTBMblZDbGduN3RxREVvRVlLSTZ1YkVHQUNZMWxT?=
 =?utf-8?B?VzhjMGMxNW1FeTIzeVVNZlRMdnF4ZmVqMSsreCtJTEtrY1ExYzUyVS9VV2tV?=
 =?utf-8?B?SGlMUlJ5S2ZhS2hjdjRYT0RzVEkwMXFmNGx6MHhWMWVPc0pTZEw4WmQxTmw1?=
 =?utf-8?B?STVOTEt6bnRXSTBCdzFwN3Z4WEp0SEs2R2owOHh2cXpMYldLOFZqL2YzZlh5?=
 =?utf-8?B?Vlo1R3IvZEJkcXRQdkR3OU1UQlNrU0JpZmRLK1dPRnc0R29XdjlyU2Z4S2hP?=
 =?utf-8?B?bHVkaDJxQ0J4KzJaWWExQ3NGSFh3ZVBNOUt4Qk5OTHJCT0QzcnhkUklwdUdX?=
 =?utf-8?B?L255czNWWm9iM3YycXF3aUJFM3JwVEJoZG50ZlZnUzdXWlZOQUZMV3k3YUJl?=
 =?utf-8?B?VVVoN0ZMeU0zbjlwdXJGU1VPc1RRYktycmNFeVRFT0ZOWndVOE12NEx3eWdX?=
 =?utf-8?B?NmIzT2laS0hqVWdqQUVDMFJlUjh3dUxDbGF2UE1ERlltT21iMTczTXg3OHJP?=
 =?utf-8?B?Q3BnWVlOcDhoc09qMkRXN1o0MVNlbitqNHpaZW5STXlZUDdBRlFUeWsxL2Zy?=
 =?utf-8?B?WVBTdUJEbm01blNMQWFiZGNGVldBYmR4M05YRkRhOGdhb2NvVjgzM3YyYWk4?=
 =?utf-8?B?Wmt4WC84T0JmTTQzb3hBUzkyUGhDVVphaHpCamd5QUUzNGRBdjJYUHA5RXZx?=
 =?utf-8?B?WVNudDY1dXRyQ04wMkEwUXpRZHVPNFpmNVZxb3U2dVNtYU9zb0VZWERhS0RZ?=
 =?utf-8?B?Rk1ISTVGR1ljanJZSEE5NWt0cHl4OUdPSWlrcWlEUnVDNDFQWG5Ia2pKQS8v?=
 =?utf-8?B?amlDNUtUaVF5eVUzUkZYWGFFRW94QVk0RCtiOUJmaUdoNHIwaFk5cXJBRHhS?=
 =?utf-8?B?WE5qRmM0QkhaMWNIRnJiZlpCUGVabDZKU1BNRndjU3c5cUdWeG55L0pqNFdG?=
 =?utf-8?B?SkxGQjVNUjlkZmc0b2dpUTMwRzQ0bVV1OVFudk9QNjdIa1duTlJSZnhyNUZD?=
 =?utf-8?B?TThtS1J3ZXFrZlUzbVRwS2JOTXAwNk15QjNNc1ZOL2ZEQ2ZGa2QyVVoyMEtL?=
 =?utf-8?B?cHVXZ1pEbm1GM2RwdTBPU3VaZFJuVGtvRU83UldETEI2b0MzNlh5cXpUa0hZ?=
 =?utf-8?B?M1ZqeVJjL3JaMEQ4cFJOZWV2bWtPUStQVnhvRFlSQ3ZKVFRsdXpNbi83Z3c0?=
 =?utf-8?B?VHBPc1BLZjd5M2I1U0R0TzNZNVJ4MzkvL1ppcXBnbCtjRGRJSjVQbUJONVJ6?=
 =?utf-8?B?UUV0MklqYTZhME1CNC9jRW5iTnZSL0hLZGhBY3lKM05qdzhwd1NQaFZxRFR3?=
 =?utf-8?Q?akpMnt88Vu3+802HyH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: t5fhITviMftK32ptZuXoUjCnOOaBh6Zjh7MpLOCI+vyZoDZEkASD+ULK+bq2bj/3uVOf9Wig/PVvnistoLM1rYO5zPKRM7M/mvh6btlM4FCSE7CAoIcA7rekcsKfrrK7hC0tfTT+i96hdSLTd3RX/A/0hdP9lzNpP2g2KRdxTVhhcq8ozQE4XM0/kIVy8+G0ln4A5EtFySt0pkPIbp/YkFtBlPQCiIGI/D0fGEC/O25SnhCsuPRyfL97bF7lMgZaqbe9gqlUP5xwkxNEHDQRiojlPUqE+ToatZP4sjT1iuT33r+XuDZmb6Tpz5LZK48eNshKUSQSOSC7OXPgf9FfnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af9a09d-6426-44dd-10cc-08df2a15e2f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 17:09:19.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+OvSO2lG4DSzloW74mIiXwfSMboJ7pbVNKT5SHn1EclP1JcyCZMR5/x1GnWCVrECqTAKkkFVkSv/uU6Mp4FaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 17:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247791

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNi4wLjQucmMxIGlzIGNvbXBsZXRlZC4gVGhpcyBpcyB0
aGUgZnVsbCByZXBvcnQgZm9yIHRoaXMgcmVsZWFzZTogDQpodHRwczovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL3lvY3RvLXRlc3RyZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0
cmVzdWx0cw0KDQo9PT09PT09IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRl
ZmVjdHMuDQoNCk5vIG5ldyBpc3N1ZSBmb3VuZC4NCg0KVGhhbmtzLA0KRGViYWwgR2hvc2gNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEdob3NoLCBEZWJhbCANClNlbnQ6IDA4
IE9jdG9iZXIgMjAyNiAxOTo0Mg0KVG86ICdxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZycgPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPjsgJ1lvY3RvLW1haWxpbmctbGlzdCcgPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
OyAnb3BlbmVtYmVkZGVkLWNvcmUnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPjsgJ1Bva3lidWlsZCBVc2VyJyA8cG9reWJ1aWxkQHlvY3RvcHJvamVjdC5vcmc+DQpT
dWJqZWN0OiBSRTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBj
b21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTYuMC40LnJjMSkNCg0KSGkgYWxsLA0K
DQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0aW9uIGZvciBZUCBidWlsZCB5
b2N0by02LjAuNC5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVjdXRlIHRoZSBmb2xsb3dpbmcg
dGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRlc3RzIGZvciBmb2xsb3dpbmcg
bW9kdWxlOg0KDQpPRS1Db3JlDQpCU1AtaHcNCg0KDQpSdW50aW1lIGF1dG8gdGVzdCBmb3IgZm9s
bG93aW5nIHBsYXRmb3JtczoNCg0KQWxkZXIgTGFrZQ0KUGFudGhlciBMYWtlDQpBcnJvdyBsYWtl
DQpCYXJ0bGV0dCBsYWtlLVMNCkFtc3RvbiBsYWtlDQpUd2luIGxha2UNCg0KRVRBIGZvciBjb21w
bGV0aW9uOiAxMi8xMC8yMDI2Lg0KDQoNCkJlc3QgcmVnYXJkcywNCkRlYmFsIEdob3NoDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhIGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcNClNlbnQ6IDMwIFNlcHRlbWJlciAyMDI2IDIwOjE5DQpUbzogcWEtYnVpbGQtbm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcNClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24g
Zm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNi4wLjQucmMxKQ0KDQpPbiBX
ZWQgU2VwIDMwLCAyMDI2IGF0IDQ6MzIgUE0gQ0VTVCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+DQo+ICAgICBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFB
ICh5b2N0by02LjAuNC5yYzEpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFuZCBp
cyBhdmFpbGFibGUgYXQ6DQo+DQo+DQo+ICAgICAgICAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5p
by9wdWIvcmVsZWFzZXMveW9jdG8tNi4wLjQucmMxDQo+DQo+DQo+ICAgICBCdWlsZCBVUkw6IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzI5
L2J1aWxkcy80ODQwDQo+DQo+ICAgICBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOiANCj4NCj4gICAg
IGJpdGJha2U6IDUxZmQ5NGE2N2ZhMTc2NTBhOWZmNjIzNDkyMDA1OTcyYmJjN2QyNmYNCj4gbWV0
YS1hZ2w6IGMzNmYwZTBiYmVkNjAwMGYyOGNmZDEwNDE3YzI4MGM5ZmRjYTM3Y2QNCj4gbWV0YS1h
cm06IDY3M2U4ZDdjNWRjZDE0ZGU1ODA5MmViNzNlNmVjYzVlZWU1YzE3MzUNCj4gbWV0YS1hd3M6
IDNmMTEwMzAxYmVmODcxYzU1MmEzNDI0ZjQ0N2RlNTlhNTVkYjcxYzgNCj4gbWV0YS1jbGFuZzog
ZWYwZDIyZjIxOTEwYTBjMzBjOTY3ZWViMTdkOGYyMDk4MDZlMmQ4MQ0KPiBtZXRhLWludGVsOiA3
OWE5NjgxY2U4M2Y2YmYzNmFlZGUzYWViOGMxNzA3ZDI5YmNhMzI5DQo+IG1ldGEtbWluZ3c6IDU4
NzZjMTkzZGEzYWQ4NmI1ZTIzMDEyMzc0YjUzNTBlNDliMGM3NTUNCj4gbWV0YS1vcGVuZW1iZWRk
ZWQ6IDQ3ZDdkYmRkMTA4OTBiYmQ0MjliYzBjY2NiZTE0NDM1YzM3ZTVhZjENCj4gbWV0YS1xY29t
OiA1MDliNzcyZTU4MTQ0MjU1OGU3YjdlZmVhMDVjNWFlMDgyNTA0ZjUwDQo+IG1ldGEtdmlydHVh
bGl6YXRpb246IGEwN2JmNzhkYWIwZDQ2MDk5YTdlNmNhOGIyYWFkYjA3NTM1ZWZjMTMNCj4gbWV0
YS15b2N0bzogN2MyNWIxMTE1NjU1MzE0NWZhNmIyNDFhMmQ0ZjY1ZDk0NDM4ZjgwNA0KPiBtaXhp
bi13cnlub3NlLWxpbnV4LWZpcm13YXJlOiA3MWRmYjgxYmQ5OGY1OWNhMjEyN2QzOWIxMDBlY2Ji
OGNlMWUwYmEzDQo+IG9lY29yZTogMGYwM2M3MzJhMGEyZDA1MDZiNDFiMWFiZTYwYjNmMzY4YjIz
MDBkYw0KPiB5b2N0by1kb2NzOiBhMmNjMWY1Yjg2ZjNjZGM5YWQzMjU3YTI1NDUzMjJjNTE2OWRh
M2NhDQoNClRoaXMgd2FzIGFuICJhbGwgZ3JlZW4iIGJ1aWxkLCBzbyBPSyB0byBwcm9jZWVkIHdp
dGggUUEuDQoNCllvYW5uDQotLSANCllvYW5uIENvbmdhbA0KU21pbGUgRUNTDQoNCg0KDQotPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzc1NCk6IGh0dHBzOi8vbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdlLzc1NA0KTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTIxNTA5MjAw
Lzk5NzYxMjcNCkdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2MTI3LzQ0MDMz
NDU1L3h5enp5IFtkZWJhbC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KDQoNCg==

