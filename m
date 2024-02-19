Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8EDC48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:01:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.37553.1708333297100382173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=AyOeRQKE;
 spf=pass (domain: nedap.com, ip: 40.107.22.138, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTyvrANGfWXwoLpu5Bv1VQIcPdl37fKrnFfRtxhbConfsSAd6279nScSTYXPDd642XAYZxxVuKhlMqZeuceC3ocfWqtVKU6qOLcVhU0HZ4UqWk1L2osJz5O13XyocVTpsfmPNEgtyUKf3KGR9r2TJdTgM9CPUQ52LlY28/NqtwK76k9kTevucx2AuWwEeTXLkt2yEC/EW1Qjg+Kjafc4vZEmnt3GKDSVy5+rMT4JtLbPg0vWyCine1gPSiNO4Anj3vUE+qlzpPPP60FZPB+wtzSQe1UoymTl8Uw5x86puN7igVB5eYwovMZCuV2/LudcYw2roFn1gMV0ExHQXvUwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mjx0GbaCaqJFp2XJu3P8rOR1tMbvGTXqaTOPlKcXTw=;
 b=F6w31jAPE4C5Hd0dLYjue+Uiw5/jCHae46UsxZN39sjM6H7Sg7yy8e3Vs3tdeh6Rhq+bXwDT5QySRGPvuJ/DDlhRPWUkHLncwonBOTwN3zP/X3fKG+IN52/2ZBHADNt1hSNdkekgQ/EiTGLNLjTwaq9WOQhU1fYV/kDZu2A6eGxbesF21rB0qQJFlhwDOh3kgPEBLb3ZDCcwNM4icMqqU24NvrUZh44nme64564h6kCTf0bbqrxxAUVxJfKeurARk+4mqCR3hwGssao5P8kGuf6stVffWD8ZF5NLPt/Azl4lo25gU/PDjT15EW3ad0X3jBcPZ4ZcyKWdvYiQvqjIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mjx0GbaCaqJFp2XJu3P8rOR1tMbvGTXqaTOPlKcXTw=;
 b=AyOeRQKEuNVGsm9uJGayRyAqBpwVlBDV6LH2MltKHGgCOvlWMT8ydAbjNqeIB0svTZ25SkenqEMHWhYKtdFKV6cGHxh1LNO8Jw+jwZD6kUbAkiCmBiuCCrs2xbquq+abCb/U31zL4igoWvR9AV4oRGq6JRgRypW5S6dVsI5bVs8=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AM7PR10MB3734.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Mon, 19 Feb
 2024 09:01:32 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a%5]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 09:01:31 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC 5/7] lib/oe/buildcfg.py: Add additional git
 functions
Thread-Topic: [OE-core] [RFC 5/7] lib/oe/buildcfg.py: Add additional git
 functions
Thread-Index: AQHaEY77rAKX2kesF0CCysfXj4chRbEQ1nAAgAEgjiA=
Date: Mon, 19 Feb 2024 09:01:30 +0000
Message-ID: 
 <VI1PR10MB31827BAA0CB28DD8F9D6DB72F7512@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-7-jermain.horsman@nedap.com>
 <CA+chaQfBEOr+NTjD=7d07xieHPfn=AOrnr2K2XTSnz0-qRT3LQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfBEOr+NTjD=7d07xieHPfn=AOrnr2K2XTSnz0-qRT3LQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AM7PR10MB3734:EE_
x-ms-office365-filtering-correlation-id: 3dc3feb3-a7c2-4df8-eaec-08dc31295d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xSejoRfLl/SNfqQtnFYaLykssjL5FgX1akm62qAUSuzlx7kwxCXTsGCn7Vw5T88KBmETGkwVqP1bQL1LlFekWwUHbtg5QFPIPhKZ/6+dGafVWLhMi4wBVUTJ+tiZMe9JiR74ilXKNNC0oikNQ1AqWCmtYqnoSTt2P1wMwZ/xXiECWdIGtbKnNmhiYSAHzIq6tqiEfV+P54TCFp5aus/KcQEhzVSquyW3cM0IYIb7CDIglopOFR8hKuxL0tzl7PJuep6CU9DR1e1MxbCR5Qy3S/m/oJA5RbgtH6yqLdlu3S5S6Oi+r9kn/3KL6hZeC54LUG+2ORQV95ADc0KjXiocEikki94p5ctRXVSLfNIMQb/LG8npxE/JV8/gZZVqVx1oLApG2yFSedltRWLnXZc4zyXwrXOUEzmt6QwRytk9t9QK2UP4p/4RQUWRoKkfMiPeMK63P3HDFqwcyp3TJ1glxhbMBhslDRgRcud7otktEqY5a/EiNIoXR4RRGcPD+tKmaGNL+pDuh3fheUT2eBPuLEtRR9y/MVPB5Fiome49srC9Y6w8BNtKA8ggyuiG8JSjtX9E1l30xWoEPVuPwDdhaXeMsyRM8mY9rNYq0sRremI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39840400004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(122000001)(38100700002)(55016003)(26005)(86362001)(33656002)(83380400001)(44832011)(9686003)(4744005)(478600001)(2906002)(5660300002)(7696005)(6506007)(8676002)(4326008)(6916009)(966005)(8936002)(52536014)(66556008)(66946007)(76116006)(64756008)(66446008)(66476007)(38070700009)(41300700001)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHlraWtFajJQV3g1NEFzRytoeFBrVGExcTVEbjR2WXA3bjVsUlRoZjI4azRy?=
 =?utf-8?B?WDQ2WDcxODQ0eE9IdDd3bG56elNKTTJHdDdWQlgzQURsc2U3VG9QRzlwN0Jw?=
 =?utf-8?B?ampMUmJENmtqRVg3eSttTEhrUTEyQWlwTjd0SjNXek9LSUhYNjBDWGVXT2x4?=
 =?utf-8?B?VWtxWjRWVlEveE1tZ2J0aDgxQ012cjVHaTJMdTlDSmpoYW4vc3E0SlBlWDMz?=
 =?utf-8?B?WTIzNXhmZTdBZ212UjIySkI1ekxMWkRuTlJaNE5ITE1IdmZWM0xhUzdMZENN?=
 =?utf-8?B?elZqbGtQdDBvOHplSFhtcUthb3VKQjdNZ2VyRy95TzVVUEdGRWJmVEFtTjBR?=
 =?utf-8?B?cHNWdFNyaEs0aFBkVGkrcVFmY0NQKzBzOWJnVTBMWXF6MUJyQnFHL0ZyUFZN?=
 =?utf-8?B?a044OGtBakh4U3FZcnBqKzlNNlI3bk1PdU9mWWVUWVBnaDRycnY0cHdsQWxB?=
 =?utf-8?B?cklSeHMvL3ZQVlg2TkdRWkJtbXRvMHlQQ3ZuN3VqTFZFbUlCaVJkVEIzSmZQ?=
 =?utf-8?B?a3B0ZnkvLzhZSkoveHBUYW5SZUlpY2kwUTc2WVNOOXdkOHBsT2p5dkpNdUls?=
 =?utf-8?B?aE1QbTNsSTQvdlFWMnM5TjFocHlSSmM3L0JlV09ucEZueHNvOGNVOGNVZFh2?=
 =?utf-8?B?QzFsY2hWNVRSWS9lN1dqMmk3eXpKMHV1VnpPdFJQYWtFZmtKcjdNSkFHNTQ1?=
 =?utf-8?B?RjVFMW5Fa3paYStRaUJHQzNGR1FkakZFbTB1elNQbWJEeWVHdS9Na3VUd29G?=
 =?utf-8?B?L2pnVGhueEY1THg1NllZTHo4N3F2N3IycE4zTlNGMUZ5WWRhMFM0QUdxaTh3?=
 =?utf-8?B?aWhPT1BQZGFhTFJNcVdZMHNOZzN5NmdGK2o2QXRZMFdqMzZjOE53VTdRWWNm?=
 =?utf-8?B?dC9weDZBWkV1WXJ6Z2plMERoV3FVZ1ZRTmxDdzROeEJXRGt6eUU0Y3NPenJn?=
 =?utf-8?B?R1QrQmIrODN4UzZrU3FyNExlcVd1S2VCeWorVVAzenVKRXoyT21uTS9NN09E?=
 =?utf-8?B?dkpoVzdYaStjd1lNMlRYaldqamxaL3hZM1ptejB3NC9oS1NLZ2ZubXVJU3BF?=
 =?utf-8?B?UUhsNVBmekJkellEeWtJRzFpdngzSFZOQXpmNzdvQjRHa1VTZ1k2eWNDWU1Z?=
 =?utf-8?B?SzJ1MGkvcTBmV1BVdnNzSm5HUXloVVZoSGZsNkJyT0JzNkorOTlxVytqS1Qz?=
 =?utf-8?B?S2tnZG5mdXMvUzRERjNFYUwyV0FLZEJPOE9xSjBZbTE4ZXNHTExsR2dBZ0Zm?=
 =?utf-8?B?UXlWNU5zRTY5U2tRclliSFpKK2E3MWR4eERKazlxL3lXTkpyZERGZGVCVno1?=
 =?utf-8?B?bHU4Smc0WU9rUk0wQ1E3OTFTVUhJOHhMdWU5R2k5RUttQlFpMThFWHpCU1lB?=
 =?utf-8?B?OHF3VDhITzZSdHRaUE9UUVpVTzVpNFNjRzA3U3dqUUZTSDhOZEFQcm53TUQy?=
 =?utf-8?B?WGpab3B1eXBxd1NDMjFBc3daN1J1NklXcVRHZ2JDVmNyRWlIbzVPNGhFcE1l?=
 =?utf-8?B?WXlybnVST2lxMDBHQkNjL0g5VlRGdTN6dUs4Z0RrbW5yeVFwQldjcmk2T1Fj?=
 =?utf-8?B?UFBKaWVrR0l5TGFoOG44ZVc2K085ZGQ0TytXdUhsL0hETmRCb1lZTENqekph?=
 =?utf-8?B?bUdnQlM5cjVYWEMzSEdzTllUQWVCYUJGYjFYZ3RRZnBsWENSWmFldjBXTHlQ?=
 =?utf-8?B?MlNKeWFqY2FEYkxMNm9pdXZvVFNETHhocDB2Z0V6YUZCM3RCdWh1US9tcm81?=
 =?utf-8?B?TWE3UEJYa3N0V0laVkUrcVFkelI4QmgzZVFCRjJrV0p2dWdlYkd5MnFsVUNR?=
 =?utf-8?B?MTd1RzRFcXAwTnRJY1Yzc0pzS21xQmJnY0hOQklZZFBXYlk5cEdkelhRTHpU?=
 =?utf-8?B?Ti9VbGk1UzBjdkVsVTFOS2RXSDZRQ2c4MG13bkNVK2E0Q28vdlRMM2dzRlBX?=
 =?utf-8?B?VmluYkU4SDVPSFpvcGFJLzVZVHBmU2RjSXlXc3FmUVVONDNMcCs5VWxtRk1Q?=
 =?utf-8?B?Z3Q1WGV3aXQ3K2Zuc0VDMlhIQ1Y4RS9NT0RvVlNkaVAvR2dLcEVGZ0l3WHUz?=
 =?utf-8?B?cTlyQ0Jndng2cmxMR05ENUlKTzBOYWMwMGJhSXFQR0Zhb1piZFJlV1h3dmxI?=
 =?utf-8?Q?teCEWzipWtggxfyN3GQR9upTK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc3feb3-a7c2-4df8-eaec-08dc31295d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 09:01:30.9011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkGgw/3ClV2aJ97Co+ai01nhEk89m0jzgGBXW1aLHmftXj2IthOWqVvqC8f2LmF6Y1b5JaX3XXoLNzGyFL0bMdTTxvwGX7rZkUExH8DEMdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195866

PiBXYXMgdGhlcmUgYSByZWFzb24gd2h5IHRoaXMgd2Fzbid0IG1lcmdlZCBpbiB0aGUgZW5kIChv
dGhlciB0aGFuIGJlaW5nIHNlbnQgYXMgUkZDKT8NCg0KSSdtIGFzc3VtaW5nIHlvdSBtZWFudCB0
byByZXBseSB0byB0aGlzIG9uZSBpbnN0ZWFkOg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTAyOTINCg0KSSBkaWQgbm90IGluY2x1
ZGUgdGhpcyBpbiB0aGUgZmluYWwgdmVyc2lvbiBhcyB3ZSBlbmRlZCB1cCBnb2luZyBpbiBhIGJp
dCBvZiBhIGRpZmZlcmVudCBkaXJlY3Rpb24sDQphcyBhIHJlc3VsdCBJIGRpZCBub3QgY2hhbmdl
IHRoZSBmaWxlIHRoYXQgdXNlZCB0aGVzZSBmdW5jdGlvbnMsIGFuZCB0aGVyZWZvcmUgZGlkIG5v
dCBpbmNsdWRlIHRoaXMgcGF0Y2guDQoNCkknZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gc2VuZCB0
aGlzIGFzIGEgc3RhbmRhbG9uZSB0aG91Z2guDQoNClNpbmNlcmVseSwNCg0KSmVybWFpbiBIb3Jz
bWFuDQo=

