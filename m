Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F32C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:45:19 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.74])
 by mx.groups.io with SMTP id smtpd.web11.27285.1700088315655458505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=XMr8rnRP;
 spf=pass (domain: welotec.com, ip: 40.107.241.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4XMR+T66rZPmOMPNaB8SxDq+OfkqRMcHrHddyJjLZEAtKTKwbPlf/R5xsS8LCnl1lSmYEC6xaFT2od3GLqN8i1IcAsOC8M0L4grJbTuLV9tvSs+LjXHbTSeRPRuE5tTfdVivOkTQlHBA+krJcTDHw8hP0oKH7sWDqeUznrS2fB4avcFQAARPvoHNvNxAj9MsgFn/k2TcA2UvbArLBpVfy8b/tSIpJnMmflvMKNDsz8RPR9iQy/LoICUMZLhi6BvkjQbFZz6Bmqi5tgqND6v0pZ/IdnvsekRA/nihtRRBiGA/PPr09rgQqTJLhSvOSi8ryNrl9nzz99SYc4/+hOw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93MftESzFF8x33v3W5G/Bx3c+N2MokMax10Kr63i/30=;
 b=OAdj2rj/XHRc4Qlm6QTPtf0/aIRBWqwJgXovVdPCrCgVRu/FFRE72F/nm4I2Efqp/pQv9LNlIUVzEXoPg6ioMV3vuN0XSpEdwQNVG9k3WDJW8yMir2IfQdcL9L2+IQVWzc/u+GxyV7FW7e16RX70JnpU/2NTEcMj/8YfalKxvXXfAk0+76W4fT92/Ij1MYkzmjuSlzW0NHxPiXfE/E4dv1rdVaLoRV5eQKOrJ39y1MDzXRb4OwLiADraCLnKMNZd8lmfB5hn+JNKXBb1KPwg/6eJjCUh17EoHQzwlnaun95Zj02oNegakdfiSI7nEa76XqGubpTORzzoTrOSNnyM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93MftESzFF8x33v3W5G/Bx3c+N2MokMax10Kr63i/30=;
 b=XMr8rnRPDKFcj48iGT79e4MfAB9rL4F8oiG8IFqDvnT/eMdN+FK0XaPs7B7CSx5ecRaRQdKf+uDXbn46eKOhd0EhwKU+3Cnmq8nK1W9lZy7zX5rAEfu4VaM3HBJ/GJEuUgt3MX/uANA3ZzBXSKkBhllEZuIbbfBOut9xTC+swQU1MP4x22MTNDNqcmse3DfKKWIjsz/Fmf+152zO0hLmfek5vYViJnw4znXtwAFvfU6Zx3E5TH8aDCMYJj+lwvAOSD1jGOECg9Z3Ao6i0NrX6sfGiCwZJooYXF2SrOtgKj9PsdR/YsJelLujg6hJg1kpG5OzXfiXXky3iUU9MdIG7g==
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Wed, 15 Nov
 2023 22:45:12 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 22:45:12 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 2/2] ca-certificates-native: add certs path to
 SYSROOT_DIRS_NATIVE
Thread-Topic: [OE-Core][PATCH v2 2/2] ca-certificates-native: add certs path
 to SYSROOT_DIRS_NATIVE
Thread-Index: AQHaGA4o6mxgkfrf4kek9zqBShHNarB784oAgAAHIYA=
Date: Wed, 15 Nov 2023 22:45:12 +0000
Message-ID: <5989200.lOV4Wx5bFT@latitude>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
 <20231115215256.867653-2-p.lobacz@welotec.com>
 <cd9e75ac975fb17876a7c85e8bb4f6a69bf0e311.camel@linuxfoundation.org>
In-Reply-To: 
 <cd9e75ac975fb17876a7c85e8bb4f6a69bf0e311.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6475:EE_|VI1PR04MB9761:EE_
x-ms-office365-filtering-correlation-id: 03971e2c-fb74-4f8c-c65e-08dbe62c871f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SuZ/WDLLfS7SGL5aYNkhNzgR0oZ+3KYN4NHfUpfYcDO3D6cG2x4cWDpIdZxVPNm8HgV/xInW55gVZTpGuSj5hi+jeUt2W2oocc3ypootHXA67PQLKAvaJuHaB1feeMWtrd3+htdgxo5NfV0QpJk5OhI3Z1/JbQJWUwT7KJZgXKE+E+laV9elPt5cxPH+P0lwtWCb222Zk6fHns/sRZGBYDiTZkOZYLmIajMW/1DBP2k6R+iU/aftZKNJABTmN0U2mLWJSJGkrWcsQSEBqudOxVJB8zafHVibgWIXYaTxYJshLRYN6JmTBlQInDdbLZbyFrZKX4ScKwy5YPDFXOI+sBecVUr+k8xSZrdJ1LziXSbpKgoM1xAI+qLnPARRRDpcLp+6NoLjPPB7U0sbjYb90e8DLzPkWpjsjFTQQEdfdiIPI7azM+W+aGwyDi2HMcA+v6ZhYK+fzeBakZkFWiikiDAYHE2UgFPqu0mAJ+WdWJkVTjACGGYNni0ndIZQdbkwQeySE6nCqMQRsXdmJLJpKlSEMiXP5t2CltNxyFoaBBuW5PPhjlwwC0is7AmFjAg8twRcrB8DAP6Azvp99qztsn0xQKgxH9eYDp29m5RYgEcsV24elRX1fFbkQcbcCVkNFgGpS8a+k9TQ+qyMpZS//g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(451199024)(64100799003)(1800799009)(186009)(66574015)(6486002)(316002)(33716001)(71200400001)(9686003)(6512007)(41300700001)(2906002)(8676002)(5660300002)(6506007)(4001150100001)(122000001)(66946007)(76116006)(66446008)(110136005)(64756008)(66476007)(91956017)(66556008)(8936002)(478600001)(85182001)(85202003)(38100700002)(86362001)(38070700009)(26005)(39026012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MGZ0MmpmYy9iUFVHTE1TcXZnbVdjWlZGOVdzYkV4bEx2QVdIK0ZzMk9qUTA5?=
 =?utf-8?B?bVFxK2RVTzJIMFBiZEEvTGNxK2FNQ2hqQzRMTlhETDd1LzJhM1E5M0YwRnZ5?=
 =?utf-8?B?M2llcEdIakxRQ01xbEJqVWtUQnY1aFdBemZuMTErbGRiVUpKWmN6dXQwMDB0?=
 =?utf-8?B?Y1lIWlp3UDAyamtJOUs1UTdQbUhKL04yTjdsVUZ0UFpVMmJuUlA4YmprMVRN?=
 =?utf-8?B?V2Rld3YyRWl5RURpcHNZU2tsbVZnamMyL1FVWldEbWs3Q3hvZVVzdW5VTHJW?=
 =?utf-8?B?anVMUXlvNkkxNlNHVDIzbElDb2lhQXpnclhVcmh6VXdMNEdKQjh3RFdrdGZs?=
 =?utf-8?B?Q0RweDAvK0sxaGJEL1VLZGdoS2o4TkJZbkc2MDZhRzJPZWNTenNNMFZycDlu?=
 =?utf-8?B?Y2drcXp1VDFTNWhkY3d5MUNIL1pPSDBIaG9JMWtlZ1pOR0VUcWE3RWZtUEVD?=
 =?utf-8?B?Vkp3MCtaRXhLR0t2WmR1ZFJuc1NFVnJHV1pFeldpa1dGZ09VYVhzbXg2c3hN?=
 =?utf-8?B?b1o5Y2t2Ri9zM1ViNk94djBOSzVJSmVDMW1pMldPSE9mcHNkd3E1M1IydU9Q?=
 =?utf-8?B?cHZTQmFoQmtkcFh4aDl0eVBsLzE2U3JKK1BNV0hsV1hkU3Byay90emMzSGZs?=
 =?utf-8?B?cElDOXNxRndQQ3l3MkpHQ0k1YURteWEzdVNuZ045WjVpM2tRMit3ZWlvR2dM?=
 =?utf-8?B?bFBGWXlkQXZ1Z0lCVkNJemVHWHloQzh5RnZLekhFenhxSG9UdU9EWHBuTUFJ?=
 =?utf-8?B?RmtoUXRkV1ZDWUdIdG5vaDgwUm9wRmJHZ2dxV3QrcTVlODYzZ1ZsMlVxdTB4?=
 =?utf-8?B?YzM3bkhaalZDZ3BqVmIwaGJlR0VKRFArcE1YS2s5UEIxWGw0UHRSNkFQSnZN?=
 =?utf-8?B?Zm00eTFOeUxzZGp5SXc2K2ZTMEtyMVpjVEt5QlF5V2R2WUI3R2xrUnlIVGpE?=
 =?utf-8?B?R2E2Rmw2YzNWbUhsY2hwOTNMNm1Idlg5amFCb0xWZEp1NDZaYk9kaGJOYXlZ?=
 =?utf-8?B?elFiRUdlbEV6MzR4S1Y3UjFmVnRkVUtuakNSKzhtQ0dSdUVXcmswQy9vOEo5?=
 =?utf-8?B?T2JQWGJFZjR6cnZWQkJtQTVDa0VQYWJDTktSNzcrL04ybnhsZDhWYk5GNUEz?=
 =?utf-8?B?YzdiREJGRXV5cUdrSWJxVjUyM0FPMFhzd1FqUjhlQzJETXltWTZzei85RE5I?=
 =?utf-8?B?ZmY0c3JkZDdDTlE1MlJScnMxOTM0dTBZMVA0TE9uSmJtc2VjSDBDV2dYUDVC?=
 =?utf-8?B?VXNWTWhoTUFQSWdOdGtSNXBmV0VYcUladDEraDFOQVNMSjgwaTZWVG0zaGxs?=
 =?utf-8?B?MzY2TWRFY3lkZFRIUHBHblRvNXV0ZGFuclFWOFowUHdJaWtLSzhHdTl5OGhx?=
 =?utf-8?B?clpQMVhlVVRhUnlxalEwMUxoMUJwZmpBaE5hNTVHbFAzb2M0UVBVSWdDWmZv?=
 =?utf-8?B?c0tDdFZnSkhHNTBlRURvMGc5K3ZBQmZhNmhZdCtmYXdRdXpPS2VJQjJvZmNZ?=
 =?utf-8?B?VUZGak1WN1dzam1PQTNrTW41YmhQYTlhTFZiaVdQSHNSRmRqQ3BXRDNOZExT?=
 =?utf-8?B?SzM1Qi9mc0xDZjRZL1FRYzV0cXpzWjFoeWtxQXV5a2oycGlYeCt0dXVmL3hR?=
 =?utf-8?B?N1NoZUtmN0tMOGJ2K1JoZ3Y2dm9zbjR3ZG8ySFNRMnorZGZMaXZYYzVsTzl5?=
 =?utf-8?B?YlZNSEVabnQ5VUVQZVNPZnRIZFZPZU55emVJbHV6anh2SGtXKzZhMWtzeFFO?=
 =?utf-8?B?V2U3Y0czQ2xuSldwSjJacFpPZnN6eCtqLzhRQTd5THZ6YnBIZWVQeHNXQ25B?=
 =?utf-8?B?SjdFMnlYdTdKYnVyejBZT2dobWQzdzQzRm8yYnJVcG5wNmtNZWVVUVViTWpR?=
 =?utf-8?B?TUJ5em53QXNpNXVZVnZpQXU2Q09mbkk3OHhCUk5BUDRBTmFDc0JmTE40WXFW?=
 =?utf-8?B?QkFOaDVHUWErUXZOVmFNUXNDSmtyNi9qNDI1TGJGeWdQOUgzMkFJNkFmbkdL?=
 =?utf-8?B?MlR0d3R1YVluZmJPYnlPZ2YzdUZOeWIrSkErRW56aEpWSEsxWmgzQkdDbTZ0?=
 =?utf-8?B?MVNXa1plc2ZkblhLR1JiaDl3OGM1d0VDdmFVUnNub0gwUUEvOTI4MDZqZ2FB?=
 =?utf-8?B?dHQzVys5MFFsVEZwa2F4bUZoVVM4UTJJTUZPOEkyWisydGliV2NBbUtTQWRN?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86323D8EE8F33C4CAA45982294697A34@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03971e2c-fb74-4f8c-c65e-08dbe62c871f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 22:45:12.2822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ay0+nXoF7NDLToYbS7ykrn0UMaGsOkMkanEltNq1yTM4TFqxMxNqbyKR5u5sDT5Firf80IQusnwKxh2eQrq08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190749

RG5pYSDFm3JvZGEsIDE1IGxpc3RvcGFkYSAyMDIzIDIzOjE5OjQwIENFVCBSaWNoYXJkIFB1cmRp
ZSBwaXN6ZToKPiBPbiBXZWQsIDIwMjMtMTEtMTUgYXQgMjI6NTIgKzAxMDAsIFBpb3RyIMWBb2Jh
Y3ogd3JvdGU6Cj4gPiBBcyBjdXJsLW5hdGl2ZSBuZWVkcyBDQSBidW5kbGUgZm9yIGVzdGFibGlz
aGluZyBzZWN1cmUgY29ubmVjdGlvbiwKPiA+IGl0cyBpbnN0YWxsYXRpb24gaXMgcmVxdWlyZWQg
aW4gbmF0aXZlIGVudmlyb25tZW50Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciDFgW9i
YWN6IDxwLmxvYmFjekB3ZWxvdGVjLmNvbT4KPiA+IC0tLQo+ID4gCj4gPiAgLi4uL3JlY2lwZXMt
c3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjExMDE2LmJiIHwgMiAr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdp
dAo+ID4gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNh
dGVzXzIwMjExMDE2LmJiCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRl
cy9jYS1jZXJ0aWZpY2F0ZXNfMjAyMTEwMTYuYmIgaW5kZXgKPiA+IDk5YWJlNjA2MTMuLjBkNTVi
YWU4NDUgMTAwNjQ0Cj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0
ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjExMDE2LmJiCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjExMDE2LmJiCj4gPiBAQCAt
ODYsNCArODYsNiBAQCBSREVQRU5EUzoke1BOfTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBvcGVu
c3NsLWJpbgo+ID4gb3BlbnNzbCI+IAo+ID4gIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFzcy1u
YXRpdmUgPSAiIG9wZW5zc2wtbmF0aXZlIgo+ID4gIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFz
cy1uYXRpdmVzZGsgPSAiIG5hdGl2ZXNkay1vcGVuc3NsLWJpbgo+ID4gIG5hdGl2ZXNkay1vcGVu
c3NsIj4gCj4gPiArU1lTUk9PVF9ESVJTX05BVElWRSArPSAiJHtzeXNjb25mZGlyfS9zc2wvY2Vy
dHMiCj4gPiArCj4gPiAKPiA+ICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCj4g
Cj4gSWYgSSBsb29rIGF0IFNZU1JPT1RfRElSU19OQVRJVkUgaW4gc3RhZ2luZy5iYmNsYXNzLCBp
dCBoYXMKPiAke3N5c2NvbmZkaXJ9IGFscmVhZHkgbGlzdGVkIGluIGl0LiBUaGF0IG1ha2VzIG1l
IHdvbmRlciBpZiB0aGlzIGlzCj4gcmVhbGx5IG5lZWRlZD8KClllYWgsIEkgc2VlIGl0IGJ1dCBz
b21laG93IGl0IHdhcyBub3Qgd29ya2luZyB3aXRob3V0IGl0LCBuZWVkIHRvIHRlc3QgaXQgCm1v
cmUuLi4KCj4gCj4gQ2hlZXJzLAo+IAo+IFJpY2hhcmQKCkJSClBpb3RyCgo=

