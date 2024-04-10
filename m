Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8CDCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 19:30:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10739.1712777393351729380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 12:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hWiaz8oG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=483074a6bf=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43AAKpgT029532
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 12:29:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=BnvVOgNbVd1uB10OaesXV+C9O7qK7hyKBmjUZ7jO7SY=; b=
	hWiaz8oGjv48kGjcDBu+mbgvouDKsV2btleeeqgkSE/nZ/UZD2NruB+oEuUYdnCg
	RKqSLWs71D/kmdwHSP3CWqE3i/xpaNYEYHQTfLbvVwROdqOyoKiHQxAaRQlgQqGJ
	5ivVvl3j44PrIpaHWsXr6xQFfuqvbL6sKv0OgbFG6wgeIzXZ6Vn4DjPzT+HteU1F
	NMfY74MkqJ9/jUJ7E2m9SBX78wEBItwAyqWgAKRGXzYa56wSSVPR/T0KJwPt6sux
	U1w50x+36LKFvRULuFLblsRQ5nHAGnBh0bgGQsVwc29ZNI2JoeawqEBzwRAzrMbh
	N5Rcjs6bBrbN8cJOpmNakw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0d419-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 12:29:52 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43AJTqoK024572;
	Wed, 10 Apr 2024 12:29:52 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0d418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUXfFcb5m41dCz6s5Z04JK4+D3YVelWYGblYvcTwCf3btSwHFwb2kF08VtX7igx7t7ALvyKsYjz5qveYlpilI8qPJz9u3fwQRukZfJm0gb+vFTfYDXTowXUWbKImIRdr3rl037NE5FHaWHjCqkhJFxqvyo5RWN2+dcq16AaGbamQvl46Ajw1e3UDy1jgC/NHEDhJB8LLWakQYubJs3cebxfiJiKccP+fesyOjP22kTC7nTTcpW63QMNIFwG1GkFhpTubopw1X2NIt1M0ptD6120rD2UbCJF38s4VCEcNNRyaoBLDfJ+3Aiag6yb1zNgPoXFdak+q0rZQZ6bazyYiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnvVOgNbVd1uB10OaesXV+C9O7qK7hyKBmjUZ7jO7SY=;
 b=OAGwjoG2XJMtOpG3FyliaLlu38bnbiRjByLIcAxehSwaw255bVBo75XVQwnT5dXq2oSbdwuvo1G/BFPAzlQxMoy7BI4kvI8SZHmns/z6mmdkQscde5wzkZW4LN1hLogQg7i66X/FPFY8TsmtvY1XP08n9KbTPHwFcXlMqGsez1c59eB0Z1+7rE9qtmaR49xKHxwq/1Y5VjluLAV07Y2lHMjKgG1ohi/Y0e+4eNerBxbePQn8pBMsvLZVUOZexh+DSEQzwcgANgk3J0jpjmHAILK2y/7TzYjvqXK67Y3eDwRNlV11QsPGuizzn3On5cjvq0RGSbozLBDkR0FBb0cpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 19:29:44 +0000
Received: from DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4]) by DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 19:29:43 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ross Burton
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Topic: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Index: AQHaRAluibax8wkzFEKf53PfKK2bc7FiEXGAgAA/sYCAACAYIA==
Date: Wed, 10 Apr 2024 19:29:43 +0000
Message-ID: 
 <DS0PR11MB7287969C928B661E407BFDD288062@DS0PR11MB7287.namprd11.prod.outlook.com>
References: <20240110211016.1470053-1-joe.slater@windriver.com>
	 <629B6710-F394-41B8-AEB0-6C8A6A594EAE@arm.com>
 <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
In-Reply-To: 
 <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7287:EE_|SA2PR11MB5211:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XmGU/P2I48moSFxBz95Oe1l0knQScSJBP5gdf7nd85qcDLrGhwmSTOkCji4wT9q07Y+dJvTb55A+62t2KqFdz5p4AZaoCv5LyfK9vSNG7LKC8xaqUP6YUwS3pEOGRcPCwOsu3nnh+zx+uvg3q3I7+NjpBK0VwjlY3rkXeflAR97Tet4uGyujLvkOXNjfCsrCckb6p250WRz78XwBEhuC3ov0eAe8NfJhT0YU9rGYJzim2X3pW2QAiK40ZteL4tPem2+6baJB0w3N6mNxTyZvq60z9DukPeRPbhjYso7ykJGSQQPxX1F6nLhu7aTgbn25KE5X9LtSax/yNpKjF9jVUdXs5XsDx2rdRKlhfSJmHVFNCTXADXXPMx0KLuZIJzEpIPS6+w0n3JA7J9YpOMrm4EgDlJ6KvohOLcP35/8z6iiQiC7/1jJSAB8qnMyDiQXqeL4OPRaz8va4chhfLirqC+AFufpTfeAZFk64aE9kYpoQxHIxrKnZZ/4pMGqD3+x1t97UcsEvr3nkpk5uh7FQE3S6Q41PfpkPhrz535d4FR8Gj4VzQ4yUZ89OVEfSmRUcq7n8bMi9s+nweKX/hfyRhOxcC6vhgReknqFwts86D7r8s09AAnAHemmoNxXjwqY0o2eDjE3S9uzG0Fy9iN3v89WhMBK4Mpj9NtfGIeBwrcs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MThBSzgyMm8va1BMSWtzU0JtRWw3VTd1QU03Y05JZVJvVWRMb0FKYk9pNFVn?=
 =?utf-8?B?Tm9HSkZuTm50Y09icFlwYXpuYkxYaFdNci9uMWNMYTUweEs3dWZHSjJ0bytq?=
 =?utf-8?B?TFB6Z0U3N3FXTldCTWhaQk9uTmF1NzBtQ2VReldYSUdsK1lRYy9tbTdqSExP?=
 =?utf-8?B?QUdsdlZhYUdWc090aDNNTlExK3ZhUlljTXhnaW95NGYyZlRKUnUwTHVZQ2xq?=
 =?utf-8?B?NXBOOC8wYk55YkJ1bk9MaWluM2tjK2VWbnNKakdFcGh6ZXplZjluVWJWWk94?=
 =?utf-8?B?Uk9iZGxYaVppS0NuRFVLVXRBeU93QzZWWVRoQ1gzVnhKWDFJaUxEdE5iZ05m?=
 =?utf-8?B?MWJPNklBNU9BSWRGb1dZWHRqVDdDbHV0QkptNXhoRnRyVlpnZWFiaXZYaWwv?=
 =?utf-8?B?d0lKanRFek5jUWdQSWJYL0xCdXBDQTFtSHZMNmJrVTE3UmlkeXJJOGlDanVy?=
 =?utf-8?B?SDZWa3k5aitDSlZOSVE5K0FmZXIvWlB3QUJFWFZ1bzI0WENwK2lQQVZvTGc1?=
 =?utf-8?B?RFEwNndkaFNCcGtESXhiSDd5OSthK1lhaFppYnYxUDNobTNISERUMjNFZGNV?=
 =?utf-8?B?Qm5wMWZtRDlSdXhjUDB1bzY1emxSSVgrY3pHS0EwWjE3Nmx3eTBROGgyNDNk?=
 =?utf-8?B?cGlBR0VuUERLYjJ3anFRTWFnUlU5N1dBbHpYcS9MV2dSVHpMekYvbmd2WURX?=
 =?utf-8?B?c0dDVUlaMGM3Vy9acjI3RTZLTStXMFNZUUtSa2NlS3YyaU0xZ0JydjZKUUxh?=
 =?utf-8?B?dlFyVU11S1dCMWVtV3QyVG8zYUFsZWJYT3kwbkMvM2VYWVNCVHZ3VVRxa2ox?=
 =?utf-8?B?OVFSM2M2eDM2NU9WdzlmSllSTlB2dVBHOE1EOXVYMVNTbWViYkFLWGEraXF3?=
 =?utf-8?B?RTVNTmREaWVkaEUzRldCVVFTTnJPUC9XSVV5ZkFQWnVxdnRiL0M0OEN0bmpt?=
 =?utf-8?B?TGhyczdXQWhxdDdYejBqNU02Y1g0ejdYb1AzQXA3aEh0aWpldGlvaFlwR3Ez?=
 =?utf-8?B?N3djWVRtUzVVRnFkN3FGM3dyRmo3ay9TQkdkakY4NUpienNlN0p0Q2dBeGJn?=
 =?utf-8?B?K2RzNTE1ZGZZY3VmN2lQK2xiT1Y3U1BHV0VUeExNeE1WVDdPTVNoVG5EYU9m?=
 =?utf-8?B?VHA1K0xZa3YzeEdmNndNV3dpZWM1V25kVmlKelYwYUI1UGR1bnJsVW0yZ3lE?=
 =?utf-8?B?MEtjL3BmdlJUOVNFWHlZZVg1a1Y1bUdSSUVwR1ppWVd1cXdCOEdtNjR2TjFB?=
 =?utf-8?B?dnZqRzlPSEducVFGZkd2blJyYXFwOWMrdGxnZjRmSytXNXo3Y1RoeDl2RVIw?=
 =?utf-8?B?amFMdmtKNkkvcks0Skp0ZUhzelMvQ2JyL3VFYWRzSWhaUVRGaS9SWFBaQlJu?=
 =?utf-8?B?KzU1Uk5lTDZ0QVlUV3gwKzNTWDJJbWVnbDJmRnJZTDB2eFJSSlZFMXZ5ZlVi?=
 =?utf-8?B?U1JJRmNaWmRWZjRKcXZTYnZnVXpoQU50SHUxZVFIbGh5Q1RpQmttdGFOMlMv?=
 =?utf-8?B?QklZdlRVVTVabHdQeFRDVXdjSm1SYkl0UjZscnNPRGpUYnhBbnc2bDFvV3Bh?=
 =?utf-8?B?SWwya3V4VktHOHc3Nnp5bm9UWG16cE9pUG9OUXBIbEdRcHRXM2tIY3NhblE0?=
 =?utf-8?B?N1BJU01FSms3WWlKcTR4RjdaUkh0Mml3L0RTNWIxTjFIN2d4NDVybHF3ZzFT?=
 =?utf-8?B?dnRjQUpHNGUzM2pMN0JZRlhDRUhFalNLUVQveFdaWk9MV2p0S05VbW1XRTNu?=
 =?utf-8?B?VG5sMmJoaCtLS0U3YmhSWGlhMG84NHc5SEQ1TkFhZXRUa2s5ZGdoTFo1ME4w?=
 =?utf-8?B?bG05VmlNa05wRlhuSmJBaFlBaXhLaXVtSzJTVElJUGErSko3c1hLMUpJaWtx?=
 =?utf-8?B?ZGd4eHJwTzR6WUh2RS9qYVRVZ2lnOXJoa3plZWxwRUdOVDF3SVV6WnFYcjdI?=
 =?utf-8?B?TUpocFBQNVhxT0ZtZThYeW1Id1lKYy95U1A5RGNmamF0R0FtUStSK3ZCNzYz?=
 =?utf-8?B?R09QdDJwbi96bHREMStkbTAvOUZKWWZNbUhtdm1oTmJNbWtwRlUycnFwVGVq?=
 =?utf-8?B?V0hmd3RMRGtjRUJBb3VjRFliSkQwWUptd25Oc2dSWlNkTVlZdGx4MFVGTnMx?=
 =?utf-8?Q?BbRE4g5shNZD6nGJJa4nLx0d3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53805a5f-b9b2-4cd1-aa82-08dc599492f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 19:29:43.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OgtRfRUwXEGxQYmMaVonbHpGN6GuOIp/nGpeMhm7eKMDbRY0VCZNw7bgJYVkSSAoPkMr5lRRquKQ5m4gEXKNQTPNjYeYMFNMyy32OHz/k1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-Proofpoint-ORIG-GUID: rzR-q-AofQREclRWoo0_zsmEE6XEWrXY
X-Proofpoint-GUID: sNu4QPZPB_omgLid70z6t_7wM-y3cSxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=665 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 19:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198107

VGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gaXMgdG8gY2hhbmdlICJhdXRvIC9ldGgwIiBiYWNrIHRv
ICJhdXRvIGV0aDAiLiAgVGhpcyBsZXRzIGJpdGJha2UncyBpZnVwZG93biBpbml0aWFsaXplIGV0
aDAgYW5kIGFsc28gYWxsb3dzIHRoZSByZWFsIGlmdXBkb3duIHRvIGluaXRpYWxpemUgZW4qIGlu
dGVyZmFjZXMgaWYgdGhleSBleGlzdC4NCg0KSm9lDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTAsIDIwMjQgMTA6MjkgQU0NCj4g
VG86IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPjsgU2xhdGVyLCBKb3NlcGgNCj4g
PGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc7IE1hY0xlb2QsIFJhbmR5DQo+IDxSYW5keS5NYWNMZW9kQHdpbmRy
aXZlci5jb20+DQo+IFN1YmplY3Q6IFJlOiBbb2UtY29yZV1bUEFUQ0ggMS8xXSBpbml0LWlmdXBk
b3duOiBhZGQgcHJlZGljdGFibGUgaW50ZXJmYWNlIG5hbWVzDQo+IA0KPiBPbiBXZWQsIDIwMjQt
MDQtMTAgYXQgMTM6NDEgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPiA+IE9uIDEwIEphbiAy
MDI0LCBhdCAyMToxMCwgSm9lIFNsYXRlciB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
IDxqb2Uuc2xhdGVyPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+ID4gPiAtIyBXaXJlZCBvciB3aXJlbGVzcyBpbnRlcmZhY2VzDQo+ID4gPiAtYXV0byBldGgw
DQo+ID4gPiArIyBXaXJlZCBvciB3aXJlbGVzcyBpbnRlcmZhY2VzIGluY2x1ZGluZyBwcmVkaWN0
YWJsZSBuYW1lcyBhdXRvDQo+ID4gPiArL2V0aDANCj4gPg0KPiA+IE9idmlvdXNseSB3ZeKAmXJl
IGRheXMgYXdheSBmcm9tIHJlbGVhc2UgYnV0IEkgdGhpbmsgd2UgbmVlZCB0byByZXZlcnQNCj4g
PiBvciByZXdyaXRlIHRoaXMuDQo+ID4NCj4gPiBUaGUgL25hbWUgc3ludGF4IGlzIHNwZWNpZmlj
IHRvIOKAnHByb3BlcuKAnSBpZnVwZG93biwgc28gYW55IHN5c3RlbSB3aGljaA0KPiA+IHVzZXMg
YnVzeWJveOKAmXMgaWZ1cGRvd24gd2lsbCBmYWlsIHRvIGhhdmUgZnVuY3Rpb25hbCBuZXR3b3Jr
aW5nLsKgIFdlDQo+ID4gZG9u4oCZdCBzZWUgdGhpcyBvbiB0aGUgQUIgYmVjYXVzZSB0aGVyZSBp
cyBhIHNlcGFyYXRlIGludGVyZmFjZXMgZmlsZQ0KPiA+IGZvciB0aGUgcWVtdWFsbCBvdmVycmlk
ZSwgdGhpcyBmaWxlIGlzIG9ubHkgdXNlZCBpbiBub24tcWVtdQ0KPiA+IHNpdHVhdGlvbnMuDQo+
IA0KPiBJJ20gd29ycmllZCBhYm91dCB0aGUgbnVtYmVyIG9mIG90aGVyIGNoYW5nZXMgb3ZlciB0
aGUgbGFzdCBmZXcgbW9udGhzIHRoYXQgYXJlDQo+IHJlbGF0ZWQgdG8gdGhpcyBzbyBhIHNpbXBs
ZSByZXZlcnQgbWlnaHQgbm90IGdldCB1cyB0byBhIGdvb2QgcGxhY2UuDQo+IA0KPiBJJ2QgbGlr
ZSB0byBzZWUgYSBwYXRjaCBwcm9wb3NhbCBvbiB3aGF0IHdlIHNob3VsZCBkby4gVGltZSBpcyBz
aG9ydCBhcyB0ZXN0aW5nDQo+IGNoYW5nZXMgdGFrZXMgdGltZSBhbmQgd2UncmUgbm93IGEgYml0
IGJlaGluZCBhbHJlYWR5IDovLg0KPiANCj4gU28gc3BlY2lmaWMgcHJvcG9zYWxzIHdlbGNvbWUu
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCg==

