Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF07AC369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 13:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.web11.18602.1744808461411451543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 06:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=K9jPPxSC;
 spf=pass (domain: axis.com, ip: 52.101.66.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkVvKbIS7PAh1nVNu/RJ6GNWxCvv91H4nkp49/b5hVIsPWPUvhJ361dh3BHd/LlVtS+Qs/ptdU5UCsqV3o4cT5LVZjYyeZisYyV9tz9e3Ckb6gXItKWFsnviI0L9aB3+G4hhUuC4psCghXbfQwVQD98HDIidry/oecjU7f3X/JN40ckZy32YpXysgwoFnlO2yym90w6ISg6h2kAz2FQRaflFWoLRp35SH9ZLOBXI66y5vKnrYBCLYx+mRXXEqZb5KjJmhTnLfjv63cQJyNtPGPHizXIUFjz/Dy6oMN/30GbA1StKcODnf3XLJUoYYbz5TSJgS0WdO0u7FcFN/owbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b4Oi5jyNFB1DJnF2Pg9zJlh9y0cb9zhUdAf7Hb1L7w=;
 b=Us8CdDtCbFSSAk8PETlF5KtcCeay+WqsaWc40bW3yZmzYCQhuZUcsLquM67NOGrfYbrQ62kY6L43nMtO9r2tCuhrcxapZT8WnzxqGQeWlcyONvodKbstaV4ud9WA4MNUOFLQ3liV7lCRjfwsMBISxmg4gWqDXjM06LiEzYYRvtslpFZFPQptJmvHLhXh6JaqxfXbJzle72wTF8TXfuRf3ABJnUMXsMzm6ClTSnWUHtGnfpfbBnmek3RwWCvi5kLPTgYxVcxKYYZP+RY4PHH0Npzh4wHhlxf4t2nKQTvxW3NO3bfO1aJpPQ8Im0Hn3aoML5+sbFd89tc0yENdegxIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b4Oi5jyNFB1DJnF2Pg9zJlh9y0cb9zhUdAf7Hb1L7w=;
 b=K9jPPxSCejb2aunnK0HXDed9JuOLwN8SB1OLQQ8df+qkGyLAcMlnKlGeV2+yf8DZxZ1EMiXjZVvaWOVv4Yqj+En2xPw5F/ehf7EYqqKjTb6lF01tidm5/DxjKJedqT5q7eG8CAPRmFmWQVAAxQbdhR4B2CwFHZWo28eXzNCXFIc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6303.eurprd02.prod.outlook.com (2603:10a6:800:192::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 13:00:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 13:00:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "jan.kircher@leica-microsystems.com" <jan.kircher@leica-microsystems.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Proposal: skip debug builds of native packages
Thread-Topic: [OE-core] Proposal: skip debug builds of native packages
Thread-Index: AQHbrq5FAJsS+xZyNUKpUm+vQv2Rz7OmQKFA
Date: Wed, 16 Apr 2025 13:00:57 +0000
Message-ID: 
 <DB5PR02MB102139C9D2A02EE8499251479EFBD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
In-Reply-To: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6303:EE_
x-ms-office365-filtering-correlation-id: 826f16cf-6edd-4d2c-f878-08dd7ce6bae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|3613699012|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZHZ3Kzh1VUVncWRITTBSNzFKQ3JvSW9qdzZXbDRUNTh4RjZMdjc4WkZUcVNz?=
 =?utf-8?B?UThHNTRxSFNpb3hhRkd1UVg1WnZ6UmE3SWc0TDMrK0diNkM2VG5lYlczU2dw?=
 =?utf-8?B?eC9lVEhkdGFSeHRnSTdmZ1FGc3Z0MVVZNFJFL0NDZUovOTZsTHJmWmdiZUF6?=
 =?utf-8?B?bXVYL29mS1QveXI2b0lPQnhtMExhZDBWS3lEeW9VcU5zT1ZIZHY2eVQzcXF3?=
 =?utf-8?B?YnRkMHVEQjEwU2R3Ui9ocTZsSzEwSEFuMFhBMWovcU5mMTFtK3FGUkRic3JB?=
 =?utf-8?B?cStUVmllSlNXN1h2THBtdkxwWm91R3F2OEl0dG90cnBLVElTM01zY3JDTHpr?=
 =?utf-8?B?WE5Sckl6K0ZzbGJlNnpTYmNTZ0tKVHJ4STNtMlRZcCtZNUZMeGJCZW5pL3E4?=
 =?utf-8?B?ZXhZaXdzTXY3OGlSR0VqUWd5cHh3djVNNjBsZE9hN1dBTEtQelZKOU5JNndI?=
 =?utf-8?B?WkJaRjdEWXFDVURmczZHSzlmNnV2aUNVbmhOWC9iR3djb25DY3RZSHgrdkU3?=
 =?utf-8?B?aG9CVmFmajZRaklvdnhjd1oxN2JTanpvbEN0S3RBV2J4ck9vU1czaDhVVlE4?=
 =?utf-8?B?WjVGdktwMVlDV044SEx0REdlWlkzT2dRU2NsMGFLbmFaU1A2WkppNWdQN0Q3?=
 =?utf-8?B?TFMvM2hMS05Qc05lMXZzbUxTdVBjRkhSaDQzcmdQL09BN3FmVndNUXpQNkpX?=
 =?utf-8?B?eDhiemJpTjBXR0tYK1VwUkllcDI1TElPcGI1MGdycWZwOVFQaVZMd09IWmtx?=
 =?utf-8?B?VzhFclBET0lEdFh1STlCUXJpNFAyV2hkY3lWWDVVOURtMVlyREU1bGZRS1Bi?=
 =?utf-8?B?RGJFU3lqbzZMemNBdzA4NWc3STRNMHNQUmtRcHEweVFoSi93T0l5TzREL0l6?=
 =?utf-8?B?M2pXV3hMUU53YkJmalcwQ0hBSnZTNlpQV1ZSbTVDN0pxdk9iN2E1QjNtK1px?=
 =?utf-8?B?aHY1MHhoZ0txdmNHYmljSzZ5SE1FUlRQc3NvRkkwcHZmdUU4QVNBWmI3Mklo?=
 =?utf-8?B?YnB6bDRwaTdiUFc2cEk3b0FXMldybkVHOExJQVBad0wwR3RQa3ZnMFdFV0pL?=
 =?utf-8?B?RlN3eGlEVWU4U3lOT01mUlJmWkNreHBrR094eWQ3YjdiNW5Hd1IzRERyNDVL?=
 =?utf-8?B?NFhxY2dJcUpPalZKdldSWWVoREliOHc4WlJPMkdXQkhKTWJMdHIwUnVSMy9Z?=
 =?utf-8?B?eHYzK25iNURPYWF1UndoRVVwbnVoN01DbTEzejZkT2Fhc3MzNkozSTNHck9T?=
 =?utf-8?B?QTlBaUVwVGpSZGxiYmxJV1N6RmtQS1hNUTNTSXZtdXdjam9GT0FYcVVOMm1T?=
 =?utf-8?B?UE4wN0RReXZlMmVKZ3lkZXZRTWR3QWE1Q29sUkVFeGZOdW9odHQ1M0ljRE11?=
 =?utf-8?B?a0UxMVJWR2J1a2hpcGlCK2hhb2ZPSlRGQWN2NS9SbHhRMlFIRjVERUdiamxD?=
 =?utf-8?B?TElsejRJeEhUeURXLzViOGxPOXA1VnRzTWZCOTVERnlLWm1wMUFwSTN5V2xI?=
 =?utf-8?B?anVyV2ZkVWZ4UlNqOWFZZndTNGNTVFQ5WFV6Ymc3dFAxYitrVDBFWVdaNVhI?=
 =?utf-8?B?Q2hSZmRqMk9Tb1d5ZTIvWlM0Nk5rVnYxb1BzUUhuUE43L2F0QzlxN3NZWkFh?=
 =?utf-8?B?dXpuVzFWNGxVRXBZN3VmbmRTR2J4UHR0eFowUmhZc2ROWG8zYnBQSTJZRHFh?=
 =?utf-8?B?ejdZbEltdCs0UHdibmhKSlJjSUJyUis0cndmdGRDSUZsbFdUWlR0K0tFQ3hS?=
 =?utf-8?B?S1l4Nm9EVnR2YXlGOXJOQzhaaUp5Um5YOEFreVNRcko2WTVYb2FiZEt2QkYw?=
 =?utf-8?B?aThYams5Z2lRb1RCS3FuVnpQM1BObW8rbHN5UXhzRGMvQ2VzZ3p1VmVpbGI5?=
 =?utf-8?B?VVQ0RUM4U2h5dE5KMjFLZEgyK2VpcGpKNXBQaW5yUk5PVWRFNmhXTWdNbjBR?=
 =?utf-8?Q?6ou7Ypfq96Rnoaql8QFeuoYcOLjLU7bI?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3613699012)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y2RKZTgya1VWNWF4dkEyWEQ5cCthd0VIekg1UlMwK2Y1SGpIdkdUSnFHSVNh?=
 =?utf-8?B?SjhQSkR6SUVYSUFDQjFMSk5CRkJkekE5Y3gzYXdSajd4d1lFMCtBMG01aEcz?=
 =?utf-8?B?d2F1cng1aGN5WVZRUmhLVHdnekQyTmVCOUpHb1BKdFpjTDJXT3k2RE8rTG5C?=
 =?utf-8?B?NTBKZ2JjNkpXN2cwdS9KbmxjdXl3aDMycUxhNFVSNGdiUXBNZnBjV2JYb1hq?=
 =?utf-8?B?ZFlRTDQzVmowUllFdEg5MC9hUWhTMzlqY0tKd0l4aUJ1S2ZWNEdUZXJIZDJQ?=
 =?utf-8?B?cFlqRXA0bWpOb0hNZXNEUzRwNk9LOUxkdGRJTGo1UXhnVndWcXBLMVVUODdI?=
 =?utf-8?B?dkhGRlNNWDVqZzJldGpCTDU2dWRpYUtzUVdTYWY5Q0tnVStHSDBRNGMyQmti?=
 =?utf-8?B?U3R3UGN0b0k0UlVjcVVsc3NlZSt5TDYvamZ1RzA4YXo3Zm90L0gxQ0w0eUF2?=
 =?utf-8?B?TUUzc0V6aW5qMDRzWGMza3FWTkx1ZHhVVEd4ZlpiaXp3bG94M1ZRZTlFa1JX?=
 =?utf-8?B?ME5pUWFqU1NIZnMwT0RZOCswSjNaOXdVVzZXUmNoMTNGNUZVZG1oTmgrMThn?=
 =?utf-8?B?dTAvVTVVMWY0TXQ3WXhpV216d3o2QzBuMVkyMXhGZkxFQlV5ek5QUERDTUlY?=
 =?utf-8?B?ekFQR0FGaWtiRkllWVNoR0xqTU1pL0lqdmtHakQxdUI1UU12cmdBa3RFbFRr?=
 =?utf-8?B?YXJuTENvUE1xU3NlaHpSMVNKMk5MelRtN0sxd09HamF1cGIreHo5dTROaFpO?=
 =?utf-8?B?MG5pdmkwY0tmZDdjY3RIeDlZMXg0T1VidTJOemwrYWtBQUkyYy9leEJ6Z0N1?=
 =?utf-8?B?bVVZTy94YVZuRW9mQTVGMXN4ZEcxZ3c1Q3FWaHlEdE4wZUN2R0pvbUptNG94?=
 =?utf-8?B?cmI3WmhTMHpuVnI2ZmV4L1ZFUVk4akdOMlpzdjY4S3hnNzV5NXZFeTc5am56?=
 =?utf-8?B?MmRNTy9tNGdOcm9Ddzdpa215SjA4S0srNVpWUEdSVkdsN2NrQUhvcFRyT1RX?=
 =?utf-8?B?djJvTGhNdTI0T243YUpaQUJsdU8zaHdhV1R6RGFZNlcvR0ZrZDlpZkRQQ0xC?=
 =?utf-8?B?aUZ2SEtqZFJwRWczVnpRZVhMeXJSZ1UwaGt4dkNQSkxOYzRwZWtvVUZsdEln?=
 =?utf-8?B?MTU0dFZPM25YWTd6VzFKN1NuMWJ2QmdZeUJXbjM0dEREV0gzZUo3a2FIOURF?=
 =?utf-8?B?SHB1dFBieVhxa00xQWdYbFFHSTV6TXZaREg1NDFoV21MenozanRaR2RVaE5s?=
 =?utf-8?B?dlRpZ1Ivc1A4cnlQTkFCOG5PMmMvVFA0VzNleW85d01TelU1M0ZQSEJqc3Zz?=
 =?utf-8?B?ZnZ1TjVHc1lMVU9wSFhOZ2lTV05tbW9MS0xWZm9CNVJkSGFzTFVhK0JUU3U1?=
 =?utf-8?B?b3dDMkJXK0JlS3djUis1RFJqa2U4L0h6WE50MFR5K05hOVJ6ejliZHZnSVdN?=
 =?utf-8?B?aFdZYXovcmxETWRLNEdsSVgxYTM3RzJtTE9QRWI4NHJlS0dZM1dhYWlnWlli?=
 =?utf-8?B?WDVycjFtYXJUZGQ5eUpDZTJKbVhMTXNKSTEwbGlCU0JvSDNzTHdPYUpubFlw?=
 =?utf-8?B?aVI1QnRXQTBGZ1pMVGVpVWJXdmx1ZGpuRkIyaytHSURMOWhiWnhJTGtTeGZK?=
 =?utf-8?B?RWZkR0hrUVNsR3hQNFRQYUIyNVhoKytHUUprNW0zMkJoVkNBeTVlTTNOT3VZ?=
 =?utf-8?B?c0IzdWJ2NEhiRk5YWEo1bkJOMkpyK1d1YW83aXh4dDdqa3pDb1IrZS9oVEVQ?=
 =?utf-8?B?SEY1RFhJTjNpQVlvVHl2ODRiR2pJcjV5QU1SV096a1l5ZWFrb0FVSHgyWkdm?=
 =?utf-8?B?NWlHM2p6NEM3RkhsbTVGbVpxQkZjanJOZVV1WU0rWmc0bWdleDlYZFZlT3Jv?=
 =?utf-8?B?VVo2TXNYeWxoOGJRYloxTmVBOU40U1I3VkZIaHZUc0p0eTZ0VHFBSFArWHpn?=
 =?utf-8?B?WllCOVY0THJGSVk1UG1sUWpMREovbE4wbnFOWFU1cENvSTZSdVVEOGZoWUQw?=
 =?utf-8?B?TVdORExuVXhsRTdpL3RJQ3p0ZmRxZUJweHF4VDFJRnh3NXlDTitKcXU4MVJT?=
 =?utf-8?B?bHRtbk1NM3FHU0xSKzgxYzFvWERqdzVFcFBwY3d6MElhRWZ1RUhTYXpEMFAx?=
 =?utf-8?Q?LF8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826f16cf-6edd-4d2c-f878-08dd7ce6bae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 13:00:57.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCVeth7Plhp5f0myO3IPbnJuo54YZ/xCXUXdMC/lTtjUCtBoYm5YRkRF0+VWPzX6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214989

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEphbiBLaXJjaGVyIHZpYQ0KPiBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiAxNiBhcHJpbCAyMDI1IDExOjAyDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBQ
cm9wb3NhbDogc2tpcCBkZWJ1ZyBidWlsZHMgb2YgbmF0aXZlIHBhY2thZ2VzDQo+IA0KPiBGb2xs
b3dpbmcgdGhlIHN1Z2dlc3Rpb24gb2YgS2hlbSBSYWogYWZ0ZXIgbXkgaXNzdWUgd2l0aCBzeXN0
ZW1kLQ0KPiBzeXN0ZW1jdGwtbmF0aXZlIChodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcv
Zy9wb2t5L21lc3NhZ2UvMTM1ODkpLCBJDQo+IHByb3Bvc2UgdG8gbm90IGJ1aWxkIGRlYnVnIHZl
cnNpb25zIG9mICotbmF0aXZlIHBhY2thZ2VzIHdoZW4gREVCVUdfQlVJTEQNCj4gaXMgZW5hYmxl
ZC4gQXQgbGVhc3QgZm9yIG91ciB1c2UtY2FzZSwgYnVpbGRpbmcgZGVidWcgdmVyc2lvbnMgb2Yg
bmF0aXZlDQo+IHBhY2thZ2VzIGlzIHVubmVjZXNzYXJ5LiBQbGVhc2Ugc2hhcmUgeW91ciBvcGlu
aW9ucy4NCj4gDQo+IEdyZWV0aW5ncywNCj4gSmFuDQoNCklmIEkgZW5hYmxlIERFQlVHX0JVSUxE
IGZvciBhIHJlY2lwZSwgdGFyZ2V0IG9yIG5hdGl2ZSwgSSBleHBlY3QgaXQgdG8gYmUgDQpidWls
dCB3aXRoIGRlYnVnIGluZm9ybWF0aW9uLiBTbyB0aGUgcHJvcG9zZWQgY2hhbmdlIGlzIGRlZmlu
aXRlbHkgbm90IG9uZSANCkkgd291bGQgbGlrZSB0byBzZWUuDQoNCklmIHlvdSBhcmUgc2V0dGlu
ZyBERUJVR19CVUlMRCBnbG9iYWxseSByYXRoZXIgdGhhbiBwZXIgcmVjaXBlLCB0aGVuIHRoZSAN
CnNvbHV0aW9uIGZvciB5b3UgdG8gYXZvaWQgZW5hYmxpbmcgaXQgZm9yIG5hdGl2ZSByZWNpcGVz
IHdvdWxkIGJlIHRvIA0KaW5zdGVhZCB1c2U6DQoNCkRFQlVHX0JVSUxEOmNsYXNzLXRhcmdldCA9
ICIxIg0KDQovL1BldGVyDQoNCg==

