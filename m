Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59009C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 19:24:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.133])
 by mx.groups.io with SMTP id smtpd.web10.2062.1707247442079579978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 11:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=WS2uQ/s1;
 spf=pass (domain: nedap.com, ip: 40.107.21.133, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z22SCqCd+RMymxtygT7r2V8XFGVi7xgbdqBjMhPJ+ghxGe8BVqHmOSZcccjIutiNHlIWxfvP72kcZLYgIR+UgyvcdTEyReSTju8OUbm9T+KyjyHRNH47I9vR+DbkZB/jmlZrlcuRTxeCfFuXAmasZ01GjGkJWcC0DuMRMFVLx/3MLrz5n8zUfYFLtBjxdA/7xWAGicz8hyuG+QcACZ78JVL/ACasX3k9VLe0Cr1sw5EZ66OKwgLstiAsflMp2WUtAlK8kmo0XB7ahXlLOzS8GNNULs0bbcsz7m0C//x90NWuc39aBY1ly57SMtQ3OCTeKJHMsk9gydGIuP8TejtSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8OAe3vFlrqNhkKQbeJJxHIw4dRsBfAG9sz7rewj4gg=;
 b=I3RXjMx+D+KI9zwrVY31pw9LDHwzbhTQJiEwxHQ7h2v5VqsoH9sxxV77omUrjJtvAeo7TWdcOJLdaL+YTLhBrMbVLueTuCgc8FF5+gOf/HMnpUWsAK1hys4odd/CE1yqsTOlkylQ/BYmsbfPGNb10ISaq9jQ+11ST9x9XfKwCnGXPafTwwlyCmbiEMeiWFphmz5nj2V1UKmqk6aT7cbAfwuFqva1KIZ9c8U8CUbZzktoMwntr/Bf9aPurppTmv7I5CiabRgxy/qYkv04O/B+cbkGIz8t3CaKZDlHkr/tHhd64LNJHvkjxyIl5Fah81e5qnp6WED6vvt3b3ojQqw2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8OAe3vFlrqNhkKQbeJJxHIw4dRsBfAG9sz7rewj4gg=;
 b=WS2uQ/s11qRmoNHWoQuowJxupmnCDx34sQ8wmiloxmqA/bRSj7DaC197Bugas7sarrTP0gIMMXzSrGq3GG5vmBifb3jrbs3+h/THzSTZkN0rnrPWnh8z3ll67HLZwquKr6zwhK7Ie2+KBMJp2mL0HT8gS0z8SdFM/IRPWegGy64=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AM7PR10MB3795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 19:23:58 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 19:23:58 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Andrey Zhizhikin <andrey.z@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Thread-Topic: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Thread-Index: 
 AQHaKCweoNQ7B/z6PEScELiCQX1qz7CcJLuAgAAJqYCAAAJAcIBhl9r3gABFTQCAAACNAIAABOtw
Date: Tue, 6 Feb 2024 19:23:58 +0000
Message-ID: 
 <VI1PR10MB3182DDD4183D1C53662DF392F7462@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231206092536.2874022-1-andrey.z@gmail.com>
 <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <17AF75010791E9CF.16460@lists.openembedded.org>
 <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
 <20240206190246a3a66e24@mail.local>
 <CANNYZj9nB+-L2V1rpyfnTrz5=Y-6GDd9bggtL50C35DbMFvoEQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9nB+-L2V1rpyfnTrz5=Y-6GDd9bggtL50C35DbMFvoEQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AM7PR10MB3795:EE_
x-ms-office365-filtering-correlation-id: 33067010-b9b0-48df-e704-08dc27492ab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IHBXqoLs2n42cKpTx0AMDK77ZNmV2+TeuIsXUdrBQTCvPV58cf7R9dn23nlEvGXmAG16kFeoMF8W/STVEKSOGRjdzxseGE7i0Esc7TDIBp7rsiR9YLy34pSt1sJW/IP5Q6uS9heyl44NNkgiUKTuKamcOpcDnDBd6hRepur30dNZ/4CP7ZOWhNjEK4RiLIcb9yfkYZrNAPgSGZs8z/ySgnHa2gUEnpMYSFUeOoICyxITS5cYJc03+tE+UDeTwQ1fSrhVmo2ORAWz+WqSNJE5t4lbRICVnqzXnpN4n6Xs7p+UBmLDD+QeeKhNQU0ZUS1tONe/G/XG9pEQwl9Uu3x5YB19AvMHUxwT7naQ/bDl405n60Johc7Kn3TYlJ5D2s0jnpj40u8rNi7q7TrP45ds8Z/NLJOZr5sTPZuy4EmdtB1DIN2ZAClm1mzbrJzwxwiAB8/zFQVc8iePNviu2X4VSH7cAaRT813P69LtJC+jhhn5cKI65/nPI9B5heQ9y9Hctv0qas78tz1WJbzukZxmyHR4w4XUd+o70jMijx/cQtHVa3AX0QySg+CFPTSlIVbiv+qF4oomv1PogDZgh1Di88MCqr0fOycXIyp6wCyNbGzbvwBJz+Ivb3X1WEV9QLvu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(39850400004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(6506007)(7696005)(33656002)(55016003)(122000001)(83380400001)(26005)(86362001)(41300700001)(66946007)(52536014)(4326008)(8936002)(8676002)(71200400001)(9686003)(478600001)(2906002)(4744005)(5660300002)(54906003)(66556008)(66446008)(64756008)(316002)(66476007)(76116006)(44832011)(38070700009)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TENwUDlYdWpyc1ZtQ053ZzVBNSs3b2Z5QllIaTlOVUFXZ2UxaUQybHhtRVJU?=
 =?utf-8?B?WmNZSS9ER3dVcFJqZjlVL2RnZ2EzaEw4Vy9DU24va0NQaHdQMW1mc2MvcHpz?=
 =?utf-8?B?bkF0OWdkOXFDRTRCL2xzbTIzNTE5MjRqanlNSUhFMXJENUZLLzBzUE56TytY?=
 =?utf-8?B?cUMrMnVidUNmM21YUlJ5L0Y2Mk15SmRKTVpIRHdYMGIzdVArOWtyc2g0clVU?=
 =?utf-8?B?bEFzS2E1WXNmQkgrckxobGNxK2VVMUVuYmxmWHdGNnl1RmRiL1hnYlhUZW80?=
 =?utf-8?B?aFhnOVRCR2FXU0EwbVFIdXZBN05PV1JZYVZuMWlwSUFFVC9TUkh0ZS8zemZF?=
 =?utf-8?B?ZHJ6V21rZW0xL3c5VzdscEFmM0FpTEtacnZ3ZXNYN3l0ellWYU1DWTdFQ1pp?=
 =?utf-8?B?RjBHOWhwb0JEZWNxNnFnN0NhQmQ4cDNrWDNIRkdsdXNERVF4cWRnWS9Ha0Fa?=
 =?utf-8?B?aFd5aUdLRXRHb3NYRThoS2xFQzZjZEtPYWJsbGlqcmxKZ3dOcGlWOExreUxy?=
 =?utf-8?B?YTZMZWhPbG9WdW96ZmdFWkNIOEtMellveWxUTkgyOG5IWFRoSERHSkxmN25W?=
 =?utf-8?B?RGxqWDR0Ujg0d1V4dlNwajBrYlAyZjM4amtSaWZrU1lVVHBhd3ZReG4vSTBK?=
 =?utf-8?B?SUVyU1FHZ0FIZWsxVUxRK21HYmFKME50ZTUza2pEWU1TR000VTZod3JqTFgr?=
 =?utf-8?B?N2dWODczOEIxTG5STzRZRmFKM2xjN2dLNGNHUnlHTWJ5TjRKQXl3NjZaQ3dT?=
 =?utf-8?B?UmlsQU1jaGVRN1c5ZDZ1RE42Z0RpSEUzanFoUXd6SFBGbGNlUHB4NitIUExR?=
 =?utf-8?B?RGNiRlZ3dkxtTEoxTWZRWFUxclZQem1BM2ozQ1I1ZE9XTFgwNEcwZFh3QXVF?=
 =?utf-8?B?YUNlOTgvd3Z6S09NeWNoa3F0WE5BdllmVnZJUnRwbjJoRUtVdnByU3MwdmEr?=
 =?utf-8?B?NXNMV1hwTjFEQXpycWxYdlFtbWQ0WERCaFVYZkxJajdxN05QcXdGdmZiZzZJ?=
 =?utf-8?B?QmRDS0xUeVRsYU1CK1c4NlkxWG1ISko0QnV6QzRQRE1Lbmk3bG9SUVhwNjdk?=
 =?utf-8?B?YUN6WldNMFVmUjJjVUwyZU54UlBPWFF4Vk9McHpGOUxsQUhGUjFpaUJzOVVq?=
 =?utf-8?B?c0pkSklxN1pUWTNld09RbS82NWM1VllMNysyWm90MHZ4d1Bjc29JZXlsVzJ6?=
 =?utf-8?B?Z2xQdlVLZFRkb0V3b2dMVUdKYUtDUEthM2R5TUpVUlF5a3hBR2ZsejFJYU0r?=
 =?utf-8?B?YUNJMmd5bVc3bU5JUEl4Qzhkb0l0TklFVS9jb05LWnR0NU1MM1dqM1VTRk8z?=
 =?utf-8?B?eWhMQkt6WDYxOFluY25GUVBqTlNXdkF6ZFhSRCtWWGNUNWltd2FjdXowL3hn?=
 =?utf-8?B?aVdkSzQzMklQLzhxbmNKd3dBazREdllkdERtSXVZei9Oa3hSODJaSFYyVDlG?=
 =?utf-8?B?V2VhajZrdCtLd2xpbVpCeDdST1k0RUViTVJlenpyelNVbCtDdHpmc20zWHh2?=
 =?utf-8?B?anlIOXcwZ1lwaGk0b2RmaXRMQ2p0R3FmR2o1eHRVSERpL1NWZFJlRzRyUmg3?=
 =?utf-8?B?dXFJTUQvUWw4ZlZzaXhUUm0zUmtUY2xvQ0F2TTZlbHE2MHFmSXdqajVWVXpX?=
 =?utf-8?B?WVJ0cjN2K0dkc0JOaWZ5ejhjWU43aFg5dzM3cjV3emZGMnEzamtmVHdPcHVB?=
 =?utf-8?B?c0JjWHBHMHB1dVd0dFlhMzZqNkE2Wk9PVXdTZTVTaXRjN2NVR0VxQ0taNkZw?=
 =?utf-8?B?WkwxeEhwYlkxTzJlUnF5RXRZVmIxSzlxcTBHQWFkSEVXVXVwZytpejhnVHFU?=
 =?utf-8?B?dURuUExmWTJvWndsRmFrWnhUeHZtT2RyUTI3TUZpSkNjMG5YU1Rwdi95U0pN?=
 =?utf-8?B?b0QzK0Y0RHIxQVM1cGJWWndwWCtFdnk2c0lLNXRuaVFvRWxoRmJTYVhmdStm?=
 =?utf-8?B?dUZyalJPaEhMNzVUOFMza2Rpc1Eyblo2UU9lSWVHZnEwb285NFlnL1AzWldY?=
 =?utf-8?B?NktvL1FQM1ZKOHpBcVU4cmJYcVE0VDhBWDVlRGpFWHZIQUxFM2t0b2RMa0t6?=
 =?utf-8?B?bVJ0NGVTQmJDVUFuaTQzYVk0SE0yTktPODIvSWlPajZnTmg2SnM0azdoRHFy?=
 =?utf-8?Q?wwOaeop1tVZeUddtsjWGvCkDu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33067010-b9b0-48df-e704-08dc27492ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 19:23:58.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tneNMpCrETIZpVPU2HnZSU68y5MhSf8kLbQM0pd64wOZDzXrGGrIuZ8UYAabSYcLfx5rUZMvl2f9HiDTEqPkGbiTujp29kEQ2IFXrc4oCdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 19:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195025

PiBSUCBkaWRuJ3QgdGFrZSB0aGVtIGZvciBhIHdoaWxlIGFuZCB0aGV5IGNvbmZsaWN0IHdpdGgg
eW91ciBvdGhlciBzZXJpZXMNCj4gdGhhdCBJIHdhbnRlZCB0byB0ZXN0LiBJIG1vdmVkIHRob3Nl
IHRvIG15IHN0YWdpbmcgYnJhbmNoIHNvIEkgcmVtZW1iZXINCj4gdG8gY29tZSBiYWNrIHRvIHRo
ZW0uDQoNCkF0IGEgcXVpY2sgZ2xhbmNlIGl0J3MgcHJvYmFibHkgYmVjYXVzZSB3ZSBib3RoIHVw
ZGF0ZWQgdGhlIGVuZCBvZiB0aGUgc2VsZnRlc3QgZmlsZS4NCkFueXdheSBsZXQgbWUga25vdyBp
Zi93aGVuIEkgbmVlZCB0byB1cGRhdGUgYW55dGhpbmcuDQoNClNpbmNlcmVseSwNCg0KSmVybWFp
biBIb3JzbWFuDQo=

