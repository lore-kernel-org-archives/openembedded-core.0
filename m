Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F185C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:16:27 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.74])
 by mx.groups.io with SMTP id smtpd.web09.1023.1652811382349890431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qk/n99iq;
 spf=pass (domain: siemens.com, ip: 40.107.5.74,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP79celvUZR/c8KV8D+pCow531kboPeSQc95R8v8fbbGRU0rlVp3dkqVY6Op2tj4R1+rIWmsXtlPy1GE5GgNlrrZbn8FMQli1ZrXV6SDY9vAUbQovjvhZ9A6V2z4couOLZ91XQdRj+1VPB/oG32cFSlEsoOS+pN8O4FX9QJ/eKAKDyQyglVl/W6Qlj3vcrU5o4giafdMK00F+r0fdKBj96FEEzCOE8GxEA1gHedEbONfMsb3ZsPVpUvetWb2D39+e/cBSA+uebzpGEBE01YGE8daRWu1Ehp5O1/VKExnQs+Zdpt369oCmHeQ0PwtUgqc++FbNFQVtPoQA4rJ3YZsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duxA5FNgfs14xbOfgDNtq2hOBbxgqKZF03OeTo6G8Qg=;
 b=exVWmmlr6MTAsbkYWeopywu0VD4E5oERcnAQ+W2jO42SreSnCz4ZtsVQwo5dRlulO7RbTtJ1w+/C+mCfKmaFn5Im8fjnrRT9ykEi5UUF0CZcB0ygIfTJ51mkhE7S1bmc8xC0C915KNpbg7ieVgIk25U87nNxFIoauqW8nEL9DvkFjUAY++AKjSxQUrvq4coTcMUnLNoB1mSISypEQIaH8uV7p0UdC8QxYst5WQtAh49idObtxpi8KgL7UDQ5J2OMGd5q99hUpG5BsXClwu27V/NpEiMwOpE0q411RTxr6JGMfil9DM+0nqp9pjgITOGf1HkMxlpIQdMgW8BNbzvAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duxA5FNgfs14xbOfgDNtq2hOBbxgqKZF03OeTo6G8Qg=;
 b=qk/n99iqEQioJyBfZq21uG4zLSvjjg3fXqC/VODNN3uokg7YQ0cB+YxG1Bx7E373Jz4OIQpquKTZtMLGSak34VDK0xEWzl2n/lSXFV0ImhNNQVJsET6aaf2+l09+rlfw1L+LB1ei+E2R99+6anJkQQhFEvERALcgpxlk5xO7wyEx4EZHnCvt3jGYoiNnMEbxKt5RH75bX+w0LTxh+fLrDIcGzqsd4y9UQ1FHrgrgNVkXVufXbAvrYXnI71EAkDMqXJWdJHLlFiwSHYM9SSrkbQTE0dq2T52+Yj85FMqQP8CCAJIEpXAiiEhcxEL0T1lrvhO4az04EuMfHy+qA2Xsgw==
Received: from DB8PR10MB3242.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:f9::16)
 by DB7PR10MB2185.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 18:16:18 +0000
Received: from DB8PR10MB3242.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4d3d:ff68:c1fb:f682]) by DB8PR10MB3242.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4d3d:ff68:c1fb:f682%6]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 18:16:18 +0000
From: "Schmidl, Tobias" <tobiasschmidl@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"Vijaikumar_Kanagarajan@mentor.com" <Vijaikumar_Kanagarajan@mentor.com>
CC: "ch@denx.de" <ch@denx.de>, "Schild, Henning" <henning.schild@siemens.com>
Subject: Re: [PATCH v2] wic: added fspassno parameter to partition
Thread-Topic: [PATCH v2] wic: added fspassno parameter to partition
Thread-Index: AQHYahdk+lu36HT2X0ewrcRea9G3260jYDeA
Date: Tue, 17 May 2022 18:16:18 +0000
Message-ID: <09076afadfa0c49f65ea4d2d113fb9c6490f49ea.camel@siemens.com>
References: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
	 <20220515063600.777146-1-Vijaikumar_Kanagarajan@mentor.com>
In-Reply-To: <20220515063600.777146-1-Vijaikumar_Kanagarajan@mentor.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ab441c-61eb-436a-0e73-08da383156aa
x-ms-traffictypediagnostic: DB7PR10MB2185:EE_
x-microsoft-antispam-prvs: 
 <DB7PR10MB218579CFBEA1E06466C34CF8A9CE9@DB7PR10MB2185.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4TyBuQOK4Le49FHHJarIR3p1w7kQdo3ZPXqw0QR9CQd+dXPbk2iuy/DEGjf3Xkmck3+wlfg9CGgePY8nZ411GkBNSnUH9VlvzY7OIinujB6fmCm49btV/Us0MPq5MUtHfNIcyBt8qk1SHFrllqTPxa7gxTTOPLI/hogvvBONlGLjtCRfke4Frk82A44xSQ7zs6ljT1Shf2gKQEL2mrWoWiYZTOta7bRg2xPpSJc54o1oxSvu+zDXuDkgOkqgEBO9EooYFkVUikJ3XvKiTeHPJVvUnMlWfCbnYvMvL4L4nl2plgHm3lWM/GZjojG29mmJCacKLnGKxaJKbCsPlSJdX5g5IMMwP0sxLSs9VDc5C8nSUMlUHXQxK1p7yOB1MznAAj0HELtH07OPT6oVS6FUtUlkwaLOpKfy2tWmWIe3ixydRplDbC983jXdBGOD4JAovKJm15d0pZKZvkeMfL6XM1KMYS7KGqLeIAI+tIuq90dDQk/FdP/H0BusdJ5lpuf7eNs9bP2cIEkYUQHUYRCsxLsZXd0ddyrNTWC7fPXKG7STSQUNEYqCBJcLVhQ+sPdkJC0NbF3uHqmZTNPVvEa3MH8I6DGg25gOPiagrpBZtZPuH2V2m6ZY/5TfBTFH5m7lc/H9GIKND/3VlwQWeWquj6rV1PcvT0D4pDcN4AIXqroe5u8oMzB4PCn2bpS5VxKbnY2ip0mkaho1MiaR7Jv9Xw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3242.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(5660300002)(2616005)(66446008)(4744005)(6486002)(4326008)(107886003)(86362001)(6512007)(76116006)(83380400001)(66946007)(91956017)(66556008)(66476007)(64756008)(82960400001)(110136005)(8676002)(54906003)(122000001)(38070700005)(6506007)(498600001)(53546011)(71200400001)(38100700002)(36756003)(2906002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QmdUOUNsTmhYS255ajJ2S1kxdVA3OXFvNVpHREU0YWRJVTduQTZVZnNqL1FD?=
 =?utf-8?B?TWlRNFlOWi9qUkk1V3diT1F4SmZ4Z09NK2hkcExGVGo0MFRrUi9BRSs2ZWtU?=
 =?utf-8?B?b0lwc1VTdThYdzgvYng2SWxVanRtNTA3a2dTMnR2Qy94UWtJUHF0VGNKcFJU?=
 =?utf-8?B?NFQ4aG1vVVorOFdxMnUzSWpYczI2YmJiQURyT2RlVjZyUkRORHBGeWhjQnc0?=
 =?utf-8?B?UWJkV2RkdUJFOFlqNlVXVHNMNkV1ZWEwSjJFaXd4TnZENzJBSEFJNU5FRjBT?=
 =?utf-8?B?dkUwclRXdlVTR1loMElqNkRpU3hhTmx5Wm9WZ0FocVQzWk5ML3pIRjcwM2sx?=
 =?utf-8?B?SzRUK1ZIb2VEUVZ3aEFJS1AxalNuOXZVbFFUYzVkcERWcXBQait2cllFYVNK?=
 =?utf-8?B?dVMvTzh5TExpSFNFeGpMNTNQU3B1Z2x1N01uRVI4WE9PS3g0bGR1RzZ4YzZZ?=
 =?utf-8?B?aHN1QUhyM1kvUjBPSndZL2pIRHFKRnNVai9ZQmQrYXc3Mk5LSXhIdGQxS0Mw?=
 =?utf-8?B?NVh6UWtacFNqMVVqVHhCWTJiREQ1RHh6a2srM2FwaXJmNDZ4cXFqZ1dZWDZ4?=
 =?utf-8?B?bXExWnBSZDdLUE1jcmU5M2phZUo3cHBSV2RYNWJQR0FKOTl2RWlTYTE5RmNZ?=
 =?utf-8?B?RHRhTUhiSUFoMzhDVSt0Tnh6NzR3RUgrVG50eGI4Q3N5bDVlVzI0Y0RteUZV?=
 =?utf-8?B?dVR4VDJhVFZzRWlHb1Vua1U5NXYxRjQweXJxb3FzT29BUmoyWlh4VnFjMVpz?=
 =?utf-8?B?b3ZSM1Y5RGNDT1FsUlJoTnhzRHdWZ083YVIvaEx6OEF2LzdsNkFQVU1FL0Na?=
 =?utf-8?B?dFFjWXR5L21zWUl6VGlVSlZ4TlY3NFBFQkhCUTROUFF3cElGK2NIRlV3bUV6?=
 =?utf-8?B?WDBPblNuMG5wS01UdDBac3pMNXFmWTczcU1rVS92aGNVRGxjT25Xanp6aFhv?=
 =?utf-8?B?UTZTR3pKcENOY29WQ0VqUWk3UndBQytPdFVKRnpSTHk3VTZFQVRoc1RDUFBK?=
 =?utf-8?B?eVV5Qk1QZStQVDJTdVdpQWlpZUlDRlBVbExqS1B0RUwrUmV4TU84ZndNUURJ?=
 =?utf-8?B?YTNacjhqckxycmV2YUpxWVF2QlhlT0ZIa1FTUzByMSs0eXFkSWVmTDZTWjdk?=
 =?utf-8?B?eEgzNDU0TU1xQUF0dGtCZVFUUGJUODZKLzYyRTdCTjVtaWxtSGladGZpZUFC?=
 =?utf-8?B?ODc1TWdnYm9lczQ4RmtHZHN2VEhnUll3ang4TzJHbldMOSs3NDVpdDlzSFln?=
 =?utf-8?B?b3VLa09CY2VBVkNQVXVMWXY1NE4rNDJzQml1bC9EUndvWDJ1RE9SOHNMYW1Y?=
 =?utf-8?B?cXdWRzFIeENlYkxaRTU3ZjRXUWRiMEtHYWtlZm1UWmMrOW9TQ3BsUHEwZDhF?=
 =?utf-8?B?T1Z2cUtWcHduSC9iVjlhRmN4QVlYU3FpekRnSWMxeU5UWDlTQmNTQkEvRjMx?=
 =?utf-8?B?bWFmaW9Ca2E5a0xDY2tIZ202U2I1NzhEUUVvWGxqNHJLd0pBdEFpYW9KTzF2?=
 =?utf-8?B?bElWeDdVR0N6Q0p6bmFOcEt1clUyT3JNUXlISUFSR0NkUU8wTWNIZjh1aFo1?=
 =?utf-8?B?YmVBVnRLWGYrV3podVRYeXc1UjRjNm1XZXB4RmpsQkhxMEZWY0JXT2N1a2Za?=
 =?utf-8?B?L1dGK1Zkdnl5ODhFZ1NuVjhIS1V3S1FWOFJMOXlWVkxIZGRMM0lCTVVXQmxk?=
 =?utf-8?B?bk1iTkNIZVoxRFUzaUdHeXgwdnc1aVBoMnljNHBtYTd0Snl6VG9TNUVxWm55?=
 =?utf-8?B?MjJsdW1uWVZSdjVlaXhvbVkxaDB3ZUptUE54OTN3TTlJakRLTFM0aDRtamd6?=
 =?utf-8?B?WktXaWJZeDVlRGpyc2RzdzlQUzcrQndSY2I3d09vbW5ZQWxGWVAzdXhsSmJZ?=
 =?utf-8?B?V0tZb0xZMmJidnpGNW1CNEE2ZXIxRzFqNm0wVHlYTDIwSEkzeXR5a1RSdkNO?=
 =?utf-8?B?VENveEV1Q25kWmtBU2JDWjF5UWUreWxIR3lxelp2MWxkL2NzVEY3UnhwNFpM?=
 =?utf-8?B?dk5YY3VlLzBaVEYrVFRzMTRqOGJ4VFBRY3lwT0FFMk0zUnhlVWUyUHJGcmVE?=
 =?utf-8?B?OTczbHBYVVN0cjdtalZ0Yjl6eEdnQitWc0RRdkR6ZVR4eFdKWE0yMjNaSE1H?=
 =?utf-8?B?eks2czFlc2dpZVhuTHRYNzNCVDM1UjV5YzJsYSttZFdza01DMVVub3NjajJ1?=
 =?utf-8?B?OERNcXJDUjN2cTUyc0duaHgxdDZDVjZQbklhVE9MS2pXdjFoeFFpNDdKUTZm?=
 =?utf-8?B?ZVRLLzFRSDdBZVYwMmtwSVI2OGRLcVVlWFY0VUdpNmUrMmR5ZXNoamdVNk45?=
 =?utf-8?B?aU1rMEYwdU1UeE91a3B1T1J5cWVqanhTNURPc1lMWlVnTVhvSk5uK3QzcTEw?=
 =?utf-8?Q?hCPVOhdLa81ugKZwXu8mlzJ/U/dFcmujgf/SRCmbZ0XRr?=
x-ms-exchange-antispam-messagedata-1: ifdMqRRyhuU0L219cTVdVqYahCunsZYfg08=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D2EAB26C0C765419A96B2238A52EB4E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3242.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 66ab441c-61eb-436a-0e73-08da383156aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 18:16:18.4416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vgrIdgcrjgsbHFOpiLkZm/Pu96yVtwA7GXqDwZJOWENp+Pr0tErM8SpFLpSCfnfa/3uirW7aYv7zNjVKijiGoUYIc15PlikqM2G82rOPVJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:16:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165743

SGkgYWxsLA0KDQpPbiBTdW4sIE1heSAxNSwgMjAyMiBhdCAwODozNiBBTSwgS2FuYWdhcmFqYW4s
IFZpamFpa3VtYXIgd3JvdGU6DQo+DQo+IEZyb206IENsYXVkaXVzIEhlaW5lIDxjaEBkZW54LmRl
Pg0KPiANCj4gVGhlIGBmc3Bhc3Nub2AgcGFyYW1ldGVyIGFsbG93cyB0byBvdmVyd3JpdGUgdGhl
IHZhbHVlIG9mIHRoZSBsYXN0DQo+IGNvbHVtbiAoYGZzX3Bhc3Nub2ApIGluIHRoZSAvZXRjL2Zz
dGFiIG9mIHRoZSB0YXJnZXQgcm9vdCBmaWxlIHN5c3RlbS4NCj4gVGhpcyBhbGxvd3MgdG8gaGF2
ZSBwZXJpb2RpYyBmaWxlIHN5c3RlbSBjaGVja3MuDQo+IA0KDQpJJ3ZlIGZvdW5kIHRoaXMgdG8g
YmUgaW5lZmZlY3RpdmUgZm9yIGAvYCwgYXMgdGhlIGZzdGFiIHVwZGF0ZSBpcw0KZXhwbGljaXRs
eSBvbWl0dGVkIGluIGBzY3JpcHRzL2xpYi93aWMvcGx1Z2lucy9pbWFnZXIvZGlyZWN0LnB5OjEy
MGA6DQoNCmBgYA0KZm9yIHBhcnQgaW4gc2VsZi5wYXJ0czoNCiAgICBpZiBub3QgcGFydC5yZWFs
bnVtIG9yIG5vdCBwYXJ0Lm1vdW50cG9pbnQgXA0KICAgICAgIG9yIHBhcnQubW91bnRwb2ludCA9
PSAiLyIgb3Igbm90IHBhcnQubW91bnRwb2ludC5zdGFydHN3aXRoKCcvJyk6DQogICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KICAgICAgICBjb250aW51ZQ0KYGBgDQoNCkkndmUgY3Jl
YXRlZCBhIHBhdGNoLCBvcmlnaW5hbGx5IGZvciBkaWZmZXJlbnQgcmVhc29ucywgdGhhdCB3aWxs
IGFsc28NCmFkZHJlc3MgdGhpcyBpc3N1ZS4NCg0KS2luZCByZWdhcmRzLA0KDQpUb2JpYXMNCg0K

