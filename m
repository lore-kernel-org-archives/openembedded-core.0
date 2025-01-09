Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7933E77188
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 01:54:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38384.1736387669559342599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 17:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3104150da8=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5091j74U016951
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 17:54:29 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphs9dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 17:54:28 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5091sSkP030737;
	Wed, 8 Jan 2025 17:54:28 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphs9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 17:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqOSYokBTGu7l512erDpR+J1qxScGUJEP9A1LXcQHL/x2DgFHnWQmue2lSW6BphYJYEqbnFFi/Hd3iXLlISDNVlM1hV4XsIoUS0h5EWSSFhYFD0yFtD4xgk2CQ2WIELeVDbnrx5i3ltaKk/I5KvtR6NX/zvC4hl0+iDKNGLeDQcavOI05xIYm8thrjquQv+d2k8QJedImvvHH6NjkVIPw3avEkRUkQJ0RhdYABoL8MYGD0vtyy3xQjOWtN6ymep/YR/KoDudRA5aa3/rKbjdRWo+ZJ9jqLkgKBbDl6RPu7de8VkaeufZXwL7rVkYBB5ACVy4flIiG4my8qWJf8yPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TiKnlieE3lmb0JJNpcQ/HAuEDUf58RurvXhlxuzVWw=;
 b=RhJon1b8e1PsuwSKHk5uEfklvF1u5y83Rz9soiqvihwoM9KiXp28i2ZZvuM9lxNaJjIx3sWWh0FkEtKs9pCbK9r1WQSVwG+zrcji8UO56DgiFzFgM8D/O0BCi7K8jasH7jd0h8r4Kggwgh8DUNuzwjjZDQLu1QpTf9WUjQC/eZSYMo9DYR3aM8VvpsSMrSmeOQuVzpVHvNPNwZGa2fj1uGMnE+v8Lh3h6DoaNQBINPZaZpSa3yJQnbDEWu2e0o7CjkB1y7aMAE8c7Wwm6yFv9pU1WS7Vcc/UZkHNgEc4MXHSEs4UYZR6wYKRJUmPHpzQ8okpm4JyLOrldPFPqHtyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 01:54:21 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 01:54:21 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
Thread-Topic: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for
 building 32bit binary with 64K alignment
Thread-Index: AQHbVnnBni1XhfuWAkCLP4rNGcYgELMNMTsAgACOqeA=
Date: Thu, 9 Jan 2025 01:54:20 +0000
Message-ID: 
 <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
In-Reply-To: <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CO1PR11MB4834:EE_
x-ms-office365-filtering-correlation-id: a35365d9-35b7-416e-5623-08dd30508900
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bi92WWVsMzJlRFlVb0FJcWQwRFB1Z3kvZUYrOWs0UEc3djB0R2ovNkJyeVky?=
 =?utf-8?B?NXJGcmw5ZnZFYTdnNnQvTW5lT1pqUnlGKzZjMnBJQnR1ZitrVW4zRFZXUHRC?=
 =?utf-8?B?a21Fb3IyZWQ1OU9DemVURkQyenVWTUhrKzNnTnM2L2dXSmg0Q0xwaXBiTzZC?=
 =?utf-8?B?aGRURXk1VWNmSU1LdVRnajNWRFd1dmt1S3NqMlJNbE9LaCtJUkFRdms2ckEx?=
 =?utf-8?B?eFFwY2p4WWpPS2xHeE1BYzZCOXlqYVBzbHRHbXo2eGx2d1RLNUQwY0dMd0sx?=
 =?utf-8?B?cTU3OXFqMUVtT3Uza1BsWFN5Z3BocytzbmRZaDQrbktGRGdTLzZOSmZaUHph?=
 =?utf-8?B?aTFydHdSeVp3TXQ0Y1Zka2Jsa3JsazY2K1paQ1pwSDExR2haSmJWd3ZtZUpu?=
 =?utf-8?B?YjliZG9HSW9QZ01KaTBlVVpWTjFxWVB5YnZMR3Q0Rm1kYVFVVURpaHhhOTVM?=
 =?utf-8?B?ZlMwaERib2xzbW9ZTE9zenZBbmRVMGwxdytXM3FZV25xNEM2TmlxN0RVL21m?=
 =?utf-8?B?ZTRJUWl3dHY4WjVNVkVnK2pndlBuaS92NHZLajFZbVYwaS9XcE9SNy9ieGxv?=
 =?utf-8?B?NmdVeWtUdkFiL1YxWFlsRE5CTkJCeTlZVEd5N2ExSDRvdTc4TDdCUW4rYllN?=
 =?utf-8?B?UFF1bzZQbExzWVh2YkZhYmZPR3hRWHQ1bHRJVDBwTGhSWFdQWkxpeWJibXRl?=
 =?utf-8?B?Mld4bDk5aTgvTnlGcWtXOUxYYnZEdXcxOWU2ekNINWsySzc5MURYemRzbUh2?=
 =?utf-8?B?YW9abHdKdDlBTDF3ekduYzhTQUdUM1R6aUxaVkZxd3p5TjZRaFZpY3JNK2Zu?=
 =?utf-8?B?L3JxbXV1UTBDTHNIVzQ2cFExdGNhQW1veWYrd1NkYm5TNGdPaXVraFFNS0Nt?=
 =?utf-8?B?eTZHdGRPbTJQdmx3cWlRV0VrZXdNT005QWx4WGJqL2R6SVhqV0owVkFLQ1F2?=
 =?utf-8?B?cHFNWjRMR3UycXloZ29TeGRxalRIQ1BQMFROaTJJU0xkOXZHME80b3RPTmFj?=
 =?utf-8?B?WXRpWkoxamF6dFJCQjJacUw4bjZQQmlBTW1xZktEaSszWHJ5UnlTcDhsZHVY?=
 =?utf-8?B?TDc3Zmt4QlU3WUVTYTNzWEZKbzB0ZlJOTjVnMHgva1JNdmppc2wvS2FzOUpI?=
 =?utf-8?B?TUdqNHFMbEsxMnYzdXNtT3BoYTQyQnQxZEwyZVgyRmNBc2lkMzRrNDdsRVlO?=
 =?utf-8?B?Q2lhbVdVZDhCM2JGS1dYZ1FnQ0VoV1YzaWNUYms0aS9jcTFqWEdLa0NCbVJ2?=
 =?utf-8?B?dXg0YU1iblk2Q3FjY0xSNGwrTEtIRlRucjJyQ3orQytTUkdTZnZhMWVHSnJT?=
 =?utf-8?B?V21BRzBNZUNjYkd3dkQ2b01KWVEzWFlZcVJRZEJlcERDSHRxTnROWWpFRzl3?=
 =?utf-8?B?UFVDSytmSHFFZXkzaWJtUTZhbVEvR2ZtNm9pelpTVGcvTGFPL1VJQVFJSmxr?=
 =?utf-8?B?aXo2SUpPRklybEdzNWtodkYwUDYrcHQ5SU51QjdBZ3BvMkYxMVp4RzlQR0tV?=
 =?utf-8?B?ckZubjRiUlZtOGxVRTIzcVRvWWlSdjBCc0VRcDZ2R3JnSnkySjZPNmFscGJP?=
 =?utf-8?B?eDNwVEpPRHNENDJjZVdyLzZSVCtvd0oyWG1tSjByNHA3ZkZDOUw3TGJWMXRk?=
 =?utf-8?B?enRLbjd3UTJBNmdGbXpXaE51TkdWTnl5eE9sZzErZEZFVGdJcmZ4R1JnTlNE?=
 =?utf-8?B?SDZTRGd6cHJnRzc2NFA5UnRNb1dZUUVONEhEY2Y2dkpuTU5DK1g4NUpBUTgx?=
 =?utf-8?B?THdkQVpGMWRCamlVbEU5NGhYV043VStJajBZWnRYVUhBTTFpLzVDd1dsSkl0?=
 =?utf-8?B?MXloTHVwR3c1NjRGVWo2ZjNRc1ZNNUhYS1ozYnRZLzJtTDExQlFhSTgrUGZu?=
 =?utf-8?B?YTV6b1VWdzFjY3NaQ2pXak5VdEt4MGlMK1hjNTFjRmZvd1E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVkxRWlkaWZZaXRBU1UrbkxGY1l0N1NIU3dibFdCR2xYWTIzeGtWNlJOVzZZ?=
 =?utf-8?B?QWpJc01MUXdsTFE2d0d0TFZacHlseC9ONzU4aUEyNVZhblNVb1FIWk92b3RF?=
 =?utf-8?B?WXlJcHR1WUFiRFo3cndWSU1IbWJMTDd5NDByUWNtVTJxd0FqVWpldVRTSG4y?=
 =?utf-8?B?cVAvc2VLTUlsNVlhQXF1WktBWTZWbGlmRGN6Q2lUUUZ0WUlmdWZsdTIxN1pZ?=
 =?utf-8?B?Q3JSbHJ0UmlpUWtIaXFnVGYvQmNZd3c1VDl0SzI2aGxwbUNjTCsydHUwYzVS?=
 =?utf-8?B?cS9LUEZnNUgxQU5hdmNJM2tNY2dzd1lSK0d2SnRWVVRZb01FRmNGdWNwSFVs?=
 =?utf-8?B?YTJueWFHL0svTnZqN0lCelBDeVRKLzZZTGhpdTBsSEt0L0pvMXR1YitBY3lB?=
 =?utf-8?B?NURjd2xwWUMxd2FYOEExeTBCcFNCTTJIeGN1b0xyREh3cWVUaHRoYnd1Zjk1?=
 =?utf-8?B?WHdHbk9Uc0tvbkw5OEJWVFJiTWJsWmh5a3NSbjljdEFrei9YU3o3WmlORmZK?=
 =?utf-8?B?TnpFWnhGdVpWMDcydk1QZ0dPMTM4RThuM0lVeStaQjhvY3pXczVCeUd5eGI5?=
 =?utf-8?B?RmNXaFp3RlUvaUFsOTh1K2hzNE5vUzl1VTlkTEJHbGt2SWVjVVREb1huY1dL?=
 =?utf-8?B?d21iRW44dWdnNEZ4a3hlTTNaUTFUUUZZcHNJdFBHVkpnWVp1VS96ZWEwcDRr?=
 =?utf-8?B?WENUQmJNbk5XbEhwZHlCbzNtQ1M2Tjg5R2pQdlB0dmdXM1JVVGJkdFoyeld6?=
 =?utf-8?B?R0xqTDdzWnRzTUpsb3B2ZXUwTklhUUFVcmIrYXhZamo5NjhPdDV1RnMwVll4?=
 =?utf-8?B?QnRKbG5lNjN6WU96U0dxN2JoaW8rRnlqZTBhSHl2SmN4TVpsWklFc3F6OFFC?=
 =?utf-8?B?bDZwakcrUU1FK2tPWStwQ1ZUQ0tmWW01alJ3L3AxbTJRNmlvQy9CNzBEbkZm?=
 =?utf-8?B?c1BFSENXZytmWE15NS9ZeVFSeER5NzZsdCtaNFEra0VOTkNFMEpOeW5QSGQ5?=
 =?utf-8?B?Qm1wdzZHcmJLTWttNWwzOEhuWHdtaURHbjJqaHZ0WTdBTU4wN3FFb2pnSm5i?=
 =?utf-8?B?SmRyN1p1ZDBsYllUQURtSzNSWHJGNlNYZ1lYYjhER0lrOVFRUHJ1SUlQYno4?=
 =?utf-8?B?eFNxclVXbmFadTF6alh4bmJtMEwrcXZSNnlqZ3hXQWtoK0VSb0hwRVQrbzBP?=
 =?utf-8?B?cXM2RGxpSlJXekJ2ektpanptM3hJakRZTDUrcHhNRkROVkd3ejNucDkxVWhz?=
 =?utf-8?B?OXltOW1Ia0JtRUF5NHEvTUR4YXBzclk3UmowTExhbHJLZGp3dEs2L3dVT3N2?=
 =?utf-8?B?ajhSckJsQVFOUStPMmxkS0xubzYzN0dubUZhY3JtWHZsaG9QUUdyTWYvMTBM?=
 =?utf-8?B?UXU0K2dWemtaRWYwVk1mQUorTnB2L0plYkpvU2hBKzJvVmc1UENFYzdjbkNt?=
 =?utf-8?B?RkdJTUxNcWR2RzJIaGZucEM2RGpBLzRCWEFXTVJGZXlSLzBialRyUXV6b0VY?=
 =?utf-8?B?M1NmOUIzSlV6cDNJTTBrZHVqK21ZU3RnakVCcU00d2g4Ym1nNHdBQVNGRVFm?=
 =?utf-8?B?WExHVWVNUkJUUXBibTRUZ0xKUjhUZDYwVTZPbk1rR0xCYzRVWFJtdVFZL0pT?=
 =?utf-8?B?UlZpVFQxMlJXaDc1RnV3VFlKVlRvK3R0VWlVeVFKSUhxdTJoZklETUFPWVFB?=
 =?utf-8?B?K1d0YXBYVVVvQlhNN1BTc3RvblpOWHhwVEVHaG5LVGJtM3ZCYjFLWVpTaXlB?=
 =?utf-8?B?ZWoyZm52TlUvZUE3WUl0YzdoUzE2dnd0RkI4YzdXYXpDS1ZMT0FZWU5TbnVh?=
 =?utf-8?B?WlVHd1JlaDk3VU1ucGlDbWVjbGNCbFZZSzRjNFA2K2NDWTlyUEF3Q2paZ0xs?=
 =?utf-8?B?dU42MUgxeEt3ejFkejRwb0IrSDUydGFaWFJVOWdlOG42UFpVdGtyWTNKZW5q?=
 =?utf-8?B?a3ZIWEhhYStFdkRHWklkY0hYejFTLzhndHNTTUJ2MmNzY21LelE5aURqcmNT?=
 =?utf-8?B?OTRMWWFKaXpHNm9DUmZnakZHdElLY2JCTHkxdm9KLysrTTg2ZGJCV0pxdklE?=
 =?utf-8?B?eCs3VjQ0SnZUR0w3ZFB5VndJSGNwUkQrR1BkSmUxVHlYYWU0TmJiM1JCZlhG?=
 =?utf-8?Q?yAzG/u4796Jjfmimx4+cgS42k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35365d9-35b7-416e-5623-08dd30508900
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 01:54:21.0002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUQz/QyhulOCTqCFU5ZGPsBq07cFjYaeCSZAPagSspbOJltiB1ZSwK2XMPcXsLpzkBrLkC7jwPE4rZlcQ/nwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
X-Proofpoint-ORIG-GUID: -Q2ZgawozmQYAgHTwFBWbAWk3hWJLTT9
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=677f2c54 cx=c_pps a=dbfzVNK0jQbpEhEqKt7tuQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=yLRRl8fl34JnaJj8QgIA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 8D-9GxoiI8A3F1uQRfPP-84ZxmWmSIs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_08,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501090012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 01:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209610

SGkgUm9zcywNCg0KVGhlICIuL2JzcC9tYXJ2ZWxsLWNuMTB4eHgiIGV4aXN0cyBpbiB5b2N0by1r
ZXJuZWwtY2FjaGUncyBvcmlnaW4veW9jdG8tNi42IGJyYW5jaC4NCkluIGl0cyBtYXN0ZXIgYnJh
bmNoLCB0aGUgbWFydmVsbC1jbjk2eHguY2ZnIGFsc28gZW5hYmxlcyBDT05GSUdfQVJNNjRfNjRL
X1BBR0VTPXkuDQoNClRoaXMgcGF0Y2ggd2FzIHRlc3RlZCBvbiBwcmlzdGluZSBwb2t5ICsgcWVt
dWFybTY0LiBUaGUgdGVzdCBzdGVwcyBhcmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBJIGRpZG4n
dCB0ZXN0IGFsbCBzb2Z0d2FyZXMgaW4gb2UtY29yZSwgYnV0IGFzIGxpYjMyLWNvcmUtaW1hZ2Ut
ZnVsbC1jbWRsaW5lIHN0YXJ0ZWQgd2VsbCB3aXRoIG5vIGZhaWxlZCBzeXN0ZW1kIHNlcnZpY2Us
IEkgYXNzdW1lZCB0aGF0IG1vc3Qgc29mdHdhcmVzIHNob3VsZCBhbHNvIGJlaGF2ZSB3ZWxsLiBJ
IGFsc28gdGVzdGVkIGxpYjMyLXN5c3N0YXQgd2l0aCBjb3JlLWltYWdlLW1pbmltYWwuIA0KDQpU
aGUgaGVscCB0ZXh0IGZvciBBUk02NF82NEtfUEFHRVMgY2hhbmdlZCB3aXRoIHRoaXMgY29tbWl0
OiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2RiNDg4YmUzNTRiYzg1
NzI0ZDdiOTUyM2U5NDQzNWZkYWE3NjFhMzUNClNvIDMyYml0IGFybSB3YXMgbm90IHN1cHBvcnRl
ZCBhdCBmaXJzdCwgYnV0IGF0IHNvbWUgcG9pbnQsIGl0IHdhcy4NCg0KUmVnYXJkcywNClFpDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0
b25AYXJtLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1IDE6MDIgQU0NClRv
OiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggVjJd
IGxpYjMyLTY0ay1wYWdlc2l6ZS5pbmM6IGFkZCBjb25mIGZvciBidWlsZGluZyAzMmJpdCBiaW5h
cnkgd2l0aCA2NEsgYWxpZ25tZW50DQoNCk9uIDI1IERlYyAyMDI0LCBhdCAwMzowNCwgQ2hlbiBR
aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8UWkuQ2hlbj13aW5kcml2ZXIuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBXaGVuIDY0SyBwYWdlIHNpemUgaXMgZW5hYmxl
ZCwgZm9yIDMyYml0IG11bHRpbGliLCB3ZSdsbCBuZWVkIHRvIGJ1aWxkIA0KPiBhcHBsaWNhdGlv
bnMgd2l0aCA2NEsgYWxpZ25tZW50LCBvdGhlcndpc2UsIHdlJ2xsIHNlZSBlcnJvcnMgbGlrZSBi
ZWxvdyBhdCBydW50aW1lOg0KPiANCj4gIHJvb3RAbWFydmVsbC1jbjEweHh4On4jIC9saWIvbGQt
bGludXgtYXJtaGYuc28uMw0KPiAgICBTZWdtZW50YXRpb24gZmF1bHQNCj4gDQo+IG1hcnZlbGwt
Y24xMHh4eCBpbiB5b2N0by1rZXJuZWwtY2FjaGUgZW5hYmxlcyBDT05GSUdfQVJNNjRfNEtfUEFH
RVM9eSBieSBkZWZhdWx0Lg0KPiBBbmQgdGhlIGlzc3VlIHdhcyBmaXJzdCBkaXNjb3ZlcmVkIHRo
ZXJlLg0KDQpEbyB5b3UgbWVhbiBfNjRLX1BBR0VTPyAgV2hlcmUgaXMgdGhpcyBtYXJ2ZWxsLWNu
MTAweHh4PyAgSW4geW9jdG8ta2VybmVsLWNhY2hlIHRoZXJlIGFyZSBubyB1c2VycyBvZiBhcm02
NC02NGtiLXBhZ2VzIGFuZCBub3RoaW5nIGNhbGxlZCBjbjEweHh4LiAgSXMgdGhpcyBhIFdpbmQg
Uml2ZXItc3BlY2lmaWMgZm9yayBvZiB5b2N0by1rZXJuZWwtY2FjaGU/DQoNCj4gSG93ZXZlciwg
dGhlcmUncyBhIGtlcm5lbCBjb25maWcgZnJhZ21lbnQgaW4geW9jdG8ta2VybmVsLWNhY2hlIHdo
aWNoIA0KPiBlbmFibGVkcyA2NEsgcGFnZSBzaXplIGZvciBhcm02NDogYXJjaC9hcm0vYXJtNjQt
NjRrYi1wYWdlcy5zY2MuIFNvIA0KPiBpdCdzIGVhc3kgZm9yIG90aGVyDQo+IGFybTY0IEJTUHMg
dG8gZW5hYmxlIHRoaXMuIEFuZCB3aGVuIHRoZXkgZG8gc28sIHRoZXknbGwgaGF2ZSBwcm9ibGVt
IA0KPiB3aXRoIG11bHRpbGliLiBUaGlzIHBhdGNoIGFkZHMgYSBjb25maWcgZmlsZSB0byBoZWxw
IHBlb3BsZSBhIGxpdHRsZSANCj4gYml0IGluIHN1Y2ggc2l0dWF0aW9uLg0KPiANCj4gVGhlIG1h
eC1wYWdlLXNpemUgb3B0aW9uIGlzIHVzZWQgdG8gZml4IHRoaXMgaXNzdWUuIFRoaXMgb3B0aW9u
IGlzIA0KPiBhZGRlZCB0byBib3RoIENGTEFHUyBhbmQgTERGTEFHUyBmb3IgdGhlIHB1cnBvc2Ug
b2YgY292ZXJpbmcgYXMgbWFueSANCj4gcmVjaXBlcyBhcyBwb3NzaWJsZS4NCg0KRmlyc3QsIEkg
c2hvdWxkIHBvaW50IG91dCB0aGF0IGNoYW5naW5nIHRoZSBwYWdlIHNpemUgaXMgYW4gQUJJIGJy
ZWFrLCBhbmQgdGhlIDMyLWJpdCBBQkkgd2FzIGZvcm1hbGlzZWQgbG9uZyBiZWZvcmUgNjRrYiBw
YWdlcyB3ZXJlIGEgdGhpbmcsIHNvIHRoaW5ncyBfd2lsbF8gYnJlYWsuICBUaGF0IHNhaWQgdGhl
IGxvYWRlciBzaG91bGQgd29yaywgYXMgYSBkZWNhZGUgYWdvIGJpbnV0aWxzIDIuMjUgY2hhbmdl
ZCB0aGUgYWxpZ25tZW50IHRvIDY0a2IgcGFnZXMgYnkgZGVmYXVsdDoNCg0KaHR0cHM6Ly9zb3Vy
Y2V3YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWJsb2JkaWZmO2Y9bGQvZW11bHBh
cmFtcy9hcm1lbGZfbGludXguc2g7aD0yODBkYjg0MjIwOGUwNmUzMjMxZWMzYTgzMjIzNjkxOTM2
MzBhMDdkO2hwPTM1ODkxZjFmYzkxYmRkZDAzNjc3YWFlZmQ3MTQ2YWU1MzMzZTZjZjA7aGI9NzU3
MmNhODk4OWVhZDRjMzQyNWExNTAwYmMyNDFlYWFlZmZhMmM4OTtocGI9ODMzNWQ2YWEzNGI4OGNl
MzFiNjJlMWI1NzhkNTRhYjRhYTM2NDQzNQ0KDQpUaGF0IHdvbuKAmXQgaGVscCBzcGVjaWZpYyBw
aWVjZXMgb2Ygc29mdHdhcmUgdGhhdCBlZyBhc3N1bWUgdGhlIHBhZ2Ugc2l6ZSBpcyBhIGJ1aWx0
LXRpbWUgY29uc3RhbnQgKGFuZCB1c2UgdGhlIHdyb25nIGNvbnN0YW50KSwgYnV0IGhlbGxvd29y
bGQgc2hvdWxkIGJlIGdvb2QuICBDYW4geW91IHJlcGxpY2F0ZSB3aXRoIHByaXN0aW5lIHBva3kg
bWFzdGVyIGFuZCBhIG1pbmltYWwgY29uZmlndXJhdGlvbiBpbiBhIHFlbXU/DQoNClJvc3MNCg==

