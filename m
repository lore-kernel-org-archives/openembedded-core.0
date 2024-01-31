Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CA5C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 22:56:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web10.2246.1706741767225879345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 14:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UfoEfmn/;
 spf=pass (domain: siemens.com, ip: 40.107.8.84, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4dVZa5WJJsmcVCaq5m435UASyDVYgd2XwF/C1G0HBgWUcZn1wKkZ9LBr2bugy5Apap55oowlRUiP6ssv2RVCXqfVdk50AdPPY1aFs2LZomvGAimMquwFM+fpI8vEpeArdDKlMJGmL2//TNwUYLcCEuYwLN4bi4a+4gaqidqUZ6vGAGns2r10hiJ4Ln/G7vmfHqrnEyglMia1m9ZoRfmPufEZ+CifZQ8zC8O3qnZQodGxoD39kLFoU4ZqurveeuPftIeyHO2IQ0KxgoGgkknpwmAPTVXEyWLHb6ZOq3Odm4vpm5vzp2mjF65+EcAuH+a7FwrI+HTUqEkgIr6FS67qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWe4+q7OMZi5RHHJHoDbcyKgEwkgDaHbuV6QckIJBAE=;
 b=R2tj2hzs0oxXB4GXWFo2KyqWgsSI+bP3xslm5ua5nJHLVtDObY0XQS4fbnuJopFubvUDIdcr2xTo5M9Te1Wzr9RfTGKBLjmvsD+8Y57lGZfYJnMzkoT48XfpH3ByLd8gwOqa5GgycLvL6WJqGT/JUCPxoA6Je6gegKeYuMG/v5fiCAQd/ScSELMXPG7oM00ITwUnc//l7gNyGDBOpftbcBEswj9dKCnao9GQbCQYmfrkmXpHreD9omdPdqX80BFp3T6EBi2Ia0vjVJo3ENpq/X8zv4q7OQfjKYV156EniGRmXGW/9ohQy7N6PxazCPOC7eqAA1hVMwEl4PxXZobeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWe4+q7OMZi5RHHJHoDbcyKgEwkgDaHbuV6QckIJBAE=;
 b=UfoEfmn/+QOhjYc+z7Yo5GuXkTDogHBSDsxmyGZFlWOr0+vR/ETCW39Q5Ykpzs6yp0u+Lo3pM5v0y4QHu3nCWkWpE1/yuHHc/eJqhbZWjyFXYqRBw2nTpGFPCEsAUZQEj9i9BB7UJ9fD6wOZUMm260S3whhhgU/T05K/p/RUh5wg8HCa77h/ucqwmoEcd9Og8LTyx9PUmRjYDGAEymSKwIpwqhwv8yS2EbQDvMOk4zBgWFzDKIOGwQkbQBC+0voAJxdUTMiXWKboYtXPtjE62xpcfBxnIpaJ39aEaTr/e/tMyV4EFl7hOyVi6QgzTfdyJWkooLsmlhDKFaQea6LeNw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7294.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 22:56:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 22:56:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
Thread-Topic: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
Thread-Index: AQHaUgq1uUL6dQRXm0iQraklKEs8/rDw2DcAgAO0d4A=
Date: Wed, 31 Jan 2024 22:56:03 +0000
Message-ID: 
 <AS1PR10MB56970AD34141CD5978179AE9FD7C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240128165358.657852-1-peter.marko@siemens.com>
 <CAOSpxdYH5AYuEQ3P3dzMWXZmEkaC5D02XLsaNzk+f8vvG89ZWA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYH5AYuEQ3P3dzMWXZmEkaC5D02XLsaNzk+f8vvG89ZWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8b9bed12-3662-4e50-9b96-a416831cf5e9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-31T22:54:01Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7294:EE_
x-ms-office365-filtering-correlation-id: d371036c-dce1-4852-e959-08dc22afcd2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yOtFoFlOCwe+d7t5sI6umdKyoRDrV9erBrT8JXN+BTIYVyC3AFJCpvV6JBfnoIWkRbLw5Pywj5C9/m9D2bsc9o2kmDe6xfxAFmT/QFweM4LJWjiW0aT0WI2ijurVv748lmLLfppmFZ0OZvUj1UtzWYpKdqa9QCh/4TdpxnRKm9m7INsR9RVEG8KJWqI6Agnb/EGbEWwQ6HTffvjbJPcwn688xrgbAKEB4+DLsksUFmrTDp8JoE7jU8Vx86Bd/FxyZhr5IXX1fLyr4kcW0zV5JA3ilL2zr1mqeX4PaJ27l0n1B0C/jy0CNKq3oRfi9Z9kt/omYSig94F45Fnw/LmuFWEkrx5/6779UxUvlUKx+sxF+zIVfRI6TVsiqH3iFwNjl3ykN5KrVFW4YO3wuySC+pSiKdVmsIUHPznvdG1dK1j9uPTRtqZrrrQ15PK3SywqXkvN0cqIUfrdBZOzQI367s86fU42FYEKuTRQxEi1+xO3Z0i6s5m8NQrB9QEJnGir2qMibgjuudG5SLOVq6qq6bTJj7uVVssBWRya7rqv47Y9urQVcYGU5FF9fJBTd7ZWkagmfAZybUhQ7181MFgIVAidR7ewRXvCavFJhFWAtu0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(55016003)(41300700001)(66899024)(966005)(38070700009)(316002)(66556008)(64756008)(6916009)(66446008)(83380400001)(6506007)(478600001)(53546011)(9686003)(71200400001)(82960400001)(38100700002)(66476007)(122000001)(7696005)(5660300002)(8936002)(66946007)(2906002)(33656002)(76116006)(86362001)(4326008)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TEZqdUFwSG9MT1UwQXZickFTMCs0b1ZxWFdSS1RpaUhQVmZENGhESmFNSFdX?=
 =?utf-8?B?emlVZGUyS2M0REdvWkZNU013MDF0dXkyeVRBRC91VGM5Q1kzMlljT3VNcU5a?=
 =?utf-8?B?TXlKN2d1c2o0OXo3MXA3ZWlYZkluMEwyR2xVd2xpOXdINmZZKzlMQ1RJZkZN?=
 =?utf-8?B?R2hPNFFsNFRoL0RVTWErblBoc3B0d1hiblorVG42dnV4d1l6ZVdjaWlxcHFC?=
 =?utf-8?B?OTBQRWtmS1lLbEhReXNOZzh6Q05Kdk9nTDdzTHRYSXcxUWV5UzJ1N1pSQWhO?=
 =?utf-8?B?Qnpwd05jK1hqZTB2Z0puUFBDckkvaDNONVNkd0J2TGJNVjdLWkZ0QXpibko5?=
 =?utf-8?B?R0w3amhwcThpNUlzYjdxNEJJSzdoRFZMRERibGovMWNrQkQvUW5wdW1QcVRE?=
 =?utf-8?B?VTgzYTlabHpLZHlqUjBQVG9uakhZTUNMSkZuSTYxdHlQOWxPdGxCeU1CS0Fu?=
 =?utf-8?B?Um9TNlVkcXBxWDJ1K0NmTGQ0MTdhOGJSSEpsSHlJYVBkRndndGJ5d0pMOG91?=
 =?utf-8?B?ajZhY0Y0bG00cERYWGFkRHY1Z3RORDdId3JHVkJCSGlXS0xBUlhleWZDVzY5?=
 =?utf-8?B?dUlEL01nM1lzWXdxcmhhSngySS9mblByU3FxTk8waDZIZ1Q2OVdQWFlVMnVz?=
 =?utf-8?B?TVo2eC9xNDc5UjZYZWxlcVdvNU5sOC9PL0xaU1BGakRTdzJxSnBKMm9xeTRw?=
 =?utf-8?B?VjZ3eTF2aUhURFcrM2M5VXNrWVJ3MzBaYktBRzNQK1dSZ1RJMHk2QXFlQXJw?=
 =?utf-8?B?M0lSNWlyN1BYN1ZYdkF0aWlkRGwvZmdxbHV3NlBIT2JoYU5VM2hiMUVqSjEx?=
 =?utf-8?B?RDFtQk4xRjFzRUhaaC82YlFOVG5YSzRGVEpVUTE0ZmZEaFZMUnlibERLQmFK?=
 =?utf-8?B?K3c3YWZDcUdGbHFCcnZkbFZqYlEvRnpjeDVTakNybjkwL1FjU3VwUFZybDFP?=
 =?utf-8?B?ZkdMbWo4U1FkMkRaYy81dnA2MUU5dzNuNVBGZ1NOWjlveUJVaHh6blJEM1Az?=
 =?utf-8?B?eW92NFptN2hiU1ZnM3gza3AzS2VyK3B4eFJURVBLM2ROSVFIYlNUSWt4cFpC?=
 =?utf-8?B?Y1luSEw2TGVxeWNlbmk5WnlqMzBOWmh0STR5b3NrTlJZQlo3bjJLTU1RdlRy?=
 =?utf-8?B?RFZTUVh5OWZQcWRUaGJMN1hGMFJ3YzNMWWRIdFFYdk9WSHcvK0R0WENWMnlu?=
 =?utf-8?B?d0JPeWFKSlV4L0ljdWJSck82MCt4RmVoY2pMK1lsbVgxa3hpeWd4L0RsNmI3?=
 =?utf-8?B?OUwzUFYxcDhQVEU2SmdBSUNEQjJhODcxNXdYNDVBbE5ERWVydkRyVlpqeGYw?=
 =?utf-8?B?eHNpaTdzdmtSNXo3dk9qVE1ZLzA4WGtsWEJ5UUpDVHFVS0pNQmtjU0FPZXl1?=
 =?utf-8?B?dTFlblRyUlZMa1FhdEtlUDJIU1MwY2V0VWc2eDJHN1pMSDVwb1FTV1NsOE9D?=
 =?utf-8?B?end6WjZDdWp3eWxUMjZFeTZ2NEQrWUJCckxxVVdOOTRTZ2t5UnBoK2hmZkk5?=
 =?utf-8?B?cjdpNFMzUktqS2xkKzUxWjFaV0lteDNRc2RGOFRQSDhCT29XcERlUlp2T0FH?=
 =?utf-8?B?VGVqZG9IendPcDBwd2RvVVZDZFhsRTFkYU94YzhieGJjbGxxcGlNeEdDNDZ6?=
 =?utf-8?B?ZGFpNGpSMy9CUWRjZDlPVFczaDJlT0piRjhSUXFqb0JTdUlhajkvUlcxS1hw?=
 =?utf-8?B?VW5Ra1U4Smt4MDlxK1VWSmd2WVZ2b2RVTVlwem5pVjVCTmpYVGlxT0ZkZlJq?=
 =?utf-8?B?SzBkalJnSDE5c0ZnWlhQVFF1c1Nvd1BYTGJtc2F4dllsdDQyT2pZTElyM0hW?=
 =?utf-8?B?QWNubEV1VWE3cjI1eGNuK001bUphbDVoSDUwS1h2dDllbThpRStqSFdrWUJt?=
 =?utf-8?B?a0luQ1dDNkJNa29yVE1OUHJVNFJ6YjFQRjczTU1XaVhuaGJ3UlRkVEpGUnJG?=
 =?utf-8?B?V2xZeGd1ejErMFZwTDgzUHM4bU5aOVEyQXhMc0hlaU4zU0t0R0JEQ25oT3pM?=
 =?utf-8?B?MUNxdiswVVltK0dFUnRIZW4ycTkvTDZ5T2lubFgrUnNkVDZuTGczS01pSkpK?=
 =?utf-8?B?MFBHNVlGMUpyZms0OUNkRUZ6RGVFem5VQW1haXRZYytKUE9IUnJDVENBZHJH?=
 =?utf-8?Q?ez0Udtbd3cdxtouTG6nOoPrKT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d371036c-dce1-4852-e959-08dc22afcd2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 22:56:03.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQwYLy26iYoUB8cGHuuewseX38U3goMW5rO8+H9sQ3kcFelmrFqIyHRD3tdsm05YU01bGboJ8tVVGrsvHf22/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 22:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194536

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNh
a29tYW4uY29tPiANClNlbnQ6IE1vbmRheSwgSmFudWFyeSAyOSwgMjAyNCAxNToxOQ0KVG86IE1h
cmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0K
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJl
OiBbT0UtY29yZV1bZHVuZmVsbF1bUEFUQ0hdIHNxbGl0ZTM6IGlnbm9yZSBDVkUtMjAyNC0wMjMy
DQoNCj4gT24gU3VuLCBKYW4gMjgsIDIwMjQgYXQgNjo1NOKAr0FNIFBldGVyIE1hcmtvIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5t
YXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFRoaXMgQ1ZFIHJlcG9ydHMgYnVnIHdoaWNoIHdh
cyBmaXhlZCBpbiAzLjQzLjIgYnkgWzFdLg0KPiA+IENvZGUgYW5hbHlzaXMgc2hvd3MgdGhhdCBp
dCBpcyBmaXhpbmcgY2FjaGluZyBpc3N1ZSBhbmQgdGhpcyBjYWNoZSB3YXMgDQo+ID4gaW50cm9k
dWNlZCBieSBbMl0uDQo+ID4gVGhpcyBsYW5kZWQgb25seSBpbiAzLjQzLjAgc28gMy44NS41IGlz
IG5vdCBhZmZlY3RlZC4NCj4NCj4gSSB0aGluayB5b3UgbWVhbnQgMy4zMS4xLCBub3QgMy44NS41
DQo+DQo+IEluIGNhc2VzIGxpa2UgdGhpcyB3aGVyZSB0aGUgZGF0YWJhc2UgaXMgaW4gZXJyb3Ig
aXQgaXMgYmVzdCB0byBzZW5kIGFuIGVtYWlsIHRvIGNwZV9kaWN0aW9uYXJ5QG5pc3QuZ292IHBy
b3ZpZGluZyB0aGUgYWJvdmUgZGF0YSBhbmQgYXNraW5nIHRoZW0gdG8gZml4IHRoZSBpc3N1ZS4g
VGhleSBhcmUgdXN1YWxseSBxdWl0ZSByZXNwb25zaXZlLg0KPg0KPiBTdGV2ZQ0KDQpIaSBTdGV2
ZSwNCg0KSSBoYXZlIHNlbnQgdjIncyB3aXRoIGNvcnJlY3RlZCBjb21tZW50cy4NCkknbSBzb3Jy
eSwgYnV0IEknbGwgbGVhdmUgZGlzY3Vzc2lvbnMgd2l0aCBuaXN0LmdvdiB0byBvdGhlcnMuLi4N
Cg0KUGV0ZXINCg0KPg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vc3FsaXRlLm9yZy9zcmMvaW5mby81
YjA5MjEyYWMwNTYxNWZjDQo+ID4gWzJdIGh0dHBzOi8vc3FsaXRlLm9yZy9zcmMvaW5mby8yZGJi
MjJjNzVlODZmMmUzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIu
bWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Nx
bGl0ZS9zcWxpdGUzXzMuMzEuMS5iYiB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Nx
bGl0ZS9zcWxpdGUzXzMuMzEuMS5iYiANCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0
ZS9zcWxpdGUzXzMuMzEuMS5iYg0KPiA+IGluZGV4IGVmMTJlZjBkYjIuLmIyZDhmOWYxZGQgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zMS4x
LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zMS4x
LmJiDQo+ID4gQEAgLTI1LDMgKzI1LDUgQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0gDQo+ID4gIjYy
Mjg0ZWZlYmMwNWE3NmY5MDljNTgwZmZhNWMwMDhhN2QyMmExMjg3Mjg1ZDY4Yjc4MjVhMmI2YjUN
Cj4gPiAgQ1ZFX0NIRUNLX1dISVRFTElTVCArPSAiQ1ZFLTIwMTktMTkyNDIiDQo+ID4gICMgVGhp
cyBpcyBiZWxpZXZlZCB0byBiZSBpT1Mgc3BlY2lmaWMgDQo+ID4gKGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZy9zcWxpdGUtZGV2L2MvVTdPakFiWk82TEEpDQo+ID4gIENWRV9DSEVDS19XSElU
RUxJU1QgKz0gIkNWRS0yMDE1LTM3MTciDQo+ID4gKyMgVGhpcyB3YXMgaW50cm9kdWNlZCBpbiAz
LjQzLjAsIDMuMzEuMSBpcyBub3QgeWV0IGFmZmVjdGVkIA0KPiA+ICtDVkVfQ0hFQ0tfV0hJVEVM
SVNUICs9ICJDVkUtMjAyNC0wMjMyIg0KPiA+IC0tDQo+ID4gMi4zMC4yDQo+ID4NCj4gPg0KPiA+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxOTQ0NDQp
OiANCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS9tZXNzYWdlLzE5NDQ0NA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL210LzEwNDAxNDc5Mi8zNjIwNjAxDQo+ID4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmli
ZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5z
dWIgDQo+ID4gW3N0ZXZlQHNha29tYW4uY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+ID4NCg==

