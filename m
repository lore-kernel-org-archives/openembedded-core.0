Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E42CC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 09:39:57 +0000 (UTC)
Received: from mx0a-006e0602.pphosted.com (mx0a-006e0602.pphosted.com [148.163.144.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54830.1790588393729813055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 02:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=mg6E/Ug0;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=F96Aeavp;
 spf=pass (domain: jp.honda, ip: 148.163.144.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469175.ppops.net [127.0.0.1])
	by mx0a-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9JBQA3771645;
	Mon, 28 Sep 2026 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=0w7UNnaZ1b2FYFYskguJsgudlvxJlrGvKGAieoeDxo
	s=; b=mg6E/Ug0EUk8NTkpncf3iVJ0WgywhPFKeAlFNBQm5SwnDwdQjyfIB55Ff4
	4tZ/VcUpX64rWHvVqJGrO0grP7c1Ffe8d+2lezoHxuz6OshOBLTfi/A9kMqn0ttu
	nZIM8J8VJIUTmO+/eXnqt5mGvHfqq4hTWyF9swwbGjIPfx3FKAdQiITaOIId0wtA
	kvU3zM0Ih+dXHsT/K2USoZDCcmIFB0yqZTjPat+f1SfW9xGubtOaGDgTcrdCqu28
	ux60icTJxmZhsix7y9hVX651d2J1f2JquQbU2ZHf3iqsR8DfPpLjY+vUW4TynY5h
	xa5YjOoWqV7xmOcP4W/oVyWRlLFA==
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	by mx0a-006e0602.pphosted.com (PPS) with ESMTPS id 4gymb5g7am-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 09:39:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLMcHsc7y/R/K2v/OlaBgyiOJasWi0ADYzI1iSFEixX+vdaYBk2tJDA8Mss8WLjUW6NtWJ7JDAfjp3P3ULOGRGgWzB7Ze0pb456uxFasJTsdxGbxDGMz/XDTL4eU/r6NClePaVpmECrHODiNYGlh8Wf5bJ4f9vqbCTzHMRt/PkVFP+2zhNFhqcWI2IhXUqxiIRJpL69KLtIV159ohw9W6PZ8jp2HE6hS7LaMEbTzcczkCWQFWCoL7IaE9G5nSTYON1N5oep4KR1gqDbhjM50kHPs/Zof/TTUD9hEAkRZbmk83Y7c4gHq98xpFKGXMx9HuYi++h8ymSsEKUq4RW81cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w7UNnaZ1b2FYFYskguJsgudlvxJlrGvKGAieoeDxos=;
 b=iR+qOhsmMcMSHihDlf1CRGknY4CJvpwI8ZO7laisrmx/0Sv7tsGT0cG8SELhfLKErev7VtzXvBMxCo5lLsFIzaABZa+1BhKDLDrPR4YIDq1CTY+alfmhzoTel6/8tnHRBGa5JkDRPb9fWhN79v34ia7o7BphSeg7hMfCABR96RwfwGMvqdec7Cpt2L7QEShSFsvkCSSaA7BOicsXyQOAMdKthlv9dGdkCKznfh0We7nyTit1cMJwYakqeOeQqW6rjHBg+rogA+LG6y2qPv/5fdWgp3AyFky5J1g3T3jqTeBClBATz1dXHBn28k1ovhDp8YCXytXD+A3xIa0JZpuphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jp.honda; dmarc=pass action=none header.from=jp.honda;
 dkim=pass header.d=jp.honda; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w7UNnaZ1b2FYFYskguJsgudlvxJlrGvKGAieoeDxos=;
 b=F96Aeavp/EN9BdH1zxEsDgkBkDEGUwBvCsygHys0HnYJuA460DnZWr6VZhK2Uf/UStRupiRbUMnfW2s7W7lC7fcEVKHqUi14Urm8tmH7d1ElRHBkESw/Zvu0YduzhV3OUEAAJdno1kB+15KKxq2tSLjCRSAae/eZG3oh0cogWJztPo1eCK5m6KSsbi5u5QLfibCdk/Qrlndb9PKmSHR54H511UA4B6z6jcRKPdmyZfZ0/cP/TwNoYPPaq2hKujUUAbRzNPaCJn4Zxsxngozrw87e5kQr2jwYu/tA/37R2gv75hphUITZgWAZLPazBJGT9jP5zedmnP2QFHGwLrI5GQ==
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:108::13)
 by TY7P301MB108143.JPNP301.PROD.OUTLOOK.COM (2603:1096:403:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:39:41 +0000
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608]) by TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:39:41 +0000
From: =?utf-8?B?S0FaVVlPU0hJIEFLSVlBTUEgKOeni+WxsSDlkozmhbYp?=
	<kazuyoshi_akiyama@jp.honda>
To: Benjamin Robin <benjamin.robin@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Yoann Congal
	<yoann.congal@smile.fr>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: RE: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
Thread-Topic: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
Thread-Index: AQHdRlx6LUwGc91iVUmijr+tpLilcLbgo60AgAMeO4CAAAesIA==
Date: Mon, 28 Sep 2026 09:39:41 +0000
Message-ID: 
 <TYYP301MB11583CEAF49F1D6ABB33F54EEB8D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
 <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr> <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
In-Reply-To: <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jp.honda;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYP301MB1158:EE_|TY7P301MB108143:EE_
x-ms-office365-filtering-correlation-id: 97490100-529f-44e0-a5dd-08df1d446be9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|4143699003|10067099003|11063799006|56012099006|5023799004|18002099003|22082099003|3023799007|4133799003;
x-microsoft-antispam-message-info: 
 TPTFBBB0D6roDITZz6M4HZIUcII3SVOSCm6zdYPbK6SwVOCaiOFM07MHXLieYav2wL4OpRCPwiRuYKgzwC6atzDuaVJex/qiLMdeCU/gby1svybzSd+54i5e2PcWMjg9I8pMCqmcSHjyHhEyFVpr+sghsJFt1QRCq8DvIIwaAiqfZL+h1Iuv1EdomUcUv9GXpblWbNOUBy9Hmf2GQyTUUj8ZF+v/30zgfJc5CLLmOFogjiHfTnqsiwJdbdFucWV3+3WAdrrmaKbZNsNNx6+KfMmRFFdyWWHiCOIhhlKwg4mS183JuUi4Vf93ZA5Y9Kpb2PayY+8SarzocmdLrVVDFTLjEcSa6/k5LB/cbVM1VC6UUm/lfBRjNkBqbwgq4znVjMFYEaYyMVXOJKiE1A7BQyY55n8cRt4g3eG9MNQvCYMNndeYoyx2RFDQUkJIwG+nnBvVrb9bOEQqitPidrXwdp0YFB58F6lTgFsI4OHg3/1e5JEEhOhfKARcpGuhk1No6mIVANxL95L5Cz6lBRezCmo2Nm+blBIEzf7x6l0SIe8AqnxMWqqe/ElmwvV/h+KQ1WBerN5umgiT6SGGjP70E3/BIvh3zD68/6OLluZ0243Tywui4kl1HU5/k8mXDN1RlByEkQ+oauIrg8AfXe0R/xG6xSiQB7YalZ87hyfksRM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NlU3R1pOL3N0RzNvWERqWFpLenNQcUNMWlhwcEl5c2V1cGNwc2ErT1dlTzJZ?=
 =?utf-8?B?U0NHZFQ1SWREcEwwZ0hWYmg4NmtMOTczRU84OXlJTDZvWlBXU1FCWmJuNEdn?=
 =?utf-8?B?SXU2VCtpaWVOK3RINy9hQm9ZaG1UOEY1SHJmVldIekRyZ0I4NHJVVkgwMXM5?=
 =?utf-8?B?a1pSdUI3NjNrOWwvU1gxdUR2N0VEbkR4QTcvQlhEaFFUOXlCUHAvSVY0WDlq?=
 =?utf-8?B?ZWxNT1RLQWxQM1N4VGIzdUdYOW5sWmpCZ3pDV2s2NUFoVHBZT0FGOEhQV0M2?=
 =?utf-8?B?Skc5Q0JqeGI4T21ZcitSSHZJcnc5cUN1NFhrTjgvUmxGaEg3UEJlMTFkYXUw?=
 =?utf-8?B?QkU4MFdqZExyWFpwdWx5dmlTanVTelN6YTJkejI2TFREeW9Fakd5NkJKOHdi?=
 =?utf-8?B?bWV4czlJSHpYVFRLZDlicGhKaVIxcUZKeU5xcjVEYi8zQkcvRW1KQTg2aSt4?=
 =?utf-8?B?TzZEZkRJQVVaZzdYUndXOGR0WWNIdnlYc1Q0VnU4SUpmbkJpTzFVRFVxOUNp?=
 =?utf-8?B?OVJ2NHhhZ3I1cVNUQzRvZE9SQ1pEN1NvTUNwdzZLSDRTZFNRejhDbGpVMG02?=
 =?utf-8?B?TnVFbEZ3S3FOQSsrc3d4c0NpeHBwVlllVURHMWwzbUpuV0UyMEFuQktWVEhW?=
 =?utf-8?B?MGRJMnpOSWUwY09XZXVwYnF0dHF4Zm1TSWhoamlnNnpWbEh0QVREbWxyOWNC?=
 =?utf-8?B?TnR2a3EwMnU0ZjJqdmxoMnpLOERnZnB4TzFKaEJBMDc4UXZQVzhETkVRM090?=
 =?utf-8?B?dzhHMTIwUjhDVjE1WVYxZ0lsTEM5MFYzNXNjTkdpcVJhaDFXb0FGVHBPZzlW?=
 =?utf-8?B?NGN1R3VxWWtHNE9ZSVhJcXBoeWpCU2ZWaWJXZ0VhODhhWnBwbnVPT3BUTmxk?=
 =?utf-8?B?bFo3dk5YekMzVTEwVDVRK3pBcitBQ3hJNjRDVTRtYXlDcXR2NjZSRFBWUGRp?=
 =?utf-8?B?anVHZklQekJRVWJkRXFmOHZ6ZFB4V01uUXpOU1psNjZzNEtsQ1ZHMCt2eWtr?=
 =?utf-8?B?NndTRUZSRkEvY1NEby8yOHhaWHgvV0VYdHZoeVVMLzFGeHNaVjMyc0czTXA1?=
 =?utf-8?B?R2RtRGFQS09Sajl4VVR2YjlJdm9JbGNHNERVcGZHZGlnTnduZnNnRnJDWnJ0?=
 =?utf-8?B?cEZySktGUXVUQzFQMGNnK3MwZm5JQTB0bmNJQlRrTk9PWmxPWFI0djZpUkJG?=
 =?utf-8?B?a0xReGUwV2ljQ1Y4U2hZRnNJNXFRdUpNdk1OL2tNeS9FQytPZ29KYWxMdUY2?=
 =?utf-8?B?VVNnRlZxWGxKSXk2TThWMEllbE1tODFwOExvUGg5bVJqWjREZ2x6ODFIOWc0?=
 =?utf-8?B?am55VXJNbHJDQjNQYTFndnBoeERrOXUvTFNtaFRGNWxiRENuMm9scU43NVUy?=
 =?utf-8?B?SGdwZjM2QkhCOFBTOWZHa2dkUjYrOTFjOHhhRDkvMDRpeWpWQUttdXN0S0ZV?=
 =?utf-8?B?RlNINWlEZUN6eEdzdWRWUUdFNnJuSTBjeDhNaTJKK09WcUVmMTZnWkFSRTFl?=
 =?utf-8?B?Vjh3ejdxZGp0c3hKMFJyVGNoTHQ1bjRXNWdzYXdta21jcC84U1dqSktoTEJI?=
 =?utf-8?B?UkNjem8rMGw4bEtadmxWMUczZ1VCNkVkaW5EeElwMUQxUE1tdUpMeTlpdW1Y?=
 =?utf-8?B?QTVVK3VUc0pqSjNQMTZUd0lQcC9ibFUwTjhvbGRMb0k5dXVjMTc2eko2WFlm?=
 =?utf-8?B?QWV1SlIyZXBFNHI3Y0JKTmNRbzZUcFlyNVlCZkpFUnJ1TzJQTVVoaHVQRyti?=
 =?utf-8?B?UThYVDNJckk5Q29BQ1FKOEV4dk96WTZ6QlgvUGtCZ0dvUTF6c2VOOHpGY1NU?=
 =?utf-8?B?UUhXdDZPQk01LzdSc0pxQVNEd2xWc2tiY1VGbmpOa1JSelJTY25sOEo3cHRu?=
 =?utf-8?B?V3dJMDNYMVpndmZWNVZWMll5S09Ic0lPWWcyalNHMWl5Y09EOXNCU2V3RDBJ?=
 =?utf-8?B?YkhMOWFDYTJBTXd4K01VTGJYQ25aNkJtS2hLdGJwWGVKYk5UZ2FuNkgwNDRB?=
 =?utf-8?B?dUNQVVp3TXpuamFPVkZVL3N2QzV1ODNmWjgyVlVSY09zUlFuaE5ISXZLY0xq?=
 =?utf-8?B?anBIYkV1eDNVeEtpUHE3c0dwdktEL1BLc3AreldENFVzNmxaMU9ZaUs4VWJx?=
 =?utf-8?B?eGQyOWVjT0VHRjJCRlZOVHNSVFBDcmNGeGZQQWdmN2I3N3VIV1ZYbm9nbDJn?=
 =?utf-8?B?cS9JdC9tMFg0MjRIcGVsOWhYV1pSWmhFOHNGV05IdXBTcGtrUXpPajF4Y2lQ?=
 =?utf-8?B?TDZ2UkRzeXoveitYWFhqOXVkSUdtRTVNM0U1U0FqZWhQQ0tHNzNwWFp1WFhR?=
 =?utf-8?B?SjVyVXd5MUZNeTM0WEwzT0dIZzlGanEvZ2dXZFNJb0tIL2pDaHhIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fOZDxuV7Djglcp1OGMzHRnBUOdq71VEHa5VhQ4hKuKblSi4XhgVxMkWbGcSL1wMXuZtOuaDPGKRQbuA2kWRPSdsvRJTIleefq14fC9KE+vdM4SCV0NSWTxcX1wLBCVL/Ca3m88CT1bump1J1SvlKSOnSO0XL15jI1PCcCeDbrsfihHZw9kpn21S5T3qr8VPyJ090Um5auGXoUKUDKXesqCC5L7LD/sO64QkntDwvZybmk48RRkjoux5LbK5XxVqUIjSUxM1Q05YwD9pm6EPrAK2xgk19FAjIocSPo5WuS5f2mprl43Cl49Ezbf5/o3912sJkEu67hzclYxCu4OzqWw==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97490100-529f-44e0-a5dd-08df1d446be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 09:39:41.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdXLLgIxv0NX79zSYt+pvx9WuvlODtXoBoMl97XW2s7t8yCr8Y5/oaapBliT5HojcyxciNMNZsRAeaCXPtV/0JF31fkzlE+GDbk5+/wPpuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P301MB108143
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 09:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246744

VGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLCBZb2FubiBhbmQgQmVuamFtaW4uDQoNCkkgYWdy
ZWUgd2l0aCBCZW5qYW1pbi4NClRoaXMgc2VyaWVzIGRvZXMgaW50cm9kdWNlIGEgdmlzaWJsZSBj
aGFuZ2UgdGhhdCB0aGUgc291cmNlIHBhdGggaW4gU1BEWCB3aWxsIGJlIGNoYW5nZWQgZnJvbSBg
c291cmNlcy9YWFgvWVlZLmNgIHRvIGBYWFgvWVlZLmNgLg0KSG93ZXZlciwgdGhlIGRlc2lnbiBj
aGFuZ2Ugb2YgdGhlIHBhdGNoIDAwMDIgaXMgcmVhc29uYWJsZSwgYW5kIEkgYmVsaWV2ZSBpdCBp
cyBiZXR0ZXIgdG8gYXZvaWQgY29kZSBkaXZlcmdlbmNlIHdoZW5ldmVyIHBvc3NpYmxlLg0KVGhl
IGltcGFjdCBvZiB0aGlzIGNoYW5nZSBpcyB2ZXJ5IHNtYWxsLg0KSSBjb3VsZCB3cml0ZSBhIHBh
dGNoIHRvIHByZXNlcnZlIHRoZSBgc291cmNlcy9gIHByZWZpeCwgYnV0IGV2ZW4gdGhlbiwgd3J5
bm9zZSB1c2VycyB3b3VsZCBzdGlsbCBuZWVkIHRvIGFkYXB0IHRvIHRoaXMgY2hhbmdlIGluIHRo
ZSBuZXh0IExUUyByZWxlYXNlLg0KRnVydGhlcm1vcmUsIGlmIEkgd3JpdGUgc3VjaCBhIHBhdGNo
LCB0aGUgcGF0aCBjaGFuZ2Ugd291bGQgb2NjdXIgc2lsZW50bHkgaW4gdGhlIG5leHQgTFRTIHJl
bGVhc2UsIHdpdGhvdXQgc3VmZmljaWVudCBjb250ZXh0IHRvIGRvY3VtZW50IGl0IHByb3Blcmx5
IGluIHRoZSByZWxlYXNlIG5vdGVzLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogQmVuamFtaW4gUm9iaW4gPGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPiANClNlbnQ6IE1v
bmRheSwgU2VwdGVtYmVyIDI4LCAyMDI2IDU6NTcgUE0NClRvOiBLQVpVWU9TSEkgQUtJWUFNQSAo
56eL5bGxIOWSjOaFtikgPGthenV5b3NoaV9ha2l5YW1hQGpwLmhvbmRhPjsgb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxA
c21pbGUuZnI+DQpDYzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+OyBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBi
b290bGluLmNvbT4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHdyeW5vc2UgMC80XSBz
cGR4OiBmaXggdGhlIGNvbXBpbGVkLXNvdXJjZXMgZmlsdGVyDQoNCk9uIFNhdHVyZGF5LCBTZXB0
ZW1iZXIgMjYsIDIwMjYgYXQgMTE6MTnigK9BTSwgWW9hbm4gQ29uZ2FsIHdyb3RlOg0KPiBPbiBU
aHUgU2VwIDE3LCAyMDI2IGF0IDY6MjQgQU0gQ0VTVCwgS0FaVVlPU0hJIEFLSVlBTUEgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gU1BEWF9JTkNMVURFX0NPTVBJTEVEX1NP
VVJDRVMgaXMgbWVhbnQgdG8gZmlsdGVyIGFsbCBzb3VyY2UgZmlsZXMgDQo+ID4gZG93biB0byBv
bmx5IHRoZSBvbmVzIHRoYXQgd2VyZSBjb21waWxlZCBiZWZvcmUgYWRkaW5nIHRoZW0gdG8gdGhl
IA0KPiA+IFNCT00sIGJ1dCBvbiB3cnlub3NlIGl0IGRvZXNuJ3Qgd29yay4NCj4gPiBhZGRfcGFj
a2FnZV9maWxlcygpIGlzIHdoYXQgcGlja3Mgd2hpY2ggZmlsZXMgZ28gaW50byB0aGUgU0JPTS4N
Cj4gPiBJdCB3YWxrcyAke1NQRFhXT1JLfSBpdHNlbGYgdG8gZ2V0IGZpbGUgcGF0aHMsIHRoZW4g
a2VlcHMgb25seSB0aGUgDQo+ID4gb25lcyB0aGF0IG1hdGNoIHRoZSBsaXN0IG9mIGNvbXBpbGVk
IHNvdXJjZXMgcmV0dXJuZWQgYnkgDQo+ID4gZ2V0X2NvbXBpbGVkX3NvdXJjZXMoKS4NCj4gPiBn
ZXRfY29tcGlsZWRfc291cmNlcygpIGp1c3QgcmV0dXJucyB3aGF0IHNhdmVfZGVidWdzb3VyY2Vz
X2luZm8oKSANCj4gPiBzdG9yZWQsIGFuZCB0aGF0IGRhdGEgdXNlcyBwYXRocyByb290ZWQgYXQg
JHtUQVJHRVRfREJHU1JDX0RJUn0gKD0gDQo+ID4gL3Vzci9zcmMvZGVidWcvJHtQTn0vJHtQVn0p
LCBub3QgdGhlICR7U1BEWFdPUkt9LXJvb3RlZCBwYXRocw0KPiA+IGFkZF9wYWNrYWdlX2ZpbGVz
KCkgY29tcGFyZXMgYWdhaW5zdC4NCj4gPiBTbyB0aGUgbGlzdCBnZXRfY29tcGlsZWRfc291cmNl
cygpIHJldHVybnMgbmV2ZXIgbWF0Y2hlcyB3aGF0IA0KPiA+IGFkZF9wYWNrYWdlX2ZpbGVzKCkg
aXMgY29tcGFyaW5nLCBhbmQgYWxtb3N0IGV2ZXJ5IGZpbGUgZW5kcyB1cCANCj4gPiBtYXJrZWQg
YXMgbm90IGNvbXBpbGVkLg0KPiA+IFRoaXMgaGFwcGVucyBmb3IgZXZlcnkgcmVjaXBlIGV4Y2Vw
dCB0aGUga2VybmVsLCB3aGljaCBoYXMgaXRzIG93biANCj4gPiBzcGVjaWFsLWNhc2VkIHBhdGgu
DQo+ID4NCj4gPiBUaGlzIGlzbid0IGp1c3QgYSBtYXR0ZXIgb2YgdGhlIFNCT00gbWlzc2luZyB0
aGUgcmlnaHQgZmlsZXMuDQo+ID4gc2JvbS1jdmUtY2hlY2sgdXNlcyB0aGUgc2FtZSBtYXRjaCBy
ZXN1bHQgdG8gZGVjaWRlIHdoZXRoZXIgYSANCj4gPiB2dWxuZXJhYmxlIGZpbGUgd2FzIGFjdHVh
bGx5IGJ1aWx0LCBmb3IgaXRzIHZ1bG5lcmFiaWxpdHkgdHJpYWdlLg0KPiA+IElmIHRoZSBtYXRj
aCBjb3VudCBpcyBhbHdheXMgemVybywgdGhhdCB0cmlhZ2UgZG9lc24ndCB3b3JrIGVpdGhlci4N
Cj4gPiBPbiB5b2N0by02LjAuMiB3ZSBjb25maXJtZWQgdGhlIG1pc2p1ZGdtZW50IGFmZmVjdHMg
Y3BpbyBhbmQgcGVybC4NCj4gPg0KPiA+IG1hc3RlciBhbHJlYWR5IGhhcyB0aGlzIGZpeGVkLA0K
PiA+IGFuZCB0aGlzIGJhY2twb3J0IGJyaW5ncyB0aGF0IGZpeCB0byB3cnlub3NlLg0KPiA+IGI1
NjdjMmYwZDkgaXMgdGhlIGNvbW1pdCB0aGF0IGZpeGVzIGl0Lg0KPiA+IEV2ZXJ5dGhpbmcgZWxz
ZSBpbiB0aGUgc2VyaWVzIGlzIGEgcHJlcmVxdWlzaXRlIGZvciB0aGF0IHBhdGNoLg0KPiA+IEJh
Y2twb3J0aW5nIGI1NjdjMmYwZDkgYWxvbmcgd2l0aCBpdHMgcHJlcmVxdWlzaXRlcyBicmluZ3Mg
d3J5bm9zZSdzIA0KPiA+IGJlaGF2aW9yIGluIGxpbmUgd2l0aCBtYXN0ZXIuDQo+ID4gV2l0aCB0
aGlzLCBjb21waWxlZCBzb3VyY2VzIGdldCBjb3VudGVkIGNvcnJlY3RseSwgYW5kIA0KPiA+IHNi
b20tY3ZlLWNoZWNrJ3MgdHJpYWdlIHdvcmtzIGNvcnJlY3RseSB0b28uDQo+ID4NCj4gPiBPbiB3
cnlub3NlIChnZW5lcmljeDg2LTY0LCBjb3JlLWltYWdlLWZ1bGwtY21kbGluZSksIHRoZSBtYXRj
aCByYXRlIA0KPiA+IGdvZXMgZnJvbSBlZmZlY3RpdmVseSB6ZXJvIHRvIDkzLjklLg0KPiA+DQo+
ID4gT25lIHRoaW5nIGNoYW5nZXMuDQo+ID4gV2hhdCB0aGUgU0JPTSByZWNvcmRzIGFzIGEgc291
cmNlIGZpbGUgbmFtZSBjaGFuZ2VzIHRvby4NCj4gPiBhYTQ0YTBmMGViIHJlLXVucGFja3MgdW5k
ZXIgVU5QQUNLRElSIGluc3RlYWQgb2YgV09SS0RJUiwgc28gYSANCj4gPiByZWNvcmRlZCBzb3Vy
Y2UgZmlsZSBuYW1lIGNoYW5nZXMgKGUuZy4gc291cmNlcy9hY2wtMi4zLjIvLi4uIA0KPiA+IGJl
Y29tZXMgYWNsLTIuMy4yLy4uLikuDQo+ID4gVGhpcyBpcyBhIGNoYW5nZSB0byBTQk9NIG1ldGFk
YXRhIG9ubHkuDQo+ID4gVGhlIGFjdHVhbCBidWlsZCBvdXRwdXQgaXMgdW5hZmZlY3RlZC4NCj4g
PiBBbnlvbmUgZGlmZmluZyBTQk9NcyBhY3Jvc3MgTFRTIHBvaW50IHJlbGVhc2VzIHdpbGwgc2Vl
IGl0Lg0KPiANCj4gSGVsbG8sDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBzZXJpZXMsIHRoaXMgc291
bmRzIGxpa2UgYSB3b3J0aHkgZml4Lg0KPiBCdXQsIHRoaXMgU0JPTSBjaGFuZ2UgaXMgYSBiaXQg
bW9yZSBpbnRydXNpdmUgdGhhbiBJJ20gY29uZm9ydGFibGUgDQo+IHdpdGguLi4gVGhpcyB3aWxs
IGNyZWF0ZSBhIGxvdCBvZiBub2lzZSBmb3IgdXNlcnMgdGhhdCBwcmVjaXNlbHkgdHJhY2sgDQo+
IHRoZWlyIFNCT01zLg0KDQpIZWxsbyBZb2FubiwNCg0KPiBDYW4gd2UgZG8gdGhlIGZpeCB3aXRo
b3V0IHRoaXMgY2hhbmdlPw0KDQpUZWNobmljYWxseSwgd2UgY291bGQgZG8gaXQuIEJ1dCBpdCB3
b3VsZG4ndCBiZSBleGFjdGx5IHRoZSBzYW1lIHNlcmllcywgd2hpY2ggSSBkb24ndCByZWFsbHkg
bGlrZSwgYW5kIHRoZSBjb2RlIHdpbGwgZGl2ZXJnZS4NCkZvciBpbmZvcm1hdGlvbiBJIGNvdWxk
IGRldmVsb3AgYSBzb2x1dGlvbiBhZnRlciBFTENFIGNhcGFibGUgb2YgZ2VuZXJhdGluZyBhIHNp
bWlsYXIgU0JPTSBpZiBLYXp1eW9zaGkgZG9lc24ndCBmZWVsIGNvbWZvcnRhYmxlIGRvaW5nIGl0
Lg0KDQoNCi0tDQpCZW5qYW1pbiBSb2JpbiwgQm9vdGxpbg0KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYm9v
dGxpbi5jb21fXzshIUtFaVFsdTFCMzBCdCEzSUtYQlJ0QUdwazFMY29hS3RQX3ExcE05MVdQT0lJ
VmEtMnFJQUpoenZuclNDbVViTkRvV251NlJVLVRhUE5oaURxMG9sOG1ScFVpdnhPTE1pSEhaNmNs
U3I3eml2OEZ2T3MkIA0KDQoNCg0K

