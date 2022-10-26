Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194CEC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 08:13:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web09.5182.1666772026581239279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 01:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=STy9rtK5;
 spf=pass (domain: siemens.com, ip: 40.107.7.82, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhyRcF9QVwREXUoLfJlzsCuIO9Bk+MZxCl8JKioR+DJojak5HQoZvpN0k/LBRbgutnivOCEoSAwtrt84oMXu86tzZJAtee4tbkPUMufsMOdycmy6qwjfM06jfHDaUaqkNa5mbdm0gqxvi72cYQObWy/ZcEpnPTxslu5miBRMubWnOudjQpXYcKMUzZy9czpAwBT0YfLxOa3IREXsqQL4Gz8tA3vzeZ3sTgxrXwUZVxKaF+FnWZEZoXKdEBU8xIpv+CDUZezjpNj+rTAZQsgeDqFsL4CwEIlP1OH6+4t8OfpufRBUeoQvH9TxpnlA5SzJogbcjjwnLr8eEfm9zcRhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ma1Ayis2VfgXgHn/BY7q0wWa91vZIB9SRBfb10jRMs=;
 b=SKJZCCChKJ39oW3jG0m9f0bCZEOjDzIXoUfSuT0KqvkK25kRx/7OPcG8m+tMnURfd5x5LFBwUYlEIqMAUKG5dzW+dVc3gMmru70PgdGjVJ+8+b3crp8Oo4sFCcj4FU9wHencJwo5l+O2CuJk7sTJPM9vwurBD3bANUXlUH8BYK35Zy4hj4w1s8nLH/EszJC39UUZU05URhI2kIH4qnhcnLT1sS7Pn6BKLMcgp5bgpq4JjhzWMmCMfg6cQmnVVqMLgusavBjeqjB7vOLbIO5xYK9cd1xO03gELmrehD9vzYCNFbI0h6BFqQXGBnlzCG9ySlzuE7V0vFqLJmSbD/eIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ma1Ayis2VfgXgHn/BY7q0wWa91vZIB9SRBfb10jRMs=;
 b=STy9rtK5mWmhrGFJNT5YELBS/4JDTL6/YF/jUdOSfn2qcKCzwghsn3c3tI+5Xis0ocTFG0nQhYXXWqGPmVjtFBqoSkELPDVZSjRKapZ1r5i1T9qSMcNdHd5tOePaufqpSarGBQw2L8WJ6hpjpBgezpkDZDMa5oZe5LRmbSUfOdFlatrYuNeo4CpEgYA59qjqOFCjspBEVjJoXz10z2Qgn37rWZFN3DjrIZmnjtj8EPhRpt4E+r2aryIG/q/W4NCExO+Xs5hjKihTlM80bDMevIoy6F2RTwhyZkBoQQT24lHG8ptC0oi3q9Mqf99Tl4B1MnysySDVtwJ2p9D8baGNNw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB3695.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Wed, 26 Oct
 2022 08:13:43 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5%8]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 08:13:42 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: eSDK cherry-picks
Thread-Topic: eSDK cherry-picks
Thread-Index: AQHY6RLcbbN+DtLy2U+wJvkCIkyLww==
Date: Wed, 26 Oct 2022 08:13:42 +0000
Message-ID: <5dd15cbcb294c6907e11461eb8080e0238ec306e.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|VI1PR10MB3695:EE_
x-ms-office365-filtering-correlation-id: d6d57883-365f-4aec-250e-08dab729ff32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FfdNu2bsEVr0az/UfC/S1LGzs6AXGe7BWwIh5PCAULEp5JMYkV3bB0XTVwKq4p2eW2FPLu5TcUnaWfeVLEHwrvXUOUIlMnD9IQ1DBG98d3yQ9Dff+BMorsabG1n7j+lUQc9dqQJvcoJM7h277f62Xdh/Ox25rgKkrM8UeKkgjIwfRcBFrUdPBmOg+KXc2AhXO0fBhs8XSIzsKgCWCor7ZMUhCATBowhu3l+qylCWsiyP0kgKyWCmo+Hx8joxre5GfbNJzi2CdPTg6o958ez7huheBrax1rBI2DBeaXWPlwDAPQ8FpYr+m9cxM3s8jbitcrZBbpidd4blnLFU3ehjgBiqAqChMYBiZLKO/EhU05JzhtoZ0Tj32+q/ZtJKMO3M2kCFonZeUzenV6VQU6Yt5Bpka2vhDZpnV5lTS9KhFRu5v2aZjK7jM7uZPEGBuJEeUrJQApgETENJtmgsgxvqSz+XxXWGHHQKmR4gLhRIPBTT6pExYTfepRaA6rSeq/V+yokqP/rgaLdhCirimcBb0fM31CuGrIWEMETJeRbubmpxl6nici8SSVe2ep0igBvhuvkUI/ukW4AP7AxAWnE5QuZMm22J2tSs2gwiFS3oOsWvCB2XOSxcc5/xvZy9wXuicYOQNtg65gAqaLAxIWIvPRU4pCXsGKNUbRl0GgCk5fu3RrcQui4LcplcPhPd6NHN5RCJCsGSIzlX9nZ/EwxgpWc++Q8nl+8v2EFkO+V0RyRkY/LMlxdXqF46ekvpaPtwyQ0ONOC/XlHVbVErJ+yqhsRfRC6qwZmNOu079sZAim8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(38070700005)(66556008)(4326008)(4744005)(6916009)(54906003)(36756003)(86362001)(64756008)(8676002)(66946007)(2906002)(5660300002)(66476007)(66446008)(8936002)(91956017)(76116006)(316002)(6506007)(6512007)(41300700001)(26005)(38100700002)(71200400001)(186003)(82960400001)(3480700007)(2616005)(122000001)(6486002)(478600001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjFTVDRTL0Z3aGlvSXJ6NGNlTG5HUVhHK3FXN0c1T01JTjV5U0Y1Vk92OWYv?=
 =?utf-8?B?VUFIVWZITFZiRmthS0JJN3pvb0RsVGFHUkFGTlhuR2RxQytnb21FLzFhcm1S?=
 =?utf-8?B?Y3FxcXRXZW50RUE0dVdWQzl5WFF1d0RXdDAvZ2JMMVZ6Ujg1M3FuUW1OMGxo?=
 =?utf-8?B?UmJlMWNIVldoYVFGNTUvUnpreUlOYTFPRVFtM2lxOEpPRmE2VWtheHZFNW82?=
 =?utf-8?B?clRSdjVSbEV0MWpTV1BzWFFabHh5MFhlREF1OExDeVBidk9FTXJWVzdKYXoy?=
 =?utf-8?B?aDFPWWdteVozUVZYbmJRUm9pYncxR3ZRS0FrRjhoekxuN0l6ZHo4dUZEVTdy?=
 =?utf-8?B?STIwL1kzNDdjZW1kZHdRVTFsS1VUeUJRVUpLSUhGSVgxdC9Ic2Rxa25YOFBC?=
 =?utf-8?B?TW9lTzZwenUvZU92SVI0NTJrL2NiU2l6UGVnUis1VDlGVi9LU0VpblAySFll?=
 =?utf-8?B?ZlBJcFlRS0gvZ1R2MDVCMHJ0M1Awc3c2K0dhenRKaVc0TGNnOVRpWWlVb0JX?=
 =?utf-8?B?V0xpMzNmRTRpdWRkTVkyZ2d0MzhOU2dKM1dWZGZENGZlRVEvWE81ZnI5alND?=
 =?utf-8?B?TW1uV3FicENOMDREMGZwZ2pIbE5wb3dqMmNEOFpHTFZmaXBIeWkwUiswd1Rr?=
 =?utf-8?B?Uk9EMTJ0TnErZFUyTnRLTUVHa0FvREt3ai9iQWx2MlF6Y0dJdTUwZW9LNUo3?=
 =?utf-8?B?Rk11VWwvL0ZTdmxEVlMvdHBTTzNxUVluOEw0R3lvOU1qYktFOWprVXJlclMv?=
 =?utf-8?B?ZjlLMXJJY2lmUmdlUUMxNlIyN0g0NDVwRURmV3R5dnJOeTBVN2xtay9zZG9I?=
 =?utf-8?B?Tzh5SlBwWG83cUdZL2N2YTNiclRtMktVU2hxOTJweFhxbFIvbVpiRjZhTWJU?=
 =?utf-8?B?YTBqbm5kblJiM3J5ckRoYnUxZUtPS0hPUlRxZmo3VWk0Q2h1RHB2V0hpa05C?=
 =?utf-8?B?RGJPN3poOTlzZkZ3dU9YNVRHUlB5TWRkVW9xWGt5M25xeUNzb0htSHFUQ2Ju?=
 =?utf-8?B?WmpXTFBZZlpFUzV6R3h4WW5mYjRDWVhCT3VwQW9rMURUTnA3Sjd0N0dWYlNi?=
 =?utf-8?B?aVgxRTdESmJSejR3djFLUzBYV2tGV3dWdlN4WEpYeXVGbGE2Wk12WDZUMThm?=
 =?utf-8?B?VGtpUmI5R1k1ckw2TVpTYVVpQUhCTXdnUCtEZjZQcEpEZmh4ZU0zMUhHeW43?=
 =?utf-8?B?Y0d5bHgreTZrZWtaaUgweEdnMXErcWsvVldjc2dLMmwraVEvRTlkM09mMXhr?=
 =?utf-8?B?UkVTNjREZTJPTTlJYktib2JyNjNQajl1dEJndmdJQVN4aiswcVpUR29jajhq?=
 =?utf-8?B?endITWdYTHBMV3lZZ1duVk8yTFBoNEFKbzZvT3lhM3ZXVkNSSDJjWWh2NmFX?=
 =?utf-8?B?b0lQc0NjTVMvRFQ0c3Z2cmFKaXhwSitQak92b3M3bHJyVmlpVURBY1FTS0Rq?=
 =?utf-8?B?SzQzNExTQWhVMmY1SUY0TWZENzl5SkhMMDJUODgyYWVYd1hwaW52UHNpejRn?=
 =?utf-8?B?YmFjQ1lrY0dPcUZYdkowR2ljczZyUWZFd2pKY01DUlNMSjdQKzBkOEJFaGVv?=
 =?utf-8?B?azJtY2h4cGZSSkFnck4wbHRYeXVzL3Z2QnNiT3QvaEFUZ1Y0NFBzOWM3WFpr?=
 =?utf-8?B?ODVVb2Z3TFNxWWRCL1hPZUo2T0tzWnlBdE1tNVFyZ3VvdWl0bFlON1ZwQWlQ?=
 =?utf-8?B?K0FiV2JYdCtGYTBGTk56VmxHcTVRZEZCc0xGd0NtRk1hc2ZqdzA2ZFJzUytM?=
 =?utf-8?B?Zk9KWUNtMXBVSCttazFKUE1PS0NCTUlZTHBKVjdSL3gwczlsbmJVSDNWUGlF?=
 =?utf-8?B?dVdkc2xTMmY3bVUwbW5rMkc1aFVVT0lLT1lGQ2hUZkhtSmx0OGlLZzM5eFVa?=
 =?utf-8?B?akZWeERHQlNhNU1WdzNWSzlwbm1rRDVGa1pqamtzTG5Reno3bnVRalI5cUxv?=
 =?utf-8?B?by9XYks0R0pzK1NZZC82YTBxV2QrUkVNaDZncVBDektXazFRbDk1eEtxNXZV?=
 =?utf-8?B?ditSalRWbTkxa0huRnNuamFheVpRRVcxd2RqeDduSnJiamxwR3VZbDZsSUVm?=
 =?utf-8?B?bG9qNUN3Z2N2akpZWmdEYzkrV2NuTkFlT2V2T3YxMXpLenBVNmZHWmpGNjJS?=
 =?utf-8?B?UUVPeFdLY05wN0FzYy9WU0o0bnNoQUVNN25qbGU3M1Blb094ajlCZTJJNklP?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48003A0FA1245C45A511722702E47CD1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d57883-365f-4aec-250e-08dab729ff32
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 08:13:42.9208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WsUb/U9mKD2DlLFRIvT1oYEDkbkGfVVqbji7woAjjfN9XriF9Npu6eP4GG2Zo2A+jqtjH6c1pGPhMpEjXzkmHWbjPZt97U4/vzgC4S08LDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3695
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 08:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172146

SGVsbG8gU3RldmUsDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGluY2x1ZGUgdGhlc2UgY29t
bWl0cw0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC8/aWQ9NGZkMTVm
NGUzYWQ1MGJhMTgzMGIyMGE1ZTMzOWQ3NWViYjc0YTRjZQ0KwqBodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL3Bva3kvY29tbWl0Lz9pZD03ZTRiOTZlOTExZjZiMzA4YWExYzk3MGRiMzc4ODFk
NjJkZGVmY2FjDQppbnRvDQpraXJrc3RvbmUgYnJhbmNoPw0KDQpJIGd1ZXNzLCBzb21lIG9sZGVy
IGJyYW5jaGVzIGFyZSBhZmZlY3RlZCB0b28uIFRoZSBkdW5mZWxsIGJyYW5jaCBpcw0Kc2FmZS4N
Cg0KVGhhbmtzLA0KQW5kcmVqDQo=

