Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A51105D992
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 01:48:49 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96868.1775612926385570667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 18:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=goR8A+is;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.16, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIFWr7jIIEQg8UmVQqovMMTw9G/sff3wXUPJXmKCnu+13vpk+JYJLcgMqNYA1kfBEKqnp2WJywD6BC3IjAbTvWTQ8mA+JO75WsGsIzfnpkGo5O1TE2Y8YtUaHEasnLbzteLyVWbBqQSBsLKAfD4bfn/19vWZ+57BlY+c5V+MYc3GAAoTZDSZ7YQHa74+UlK1j5sCsCQc/e6eGs1epCzcYs6M8DplBl4NCthmy/aTQZHWyhyrCJnY5rkzkH5kxsx51K9NeFEcXsu8C6QHqzxyRC6in6be3w/y9sXPJQvTvQKPEuhnvR8TYX25yBPr66Tr6cjfcznIpnlFvCaXHDAlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw8tLfpCnvbHzSPeqH6CFR+jMnDuKQFZPwLQQYaHd3I=;
 b=nQFz4WAaQ1NFHI7vCORoSrSNmaKBJn/d6sWcEyI/+BLd7rCxRNf9l3GqD/u+NH8boADeel+Z8VoohnTh7Lpf61G/jWW69fFkW9v+N8soPbdIAMs/p2iJ40i7s1u08nt9nkO7NhreD5IDJQLGMTasY1YxLw1C77jinRCH7SlM6omgsD52TRhFeqtm/mrUvOn1I8o0JdDhAs7Ay99CFBugHmX3F6N5noAspo8MRRjT5Sm6NVAk+5r+u7/y8gUxgartahKXm8oz/EmS3MutfGeDqXNt37+dg3DWBBhm8c6GLJ9jrpJft/csAR5LRAh+VGrkCS+2/vrBmPo+8djdwvpevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw8tLfpCnvbHzSPeqH6CFR+jMnDuKQFZPwLQQYaHd3I=;
 b=goR8A+isu+X6sYqOaNU8Prw3BQHyvuqdtB6vHXsGC8Fbg5p4UQsgwh/khlXsjH4ufgT7zlPYiAcWmeotiP9p9J7QBsJPZrUEfStuyBSBTMliyXzjR3xOtucacNR6ofkeRnkQ0wZk9Zt6qR2ADgZCq/wenXuY5vzKSdiKw2y+C+tbniM8liW+wreAE+0HwK4pK6bbwOgumrfsQ9By3gZc7+5VDBM5ZmED41fyRdLqQUoTaivg7bVm+VarvevzhWYD0g/QY+mJnbvNlEg2TZTALOSrnhqb3rz5oqf3Z9glatZXi+eQoB8FPn4n7Le2eUNaSabe+uR2BOwFYIukIE/dng==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OSZPR01MB9501.jpnprd01.prod.outlook.com (2603:1096:604:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 01:48:41 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 01:48:41 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Yiding Liu (Fujitsu)"
	<liuyd.fnst@fujitsu.com>
Subject: Re: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-> 0.7.36
Thread-Topic: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-> 0.7.36
Thread-Index: AQHcumWhBSkcae1ZU0STxt8ca65Vu7XUftf5
Date: Wed, 8 Apr 2026 01:48:41 +0000
Message-ID: 
 <OS7PR01MB144449ED752F234CD3614C9929B5BA@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <189F54A9025F8C39.1958411@lists.openembedded.org>
In-Reply-To: <189F54A9025F8C39.1958411@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-08T01:48:40.863Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OSZPR01MB9501:EE_
x-ms-office365-filtering-correlation-id: ffbb2c2e-3967-4984-7cf2-08de9510f635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|1580799027|13003099007|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 kvQhNWC6n49TOaLAGBZDuPWicy+I2xBdHum+fNe3ydHcou94AdXT1eVwZeGKuy3wp/AxKjTm2SGSi/soFWY96yluv/0Sxsb3+R4sDzSgKbPf1tonHrQJUXeYLT5sZv94OHzxrIxz+0pCA8RZkBJ5dTXUnr5emB05nuuKOzijM5bXN8l0GgyiL93j9/C4KQoccFRgt1A3UzI8j2puq/+CAWvATKRDnibYp0sG7RBJmiW6her0rFzoHPBHpsxJRraRyHEc+k2GKcxNTl1Np9plS9Ci0dUyjHEZKwD66UVuXA6Ql4YRDD/XF9DefEW+RzigePW2R6JjMQ2IAYoVZdvTGHNh3/KTbKgNPylaN5Y4dkwd3+FxBHxbD79cedlveYD4n871/UZOo6Fd7WqFyBhPpXVSKSvYvHketZjDSU6G2hXkphIWOcTYVA1C8dlBe54sUBtlfAcF0DYc6SOOmJjKR1fDsGHyaa/1Sy7Q8GWanSGlOcNguq/+znkwlfj4ejpBcEstdZfneyvpgvq4/JmBAQGtlN3Y4lY1ot3vH9HSqXHBKc6A4pv+4RFhg8ieCtvjR6dY0ngQiXaPikL5lRMq4T83n1cIZvXRIHzL/vVFnmSaOttQ1DdR4qtpIGY3dVoWJ4UHXMogo5zNwX65bEcz+nKBhYU8vsp6H+0EBwUC9vfYXcFC6iOmR/ChZ2KK4I9zpElb/PSb4HlVo/dCZWoKY1PxaiSHbBmOaIRTgShH7RTgIE6XcUSbmyOGUH5fJcTIQ32GmNKfyXyeOr8ikYTW3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(1580799027)(13003099007)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Vm4wYzdxWWlOWU95ZTBSNkwrdkkwa0Q3VkdYRXVGL2hsaTRVdnpZVitYSDE3?=
 =?gb2312?B?M0doQzZ4eGRwcStBK3dodUduMldueXIzQnF4aUpjNFkxeVlXNStSVitNUVc1?=
 =?gb2312?B?MHhGSHgvWER6TThrbnpmQ3R2eWNBRUVNRG1ocHcyTHp0USt1VDV4RW5oeVEv?=
 =?gb2312?B?UGZ2cWtjZ2R3cjBNOG1URUc3Q1J2K0NuK3NPVXRUV09VakRjTEUvaTJXcFRG?=
 =?gb2312?B?ZlVkUUxLaTg2RUx6TXlJeWdWbFFsMndZcFJHVG9FNGpEdW5MNGIxWHNaRDZO?=
 =?gb2312?B?TnhiZjVnaElXVmt0ZVVpOVBpRlBDYVZsZ0lqenJETE8vTVFOdG1Fc2t4cXpI?=
 =?gb2312?B?Rk1PaTBOMC9pRkVoeGFZeHk1UEhCZTVmZXpNR1owNHV2LzRzaU9pTWtpajVU?=
 =?gb2312?B?NzVwUXYvZWxqeFl4SEp3U2h0a3lJREQwczRjejVVMmtRYmxPR0plWDRsYjN4?=
 =?gb2312?B?LzRXMld2UzBQdXJvczNQT0JFb0txNGYyckFOOFRyKzk3bXlzbFRCb1c3ckt5?=
 =?gb2312?B?U0dWT1o2QzJOTGVoUTVWV1VtR2NKTmh3SWt3SzQvVHFNSERaKzZnVmdYWEZI?=
 =?gb2312?B?K0V4RUxVdVdLamhFalJsS2JKMlN6Z1JzalRjNlhWcVVoRjlMVXR5cW4yWW5L?=
 =?gb2312?B?NTZieXVmeVB6S29XSjFyOG40UUJ2bXVVakVBczRydzRDZU5Gcy9SSzRwL1lE?=
 =?gb2312?B?V3MyOE1OTkdIK3JuRytBRTdmVTA1KzY0YktaNEh5TndDQTVHM0o1ZmVSelJL?=
 =?gb2312?B?Ry9jaHJLRk5LSlZVVDA0cmlYLzRwbklHSGtILytqVHVBMWo2V2wzRTd0b05x?=
 =?gb2312?B?eExNSnl4RHVkVWUyV3M0cnVQMWc2Y0JhZDhqZmt0VVpKRkw5aFQvS1ZBbUpk?=
 =?gb2312?B?eDhCNjJvSjlCdEFDR3d1M2gvZ2pMelFmZTVZUnRrUUZWQndudGpNQkcxVW1N?=
 =?gb2312?B?NjdsTXdyTXltRDVVN01rRzByS29yRUJWK1lPUTRGUHFHS2g4ckFuSmV0YlI3?=
 =?gb2312?B?WWtRaDQ3eXhSaHFoMnoyMEdJQ1FNRXRnbllBeWorWHVva0RvY2tsZEVFRHds?=
 =?gb2312?B?R0pmTURaMWhZZEpFN2xXWlcyWEdQTzJ4WWRabFpzZWhZTU5GVVZtT1o1bXhR?=
 =?gb2312?B?YWRiOVRLa1hNaXY1bTUvV3k0TlI5QXFoMXNmb0hLOWFWdElvRTJtcEdMdGdY?=
 =?gb2312?B?ZDh4K1I3VXVJelZJMVJPdzZOYW1scXpDTkRJZ0NzcE9XSjZ2YjU0enN1Q1ky?=
 =?gb2312?B?RW9rZGJlallvTmUrMjgwdTh0S1h4RHlodU9VakdORW52TjYzVUhuWjFqM3RI?=
 =?gb2312?B?ZG5tV3UzVFB5a3Z2YW1FckUzL2krZEhPVnFnSVVuMVY2Y3IvZ3ZEMXpGSzc3?=
 =?gb2312?B?ZW5yL1U5aWY2akV3TFh1a2JsUzF2YUN2bUdPQ1N4cVhVRnhLOVRiZWdXTVl3?=
 =?gb2312?B?cTFMY1Z2ZVRwSDRiMDJhVkYxNTVmWGdZam9QMWFPNWRTZDROdmxaK091OXE1?=
 =?gb2312?B?T0llRXlCaDl0WUo0RFhzbnI4ajI0R2Y3YUhaMzBNbTBIVjJvMXF1b2lmUTJs?=
 =?gb2312?B?N0dzUUNlTzRxeXlBT0FUaHdwTS8wcmFWZjY1NHlKUnluTXNDWUl5Q2RJNWtW?=
 =?gb2312?B?QmZLeVlUL0Z0Ui9RaENJMnc0R0psVWNFSzJoWFpvZXpqR1QrVTZjQ2x4UTY0?=
 =?gb2312?B?RU9lTzJCZkQ2RlZMUnNiT01Ba3U2MnNRaXdBQkFvSFREVyszbW1mYm12S2FF?=
 =?gb2312?B?bUp6aW80dStud2xkU2VjU0VkUm8wNG52eGt6alBpOTg0ZjcvMjNKNXluNlNS?=
 =?gb2312?B?QzdwNk1vMlBKOFJrRnZTTDAwN3Q0eVZIWVJ4enJJM05UNmpSYVc5NFJXK2RT?=
 =?gb2312?B?K3dJeWFGSWNBR1RUSlVEM0R2aHMzdW1JOWF4Y1J6U1AzZ0IvQTh2TFczcDJG?=
 =?gb2312?B?S1Y3eXpNanE3c1Bxd0JJMDg1dDIwUHhkTk9RUlhLaEI2akg1VkhZK3NsdGNH?=
 =?gb2312?B?MWRyK3VBaGZQS1hKM3ZTcVI4U2V1MlNBYXhZbDlzL2hoY01CaUpLK2NGYXA2?=
 =?gb2312?B?ck1mdjBZU2NqbXd0WldXVlJ6Qk5mU0czSkVTVGNPQjlPNml1VndDZWtmbVVZ?=
 =?gb2312?B?N0VXMVhTdzFlbG9mQ1R5ZTM3bkxmL1F0ZmdVN3V1QnFoeXpabkJvNlRSazhF?=
 =?gb2312?B?TzV2c3BVRFJ0MEEyZUNtdjJ2U0l3bWtHQUc2OTNFQ2JGMi9mSlBybjRBMnE0?=
 =?gb2312?B?S0s2SitpWGR1L0tmVVVzN3pWWlRjc0VvZVJJQ01udG4rRXlCQVQ5RVMwT1pR?=
 =?gb2312?B?YXlnQytwRWRCVE41cnI4a25WMTFLclZveWJHSXk5bW03MURaTVZJUT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB144449ED752F234CD3614C9929B5BAOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	XeuG+mWTInMPIEFWMIhxQyfxmqlfnzOsEAJ25LG9TnlG2KGTcr5RiDS4p5n2Ka39rfgF9KlYg+hTc93nagZTmf2SVIzEkvHfr/Kb3SLeHCSjTXKbxzZ2cC5ewQW7KKiTD6O0QE8ru7lUUFaHwg7AA1P2c0fxTGoWYg7E+KcGSSbwC/QLFnKX3oGwXasvuv2oGa+EHSBKBhrmX1tdt5DVvhs3PHXjqO0dkFnMnE6Z+ifo4B6/MR0j6FyPbE5w8YfwMuRiF40RYUVah94jbCWGTnJ+D9P7EgAGH/xjdJIpi7Pxs1Y8T5huCoLOX7G3r6wRgLysfRG3EzGPP1u5FpioJg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbb2c2e-3967-4984-7cf2-08de9510f635
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 01:48:41.5709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Je9yjFOyiLUFdnx89oRbCuZsxRZJw92CHmqty4fSjEjtB7E5cdZdvKP/OFBPOxlcekhgG+RHG+uREmUbK6KqCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 01:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234789

--_000_OS7PR01MB144449ED752F234CD3614C9929B5BAOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gtPqx7SBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0Kt6LLzcqxvOQ6IDIwMjbE6jPUwjIzyNUgMDk6MzcNCsrVvP7Iyzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCtb3zOI6IFtPRS1jb3JlXVtQQVRDSCB2Ml0gbGlic29sdjogdXBncmFk
ZSAwLjcuMzUtPiAwLjcuMzYNCg0KMS5DaGFuZ2Vsb2cNCiAgVmVyc2lvbiAwLjcuMzYNCiAgLSBz
ZWxlY3RlZCBidWcgZml4ZXM6DQogICAgKiByZXNwZWN0IHRoZSAiZGVmYXVsdCIgYXR0cmlidXRl
IGluIGVudmlyb25tZW50IG9wdGlvbmxpc3QgaW4NCiAgICAgIHRoZSBjb21wcyBwYXJzZXINCiAg
ICAqIHN1cHBvcnQgc3VzZSBuYW1lc3BhY2UgZGVwcyBpbiBib29sZWFuIGRlcGVuZGVuY2llcw0K
ICAtIG5ldyBmZWF0dXJlczoNCiAgICAqIHN1cHBvcnQgZm9yIHRoZSBFbGJydXMyMDAwIChlMmsp
IGFyY2hpdGVjdHVyZQ0KICAgICogc3VwcG9ydCBsYW5ndWFnZSgpIHN1c2UgbmFtZXNwYWNlIHJl
d3JpdGluZw0KDQoyLlJlbW92ZSAwMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5n
LXFzb3J0X3IucGF0Y2gNCiAgYXMgdGhlIGlzc3VlIHdhcyBmaXhlZCB1cHN0cmVhbSB3aXRoIHRo
aXMgY29tbWl0Og0KICBodHRwczovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29sdi9jb21taXQv
MmQwNzE4YTRmMjAwMWM4NTdkOWFmMjQzOThjNjhkNjc2YTk4YTNjYQ0KDQpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KLS0tDQogLi4ucy1Db25zaWRl
LW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIHwgMzEgLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KIC4uLi97bGlic29sdl8wLjcuMzUuYmIgPT4gbGlic29sdl8wLjcuMzYuYmJ9ICB8ICAzICst
DQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzMgZGVsZXRpb25zKC0pDQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAw
MS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoDQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L3tsaWJzb2x2XzAuNy4zNS5iYiA9PiBsaWJz
b2x2XzAuNy4zNi5iYn0gKDkyJSkNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1x
c29ydF9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAx
LXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gNCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggZDZlOTgzZGVjOC4uMDAwMDAwMDAwMA0KLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVz
bC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gNCisrKyAvZGV2L251bGwNCkBAIC0xLDMxICsw
LDAgQEANCi1Gcm9tIGRhOTliZjA5ZTgzNDY5NjEyZTJjODIxNjk2MDI1YTRlNTkxYmI5NWMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4NCi1EYXRlOiBUaHUsIDI4IE9jdCAyMDIxIDIyOjI4OjQ1IC0wNzAwDQotU3ViamVjdDogW1BB
VENIXSB1dGlsczogQ29uc2lkZSBtdXNsIHdoZW4gd3JhcHBpbmcgcXNvcnRfcg0KLQ0KLW11c2wg
bm93IGhhcyBpbXBsZW1lbnRlZCBxc29ydF9yLCB0aGUgc2lnbmF0dXJlIGhvd2V2ZXIgbWF0Y2hl
cyBnbGliYw0KLWFuZCBub3QgQlNELCBjdXJyZW50IGNoZWNrIG1ha2VzIGl0IHN1Y2ggdGhhdCBp
dCBmYWxscyBpbnRvIEJTRCBjYXNlDQotd2hlbiBidWlsZGluZyBmb3IgbXVzbCwgd2hpY2ggY2xl
YXJseSBpcyB3cm9uZywgdGhlcmVmb3JlIGluc3RlYWQgb2YNCi1qdXN0IGNoZWNraW5nIGZvciBn
bGliYyBjaGVjayBmb3IgbGludXggdG8gZGVjaWRlIHdoaWNoIHFzb3J0X3INCi1zaWduYXR1cmUg
dG8gdXNlLiBUaGlzIGNvdmVycyBib3RoIGdsaWJjIGFuZCBtdXNsDQotDQotVXBzdHJlYW0tU3Rh
dHVzOiBQZW5kaW5nDQotDQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4NCi0tLS0NCi0gc3JjL3V0aWwuYyB8IDIgKy0NCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQotDQotZGlmZiAtLWdpdCBhL3NyYy91dGlsLmMgYi9z
cmMvdXRpbC5jDQotaW5kZXggNzI0MjZlMDkuLjhmMjliYzVhIDEwMDY0NA0KLS0tLSBhL3NyYy91
dGlsLmMNCi0rKysgYi9zcmMvdXRpbC5jDQotQEAgLTE1OSw3ICsxNTksNyBAQCBzb2x2X3NldGNs
b2V4ZWMoaW50IGZkLCBpbnQgc3RhdGUpDQotDQotICAgIHNlZSBhbHNvOiBodHRwOi8vc291cmNl
cy5yZWRoYXQuY29tL21sL2xpYmMtYWxwaGEvMjAwOC0xMi9tc2cwMDAwMy5odG1sDQotICAqLw0K
LS0jaWYgKGRlZmluZWQoX19HTElCQ19fKSB8fCBkZWZpbmVkKF9fTkVXTElCX18pKSAmJiAoZGVm
aW5lZChIQVZFX1FTT1JUX1IpIHx8IGRlZmluZWQoSEFWRV9fX1FTT1JUX1IpKQ0KLSsjaWYgKGRl
ZmluZWQoX19saW51eF9fKSB8fCBkZWZpbmVkKF9fTkVXTElCX18pKSAmJiAoZGVmaW5lZChIQVZF
X1FTT1JUX1IpIHx8IGRlZmluZWQoSEFWRV9fX1FTT1JUX1IpKQ0KLQ0KLSB2b2lkDQotIHNvbHZf
c29ydCh2b2lkICpiYXNlLCBzaXplX3Qgbm1lbWIsIHNpemVfdCBzaXplLCBpbnQgKCpjb21wYXIp
KGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAqLCB2b2lkICopLCB2b2lkICpjb21wYXJkKQ0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM1LmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzYuYmINCnNpbWls
YXJpdHkgaW5kZXggOTIlDQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29s
di9saWJzb2x2XzAuNy4zNS5iYg0KcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJz
b2x2L2xpYnNvbHZfMC43LjM2LmJiDQppbmRleCBlZjM0OGRlOTA0Li5mMjIyMzA1OTliIDEwMDY0
NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzUuYmIN
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM2LmJiDQpA
QCAtOSwxMSArOSwxMCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLkJTRDtt
ZDU9NjIyNzJiZDExYzk3Mzk2ZDRhYWYxYzQxYmMxMWY3ZDgiDQogREVQRU5EUyA9ICJleHBhdCB6
bGliIHpzdGQiDQoNCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGlic29s
di5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9JHtQVn0gXA0KLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5w
YXRjaCBcDQogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCiAiDQoNCi1TUkNSRVYgPSAi
ZmI0YjQzNDBkNDYxMDhjYjM2NTExM2U0MzI2NDJkNjAyNDg4NmM3YSINCitTUkNSRVYgPSAiMWUz
Nzc2OTliZTEwOGVjODJiYjc5OGVjOWMyMjNkNDVkODRhNzMzYyINCg0KIFVQU1RSRUFNX0NIRUNL
X0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSINCg0KLS0NCjIuNDMuMA0KDQo=

--_000_OS7PR01MB144449ED752F234CD3614C9929B5BAOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;li=
uyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C223=C8=D5 09:37<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [OE-core][PATCH v2] libsolv: upgrade 0.7.35-&gt; 0.7.3=
6</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">1.Changelog<br>
&nbsp; Version 0.7.36<br>
&nbsp; - selected bug fixes:<br>
&nbsp;&nbsp;&nbsp; * respect the &quot;default&quot; attribute in environme=
nt optionlist in<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the comps parser<br>
&nbsp;&nbsp;&nbsp; * support suse namespace deps in boolean dependencies<br=
>
&nbsp; - new features:<br>
&nbsp;&nbsp;&nbsp; * support for the Elbrus2000 (e2k) architecture<br>
&nbsp;&nbsp;&nbsp; * support language() suse namespace rewriting<br>
<br>
2.Remove 0001-utils-Conside-musl-when-wrapping-qsort_r.patch<br>
&nbsp; as the issue was fixed upstream with this commit:<br>
&nbsp; <a href=3D"https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c=
857d9af24398c68d676a98a3ca">
https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d67=
6a98a3ca</a><br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;...s-Conside-musl-when-wrapping-qsort_r.patch | 31 ------------------=
-<br>
&nbsp;.../{libsolv_0.7.35.bb =3D&gt; libsolv_0.7.36.bb}&nbsp; |&nbsp; 3 +-<=
br>
&nbsp;2 files changed, 1 insertion(+), 33 deletions(-)<br>
&nbsp;delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-C=
onside-musl-when-wrapping-qsort_r.patch<br>
&nbsp;rename meta/recipes-extended/libsolv/{libsolv_0.7.35.bb =3D&gt; libso=
lv_0.7.36.bb} (92%)<br>
<br>
diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-=
when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-ut=
ils-Conside-musl-when-wrapping-qsort_r.patch<br>
deleted file mode 100644<br>
index d6e983dec8..0000000000<br>
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wr=
apping-qsort_r.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
-Date: Thu, 28 Oct 2021 22:28:45 -0700<br>
-Subject: [PATCH] utils: Conside musl when wrapping qsort_r<br>
-<br>
-musl now has implemented qsort_r, the signature however matches glibc<br>
-and not BSD, current check makes it such that it falls into BSD case<br>
-when building for musl, which clearly is wrong, therefore instead of<br>
-just checking for glibc check for linux to decide which qsort_r<br>
-signature to use. This covers both glibc and musl<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
----<br>
- src/util.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/util.c b/src/util.c<br>
-index 72426e09..8f29bc5a 100644<br>
---- a/src/util.c<br>
-+++ b/src/util.c<br>
-@@ -159,7 +159,7 @@ solv_setcloexec(int fd, int state)<br>
- <br>
-&nbsp;&nbsp;&nbsp; see also: <a href=3D"http://sources.redhat.com/ml/libc-=
alpha/2008-12/msg00003.html">
http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html</a><br>
-&nbsp; */<br>
--#if (defined(__GLIBC__) || defined(__NEWLIB__)) &amp;&amp; (defined(HAVE_=
QSORT_R) || defined(HAVE___QSORT_R))<br>
-+#if (defined(__linux__) || defined(__NEWLIB__)) &amp;&amp; (defined(HAVE_=
QSORT_R) || defined(HAVE___QSORT_R))<br>
- <br>
- void<br>
- solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void=
 *, const void *, void *), void *compard)<br>
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.36.bb<br>
similarity index 92%<br>
rename from meta/recipes-extended/libsolv/libsolv_0.7.35.bb<br>
rename to meta/recipes-extended/libsolv/libsolv_0.7.36.bb<br>
index ef348de904..f22230599b 100644<br>
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb<br>
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb<br>
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.BSD;=
md5=3D62272bd11c97396d4aaf1c41bc11f7d8">file://LICENSE.BSD;md5=3D62272bd11c=
97396d4aaf1c41bc11f7d8</a>&quot;<br>
&nbsp;DEPENDS =3D &quot;expat zlib zstd&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;git://github.com/openSUSE/libsolv.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3D${PV} \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-utils-Conside-musl-when-wrapping-qsort_r.patch">
file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-SRCREV =3D &quot;fb4b4340d46108cb365113e432642d6024886c7a&quot;<br>
+SRCREV =3D &quot;1e377699be108ec82bb798ec9c223d45d84a733c&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB144449ED752F234CD3614C9929B5BAOS7PR01MB14444jp_--

