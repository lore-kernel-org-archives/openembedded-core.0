Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D65CC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 10:09:24 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.web10.9766.1747390162862165474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 03:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tk71htyh;
 spf=pass (domain: siemens.com, ip: 52.101.72.26, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmlmwfCsYbyLjckChbt9FbvOQzSXW9YqXndo+pgtAyfLCqW/Ikdnn07u4T5kWb6U2aiPsXYNlKsct+AH4rJedB/1LG1HvHDuhTvikTtbcAJ+5hToxQBAePJhFVaDiA0jTGMPBWLnXEGfizAwMrYa25f2wBXcWI94rvoz8pYjoQKZFpy3cLIgaJX9aHZeX+NE0W4fgrCtq+dfW9pMKfs2UthDR9uE0W7gjoOd2zd1PFXcC6nwpVhfZIl+PIjACCaYhMq6TOM2dOmCc5eMHh1tGG+2zZWg5ZMRsKZ7sWjhzywcurMXLWzCOAcF3ZbSBKclGQel/GMY/Yyqly/BCUYLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/8t1dIMoSLJur2cUIxyYHcYbwM/ew+G+vhat/wEzs0=;
 b=vomSKhsmPHw2+3BAQgiFm2Y9ju63ELjhfAU19Ob1Gdtgfx4LdXLalQvWUAzGsl0ohY+aU/3W1Yd+XDLQNO9wKFl3S3p18hx1MEASoT61dHhqTJoR3S7LvWzAlc29DYaSgikiMaGO8lydF2UhvDdGj/ENKD6i29oaONOtdRw3tgLy9mtwn+yyD5CUZatDgjX9gcTzMidBYZpll7u8X/x+9rr0FaXcSg1Lr6KcQ3fO7CGZw5QtU4reD98Ahep+OB3pp7sQzkw9ugCfO+o8Qo2gyP0cAJqHmllwpVm3pOV5eLBq2DW93g3A201yh+EQNfaqDA2A9wHU7y9iuWmZtxCmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/8t1dIMoSLJur2cUIxyYHcYbwM/ew+G+vhat/wEzs0=;
 b=tk71htyhrc7kkcy6LTHZQVMUVP0Y97jvKfXtz0bXtzZGBO9AtoM+55+jIf4tj5befeKFpKvKcMsp5o+WiVl/XiIbL084hdwxQWbADTgdL0GA2LGxJ0LH9ZvbGr/eDR5nur/A72p8I6G4KiJdEp7QtzW6HxipMJl/skOx8zCR/5nBpbYgzy3gABctFXqNrUDiqlpLcXB2pxCj6zdbR9l+sl9bSm92VCJ496VwjzU1Ru04HYK9h7G4WYVm9TmuvZkzRPd9fH86+gokXpVaILs712NlbgwYAYkNLNiLPdJXUVN2rI0Bnu25zPlF89NIAxucNIh+Ns7QWd0LnAFL2hiI7A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5771.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 10:09:18 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 10:09:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] procps: fix runtime version when using git
 shallow tarball
Thread-Topic: [OE-core] [PATCH 1/2] procps: fix runtime version when using git
 shallow tarball
Thread-Index: AQHbxkVf8b3TI8/41027RiJ07Bh/BbPU/3OAgAABfpCAAAVWAIAAAReg
Date: Fri, 16 May 2025 10:09:18 +0000
Message-ID: 
 <AS1PR10MB56978C825059C8AFBAC2973EFD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250516093127.506158-1-yi.zhao@windriver.com>
 <CAMSfU+5Ef=BO7AnY-gTeFb4+m6ZmNJMA=R1DkAFZ3vStd6KicQ@mail.gmail.com>
 <AS1PR10MB5697B8FE4755F74E78629793FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMSfU+6m8PNg8hAnbf-3+B3c8rfG=qHEX2e_PzERD_cchjB=XQ@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+6m8PNg8hAnbf-3+B3c8rfG=qHEX2e_PzERD_cchjB=XQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=40f54b62-d3a6-458b-ba58-be8045f537f7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-16T10:04:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5771:EE_
x-ms-office365-filtering-correlation-id: 42d7e0b4-e7ea-4885-8624-08dd9461b868
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eUh6RWlRTFVkTE9ZajFjRXJES3ZHN0pxV3lXMytDejl5dTdIUGxRVTFMMjhs?=
 =?utf-8?B?UElDL0VpY2pVeXJLOVkxZHVnRTRiVmRpZ2ttRW40cWdaeUJ6NXg5MzVFS1ZV?=
 =?utf-8?B?VHpIb0krNDNMbFp2VWJKZ0xSMHlxUlAza21LT2JmNXRncTZnSmEyYzc1cHdZ?=
 =?utf-8?B?VXlNUURnNWJXWlNWV1ppbk81TE5ZWkw5Y003WUNEZzJoVUoyZWo4NGJhZjZD?=
 =?utf-8?B?SXFXblBLeTdzVVdGaTErS3RlVmxhYjhERnA5L0tmTnB0dVdJTmg3elpoMFRl?=
 =?utf-8?B?ZFpHTmkzdzhUOEprQUhTejByQ0xXV0t2cG9xQTdVYmJWSkJZT3ppWEQySlBo?=
 =?utf-8?B?WnNGRTFSYUZta2JNM092Z21zQWJvdlBaM1hlak9jWTl3T1NkUUVCZ3l3U2Ez?=
 =?utf-8?B?Z1phOCtxVFFTNFVweXArWHNDUnNsYnIyb3JDTStYNEJvL1dmbkIrMzhiRVc4?=
 =?utf-8?B?Q2NDZ2lQZWRvWVhKdnlzcTJCN0s0ZGJlV0t2Z0U5VTZXcktDcnpnY2kwQ3Jz?=
 =?utf-8?B?c2xxNVNSbGxzODFVMURnVUtMN0VqMWY1QWlTUnF5NXJFVWhjeUJGZVdwV2hQ?=
 =?utf-8?B?VFdBczRFR2FCRnZzTGtFYk5VU1M4aDVkL1ZCNXdxdHRzVmpqZjlvcjkydjho?=
 =?utf-8?B?VUROdkJNYjl2c1hiSWFzd2xVaXZUMjR6TlEzaGR6encrU21PbGpJeVBjdjVH?=
 =?utf-8?B?Z3dnZmgyMVR1L3d3QkRWMURNdUVGRW1CUDdBQUlMb2Y2Qk1RbWpRb0JZQXNz?=
 =?utf-8?B?U1RIbk56bkJ6RFp3OHJQSjgyZXBDUVRLLzRuWjFhUk91bkRRVVZ4T2RDM2dt?=
 =?utf-8?B?ZFZnZzcyN3gzNVZ6S0RLWTF5ZWZiOXZLVzZOekNjR1g4cTlsSEtJenJtSGhD?=
 =?utf-8?B?ZUd3dWJBbklLVjJJRzRMSVM3cEZxZm5lK3lscVFMVUsxV2NkY2wvdy80RFZ4?=
 =?utf-8?B?VndqSjVWbU84SW11Rm9MSkZkT25icm5uRTFqeTZoQUt5alAzNzRVdUoxM3dz?=
 =?utf-8?B?ZU0xTE5ZYzA1Q3VaVkxQOXd0K0FjKzlYOWU5Vks0aTZWR2UyM2VqQ1JudGZF?=
 =?utf-8?B?S0hER0tPcXVTbWRvZEMvUEExYWNFVGp1OG41ZGJtcStqcCtaYlNHVStmSHhu?=
 =?utf-8?B?YlBaUzlMcnpiWXFJdDRMeDZaNmxGV3BESE9SRGR2ZW5rS0lkK2xYT2hCQnR3?=
 =?utf-8?B?ZWFsV1FLTU5lRjFKbC9uRER3L3gxN2ttQ0lOOTJJQkhwaWIzcTZMcTdxZXV1?=
 =?utf-8?B?RklUclJYSkdqanZOdVJtc0FUdEIzSzZhTHJnWGwvcVFsWisxOUNETmhOYnli?=
 =?utf-8?B?Q21TTTd0dFRtU0dBeFliYzUzN01sYTJQbFRoU3Bpb3pvY2loVEVFVDRROUxL?=
 =?utf-8?B?T2FCZERUOTNwV0kzZVlocmRlUHhDeEVzQTY4S3o5ek1oL1VoMDV6d0Nqcytp?=
 =?utf-8?B?NXlRVm0vUjF0a00ycXg1YWlEd1BCdkRHRFdqSm5QU3RYb3d1SzF1YzhzYnBB?=
 =?utf-8?B?Y0h5YWpEOGhGQ29mbnN3d0RTZWViaGlZYnVuSHQrMjdzR1l4YlZUTXhucmkz?=
 =?utf-8?B?ZU1wRDVzSUVPWG5lZ01qaTFaNXFpZktuYXNxNS9hSVRjMnBpYStSblhjZEFD?=
 =?utf-8?B?bTlBeWliOVlCWEdXd3AxSldrL2UvenJSZEFMY1NsT1drMlRka0d5VTZzYWJu?=
 =?utf-8?B?OVppNVYvckpWbVpyU090ZG9qL0ZKMmE1OTNqdjlpdXhockJsYjNLVnZjdjEv?=
 =?utf-8?B?Q2Q0SXc5V3REMHhjYVZDZVZpNTc2YW9PODgvZjdPQzdwQnZRKzFrTlZWdXgz?=
 =?utf-8?B?aW5HZXEranc5OU9qbmtGV0IyN0tjS1BaOC9aRE8xWEZZV3g3MmlscmNtRHJS?=
 =?utf-8?B?Ujc0c0VyUHkxeGZzVnhocTZsUlNIVllWOVdyNThGR0Fvdm4rK2FvQkhSL25t?=
 =?utf-8?Q?tENFoX85gik=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZVpsenBxL2NHd3l6WjRCT01lWXQyZWJZanRsUE1ydHVKN2JDWEVzWTJzd082?=
 =?utf-8?B?MFJvK24rb2JNeGZVbDBEVjhMZFZEbnZnMys2N2xtVGs3ay9IRDlHV0MyOVl6?=
 =?utf-8?B?eTYwMy9yaE1HWGYrRm9LNWxsS1gvMU9FeTBFcW5sYzhNQVpPallzRmFHeW9H?=
 =?utf-8?B?eXBOMktSbW9pQzhQQ0J3eVpRSG9yeWNiaG1mRWJyM3NNVnlVOWVFUGZMcWhQ?=
 =?utf-8?B?MEZEajJ3ZVZTSk44SEZiV1FCc3FlNzdxR1hGTFRZa2RsTFR5N2hRRjZjbjFZ?=
 =?utf-8?B?Q0N0QUptNzFDWmVMZ2RpaHl3S0g2bDBLTmZGNlY2dmJmQzhCQWRNRlZGRmM5?=
 =?utf-8?B?UXYraDF0cmg5V3VDTEk5OFhpbUxIaUpJMGtxQjMrQ1dtSWJwSXJpZ3B0U1Vm?=
 =?utf-8?B?Ti9LSGozUS9MZkVpaXFNc1lZYmxBR3NndVNtSjVab0NjOG14RWt2YjMyaDdj?=
 =?utf-8?B?MmlCa3dNbnBrTnNmcDZjYkx3cHFtUXM2enM4SWJwTXJIY2IyMVNLb3ViM2po?=
 =?utf-8?B?cWV6bVZzMXhSbmIrbVM4R1EyaENQMEVsTm9VWU91eG11eGRmMGZOMWQrL0lR?=
 =?utf-8?B?aGxSZWlTZDQwUEI5Y0dwaU9LVkhRVW5Ra0ZMMkVPSFlKOW5acEZSS0MxbHhi?=
 =?utf-8?B?NDhORDQ0cHJFV21HUzVjeWc1TVc5dTh5dWdnamV4TklZemEwNGVSdWpBNFB6?=
 =?utf-8?B?MThueWdMbzdvMVdUVXFsY25PQkp2dWkyU2xoS1Z6SWFyOVA2dlFKYnE2RFlB?=
 =?utf-8?B?N0ZUZnpNNDVFOXRUSDBocXBIek5DQlRSNWdZODVpaG5QNm1ZTTd3RldSWmNI?=
 =?utf-8?B?WVU2SHNJNnN6Z2c2UXU5OTBRS1ZHNUtleElScXZTbmVzalZhd0oyYko5QTdY?=
 =?utf-8?B?YzBRVnN4T3IxWVFNbFlHbHZOeEExMm5ueCt2NkVOSFdzelI4ckh5SEtyaS9U?=
 =?utf-8?B?eG9qUTViM3FjUlhxWm9GRWpWOHcyMW42ZlNmNVpubEFUaTk1UHJXYmZtYU43?=
 =?utf-8?B?eTlPZ0UvTDBKS2hTSjcrMStRbFBwMTh4Qjl3TzNLMUd5OGdXenZoWVRvTVNl?=
 =?utf-8?B?WkpSQUo1NjM2UHlWUnN5NHZWenRrcjRVZ3J4Q3d3bHhKQ0Ezc0ZFeVZ2M3Rq?=
 =?utf-8?B?OUVmeERsUjByVTg2VTB3SmdWcE5uamw2RWp2NkZ3eC9HSnJLeFp5b1RDNGE0?=
 =?utf-8?B?UXRCUUlLYmdQbENtdk5aSnllWG1IZFVOR2FybHBGTllqaVJybTdoT3J3ZHNs?=
 =?utf-8?B?bnJZRDJwaEl3YVhRY3pPNEFILzBkV2twVVBSemlNZE5Hem9RQ0VqaFJ2aEN2?=
 =?utf-8?B?NU1GWVI5aENjc2FrRCsxK1FIdXJnSm1kM3BvbnFJOGcxcnVidElVcnYzemFO?=
 =?utf-8?B?TXcza3M1MzNvaFFMbUxMMnRnSDhqakY4ZjZwd0ZNTVlid1VJWDlvTmZCQ01D?=
 =?utf-8?B?K2FhWnMyVE8yN1VDWXlCTXFtd3VyMlpFZ0tlUk1hdFY4R1JwUWora2tRN0ZX?=
 =?utf-8?B?a0pFc3NQbDFJQ1VKN08wVC9FQ0ZKek1UbllHR3FKQVVkZ1c5Ulo0a0ZsVmNz?=
 =?utf-8?B?anhRWnhzQ2VPMThoZ1loamN1L2U0UGZpVTc1RW40aTNkTkszNnBITkdXSTBP?=
 =?utf-8?B?b0RPYkJVbzV2UEFyUjVmU1FNWVRXR2JyU2VEUTJXR3BkWm8xTzBqMXV5d2hj?=
 =?utf-8?B?Ry92R2VHam10L0Q4MTlETy9BemN0WjNqa1BTdzJPL1VsYjdQNlRnbFdlR3Qz?=
 =?utf-8?B?aUQxSjZKWDkzc2k1blN6QlZHUnhTRndFQ2dTNDZyeVdPMXJLZGF2RmttdXVt?=
 =?utf-8?B?dVlkL043ZEdPZEtWZCs4bWZ3R3orZ1YyU1g2MmFpUG5xdHJiR1FQVlBKZllB?=
 =?utf-8?B?UVlQakhFbmNlTEU3bDZLNmZ2SHlQOXJoR1FPbnBBSURncEc5cHhpOEhtb21K?=
 =?utf-8?B?TFpjNE1mTzgxMG5oYVE0UWhubkg2OTlHZG1mZks0MmdaL1hWK1ZldzlQZUNQ?=
 =?utf-8?B?M3FqaFkyc0xCWGxoNGFkRll0R1JOUmcySHhJTHJyV1o4ZlFpT1F3RzdtWlhK?=
 =?utf-8?B?TG1mODI0WkdlUm5pMWkvR0ZpYldrOVZRQUg5VSt5L2RqM2I5MysyOTNvTEt6?=
 =?utf-8?Q?dKXA4ESDNOQtHeZPWc/iRlJhZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d7e0b4-e7ea-4885-8624-08dd9461b868
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 10:09:18.2771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHnahpSTcuY9lKgFDKdGKhLv9PAztyelRHIAjs9SX5mGvptkDZp1/+zfF3BmqhEvXIV5hvmseT10Qs2vn+RLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216739

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDE2LCAyMDI1IDEyOjAx
DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPg0KPiBDYzogeWkuemhhb0Blbmcud2luZHJpdmVyLmNvbTsgb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCAxLzJdIHByb2NwczogZml4IHJ1bnRpbWUgdmVyc2lvbiB3aGVuIHVzaW5nIGdpdA0KPiBzaGFs
bG93IHRhcmJhbGwNCj4gDQo+IA0KPiANCj4gTGUgdmVuLiAxNiBtYWkgMjAyNSDDoCAxMTo0NCwg
TWFya28sIFBldGVyIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbQ0KPiA8bWFpbHRvOlBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPiA+IGEgw6ljcml0IDoNCj4gDQo+IA0KPiANCj4gDQo+IAk+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IAk+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiAgPG9wZW5lbWJlZGRlZC0NCj4gCT4gY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxtYWlsdG86Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiA+IE9uIEJlaGFs
ZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IAk+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiAJPiBTZW50OiBGcmlkYXksIE1heSAxNiwgMjAy
NSAxMTozNg0KPiAJPiBUbzogeWkuemhhb0Blbmcud2luZHJpdmVyLmNvbSA8bWFpbHRvOnlpLnpo
YW9AZW5nLndpbmRyaXZlci5jb20+DQo+IAk+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IDxtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NCj4gCT4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yXSBwcm9j
cHM6IGZpeCBydW50aW1lIHZlcnNpb24gd2hlbg0KPiB1c2luZyBnaXQNCj4gCT4gc2hhbGxvdyB0
YXJiYWxsDQo+IAk+DQo+IAk+DQo+IAk+DQo+IAk+IExlIHZlbi4gMTYgbWFpIDIwMjUgw6AgMTE6
MzEsIFlpIFpoYW8gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGh0dHA6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnPg0KPiAJPiA8aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+
IAk+IDx5aS56aGFvPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PG1haWx0bzplbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiAJPiA8
bWFpbHRvOmVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG1haWx0
bzplbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiA+ID4gYSDDqWNyaXQg
Og0KPiAJPg0KPiAJPg0KPiAJPiAgICAgICBUaGUgcnVudGltZSB2ZXJzaW9uIG9mIHByb2NwcyBp
cyBnZW5lcmF0ZWQgYnkgJ2dpdCBkZXNjcmliZScNCj4gY29tbWFuZCBpbg0KPiAJPiAgICAgICBs
b2NhbC9naXQtdmVyc2lvbi1nZW4uIEJ1dCB3aGVuIHVzaW5nIGdpdCBzaGFsbG93IHRhcmJhbGws
DQo+IAk+ICAgICAgIGdpdC12ZXJzaW9uLWdlbiBjYW4gbm90IGdldCB0aGUgY29ycmVjdCB2ZXJz
aW9uIGR1ZSB0byBtaXNzaW5nIGdpdA0KPiAJPiAgICAgICB0YWcvY29tbWl0IG1lc3NhZ2VzLiBU
aGlzIGFjdHVhbGx5IGJyZWFrcyByZXByb2R1Y2liaWxpdHksIHNpbmNlIHRoZQ0KPiAJPiAgICAg
ICBnZW5lcmF0ZWQgYmluYXJpZXMgc2hvdWxkIGJlIGNvbnNpc3RlbnQgcmVnYXJkbGVzcyBvZiB0
aGUgc291cmNlDQo+IGNvZGUNCj4gCT4gICAgICAgcGFja2FnaW5nIGZvcm1hdC4NCj4gCT4NCj4g
CT4gICAgICAgQWRkIGEgLnRhcmJhbGwtdmVyc2lvbiBmaWxlIGluIHNvdXJjZSBkaXJlY3Rvcnku
IFRoZW4gZ2V0LXZlcnNpb24tZ2VuDQo+IAk+ICAgICAgIGNhbiBkZXRlcm1pbmUgdGhlIHZlcnNp
b24gdGhyb3VnaCB0aGlzIGZpbGUgaW5zdGVhZCBvZiAnZ2l0IGRlc2NyaWJlJw0KPiAJPiAgICAg
ICBjb21tYW5kLg0KPiAJPg0KPiAJPiAgICAgICBCZWZvcmUgdGhlIGZpeDoNCj4gCT4gICAgICAg
cm9vdEBpbnRlbC14ODYtNjQ6fiMgcHMgLVYNCj4gCT4gICAgICAgcHMgZnJvbSBwcm9jcHMtbmcg
VU5LTk9XTg0KPiAJPiAgICAgICByb290QGludGVsLXg4Ni02NDp+IyBzeXNjdGwgLVYNCj4gCT4g
ICAgICAgc3lzY3RsIGZyb20gcHJvY3BzLW5nIFVOS05PV04NCj4gCT4NCj4gCT4gICAgICAgQWZ0
ZXIgdGhlIGZpeDoNCj4gCT4gICAgICAgcm9vdEBpbnRlbC14ODYtNjQ6fiMgcHMgLVYNCj4gCT4g
ICAgICAgcHMgZnJvbSBwcm9jcHMtbmcgNC4wLjUNCj4gCT4gICAgICAgcm9vdEBpbnRlbC14ODYt
NjQ6fiMgc3lzY3RsIC1WDQo+IAk+ICAgICAgIHN5c2N0bCBmcm9tIHByb2Nwcy1uZyA0LjAuNQ0K
PiAJPg0KPiAJPg0KPiAJPg0KPiAJPiBIZWxsbywNCj4gCT4gRGlkIHlvdSB0cnkgdG8gYWRkIHRo
ZSB0YWcgcGFyYW1ldGVyIHRvIFNSQ19VUkk/DQo+IAk+IFNpbmNlDQo+IAk+DQo+IGh0dHBzOi8v
Z2l0Lm9wZW5lbWJlZGRlZC5vcmcvYml0YmFrZS9jb21taXQvP2lkPTAzOTQ1NDc1ODg2YjhkMzFj
N2VjY2M4MGZlDQo+IAk+IDU5NGFiNTMwNmJjZjVkLCBpdCBsb29rcyBsaWtlIGl0IHNob3VsZCB3
b3JrLg0KPiANCj4gCVRoZXJlIGlzIG9uZSBwcm9ibGVtIHdpdGggdGhlIHRhZyBpbiBTUkNfVVJJ
IC0gaXQgc2hvdWxkIGJlIGRvbmUgb25seSBvbg0KPiB1cGdyYWRlLg0KPiAJSWYgeW91IGp1c3Qg
YWRkIHRhZyB3aXRob3V0IGJ1bXBpbmcgdGhlIHZlcnNpb24sIHlvdSB3aWxsIHN0aWxsIGdldCB0
aGUNCj4gc2hhbGxvdyB0YXJiYWxsIHdpdGhvdXQgdGhlIHRhZyBmcm9tIGFscmVhZHkgcG9wdWxh
dGVkIGxvY2FsIGRvd25sb2FkIGZvbGRlciBvcg0KPiBkb3dubG9hZCBtaXJyb3IuDQo+IA0KPiAN
Cj4gDQo+IE9rLCBJIGRpZCBub3Qga25vdy4NCj4gU291bmRzIGxpa2UgYSBidWcgaW4gdGhlIGdp
dCBmZXRjaGVyLg0KPiBNYXliZSB0aGUgY2xvbmVkaXJfbmVlZF91cGRhdGUgZnVuY3Rpb24gbmVl
ZHMgdG8gYmUgdXBncmFkZWQgdG8gaGFuZGxlIHRoaXMNCj4gY2FzZT8NCj4gaHR0cHM6Ly9naXQu
b3BlbmVtYmVkZGVkLm9yZy9iaXRiYWtlL3RyZWUvbGliL2JiL2ZldGNoMi9naXQucHkjbjMxNw0K
DQpJJ20gbm90IHN1cmUgaWYgaXQncyBhIGdvb2QgaWRlYSB0byB1cGRhdGUgc2hhbGxvdyB0YXJi
YWxsIGFmdGVyIGRvd25sb2FkaW5nIGl0IGZyb20gbWlycm9yLg0KT25lIG9mIHRoZSB1c2UtY2Fz
ZXMgaXMgdG8gdmVyaWZ5IHRoYXQgdXBzdHJlYW0gaXMgbm90IGNvbnRhY3RlZCB3aGVuIGRvd25s
b2FkaW5nIGZyb20gbWlycm9yIChlLmcuIGZvciBhaXItZ2FwZWQgZW52aXJvbm1lbnRzKS4NCg0K
SWYgeW91IHdhbnQgdGhpcyB3b3JraW5nLCBiZXR0ZXIgd2F5IHdvdWxkIHByb2JhYmx5IGJlIHRv
IGFkZCB0aGUgdGFnIHRvIGZpbGVuYW1lLCBzbyBuZXcgc2hhbGxvdyB0YXJiYWxsIGlzIGdlbmVy
YXRlZC4NCg0KUGV0ZXINCg0KPiANCj4gDQo+IAlQZXRlcg0KPiANCj4gCT4NCj4gCT4NCj4gCT4N
Cj4gCT4NCj4gCT4gICAgICAgU2lnbmVkLW9mZi1ieTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2
ZXIuY29tDQo+IDxtYWlsdG86eWkuemhhb0B3aW5kcml2ZXIuY29tPg0KPiAJPiA8bWFpbHRvOnlp
LnpoYW9Ad2luZHJpdmVyLmNvbSA8bWFpbHRvOnlpLnpoYW9Ad2luZHJpdmVyLmNvbT4gPiA+DQo+
IAk+ICAgICAgIC0tLQ0KPiAJPiAgICAgICAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9w
cm9jcHNfNC4wLjUuYmINCj4gPGh0dHA6Ly9wcm9jcHNfNC4wLjUuYmI+ICA8aHR0cDovL3Byb2Nw
c180LjAuNS5iYj4NCj4gCT4gfCA0ICsrKysNCj4gCT4gICAgICAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4gCT4NCj4gCT4gICAgICAgZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9wcm9jcHMvcHJvY3BzXzQuMC41LmJiDQo+IDxodHRwOi8vcHJvY3BzXzQuMC41
LmJiPg0KPiAJPiA8aHR0cDovL3Byb2Nwc180LjAuNS5iYj4gIGIvbWV0YS9yZWNpcGVzLQ0KPiBl
eHRlbmRlZC9wcm9jcHMvcHJvY3BzXzQuMC41LmJiIDxodHRwOi8vcHJvY3BzXzQuMC41LmJiPg0K
PiAJPiA8aHR0cDovL3Byb2Nwc180LjAuNS5iYj4NCj4gCT4gICAgICAgaW5kZXggM2JlNDBjMzhh
NC4uZTNmNWJmNmI2NSAxMDA2NDQNCj4gCT4gICAgICAgLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjUuYmINCj4gPGh0dHA6Ly9wcm9jcHNfNC4wLjUuYmI+DQo+
IAk+IDxodHRwOi8vcHJvY3BzXzQuMC41LmJiPg0KPiAJPiAgICAgICArKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwc180LjAuNS5iYg0KPiA8aHR0cDovL3Byb2Nwc180LjAu
NS5iYj4NCj4gCT4gPGh0dHA6Ly9wcm9jcHNfNC4wLjUuYmI+DQo+IAk+ICAgICAgIEBAIC0zMSw2
ICszMSwxMCBAQCBFWFRSQV9PRUNPTkYgPSAiLS1lbmFibGUtc2tpbGwgLS1kaXNhYmxlLQ0KPiBt
b2Rlcm4tDQo+IAk+IHRvcCINCj4gCT4gICAgICAgIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51
dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsDQo+IAk+ICdzeXN0ZW1kJywgZCl9Ig0KPiAJ
PiAgICAgICAgUEFDS0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICItLXdpdGgtc3lzdGVtZCwtLXdpdGhv
dXQtDQo+IAk+IHN5c3RlbWQsc3lzdGVtZCINCj4gCT4NCj4gCT4gICAgICAgK2RvX2NvbmZpZ3Vy
ZTpwcmVwZW5kICgpIHsNCj4gCT4gICAgICAgKyAgICAgICBbICEgLWUgJHtTfS8udGFyYmFsbC12
ZXJzaW9uIF0gJiYgZWNobyAke1BWfSA+ICR7U30vLnRhcmJhbGwtDQo+IHZlcnNpb24NCj4gCT4g
ICAgICAgK30NCj4gCT4gICAgICAgKw0KPiAJPiAgICAgICAgZG9faW5zdGFsbDphcHBlbmQgKCkg
ew0KPiAJPiAgICAgICAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7YmFzZV9iaW5kaXJ9DQo+IAk+
ICAgICAgICAgICAgICAgWyAiJHtiaW5kaXJ9IiAhPSAiJHtiYXNlX2JpbmRpcn0iIF0gJiYgZm9y
IGkgaW4NCj4gJHtiYXNlX2JpbmRpcl9wcm9nc307IGRvDQo+IAk+IG12ICR7RH0ke2JpbmRpcn0v
JGkgJHtEfSR7YmFzZV9iaW5kaXJ9LyRpOyBkb25lDQo+IAk+ICAgICAgIC0tDQo+IAk+ICAgICAg
IDIuMzQuMQ0KPiAJPg0KPiAJPg0KPiAJPg0KPiAJPg0KPiAJPg0KPiAJPg0KPiAJPg0KPiAJPg0K
PiAJPiAtLQ0KPiAJPg0KPiAJPiBZb2FubiBDb25nYWwNCj4gCT4gU21pbGUgRUNTDQo+IA0KPiAN
Cj4gDQo+IA0KPiAtLQ0KPiANCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0K

