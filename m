Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F40C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 14:25:03 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web09.6236.1640096700994911691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 06:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=P3HAxnXW;
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLDp5Wt030524;
	Tue, 21 Dec 2021 15:24:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pp16032020;
 bh=DDhg413yg2SN3bESxXmUtCSdEmMYXyTv6pb/2mwuydk=;
 b=P3HAxnXWAPFLfndOi5bI6HOW5urjDhStRbbIXVVhntNr1KM5kCmqF3BA14WYseYENY/r
 gzbdIruM2PGuDZ2hw9zhq3LEn9JjZsvReEf46xQjvPXIYLPEAvU9QYV7Z9wXHRotzM22
 pTr9R8pwlcEhEsIunHmaY+FFsUsrrGPAbtBwLn0/ZtXEqs10JtR0ARCwfwNbKcsyiWUD
 9JiN04fkaBjM5pHCMNYXMkt9FpDEjr35tg9G/HzHPeBDfgB+6X1PAGvNpgkgbOuG0Izu
 ECFSaCE//OeGwaEs1ekf+Eff964OtV6paUI+gnMLY1tbGItq2DyiCQxMfgeC3rpmfUG5 cw==
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3d39wvm7bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 15:24:59 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPtpnPvK+SLMjd6Ocq1gcHfK3KDxr8bYg2GUFCTjj7nICvfyNQIfMVx9YdCLZm4lBfn5EmR2YLLLiNmBcy3lY/F8vUW2+c3/RZBNXV3Yi1O7qbXB9XPwbwUb/39HilODsyzGSFnTBmftMCobczsWLOILl+uQnoavRmYVJ+5y7t8tTBux19e8kcLZC6T8abxGqwjY/1AuSfWyrVWkjnnu1R7Pt+Z0Yg88bINFusaCEXe3aOx207KWwRB/p3h7hObqRFvwurh06NnQSRpZWFoTtKcpvr/QEjgRsb3pUUqcSWoqMwPEQ/5y6u4TK+7H8CABdIYa+Y181Jpn18J9SIaOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDhg413yg2SN3bESxXmUtCSdEmMYXyTv6pb/2mwuydk=;
 b=kuwnSXRlTNLLYarcMte5JH+mL+iXweixjBkNSTql6jvVkE556GChYkslXE7iXyGsZRoYGuGT5KVLnzu6g7t/nZgwRjyWQ67PIYXuCbhsutfLa2F3aOZkUrZ/kgH5Paa5udooM4KMCQtsePMRO+IOIwkeZvK91jcQp6LQvllCVC1CRbelWOWDZx4HJUoTP8sXESrQFGeSO7qK5Q0opwAHMjf1Nm1H/1TNObmoRM/k+3GAm3aIq1ZweHxkQGWuEHrs/2zsJRcVNWwLEBy1lJDeiNy/TQVkYOFVER7WDXQU1titT1zpFtFKjul56sMOG84YTp9nc2HiRbDz5/wH9A5eAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:41e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 14:24:57 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 14:24:57 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?=
	<ernst.sjostrand@lists.verisure.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH v3] dropbear: Fix CVE-2020-36254
Thread-Topic: [dunfell][PATCH v3] dropbear: Fix CVE-2020-36254
Thread-Index: AQHX9naHRBV9zE2jC0SE9lIalNTeLA==
Date: Tue, 21 Dec 2021 14:24:57 +0000
Message-ID: 
 <9b1ac8d4c0e4faefb2eb36cc9ccfe90f6373991c.camel@lists.verisure.com>
References: <16C2B9B88AD918F7.22520@lists.openembedded.org>
	 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
	 <AM9PR09MB4642921897485601CE80186EA87C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <c266b479d7567aabc0560d355ee407504d5ef62e.camel@lists.verisure.com>
	 <CAOSpxdYt44zpYMZYLWMhvVBNFUmtPangBO7YheCaScynM1RUvQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYt44zpYMZYLWMhvVBNFUmtPangBO7YheCaScynM1RUvQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fddae18-d69b-4980-ee32-08d9c48daa6c
x-ms-traffictypediagnostic: AM9PR10MB4959:EE_
x-microsoft-antispam-prvs: 
 <AM9PR10MB4959D69F386C2BD3951FCDE6CB7C9@AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gGsD6/ZlxSxNxrU5Nk0aFsKn0ekiPl+MXgJaApckRWa/dbtyYZYdYbL1TZAYUTdFDjS87uXrGTFYt0u9e5LGF8DLAa+7EczwmikqIf7so5L8mwlJhusLLl2cLnjE1UTAzP8dgmq/YzdpAAnXs2LzoH3gDxGmqHpWZ+4C8gmdOrj8d6f+ojz+K+wtet2XnKopvk0UCei+obOBVvxVIsgZdSgySQHhgq1BwKQ4CDAWoQWrg1y2ZUoMBtyIIgYbphBQzf5Cp2ZOMpS4wckUgmBGay/SOBdkxopB2TPWsKSEXG+F5wkWwPaT3VrZhM2YzNy5px7+toE40TP/N97kOGcxSZtOijF+T472uEJev7MPb2D787Odw9RpaWJXbhlK9+zjpLlK2no0uxxRXUk2Sn60s+nv20JBSs9xDwtSoQjFuJuXYKMLg3MkcVn4MnzcdmVBfJ2loHd72R4di0OYSuKoHAmxyb0B/OmZAPhrUdk3yS7X6NfNR2sxx8/CqtXg/OBOavBnnlG1zA0mQ//YRT89NUWNgeqNqLQlrCGAPrKYs8kBxyg7PKIis9QcduZc7kr7ZUVSyImSki5G8ahNvigAQuY6iR1ICnld5cEZ5kLcvwn/j0I4cxytVPfqA8x5KI1VbOWNkxQtzO7C9wsU44C1qs0bQaboeaqZsTkVQUv5adlyatnWmn3vadNJSAvMgh1lJpMIiwUj8IjMhWljyF4nuBQRViPhuXYmxJieq67KOQqScC0g5bHrm5pf5F+T7X8g2fi0w6McN7/pT0z8m7hNf/CPmYo0UsMdIqHM2/ZtMro=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2906002)(122000001)(38070700005)(4326008)(186003)(83380400001)(8936002)(966005)(8676002)(508600001)(2616005)(66574015)(85182001)(6512007)(6486002)(64756008)(66946007)(76116006)(5660300002)(66556008)(26005)(66476007)(91956017)(6916009)(86362001)(71200400001)(85202003)(66446008)(6506007)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZXpkRWdsajkwNUhDVitvQmZxaEo4bTlqSkZyejY4aHkwYmNRT2ZFQ2JPUTJP?=
 =?utf-8?B?MUVaTnIrMXFYMEhIVFIrNFRQNUhHbGplUFlYcGtVYmxsbDZSVldDMU5JNFUz?=
 =?utf-8?B?N1BpUG1TYnVMVkhWK2RFQ0FQUTV6SkdLRzdmOUtxWjh0SmF1NXVoQ2xwSm1B?=
 =?utf-8?B?bWlScWk3anFTNVdHRlhIeUUxTXZOSVVBV2piM3ZaRzN4UUkvbElQQ2hCVTVa?=
 =?utf-8?B?cWd5d0xGNmE2UlB0OU1WNEY3ZUdscjQyM3V0ZTBKRVJ4NC94dUtRdFVmRzVI?=
 =?utf-8?B?Z0xxM0VRY1ZLZFI0UDNqZE5BWG1Gcm56dEdSTXBPRlY2Yyt2Sm9zUVRFb2I5?=
 =?utf-8?B?TEs1dHhtcnV6MC9Fd1NSblViWFlWR2dGTlRMRGRKK0MwWndHSXl5ZVRGZy9x?=
 =?utf-8?B?VUkyaVBIWnpUR09rVmZHSXNQSDdVS09EaFVuejZVNEhGOHJSR29JV01Ld1la?=
 =?utf-8?B?RE5YRmdvcFVPNDhHSEkwSnM0eHR0WUovd1pBV3RyUHZpekpmQk1MVUxLWXpJ?=
 =?utf-8?B?UTFIN0VnN2lLakFHM3pTbDQ0d0Z0TFUrdU9PSS81UjZNd2l6aDB1bkJWZVlF?=
 =?utf-8?B?amtkVDlpRGNnMTh4ZDRtTzJ4K1lrcWdaaFFNaHFWbWRWS3ZpUjFxR2JvYW9R?=
 =?utf-8?B?aTJGSzhsZnEzdU9lQjYrTHJPNlBHYXlRaDVNaHNPa2EwWEw2Wm1sbWJLeTdx?=
 =?utf-8?B?aFFXTVFNTis2djJwMmlwMEtwRG1HbTNoVk1hMFpFMnJpQmFwYnVGUlFrcENX?=
 =?utf-8?B?RHc1blJERDc3N09VWldiWGtKa1VSNGd0RUJGRUkxeXBnampnUURpdGU2Tjk1?=
 =?utf-8?B?K0E0clF1dXlwU3E0THdkRWwzUXhjRnF0Vi9LZlIwek9iQkQxNlVuMXQyN2My?=
 =?utf-8?B?cjJuZFFRU1BQQmVOT1BSeE5Sc1JlU0JxZVg2SThqY20wR00zczRTTTVDellU?=
 =?utf-8?B?QWNQTlpFV1dEWmN6UWxPUTBIQlVnOGt2NHJFREdVcTlJb01uM2V1RHZ2bHpv?=
 =?utf-8?B?MU9ocitsQnpxcjZuTWtlajNYNTBBRkxHRVpwdGVpYk5wbHJKQ3BVWjU5endU?=
 =?utf-8?B?Y0JiZzNjT2Yxa1pXR0hKbXdpOFczVTVaa202bWYyUUQrZDFtYVdLd21yQWYz?=
 =?utf-8?B?OVhtVVluKytrSERCUDRxcEg5YjFvL25iT1JIWkZmN0MrRUdhTmhLVjBsM2lj?=
 =?utf-8?B?OHN5a2RNQ092SCtuT1p3WVVNdEt2OFJTWmFNbkRCUmlmc0ozNldYZFRoa0xP?=
 =?utf-8?B?cHVZSFlUVUVQYTk1Q3ExV0dQVHJvOTExUVk5cWVFbFRSVG5zYjkwTXFBS1pr?=
 =?utf-8?B?SzBOQ0hBL1pOMTE0T0pTMmxDVHRLb1ZqL2J0cnRzK3JxUUpuQUc5WkZVNEVH?=
 =?utf-8?B?TWh3bjBDa0d6WFZydFNvOHNxMnlQQ1RWOGVPcDNoMGlJbzVHUlFaelo4SEs5?=
 =?utf-8?B?WjdUQUZNcFhsYk9ycnIrSk1LZ2xvbU9LZHRHanRjc1hYdi9hWnJscXVjOFRH?=
 =?utf-8?B?bG1JZ3J1RHBkQVVLTGNTTUx2UTM3a0t4NTZjM1hlVEJOR1M2WnVXMjZKR3NJ?=
 =?utf-8?B?UkI4MUEydmNGY0tlQTVrbjhwNGNwM3NDL0Zybjk0SUJCT2U2eWN5OGFsdE9J?=
 =?utf-8?B?ZUR5ZE5QTUtSdTcxb3lmaGZzY2JqeUgza2s4RWlDcXNrNG5lOUV0NXhWTmVv?=
 =?utf-8?B?RjNuZUJ6eXBIQ2NnejJNWG44MDROTXpvdWZzMXkvRnIweHAzUmh1QnNKTzls?=
 =?utf-8?B?M2cvRSs5cTVrZkRrYmRFVUg3ODRGamt3emJiTnZBMWhrUmQrTWx1dXZvaGth?=
 =?utf-8?B?NkJLUXdVaVRaUTJZZ0ZpS3h4b0Fyd2MrSTFkTlVINGlHZmhZT3hNbG1LbWhV?=
 =?utf-8?B?UEJpdnF1S0hLc3N4Tk1zVG1CSnhVM1pLSld0Y1dSOWVOYWUrQ2JDV3lnb0Vh?=
 =?utf-8?B?M0FzdVlLOXp2RVJNQ1Q3K1cyT2dpRENXWHVrd21hSmpUOGFiZW9FdTZWODRR?=
 =?utf-8?B?bWhOQ1AvcGMySG16UVhQTXlFTkFYblYvNmdxUmgxbzVua0NHLzVaVTNHcVRp?=
 =?utf-8?B?WE5oYm5CcHZ4R25adFRVOEJIbExrTW9KNTJ1S1VPWVU5R0diMi9Eb21tYVBm?=
 =?utf-8?B?eUhnYk9xbDBOQUtDUE5ML3phWnM5dW0vczVlcnBNT1ozdkU5Q0JXWmNHWVU3?=
 =?utf-8?B?VW1YNjJWNVVnUlgzM3A5ekZFT1ZsMm9rUlhMN2t0SE9yY01QWXV2Z091NHp3?=
 =?utf-8?Q?X9zgKWhQmGZuwFCx2sXYxgurcb4xyY7iE5yEEK4y80=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B51005FCBACD84448716FFAB688816DA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fddae18-d69b-4980-ee32-08d9c48daa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 14:24:57.7553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 h7cmovEPsHJ/3NynRgsxWhAZJlD9PD9yR8J3xhmN2OL3/fPBX6knKgPeB/YXz0ku2T/D0c51WaU0o9O5tc1XRcg/0Pqkaz2257znGTzjtZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4959
X-Proofpoint-GUID: Azuh-pM1jal07N6kPi1aijZPV5fBaVZs
X-Proofpoint-ORIG-GUID: Azuh-pM1jal07N6kPi1aijZPV5fBaVZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 14:25:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159922

RHJvcGJlYXIgc2hhcmVzIGEgbG90IG9mIGNvZGUgd2l0aCBvdGhlciBTU0ggaW1wbGVtZW50YXRp
b25zLCBzbyB0aGlzIGlzDQphIHBvcnQgb2YgQ1ZFLTIwMTgtMjA2ODUgdG8gZHJvcGJlYXIgYnkg
dGhlIGRyb3BiZWFyIGRldmVsb3BlcnMuDQoNClJlZmVyZW5jZToNCmh0dHBzOi8vZ2l0aHViLmNv
bS9ta2ovZHJvcGJlYXIvY29tbWl0LzhmOGEzZGZmNzA1ZmFkNzc0YTEwODY0YTJlM2RiY2ZhOTc3
OWNlZmYNCg0KQ1ZFOiBDVkUtMjAyMC0zNjI1NA0KVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0K
DQpTaWduZWQtb2ZmLWJ5OiBFcm5zdCBTasO2c3RyYW5kIDxlcm5zdC5zam9zdHJhbmRAdmVyaXN1
cmUuY29tPg0KLS0tDQogbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jICAg
ICAgIHwgIDQgKystDQogLi4uL2Ryb3BiZWFyL2Ryb3BiZWFyL0NWRS0yMDIwLTM2MjU0LnBhdGNo
ICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci9DVkUtMjAyMC0zNjI1NC5wYXRjaA0KDQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jDQppbmRleCBkNDFlOGIzNmRjZC4uYjk0OWE5YTMz
NzIgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci5pbmMN
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLmluYw0KQEAgLTIyLDcg
KzIyLDkgQEAgU1JDX1VSSSA9ICJodHRwOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVh
c2VzL2Ryb3BiZWFyLSR7UFZ9LnRhci5iejIgXA0KICAgICAgICAgICAgZmlsZTovL2Ryb3BiZWFy
LnNvY2tldCBcDQogICAgICAgICAgICBmaWxlOi8vZHJvcGJlYXIuZGVmYXVsdCBcDQogICAgICAg
ICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICcke1BB
TV9TUkNfVVJJfScsICcnLCBkKX0gXA0KLSAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMo
J1BBQ0tBR0VDT05GSUcnLCAnZGlzYWJsZS13ZWFrLWNpcGhlcnMnLCAnZmlsZTovL2Ryb3BiZWFy
LWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoJywgJycsIGQpfSAiDQorICAgICAgICAgICAke0Bi
Yi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdkaXNhYmxlLXdlYWstY2lwaGVycycs
ICdmaWxlOi8vZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhlcnMucGF0Y2gnLCAnJywgZCl9IFwN
CisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMC0zNjI1NC5wYXRjaCBcDQorICAgICAgICAgICAi
DQogDQogUEFNX1NSQ19VUkkgPSAiZmlsZTovLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRj
aCBcDQogICAgICAgICAgICAgICAgZmlsZTovLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1m
aWxlLnBhdGNoIFwNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhci9DVkUtMjAyMC0zNjI1NC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyL0NWRS0yMDIwLTM2MjU0LnBhdGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXgg
MDAwMDAwMDAwMDAuLjY0ZDBkOTY0ODZjDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9DVkUtMjAyMC0zNjI1NC5wYXRjaA0KQEAgLTAsMCAr
MSwyOSBAQA0KK0Zyb20gYzk2YzQ4ZDYyYWVmYzM3MmYyMTA1MjkzZGRmOGNmZjJkMTE2ZGMzYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCitGcm9tOiBIYWVsd2VubiBNb25uaWVyIDxjb250YWN0
K2dpdGh1Yi5jb21AaGFja3RpdmlzLm1lPg0KK0RhdGU6IE1vbiwgMjUgTWF5IDIwMjAgMTQ6NTQ6
MjkgKzAyMDANCitTdWJqZWN0OiBbUEFUQ0hdIHNjcC5jOiBQb3J0IE9wZW5TU0ggQ1ZFLTIwMTgt
MjA2ODUgZml4ICgjODApDQorDQorUmVmZXJlbmNlOg0KK2h0dHBzOi8vZ2l0aHViLmNvbS9ta2ov
ZHJvcGJlYXIvY29tbWl0LzhmOGEzZGZmNzA1ZmFkNzc0YTEwODY0YTJlM2RiY2ZhOTc3OWNlZmYN
CisNCitDVkU6IENWRS0yMDIwLTM2MjU0DQorVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KKw0K
Ky0tLQ0KKyBzY3AuYyB8IDMgKystDQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCisNCitkaWZmIC0tZ2l0IGEvc2NwLmMgYi9zY3AuYw0KK2luZGV4IDc0
MmFlMDAuLjdiOGU3ZDIgMTAwNjQ0DQorLS0tIGEvc2NwLmMNCisrKysgYi9zY3AuYw0KK0BAIC05
MzUsNyArOTM1LDggQEAgc2luayhpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQorIAkJCXNpemUgPSBz
aXplICogMTAgKyAoKmNwKysgLSAnMCcpOw0KKyAJCWlmICgqY3ArKyAhPSAnICcpDQorIAkJCVND
UkVXVVAoInNpemUgbm90IGRlbGltaXRlZCIpOw0KKy0JCWlmICgoc3RyY2hyKGNwLCAnLycpICE9
IE5VTEwpIHx8IChzdHJjbXAoY3AsICIuLiIpID09IDApKSB7DQorKwkJaWYgKCpjcCA9PSAnXDAn
IHx8IHN0cmNocihjcCwgJy8nKSAhPSBOVUxMIHx8DQorKwkJICAgIHN0cmNtcChjcCwgIi4iKSA9
PSAwIHx8IHN0cmNtcChjcCwgIi4uIikgPT0gMCkgew0KKyAJCQlydW5fZXJyKCJlcnJvcjogdW5l
eHBlY3RlZCBmaWxlbmFtZTogJXMiLCBjcCk7DQorIAkJCWV4aXQoMSk7DQorIAkJfQ0KLS0gDQoy
LjM0LjENCg0K

