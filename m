Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779A8C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 11:09:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.6113.1665659364119419102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 04:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=h8HrzLHF;
 spf=pass (domain: siemens.com, ip: 40.107.22.77, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXJuahW1qnCAapPcCiPmB5XtuAohK3tHqTI6tF8LWkfXX9COcNFZR/1C9Gt4ASyYQBogKgMArTzDlcb6IcvpsAyxQOAOLGm6aK2CfC2IGqjc9F3kiqQHHS0OAN5jBRV1VAjsD35xcgWfph0tE35pGJ9HsdYNQF/507pOtAE2TEml+nppbWGg8RHFmiDKVX1Fw4rCiuW9Ydc5uJk40jZarC9seFD7nDgAkIJs+LafNaW2NetoUo2b/Xqht+BHAlEk0e/N4oZI78R0Bf8chr9Hd1oMUylb1CCHpFq7W0FL2z978Zbdim+iLPlt7W5O0skQopT75LMtxywmxuzvulo5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZbT0TA6ceHm3bfV0A+O7fbOTK0r03GOQ8qXIRTMxs0=;
 b=GAC5dXf795eINGhrDwxvTbRpN30pj/ZL0RVNLL9CMb8DgUsuxm2QPl71bIY5PH88ZttE3qqncngHPYr/YAx65El21At1wvbPQHjpEana35m+ApNVSOd0uq3TjOrcvCb4X0Bjo1gM7h7B/qici4l5G0EQqi6g+k3APNglgNaXRleUJOsauvbnJpM3j6rpZYpVbHfyfSwgj7RoGwJ1cWi8E0m4MlxZ7XiPg6TXo7W9zf713i9b4oGd+9piYVwDpfg2yybeAyXRbCSkeFidVmqLZpov1kve+0KTHeUEsr4Y89OwhsJ2fBi8Qg+QZ+Z5X9RqDgltCKJ3G1TPgJwcvYEavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZbT0TA6ceHm3bfV0A+O7fbOTK0r03GOQ8qXIRTMxs0=;
 b=h8HrzLHFVxMiNidEbXQwDEENGqZ8Ncv0WrEtA6qiKZsoUNqK66yuZ/OQC1Fupf1GfdMsbnuKkpJMSAO12xdcTiGW1g5oy+fi//jt6wMFgSOdcjmNZi+LiHlykJBRw/EyXjDCDUizX14yUM4I5h12l22pLZTiWeUmuGToRRYTRG4FhTR7ZttPPiWByRMzC56o7iUTpVa01avGJb+nQir6IEIEJREZuORbhdrtBsfjsEqFFZRXAqmhAPBZfo9Njk62SJJI0kc8ta2aNbsriUNaOQkH0gQb3eZLmmdPzwY319ScFjerYqzWAbbELKbZbgToKgnURz/o6CLyZmIYUL6fMw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DU0PR10MB6536.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 13 Oct
 2022 11:09:21 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5%7]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 11:09:21 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "Marko, Peter" <Peter.Marko@siemens.com>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] eSDK dependencies
Thread-Topic: [OE-core] eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1q4MxTWAgAAPAgA=
Date: Thu, 13 Oct 2022 11:09:20 +0000
Message-ID: <39f209e5c7d83324093ada18e4b2b96dbe59a0c1.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
	 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
	 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
	 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
	 <096e5f4224fa861c16c93a989f0c95169bb9771d.camel@siemens.com>
	 <C35431BE-46D7-424A-825B-2FEF21688FC6@arm.com>
In-Reply-To: <C35431BE-46D7-424A-825B-2FEF21688FC6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DU0PR10MB6536:EE_
x-ms-office365-filtering-correlation-id: ba967d25-6e26-4eb6-bb32-08daad0b60fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 idVylt75ZSgJD9jwUuDu3x3B184WYO4WS78+vkt+EFoY2ydABHRmi0xttPV58SuYXgNVyR/veLfiPvevI5B6WLJW9CEyztgdER6q/q97y9uUAQixig3dssY+UzvG2BGsXnE6Hu5PII4kuHP1erMtlfYrSlFTkfweTTu3GS9kB3PIcw7QmPslOLE+hsGipO2+4K8OCFHmA3WEOQxwNXDVTv1N0gvy7U8XT24i8NI7deIQyAQAb5VtjFCrgNwqj2wxe6IYH9g9HmgrZ+gGaHozwsXjl1fYamtCd55HD8EQqBf3hVi5i7i5vxwN6skFdlKJtdL7MP5ni1ebaHhiZpZ/oGlx+k6OQ9SwtEukHuvjZlBuOr9JBF3Uw6mje/wD+ht53ThjdeZBR5WXb/gZH8a+1oztJ8SwzmQs+Eiaxd0ch71o4oWCj2qtLCwfQO4PxvNrGwKIAbTj4EWD6DGHwrZPZcqvHv2eZcDh0RtBDaf3mcuNNlTWCcnj4Wm5LQCvgFAIdHGqe0h/pEMB2rrc94iwSkktpX2bl1boWSkk2f8j2SlqjagQVOf+KBze52JhcujLob94G4e72oiQ1FpxImeOiWgAQZchlhMEjTQ2daOi4SGkvB9BJw148/yLvemuWCjzRn7MiQvTDfbwVmtqxlabT6M4hvPgiCDGW3ZtrXRMGJjgtlptohiyq55sfYcJOTKCDz2HE9poPcoAz+bZeKVsZcr7vIHPlLy6c57zWJIexxpgMvWXx0KW3O0L+fdQMNeAZHxEf88ml+qRZrTIWTpFL/hczcqKcK9uQVSiKKX+oBbU0wy8kiGT25AuK1EBfL2Rxlx3BYfOVjb7V2agmo6FKw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(2906002)(5660300002)(41300700001)(26005)(86362001)(6506007)(38100700002)(53546011)(66946007)(66556008)(82960400001)(66476007)(186003)(71200400001)(6486002)(38070700005)(6916009)(2616005)(316002)(966005)(64756008)(91956017)(4001150100001)(6512007)(36756003)(76116006)(4326008)(8936002)(478600001)(8676002)(107886003)(54906003)(66446008)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHpzQzRaTXFQOUlGWXNxMnFpVHVQVk1HL1dTUTVkK0huamVXRnBFd2tKa3pM?=
 =?utf-8?B?bDB2TDV4S1BhUUVENnJEN0N3RHliY2p3QlAyL0Y4UXAzKzVWYzE3aGpDa3hI?=
 =?utf-8?B?ZjMrN1hyaFVGZjZkYU5DeGlFK3pzN3JER09XclY5ZXk0TnVTVnpFTkJFa0Yr?=
 =?utf-8?B?bkpEV0h6TTk3a3ZaczdHcjJiNlliVnJ2YmFTVzNhVlhMVUVEbjRzU2JlY1hW?=
 =?utf-8?B?TDNLZ1o2N2lMQ0xlSzU2bEdNQUl1eFQ2YUw4MEFrVnlVeXRla2hFUTVpZUVP?=
 =?utf-8?B?QzFXYTlmaS9aeWYrQ3VUQ2dTMDduTmxjeXpuRkdFRXFpUUpMc0ZOMlZVc3Uz?=
 =?utf-8?B?VnlJYVg4aTdUWlUwVFZjeU5OYTNxaVcvcFg2Mjh2eHU4OE9WcDdIZXZCMG5M?=
 =?utf-8?B?bzU0ajIwSU1PWmxKYWFxL1RSQmliZ0lha0FkNTF1TmFJcXpUenVwYWtyeWhQ?=
 =?utf-8?B?eFhRY1JDSFMvOE9RZDV4L09Gb3ltY09qM2c3N2JwV2ZZRGNSZkYwcDRneUxM?=
 =?utf-8?B?VElTQkoyTFNZNGI1RjRqMzNvOG9oRE5pQU1rM2d6TUlRTXFKNllIQkQ3andB?=
 =?utf-8?B?N0ZYQi93ejlxSjRxR2I0aHkwYnR3dmVzTEFNeUJablNYaERtMDNDbW5YanFI?=
 =?utf-8?B?dlVIT1VvZm9GWGhkc1B1UWRpZXNkcHlUUVZHcmFzbGhxaTZ1blZoMXZUMjJw?=
 =?utf-8?B?UFlkTnpRUTRTUFBkb1J1aThBUE1FRDd4NEdKSFMyMFJoOUxRR0tXMmZQVzFM?=
 =?utf-8?B?YWhrZXhnTklxTTZSUXBLRzZnWUU5Y0VxelJ2L0pIK0xqTDBweGM1Zlo5U05v?=
 =?utf-8?B?V1EyeThacmd5ek9LM3EzVVVBZXkrNXVZemcybXF1anJnYkRQSzdSMm0zc05S?=
 =?utf-8?B?d1JFVy9wbHZMSi9ZbDRQNHlzeG4wYXR3M3c5SXRXVWVkdWg2MkcvZFB0SkNm?=
 =?utf-8?B?b1NIZ1dUaEp3K1lRK0hLWERXeXJFRWREOEo1SmwwV09tdmFGMGs2Wkttc0p6?=
 =?utf-8?B?eUY3dW5TdHB4ZlRDdnVNb3Z0V3E1azBFVE5RcE9xT1RpS3RQdWIrQnFuek05?=
 =?utf-8?B?ZWlwY1UrRWlDYlZhbmd3RjJwWmszMXlzQ0FtaE5WNWZQUTJKTjdWa1hPamFR?=
 =?utf-8?B?dzc4aDIvUkpSMFArV2F5bGJ5VTFvcWhsdXNaNE1TLzhGUG5nV2lBTG5nNTFv?=
 =?utf-8?B?MVF5dFVxQzR0TldaL29WdFVjTFlsUUtzRG44R0ZLeTdCV3E5dnBpZTdkUlhr?=
 =?utf-8?B?S3NSZE5CUlJCSnlZeEExcDUvZzlnUGdKSTNEOU5FSDcwckJ1Ri8raW95VHly?=
 =?utf-8?B?NWZMdmRuMHlsRk1TblVySzlVdXNqK0RXOFo3RmZCZ3dzbEF5V1Fjbk4raWlW?=
 =?utf-8?B?WkZIYWdJRjhsa3JuTVRrVlZoYjRlMTdmcFo2NE43NERxclNWelBLUVV5bUhQ?=
 =?utf-8?B?MnU3bE1WMkhvV0twK3Zlc1FkbHdENG5ha3ZTSkRPaHNLbW5uSU5KMVZCanM4?=
 =?utf-8?B?NG12czBXdzBjZHNaY2p1Tkhsd2Mxc29MNFd0Sms1SkFTWkx6V0VqMHNqNytx?=
 =?utf-8?B?ajloODVnb2U2T01tSXMrWElWbWFTRzJQK2x4c1BFNTQyUzk3VXo2M28yUzR1?=
 =?utf-8?B?Tit2eGkwQ3pwU2tpUzFYalNOUDk1MC9qMEtlWmRmMXZlelNibjA1Q0RvdTFt?=
 =?utf-8?B?b2VoajlXZ1JvWUhxd2xlbnpyZW0wL0t3cGx2VmZxaVRGTzI3WVNpeFhaZXVM?=
 =?utf-8?B?aVpFbXFiakQ4K2k4OGFmMTBGWVcwZmo2MjRSUkhkWU44M2pLSUlHZ3NoQ1JM?=
 =?utf-8?B?TlJNdkw1SjN0VzBCWGJPYkV1SXRsR2NsY0tZZWgwSEVQWmI2anJYcGRSZ3I1?=
 =?utf-8?B?TnVOOFdqOHI1Z2ZhWmp6VW5DejFoc01iSmpBdldaMW13cGxnZzZxelJUcXQ5?=
 =?utf-8?B?WTM2MDlFaHZnbWFDNWt2TCtJdVhLMElaMkRmc1ZhT0dFUjRnRTVhVC9kanJL?=
 =?utf-8?B?eENHMmFYcXU0bUd3bmRxME9rUDRyQXM3NkZZMmx6TjVwcWVza1U0aWpCT0NN?=
 =?utf-8?B?UUIrK3IzZkQ1N2ZwN2VIUjhBcWo3Y0MvUzA2aGkxcTRTeWlpOVczUHlleVJX?=
 =?utf-8?B?cC9qTjNaRjgzdE5mSVdsSkVBWVV0UnJSOGhnWHQ4bXR6eGxtTUFYMjAzYXZ0?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8752F87FBC210E44898D2A76F72C591E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba967d25-6e26-4eb6-bb32-08daad0b60fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 11:09:20.9142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7SIT02lYxRjiTR5nb3Vu6a2XwmicfAim1QVn2FrWkHIJ7gOkzIhhtfRDhhZt+XjWi2nReOUDVqCyEf38sLmCoYz14+Uj3oOfDerAFXLd/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6536
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 11:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171701

SGkgUm9zcywNCg0KSSBkaWQgdGhhdC4NCg0KY3VycmVudCBiZWhhdmlvcjoNCiQgZGV2dG9vbCBt
b2RpZnkgYnVzeWJveA0KDQpJbml0aWFsaXNpbmcgdGFza3M6IDEwMCUgfCMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wNClRpbWU6IDA6MDA6MDANClNzdGF0ZSBzdW1tYXJ5
OiBXYW50ZWQgMTQgTG9jYWwgMCBNaXJyb3JzIDAgTWlzc2VkIDE0IEN1cnJlbnQgNiAoMCUNCm1h
dGNoLCAzMCUgY29tcGxldGUpDQpOT1RFOiBFeGVjdXRpbmcgVGFza3MNCi4uLg0KDQp5b3VyIG5l
dyBiZWhhdmlvcjoNCkBAIC01Miw3ICs1Miw3IEBAIGRlZiBjaGVjayhhcmdzKToNCiANCiAgICAg
ICAgIHRyeToNCiAgICAgICAgICAgICBvdXRwdXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dCgN
Ci0gICAgICAgICAgICAgICAgICAgICdiaXRiYWtlIC1uICVzJyAlICcgJy5qb2luKGFyZ3MudGFy
Z2V0KSwNCisgICAgICAgICAgICAgICAgICAgICdiaXRiYWtlIC0tcnVuYWxsIGJ1aWxkIC1uICVz
JyAlICcNCicuam9pbihhcmdzLnRhcmdldCksDQogICAgICAgICAgICAgICAgICAgICBzdGRlcnI9
c3VicHJvY2Vzcy5TVERPVVQsDQogICAgICAgICAgICAgICAgICAgICBlbnY9ZW52LA0KDQoNCiQg
ZGV2dG9vbCBtb2RpZnkgYnVzeWJveA0KDQpJbml0aWFsaXNpbmcgdGFza3M6IDEwMCUgfCMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wNClRpbWU6IDA6MDA6MDANClNzdGF0
ZSBzdW1tYXJ5OiBXYW50ZWQgMTQgTG9jYWwgNCBNaXJyb3JzIDAgTWlzc2VkIDEwIEN1cnJlbnQg
NiAoMjglDQptYXRjaCwgNTAlIGNvbXBsZXRlKQ0KTk9URTogRXhlY3V0aW5nIFRhc2tzDQouLi4N
Cg0KDQpJdCBqdXN0IHN0YXJ0IGZldGNoaW5nLCBwYXRjaGluZy4uLiB0YXNrcyB3aXRob3V0IGFu
eSBkZXBlbmRlbmNpZXMNCmJ1aWxkLiBMb29rcyBsaWtlLCB0aGF0IHRoaXMgaXMgZXhhY3RseSB3
aGF0IHdlIHdhbnRlZCB0byBhY2hpZXZlLg0KDQpMZXQgbWUgYXNrIHRoZSBxdWVzdGlvbiBhYm91
dCB0aGUgcGVyY2VudGFnZS4uLiB3aHkgaXMgMjglIG9mIG1hdGNoPw0KDQpSZWdhcmRzLA0KQW5k
cmVqDQoNCk9uIFRodSwgMjAyMi0xMC0xMyBhdCAxMDoxNSArMDAwMCwgUm9zcyBCdXJ0b24gd3Jv
dGU6DQo+IA0KPiANCj4gPiBPbiAxMyBPY3QgMjAyMiwgYXQgMDk6MjMsIEFuZHJlaiBWYWxlayB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IDxhbmRyZWoudmFsZWs9c2llbWVucy5jb21A
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gSSBoYWQgc29tZSB0aW1lIGFuZCBt
YWRlIHNvbWUgbW9yZSB0ZXN0aW5nLg0KPiA+IA0KPiA+IExvb2tzIGxpa2UsIHRoYXQgdGhlIHBy
b2JsZW1hdGljIGNvbW1pdHMgYXJlIGhlcmU6DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5l
bWJlZGRlZC9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvNDFkN2YxYWEyY2M5ZWY1ZGJhNGRiMzg0
MzU0MDJkNGM5YzBhNjNlMQ0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3Bl
bmVtYmVkZGVkLWNvcmUvY29tbWl0LzZlMmNiZmM1NjFkYWM4OWJmOTE4M2QyNGQ5MGU1MmY3ZDkx
MTc4MjYNCj4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1j
b3JlL2NvbW1pdC8wMzBkNTZlMmU4ZWNlOTM0NzJhZGM1MWZlNDY3MjIxZDg0NmM5YWMwDQo+ID4g
DQo+ID4gTWVhbnMsIHRoYXQgcmVjdXJzaXZlIGRvX2J1aWxkIHRhc2sgaXMgbm90IGJlaW5nIGV4
ZWN1dGVkIG9uIGltYWdlDQo+ID4gbGV2ZWwgYW55bW9yZS4gQWZ0ZXIgcmUtY3JlYXRpbmcvYWRk
aW5nIHRoZSBtZXRhIGNsYXNzIGFuZCBpbmhlcml0aW5nDQo+ID4gaXQgaW4gcG9wdWxhdGVfc2Rr
X2Jhc2UsIHRoZSBpbWFnZSBub3cgY29udGFpbnMgYWxsIHRoZSBtaXNzaW5nIGRlcHMuDQo+ID4g
DQo+ID4gSSB0cmllZCB0byBleGVjdXRlIHRoZSAiYml0YmFrZSBteS1pbWFnZSAtYyBwb3B1bGF0
ZV9zZGtfZXh0IC0tcnVuYWxsDQo+ID4gYnVpbGQiLCBidXQgIi0tcnVuYWxsIiBkZXN0cm95ZWQg
dGhlIHBvcHVsYXRlX3Nka19leHQgdGFzaywgc28gaW4NCj4gPiB0aGlzDQo+ID4gY2FzZSBpcyB1
bnVzYWJsZS4NCj4gPiANCj4gPiBTbyB3aGF0J3MgdGhlIHJpZ2h0IHdheSB0byBnZXQgaXQgd29y
a2luZyBhZ2Fpbj8NCj4gDQo+IFNvIHRoZSBnb29kIG5ld3MgaXMgdGhhdCBhIGZldyBvdGhlcnMg
cmVwb3J0ZWQgdGhpcyBpc3N1ZSBhbmQgYSBidWcgd2FzDQo+IGZpbGVkOg0KPiANCj4gaHR0cHM6
Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDYyNg0KPiANCj4g
QW5ub3lpbmdseSwgbm9ib2R5IHdobyBzYXcgdGhlIGJ1ZyByZW1lbWJlcmVkIHRoaXMgdGhyZWFk
Lg0KPiANCj4gTXkgaHVuY2ggd2FzIHRoYXQgZGVwZW5kZW5jeSByYXRpb25hbGlzYXRpb24gbWVh
bnQgbGVzcw0KPiBkb19wb3B1bGF0ZV9zeXNyb290IGNhbGxzLCBiYXNlZCBvbiBob3cgdGhlIGVT
REsgY3JlYXRpb24gaXMgZG9uZS7CoCBJZg0KPiB5b3XigJl2ZSBpc29sYXRlZCBpdCBkb3duIHRv
IHRob3NlIGNvbW1pdHMgdGhlbiB0aGF04oCZcyBhbiBpbmRpY2F0aW9uIG15DQo+IGh1bmNoIHdh
cyByaWdodC4NCj4gDQo+IENhbiB5b3UgdGVzdCBzb21ldGhpbmcgZm9yIG1lP8KgIFN3aXRjaCBi
YWNrIHRvIHByaXN0aW5lIG9lLWNvcmUgd2l0aG91dA0KPiB0aGUgcmV2ZXJ0cywgYW5kIGFkZCB0
aGUg4oCY4oCUcnVuYWxsIGJ1aWxk4oCZIG9wdGlvbiB0byB0aGUgYml0YmFrZSBjYWxsIGluDQo+
IHNjcmlwdHMvb2UtY2hlY2stc3N0YXRlIChsaW5lIH41NCkuDQo+IA0KPiBUaGFua3MsDQo+IFJv
c3MNCg0K

