Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8151BC83F2D
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 14:22:05 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.51])
 by mx.groups.io with SMTP id smtpd.web10.17777.1724941323881740640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 07:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=bTYcghte;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.103.51, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dODGKk/6RLuMv5N/bleDfazKiIuKlXb0nC1yRPgQC4yPDCV8Z7oJIENckyVdXO+j8QyULyysFkNC9FBwrwUkM5s16etQF5yI1WoBgfLhkklyzkr7xbpoBJW/18XRPY9aSaGRp4q544wnb8ODKjCja0uUxiY/p1qFAbUyGQnpo86TI+0M/SB9kXW3BT7e0S6AnlElXiDD08THiJ8t+djPVU06pmt0yMbGV339QsToV/5u6qfNyIgRFMfkOD1tH6+q/+O7eGUOO3AdJ/RU0008fSQVxpz1yC9ELaExXC1Mlj0QNQ5niQ4PkekC1OIziR2L6pjghKxOA8s/3JG+qcKdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpmqlQAUI6KaxhL6JuUvXzjHgiyxoWX5EmLcwg5xRJU=;
 b=Ytclf2Y+c9c/WNZLtmdgB3PH3wiSEC0gQSUwxNB7uHZKZyh3RlVf1wG2yqbHGHXvcj9UGxqgu+v/9/mW2kKZVQ/6mlZeXclPxS1T0Thedj0bCWfWGaxcjKMRgmN3izdDTT3sx8OSpUz8D/U8E4fzLijF0gBiPW12X8XUTjLYzLiieOkivBTfatvR9fzPVIKB7tR7RDzf1EwwAUlULm7iBLFgC7vlKea8RsJDWaTYTyWOzTPsV03B6P5Bh8fCy6fFGdWadu65jLWOxyEoi01V1Mk8kqrMlFYTZO/3eL94ouGwl7i2fOaNhzixP470Jwkl8dHUyquwX7dcWQASSX14Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpmqlQAUI6KaxhL6JuUvXzjHgiyxoWX5EmLcwg5xRJU=;
 b=bTYcghteQb148KqyXdX2ESTNaZ8Yvq8o4NseQ9vkW20VuTm0CI6FVgmmUwu4kGhfez9zYuENth0FDIBFE4NGC+GmS4IW1mhY0CduFe89FgSUo8nzs8FW9Lp8x2TmBnpzw5gyavrJbXolaVgKrnMivo2gTIdU4ZOHzsNUGpHv7BwIOwJI4UPCEMgmx8FLw4WR6Pm8/AlBmD8GVqLKAM5MzfDBxDzspO65dEdjzRQZ6anPPRvR5YWKDlB7doLTNYnWPT3qXv2Bg9399m2VWCzTfVgAOBKmREKowe870yi49gF8JCjQBpbtlLDRrzB5QkhpdnMZeEspzmA9UJK8RcO/MQ==
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DU2P193MB2273.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 14:21:59 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 14:21:59 +0000
From: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Index: 
 AQHa6ACN8leefanhmE6uJqea3DXRkrIb9HuAgAANigCACN0PgIAARCWAgBYDyqCAAB7JAIAC7ZlQgAASxoCAACVLoA==
Date: Thu, 29 Aug 2024 14:21:59 +0000
Message-ID: 
 <AM8P193MB09004E17DBE71D1C2D84DA44C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
 <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
	 <864.1723536321789931548@lists.openembedded.org>
	 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
	 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
	 <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
	 <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
 <0478d307fad333e96d7cb2c2c5f33058d6afd860.camel@linuxfoundation.org>
In-Reply-To: 
 <0478d307fad333e96d7cb2c2c5f33058d6afd860.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P193MB0900:EE_|DU2P193MB2273:EE_
x-ms-office365-filtering-correlation-id: 3a8a1a60-4ebc-437f-8577-08dcc835f1ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Rzd1K3NWK3ZCSlZyVE5NdlJXeWl6dVpJdkhKbVVPVHBhMGpQWjBOTjFEL3M3?=
 =?utf-8?B?cVlCZXNkTi9jVU5yMDZRTytIc1VPdGFsVk1EYjM5emNtaFhDbDhJeVdoK0tT?=
 =?utf-8?B?TUE5K1F6K2MzMGQvZWhqdU4wUU9RcGhvZEJQWmJqdmowZjIvYkJkcHlIaytj?=
 =?utf-8?B?ZXZYRGVBZGpBQlZPWDMvODJnb3JPaU95bmYwcTVacVBWd0lSRjhHdGdqMzdt?=
 =?utf-8?B?YjV3OGw5bC8wWkZzVDNNbWd4eGdUUjVGWUJLTE5RWTlBL1hWQzR3NFp1RTRF?=
 =?utf-8?B?TlhCYWNKMjl2c0lSS0NaVkEvV1hjaEZ2RUQ1NmQzWG9XVGxUVmp5SmRoZk5F?=
 =?utf-8?B?R2Z2ZDV3V213WnNyc2ZucTVkakx2ZzUvTHpFbkMvOTFXZ01QS0pRTmtrN2JO?=
 =?utf-8?B?YjhLa3IvVHhSVGQvSWFaMnJuc1BPb0g1WC9XNUU3K0tILzdjQStVamMyYUFy?=
 =?utf-8?B?a1d5Mm5jODV5SEl6ak1jNDJTZ0VLTHBhTWZvTWE1R1ZEWkpnS21yTVU3YzNh?=
 =?utf-8?B?M1ZTS0NPRktkYWp5K0xUeTJYLzJoK0RyWDhkYkZHL1QvcXpJaWNjV1QxdXND?=
 =?utf-8?B?Q2tzWDlVVVEwOGxuQnRnbUsxUHFMdkNZQ1FXNlROcTZ4Y3RET1FrOWxDeG9X?=
 =?utf-8?B?RDROSnNsRU9XZWhzVzJwdStjc29yam5yTnVBK3hKVFY4cnJiWUpySXA2Qm8w?=
 =?utf-8?B?b2JZdi9PM25IRDV3L2FzTE1TMFhwQ3diUnF5ZU9weTgyU0N2WW9HT3pWeGcx?=
 =?utf-8?B?Z0VQaGs2bGVZQjNhQTVxWmtKQVhYUW9pWjJhUXpKUlo0YXgvOFliL3pLbXFs?=
 =?utf-8?B?UHBaM1BmeFlxL21HVDRZM2Q4djJ0cUZIeU90NzVLWkFYR3lnd2Z0NGRBdHh3?=
 =?utf-8?B?TTVoamt6djErL0ZiRWtnWDdVcjlsMzI2a1FreVBaYTdOd2Q3TXlJOCs1VzJF?=
 =?utf-8?B?MG9FSUNCaGlXbExrc0dhTHVvUmpTcDNYU2phZWRFSXVFZ0RUczRqL2NneEFp?=
 =?utf-8?B?a0RocWU4M2d1d2RxUEpId2tJRXZhZnFFTGlucU5PdXBwYTNrOEEwMU5vcVZE?=
 =?utf-8?B?MmRvUXhaT0dvNTBpZUhCcUQwdVB0cGJuUzFiZFVYTDFkd1ZYeUxWSVVHMnJC?=
 =?utf-8?B?K0JnNy9kSUltRFkyV1ZZV2VOcDZ5VVJkMnlEUFdOQXVhblFReENBeVNFVXNM?=
 =?utf-8?B?ei9oNWdtNktjdERnL1JXMTc4TDhTSzNOa0x1dUNCcXE1ckJOeG82TU9wZkJJ?=
 =?utf-8?B?SGlXakZEdVA5WUVRNFZUSkRtdDE5NllTYStnclQwc1RxWU5Cd3RrZWFhTEVS?=
 =?utf-8?B?VVpKR2tZN3MzRERsbDdSeXh4OGY5L3o2c2RzWDY0eXUzc2MvMkZDb09BQURT?=
 =?utf-8?B?R09iVDAweURyMXdNeENhNFdBSnpnREJtYXFJbWd3SGdkbUdBNUpPZE1CWWpX?=
 =?utf-8?B?VXQ1UXJUdXhwS3lMaUJXMTFQcVIwTklpeTFxd0FWTjJJRFZ1Rmh2RDRoMDNE?=
 =?utf-8?B?MGM3TGpzWFhrdHpJS3p6d2xLVUZDSWhNWUZxd09wZFNiRmVSdUtDWXNJcUow?=
 =?utf-8?B?TFVHRDNlemFvcFpIRFhVcjhnWjMxZkJ0MVBuTzc1NldORENFbUZzNnpJOHBE?=
 =?utf-8?B?dlE2MDNwbENNSXRmWjBEMlE0NFlESC9rK20rWk1OSW9WTTd0NUFHMTN5Yk1C?=
 =?utf-8?B?Y2VmL2hDaWVFYXQzNU5yL2Uwb29pK0s5eFZjNTlVUEp3MmVab3dzRGpmTE9a?=
 =?utf-8?B?OTVtaXdscWdEeWxhZkxBVDE2N1lrZXplYXU0VWswZHkwTm9GekxYK2lCK25o?=
 =?utf-8?B?Sms0bmZqWEdHZ0hzdVYyd3dTQzFEVzRnR2E0L01sdGJ2SW5relFFRVlGR2Jl?=
 =?utf-8?B?aVQ5SDJEcGEveUtBcWlCT0lCZURDd0tnaWc3enZwRStUOWc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RUFuZTFwS1J0UTlVdHBkcUJxa1hVNkM3L2JwaWFnT1hJbG9Fdy9zT0JWUjJX?=
 =?utf-8?B?amtkdXo5bzlET3JydDAxMFBGRnBlZGdlRlRydHd1dmJ5bUc5Umd0ckhIU1Zk?=
 =?utf-8?B?QVppai9QU3RoQUhMN3k2T25oeEorNVEzRktNNVJxb0tFdXB4RTl4a0dDZTFT?=
 =?utf-8?B?Vk4vdW8reVUxU2IvTm02TUJWRThzZnVMSlhtY09tank5ZEViZ0ZJTGMwRG5l?=
 =?utf-8?B?V3VER05SUHRWSy9temN1amMrcW5ZZTYrWWY1aU9CTjdCam5hcWRoWHY5WUlT?=
 =?utf-8?B?Y2ZsbTNaVm5KcVhvV29pS0Rsa09maXJERTVMSkc2UTJHYkxMcnlXTzlxQkFu?=
 =?utf-8?B?ek1FcHdsZC9rbEwrMWJqT0I4UTRMN2M1WUNuTGJXT2drUWc4WFYrVmF4ZWEw?=
 =?utf-8?B?WXorVmplL1V6N3dwdGUxMG02a3lrb1NBRTR1d09iNFdzOGlaaXhhZnZ0UzRp?=
 =?utf-8?B?bnZ4dHJuUnJqMWtqZkZCT1l6QnJYZURiMEJJSXp1OFZNdFJFYitDMlFRSFc0?=
 =?utf-8?B?UXZyK2lmRnFKSjlFd2o3blZ0REhteEpHQUJBUEZtRXUySnp0UnNRNk1UejBK?=
 =?utf-8?B?b2ZyQWZ4aDRSeEJWaXFnNHY4UEVnTnFzei94dlpzTllEbkVYMlRzdWQ4T0dB?=
 =?utf-8?B?V0R6MlF1UDNaV2JmeHNzNE1ubG9TSkpkcnNmWW5QL2J4VTNRWDVpdVdZS1Zs?=
 =?utf-8?B?aUtjdmxnektqME9jcjBsZWI3bWdUTWRwZU1CWFI0TDh6U0VhdVRIcklsdEJx?=
 =?utf-8?B?YTdSVzN1Q29WTVVveVNlcTk4NDFCU010ckFxNWw5UDhkSk1BRXJqTnlpNWs5?=
 =?utf-8?B?RnVMWDlYZCtQZ3hPOHNkN3pBbnZlQ3VTTm5MdWo0T3RRak5rUmVNL3ZCdnpH?=
 =?utf-8?B?QkFWN05kcmsxSCs1SVRNRnozVElmbHVsTk5aend3QTFnWTJINEZOQ3M5NlZs?=
 =?utf-8?B?Qit4Z2pCOVE1bldRcjYxVXh2YktrcTdIRThSQzlXZ0FtVXBjRkpScGczc2NP?=
 =?utf-8?B?b1RERTF3SmxuUHRMM3pIYkJuQitDUkNQWW5kVkgrMUxRZEJyaDJnZzAvK0Uz?=
 =?utf-8?B?QWt3ZGFva1pRZmozZ01TaXlUVEE2Mng4M3k5UnpaaUp0RktNbDM3Ui9tUlNC?=
 =?utf-8?B?WEJkR09FRlhpSldENzVhUTFZT01MWms1YmFSaExTdnRTMXpIT0tDdkZ5YmlT?=
 =?utf-8?B?OWlFN0wrSFlXeUhVL29YdkZ4ekV4bU96VHhvRW5PZ3QwTGZuNytWMXBnQkZE?=
 =?utf-8?B?cmlkcmJjVm1YN2NqYUVPamgrdkxWRVZFVXBFN25tR3FMNHlCWVpORngrUFZu?=
 =?utf-8?B?ZENvR3prU01nMTNwVHhLV2k5cGg2K25JMW9TMFVHdEU0aExkWFRjMTd6MHhk?=
 =?utf-8?B?QU50blI3czN3Y00zWnBmdWlIZEZkdVdzQzFabXpsdXZQMVVUdU40alZOYWJi?=
 =?utf-8?B?QXVVNklMcUNJNXpoY0xFRlhxV2NaTlFnTzIwOVZ2Wml2eWo4R2JKZm1DU1pE?=
 =?utf-8?B?eHVpeDdyVVZoLzljV0RGTTBvd0p1WEV1RFE5a2JyY0ZpN01HTmtxenJ0K1dn?=
 =?utf-8?B?YVVmWmQ0WWlmUXlmN3F1MnV4MUpRL2lRcFRnaVE1Yzk3M3F6R0xDVUZHRnJH?=
 =?utf-8?B?L0hIcWVEMEh5SEZORFQxQXNyQ2pRbkR1V25WelVOT1IrMTVEZmlUN05FYnVO?=
 =?utf-8?B?Vmw1MXJYYW5IUXNyZTUzR0d0V3Q2a3hGVGV5NlRYZ2NTWUJnVUc2anM5TjZU?=
 =?utf-8?B?OWk1MFJ3NEtYbTFuOXovYS9aZHhENGpyL05ySnE5c1c4SDBvdTViZ1pYV2dC?=
 =?utf-8?B?bUxETERDZkZ0blZNeVpPSUR6TWNaNXFJSU1UNkZKVHJCRm1vanhVK0d3U3Ba?=
 =?utf-8?B?ZHNBL3pkR3pudWhpSU1mQmNoNmI5VXFDZm14NnVrWlNDRnh1MTkrckpDQzh2?=
 =?utf-8?B?cUpjaUplU2JJNlJTZGYwc21udTVPbEVqRVVHRndDZ2p0by8zQ282NWhEek95?=
 =?utf-8?B?TGVHWkNlaWk5RGR3K3pyeEh0dS9FZWZ0WlJUakh3eTVnaS9TNVA0dCtIMlU3?=
 =?utf-8?B?SDVyMStrcjZDU2Y5YVVRTENkM3M2NUlXZXhGN0EzTjNWV2s3Qk02TXVBSW03?=
 =?utf-8?B?SmtpWWNPakIxWU5rZ3E0Mys0TXdUV2gwUjdBYjM4bDJ3eXltTkVrRnVqWnMr?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8a1a60-4ebc-437f-8577-08dcc835f1ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 14:21:59.5324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Em6H5IZRgRISyATtG+UBKCFYA3bUN+iK7uDnQ8Wt3ML1J1gESAcjszvvXPCwkouiUWFQuUjXp1g6XYNokmTv+fyyJ/oPFoEGfRGNm4trcPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2273
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 14:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203936

SGkgUmljaGFyZCwNCg0KQXBwbHlpbmcgeW91ciBwYXRjaGVzIHBsdXMgdGhlIGJ1aWxkaGlzdG9y
eSBwYXRjaGVzLCBmaWxlcy1pbi1wYWNrYWdlLnR4dCBnZW5lcmF0ZWQgc3VjY2Vzc2Z1bGx5IGJ1
dCBJIG5vdGljZWQgdGhhdCBsYXRlc3QgZmlsZSBub3cgaXMgbWlzc2luZyAoZnJvbSBhIGZyZXNo
IGJ1aWxkKS4NCkFzIGZhciBhcyBJIGNvdWxkIHNlZSwgaXQgZXhpdHMgYnVpbGRoaXN0b3J5X2Vt
aXRfcGtnaGlzdG9yeSgpIGV4ZWN1dGlvbiBmcm9tIGEgc2lsZW50IGV4Y2VwdGlvbiB3aGVuIGl0
IHRyaWVzIHRvIG9wZW4gYSBmaWxlIHRoYXQgZG9lc27igJl0IGV4aXN0IHlldCB0byBwaWNrdXAg
dGhlIGxpc3Qgb2YgcGFja2FnZXMuDQpJIGNoYW5nZWQgZnJvbSBidWlsZGhpc3RvcnkuYmJjbGFz
czo1OSAtIDYxLCBmcm9tIGRvX3BhY2thZ2VkYXRhIHRvIGRvX3BhY2thZ2VfcWEganVzdCBmb3Ig
dGltaW5nIHRlc3RpbmcgcHVycG9zZSBhbmQgYWxsIGxhdGVzdCBmaWxlcyB3ZXJlIGdlbmVyYXRl
ZC4NCg0KVGhhbmtzLA0KDQpQZWRybw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQpT
ZW50OiBUaHVyc2RheSwgQXVndXN0IDI5LCAyMDI0IDE6MDEgUE0NClRvOiBQZWRybyBTaWx2YSBG
ZXJyZWlyYSA8UGVkcm8uU2lsdmEuRmVycmVpcmFAY3JpdGljYWx0ZWNod29ya3MuY29tPg0KQ2M6
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIHYyIDEvMl0gYnVpbGRoaXN0b3J5OiBmaXggcGFja2FnZSBvdXRwdXQg
Zm9sZGVyIGNyZWF0aW9uDQoNCk5vdGljZTogVGhpcyBlLW1haWwgaGFzIG9yaWdpbmF0ZWQgZnJv
bSBhbiBleHRlcm5hbCBlbWFpbCBzZXJ2aWNlLCBzbyBkbyBub3QgY2xpY2sgb24gYW55IGxpbmtz
LCBub3Igb3BlbiBhbnkgYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHdobyB0aGUgc2VuZGVy
IGlzIGFuZCBhcmUgc3VyZSB0aGUgY29udGVudCBpcyBzZWN1cmUuDQoNCg0KDQpZb3UnZCBoYXZl
IHRvIHRlc3QgaXQgYnV0IEkndmUgYSBwYXRjaCBJJ3ZlIGJlZW4gd29ya2luZyBvbiB3aGljaCBk
cm9wcyB0aGUgdXNlIG9mIFNTVEFURVBPU1RJTlNURlVOQ1MgZnJvbSBidWlsZGhpc3RvcnkgZW50
aXJlbHkuIEkndmUganVzdCBzZW50IHRoYXQgb3V0IGZvciByZXZpZXcuDQoNClRoYXQgbWlnaHQg
YmUgZW5vdWdoIHRvIGZpeCB0aGlzIG9uIHRoZSByZWxlYXNlIGJyYW5jaGVzIGZvciBidWlsZGhp
c3RvcnkgZXZlbiBpZiBpdCBkb2Vzbid0IGZpeCB0aGUgc3N0YXRlIGJ1Zy4NCg0KQ2hlZXJzLA0K
DQpSaWNoYXJkDQoNClRoZSBpbmZvcm1hdGlvbiBpbiB0aGlzIGNvbW11bmljYXRpb24gbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG9yIGxlZ2FsbHkgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbi4gSXQg
aXMgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0
eSBpdCBhZGRyZXNzZXMgYW5kIG90aGVycyBhdXRob3JpemVkIHRvIHJlY2VpdmUgaXQuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkgbm90aWZpZWQg
dGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uIG9yIGFjdGlvbiBpbiBy
ZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBpbmZvcm1hdGlvbiBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
Y29tbXVuaWNhdGlvbiBieSBlcnJvciwgcGxlYXNlIG5vdGlmeSB1cyBpbW1lZGlhdGVseSBieSBy
ZXNwb25kaW5nIHRvIHRoaXMgZS1tYWlsIGFuZCB0aGVuIGRlbGV0ZSBpdCBmcm9tIHlvdXIgc3lz
dGVtLiBDcml0aWNhbCBUZWNoV29ya3MgaXMgbm90IGxpYWJsZSBmb3IgdGhlIHByb3BlciBhbmQg
Y29tcGxldGUgdHJhbnNtaXNzaW9uIG9mIHRoZSBpbmZvcm1hdGlvbiBpbiB0aGlzIGNvbW11bmlj
YXRpb24gbm9yIGZvciBhbnkgZGVsYXkgaW4gaXRzIHJlY2VpcHQNCg0KVGhpcyBlLW1haWwgaXMg
ZW52aXJvbm1lbnRhbGx5IGZyaWVuZGx5LCBqdXN0IGxpa2UgQ3JpdGljYWwgVGVjaFdvcmtzLCB3
aGljaCBsaXZlcyBpbiBhIHBhcGVyLWZyZWUgYXRtb3NwaGVyZS4gVGhlcmVmb3JlLCBwbGVhc2Ug
Y29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyBpdCENCg==

