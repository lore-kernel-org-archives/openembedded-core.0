Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24E3D31A23
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 08:07:52 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5865.1768378069884298504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 00:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=Em4TSGWU;
 spf=pass (domain: phytec.de, ip: 52.101.69.141, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDnKV7Cw75eWw7u70Zg2iQAvHYZUVY6CU9ONwVKXt45S/OhqBsnXI2vOlOg22VG175hNqrwqihRs2Skl6CBTbahe5IKn0jr78ZcUx6FERJTeGoGmJN4FKwkLo0N9kSTpLnd2TdAesJMfA4LnLJl1CBqWWT1tjxnBnF5T3vFKtXnugQkbGVIFIfSNnPvcT7V7mObz9WukmZaiRiTzcyeuJ+HgAzckXQNHRKmnhFrjDmHgmjdIvqyoLwFgFyaEr8Jv1sS+yS4x2WIwIIi4DsYnb1PcbCqYz2HjV8p3cM6VxzwcgBb6AKmRkz7XNaWzsYILFX94EJf974IaG+19ajWQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pquOvi0Lz6Eznvlhvq8u6Bk7zWkLnFPO5tx0diLz1I=;
 b=ur1YiOfKgUMv5pRH5yh4UUUiCDbQIqSMoI+7kpnJ1hTaM3cEYM0LPNQ4u0j7LXMbePz2Nzc//qEendO6AqTmL0jQrcg8FQcGVZ9DT36SMcTAtfK9XNp8IRtjpH9krlmkY982SIOKdsxg4ThNhlDFio3VNIgOESWyPUS8n64v6bnYMRdk4LyKVYbX5HjOC8Yg0767CqN3GaTlo7nYgX5KN8D4JTyz/jS+LgfKAAol0lZihXAguSEPEBf1v94LX3IIYN6DhlhLWinyV5AewuuZSwkC1rTz7NRSstFGlJ1jEqeYxTE2t6wzsi4ANIWYwc9Q6y3Mp7MU/LDVQYHY6zJuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pquOvi0Lz6Eznvlhvq8u6Bk7zWkLnFPO5tx0diLz1I=;
 b=Em4TSGWUcqvLx5yyRyL+zwJ6TgIjvNX0Dulgi5KBZkaSfWwkrs2sYXum5LuL0K0YbnYUUM08hHNbiIm3EwXi7P8g5iaccTPm3wst6WKPA7wf+HHcs9FaYywyt4uCFPSsGyVLbn7eUI3nA04GF8EZ//G8lcYq/5ad3kJaYvL9eMMaAy1hBUlqrT3rQroY2uToa7dmKhrrdEFCmp8i+yLiQ6u6youIyXG2UR5HjZPXxGnLfHFXhrujdrLA1nAE1xsCdFOMdWSC3A94UvTHgucKDAIVIUfPlGtgNn4DtL52rAtAJh+SNnNTJINMzd92tmld0LLi29+9zFkBEMUmyd09gA==
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::14)
 by AS2P195MB2299.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:590::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Wed, 14 Jan
 2026 08:07:45 +0000
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::1f1b:2a8e:8507:efa7]) by VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::1f1b:2a8e:8507:efa7%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 08:07:45 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>, "upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [OE-core] [PATCH] icu: split at '.' instead of '-' for major
 version
Thread-Topic: [OE-core] [PATCH] icu: split at '.' instead of '-' for major
 version
Thread-Index: AQHchGZ7iEvJMQ6zdk+rTy1Aeifi2rVP6jQAgAAhN4CAACu/gIABGcIA
Date: Wed, 14 Jan 2026 08:07:45 +0000
Message-ID: <cfe9f8e40308ca0276578d109b59d467552c80c5.camel@phytec.de>
References: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
	 <CANNYZj90X_vSfAhUAVhiik+RNKSydLMD8iv_AoRHUAm1TQSjzQ@mail.gmail.com>
	 <458f839bc4a7f231cf4c1a8ea442bbcd5601a353.camel@phytec.de>
	 <CANNYZj_OyYm5djfbH6VcsTd-jEYbQ8Shn4rk0Rk-bMHx=XwWqQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_OyYm5djfbH6VcsTd-jEYbQ8Shn4rk0Rk-bMHx=XwWqQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2491:EE_|AS2P195MB2299:EE_
x-ms-office365-filtering-correlation-id: b827cb95-5ee7-4af2-bd09-08de5343ffae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MWM1YUhTNFdGOHV0UEdZRVdIT1BuZXpmbVh0ci85TDM0NC9pL1d5L3FubVkw?=
 =?utf-8?B?OWpOWkJwVXRHMWU0b2NLVlFzbzdTUTVuU0dmWkxIbFU1emJzU1l4aUNjNTZC?=
 =?utf-8?B?UUdnTkFXcHJ6UnorQTRqV3ErS0pCbzJzUDRFekNmME9mWHpUaTdIQThsa3BH?=
 =?utf-8?B?Tkptc3BSUHVqdHdoWXpWcnU5Z0ZmMkcxcXhXc21UVlYzamJCU0RKd050T0Nj?=
 =?utf-8?B?dDZPMTd4a0dHdnI0N1ZxS0dBSk1jZlkrZmdzaUUybk5QVkpGcFVmSXJyY2pQ?=
 =?utf-8?B?ZVprVEF0S1NUanNKeEtSdUhSdjYxeHlleThYeFcycFVMQUR2Z2kwQjErWWJD?=
 =?utf-8?B?a01tc0VVT0VQUXJtbithS0ozcm84TDZMcFRiY1lpYTdST1NnUkJPV2RxRmVv?=
 =?utf-8?B?WXZ6c1hMbGp4OFc3MXl5OXRUcXFJYWpTZmsrTk1iSW10NmNnZUplWktIZzd5?=
 =?utf-8?B?UWpQVGRQdjdBYmVIbjN4UENScTJiYlZKWU1CYmxpeFJ0eFBTQXZ2eitYd1Jo?=
 =?utf-8?B?dUFuUWtPQmZDTmRsZmx1OHgvSXZnUVAwSUdOeHhxRlhOTHYxZERWZTJVdllS?=
 =?utf-8?B?UDBTNHpoTVhJeXN1L3hqcHRUQWllQWxzSHhBL215TzU1TDNhSGQyTXlEK3hx?=
 =?utf-8?B?VERJZ3J5U0M3cWxXc2lzYXp5WWtGZ2NsbGt2dUh1TW9VQSsvY1FObU9OYmJC?=
 =?utf-8?B?dEYwYVFwN1htLy9qYmtOM2FHZVpEakZraTUyZWExRURaZFVpT29CczRWNTRK?=
 =?utf-8?B?V3VnVjg5bEZCTDh6TVJ0VU0xcEZFZWhsOC9PM2xSRDdmeEhSWmlkTE1xaWI2?=
 =?utf-8?B?OW05cE42azBSSFZXU1RYYVlwM1RkZUUxUi84OGJMTGVGVC9uQ1Nsa0VEWmhB?=
 =?utf-8?B?SFg4ZzU2YWpFMzd0S3FYS3J6bmhkTTIvTVhWZkw4aWhxaVFyNGoxbVdhbjIx?=
 =?utf-8?B?QzQyMDJFY1Y4czErUzVpVzNyeGxlUzQ4NW1xTnpEKzBoU2lnVnJyaFJuVG81?=
 =?utf-8?B?UEJjcjJGblZrNjNRYUl2RnprOHdvN0ErZlhDK0ozTE5GZXhiK3dEVmNiWU4y?=
 =?utf-8?B?aDcxNkFpei9JVVgzZkg3R09aVGp5VytxQjFQSDhLUWFiVHRFT1YvQ3RsY1dO?=
 =?utf-8?B?YzRHdDlkN29CVXBGSENJT1RVanpTN0VlK0Q4Q2N6MExGbGVJUmtjNnlNdVBN?=
 =?utf-8?B?elYzd3hROUZFMi9KTHFWc2xadFo1d2xnbVVrT25abWdnMVNpamIyNEZVZ1po?=
 =?utf-8?B?NnF2WTYvS05yeU9lL1hzQ0dzZ3V0YUU1dm5KL2YwTGlnRnhlcXlRanV1NEkv?=
 =?utf-8?B?VExlS1NrZVR4Mmx4aVQ0MFdrQndPYnZpNk4wNXprbUl2emNUZ3RtaTJPbTlY?=
 =?utf-8?B?YlNsRzRISCtBYkRxazVONjlPcnM4U1lGcll2bXI4dnB6aitiSTF5SjJzUTA4?=
 =?utf-8?B?UERnNGxjZlhZbXZYMVkyc3JTbHFFK0NLZGFZTVVlcTlGTW0yRk1PU1hsNVFL?=
 =?utf-8?B?T29PbVNDeHVGQ0x4ODJpaDAwc1lVb1BUWkJsWVBiMERMKzY2cWlKVk8wVUZ3?=
 =?utf-8?B?Q09Mc25jeXEwVHFtVFgvbmJUd2pySC9DaENRZVFoUGszLzVBd0o5S1pySzVk?=
 =?utf-8?B?MlZNb2UxZ2tnWWE0bW1TNWJHK09kZDg0Y1B3aFNyZ0pqRytvbDVXWjJ2ZXRW?=
 =?utf-8?B?Q1RxVmVYOXhzRkNUY0poVG9rTFhDajZ3bHhmTUxNZCtseDBPNjl1cGdVSUZ4?=
 =?utf-8?B?T3ZRbG5JWmxmc1RnQk41Z0M3ZmRCOGN0L2JydERFYlJpeTl0dUwxRWNDcGlK?=
 =?utf-8?B?akZzcmhnbE5YbHdmN096NXJ3ZHZkbEhnVWVJY29iUHlkejkxaWVNaEdFZkFo?=
 =?utf-8?B?SlZPQUZuTjJ2UERTUVpYQW8zc3pQZDNZbEFZYk81d09Semk5dVNsOER5ZjVq?=
 =?utf-8?B?Zk1Lc2hHR3lob0tjL3hPQjhPNVZVRU02UEg5Q20yRzZiMExRTEM0YStrZ3ds?=
 =?utf-8?B?T0puTkxVRzRRaW03Q3lCWHdKcmwxdTEwY3RVNDVZMFBOMUZFdEVVSDVUTzJo?=
 =?utf-8?Q?BPqGwJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2491.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S1I0RGM5YkprNksyRHkzbnVYdEtkNXRsNE9XcHdhNHVmWFZIc1huZzU3cFl2?=
 =?utf-8?B?eU40b1FLSTVtTGV0SnRvY0dMb3VuV0JBRmI0Qm5pR2tsQ2o3RlRiODJCM20x?=
 =?utf-8?B?OEMvVk1LbHh3Um9PTVpsVFp0aFFmK3FYVDBCRVQ3MkdaczJENVdETnVHNXdt?=
 =?utf-8?B?VzUxVXFhOE1rREpjSU9DaGpnTFhiUU5OTnRvY2VlRWdhb2ZEY0FTY2V4Zk5n?=
 =?utf-8?B?ZWM1NnVtVU43cXhPVHE5OU5LTExqN2Y1US9RWGNKT2RZeVRKTnBrbG9pUGdI?=
 =?utf-8?B?bHUwUXpDK2s1OHJlU3NSeHF1TjcxbjVYVG9UNnM5WG9TRlRCVVhacVF1cDNy?=
 =?utf-8?B?TlZZNUJRUnRiK0pXSHA3YjlMRUh4ZTNNZ3pmVzlDNWI3ekU5enB2VlRSQ1la?=
 =?utf-8?B?bVR4Z1hTUU8yNzdUQjNpTm90b3NFVVJjdG9XV3NVVGhXY2hONlJOQ05kRTNJ?=
 =?utf-8?B?NWRzWldOQ2VlRVUrTDNBUHRWVEF2WFhDY3N3NzBXQURlKzJ3bThaUHNVNDBn?=
 =?utf-8?B?dE9BK1o0S1kyNlR6R2E4d2Rzbm41T0pYQit0djVXcWkyaVhLcGpEeVRCUkQr?=
 =?utf-8?B?dkI4OW9vSDdUeUpTNHFMT241WjBEM3ZlODB6V2ErNW9CVEVST2hkTWxGbEFv?=
 =?utf-8?B?OUxmYUQ1b2h0R0JpSldWek8wWEdnSEQreityRVRBN2FwdnQrS2xXQ3NXK1lr?=
 =?utf-8?B?U3dLWXlYdmcrckZwaVIyME04V3VxTzhhZ1RFUjNQK2ZjYWFzTk43VlZFdVBB?=
 =?utf-8?B?dnRlOExNaTZXWkN6eHhGcVBzR243SU9ZeWlVTWp3ZkhpL29IK2l1UTh1U05R?=
 =?utf-8?B?TWR5OHNLbDV1a2NyeXgrZjI5NFYzZDJSZkVBL3B5V0xGa0k0QWdBOGlJdlI1?=
 =?utf-8?B?a0NzcU9WTGZJSjVIdFQ2N21IRHZOMmsxblNhOUZjaDh4aWUwODZlUFIrWE9l?=
 =?utf-8?B?Q0NBSWlhU3RxT1krV0JKVkxaOWxqeWhJeFRBRzJrN0FleTdpVzhEY2NUOEFN?=
 =?utf-8?B?QllGT1ZFYWVhTS9vS0FnUUV4S0ErQXFZV0xwYVpDRHVkcS9ENldOQ0QwQkY1?=
 =?utf-8?B?bU1Gbmw3aDQ3TmNrMVJXWGh4VmVqeU4zSGpSUWxjdkNQODJxMXNDWGF5aEZl?=
 =?utf-8?B?V05neTFtbGROelovUVpnc0VwRXhXR1hrQ1lteFB6bG1LNzY5YXdiVWRiellE?=
 =?utf-8?B?Ukk1NjhadCtmNVZ0Z3Z0ajlXTHNtNDJRYU9pcXZlN0hCelRMZnVrdXdDR3la?=
 =?utf-8?B?V2VRVE1XcFdrSTlZUjVKN1dDYk41d0wxbnh4V2lLUHpZLzFpZ01Ec3U3Vi9C?=
 =?utf-8?B?dEFMdWhjVStBZmFoR1pheGh4TXBLbFRZRFVvbUc5WXJuOFJaQkE4SnlVTExN?=
 =?utf-8?B?eHV5QnRGbHJtSkhmVDdsUzlhR1dDQTdJWllDaklxWlNncXB4a2dkYWU4Zm4z?=
 =?utf-8?B?SHRzZ3E4OVBhd2E0S0dtaVhJNU1QTENSNzNuVStVOTUyY3FhQ2tpejRrL2Z1?=
 =?utf-8?B?Q2cwRWdHWmZoVWlxZU5IQWZxU2FMZU1uNDlNTVFFVC9CYWRkakEvZUZMTm50?=
 =?utf-8?B?cTZxTGVIeXlOQmdOblFqaDNPTXBBamttbXlzK1EyeUt6VTQydmdHUkcwbXk2?=
 =?utf-8?B?c3BiWHVsNzFENG1SeTRVdFFDNWU1Y0JWY1I0RmsvUlZoQkp3c0ViQ0w0dEQ2?=
 =?utf-8?B?WkUrYUduK045K3dVYkI5N3p6QVlMWkV4K1ZPRE9MYzZYT1FDZ2RacE9WK1N3?=
 =?utf-8?B?VVEvMGZBc3l5dVBGdnlrVUc2S3liTjZMRytlZk1VeGJRK3REZFhHV2g1c0FS?=
 =?utf-8?B?dmcvOTd1RTdPRUR2QXY2ai9rWnI0NWhUK0JQeWpTQ3NIV1F6QU5CQkR4UmZL?=
 =?utf-8?B?aExFUnI5UVpSTENFQ3ljdUlpUDk3dGppeHYvVTFkWDNURUs0QzhZbE5SbDNZ?=
 =?utf-8?B?YlVTUUdLMW1iNEdLdU5HbExxaC9lTkJiRjJ3RHJXK0dpVHBOZXpIU1JzbVpJ?=
 =?utf-8?B?eisxWUtodnhaRkNjRGdzdGJWK1E3KzI2eGQ4L3BvSElXRG1QdWxJVjhTQjJV?=
 =?utf-8?B?alhKTFJBTnEvUTZvOVFoeTZUUGFQd2NiOVAraTJqYUw1ZHU5czZMS1dUZ0lH?=
 =?utf-8?B?bjkwNzdDSCttanNhaFpOc3NaS0t0TGp3eERmekRSWC9sRjFyQ2lPOHRHZ29C?=
 =?utf-8?B?U3lLbWFTM0VwNENZNjdSVmRPdzVqcGViRWh4bTRDRTdFUVU4WkVoVDJ1UDBE?=
 =?utf-8?B?QUZUaStWVEZqNGpHUkc5V3dRYjU5dkhNVjErUGlaR3JLeGxOR255M2VNaEpP?=
 =?utf-8?Q?KlY5TbpXUfy/1yEWr2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4426342507FB19439D7351606398CB09@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b827cb95-5ee7-4af2-bd09-08de5343ffae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 08:07:45.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbNtMwoUbIgfkS322qx+7Zal8np5yiyerusQd/4dMrrnMl07qVopvoUBmsCkuqbk+XpyPioKwty0rfbbItTG7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2299
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229307

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDE2OjE5ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToKPiBPbiBUdWUsIDEzIEphbiAyMDI2IGF0IDEzOjQyLCBZYW5uaWMgTW9vZyA8WS5Nb29nQHBo
eXRlYy5kZT4gd3JvdGU6Cj4gCj4gPiBZZXAuIEkgd2FzIG1pc3Rha2VuIGluaXRpYWxseS4gVGhl
IHRhc2sgdGhhdCBmYWlsZWQgZm9yIG1lIGlzIHRoZSBkb19tYWtlX2ljdWRhdGEuCj4gPiAKPiA+
IFdpdGhpbiB0aGF0IHRhc2ssIHRoZSBsYXN0IGNvbW1hbmQgZmFpbHM6Cj4gPiAKPiA+IGRvX21h
a2VfaWN1ZGF0YTpjbGFzcy10YXJnZXQgKCkgewo+ID4gwqDCoMKgICR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdQQUNLQUdFQ09ORklHJywgJ21ha2UtaWN1ZGF0YScsICcnLCAnZXhpdCAwJywgZCl9Cj4g
PiDCoMKgwqAgWy4uLl0KPiA+IMKgwqDCoCBpbnN0YWxsIC1EbTY0NCAke1N9L2RhdGEvb3V0L2lj
dWR0JHtJQ1VfTUFKT1JfVkVSfWwuZGF0Cj4gPiAke1N9L2RhdGEvaW4vaWN1ZHQke0lDVV9NQUpP
Ul9WRVJ9bC5kYXQKPiA+IH0KPiA+IAo+ID4gV2UgZG8gbm90IHNlZSBpdCB3aXRoIHBva3ksIGJl
Y2F1c2UgUEFDS0FHRUNPTkZJRyBkb2VzIG5vdCBjb250YWluIG1ha2UtaWN1ZGF0YS4KPiA+IFdl
IGhhdmUgdGhlIGZvbGxvd2luZyBpbiBhIGJiYXBwZW5kIG9mIG91ciBkaXN0cm8gbGF5ZXI6Cj4g
PiAKPiA+IEZJTEVTRVhUUkFQQVRIUzpwcmVwZW5kIDo9ICIke1RISVNESVJ9L2ZpbGVzOiIKPiA+
IFNSQ19VUkkgKz0gImZpbGU6Ly9maWx0ZXIuanNvbiIKPiA+IFBBQ0tBR0VDT05GSUcgKz0gIm1h
a2UtaWN1ZGF0YSIKPiA+IFBBQ0tBR0VDT05GSUc6cG4taWN1LW5hdGl2ZSArPSAiIG1ha2UtaWN1
ZGF0YSIKPiA+IAo+ID4gd2hpY2ggdHJpZ2dlcnMgdGhlIGVycm9yLgo+IAo+IFRoYW5rcy4gQ2Fu
IHlvdSBhZGQgdGhpcyBpbmZvcm1hdGlvbiB0byB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHJlc2Vu
ZCB0aGUgcGF0Y2g/CgpZZXMsIHdpbGwgZG8uCgpZYW5uaWMKCj4gCj4gQWxleAo=

