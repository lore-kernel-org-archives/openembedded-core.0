Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB607C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 04:18:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5945.1639628328477990669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 20:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fqH9QY0b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7984ca7e9b=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BG4HOUS012499
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 04:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=cvccEe7ZWcBGXckjdBrzJF56pgHM1g+Dj6H6xtnpS7E=;
 b=fqH9QY0bnY2OZOkyz6k1iEo7WwL0epPU1o8yZ3bXbZyvzcCcny9yj4ES7THkB+Wcrq8c
 gh4S5xnCP3I+2FziH7nxH/L2O/XrpG6r7SUVk33zxAOg4aVv6XRisykhxYtPq+Eg3oPR
 Z60KlFoG440dCxfd7A5A3qq1Y34Vf95nMeER2l+6NUNo5xL5ykmNaKjdI5YkmzqhScJu
 6+m4yXAjNnjyRFNi+zncogbdlD/ljQFoD2722pSdH/00z/9BqIx1aGZFg7VACgoIw/yw
 H1ChOdt+gaDqIn4BjUTCHYJwBFw9xBbCduZgOIp/juxC3ba+Qp9DkyBe0jAqqnCuGXNs Rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cygan8nd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 04:18:47 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BG4IkrD014611
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 04:18:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cygan8nd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Dec 2021 04:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDL1Hd0ke63M7QdVIJTSdOoaGpTCnFh6rR4ROPDrV8bjNDVmMkqvIEFZ3sEdXWx0wh68wQOS9OQzh9D9x5w+M9Jxxe4t+IQ2/HCbeFnprtWDXjPObY8T7cLXHtLuLaGCS6ClwI2tPYPnVA8oGYAy0FjBlKwVqjLMSrflrOCWl0nX0jPKq9W1yZS41RHu9RflydV3P9y9SwV5KEQsL0EjhkdLeG5kK5L4xo7DhfHHMnfARXPR4iHeG+rbmI47CTAis9JJo/xGzt2ym1gO3ZJdW6jobxhxAwGz5lmxHgADNe19nBLvUi8DMU2edwZZG/kP7b9zzX8NJZQRHoJRER2NYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvccEe7ZWcBGXckjdBrzJF56pgHM1g+Dj6H6xtnpS7E=;
 b=F3x6IQOsdqlH7Y6kkhTtJuyRQttJBlC/sx8F27HqXswVE98hxB9WRwJ7ndt/3T0+BNXqMrAWbpg0YUFS2y1w6QA9+L4thxNBib6Sp0KEUexBFBZ4QF1kd61ULZiVlYxfbyDcdAqMNwjBU4EijF4m9ijIfIgI2h1IYvy5XtAm8Gdbdh1Dcl+V2BMFYVGHqnFuhtMXqc5nVGW2n0LySrEb9bZ0iKjpIty6bNkazMo420lbWBZz8awF1qnAH8xKgS3/RM7D11UvPNX61gyvfuAIcXp9bFFm3DUm4pPoix6CxTON7kNWLo93I1KQBCU+KsMuoZ3Ld3eMvjnyRcHwdnPHog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 16 Dec
 2021 04:18:43 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::5903:27d6:ebed:54cd%8]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 04:18:43 +0000
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: Ross Burton <ross@burtonini.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: Konrad Weihmann <kweihmann@outlook.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim Bootloader
Thread-Topic: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim
 Bootloader
Thread-Index: AQHX8YO8WF6maTk/6Uym/85gYyg03qwzKYoAgAAC9xCAAAgbAIAAKp4AgAElgFA=
Date: Thu, 16 Dec 2021 04:18:43 +0000
Message-ID: 
 <PH0PR11MB51751455DAA925E43B2D871EE5779@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <20211215071632.11038-1-yongxin.liu@windriver.com>
 <AM9PR09MB464238FBE970773FAD77D126A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <PH0PR11MB5175F1EADC2CD9EE3A711A41E5769@PH0PR11MB5175.namprd11.prod.outlook.com>
 <CANNYZj8pXg=36BCknUvA4xemPYawzkHwbuUBWi_giqhHY-Cf9A@mail.gmail.com>
 <CAAnfSTtELKG3oF04CQV9nDvgpy+T8qY_PoaD6L=QXCXez-HmhA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtELKG3oF04CQV9nDvgpy+T8qY_PoaD6L=QXCXez-HmhA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99457ade-0a56-4be7-d692-08d9c04b25bc
x-ms-traffictypediagnostic: PH0PR11MB4837:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB4837C7823029EDFBB0765759E5779@PH0PR11MB4837.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y1tDYk67zN1Sy9UJE9N9udhP2uG9s17F7yP5qsbwVdk+qox/vDxc+miQopAp1KCGFw3J7YJxzOmvVFjlnbyRsuj7EpwWM5OhHGWQlNTbZbK9A+pXThqnTayh5Ov4514JWqrKAYHt8OkL9l6NA7iJ77c5J4MrcvhycOobvtoR2PWIW4MH41jGNHWQWdR4k2yYqmKhXG4iQIq2Cb44AMmgut8rlKxaNbl7pdgsAF9PQlOIoxNwLgGqjrWGFignrGsvYqdvWAt0lIdWNvNRvtdYKL7AX0+rcbdvAQraiYJ5IMp9nLo4PUzP4NnzsOZ7r0SaSt652rcrzlWiGwyUj7n0wbdLHeIIAARW7IbnR3Z0wI0IqHP9+xVD/UYOZnX6v/8IfNb7VE760NVnCa7oS6kWPbIZwKJnYn284OG7+i+rz20PpQYVUGeCcQIoxNvCWqDZjaJw3qKicFuDUsndkTlPq9p+YHllXnUn5iVMk8L7akzrsi1FiKZWJD4YcUnr9ZxGdpAeEC++qtMhe7mHNgfhU0ObZiwbUw8cEKEr4qdzCH76IFo1+6CajUdRVYP04zqNlo0CH39h0WsjZnNV3DKFmhBQCEZNdJJwuBWuBs+sFbzDwJTBmvGQZVeW0fUnd9L3OUYwkjY/gCK32fNl9V1I+8Gr7JYLdWg02ICe4edbptaHPHdbBH4LecWrdHN1gsXsrOlKpOVU1nzBcfPsCJOVNA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(54906003)(110136005)(38100700002)(2906002)(83380400001)(33656002)(71200400001)(76116006)(4326008)(66476007)(122000001)(66946007)(53546011)(8676002)(8936002)(64756008)(52536014)(9686003)(38070700005)(508600001)(26005)(66556008)(55016003)(4744005)(186003)(7696005)(86362001)(66446008)(6506007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?blNtbGRuNkpOV1lvbWFQbEFMMnFKbGlKanRoc3N4bnRjd3FLeWpFaVEzd2J6?=
 =?utf-8?B?cDFTZUphcWJVQytRQlE5ZE1tR01aTER3ZEhoOW1EZktBT0FXbzhmUi9xaDZt?=
 =?utf-8?B?V0NzaHI1RW0yenU2UTdJaGRwVTlTaUNIa1RSNHprV3BTbzVtN3J3YnVpYlY4?=
 =?utf-8?B?SjdkUE9zUitPZTFudHpGbTJ1TW1CbURnUW9NNk9ITnh3MzFLSkxkeU5VOEVD?=
 =?utf-8?B?YlJrczFIL0pENHFPVGdSVjBtTHcrWGtzaHRuRGJ1UmM3WG5RLzFQbVdZN3lJ?=
 =?utf-8?B?STE3d3BsUFYwejlvTUFkZlprME5KeTVDWVBQTjAzdk1YejJXdXcrUXByNUVB?=
 =?utf-8?B?NVZ1dFU4ZGpUM05hTE5qYWxZWmYweWxJWUFUMktDRkIyZUNiKzFZckJuSThZ?=
 =?utf-8?B?UGZOVGxrNFV4U0JicmM4TzA3WmNEWUVaZE5OclNOdnlCZ1dFcEV0SHpDcUpk?=
 =?utf-8?B?ZnNUQ1kwZlBsZloyU080Vk5LZnJJdTRDTUR4U1NCU0xCZWxZYXFxWDBRdmc2?=
 =?utf-8?B?NEZiTXREd1ZyRzUrbit0MjFzSzBzeDNrZGd3WVNwaUlzVWdWVEx4YmhnZU9C?=
 =?utf-8?B?cUFWUTlObkNUcWNjQm1oRVBYekpvTmZqYjJ6YnJldUJ3V2JsMUh4YVBCVG0v?=
 =?utf-8?B?RWhrYW9xV0E1TFIzZXFZbjZrTkp1b0h4ck5CNURlUkszZTNLQWcyTy85TmRs?=
 =?utf-8?B?V05HT3JtRnk0ZTluTk1XL1R4MG5tZnBLNHIyTlIyYnlqYXBlMXgwM09yMnpR?=
 =?utf-8?B?aFFTcWpISVFKQWViMmJFUFRlU3RXVnRPT3JocW1oaXhqT0xrMk1oS1JDaW1h?=
 =?utf-8?B?RjN1aE9jRHJmNXE2TWN6VVdXQStSTDJ4TTNXSlVKeDBGSG5vZ2NpTVFDMFlC?=
 =?utf-8?B?UFE3QVQ1MGpzQy9tbVFRU1lqSXFORmtQL05tNVZHOUtWYWhDUGNGL2VhM0ty?=
 =?utf-8?B?UHF4WVFZWDBJOWJPZ0tteU9UY3BtdHFmZURwRHVyUEVGUFpORGxDTzM5V3N0?=
 =?utf-8?B?a0xFaWhSUTE5VnNmVFhlbVNTQzd5VDV5UXI5WkcwbnFXaFpaa25lRjZYaytU?=
 =?utf-8?B?TlpMTjQzVlZjZWtNOTlMMUJNU0lFVm0zTVRtbWFicXJWSFNvdExnMStGcCtI?=
 =?utf-8?B?OGZ0K2c5cUJONnVFOFI4Z3B4SFMyeVVneWd3OFUvTGxZaXNyNDk0bXFCSHdE?=
 =?utf-8?B?S2MvS2l3V3ZkMEw0RFdTekJ1NytiVEtWckE3L1FFR0k2S0xQTnprTTRVVW9j?=
 =?utf-8?B?d0JBNXg3Qkg2enRPT0JKM1QwM0x4VDVGaHVYMmVEa3h0L3RzUWw0ajAxZ1Nx?=
 =?utf-8?B?SGdjbWc3QktvdTNpY2crNjFYS3pKS2MweDhSd0U4SUFzcEp3eVZ2OGx0MUpk?=
 =?utf-8?B?TjZYRGZkbzd1Nk5KeW5KUmRGNHhhZ2tLa0xSbFVMakxtY2k3cWFmbEUrSm5Q?=
 =?utf-8?B?K2oreHByUEd6VU4yRUZ2Q1M4R0dZcWNmbUcxOHc3QlUyQmRZRXlJQjJuNnFB?=
 =?utf-8?B?aXk3T0pFTE1lWVFTQlMyVGpVU28wb0ozS0VUeDF3aC83NlF1ejEyTWNBYWN2?=
 =?utf-8?B?eGZObDY4TlNtWkIxV21HUWVzK1VZeWt4S1E5dGNvZ21Bbkl1Q01qMGI3dFNT?=
 =?utf-8?B?ZVBkaUYrWDVkZFN1R25CdTNPTGwzYWdSa1BhZFo2dy8vUWJuRVN1NWRuVzM3?=
 =?utf-8?B?TmhDL2c1ZElCSUcxRkJ5eWYyNmp4eElHQ1FBb3Q3NU1qR0R3aDhOekl3TlRN?=
 =?utf-8?B?UlVYY0VrMStVRGxOQlZLWVloLzZVU3pCTDlLR2krbStyVW1pZXB5Q0pmbVRC?=
 =?utf-8?B?RzVZdUFvYzJCWUpvYXpPWkR6VnNsT3NySzNjc0w0N016c08vYzhUTDU1RW1U?=
 =?utf-8?B?aGZCRFN3NzZrQ3ZvY3IwVFJwdVNKV0lHaFljeUVabkVnQ01MSE1KdCtiSGJM?=
 =?utf-8?B?bzU5U2VpRXJyT1RIS1JZT2NDQzN0NytYUWxlSjVXK2g3d3gwd1pVUVMrM0RJ?=
 =?utf-8?B?OUxEall1a1JyVXpHK1doMERRZHVna0VqVC9jTWNVMDNDRmFWU0xRTnY4MXF3?=
 =?utf-8?B?NmwzSUFoSlp4Ui83TEVPLzlkYmlSVm5uSk5zRWd6aDBhTERiVGJ0OStSWE9S?=
 =?utf-8?B?YWo2bEZlajRadTh2N2d6cjVKWUU5R3RHdG9tU1V6by9Yb0FHS3hNRzVSSWlF?=
 =?utf-8?B?V1hFZ0xaZXNCUy9IQ2RiYVRtYTZ1MTRiczJGeEVMdkpFRDFia3Y5amZkZmhq?=
 =?utf-8?B?TlQrNnpONWJFaURvMFk2c01OZlB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99457ade-0a56-4be7-d692-08d9c04b25bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 04:18:43.6442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bWsNT4xsopDAv3dBtj9NOo9MfhbUz1/UxWL+aM8EFvY1L9faQbY3QE9w/8EPMPHvpLDWC27Ms9ZNzQf4I658gZty35MR6WauyP8Tdq6AqgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-Proofpoint-GUID: 7-xlBa9gReRrv-J3DGV9eP7TsSLrYQeU
X-Proofpoint-ORIG-GUID: 7_iRd2eKdngrzLkYpjYMV-yPpXKMPEJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112160023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 04:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159770

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPHJv
c3NAYnVydG9uaW5pLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMSAx
ODo0Nw0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+
IENjOiBMaXUsIFlvbmd4aW4gPFlvbmd4aW4uTGl1QHdpbmRyaXZlci5jb20+OyBLb25yYWQgV2Vp
aG1hbm4NCj4gPGt3ZWlobWFubkBvdXRsb29rLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc7DQo+IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gbWV0YS9yZWNpcGVzLWJzcDogQWRkIHJl
Y2lwZSBmb3IgU2xpbQ0KPiBCb290bG9hZGVyDQo+IA0KPiBbUGxlYXNlIG5vdGU6IFRoaXMgZS1t
YWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdDQo+IA0KPiBPbiBXZWQsIDE1
IERlYyAyMDIxIGF0IDA4OjE1LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4NCj4gd3JvdGU6DQo+ID4gQWxzbywgYXMgdGhpcyBpdGVtIGlzIHg4Ni1zcGVjaWZpYywg
c2hvdWxkbid0IGl0IGdvIHRvIG1ldGEtaW50ZWwgdG8gYmVnaW4NCj4gd2l0aD8NCj4gDQo+IE15
IGltbWVkaWF0ZSB0aG91Z2h0IHdhcyB0aGF0IG1ldGEtaW50ZWwgd291bGQgYmUgYSBiZXR0ZXIg
cGxhY2UgZm9yIHlldA0KPiBhbm90aGVyIGJvb3QgbG9hZGVyLCBlc3BlY2lhbGx5IG9uZSB0aGF0
IG9ubHkgdGFyZ2V0cyBtb2Rlcm4gY2hpcHMuDQoNCkFncmVlLiBJIHdpbGwgc3VibWl0IGl0IHRv
IG1ldGEtaW50ZWwuIFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLg0KDQpUaGFua3MsDQpZb25neGlu
DQoNCj4gDQo+IFJvc3MNCg==

