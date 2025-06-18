Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF022C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 10:03:35 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.web11.3689.1750241009832832102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 03:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=M3EZGLmk;
 spf=pass (domain: siemens.com, ip: 52.101.65.54, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8bPuv4Pv3pXrFqEQqA80a4VPjdArayLKy72ig228EdDVQs7H5kOdeaY3ru0L8TSxcEvPGrh80LnwptOBeY4ssoC5Uj0pXTNGkPb40AwHRq/7a7WcKUoqW7zb1zJRQnvac4EqKRJ66l1Ox1+7PnpnsQCOanJgM1SRySrcra5w+v0rz++BhSzjTCF5pvVVSlsE9VHjIwuvInAuOr+tr6NsM5kDsDbQ83ToYEPkdniIUoBrxCydkVvwvCWVMa+IZUwReLRctVHsY3TvE/Ybzn3x0oChM3rr3lNkFOOvj1elqB9SbhDc6euk2wDWLoqhvBoH3OrD0DUzmPh3gdedU2v3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYvKqmvkQnmn213exJd8ffjFSS2ZkpPnDtP28egNm5I=;
 b=fn5zFq3gTGv+MnFVl1fMeGQfpBKz3Tgp6DllWxo+rmc/Z/BLMJn9nwdexEqrgGeuDD2igNb3PvDg82FVXzcrp0nJ6Wmyl9p4hhP5gIWPVDno0WodDZoG6rc8t4/7a6J21TOI868mBgjiEEEHiL+lDDFspfE2ezqS4xgdf+P3SAMJhdWImRrwfQ5HpYqdita3NJ/hocPYayylE7qxZbDV93Hsq7ihE6vNnLsCw6oAOA3DjK1z0Cp/KSU7KADwFPqP8Wdrf/ELtM+QFmPoFcxK7HyJ3n1F2u3QvtgFejA6rRGznLXt2E5Vxkpzx0wF4agNTlO1fLIWewIcIukpwIXOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYvKqmvkQnmn213exJd8ffjFSS2ZkpPnDtP28egNm5I=;
 b=M3EZGLmknmVQsuZ3NUz62QZHlXWKqVb8INAp5GORpdO7s3G0ypyAyosXWRmYtnwhs5BxLD06HUkvC+BCkqk52hLOU1GqfcqbsjTFjf5U2a+wsM/iR3jg/dApMMig5xAEdvvmnOl88e6GxW3zUv3APV4NApWbHOFUORApWygHp1FyVh/e2LRQKleSOCmxJrc0ejuAB/6inuxnCApifqz3f0V+GPZjQkvL/vq8E1VGRd5F+CmolRfeLvsbbmwVjVZgMUQB0bDIQDjYVjjmKyMd78JFFWBMJbH5I1+6HL5sfLARkFMoY/FxMPs2AOakNhexwnPKlgiAPTYi2/f2rxM1Lw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PA2PR10MB8873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:420::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 10:03:26 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 10:03:26 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v1 2/2] uboot-sign: Make SPL DTB public key
 injection optional
Thread-Topic: [OE-core] [PATCH v1 2/2] uboot-sign: Make SPL DTB public key
 injection optional
Thread-Index: 
 AQHb1rNmZJB/dcETz0aei2BTgYIc5LP/ZHMAgAD+Y4CAAK9hgIAEI/WAgABbJwCAAYHwAIABr8yA
Date: Wed, 18 Jun 2025 10:03:26 +0000
Message-ID: <b4a1948c5e665cf4a8d0a9fea1890051063fa1ac.camel@siemens.com>
References: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
				 <20250606071915.2680182-3-jamin_lin@aspeedtech.com>
			 <23eebbbd0b82a36fa0bebbe28ff98fe59d0267a8.camel@siemens.com>
			 <SI2PR06MB504159DEF4568A0EF674D82CFC77A@SI2PR06MB5041.apcprd06.prod.outlook.com>
		 <ef89e171c182791a563b1e8c71987d65a5124c55.camel@siemens.com>
		 <SI2PR06MB504159AD14696D93F44EA155FC70A@SI2PR06MB5041.apcprd06.prod.outlook.com>
	 <32a2a63560234abe3b3f6e4f78de1372c2bd325e.camel@siemens.com>
	 <SI2PR06MB50418C311DE6E84C4BC016F2FC73A@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: 
 <SI2PR06MB50418C311DE6E84C4BC016F2FC73A@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PA2PR10MB8873:EE_
x-ms-office365-filtering-correlation-id: 455fb697-2abf-4472-d4c9-08ddae4f5e34
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aG1WbmI2M1Njckd2MVRiVjF5eWgwYzYzZktsRDVwU01rKzNZVCtNMWJXRTRH?=
 =?utf-8?B?aURJZEhmL1RaUzZPbFcrbU9od081blJvMW1QeWxhR2NGMEdrajNNRlR5eFVF?=
 =?utf-8?B?RFJSMkt4YnBrRDJ4NWgyL2FVSWdYeXIxaGRJYUZOOTA0RXRUV1dLdUd0TCtY?=
 =?utf-8?B?TUVCamZZZXV4elcwRG9yc0VzaWpSR0ZPN2pCSVpqMmsrZmJwa0FjRk9DN0V1?=
 =?utf-8?B?dmZPTExRWk4xQVE4VC90OGRBaEduUXg2N1BPQkVYZGJ2YXB5MXI0ZFZhWDVQ?=
 =?utf-8?B?SCs5S1VPc3NDZjQ3RUt5MHRjekN3bWNpNk9hSFJzTmFmTENNTXZxSGNINXA2?=
 =?utf-8?B?NzBXM1Z4SjFoOGh6VG5oak4rY1dUemFnTkFSc1FHaDROdUVSZmNDNk1GcEpx?=
 =?utf-8?B?eEw2Q3ZNb0VuNi9iTEs0V05lQ09ReWpCL1UwRHozdSs0ZXZuZ1QxYVZZNmpx?=
 =?utf-8?B?WmdGR2V5S3Y0QWxreGVBc0xoajE0c05PSE1wQVZOeW9BRjJyZkxEaGUySTZa?=
 =?utf-8?B?ZkRHUjJPN2w1K0ZQc1BSMXRneHVjeEtwWUwyRUxkb2ZpdUJBc0FsbjB3LzFt?=
 =?utf-8?B?L2phZFlIclJncG5Qd1FReVNodUJoaEh4a1ZqakYycHkrSVVDTWpjV2Zpdnpk?=
 =?utf-8?B?MkRFSHpyeU1PN29wakR1VHJWTzVNcC9rMGp5M250S3NsZmFGUXVlS21OWjVQ?=
 =?utf-8?B?WHZ6UllESmJZL1VST2V4bHRnTWZweTNzSUY1T0dhR0RMREJibXIrQjgrSUlh?=
 =?utf-8?B?RU9sVHExRVJUTURtb0FiWGJyVXJmUlJ3SzhWd2tXUXp5eE5zbFFpc0FSTlJX?=
 =?utf-8?B?b1NNMm1OckpYVDVsTElFb2NReS9sdk9IeXFKUnZiWEFCUE5qaG9YcUpZSTRS?=
 =?utf-8?B?d0VVeFl1VzVwSE0xd1UvSkh4UUl5YVM2Qk1ONzdMWG5ZM00xOXZYVkNIQ2Nx?=
 =?utf-8?B?dXRYcEREU2NXU05KVWUvK0I0TVNaQndXUEp3d2hsQSt4NFpIRGI1czhpSzNz?=
 =?utf-8?B?OTdhdjNvTHRrekZWejI3K2tYMlRJd2E4TllOMVhBSy8yQWlvc0VQWCtPcWM2?=
 =?utf-8?B?M0E1ZVJxWmllTmp3SFEzUGpUOWc1QVkxUmNQbGliaXN5cEpFcnMwazM3Ym1u?=
 =?utf-8?B?SFNUSzQwa05ua3UwU1g0dWhpeStmRHFnbXFxbEloTXZVRGN0NWVaR1lIMEsz?=
 =?utf-8?B?d3JXcGxSdnhOcDRseG1yeFVIay9xM2JLM1ZtZDBuNDhOaHpGbm54Tkg3L3pK?=
 =?utf-8?B?SVFCN2VBdDB6QW9hTWlhbmg4RElUbG1vUm1lNXE5M3E0TFdOTjV3em53QTdX?=
 =?utf-8?B?MTl6WnYyU3ozbHlZUWE1VXdvTktOMlljeG5PbDcyYnRBNXV4c2ljdlFuRVVN?=
 =?utf-8?B?MENaNzRJMEd5VXVpNlNycnA5ektEUng5Nm1WRXAyYU1JTDd3b0lVTDJISUtT?=
 =?utf-8?B?ejlQcTFLWFhWUFRVMEhOdngyOHZXTzY1WW04eGIrY2ZJWktBOEZIMWlFSWts?=
 =?utf-8?B?VXFCTHBtRkczcWdVOHE5NDUrNWlic3NxUWlxRVphSi9saWpZMGN3ajRKd1JU?=
 =?utf-8?B?SGZHdnAyRyt4aEU3clYrejJJVUx6c0xCN0NzazA2QnowZmhGQ0hLYnlRRjkw?=
 =?utf-8?B?TFdJRzJEUEJHa2x1RnREK1htRGMrRkZzNC8xK05yNVNsbVFndzFtMUZaQkRJ?=
 =?utf-8?B?TkZWdlNselJ3bktmQVRPOUVmMnQ5VExwMk1GZG9TYWsxN1NUTytYZm1vYzBk?=
 =?utf-8?B?NXNNbmg2VXRQeDMzbWoyN3hqRWxjemZUeS9PeU5YZy84cnRlazZ5QjBJZG9x?=
 =?utf-8?B?ZkRGbWs3Vm44RUQxSXh0NE1acGxyT0c0clA5T0pWQzUrRlZINER1bVdrUlJB?=
 =?utf-8?B?emRVNGdtM3EvalJYU0V2ZE5GVXEvekwrUC9nSmtkMXhCM0ZpTFhtZVk2UzNX?=
 =?utf-8?B?MDlOQ2U1aDVYdnpjbFdLbFV4NWZNcmxhUDgvTFpKUjd1NWhiOHBNRTl1WUV2?=
 =?utf-8?B?MldhL1FKTmJBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aS8ycHhMcmdHK3VnKzZNdnEzeFBTSGtrVER5T3V6T1BwTkcvVXl5UzA3MUJw?=
 =?utf-8?B?akpVbHR3OFZIUmxyd2NONWc5K2pqck9rQTk5Vys1M3FrWU1Oa0V0M0RlTG9Y?=
 =?utf-8?B?V2ZPSHJVVjhncllPa2YwK2d4b2V1TStFNE42SjBzQkt6UGhuUGdVbGdzYjVC?=
 =?utf-8?B?dVhMUGFIbjRTWFFjTForaVNVbysvb2VFK1Y0U3lpVFhnWUdFbk5saDZmVDUz?=
 =?utf-8?B?Mk40NkZ6dmxEMkxnSHllbHJ6YVJpbW5PVEV1WHF6SGpsejBhMnpIenBibXcz?=
 =?utf-8?B?VzBuRVUvRlNpeXNvRHR0TDJLN3FWMmtjNFByMVcyV21GeUtUTWRkRzJnamVn?=
 =?utf-8?B?THQ1N3N6Y21pdUFzUmdYQmc2K2c4ZVhZT0Y5dXFVYVlpQnlPeHVQREpwb1Ev?=
 =?utf-8?B?SnVZL2xBTFRYRi9ZZFpzVmJtZ3lIYUVQL0NteERnTjV6M3lkaGowY2MvV3Jw?=
 =?utf-8?B?ekxhZGZUZ09MbFNaVngvaGZscEtoWUJBRUZ3NnpjdGZlZXRqSTc4M01BdHpt?=
 =?utf-8?B?cXkvb0VmcWEyenR0eTd5M0lNeUR4N3RpUXJKZmJUb0l1eGhjS1h3Vnk1NHQz?=
 =?utf-8?B?ZWhJMjYrU3lDNGhCS3hMUUx2cERRSVhlaWpTMDFXWnVpOUpSRVVLc2I2dzBl?=
 =?utf-8?B?T1RaclJodU5nbkxnNHhONUJ6NkkxRFpCRG9BRUVQcngrNkR5WWpHeUdGNXRD?=
 =?utf-8?B?TE9ZeFlUUHRkeDBKUGkrWU9WSXdoOG5rQmxDV00wZDl2L0grWkpzeThzRXBJ?=
 =?utf-8?B?Q3lNK0pmdmZnc28wSE1Ubm0vMXgxeitNSlg2Rzd3dHpFbFNWUThjR05PZlFq?=
 =?utf-8?B?bVJyU1M0WktZenBCVG1aa1pmN0ZpeTVyYmhGVzFEcjdaWkZGdDFvQnZWNzN1?=
 =?utf-8?B?K2JSZG41d0REemdFalp5NEdwUXZyS08vRmFXWUlCNmFqb2l0TGhOV3gwa1Ba?=
 =?utf-8?B?TVVWTVkyUm9CblMrVFkxQklZTmpqWmhuYjJYRnlQTEQ5SCtWcjJVbTh3L2xX?=
 =?utf-8?B?SVJVRW5RK3ZuL1hWNU13aW10a0YxbFZGTEI2WTJPYXNUUExtdHhyOE1yWnF4?=
 =?utf-8?B?OFc4ci8xUkd4c2FsSWdnZ2toVHV6M0ordENvd1JoQ2EwYXkrR1dvL1E1RjJX?=
 =?utf-8?B?ZGE5cTJQYmdJSTRPR1RsQnMwNUdTMXQ4S0IxYWJMNzFSTlVYN25Pa3Y1R3NB?=
 =?utf-8?B?RnNPWk5aYW51Yms5alZXclY0OG82UHVENWZPbExNMUNjbmt2UWlpelU3UnYw?=
 =?utf-8?B?MEtPcThnd3U3R2oxUEZpVmYyZHlEZGdGc2JCZ1FWcFdiSXIwMXNBQ0l3SFM5?=
 =?utf-8?B?U3JndEw1T0JxMnU3bm5QMVhBQ3VlbmxzY2p6dkxEUCs3UUFXZlh6K0huVUFH?=
 =?utf-8?B?VnNlYmJ6cThMUkdNQWxjb3cvSUlFdTlSUVZYd3k2NTF2OG5QOGg1SlhnTFJk?=
 =?utf-8?B?VHRuOG9GSUtGWWVleWcraEFxSUxDMmZJWUFuWGdCVlh6M2M4OFF5QXNHV3lh?=
 =?utf-8?B?Z25XTVhBODdqanQvazNBZXVubTNrQnVtR2xKemd5b05XMCt2dFVwWmZsaWJ1?=
 =?utf-8?B?SlRTNTRyQjZncG12TXBmc05PclBBZVdQV1hTK21EcFcrV1NRM0VCQnZtTno4?=
 =?utf-8?B?ZWk0dnAyQ1BxUGR4L3JBUDVyZk9wUDRWbnYxZ1d0dXhuT1Naa2pjSFFkeHZl?=
 =?utf-8?B?U3FzYXdScGgzMUZ3WWR4bmNSaE1EVDhOMm1GQ0ZoTVczZE85UTVkUDR0RitQ?=
 =?utf-8?B?RHB5cTkvb1BwbFNOZ3VlK0hqNjgvSDd6Q1c1QnFtVEZoWnh6QnVRay9NUTdI?=
 =?utf-8?B?Z3I3SzdZTnRsUnliL244Rm1YTnlLRGE2THVta01qdml4NTNnQTYyRE9oRFpq?=
 =?utf-8?B?YjAzNkJVdGxyM3M2V05najhYb1FTaTlwcnlRWVk5OTBrYnZsK214VFIvRXBN?=
 =?utf-8?B?ZmJSckVTOGxwSG1pNEFrZjJUQmtJdUlkbHhaU1NQakI4Z2VJUXlOSlFKR2VK?=
 =?utf-8?B?TWRhNkJOR3pGcjZmeHpZUjl3dyt5UzJ4S3doa0MyVkxRcE83V2YrYUVjNU1j?=
 =?utf-8?B?aCtqY3ZTVHorbW9QcmZUSW9vdUxOUUdTbTJFd3RpZFJKRzVUTUxnd3FDNVB0?=
 =?utf-8?B?a2ZpWitRT0p2ak1RSVJ3N0g0WE84d1pPaUc4OCtmbnM4blNFRVpZcHdsdjN2?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <102DDF731F5B2F4892DD70219BCBBFDA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 455fb697-2abf-4472-d4c9-08ddae4f5e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 10:03:26.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/EvQ46387X59stwwX4uRYNf08iIR8B5vbnzxi5xnleJs5AgINImHLArDCxroT/piMxRvx/Kahj6lxP4SLyRUNilRMlLcc74ftERakK3Ok4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 10:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218997

SGkgSmFtaW4KClRoYW5rIHlvdSBmb3IgdGhlIGltcHJvdmVtZW50cy4gSXQgbG9va3MgZ29vZCB0
byBtZSBub3cuCgpBZHJpYW4K

