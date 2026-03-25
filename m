Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACAAFEA814
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 06:59:31 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16597.1774421961495856878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 23:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=cYjyYnzH;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.14, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE9kPPVuXxBb2OgGgCA0K6k+KQyDPTv7XhuNb872mXB5BdE3F6YtxodtzHEKigTJFddA+ky7RJC5kILm2wEOPw3wOHTPzUpd9hFMLH7N4g7a+uFvjrq2BtAFZ6i/XcgyfhieTmzr/+omfoAY/Jy+AlfFRwNgXPmEn0EdPo+SItwlUYoDnguV2Q7XDQnHszKbeaiNTvgowZHrcXtwXb9SG4hEbbTaR6Ee62V/CXH+FYIFjPVGolgArTwP4SdHuY7L6H7rec3GGWcWsP7qy6q7XNtjXKCLIyASwZ05KC2jllcAlpqvtCXzgqfLRDyNT3uJAQQdoeea7wvOhtfnsbdRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAQiCEKrsyacWjVzr1UBAqUZUioQxMjk+gUX/svCsXg=;
 b=hariJGO/R6Ny7zsRkPGSMXfmGXdiH31Bd6XTXb4GxS0ni2m12Qa+QglEeQzcjKMCEhxvXF7/sCTbocLw/j1vYntb3QgbVQDWWW7JUBT0CzTlmxs1kIW8yiJIJzMFyfwG0zTSynbbqfC7YsLJoH0a4vT1U2V4ZoIT+njyN4amIL7xdD1VNBtN5gE3bZHDASm5uvvIu9/yY60bUJ2Tojm5CKkfra7/UFEZuclAPCx19v5PNrxwN/YmNgiLIP/gY/+K9OFNrR/Rx12K2aGRL8X4zFDkDGN3gLRlCy8T6UxLD/dcJXBvMeZQi1YRKRrS/Go2P+rcaQttxpW+AL2gHyyTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAQiCEKrsyacWjVzr1UBAqUZUioQxMjk+gUX/svCsXg=;
 b=cYjyYnzHDZe5TKgqrPjG4JK9Hq7JaWhsgG23U2UQcpmL8AiZTi9s2p05Bny4AiGKgwhRNL7GJryS7Qo3RAQkWtDS6cWsF+NAP5yFNkfKL+netsiII9NWM0BzG/4BsgbgY8SwM2Uq7WiD2dQH09W8RmfcPjpvykYECmbClzG+nmIZCvu10ntvqfhEo5mtOzmdvqW3wVkSi/T9eLu1U6DSEMKW/O99qfknX95SfTRECcTTFXxCugeOYgKP3Q4NLvasIb3xZ9zBPs4DLVpFDGfcZp1HLqRjyAe9AYmbtFfVcI3WeFaPSvhLy6xjm5wmLx9mylq/12XjaJI0FGF4w4TAPg==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OS7PR01MB14335.jpnprd01.prod.outlook.com (2603:1096:604:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 06:59:16 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 06:59:16 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Topic: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Index: AQHctfDeaW32L89xuU+z55bgHBoinbW91jYAgAEF/Vk=
Date: Wed, 25 Mar 2026 06:59:16 +0000
Message-ID: 
 <OS7PR01MB144441B6021F0829A5EFBCFAE9B49A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
 <03973F2A-A04B-45F1-832B-150E7CFE813B@arm.com>
In-Reply-To: <03973F2A-A04B-45F1-832B-150E7CFE813B@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-25T06:59:15.777Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OS7PR01MB14335:EE_
x-ms-office365-filtering-correlation-id: 986f9f28-9523-4ecc-96cd-08de8a3c07cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|8096899003|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: 
 DtaWCoTVo6eb/oaKppKDvqZP0a6snFlvPuGoG7yldIGPNDUxoegRhm5oa/uzTswYnYJ8cPEalhsa5Wo+6wTtbLXLCf53ANFCNGFA5IrZOke25wIm22v+FLcgy0vw7MI09kqMBL3iErdxA8HrGPmty7/dx/iekZfwaJXlGgX6hHJhmT6NjtYG6W1mLn4B57roMYFBIE8D8aenUPZ2cEjBn5NbyF+8n4E9XOTUAyDqVLjpcKqHJfUZH3qJXypJxADIQHUoZxzvoYv3iaUzkgjdVVwjjpzJW24D6gNWXlexwsFVjHWYGtrBUmQgVRwPQaFXUlLPzPaGepUo6c1z4YNonKztsk2Cw9E3/B2g9z5gpzh4ly6M288P9+elPuGRd0ozFOi49fZ7/VtxoCuT6sIbyr322crXH7recQqjnn12ZWeRjouJgc8RRl/joUNZW0MApIXPzHZO4Yv4Lt6TVz8oiQA5W5fncQZXdcJHzIknLrmL+vVnZ1D/ZieOLURDol162gt1Yk3Jf+Kg0BBMBCYusQQmanQnEWYXrg3SN+Q/bmre0fjYJn1gl77A6N6q6ZGkiT7sc1PTd6dhI3CtMOzYYtx+0jdP27eLm1HimXvL2qEqzBuYhxb8DsRLbR4eBjq5nvTYm0FcIeBDx0DMbHHXzyWwJrYDdrYVXoQWMBiMy11jC1+oMzEMl+vS4OVWTC2p2rkEYNaMBTs9CEEdRXsh2a1JPpVy6nXUAUiZa3vHdDy2msYrUmzYrq8A8HIcWpuP+gQV32ZNJeyD7fu2Y1uv8ZP1z2mHSjaX0dcEM+LY6DG9CXznp87+G6+hLHdMmp+R
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(8096899003)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZEE2KzRrekFYR25RaXZ0K2R4aHp0TXJBUnFta0RWVFVIOVNUSVFvVjI1Ymhl?=
 =?gb2312?B?TDFiaml5b3kyMEE2OVlueTRkdXpteEk0R0N1K2VzSDNRQzd2NVpRUXdvOHhx?=
 =?gb2312?B?RHREdFI0eE9kRGRKSXZnazA5bk53ejc1SGJiL3JzMitocXF4MkJVV0kwUTJS?=
 =?gb2312?B?Y1U1VHpXTnpON2JQWnZNeVd1cTFZREZFWUl0WWc0dDZhZHRQNTNTM0dlM2dN?=
 =?gb2312?B?bUh4LzRJSGMyN0ZwTy9mMkYxNEprVzFjVEIrOWhBd2lFeTdLWXVUcWtES0tS?=
 =?gb2312?B?Nk5LMEdRMFV0SjhyRWw3K1VBTW02MlZDYXNDaUx4cTB1TVhsMXBIVGh4bTNW?=
 =?gb2312?B?NGVuZXNuRmNUTldSZzZ3ck4zREkza0ZISWNvbkREU3VZRHdGODUwZ0tXckNj?=
 =?gb2312?B?V3B4eFpDcXM2cjR4bk1MZWk3RUEvcjVIbEVUTlhsMGI3USs0ajhORDM0YkhG?=
 =?gb2312?B?L0cwRWpZQTNRQmt5c3I3Zkx3dkdGUU5zK1lyU1dnRmFBYzdQemhaK01aaStE?=
 =?gb2312?B?QmcvdnRYK3FNMlF1d1VzekViN0NVTkw4K05pcEpUdDdWTzZmUlV3aWp5RjU1?=
 =?gb2312?B?VVFtU0J6WVh0M09jdUxUb2ZiVk54RysrQ3ZHT2xHeUdxWWNjSlZnUDVDWEN5?=
 =?gb2312?B?WlFzR2psYlB1bjdhOG5BeGtqNHhXT3doWjc3UjFBUGU1b3h1QmdGK0RMSGFw?=
 =?gb2312?B?aDdNYWx1SWh2Q25FYmRCbHg5WDBDdTJUSE9FTUZjMTJvNXQxZU9VdzhHc0Yy?=
 =?gb2312?B?SUpocG1OMjNoOWpvWWFlbWlORldhdWhLMC9QOVFrM2RMYWdhemhBQkRiQnZn?=
 =?gb2312?B?WHlEbHpLQWhTa25ObEFPT1V5eWpjRnQwcmFHRDZaclNUTHN2TStMYklBY2JW?=
 =?gb2312?B?eEZERWVTWW9WQStBS3R2VGNBL3N5Yjd0Y1A1TU1VNHNYd0RFRG1KZGRNNWZx?=
 =?gb2312?B?RmNUNnUySzlzVG52eVJ5bDRQM1k4QjBGaVpMZEFCaWY0RkZrcUF0Vko3cDdW?=
 =?gb2312?B?NkxCc0lVVXpiaGFlTXM1NWdacFJha0JIYVJZbzRSVjJDUFBPTFBianN4WUN5?=
 =?gb2312?B?d1FLUFZmMGYzU3hDOUVTblZXWHFPaEM0dTFud01lZGl1a1ZlWHpyZVlxMFpE?=
 =?gb2312?B?OEN0VVJEYjRTNlNDelRicFFQNHllSE9XQlZSRUxLaEZPR3lwTVBlVkExSXFr?=
 =?gb2312?B?cXUxeHQza2NWakZBaDF3b3BQNEpvTHJYK1ZMSDltT1pXaEFsUFdpYThpY3V1?=
 =?gb2312?B?eEkzQVpCTFhBdjV4YWdOT3l0SGxHL1NnUjQwUHpVejhtcEFDenBBVjNxNW9Y?=
 =?gb2312?B?Wlg5bmdHY3BvMjNzV09jemYyQWhYNjlwVll4Q3pJcWJmaTJ5UFFnN2ZZc01N?=
 =?gb2312?B?U0JQYSs4MWVtQk1sQ25FKzE4aEZBVHNXTDNvYW1mQVArU1UxTmpmYWtmSVNN?=
 =?gb2312?B?dXIxaGlrdVdnMlpVVklrQ29ZeGwvRXUrZmxIa2F6aElVQmdJNHZjSUxDVVhE?=
 =?gb2312?B?RjhSSTg3dk5xL04yUXJDRVFkRnVKaDR5QnVjSFZSeFl6VlVTVlZidFQwTUF5?=
 =?gb2312?B?M3RINXA5eExiTm5kSWZUSFRwOWorbjF0U3NYQVJjZVZIdEplRDhwdWp3QTU1?=
 =?gb2312?B?QTZ6SXBDQ0lrZUR5Zi9DNlRacWI3ZmM0UU9QU1E0Y3RNL1orTXNNYmVReE54?=
 =?gb2312?B?dEUyVW9HWHErNmI4U2ZSTUdOZWdLVzBrazZ4SnpacTNGcFM5dnVYTXhBNVhM?=
 =?gb2312?B?dVlzS2w0dGJMcDhHRGxaNitSc29BZUUvcld3MU52Rldxd0tKYUUva3lWQkJR?=
 =?gb2312?B?MU1pdXNTNFBhVWZpWWlWRE01ZnBoaC9vY2tYdy9FYmNXOEZrTmpjRzAxT1Bk?=
 =?gb2312?B?L1RJcG02L1VhM2lsWHNOZkg3R1pkaW9PaWc2Q3pYQ2pDaW00UGNBTWRhQk1q?=
 =?gb2312?B?QkgzdEx5c2JENVdTNW16cElDbU5OdGpDTjdrUEpsbmFvTjNnWnlpcDB2cDZs?=
 =?gb2312?B?Mi9ZckQrWkhvMkJEUk53NExqczJwWHViMzBxNjlJQTdBak8weUI5MU9FZDI0?=
 =?gb2312?B?QUlzNWJ4bnlaVWRMc0ZCVnhTRUJDMm1jaHpZbG5kK0JCNVVIbmc4N2Frdnps?=
 =?gb2312?B?dU1UUUpIMFV4SkZEVDJGbWQ1MmtVbE1zUUlDeE1vQ01UYVFBQ2dIK2VVbHVE?=
 =?gb2312?B?UUZrdDNLOURZRXlqNUJpZHpXdW8xUlJHdTYydmhSODRZZDdLZjNZU2pPcmF6?=
 =?gb2312?B?MmR6Z0oyTnl4dWUyVlpYbDJ2UGdPdStkYVM4YjJkSEkrNzRhQlhtOGFUb2tP?=
 =?gb2312?B?QVE2Y0tNSHNxYjIvdW5yZkxZWjVnZnpGQzRqT1BOYnhxbUNWbHhsdz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB144441B6021F0829A5EFBCFAE9B49AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fBBx3L4FAc6S+Un9K6osza96zsb5xczCabNVCJL4j3mw5YLIx47aH2GR/J3x/7bBurb7D69f0Nw3zpNkAiw//x0CL90gYKUFmN0zpzomh3C7OrwF4dLbuMnKi9tXnWOUJfyPzQTaGfNMUn7hW7I00exE0moEx1OVlW8RjISVM3yCvJRsB7Q8LnvfZFPcVcf+nTr9xQqjmd+elZtdMbtZwGjhbZDSrIT15vs6pnwE8S/fg4Y4gdVO5kEaK38fTBj2PQuYwtjAQtnQ/gGgGGPRgxdyRe/IDKIs+Qf1yBM0Rh3ye7zIA0e5AQ3VuYt4SufydI4dep9O89t+ALylGWupgw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986f9f28-9523-4ecc-96cd-08de8a3c07cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 06:59:16.5522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: od9fCzD9Z+7M6+aGtIW1YVMKjZJ4anyvbnqsi4UxlvAh36V/e7DrkLufFvrdFkSmDfhpGc9/MZi+brQMQJtOlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233856

--_000_OS7PR01MB144441B6021F0829A5EFBCFAE9B49AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgYnJ1Y2UNCg0KICAgSSByZXZpZXcgdGhlIG1lc29uLmJ1aWxkIG9mIGd0ay1kb2MgMS4zNi4w
IGFuZCBmaW5kIHRoZSAgZGVwZW5kcyBvZiBweWdtZW50cyBhbmQgIHhzbHRwcm9jX3ByZyBpcyBu
ZWNlc3NhcnkuDQoNCiAgICByZXF1aXJlZF9weXRob25fbW9kdWxlcyA9IFsncHlnbWVudHMnXQ0K
ICAgLi4uDQoNCiAgICBweXRob24zID0gcHl0aG9uLmZpbmRfaW5zdGFsbGF0aW9uKCdweXRob24z
JywgbW9kdWxlczogcmVxdWlyZWRfcHl0aG9uX21vZHVsZXMpDQogICAgIC4uLg0KICAgIHhzbHRw
cm9jX3ByZyA9IGZpbmRfcHJvZ3JhbSgneHNsdHByb2MnLCByZXF1aXJlZDogdHJ1ZSkNCg0KICAg
IFNvIGFzIG15IHVuZGVyc3RhbmRpbmcsIEkgY2FuJ3Qgc2V0IG1lc29uLmNyb3NzIHdpdGggL2Jp
bi9mYWxzZSB0byBub3QgdXNlIHB5Z21lbnRzIGFuZCAgeHNsdHByb2MuDQogICAgT3IgZG8geW91
IGhhdmUgYSBiZXR0ZXIgd2F5IHRvIG1pbmltYWwgZGVwZW5kZW5jaWVzPw0KDQpMaXUNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogUm9zcyBCdXJ0b24gPFJvc3Mu
QnVydG9uQGFybS5jb20+DQq3osvNyrG85DogMjAyNsTqM9TCMjTI1SAyMzoxNQ0KytW8/sjLOiBM
aXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0Ks63LzTogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGd0ay1kb2M6
IHVwZ3JhZGUgMS4zNS4xIC0+IDEuMzYuMA0KDQpIaSwNCg0KT24gMTcgTWFyIDIwMjYsIGF0IDA5
OjMxLCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1
eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gLVBB
Q0tBR0VDT05GSUdbd29ya2luZy1zY3JpcHRzXSA9ICIsLGxpYnhzbHQtbmF0aXZlIGRvY2Jvb2st
eG1sLWR0ZDQtbmF0aXZlIGRvY2Jvb2steHNsLXN0eWxlc2hlZXRzIHB5dGhvbjMtcHlnbWVudHMi
DQo+ICtQQUNLQUdFQ09ORklHW3dvcmtpbmctc2NyaXB0c10gPSAiLCxkb2Nib29rLXhtbC1kdGQ0
LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0c6GxDQoNClNvIHRoZSB3b3JraW5nLXNjcmlw
dHMgb3B0aW9ucyB3YXMgc28gdGhhdCBpZiBhcGktZG9jdW1lbnRhdGlvbiBpcyBkaXNhYmxlZCB0
aGUgZ3RrLWRvYyBwYWNrYWdlIGhhcyBhIGxvdCBsZXNzIGJ1aWxkIGRlcGVuZGVuY2llcy4gIFdp
dGggdGhpcyBjaGFuZ2UsIHRoaXMgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlLg0KDQpJcyBpdCBwb3Nz
aWJsZSB0byBzZWVkIG1lc29uoa9zIHNlYXJjaCBmb3IgY29tbWFuZHMgd2UgZG9uoa90IHdhbnQg
aXQgdG8gdXNlIHdpdGggL2Jpbi9mYWxzZSBzbyB0aGF0IHdlIGNhbiBrZWVwIHRoZSBtaW5pbWFs
IGRlcGVuZGVuY2llcyB3aGVuIG5vdCBuZWVkZWQ/DQoNClRoYW5rcywNClJvc3MNCg==

--_000_OS7PR01MB144441B6021F0829A5EFBCFAE9B49AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi bruce</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;I review the meson.build of gtk-doc&nbsp;1.36.0 and find the&n=
bsp; depends of pygments and &nbsp;xsltproc_prg is necessary.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; required_python_modules =3D ['pygments']</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;...</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; python3 =3D python.find_installation('python3', modules: requ=
ired_python_modules)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;...</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; xsltproc_prg&nbsp;=3D find_program('xsltproc', required: true=
)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; So as my understanding, I can't set meson.cross&nbsp;with /bi=
n/false to not use pygments and &nbsp;xsltproc.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0);">&nbsp; &nbsp; Or do you have a better =
way to minimal dependencies?</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Liu</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Ross Bu=
rton &lt;Ross.Burton@arm.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C224=C8=D5 23:15<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -&gt; 1.3=
6.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On 17 Mar 2026, at 09:31, Yiding Liu (Fujitsu) via lists.openembedded.org &=
lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt; wrote:<br>
&gt; -PACKAGECONFIG[working-scripts] =3D &quot;,,libxslt-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets python3-pygments&quot;<br>
&gt; +PACKAGECONFIG[working-scripts] =3D &quot;,,docbook-xml-dtd4-native do=
cbook-xsl-stylesheets=A1=B1<br>
<br>
So the working-scripts options was so that if api-documentation is disabled=
 the gtk-doc package has a lot less build dependencies.&nbsp; With this cha=
nge, this is no longer the case.<br>
<br>
Is it possible to seed meson=A1=AFs search for commands we don=A1=AFt want =
it to use with /bin/false so that we can keep the minimal dependencies when=
 not needed?<br>
<br>
Thanks,<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB144441B6021F0829A5EFBCFAE9B49AOS7PR01MB14444jp_--

