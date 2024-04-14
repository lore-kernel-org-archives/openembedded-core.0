Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EA3C001CC
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 07:29:23 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web11.28222.1713079758549722120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 00:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dXFyxVHs;
 spf=pass (domain: siemens.com, ip: 40.107.14.75, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9wSt+orIjD34JCfeqFVSFQSj/a+sQGNz0gfNLQJlQzTYvSptJEsI+lwaQCt+RV0f5O/0GpD2OgF2eorVBPLFDCbwE+FuwkZPUv1IeXSr1KN6Hb9YGR/vsVSCdCWUW0G1UOkLqzo5gw+wvduYmQAzJkGS66g3c/sbd3LFSxDsQO0uOyFOSV/tuLiagKCQB4XkvwQVfCczbf7JLmAS+1gaCFTyjJB30g6PHmw3SVhlgptHfkA1X4JcM8TaSI2M46nRJolza+wu9CiyuKeOWypcSuYzpv0o34u4muEnSbKW4N0MlqvyUx8Wuo4Ajq8gz+3sPKzH/OEmpsiDcFFT9bTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Se5f51zPFcPT4H3ZxktVfy/wAlNLLpw2iVoTZlB088=;
 b=dPp+ZPIc+kuOPRc7Qble1tZnmP62mPhjvOLh0B94/Y+1TNprqFLmz1OOJ4/WIQmExwyWMSHQzFvHZCelX6LMlokpxJrZ+AgimK+6tDZurWlM141v0ynxmZp7J8AoYIqflsLB93pyVf18hNCox/XGSJvukYRNEnkoRJP8bNUyboyL81uxy1YW6jKYNyJtmEmdR+fjgEXyut96/0KW9zFVJDCjoPkSJ0PxRBXj3cDY+vScsdzLdLkgcMkN9zopa8PtHk1Dn9sQ1AnOLhQsNhsBNvcqKue3cOCrVDYuL2BfIJkct2U4YfxnqbmMLB70QqExin2dx65iE1kNvjUECAB17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Se5f51zPFcPT4H3ZxktVfy/wAlNLLpw2iVoTZlB088=;
 b=dXFyxVHsv62KiqXia11HWTeb2mj/LDH3Hu8jKnWmP2aG712h8ko7FWMRiNW7MKuQJV5jD/hXi7VdL9z/bLyGGSALI+uugSRYnXY188EGJukEG2W+lH8baW2QM5g10lBqnMGPDAm2bP0DonX7HQz93Lt9LnjFKgoZGn/BnXQEfD8fTiGX1/c9KuXkJbQbvN7o4cr5bMr1393TsTSiNwwxQfmuBGmOjxA8bOmbq+lH2m5flSlQrB6/+cW8aEaxNaEwL16wzFM+QogIQNTTtszTSk884wc6ryP4OA35wr/KNvDiieVPRtz3xDRqHZIdd5OxCQHkMlGAs7x1gnspgLeing==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Sun, 14 Apr
 2024 07:29:15 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.046; Sun, 14 Apr 2024
 07:29:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ticotimo@gmail.com" <ticotimo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] openssl: openssl: patch CVE-2024-2511
Thread-Topic: [OE-core][PATCH] openssl: openssl: patch CVE-2024-2511
Thread-Index: AQHajfTtGAobj7v60UKkVXwId/nmdrFnMPyAgAAs1ZA=
Date: Sun, 14 Apr 2024 07:29:13 +0000
Message-ID: 
 <AS1PR10MB56978F4AED9B46D356A2187AFD0A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240413224917.1772877-1-peter.marko@siemens.com>
 <CANx9H-C_-5WjpQnsJ3mye2UxNf_p+1Qa+nd+4aOAKqsxfg_Q4Q@mail.gmail.com>
In-Reply-To: 
 <CANx9H-C_-5WjpQnsJ3mye2UxNf_p+1Qa+nd+4aOAKqsxfg_Q4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=67fd52fc-e0f7-4fd6-8214-4b7db248fad8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-14T07:25:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5322:EE_
x-ms-office365-filtering-correlation-id: 449e5664-b7dd-4d51-1912-08dc5c549584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OihCgYFn4YGWH3jPe+LesC9mjv1H00OuzBM2ckP2M1tQnwJG0KLxSMGASvLHuxYxl0m5wY8NwcHQYjM6NWuMQE08c98i1TugpmtRRrCbKKHdkIFgrbQGs/7vg4rAA4G1vAi3DkWpQzTrcXZegnL7oO5SZm2AZYuYZelrdAeoNfVGoPKrMTrtPoR3mO9uEMQ26F+0sctKqOfAZOJo55cmUGPyllWD5ZrC2g0jjNeCPGpp9mhHFRYrHfsU2Pumf/X3mm00E2eISy+w6kQChAfAtMoAMyIBA39UgjLexXHz9O8ouTwDxtqcaphMSuTgixbOGZWYpD7ESwS1Q9cIX/ErzrtnIUh9e/GTM8COKPeLARA+rZLiE3OabHKltTcEAwGVnBgNA0hdO7Q75V51uAcj9SkQ3s2OEFT1WT3isFcz0m2/K+Sf45Pk6j2+pJTy20KrDWqiKnq73pGqzGNaEW2pBKD0sLW9DGGqDdD7saDCtxQqt1OYsIjrw4EKmihmuol6doePrIUSYkkBnBhWNxn1RwGr0BsQc6KRkRcNTovGfEMxLJb2E+SobLpKk8vUjq7c3nPAfXiaQovvMtDBo6eq/VX/lLxWXKiHXoxAKwwFgPcrPIcVesU+Stp43EPyD1HKg8WGZI8ptq+YId/l5vM+W+lPJR8S2wDWfmtVlSXv/pKy+SyiPiO0mmFRX0JxiauG8KimYn1mvg5QbL8MEf01a1zAwm3Z9+uIg+aImncoqbo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVBoS2RCdGZpaHNwWURIVWt1UWJwbzlKVXAydFNIc3pNVGJiTm01R09FSnNK?=
 =?utf-8?B?N2JIM0xNQ0NudnZFaytYdTJ4eTJTMDE4Q0RJeGhINWE4THZPd0dSazRUekZG?=
 =?utf-8?B?MWY1SUZpaDlVeThKMERrQURzSmhFUTFuK2s5N0huZW05Sm1FZk1abTNGOWFH?=
 =?utf-8?B?ckVSWUJsK0hlVWZLaUdGNDhKdG0zR2ZqYW1iazJFMnNYVWltRHpTYUp3SHRk?=
 =?utf-8?B?ZEhmV0tjSmROL0x6V1ZNd0ZHOTdmWmswd2duYTkzUE9wUTR2cFBZRE1JRUtG?=
 =?utf-8?B?RVNQWUZZZkhQNkRqTlRpTlNLNXRYeDB6cGZwVS9XWEZtN3ArWGN5MFNRTzh3?=
 =?utf-8?B?OHNsanR0cS92WUtpUHI2ZGo1Zk1aQVJtWGtOYk1JU1gyNyt1L3NHS2lvSG55?=
 =?utf-8?B?d3daRWxySlZlVmZoT2pSZ3k5ZjdOY0Z5aDhnN0Y3Y1gvYi9xSEpEa3JEVnZX?=
 =?utf-8?B?TmZESFhZVkpRZEhubEI1RTE1bTF0ZzNhSyt2TUJIRFZMaU1NV2RDRzJXS1VU?=
 =?utf-8?B?WmNPS2F0UmZkOFpBOUVxMnA2YldCaDRDUlF1Vjd6M0lUU21EdlhVa3pvdm5k?=
 =?utf-8?B?QWFNeHZ0aG1XbmlkdDdXYzk0ZFA2V3d0ekE3MFpLbEY5Kzdlc0FrRGc5UDg4?=
 =?utf-8?B?bEJWQk5DQjF1Y29TbEJhNGVnVWhxY1pzNm1SbVBDaXRiRjlBcGVQZklNemhG?=
 =?utf-8?B?TmFpakRXcnVGbzdiZkNFWjdHUmgxKzZCd1BnNVhnVUVaNGJXYUpaRFBBRHFG?=
 =?utf-8?B?M1p2T3p3aTBnTWxhakQwYXlaSU9oMHY2K3U3VW5oSUJWQ2xNR0ZhaXowalRN?=
 =?utf-8?B?MHljS0ViZkV4VEIrY3BYMWJmT2dWdlJBNGtpbjY1dmdMWjVaazhtQ1c4YkpJ?=
 =?utf-8?B?cXdFSkY3UmpWT1piWmNlU29RbHF1Y0lVT1gzWmU3ZzdYY1BuS2VYTEF1aXdp?=
 =?utf-8?B?QWtMRTZ5OE05RUpOaldUb1FLL2laWTl6bUJsdC9SeHJjNkhUMUlDaHgzTHox?=
 =?utf-8?B?emRxc1N1b0toei90UUJUdFhjYkY2blYyQm83aktvMW52TFJ5ZkVBT0M5NmlS?=
 =?utf-8?B?SUlHUi81OFpLVFh4NmozMk9kR1V5YnYzTGV0ZGl6Tk5kem1GM05oendSTlZr?=
 =?utf-8?B?bTBMV1hjRG1hQStJL3NRY21BNWIzTjNtZGhFblJCaEpYM2pDenRBWE9SMG9t?=
 =?utf-8?B?ZlkwUG94bldETnk5ZVhoWFRjd1JHTEFCcFFMaXc3MThxR1d2aDE2VXlzZjZu?=
 =?utf-8?B?dkdPbnBRWGg2NjFpck8xOUx5Q0xjT0Z4N0pocVBBZkJLZEE0THVqUVdldVB5?=
 =?utf-8?B?OWF0b2xTcnVIN0NWWHFqQ004TnZuKzRJbi9qeHZYMW1oZjRaVjEzVmZ0dmZS?=
 =?utf-8?B?Tmc0alQ4UnZxam9LTVhUOGRESCtpcjhRT1BQTE82eHkvVGNBZit0aGJROCta?=
 =?utf-8?B?UitpMjB3SFhQalQ4dTBwdGlmbkFCaDJHZUV5VUlodEE1M3NRcFl6ZjRnRHNa?=
 =?utf-8?B?Q09keEtObFI2S2x1S3RVc0NoTTU4OHJjL3dMZnN6ZmhmRlg3VEd1MTZjb3BR?=
 =?utf-8?B?QXJUM3Q1MWhrNFZaNTZhdGhoQWM4bmg0UU5tbHFSZE1QQnd6RmNyVG9ncUhD?=
 =?utf-8?B?dXpJR1A5OVFDbXBKV0VpamRydG5NSXM3SDR6YXk1TFdnRXNQS1BrdjNDSjNN?=
 =?utf-8?B?dUt3K1JUWmJuUEl2U2loY2hEdWtkYUtmSmhua2Q1dmMydFd2V1c5U3h0TEZh?=
 =?utf-8?B?cFNKTmhGRHk3VmpmamduN2pjYjFWYmFjSXZ5T0pLM1hvVjhxeEQyYlpPMnA3?=
 =?utf-8?B?R2RjaDRaT1dkUGNJaEIvNndnZHhrMXdsMG1hM0lTUHV6bW9yMlNBOVVpZmo4?=
 =?utf-8?B?YzVHV3owa3JiVWt5SlRDQTdqeTZleWRtcFFhalpIYXd1MkMvODBEUU05Y2hy?=
 =?utf-8?B?WTBNWXhxeTRHYXBpNGM5elhobjJzclZjc1BYRUF5b0ZIN24zSjhiUEM0VXJH?=
 =?utf-8?B?b3NlV0Q2d1Byc05ra2lTUkJLRUI4emhiUVY4MkhXOGFOd3Y1MTl2Yi9TbWNo?=
 =?utf-8?B?a05hSThnMk91T0RFenY4OEtPeHRwQnlXeFNxTFE2MktyNUFaazZBYzVlVmR5?=
 =?utf-8?Q?1NpYyvORVcmuOK9ouGQCsCdPq?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB56978F4AED9B46D356A2187AFD0A2AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 449e5664-b7dd-4d51-1912-08dc5c549584
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2024 07:29:13.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYmmySYTewpQgwYqE6X6jqw0N6H7spSvWVy6gTw1jkW6CfeSfKm+GicVN7w1KZ8eXMReQ0YWfx10Ys7P44XVug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 07:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198205

--_000_AS1PR10MB56978F4AED9B46D356A2187AFD0A2AS1PR10MB5697EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aGluayB0aGF0IHNlbmRpbmcgdGhpcyBwYXRjaCB3YXMgY29ycmVjdCwgc2VlIGNvbW1lbnRz
IGJlbG93Lg0KUGV0ZXINCg0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVo
YWxmIE9mIFRpbSBPcmxpbmcgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClNlbnQ6IFN1bmRh
eSwgQXByaWwgMTQsIDIwMjQgNjo0NQ0KVG86IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZT
MSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIG9wZW5zc2w6
IG9wZW5zc2w6IHBhdGNoIENWRS0yMDI0LTI1MTENCg0KPiBMb29rcyBsaWtlIHdoZW4gMy4yLjIg
aXMgcmVsZWFzZWQgaXQgd2lsbCBpbmNsdWRlIHRoaXMuIFNvIDMuMi4yIHNob3VsZCBiZSBhcHBs
aWVkIHRvIHNjYXJ0aGdhcC4NCg0KU3VyZSwgb25jZSBpdCBpcyBhdmFpbGFibGUsIGl0IHdpbGwg
YmUgdXNlZC4NCkJ1dCB3YWl0aW5nIGZvciBpdCBjb3VsZCB0YWtlIG1vbnRocy4NCg0KPiDigJxt
YXN0ZXLigJ0gd2lsbCBiZSBtb3ZpbmcgdG8gMy4zLjAgc29vbiBmb3Igc3R5aGVhZA0KDQpDdXJy
ZW50bHkgYm90aCBzY2FydGhnYXAgYW5kIHN0eWhlYWQgdXNlIHRoZSBzYW1lIG1hc3Rlci1uZXh0
IGJyYW5jaCBmb3Igc3RhZ2luZy90ZXN0aW5nIHBhdGNoZXMuDQpTbyBzZW5kaW5nIHVwZGF0ZSB0
byAzLjMuMCB3b3VsZCBwcmV2ZW50IHBhdGNoaW5nIHN0eWhlYWQgdW50aWwgdGhlIGJyYW5jaGVz
IGFyZSBzZXBhcmF0ZWQuDQoNCg==

--_000_AS1PR10MB56978F4AED9B46D356A2187AFD0A2AS1PR10MB5697EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGlu
Ow0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJ
e3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+
DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+
PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4
dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxh
eW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5r
PSJibHVlIiB2bGluaz0icHVycGxlIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRp
diBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgdGhpbmsgdGhh
dCBzZW5kaW5nIHRoaXMgcGF0Y2ggd2FzIGNvcnJlY3QsIHNlZSBjb21tZW50cyBiZWxvdy48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBldGVyPG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJv
cmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBp
biAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZsdDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnJmd0Ow0KPGI+T24gQmVoYWxmIE9mIDwvYj5UaW0gT3JsaW5nIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGJyPg0KPGI+U2VudDo8L2I+IFN1bmRheSwgQXByaWwg
MTQsIDIwMjQgNjo0NTxicj4NCjxiPlRvOjwvYj4gTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBC
RlMxKSAmbHQ7UGV0ZXIuTWFya29Ac2llbWVucy5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGJyPg0KPGI+U3ViamVjdDo8L2I+
IFJlOiBbT0UtY29yZV1bUEFUQ0hdIG9wZW5zc2w6IG9wZW5zc2w6IHBhdGNoIENWRS0yMDI0LTI1
MTE8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBMb29rcyBsaWtl
IHdoZW4gMy4yLjIgaXMgcmVsZWFzZWQgaXQgd2lsbCBpbmNsdWRlIHRoaXMuIFNvIDMuMi4yIHNo
b3VsZCBiZSBhcHBsaWVkIHRvIHNjYXJ0aGdhcC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+U3Vy
ZSwgb25jZSBpdCBpcyBhdmFpbGFibGUsIGl0IHdpbGwgYmUgdXNlZC48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJ1dCB3YWl0aW5nIGZvciBpdCBjb3VsZCB0YWtlIG1vbnRo
cy48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
Jmd0OyDigJxtYXN0ZXLigJ0gd2lsbCBiZSBtb3ZpbmcgdG8gMy4zLjAgc29vbiBmb3Igc3R5aGVh
ZCZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5DdXJyZW50bHkg
Ym90aCBzY2FydGhnYXAgYW5kIHN0eWhlYWQgdXNlIHRoZSBzYW1lIG1hc3Rlci1uZXh0IGJyYW5j
aCBmb3Igc3RhZ2luZy90ZXN0aW5nIHBhdGNoZXMuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5TbyBzZW5kaW5nIHVwZGF0ZSB0byAzLjMuMCB3b3VsZCBwcmV2ZW50IHBhdGNo
aW5nIHN0eWhlYWQgdW50aWwgdGhlIGJyYW5jaGVzIGFyZSBzZXBhcmF0ZWQuPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_AS1PR10MB56978F4AED9B46D356A2187AFD0A2AS1PR10MB5697EURP_--

