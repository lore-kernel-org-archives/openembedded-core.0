Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72876C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:12:21 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.85])
 by mx.groups.io with SMTP id smtpd.web10.84271.1684141930557490016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=C3V2/GaN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.105.85, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRUo/OlMcrFvUWunEKz5dQQAPkxr/SzCMBgcEhM7FKb7QkzEU1heBoO1vkXanqTeHVT1ti2jpWYs0mP+rkKm/ALsBgZNxWWD4p3t6lAK57OefWip8OYMvs56SMOb/5a+vkZgiD9RCdg9FnYxdCFS+PLLWPgtdB4O24g1ukOuZzLDr/DekSXt1yDmrDkoWLQXGeG4bmYQCTuOqGGg3vj6MjUTEwZOVugu0/J6460TH2hGch2xKBKo/+Z7wD5W8MqqTDIfxf5YdLXmBZ3xlSH2wjuYmrIsMy5fSS25zGc7i86XmLi90W9W+XNtrp/Ac1+EQsHAvflZuVzfHx4/QrzFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEp7G9TzlSwpGxlA4jvRdsNi2YknsAyhfVe0oYdN1/0=;
 b=mvWs9JvZrDvf3qvmC78ZaytVtJ9scKLmNm5dG/TdMiA6E+fz/npP1g2Nyo87fJ103U5hOFkKSwWMJaYu0dXey9xPtczv3bdcKnnI2WE0U52i2cD5sfY7/mO/fkvt23sRnajAPlHT2g8cv3H+2SENYb1IUI+Vw4oEj92RsUPQd6z+gvWmiVIcPGdebBDhqYt5PbYYP3NCWz0OHzFL+Gg0Vh6pUm48aC9qTfub9PC0ZayTNuR2L4WU5imRO9BSR+QDJEQHFXMNMCgKLa0Oe5lJx1iTdaEYGS4bIFxaUnSFBbzI2aOnmM/9LCj7W9Yg8S807se6ce+lnemwj8f0b97hLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEp7G9TzlSwpGxlA4jvRdsNi2YknsAyhfVe0oYdN1/0=;
 b=C3V2/GaNg6vn44bwNvNEVvuKn5aJxwDlHtuZ6B+BFlsKuc6l5VgceV1e0kIKItj+3nAdZkeYgB2WAMleCEo4JmKg7oivVMUju4/qni8wFVoslj4yNpip4STnJv1XgxGNkKzmJA19d5DHp38eHp4YUwf3nlf7DNfj6bZPX/P3bM0tGFmoGIBbFurf+GMtPyKTx/0qokoSZU9VFNvUGpl8NIPrPuh/r0tF1TUGxsFvzc+Y63JIh9dSVb8e/qPqdk1XC4z7udfWGUk5MXFiIFvDpQQb9D8kc9lJkZav+erVSkIechKlruvE/KobafPZ+8FJ/06L1m4K1N/cTXhMtuxZTg==
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by AM6PR06MB4261.eurprd06.prod.outlook.com (2603:10a6:20b:21::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:12:06 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533%3]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 09:12:06 +0000
From: Aaltonen Eero <eero.aaltonen@vaisala.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] avahi: fix D-Bus introspection
Thread-Topic: [OE-core][PATCH] avahi: fix D-Bus introspection
Thread-Index: AQHZhNuyfdpCAQtnNEOHtXK8qamWH69bBuCAgAAKCoA=
Date: Mon, 15 May 2023 09:12:06 +0000
Message-ID: <4f5f99b28a9f98d2e0c33a64d23fd6b57c466d6b.camel@vaisala.com>
References: <20230512141135.308692-1-eero.aaltonen@vaisala.com>
	 <CANNYZj_Qy6ZBiu0v4uJ7=8XDKR-4FUjg0pVRkWCsDB5eR-f7qw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Qy6ZBiu0v4uJ7=8XDKR-4FUjg0pVRkWCsDB5eR-f7qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR06MB8515:EE_|AM6PR06MB4261:EE_
x-ms-office365-filtering-correlation-id: cecf65db-c32c-42e5-4587-08db55247496
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PpyOnAbFr5h9Tku/YT6fq7J5azihpYKoKTT0sLM6ADGwBCuE4ydFle4ofBkmtPulTIQ0Tk+eYd2UK4uyfiZE3aSSf4qcJ/dJT0ic+tXBArTKXhFwUXzNyYbDAkRNT0snWMlLYpt6m8bunul/IaL6cf/sAPNVIua277nym+Yqy8tv/o0pXXkNIIjmb4CPSu1D8uD73PwLZAjvBtaAxPJk+QQsEsKhVJaVxmT1YXc1e0KMq4RM+BwchjWZnVLfLVSm6bNcEK0FXOuOuObXjwS+NvIgbLAGVOogRNUq7R+of+hFrl0O7+0eiATIJKDg7Ktr8/GtyV9Y1bwqXwR2wSqEs+Yk7CjZWEm9uUSqtpfOj6+BqtM14W2i39eQj38CPIifMS3lRGzdHV5ReFRhhVcw3G6mWDOrdd69wO+0lIjIHntfQwk6XdqGKIvYXv4bhJ8/I+X9iUGiidyBrWtvn7vHcniAfws4EoIyFFUGWf8j/xYUPHjYfKiwP9cMSwdkFX0La6ZakKs9AQOVQhvVyOT43EH5deRPm5lUEPg9Hc42drxtjLNWKbmcMDxEycCzgwS5E3nccsE7o58TgMyqcRMmUP6EnDvEsq68RdlrsILl5f2b8N7R9jy1Jrd4C1UpXkTb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(451199021)(2906002)(4744005)(38070700005)(38100700002)(316002)(41300700001)(122000001)(5660300002)(8936002)(8676002)(36756003)(86362001)(71200400001)(478600001)(6512007)(6506007)(26005)(186003)(6486002)(2616005)(4326008)(6916009)(66946007)(91956017)(76116006)(66446008)(66556008)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dDRacUV3RHQyRjlaYTdQMFU2MUFzNnQvOU14eUY5aW9VSlRoVXdwbjB2Z214?=
 =?utf-8?B?K2dvQmZ1aFlCQTJuWFBlWTc1cmd2K095TWY1SllUOGtIUFlCeGYrUnpRalNQ?=
 =?utf-8?B?aitwUTEwUWdHbncwNWVIVjZDY3VTMkJVN2k4aEVxVlkzUmZGc0RkL2I3VHR1?=
 =?utf-8?B?WlhsWkxVMmZNU1k4UE53Q2gzVFprcXpTWHFLL2Jsem5CQUpBNzhoTHJDMjVN?=
 =?utf-8?B?bktSOWpkZ1FGaGxlajQzOEJYU0RwV202TVV2T3JYSEVEakQ5Vytod1NQbXJ5?=
 =?utf-8?B?NmNaRUhKOHJsRU1IWmd6OHQ0YUpBeGNrWUFWbVJuNDRSWDU0ZHJHU3Z2VEJB?=
 =?utf-8?B?bDBkNEs0RjMyVmJwdkgvdy9WUlZFWktvNThqWmVVN1NIeklFMlFWUUJTZUlE?=
 =?utf-8?B?Sy9FK01NV2dHcXIyaENwRmhsNFVzVFRka1FhZ2JrMTFXSXhnc1JBS2ZIVFll?=
 =?utf-8?B?T3VpbldIbDFzOFp5SUJ6bkluSi8xS3ZsTTRrc3VOaDBvbXdhZDJlTEt5QzRp?=
 =?utf-8?B?NUh3T2NFN1oyU0dMMlhWV3g5dU9KL3BBRXlhV0hCSE9La1QyclJHdFpWWEgr?=
 =?utf-8?B?ai9PZUxvamxZNEJCWmZzdnVHVWlLWDI5WTE5TXdoN1RrRGFLdE5JandZOVBs?=
 =?utf-8?B?QVNQYWJhY0VVQkh1d2RGZ3JQQ3Q3aE1CMXE2WkoxY3BXWGtmMmFReVpEME1p?=
 =?utf-8?B?ZlhSVytNM3A5bTNJQkpWdW9LNGRNbjh3bmp4VEhaOWY3UXpvQ0hGNXZVRHBo?=
 =?utf-8?B?dlYzTFI1MjBUa21TRHROOHdkWXdoeWNVdXZCbVh5czJ0Z3gzRUoxditlWURH?=
 =?utf-8?B?ekp3VlhMU0xwbmVFK045MXVIYmdYZUhOT1czK1VpZktuNlIwbHhQRW1MVHFw?=
 =?utf-8?B?NzZjNnRZR0VRWjczSVJ1bmJXdFJvR1B4dS8xOWVyaFAxbUdnWUdRRHI5YVBS?=
 =?utf-8?B?UzNMaXF0QTJqQW0rRnNSYjhDdDM5QjdyQzVMYUhZVThNNFo4UFFzSkZGTmpq?=
 =?utf-8?B?VExWcGt3REowbVQvWDI4ajFOTC9hSmU1Z2QybndXMlJJS0Z0Q3djdjdwWkkr?=
 =?utf-8?B?OU5YejkzSlMycE9LSFhuWlk0QUtBNHpRcjhtd0JndlFCcDhuWVVKVGdETlBG?=
 =?utf-8?B?VW9aMHZ6cUFwaTBkZEs5dEd5WkJ5K3ArNk81RXFrVXlQU2Zhc0duT3A1TlN6?=
 =?utf-8?B?ZGlXOFpEMlRKc1NpUTdZdXQ4M3hkRHZnWkM4bWF3aEc4MU9yYWx1TmQ1N1ZL?=
 =?utf-8?B?NWg4Q056YkIvK3ArVjNYY3F4Q1pvZ3VhY0tBM2ZUWW55YUJpaThSWUxudjd6?=
 =?utf-8?B?Z01TdFFmT3R2NDljeEF2dUxPYnVXcmdGell3elZmT2czVVIrN3RNekNib2Mr?=
 =?utf-8?B?Nm1CYlY5MWZZS3dUNHgyaHJ6YXpmaXVpQnprUlorNmQvT2MzRVRCS3hSbHU3?=
 =?utf-8?B?NDdpVkJyUXd6UEhCU2htOWI2UXI0TDVWM084MnNteERGc1hGbXRNY3EwdXF3?=
 =?utf-8?B?Unc0dXVtb25pRU1XdjJKNUlkamdQOFBuNzc2UFdJT09JV1NnVENpRWhyQ1VM?=
 =?utf-8?B?UVZFZFl1aWRpZ2VYRWF6dUxhV0hWODFERXloeklYd05vSTluUEgxK3ovaG9V?=
 =?utf-8?B?eXhlV09lTDhjM0lJalV4NWtCRVc4V2xXNi9xdFhldnhJTnh2cWp1bStKRncw?=
 =?utf-8?B?ODhCYTdxK1IybC96R05hWDhyUWxlV2pwdVJacFBkRE4yOGdRYzNMYmNINGMx?=
 =?utf-8?B?RVFEd01EYnc3UTQwZUpzYVV1bHl4N2ZOTk9sQ1F5ZkxjME9qdEJsOUc3cHI5?=
 =?utf-8?B?L3VKRW10SG9leSsrbytvM013dkRHMmtFekpOSWJXVDBOL3QzMmZqU0Q5L0ox?=
 =?utf-8?B?ODczOXJuQzRNa0ZuZmRFZVh2ZXk5VGl2a3BjTVRKRzFuNFpnMW9kYVdFM1NZ?=
 =?utf-8?B?S09RN1Q2TXUrTlg2OUtiSCtlOVVIR09iK2wzNzBLUmptTHN3UkRiSFU0bkg0?=
 =?utf-8?B?SE1UdFlFMHdEbkU5cDNObytCelhlSUxZVkRYMjJza0UxbWhmOEhFVmNlZXJt?=
 =?utf-8?B?YUVFSExreE5LR1RGY01YM0NBZE9HU1NVbFkvSjQyUkFNRmNZankxSUkwVi9J?=
 =?utf-8?B?Q0haRENKSGtpb0ZLTnEyNzNkd2UrZ2VROTFmSmpTdmJLUDkvOHdnWmo5UytG?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B25F572EC1A18A4C815A3F3F71BAF2FD@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cecf65db-c32c-42e5-4587-08db55247496
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 09:12:06.5633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXrQqAhyraZNTin2JGv5Kh13oIkMQsTmf41l6yphtXLbQsEsmkSuIRvgRPxVaVj+jfdjtQdl2qhsTjCUPQYM/3Fsy0A5WK0RC1ezwkCKjmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181235

T24gTW9uLCAyMDIzLTA1LTE1IGF0IDEwOjM2ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gRnJpLCAxMiBNYXkgMjAyMyBhdCAxNjoxMSwgRWVybyBBYWx0b25lbiB2aWENCj4g
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8ZWVyby5hYWx0b25lbj12YWlzYWxhLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2F2YWhpL2F2YWhpXzAuOC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYXZhaGkvYXZhaGlfMC44LmJiDQo+IA0KPiBXaHkgYXJlIHRoZXNlIGNvbmRpdGlvbmFs
PyBUaGF0IHBhY2thZ2Vjb25maWcgaXMgZGVmaW5lZCBhcw0KPiBQQUNLQUdFQ09ORklHW2RidXNd
ID0gIi0tZW5hYmxlLWRidXMsLS1kaXNhYmxlLWRidXMsZGJ1cyINCj4gc28gdXBzdHJlYW0gc2hv
dWxkIHNpbXBseSBoYW5kbGUgaW5zdGFsbGluZyAob3Igbm90KSB0aGUgbmVlZGVkIGZpbGVzDQo+
IGJ5IGl0c2VsZj8NCg0KT3ZlcmFidW5kYW5jZSBvZiBjYXV0aW9uLiBJIGRpZG4ndCBmaW5kIHdo
eSB0aGUgZGlyZWN0b3JpZXMgd2VyZQ0KcmVtb3ZlZCBpbiB0aGUgcmVjaXBlIC0gc28gSSB0cmll
ZCB0byBtaW5pbWl6ZSB0aGUgY2hhbmdlcy4gVGhlDQp1cHN0cmVhbSBidWlsZCBzZWVtcyB0byBp
bnN0YWxsIHRoZSBELUJ1cyBvcmcuZnJlZWRlc2t0b3AuQXZhaGkuc2VydmljZQ0KYWxzbyB3aXRo
IC0tZGlzYWJsZS1kYnVzLg0KDQpJJ2xsIGZvbGxvdyB3aXRoIGEgbWluaWZpZWQgcGF0Y2ggVjIu
IEl0IHNlcnZlciB0aGUgc2FtZSBwdXJwb3NlDQpBRkFJQ1QuDQoNCkVlcm8NCg==

