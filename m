Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33BFC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:09:54 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.74])
 by mx.groups.io with SMTP id smtpd.web11.28096.1701158985148854297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hiyuqbXF;
 spf=pass (domain: siemens.com, ip: 40.107.14.74, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHcQB1sz35PrDAgANOuflJQyHAKW4/gmq1rOqYC0LQ/zKbrQjb4MFt4VsvJK2sE6fx8s888NslgFuuwwp9HQZkFF1nyXoDCI8Hdaz3XAhOOuDgn0hFGI3iXzV0S1YB1y1tuS/K/TKfBZXCwNbtbzN5uA0I9MoVpcF7Xi03FK4sSmmgMx/ru53OqGF69nPOHZvm52Fu10g6FIayDKJE9milXKQozWyZLjG1WXGWq8QrYq60xt4KADV8YiFm+tQomUykrjIe5qxDS+/a1q/L6haB3n7bJWT+W1mznA6q05Wypoc9dbICLceCni5fZIB607ti9gYVY+eIL4RcEO1HDV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V8HdzwVHMbtDOLB/dSbkdUdTWkMus7wxHBZb27Qqs8=;
 b=Q0bUOvkm/YgfzyguoXo3pETi5Pl3VgTwiSWJRx6aPeW8KjXvOEdjlzsDJY6M9rAMAmOA2eRENpysDVkTdqZAbVAWEpXDqK6AAhRbH/JDG1AOjCI5PuOvzL9K4xb95TqvKjagaP+zxqeuuqHPuyMG/mSME9hVWbskV0JRGs9EiCITdbfq3VVd5h7CurCs3KM2VK1dCs4qnQ/EF6+W1BhNuGziQ0Vp0eouLG2ldxGnDFVb55BIB0XcXWro8+ZyHef2cPe9xhWGYyWcEWGEmlHl8IlHy8wEam95ocQy+cLO966fSNG400gDEbU0u7bo6dhmYH4Hkrs1Q18GulyWxrkzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V8HdzwVHMbtDOLB/dSbkdUdTWkMus7wxHBZb27Qqs8=;
 b=hiyuqbXF4qipgCEGO2SnZmIap0xmY1/rZPRSvRMWvTvFuHNSrj1g64z6E8pQoRfTo3M8YBq/+giRghe6oqFD2xUXmvc2p4VruzvD9T9EzbTJaqckLLXhp16MElf0E6MxkoDov7Q8MgKHlIcw5CRvm7cwOFBB9LyhZDd9+FDwv0m1E5iD87fMB5FQBPLgtqGKjR7WeDGdGO43fQ5J2nyo9ZK3dygAYMGzTomPhkx0OV2PlaxEpDcsaeSHqVojeiwtmGTC117rMmchlETzKa55eszkEA/dvcQPrJ8fmABMtWDdN7Eay9Y9K3P1f2M6yTXwouCVt5E1qI8x+87c/I3AkA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU2PR10MB7742.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:496::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 08:09:41 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:09:41 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rdfind: add version 1.6.0
Thread-Topic: [OE-core] [PATCH] rdfind: add version 1.6.0
Thread-Index: AQHaIc2f2RbZZ2RwAESEfXVG1MTe07CPXXsAgAADYgA=
Date: Tue, 28 Nov 2023 08:09:41 +0000
Message-ID: <728b0efed1da920352c19bb763217c4c196d437d.camel@siemens.com>
References: <20231128073632.38829-1-alexander.sverdlin@siemens.com>
	 <CANNYZj8JtUhqErMKA7kAEd0n7gWYFy0zs-52dRxY0DkdRdJeKg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8JtUhqErMKA7kAEd0n7gWYFy0zs-52dRxY0DkdRdJeKg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU2PR10MB7742:EE_
x-ms-office365-filtering-correlation-id: 226cb21f-b5a6-43e7-8d23-08dbefe95f9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UsSRvNCiUWhXGC6wTNVZK/xkDKTuAM+86S/e30ZQcVbvg7fzb1bSv0yemE4I3qn4HvWHAq1fEgzG8uCKuxgtEG1n90IlmpvNZEE202pclnMpyRWOUGhBayGGbwWbfvdbjzqMYn9kCIi/KLPeDlFBIZ9Am1fmDhp9uNRppImFRjqkZu6JjxHAMWIvYDDDsCL5iy7b24WR5icI1ooWfGP6BFLNbjYi3FyS1zNoOsC+g6bx3hWJBVyfEygxhbZxbAzek5OC10T64Gj41cWrIyjQt7fVF+46OFYRAXRqL7ceiSJFbafiIwSS76Y+K70zYuNznQunJZEFjaalyBfc1mJamxHds73SkcmfyKGXlXcvVuCpE9K2jqqibVLl8lX2jbWRlDKhmlqKXNghq+JqKEdEzroo/aE2oeDEqCWWTUbD36Ib6ZqGigMUmnkYn0PmwCv17T/nz3acgdIb15P14CLvs053VXB+XTzcTiXgdevKv9WcAxoq1LX/A9L/+bQjFxN9bufvGH9G0L31EsbV1Dj9kaYkIkIhmXiqnMUQPcgMX3bwR0R05aKtI84fFpd8CtsZZqbtOYxJ0KQsSSdsaMuNVQCmXIREQzn+m0AG8M7ZJUk51r/L4Ooe3tCBQhjoSweb0cXbz3fpsy6dXJH4BfY8ig==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(83380400001)(38100700002)(122000001)(4001150100001)(82960400001)(8936002)(6486002)(4326008)(6512007)(6506007)(8676002)(71200400001)(76116006)(66476007)(66946007)(91956017)(66556008)(6916009)(316002)(66446008)(64756008)(86362001)(478600001)(5660300002)(966005)(2906002)(41300700001)(15974865002)(36756003)(38070700009)(55236004)(26005)(2616005)(66899024)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SUVub21mck1RRXFWRUZQMlZWVUdkVkZEeWIwYkJhblRxMlp5NDVaUWNwNWVl?=
 =?utf-8?B?MFVvUzJ1eXRLbUNibTJWaG05bWE1eXkwdUtpTHFPaDlXazJZTnpIYS96bUFp?=
 =?utf-8?B?bHZRelRudkd4aVV1clFWR0I2dW5FUDVhSm5jajQ4MEdFY09vdXlnVmRhcFZr?=
 =?utf-8?B?MG1lb09BR2F5WDA5UndCQmxBUldjdnJMVEY0K0syMGtxZllOSFBmUExCUEZF?=
 =?utf-8?B?NTlYNHJrUUhUSlpwR3ExNys0b3I2UjFjMmhGdFl5S25KRWs1bTZFMXRCMk1G?=
 =?utf-8?B?UWhpc1lNbitVcEpGTklqc2dpUkNWNDBxck1OdjE1cy9rd3lOUFlKR3MwZlBV?=
 =?utf-8?B?MzBrQnJMYjdyL1pLdlRRUE9ia1dXL3c4eUNvMU41dUE0c0JWWHdtTHJIODZ4?=
 =?utf-8?B?U3ZpelRlSEI3QVNxOURQTmlGd1dibXN5c2NFTmF0bUR3YXNCRmozbTRoWmkr?=
 =?utf-8?B?TzMzNDVVbUdSNVV2UUUxSDlwTDIxRXE5TmlZc2NiRkxBMGtzSWpoQVVaQlVB?=
 =?utf-8?B?b0hBbE5OZUNGcHpveUxpRGNFaThtTGo2RU5vTlJKT0NTbktnZ2oxK2xhRlBM?=
 =?utf-8?B?ZS9rUzVqalJqOE5hR25ZVjV3a2ZJQ3ZISmtjSlZMaTJRNFJmN2pXRTQ5QXQw?=
 =?utf-8?B?Q1BtQ3o0QWtJcEgrZHpXMkgrQWxkRmpCbFdPdlYwTnhVTm1DQWZqb2pFV0dx?=
 =?utf-8?B?MGhVcStxY044RHYyWStia0FJbTZFblRUTlF3V01LQTJwWFdGUFNBYjNDdmVZ?=
 =?utf-8?B?OHR6bnYrSmw1R2F0VEw0L0dUUUxNM1NjR29JdC8xQjRxNmdQSDh5WkUxTENP?=
 =?utf-8?B?eUR4UzhOdVhYL0tZVjVwTVZYbHBndCs4L2Y0Y0dYUVhnRS95cWczam5jeDRv?=
 =?utf-8?B?N1ppWjdnZGNPN3o4U3MxL25oZzJHQ3BQRTJSb0RBSlNOSjM4Njc3NWNXU1Fz?=
 =?utf-8?B?WGFaNzZYOHNGb2hPWFBocHpQUEcvOEZUNDcyUWNvY2FJVUhCcHkzWVEzckxK?=
 =?utf-8?B?L0dTY2E2MDZXZ0ZnMDZndUZSMUVDRzZaZUdXTmpSeFFiZ3Q4cWNzZzdxMVNV?=
 =?utf-8?B?S0sxSzdONUY4ZFVwSnpYTy9POXFidmNsVjBkWWxNejJlLzFJWTd0eTBxRGx0?=
 =?utf-8?B?eWJodzRRQVZkSWVPZ3BuSENXNStNMUQwY01rSm1aY0poQkxXaWhFczZRdEdH?=
 =?utf-8?B?WHlEby9TZllUOXgxQTlCbEdkNzN2WXRNekt2OUR5cVlzMlVBS2Y2YnhKTUxp?=
 =?utf-8?B?UHEzblpiamk3MmV5VldIQzZoZlZicnF0ODBQVTJ3ZjE0THJzNW5KS3NOK0Vm?=
 =?utf-8?B?Yk9xT3F5bk5PS3pMZ2QzaXhialEra20valA4ZTEwK1FEWnZiVExZaGU1S2hV?=
 =?utf-8?B?U3FkdDFURW9WeThyZGdTZHlEQVB6WUZCZkUxT090N2ZjTnkrejhCOEdRV2Rm?=
 =?utf-8?B?a1pJRlNTNVo5d3F6ZzhBQUNCVUpScS9JWTdSM2M3Mzk1bDlQRmoyT2s0NjlB?=
 =?utf-8?B?K0FkQUlHZ3dnbzA0d3Z2R0xWZS9ySy85NFJNVzFSUXVhRURNRmVkeEp4LzVn?=
 =?utf-8?B?L09sTkQ0QjBESjF3SHMzZkluRVhtUWdSR29rQnFyR0oxR1lSMzFqaFdPNUhi?=
 =?utf-8?B?WGxRbDErdnlJR1ppdXNYQ3paUDlJb3ZaeEt1cDIwcDdabDZsdDZXdWhVVEtL?=
 =?utf-8?B?TkpMWGY2UHRnWmxOOTkzbVZheTI3amREb2M1YVFlVHRMZUZRN20xOXlEbFR3?=
 =?utf-8?B?T1dKWDgxb0RDZHRRMndPeGJPOUJOdGtscVRZbHNaeTU4MjJEK0J6V1FKL3hC?=
 =?utf-8?B?RUZFRDZxL1ZrRUJib1lYaHE1dWMzQ0RiOWdPeXpJelg1RWZQc1NVTlVaWGsw?=
 =?utf-8?B?b3RibTlSVVVYMjdNeGJYUXp6V0piTVFsUm82b3NMRmZwdDkrT0ZFUkRmVko4?=
 =?utf-8?B?VHlmVFpCRnhUS0hqTUlEZTBoeGU0OEdabktSV0xBZUdEcVhSL295ajQrUFBl?=
 =?utf-8?B?Zm9ERkZmWVY3dXNMTENQaUw3bk5FSDROUnc3WU8rMC9uVUhDTXR2MGY3MVRD?=
 =?utf-8?B?QXE0TlFMWGZNM1lYTVFuL3AxME1vMXV6RnFjaWZFMTNLb3BZMHpVS1NIYmpS?=
 =?utf-8?B?UXVNSVRZT2xEcVFlZkpTNEphQWREdHFMam9Oek0yK29JSjVpeG1xYjE3Q2kv?=
 =?utf-8?Q?/9vFpCwS+pELgaKEW01Rsp0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6C830ED7A6944439F04F0C7CBC4454E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 226cb21f-b5a6-43e7-8d23-08dbefe95f9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 08:09:41.3165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptrRqgnxhDDuIWsj85S71hu5ydNDsNoXmQnl5G6LLdeuV+VwQleMuEvlAa4Les7pdkl9BNIWom3GNuyexFYmmD5S3G1v+wv7yBgB7chHfY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 08:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191344

SGkgQWxleCwNCg0KT24gVHVlLCAyMDIzLTExLTI4IGF0IDA4OjU3ICswMTAwLCBBbGV4YW5kZXIg
S2FuYXZpbiB3cm90ZToNCj4gSG93IGFib3V0IHVzaW5nIC0taWdub3JlLWR1cGxpY2F0ZXM/DQo+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJl
L2xpbnV4LWZpcm13YXJlLmdpdC9jb21taXQvY29weS1maXJtd2FyZS5zaD9pZD00MTI0ZjhmOTI4
ZDUxYTE0MzdlMmZkMjYzNmIyMGQ1NDBlZGMyODM2DQo+IA0KPiBBZGRpbmcgYSBuZXcgcmVjaXBl
IG1lYW5zIHNvbWVvbmUgaGFzIHRvIGtlZXAgaXQgd29ya2luZyBhbmQgdXBkYXRlZA0KPiAod2hp
Y2ggbWVhbnMgYWRkaW5nIGEgbWFpbnRhaW5lcnMuaW5jIGVudHJ5KSwgYW5kIGluIHRoaXMgY2Fz
ZSBpdCdzDQo+IGVhc2lseSBhdm9pZGFibGUuDQoNCnNvdW5kcyBnb29kISBUaGFua3MgZm9yIGxv
b2tpbmcgaW50byBpdCENCkknbGwgcmV3b3JrIGFuZCByZXNlbmQhDQoNCj4gT24gVHVlLCAyOCBO
b3YgMjAyMyBhdCAwODozNiwgQS4gU3ZlcmRsaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPGFsZXhhbmRlci5zdmVyZGxpbj1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gPiANCj4gPiBGcm9tOiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5z
dmVyZGxpbkBzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBBZGQgMS42LjAgcmVjaXBlIGZyb20gbWV0
YS1vZSBhcyBvZiBjb21taXQgMzlkZmNhY2ViYTM2DQo+ID4gKCJyZGZpbmQ6IHVwZ3JhZGUgMS41
LjAgLT4gMS42LjAiKS4gSXQncyByZXF1aXJlZCBieSBsaW51eC1maXJtd2FyZQ0KPiA+IGluc3Rh
bGxlciBzY3JpcHQgc3RhcnRpbmcgZnJvbSAyMDIzMDkxOS4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4N
Cj4gPiAtLS0NCj4gPiBTaGFsbCBwcm9iYWJseSBjb21lIGJlZm9yZSBwYXRjaCAibGludXgtZmly
bXdhcmU6IHJlcXVpcmUgcmRmaW5kLW5hdGl2ZSIuDQo+ID4gTGluazogaHR0cHM6Ly9wYXRjaHdv
cmsueW9jdG9wcm9qZWN0Lm9yZy9wcm9qZWN0L29lLWNvcmUvcGF0Y2gvMjAyMzExMjcyMDMyMzAu
MjcwNDIxMS0xLWFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbS8NCj4gPiANCj4gPiDCoG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3JkZmluZC9yZGZpbmRfMS42LjAuYmIgfCAxMyArKysrKysrKysr
KysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JkZmluZC9yZGZpbmRfMS42LjAuYmIN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmRmaW5kL3JkZmlu
ZF8xLjYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JkZmluZC9yZGZpbmRfMS42LjAuYmIN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwLi4zYTE1ZmU2
YzlhMg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9y
ZGZpbmQvcmRmaW5kXzEuNi4wLmJiDQo+ID4gQEAgLTAsMCArMSwxMyBAQA0KPiA+ICtTVU1NQVJZ
ID0gIlJkZmluZCBpcyBhIHByb2dyYW0gdGhhdCBmaW5kcyBkdXBsaWNhdGUgZmlsZXMiDQo+ID4g
K0hPTUVQQUdFID0gImh0dHBzOi8vcmRmaW5kLnBhdWxkcmVpay5zZS8iDQo+ID4gK0xJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5Ig0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1mYTIyZTE2ZWJiZTY2MzhiMmJkMjUzMzM4ZmJkZWQ5ZiINCj4gPiArDQo+ID4gK0RFUEVO
RFMgPSAibmV0dGxlIGF1dG9jb25mLWFyY2hpdmUiDQo+ID4gKw0KPiA+ICtTUkNfVVJJID0gImh0
dHBzOi8vcmRmaW5kLnBhdWxkcmVpay5zZS8ke0JQfS50YXIuZ3oiDQo+ID4gK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI3YTQwNmU4ZWYxODg2YTU4Njk2NTU2MDQ2MThkZDk4ZjY3MmYxMmM2YTZiZTQ5
MjZkMDUzYmU2NTA3MGYzMjc5Ig0KPiA+ICsNCj4gPiAraW5oZXJpdCBhdXRvdG9vbHMNCj4gPiAr
DQo+ID4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIg0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4g
DQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzE5MTMzNSk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMTkxMzM1DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAyODQ2ODkxLzE2ODY0ODkNCj4gPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS91bnN1YsKgW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gPiANCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5z
aWVtZW5zLmNvbQ0K

