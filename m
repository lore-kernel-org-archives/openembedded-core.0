Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00151CD342A
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 07:24:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web11.17781.1725348274904403341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 00:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CtRxMsN4;
 spf=pass (domain: siemens.com, ip: 40.107.20.87, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M54mnyi/Sr6SKTikOQywNG6wYV7DXAJ1yaYZvqQVEtBtPARlehOGhD4MeunPoxS1Lv7FCbs9Sdv1pamGqrtvpbN2fs2XwHnAW4xdA1eAmcF32Ln19G4YeiVMM98UIbTFg2za2I93QtQ0juXG7MYWHmdy/+8SmNUdQJXJywf2DCqtbn7sMFJOT3iXPIXEobXu65FNL2RME767S8q1Htzmj/7oTnkyyyuxv0e7iTRLkRYys9P2a5Z3+V+X4on2gqojTUEFwjuOkasFhw3OKn1daCB0O1rAo3XDBistRZJow/AX/DHvdgjvMAF0+F9WKbGhsFI4Q1XlWgUfwwP85eI0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMrg+lEBmhArJyEdNQwYWDqSdBd0Yz8Q2MHHM08/bb0=;
 b=r2MRGwYmE9L8sojYkeKL/phZTS5aHpKQhxVkNp8NSObfLdAXbGJuJHQ4vDJlwOAe7/IKjOypEFE5EynsyGDPlxm6lPctlXIXOMOjTxoCT5vu52co8o7wuDfgRCm1X2z8Ut3aLzsWURlhB7Y0OyZea4YwN6QcmucwZ5/0+P/vxtl9A3DpMPwsI+01UpsZiqT+5sDPsXnSp49XzF2HbbkcfgRYJ3sCuas4jfA6KYjsu0OrnDjjpEhOJA+3kDaz49UhMYlMwxdwVNEOMDH6KhXnxwQDaCesJVdXaMeG4pBjgs4xykiTgTJ1FLdFMMNMrGj7TdaHmkl8Q5LJ6/kBM6GL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMrg+lEBmhArJyEdNQwYWDqSdBd0Yz8Q2MHHM08/bb0=;
 b=CtRxMsN4Xytdbe3cHyDuq1Qxj8aXaXBbpVCB+VId6Yi1vP9HbgOao7y778ZUud3Ys3p+gbJ4mjYACzPbxe19SSKmXhZCfQ2WpMwExemLIjHX4UlLcDf0NTywUWg2bNX11qHvqcLg6zqHeo3nPhTPIGGiZEY6y9id2U07PiUchhm63HoRTqd+JE5MUUHtHPx9zLbfIRXVU6W8/Y1mICQhQ4vnumsXyfYDQ9Z1DQAZOj+buGWvJZaItibwOhFisVm/7Q5qXPYH8LiVHGxDk9aZ0FpJp1x7SZywJuNc6wPDqMnqqiJPwyCg/wxm1b57xSjuXyO1ZHNlaiQQFv9qLS9TXw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB5714.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 07:24:31 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:24:31 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v3] kernel-fitimage: make signing failure fatal
Thread-Topic: [OE-core] [PATCH v3] kernel-fitimage: make signing failure fatal
Thread-Index: AQHa/VM1vR9AjWxWoUKQR+mSdVQbTbJFk3SAgAAWhwA=
Date: Tue, 3 Sep 2024 07:24:31 +0000
Message-ID: <00d698a7928a1ed68b00343aa627181c0ce4797a.camel@siemens.com>
References: <20240902161307.1222507-1-alexander.sverdlin@siemens.com>
	 <ZtamyY45LZ_6pYw1@nuoska>
In-Reply-To: <ZtamyY45LZ_6pYw1@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB5714:EE_
x-ms-office365-filtering-correlation-id: 52fd6bb8-3a83-4f69-500f-08dccbe973d5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dm92ZURlZWpRNnVhSENqeDlGTHdzM0ZRRjBXVlZrdzlIK3RQWVpRU2tSUkZx?=
 =?utf-8?B?S2N5b2hzZjVJV1hrUFdpeWJFS3RScGZ4SXlFMkZMMTFySjJ3bHY2ZjlrVUUv?=
 =?utf-8?B?NHU2VU1rUzAxcDZWcXA1WmNOcDJ5ZlR0cmt0QUwzTEx0RitRRUtpR3V0TE1N?=
 =?utf-8?B?TVNKdk9jdmo1c1ltSTRnSUV2aXVXczFBY3FCRlI1WStNNGk5dVRuWDc3RE44?=
 =?utf-8?B?dnBFMnVPZDVRWDIzc3dycXBzVWVGSEl3U1hVeUVTblRDQ1hLZHNEbzM3dHB3?=
 =?utf-8?B?QzBpMFIyUkJjNmE3SkFlNnNmcU01ZTVucHlMSU1zeDRuL0Z0RDAwelNKdXpk?=
 =?utf-8?B?dGtuWm5KcjdqYVRXWTRQYTNYYW9PbDJUdFZDMDh5RFVuSEhtdlRXRHdLZDl5?=
 =?utf-8?B?d0lSZTllWFAyRFJ0dWp4TjEwS2F2Y1pHQytRNzNEclZaMFRnQVlwVzVBMDMw?=
 =?utf-8?B?Q3M4bUlyNm1pOGYzRWlMZ2JKK25wd2tlR0pXbVpTQnlhY2JYSjhqeXBqTFhN?=
 =?utf-8?B?VVVXaElCdGpzbVBVWXhaOHdhZUxmUnZHSWRib0RkR2M5Q0xnSk9yVzZZTHVQ?=
 =?utf-8?B?aUZoak12MXJudENNWHdrNDhGZjZTcTdXLzdKY1AySDBUVHBQcWd3YjVYZXFO?=
 =?utf-8?B?MDNiQ2JXYWxMeUpyWXNVaU84bGI5QVFydHV2alFBbFIyOGJ1bUpXejhNRmJO?=
 =?utf-8?B?VHdDcVlQRmZtUUZCZEdtZXBKK2dZVm5RQ2xhL1BrSU1waC92cEhVNUdXbzBP?=
 =?utf-8?B?NVAzazZTM25Pa2VyeDI2bzgzN0ZYbUhlQmZtRGlKSnBzZnM5Y3hvSWpIQ1Bx?=
 =?utf-8?B?eERla3M1MXZRbnVtL3FTSThHTEg4aHZweHZ5V3RDYTUxcE5ublhrT0hwamZO?=
 =?utf-8?B?UUF4TGtvaWVFUXFnK2Fmbk9MMjFKVDdyTzJ0NnFRVVlGdTRvUFJ2R1gyMTVH?=
 =?utf-8?B?bDhyYVFEWDQwV3BPc3BibGNJcVdWR0xzMjRWNTkwSnFhWVdaTWpRQS94dUNQ?=
 =?utf-8?B?T3pVa1lyQXhCeG5MRkVmdEV2eEF3bTNUSnFWMDIrV3RVV2pRU01SeXpxQWt3?=
 =?utf-8?B?RVZheVZaQm9ENE9pT3YzUERuMm9yUnEzVUgzMk9qWTNYR3B1dzJaRkFQbGh0?=
 =?utf-8?B?dHI5OWNrRGQ4ZzB2YkhxVVdKTDl0MlFJRTVPTmJ2dzFNU09hQ3ZTNkcrVlBh?=
 =?utf-8?B?NWx3anJubFZSTXZ6SXN3RldHNTgyR3N0eCtiK2dxWGt2MzlYaFd5TjBqSE4x?=
 =?utf-8?B?blRVN2lYeVNJbXBzeFFwc2xCTFZRbUgxTnE1Y05GRTlnN1RpMnNLMGZ1Vy9V?=
 =?utf-8?B?YmZITGFHb244b2EzNW9jOHA1bFFENHVYd0V5QWw1N0t4QVVLZUxGTGhHZjRy?=
 =?utf-8?B?c2xaSW56bXdwODYxUE1neDg4NVNseWZMd0hmQUtuV240amloTVF5dTQ3YXZh?=
 =?utf-8?B?eWtEdEs5ak1RaU1KazNGc1dMYTd2WVh5aFUrZDZYUWdVbDBtV0NiaXBMbTJQ?=
 =?utf-8?B?bTdoL0kreUhNajJiV0FQTXBWLzFDSjVNNnRvV2tHOUNSNTY0UVJ0SzVqTFpS?=
 =?utf-8?B?alVRckJURy82UjRqSkZUOTdDaUw5S0lDeHI5OVpCK2JqZ0NoNlEwTGVBNmhh?=
 =?utf-8?B?RWZzeVZUWEJRcFdFZnltb29uRzdUSThsYXlnaFoxUmRNZnRPYWNpMFFVTTY0?=
 =?utf-8?B?RWpVd1lwNkF6RW0zMWRtamRHM3pNRDdKbGxvbHRoWXlKVkFLSWVCb055RTJu?=
 =?utf-8?B?dmQ4VWF6SWpBNG12R1VpY1RTVkh6WkZobDdvMU9zNE9lMC93VS92SUVqbzhT?=
 =?utf-8?Q?NBbXg3Eh82mc2KKKCoJgHfkKEUPthZBI6rghs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjFuQUsrSlgrZ3ZINkNLclVSelArN0FtY1QzM1hWWGlhUUZQV3dvLzdiL2hJ?=
 =?utf-8?B?RXhTYytla01QRURsQVcyM2tOdm4zWDd6SU9OeWJMZUpWWVpFMmN6SXdyN0RV?=
 =?utf-8?B?VW1FUDVxY3pMZ2xPTllwZE04aHdrT0hzcXhzQm8wT0g2QjlYcW1oYkNFV3o3?=
 =?utf-8?B?RHAwMG83aVlmdlc2M3g4aTlMR1ZPN2RBUjh1ZVFJUC92eHZQbVd3anpIbUps?=
 =?utf-8?B?Q0xtMm14Qjk4SFBzc1pBd3FMSGdPVU1zN205Yk8yY3FDS0ZIYmhsRXBIVm1y?=
 =?utf-8?B?ZkdHRUVVam8rcnAvN1M2VU1ueWM4SUh5WFZxQWtwQlhpRlRpaWxMVEc1YXh0?=
 =?utf-8?B?SVBVaEFqaUNieTI3U00yeU9Ld2lDV3UzZlNKaFFSeUpzS0lIdXFjSy9VQjR6?=
 =?utf-8?B?YlhMK1FUajVvdmxzK2JaTkhnK0p6eWR6MURWT1pZc20wbGVjR2x1c3hvSCti?=
 =?utf-8?B?WXdCUm4wK21KUW5GZnpQSUlTV0NzYzdoQk0zSUhQcGxrckFtclhMQ3poS0F3?=
 =?utf-8?B?TXRuMEptc3VzNW45TTE1aUpDMTU3cnMwWjg3WUJkalNkb3pxT1FoOVgwSEQz?=
 =?utf-8?B?Y1A4eGxXRER5ZGR6QVhFY3lXd0t3OW5xVGdXUnZObUQ4K0FEQTcyN2lDZnRw?=
 =?utf-8?B?eGFOWmdaRCtiMmZJQ1hoN2dpV05OL3RaMUdOb21neFJGWmN0akJvSEdyaFFV?=
 =?utf-8?B?S0VlWVh4akZNdnVvK1ZCemVGQWNWMGtRdFdqMVBMOUV2K3VVQnFmazlFc2xq?=
 =?utf-8?B?WnZBQitKQWF0bEZCelA2R3l5RFlQLytwS0tMSnh2QkxrczlYMUszTXk2WFdG?=
 =?utf-8?B?YmkzMldkbmRyeDJDT0tIWU1OYUt4OHFhdW02aDhFUXc2ZWJ3VXpHc0pKanRp?=
 =?utf-8?B?MCt4YXp5WUdSR0QvWHRpS3p6akN0TjhHckZSUHBoZXZ1VGh1SFRybXhmaDN5?=
 =?utf-8?B?UHZacHd1UFlwNllqSHh2bTU4QVM5SkYxZEtQZ2o1Vi9vaEUxNjlzSWYzYnhT?=
 =?utf-8?B?UTZKTk5pdVkvU1RwMzFHeTlHazZqV21OQ0JQWEFXOU03VnZLQTlQTEQ1RURT?=
 =?utf-8?B?dU1ZUjR1VXBCbU9tYzh0Rk5ObFZNU3dWZ2IrYnVCZmMwcmZtb3hkVWZFYTVz?=
 =?utf-8?B?UHNOT2hTRC9wRUd6RW9jVFkyTGZOcU8vNjUzWE9qRmdreEhoTS9jY1lZTlVW?=
 =?utf-8?B?RmRWc2V4d2ppQmhkWGg0STUvZXl5ZHN2TW8rdE1rQ2xubThHc01GcWJlM0Rk?=
 =?utf-8?B?NTZsVDVzeG5hVTVpc1NKeGRFSVNEazVEUEk1TjcxTFQ1QUJHVTVoOS9yOWpM?=
 =?utf-8?B?TzFUWUUyTXhQV1RmM2ZpR2N4VmdHVWZmZkNGejl5bUhTbndkcklMQ2htUGxX?=
 =?utf-8?B?dFE2and2aDVpU2tZdkJWbkxsMlA4YWpLQXhsU1RUL3VDbkFwdnZyRDkvTFpP?=
 =?utf-8?B?OG92cU5VbWlFZGlna2RFMmpIRmtCRGZRRnIwamIxbS81RUV2cS9OQWpzU1RP?=
 =?utf-8?B?SFRsbnRRaklTZFdNSGRlL25HS2tUaHF0UGhxT2lVVWhVcmU0QUlxWS9ZeDA4?=
 =?utf-8?B?MGFxdGpsbWpOczVucUxLTkVTRDFIL29CbTlUSWVXUDBVTmliTGU0L3MxSlp0?=
 =?utf-8?B?QUpxNmFRQTNHK1ZzczNXYjViZ3liK1UxRUtZSURpQkFNcDltTTVrVkZzcnZG?=
 =?utf-8?B?b01oYUJjMHBvNGxNVnpjZXNHZm1MeWxHV0szZS9tV1BoQ0JHQ1A2bTk3M1Fw?=
 =?utf-8?B?QktwUkxHcDdCc21tZHpiRS80TTBRVzRPYkVkS25CMnpsQkptZS8rMFhTdnc2?=
 =?utf-8?B?dkV2bnd3SnJGdHR4U2lPRGozSTRHdDcwYnlqR3hkTGY0T000K3BKK2NRMUFq?=
 =?utf-8?B?bkxRQlFzNGFVZzZ1MzhDNWhEZytwVmNnU3NPSG9WQ2cveTZZV3FRRVpxSDVK?=
 =?utf-8?B?QXlXN2hGVENueFliVUs4N1ptTGllUWttSE5talVpKzdCOUF6TVhMWGM4UTJF?=
 =?utf-8?B?UWFGVE5jU1JMYVJORXYzUXBSS3M1Ky9QSlo5VW9ldkV4V2dUcmdTN0g1ek0w?=
 =?utf-8?B?YURCVlhyV1owZzlJbDdOcnFNMjNpYThLYndxblcwbUxSb2pMbm1ycFBhNWYv?=
 =?utf-8?B?T3JGU3VuK0R1bVY1R1R1WXRoRXlUZjh0K2h3empQSU5TVlBtNW1GNkdmWEdm?=
 =?utf-8?Q?lC5lmL7/JjaFk0mSpzdH8kY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C81AAF179603340AAD66E06102F990A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd6bb8-3a83-4f69-500f-08dccbe973d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:24:31.0662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4qvFysxi76FC0P6q65edLYMi2+0H7fqNaEV/Rb8Sba9KeYP6d1FdC/DUDVhDzW6lO0JS93HrUs7d/CgLWguTlh20j8J29hN0TDILSGAImM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204122

SGkgTWlra28hDQoNCk9uIFR1ZSwgMjAyNC0wOS0wMyBhdCAwOTowMyArMDMwMCwgTWlra28gUmFw
ZWxpIHdyb3RlOg0KPiA+IG1raW1hZ2UgZG9lc24ndCBmYWlsIGlmIGl0IGlzIG5vdCBhYmxlIHRv
IHNpZ24gRklUIG5vZGVzLg0KPiA+IFRoaXMgbWF5IGxlYWQgdG8gdW5ib290YWJsZSBpbWFnZXMg
aW4gc2VjdXJlIGJvb3QgY29uZmlndXJhdGlvbnMuDQo+ID4gTWFrZSBzaWduaW5nIGZhaWx1cmVz
IGZhdGFsIGJ5IHBhcnNpbmcgdGhlIG1raW1hZ2Ugb3V0cHV0Lg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29t
Pg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBiYmZhdGFnX2xvZyAtPiBiYmVy
cm9yICsgYmJmYXRhbF9sb2cgd2l0aCByZWxldmFudCBta2ltYWdlIG91dHB1dCBzbmlwcGV0cw0K
PiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBiYmZhdGFsIC0+IGJiZmF0YWxfbG9nDQo+ID4gDQo+
ID4gwqAgbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzcyB8IDkgKysr
KysrKy0tDQo+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwt
Zml0aW1hZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdGltYWdlLmJi
Y2xhc3MNCj4gPiBpbmRleCA2N2M5OGFkYjIzMi4uY2NmODQ4ZTY0M2YgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzcw0KPiA+ICsrKyBi
L21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdGltYWdlLmJiY2xhc3MNCj4gPiBAQCAtNzUz
LDExICs3NTMsMTYgQEAgZml0aW1hZ2VfYXNzZW1ibGUoKSB7DQo+ID4gwqDCoAkjIFN0ZXAgODog
U2lnbiB0aGUgaW1hZ2UNCj4gPiDCoMKgCSMNCj4gPiDCoMKgCWlmIFsgIngke1VCT09UX1NJR05f
RU5BQkxFfSIgPSAieDEiIF0gOyB0aGVuDQo+ID4gLQkJJHtVQk9PVF9NS0lNQUdFX1NJR059IFwN
Cj4gPiArCQlvdXRwdXQ9JCgke1VCT09UX01LSU1BR0VfU0lHTn0gXA0KPiANCj4gV2lsbCB0aGlz
IHN1YnNoZWxsIHJldHVybiBlcnJvcnMgYXMgYmVmb3JlIG9yIGlzICJzZXQgLWUiIHByb3BhZ2F0
ZWQgdGhlcmU/DQoNCkdvb2QgcG9pbnQsIEkgbmVlZCB0byB0ZXN0IGlmIEknbSBub3QgbWFza2lu
ZyByZWFsIGVycm9ycyBoZXJlLi4uDQoNCj4gPiDCoMKgCQkJJHtAJy1EICIke1VCT09UX01LSU1B
R0VfRFRDT1BUU30iJyBpZiBsZW4oJyR7VUJPT1RfTUtJTUFHRV9EVENPUFRTfScpIGVsc2UgJyd9
IFwNCj4gPiDCoMKgCQkJLUYgLWsgIiR7VUJPT1RfU0lHTl9LRVlESVJ9IiBcDQo+ID4gwqDCoAkJ
CS1yICR7S0VSTkVMX09VVFBVVF9ESVJ9LyQyIFwNCj4gPiAtCQkJJHtVQk9PVF9NS0lNQUdFX1NJ
R05fQVJHU30NCj4gPiArCQkJJHtVQk9PVF9NS0lNQUdFX1NJR05fQVJHU30pDQo+ID4gKwkJZWNo
byAiJG91dHB1dCINCj4gPiArCQlpZiBlcnI9JChlY2hvICIkb3V0cHV0IiB8IGdyZXAgLUM5IC1F
ICJTaWduIHZhbHVlOlxzKnVuYXZhaWxhYmxlIik7IHRoZW4NCj4gPiArCQkJYmJlcnJvciAiJHtV
Qk9PVF9NS0lNQUdFX1NJR059IGZhaWxlZCB0byBwcm92aWRlIHNpZ25hdHVyZXMgZm9yIHRoZXNl
IGltYWdlczoiDQo+ID4gKwkJCWJiZmF0YWxfbG9nICJcbiRlcnIiDQo+IA0KPiBJcyB0aGUgcHJv
YmxlbSByZWFsbHkgaW4gbWtpbWFnZSBzaW5jZSBpdCBkb2VzIG5vdCByZXR1cm4gZXJyb3JzIHdo
ZW4gc2lnbmluZyBmYWlscz8NCg0KSSdkIHNheSB5ZXMsIGJ1dCBpdCdzIGV4cGxpY2l0bHkgaW1w
bGVtZW50ZWQgYXMgYmVzdCBlZmZvcnQgYXBwcm9hY2g6DQpodHRwczovL2dpdGh1Yi5jb20vdS1i
b290L3UtYm9vdC9jb21taXQvNTY1MThlNzEwNDFmI2RpZmYtYjBkOWEyNmQ1MzhmOGRjM2FmZjJl
MWI1MTg1MzRlOWUyMDI2NzEzYjFmNDIwNGUyNjgwZDhhODQyNDRlMzQwOFIyMzQNCg0KQnV0IGhv
dyBtYW55IHllYXJzIHdvdWxkIGl0IHRha2UgdG8gcHJvcGFnYXRlIG5ldyBta2ltYWdlIGluIHBy
YWN0aWNlPy4uDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2ll
bWVucy5jb20NCg==

