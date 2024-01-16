Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59408C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 11:03:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.113])
 by mx.groups.io with SMTP id smtpd.web10.10765.1705402975665333368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 03:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=kBw16C9q;
 spf=pass (domain: nedap.com, ip: 40.107.8.113, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm1ThtLqT8sjg6zNBR3KDdXz17dj1PS5wpKl1mf9cwmEgTgrH1YDny7XtTwyGy5cWMMaQ3oo0OH4EipfKnpFcgpryejd+FL3kkU2T11NBfcV9QeCqt5yb/mYoiXisZ4FLpb5tvAYwtkehvnsMSNYM52sHl2qH91JyB9fl7g8i8anExGaFaNAl+6fNt3oyOjBxDasfssDo7xGmfzZDCn9K/HaIUSV5QYuyWonEns47QPqP9QaXMY3oikMkY3VSapAQlJsCzL24tDrRFTmj4eKBFUMNj3EHt3Pty1S1crnopB5/cgFsmhwgpC2JR7sfJL94ItYfHJv1RUNIOnCmw+vfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+on19lwxTiyWFZWIEVzvd4AVRlKm6b9R4sgVD30E1g=;
 b=LHmFxezAVFcKmD3UWPm+gTzOm5QgAzoNr9B8HDVWcIv2ywLosN+HSjIbee519LlNF1fb4z1d3GMDYqFV1ttjYmnreKagYMqAz7d5lwAlCeXkAEg3pgutt0fzRw6sZ2wJdjuOTZ26f8c6YV3ATlkQAVTDiJ3A6613akKj6L+MoDhAGg878qIj4acQiZ112e4ZNfoBz6EugAx8j27BcZMPmrk9XX1p7z8/s39LedY92l0YhRl3pK7kNp7hwpNsg6cyk+LsqryvXTNAfZhSRqYGovwuzySnL8n91toGYwH7AuKeO8hyprz4J7k2LRsdA+3MZCxq9Gcxj0+iF8yT5CbLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+on19lwxTiyWFZWIEVzvd4AVRlKm6b9R4sgVD30E1g=;
 b=kBw16C9qyCvtZgKkJb4yiwLQGeINk7Nev5/8Tmj/kIM9J0suR515YrMXTTVZw55/mvGS44X1C9F3Ws5cuW9l3bNldJU5nJbmvxgMNvORSxSAjWc0YexI2W7/qXEd77ifYrGsvm2n35xx+VgLvBmlr3yCbow5Zk0Sg5scSS1J6mg=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by VE1PR10MB3805.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 11:02:51 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2%4]) with mapi id 15.20.7181.027; Tue, 16 Jan 2024
 11:02:51 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC v3 1/2] bitbake-layers: Add ability to update the
 reference of repositories
Thread-Topic: [OE-core] [RFC v3 1/2] bitbake-layers: Add ability to update the
 reference of repositories
Thread-Index: AQHaQkDbQO4SYF/iqUWX+rPvRqE5OLDRRyIAgAsLXCA=
Date: Tue, 16 Jan 2024 11:02:51 +0000
Message-ID: 
 <VI1PR10MB3182B4EA15E8E4EDC4F7F879F7732@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20240108143857.2316-2-jermain.horsman@nedap.com>
 <20240108143857.2316-4-jermain.horsman@nedap.com>
 <CANNYZj9umrn2k6Z=+Q3cmEEg=x9TDWBUFwuVZSVUxbBHbhFEHA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9umrn2k6Z=+Q3cmEEg=x9TDWBUFwuVZSVUxbBHbhFEHA@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|VE1PR10MB3805:EE_
x-ms-office365-filtering-correlation-id: 49911612-c1d2-46f5-5c0a-08dc1682aebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d94ymtbbn9vGNKguAxPf59Z7vqnQKYdSO0u90Ytm+/LhhMLQi3mpd4yIQbagf0QYFgVf69TxkFoyy4ElmcWfSHE+wnzWRcZTtD2f4LNNvpy0ZUaJPRVy08YZ1/zzPLiZAZ7WhrstT4VjWUQ7l3/ogmsobj2S7AidIuomqlmsM0o5cX/pK84Svrd2i4oPNKHmXm+gXpTO6sE8H6dTzs4By7x2dFRu9uVIJ756GI82UMcmGdtMmxU87Yv7R6wqgjjx0QEhJVmd2sYMfjG17OGz0dUkUnMuKbnmKY0b6i7w9LE9jvT16WuVtZkEQDiyl+UlBop6981Lbaok4U/hw7f6OidtJrCGJ4bQ0P2VeLP2DX7/lmiSo9K1Uug1VsLU0qGxoUHbfe1dHeiJBdYjMtjU/fNYar6+CKJGK1AQgcyQsnmaYxHDWIkBmj/fBphA6mKofToAOBEH6kn0BTZxAKf489x/2NUXnQppAhHBSN0jx10/v7aAECkIN9ApTSyJgwGVvOGKrOaydK1M08NYHGfX/KJqulAgucKAJPvVD1YPwQffK6kVJ2UnPXY6c1nT4HqnPJoXSWoeRt3urt/r/QnghLhC1f8KQfeeQb0V8klAvY9XPO0MJmrpf2inUGx3lgnq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(86362001)(6506007)(9686003)(41300700001)(5660300002)(44832011)(4326008)(6916009)(66476007)(71200400001)(2906002)(64756008)(8676002)(66446008)(66556008)(316002)(7696005)(478600001)(52536014)(8936002)(66946007)(76116006)(122000001)(558084003)(33656002)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bnpMdnJNM2kvSjFRT2JUdzcxU0xFc3MwR210NlcxNnZ4ZGRiS0lZZHJTYXZo?=
 =?utf-8?B?Y3RMZ1RVRXFGVGVzTTB4Y3JsbTJ3bjMzK3JzZXVKNzlxaGF1N2F1TzlGY2Nl?=
 =?utf-8?B?YmNCSnoxQ3ozOUY5U1BZZGgyVHhGUnhVTENYSlBCeEVwUnBKUktER2lHcGpE?=
 =?utf-8?B?aTJxMVJRcnBQaDZxR3NmUU0yaFltSHcrWUxuTXg2emRhVUFsdDdyVm41Yjh6?=
 =?utf-8?B?d3NmMlhWa1QxUG9pK211aDZ3SkVDbHUyMlNML3g2RUhDenhKeDBpYVY2VTBv?=
 =?utf-8?B?cGdWWTlEZTJiRFpGb0VRaGhhbW9oY0xwZ01HY2pJOTM4RGlvdFFGaldxMFRI?=
 =?utf-8?B?ZzlkTTRIQWkrRTZVKzF6dHBha0tycWhCTTgvbjk0K29XKytSUFB5N045dE5v?=
 =?utf-8?B?UkhydTlEU21lK21GNVpab0NMYlJmejFNUmRCOFdaei9qZUpBQ3M3Q2ZESXJH?=
 =?utf-8?B?bFJNWVBTQkJSUUpZWkpPMkw2UkhDTzdIZkNicXZZaTU0M2JTanFUTGZGUzdx?=
 =?utf-8?B?RVZ5bHhwWkllV1JqZFgzRGJHSG5ZbjUxZlJyL3BqV3lZdWFPUjNwenhRNUpw?=
 =?utf-8?B?Z2Z6YjU0UGlDV1VxV0ZpY3ovNkl2UjhCZ3lMRDY1SWFyT3lYVkJiS3cwSHdh?=
 =?utf-8?B?cnkzWkxDamkrSWFidzB1NmMrR1hEbTdqekJ3ZEsvMVcyTWRDMUhjTm1hSVJ4?=
 =?utf-8?B?cnJWMG4xSm4zRHBuTSs3K3F4Y09jUmphQ0gwWm8zWlAreEhFSkxtNlF0SUxj?=
 =?utf-8?B?R3B6a2RHWm0zb0ErZ3o0S21rUUl4NDJadE9DUkk0dVlCUlg4OUlCSXdqSFhr?=
 =?utf-8?B?U0N6OGNzOThuWDl1eEU3dFdpdzF6RE1sZlQ3d3RpSU12eUVvU0VZSGcyRVF2?=
 =?utf-8?B?Qlk5T0N3TXJHNFFZbk9abThyRksvT1Q3UVl4M0FXZzh2MEpZaC8xZWNyekYx?=
 =?utf-8?B?SDlGTzJjREZpbnppVHRSTEtJODVuWFJmaGVRc0FaZmRZUWhYWlY1VGxQN3J1?=
 =?utf-8?B?UWJMeUlUcVljS0NUZk53NDBUQStBd3hBN3dzYVh6ekdyenBkUmxvc1RoMXhY?=
 =?utf-8?B?RWQrZzFDUThHRVFSSVVURTZGby9KOENyaXhqZXZtVFVsY2pNUW5HUnd2akxr?=
 =?utf-8?B?ZmNkMlVnNkVjc2hLa3JxWUx1dm9lVlZOVHRpdmdOc0gvODBpcWlreXBrdHA4?=
 =?utf-8?B?ZlZzRVNBOUJkd0RDUHVJVnpwc054RFlSOWF2UWVwbmM5VnFUN0VoTzdqRDdM?=
 =?utf-8?B?TGxiRnRMcXZXZ3pWWnAyMnVNYzRBbjc2TkV5QTg2Vk44aFZzRk5OMlZkM1FV?=
 =?utf-8?B?RzRmc1VheHlZM3d6azgvbEw5ejJkaTZYMnVLZmpLYWRHTGxWVXMzUHlVaXFC?=
 =?utf-8?B?djd5V1o3SlZZTnRndmRyRnErRGZNMWw2UExqb21ad2hJYlQ1WWNVLzFXcDk5?=
 =?utf-8?B?WVZhN01Cd1JSOXlwOHdDZEVYOVJGelovK0phT1FIa05qeVVJOXEzdUdXcFBU?=
 =?utf-8?B?djY3Zy9XRzVHUHBueEliQW1sZDZDaGlZbVpnaEhzbWU2cUJvblRJRU9GVnE3?=
 =?utf-8?B?OTZUc2dJM0tCdlIvM3dkQTBXRWw0UnhzbUx2cGNOQitXZldiQkNoN2tKWG9i?=
 =?utf-8?B?NDM0WGVmTEZ2QjhRYmFidUpJRXlTeUZ3aCtlbmJQWTV0MHJBdjNaWVVOYzZB?=
 =?utf-8?B?TkxjdDR6S2c2eGNnbmNTN3pFQlFUTjRaeGNIVEdUdzNRV0NVQm0vQTZkN2U0?=
 =?utf-8?B?MEx4ZkZLU1FGcVdXR0xlSmxkUjB4VzlscERBWkZteU53TmNuemkzRmVpRzBy?=
 =?utf-8?B?ZjVkajdndjAzSjZjVTd1MElFV2JPbzBtTTgwenhUaDQ5K3dNWjVWY0E0dkJF?=
 =?utf-8?B?ZVp1VWRwZitOVkZmcDA3RmFGOG9LSlRVZkNwYVJYa3NTQzQzWWl4bjdUR2JP?=
 =?utf-8?B?N2hnV2pBcFRlYVh4aURoOWFFQU9xZmxxbTM2NkRrOE9nSno5a1M5SzQyZjJ4?=
 =?utf-8?B?Tk9Qa1lIdVhadjlvaFlUM3hBRjNzZENtcEF1LzVjU25xOVI0NU16WDkrWGdU?=
 =?utf-8?B?a3hhSzlPL0xVNkxsQ0RXa3hySnJWZ0dwSkFLSFQ1SkZBeUFQOURlOCthbVQ5?=
 =?utf-8?Q?nW0EmGSL5WIL06QvcmZiB62yd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49911612-c1d2-46f5-5c0a-08dc1682aebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 11:02:51.2365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dy3JX9BgUteFi3+/Y5j87YYs+a9Szy8C15TAUhSML9dw3WJbtcYah8njNLuklx8CGSgwYMa3ZPkz+sPNkDmmr86S0Tjp5YjxDCfmtCDHUOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193853

PiBJcyBjb21tYSAoLCkgYXMgYSBzZXBhcmF0b3Igb2theT8gTWF5YmUgOiBpcyBiZXR0ZXI/DQoN
CkluIG15IG9waW5pb24gYSBjb21tYSBzdWdnZXN0IGEgbGlzdCwgd2hlcmVhcyBhIHNlbWljb2xv
bg0Kc3VnZ2VzdHMgYSByZWxhdGlvbiwgc28gSSd2ZSBvcHRlZCB0byB1c2UgJzonLg0KDQpJIGRp
ZCBpbXBsZW1lbnQgYSBuZXcgdmVyc2lvbiwgaXQgaXMgYXZhaWxhYmxlIG9uIHRoZSBtYWlsaW5n
IGxpc3QsDQppdCBzaG91bGQgaW5jbHVkZSBhbGwgb3RoZXIgZmVlZGJhY2sgYXMgd2VsbC4NCg0K
U2luY2VyZWx5LA0KDQpKZXJtYWluIEhvcnNtYW4NCg==

