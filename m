Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634AECD1296
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:34:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.108475.1712586844041941258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 07:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qyUy0T7R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4828e4a765=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 438BePj9008100
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Apr 2024 14:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xodlKA8xGaiC+vjxZdt1DnQkZZAu8F4M1mndkvv5fhA=; b=
	qyUy0T7RhInf4tfPwzTDY+SAy4xF7nP8mzJUIIFEcSAUEOI7dO9OzB/Er5kLREUn
	s3I9gZ8Vr1IXyg3kEcVJEmnV/WsE1M2eHvYoJqiBc4f8NIehlQwUoE6IlaLpuYyA
	TTPk1r25WatWEQSI9gjdECSjQmoxjmAl/8U2aR591J8SSEwLnZs+MoUouloX0Dm4
	MFOTgME5m9JEIDSd+/PYgsIFRwHMd2DT4Yjb4siwFUPT8MxfgyBXZDHXXsjN2vxQ
	9huqYaSX1AAvgwzXsrfOQPAlgLV3DEGQqw33sfvgo8SLep/lBJQ8j0xw5Z7jgQDm
	N6SycgT5PrJvvIaz5mUtig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6hrem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 14:34:03 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 438EWIvf015258
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Apr 2024 14:34:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6href-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 14:34:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGtXHL0AtkX8XUGiLWP99jhgpUnacyImEv6iz4xelkM8Hjl34zbarJewQOHHTCAosiiDH+C3ebmY2mD/Z0Eu1EAp++OWKeC9TfEoqdqXGW06HLgh4c8H8SKNwJQHKHCDU9cf3w4DsyZJRNTjQYyK2xokpWppUkxSONkuDxILTUlEgJP0KZwIHK8dq3REhl5vPmpELeFyQwJxwRxGyeXAyxMeNBliHCQGKBC66SvX8K897MVTSVOvwLUG7ONOsLZuTiRYf8AIi19rk2iSYpUmFsr3Bsx+A6NdDiI3wjHHXtZ7zPsFEx6d0eb+P+CsF8ZiYqGXpL8mQL5ZwY+Yh03inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xodlKA8xGaiC+vjxZdt1DnQkZZAu8F4M1mndkvv5fhA=;
 b=W9OzSjcDXvinYM24qpCVGBdH1CvhY1XCfD/xSm1xC6Fi0qUfVF2Bk68lGiACH9kzb7CxJ2yyMkdZMvxGKV786xF8PbhtkxfwYFmqYMSoIkdHPtYaj+2T9RfjVmVEcUTqeDdNB4s/tJEKL2Zj3OavnZuFNwQ1gtRZXAAeQG4WoD6oVo8kCGT6r+GEZEbTmLba6Ykte2VqZDxkbsD81QD7PeAJyQYxOjpMwcmpgOCJ84placndvuTmlAsqfxC46z2hXTWLdeaWXecbZKqnAUj7EvW9MHSv2EHnGJp+D3Qm2lipkFIZkxsy2i3aMpkJbVu1Qh7Em9jA0gab/ELixmdKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 14:33:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 14:33:58 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Steve Sakoman
	<steve@sakoman.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [OE-core] OE-core CVE metrics for master on Sun 07 Apr 2024
 01:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 07 Apr 2024
 01:00:01 AM HST
Thread-Index: AQHaiavuejcAzbGzZ0SQNeyNjujNpLFeb97Q
Date: Mon, 8 Apr 2024 14:33:58 +0000
Message-ID: 
 <CO6PR11MB560280518E58379871B7C6CAED002@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240407111917.545EF1068E9@builder.sakoman.com>
 <0cc0c9367fb649fe57bbac9d4caacfe5c2b81f9e.camel@linuxfoundation.org>
In-Reply-To: 
 <0cc0c9367fb649fe57bbac9d4caacfe5c2b81f9e.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MW6PR11MB8337:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pR3ssncetJq+EM4Zqz2euPLLraBm0LgdUqiyRoUaWbxGUL3ZCwDdR9vPrFB2gU0tgZifTvdikwwYgiem/rVFyEZQX/aZ4e7wrTSP1B+/8uxkNCQmZ+XHs+RcYSzpuiCVV6dXRscd+2QW6UrpzNVzO7GLak8NmG6JJlMCpnBA+rQAhk3rXji2X7WHnni3JSHTveoQE8Q0lXvvkRtKIEwpVZAq4plHMHc0PeL/SddJhXLaSlrW4IPBDcvb/we5yTLzlB1/HcB6lMKQiFehOvlFA8pENlZvVV3pfBgJXSh2opPdQZQKpbkIqdAHae5kAKOGE/+nHBOJz2Sntr9WG51bGSB2H9aNVtP71M/fxvbd6GHrLyKXTqYYrWKlYt4nRhfJMI7pd7rXX6CecuGySdjrh/c/DK/S5lGy8HFHa/ZjhyhQpv9MitM7q2ckpXWQpMt4nesQoor6KEf4zgYCMoBRsmXhCbKdmBY1jkOLYoN4Xv3JM7PMMA6QlaIX242E2Uxhom020pf7qswWesEJZGxcaAnfzwzwe3Anr+iYu6vUzoe2Iljp8xDBANFw/9pJxwXFTTHqVwU5g1gRpV4CLZFmkR4efeWz+9Wgd27uXjmiJB0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NGVqSnQzc1BBUU03bTZaTU9jT1JzY05VRmU0S0JaaHFsVmRxOSs0eVd4L2wr?=
 =?utf-8?B?ZVFHdnJnaCtjeGdZNTNQQ0VFWm4zdzdvM3ZkV1JqelFNOHFsYm5Wb05XQzZ6?=
 =?utf-8?B?cWFMMDYrZjc0UWVQbHRzK3czbkhQcXZsVTFjdEYvM3lwdTUwTnhXY29NYnN1?=
 =?utf-8?B?cFV6bWZjMmRXU0NybGU0RXpqSVJRNnRIajdWaWVMWVcxZStwSzRTVnpVSXVZ?=
 =?utf-8?B?M2RZTGltRlRDMk4rR3ZjN1pCK2NwdXU5WXFSWmpRT0E4Q3FrSlZBOVVnQjdY?=
 =?utf-8?B?b2RxanArMGlDVmpNOURxUU9Ic1ZZWmExUUxiRTVTbmJCL2dBTTVmTzZaUXBZ?=
 =?utf-8?B?aSt4bXFwV1lhTHhQY3N4QTdtZEhDcXpKZHVZc20wem9tZitOdnoxcmFiSGtV?=
 =?utf-8?B?ai9OMEQ2ZHhHcDFWVHk1TEkvNHlYMDRPelhMRG1scStndDBUMHd6UDZVL0ZZ?=
 =?utf-8?B?K1MycEtoRmprYXFSVEhOTGczcVdxNUIvaGxQQXlRMXBhaWVhYWphUGxpRU1C?=
 =?utf-8?B?STN6NTRselRLSG9lK2szUG5JenQvRVA4WnBKRWdxVisyamdBdk5tUUdKck1v?=
 =?utf-8?B?aGt2cUZRWFh1Q0RSSVNVNUtxeWYwODFndGRIeFU5SGxRQWFKTFl6b3Z1TENo?=
 =?utf-8?B?ZTlrWU1PRHRoY2hsTkc0V0hHNnFwSitEODErSWZxNzNnRVFNN1lUZmNVc0Ri?=
 =?utf-8?B?aGJhM0Yzb1V4enNmVCtSejUxSTEzeGFpRUF4a21IeUJNYXpvdHVKMk1ab2U4?=
 =?utf-8?B?UHdWWFE1azY5U0ZRek5TSjErQVNFVW1uU24rTnBJeVpidTFUZFRWUFpUR0Jt?=
 =?utf-8?B?bWJmcDRuQlBnNytaWCtlN2UrcEtJMVpGeTJDdldUeUhiZmlCVTZ0NUUzS1Y0?=
 =?utf-8?B?WmR5MG51TktNZVF1WGhpd2FkZGh2K3dxcDhlTEZOaldOSjhxeFJUNHJEQ1pR?=
 =?utf-8?B?bW9YRGdnWVNsQkNZWS9SMXFuTENRVXQzNGF2dmdqYXNVK3lESGFIUlJ1eFpy?=
 =?utf-8?B?Nm0rRG5vR0ticnA0bTBKR2tXczNvTU0yV2tPNlp0MnNma0pPZkY2bmpkL1dI?=
 =?utf-8?B?NGo3TXJCZGpmU2VXa0xRSjcyRDN2UGg0dTFvMnM3V0xvTEl2L1BjWnJFU2Jz?=
 =?utf-8?B?dnlBQk1YV25VNlZha2RScUhhenhnZ3pmRkVGNEY2VlQ1RXgwZ1BuanlPcnBO?=
 =?utf-8?B?R1ZibzJybkRnQXFRMGdlUWQwMFBhYTlqWnJyWnVIQXBsNkkrMDhoZ1RyQlk2?=
 =?utf-8?B?eXlHVW5NdWNPVSs4MmkyTm5oQmJSQ2VmUkh6U3dUMlZodTZsMWE5UnE2TGZx?=
 =?utf-8?B?L0lmMi8rbWgyTVdCOGpVbFpmYTR6WGVCcU5XZjNCODVMOXNXSkY3bUl6RGV2?=
 =?utf-8?B?NEJXRmdEd296aHpUaDRTc1NKOXRqYTlMN1g5Zmtta0xuMFZCOVlJVjNKaVAy?=
 =?utf-8?B?MFdISkViazMrQms5V1hSaFAxbElmV2FMekxuc0FCekRnZEdSbHBycm5tdVlp?=
 =?utf-8?B?S3FHVHRWVnNzdVNNLzdKcVp3TmhselNPOGZYRHdadnlNVTk4Ky9iRlF5ZGhu?=
 =?utf-8?B?aElDS1N1RDZVK2RHd0FXVUJ5TnFIOWVaejFLNC9JZDdRNUJoQTJWYXBFVDk5?=
 =?utf-8?B?Nit3T3FzMy9FcHNhODVHNndnaGdYUEZoQW1TQTNEL2V3MjVCSHEyZ2ZWVElU?=
 =?utf-8?B?NDM5SU1Vb2lIKzVKU0pFK1N1YjFFMlJza2RKQmYzV0cxV0lOV25HMEROWE1v?=
 =?utf-8?B?T0FEaEdiOThRZ1BlLzcwRDZES1d1bHVBcmxLVkhVUlRTNWxlemdQT3pTV3BV?=
 =?utf-8?B?cDc3YTRENndkRzljWDZsOEhWMlV0dzlLUEhaeldBdHhxK0pEeFhLZ1lZaUtj?=
 =?utf-8?B?Qzk2Qk5tN1ZLekFFOEhMSmtrSktZUnJhczNCek9rNzFzS2V6UUN5VWdPVTd0?=
 =?utf-8?B?U1QxZUxleGd2am9OdHNIVlpPSkFNaWpKeGxUVUQyUFovb3pWdzMrVlZhbkN1?=
 =?utf-8?B?Um4rY3g0WU1XZHBXQVQ0eld2RVB0YmVKMFMrWlg1SStFTG02WGUxNUl0VHJi?=
 =?utf-8?B?RmJxSlRaN1VoS09aUkd2NlZqamJkMkpyM3RZcnJOcDVITE9FVG1Db3EyM0NE?=
 =?utf-8?Q?q4nc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8608f3b1-f8da-420f-aa09-08dc57d8ed1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 14:33:58.2285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YchmN+hJz5vF5faADrV2pG/TArcMpQanzX2HaHQPHLH9FHTo2VkPRwHrb4hQsOTddkRGEiYxgB1VIfv8MVNiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
X-Proofpoint-GUID: vMZZEwd1lqJqxfv7oXW-uB-P_SmMsACd
X-Proofpoint-ORIG-GUID: oa8ZXNzBaEais9VM3PPATRN4nzkzsi18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_12,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=600 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 14:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198014

WWVzLCBvZiBjb3Vyc2UuDQpJJ3ZlIGJyaWVmbHkgY2hlY2tlZCBhbGwgdGhlc2UgQ1ZFLTIwMTkt
eHh4IGxpbmtzLCB0aGV5IGhhdmUgYWxsIGJlZW4gZml4ZWQuDQpJJ2xsIHNlbmQgb3V0IGEgcGF0
Y2guDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2Vu
dDogTW9uZGF5LCBBcHJpbCA4LCAyMDI0IDc6NTcgUE0NClRvOiBTdGV2ZSBTYWtvbWFuIDxzdGV2
ZUBzYWtvbWFuLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7
IHlvY3RvLXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCkNjOiBDaGVuLCBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBPRS1jb3JlIENWRSBt
ZXRyaWNzIGZvciBtYXN0ZXIgb24gU3VuIDA3IEFwciAyMDI0IDAxOjAwOjAxIEFNIEhTVA0KDQpP
biBTdW4sIDIwMjQtMDQtMDcgYXQgMDE6MTkgLTEwMDAsIFN0ZXZlIFNha29tYW4gd3JvdGU6DQo+
IEJyYW5jaDogbWFzdGVyDQo+IA0KPiBOZXcgdGhpcyB3ZWVrOiAyMSBDVkVzDQo+IENWRS0yMDE0
LTQ4NTkgKENWU1MzOiA2LjggTUVESVVNKTogb3ZtZjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6Ly93
ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDE0LTQ4NTnCoCoN
Cj4gQ1ZFLTIwMTQtNDg2MCAoQ1ZTUzM6IDYuOCBNRURJVU0pOiBvdm1mOm92bWYtbmF0aXZlIA0K
PiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIw
MTQtNDg2MMKgKg0KDQpRaSBzZW50IGEgcGF0Y2ggZm9yIHRoaXMsIHRoYW5rcy4NCg0KPiBDVkUt
MjAxOS0xNDU1MyAoQ1ZTUzM6IDQuOSBNRURJVU0pOiBvdm1mOm92bWYtbmF0aXZlIA0KPiBodHRw
czovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMTktMTQ1
NTPCoCoNCj4gQ1ZFLTIwMTktMTQ1NTkgKENWU1MzOiA3LjUgSElHSCk6IG92bWY6b3ZtZi1uYXRp
dmUgDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAxOS0xNDU1OcKgKg0KPiBDVkUtMjAxOS0xNDU2MiAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBv
dm1mOm92bWYtbmF0aXZlIA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2Rl
dGFpbD92dWxuSWQ9Q1ZFLTIwMTktMTQ1NjLCoCoNCj4gQ1ZFLTIwMTktMTQ1NjMgKENWU1MzOiA3
LjggSElHSCk6IG92bWY6b3ZtZi1uYXRpdmUgDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxOS0xNDU2M8KgKg0KPiBDVkUtMjAxOS0xNDU3
NSAoQ1ZTUzM6IDcuOCBISUdIKTogb3ZtZjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6Ly93ZWIubnZk
Lm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDE5LTE0NTc1wqAqDQo+IENW
RS0yMDE5LTE0NTg2IChDVlNTMzogOC4wIEhJR0gpOiBvdm1mOm92bWYtbmF0aXZlIA0KPiBodHRw
czovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMTktMTQ1
ODbCoCoNCj4gQ1ZFLTIwMTktMTQ1ODcgKENWU1MzOiA2LjUgTUVESVVNKTogb3ZtZjpvdm1mLW5h
dGl2ZSANCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklk
PUNWRS0yMDE5LTE0NTg3wqAqDQoNCkkgdGhpbmsgd2Ugd2lsbCBuZWVkIGEgcGF0Y2ggZm9yIHRo
ZXNlIGZvciBub3cgYXMgdGhlIENQRSBlbnRyaWVzIGFyZSBtaXNzaW5nIGluIE5WRC4gV291bGQg
eW91IGJlIGFibGUgdG8gaGVscCB0aGVyZSBwbGVhc2UgUWk/DQoNCj4gQ1ZFLTIwMjItMzY3NjMg
KENWU1MzOiA3LjggSElHSCk6IG92bWY6b3ZtZi1uYXRpdmUgDQo+IGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zNjc2M8KgKg0KPiBDVkUt
MjAyMi0zNjc2NCAoQ1ZTUzM6IDcuOCBISUdIKTogb3ZtZjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6
Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTM2NzY0
wqAqDQo+IENWRS0yMDIyLTM2NzY1IChDVlNTMzogNy44IEhJR0gpOiBvdm1mOm92bWYtbmF0aXZl
IA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjItMzY3NjXCoCoNCj4gQ1ZFLTIwMjMtNDUyMjkgKENWU1MzOiA2LjUgTUVESVVNKTogb3Zt
Zjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRh
aWw/dnVsbklkPUNWRS0yMDIzLTQ1MjI5wqAqDQo+IENWRS0yMDIzLTQ1MjMwIChDVlNTMzogOC44
IEhJR0gpOiBvdm1mOm92bWYtbmF0aXZlIA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNDUyMzDCoCoNCj4gQ1ZFLTIwMjMtNDUyMzEg
KENWU1MzOiA2LjUgTUVESVVNKTogb3ZtZjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6Ly93ZWIubnZk
Lm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTQ1MjMxwqAqDQo+IENW
RS0yMDIzLTQ1MjMyIChDVlNTMzogNy41IEhJR0gpOiBvdm1mOm92bWYtbmF0aXZlIA0KPiBodHRw
czovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNDUy
MzLCoCoNCj4gQ1ZFLTIwMjMtNDUyMzMgKENWU1MzOiA3LjUgSElHSCk6IG92bWY6b3ZtZi1uYXRp
dmUgDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyMy00NTIzM8KgKg0KPiBDVkUtMjAyMy00NTIzNCAoQ1ZTUzM6IDguOCBISUdIKTogb3Zt
Zjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRh
aWw/dnVsbklkPUNWRS0yMDIzLTQ1MjM0wqAqDQo+IENWRS0yMDIzLTQ1MjM1IChDVlNTMzogOC44
IEhJR0gpOiBvdm1mOm92bWYtbmF0aXZlIA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNDUyMzXCoCoNCj4gQ1ZFLTIwMjMtNDUyMzYg
KENWU1MzOiA3LjUgSElHSCk6IG92bWY6b3ZtZi1uYXRpdmUgDQo+IGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy00NTIzNsKgKg0KPiBDVkUt
MjAyMy00NTIzNyAoQ1ZTUzM6IDcuNSBISUdIKTogb3ZtZjpvdm1mLW5hdGl2ZSANCj4gaHR0cHM6
Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTQ1MjM3
wqAqDQoNClRoZXNlIGFyZSBnZW51aW5lIGlzc3VlcyBhbmQgSSd2ZSBtZXJnZWQgYW4gdXBncmFk
ZSB0byBhZGRyZXNzIHRoZW0uDQoNCkNoZWVycywNCg0KUmljaGFyZA0K

