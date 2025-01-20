Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22932C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 11:42:53 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.89])
 by mx.groups.io with SMTP id smtpd.web11.34927.1737373367200792268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 03:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lLBO9tIc;
 spf=pass (domain: arm.com, ip: 40.107.104.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3aXDgHlYKzX7nS5Y/DzIuyXKEGdjQP3BMUZqORIUvrhcNMx2BhJdR/xChcH9JuelBBRjvNDjlOifHkdG3MaquoSzUywRcgvBOhDMODIpmRUEj9jy7/KQnqYtLtGy4IW7U75qAZC7FS9bf+ttsG3suDt/pNnBbBoxArcstPAeo6s65uXKzr1tGqdDZeDBn4DRaOMT7aQbk7BCo7SassPNQJ7o2dgrqMl8ddE8m1qIxkJyo9AYNxzt7MeBDf9IbnIaXm+LRKY/xdz8qCwI5IohBc81GO+oynS5nhvHxBk7ECJzrjpuZZQ28z8fHd+euLY4pj7V5NJoLBb669lG5H99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFk+D3FxQntinqmzqL2jGeji6f6Y2swy221xAsph+98=;
 b=oOOTl3/a/LxjGHGjiAdq3R+CgJn4NqqA3veY/Hs9OMeR2R8N9iyYfZJvEnUzc2YYUlJgAWYNKh/iwMKR8E7UksL2pm+BIebOzsPQisazLpbB60ZGsEC2pgVnHSbBfGDgwNXy1VRi05RYHWV85iYOnf8EsjV36kSh1heU3xCT+isNh6Hok+G2Q4Z1m/f+Q5aKmwsBE3+ycGnMkVSc/WKvFFH8wpvfnIi5peQPkw78DnNrAh/CCd0Io5g3uNNdBKWReGUfRQILc78jbxCyZ2v5a0tNIAOvwZk4Qu3jeiK3/joWqnduz8FfzEso25xSatseWQVZrJVetgekks9TefRknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFk+D3FxQntinqmzqL2jGeji6f6Y2swy221xAsph+98=;
 b=lLBO9tIcC/Pyi9XpBd88DHg7tvreop1vvasebPInNrSjnASsGPXyqhJK+XL2pOGYjoF5Nm+VArkP6cHuXh3wNbG9troAHu5GgB6GgYNfuOmmEVexiPAKwmR8ojDtDzSeyUfQ8LlGMbm3Qp7WO+5/F+hBS3a1nVfJbfG/bgWL/mY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9812.eurprd08.prod.outlook.com (2603:10a6:20b:603::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 11:42:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 11:42:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] fmt: disable buiding the tests
Thread-Topic: [OE-core] [PATCH] fmt: disable buiding the tests
Thread-Index: AQHbaOBVxi3WnWWpu0udCmBqI5XHkLMfjwaA
Date: Mon, 20 Jan 2025 11:42:41 +0000
Message-ID: <1730EC38-9726-41F4-A176-8341C134C807@arm.com>
References: <20250117130402.130412-1-ross.burton@arm.com>
In-Reply-To: <20250117130402.130412-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS2PR08MB9812:EE_
x-ms-office365-filtering-correlation-id: 2ff938da-e050-4673-344e-08dd39478c6b
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dExvQ3pvR2hCUmNQRDBEY0xwM2NlelZDb1Y4WjlOOS9VVVh4SGlCQ3B1YkJz?=
 =?utf-8?B?N2tFZitrRHVpZ0l6TEhCNGg1anNrZmNoSFZCaWRFMWZVSndweUxTNFlrUTk5?=
 =?utf-8?B?NFhjN0lTcXBDdm5iakVwR0svOU9WRWpJRGUrdmR0VkhvUEtpOG5EaXRQYzB5?=
 =?utf-8?B?SVZWd2JlTnhnUjRMQW5lNGc0TGwzcjNaN3VWNmpZUWE3RWcvL1RFOEtPUmEx?=
 =?utf-8?B?K1IxMHFic2g0MmludktTaWJ0NGdxTW9oMmlXdmNjTFFPRCtDaGJ0UFhNMVln?=
 =?utf-8?B?Sk5rS1dTa0JJUkVZZE9oaEU1Z0lna3VBK0ZKMHlXbHlJejJqbUE1RkEvVkJG?=
 =?utf-8?B?T2xIOVcwZlhMQWhMVkgvVjBsSUYrajlEUVBxZlYwNE9yOVpSdE5yVlRqRkhI?=
 =?utf-8?B?MzRNd05tTUdJK2VGSzBCSVNKY2FMS0NwMG1NcUR6UlNldGVpUWw0ZE1JYlBD?=
 =?utf-8?B?SFZ1ZVVGbVBPMXlzSllXUXBvaUFkcS95blB1SkF2VU9KVHQzM2dFQlI0Skpy?=
 =?utf-8?B?bncwN24xMVl4MjBPeXFacHRLTmdPWk1LRFIybDZZL2t5YkExTDhIc2kxN2J0?=
 =?utf-8?B?allyU3pybGtiVWxETWFsNzBqTkx4T1FFaUFETjE0eEJQemV2WmxqOXV3dFZk?=
 =?utf-8?B?ekw0S1JuRkk4Y2FxL1ZsRG9iMElBSTFmaFF3L1poRHE5c29zRXVJS3ZoT0pt?=
 =?utf-8?B?SU9XN0dMUTczWjR5T0R3Ynd1UUhRcEtTZ0hSc1FhOFdiWVZHRUk3akRLQk9I?=
 =?utf-8?B?aENoVTdmOWcwNzdUOVZyYWt5bm9qWm9td0ptMmlFNEV6MTc1MFFXdUh2VnJU?=
 =?utf-8?B?NFp4bEp4Mmd1dmFGdHh0WC9QK1RpM1F0YVJIRno2L3RCUzBDYXhWQ0JBeG5y?=
 =?utf-8?B?MmRVSDRvZ2N2cldPSnk3bEwxQzUrZHFCY21HQUhQTnYwMGJnNVBBQ1JQQURT?=
 =?utf-8?B?am9KWUtwcEFxQTN6bU4yUG1qdWFuamtPa0ZCRUVsa2pKa3pVam5NU1B6d2Nn?=
 =?utf-8?B?eHVncEpCVVBaNzc1SFRSMlpkendoVURrTGFjTmFKQU5Zb09iUEtIdVdvVm1u?=
 =?utf-8?B?QysvKzIyUUNUYnBkNDg0ejdERnpXQ2NMSHFJRmkrMXpFU0xZVUFZOUdyVFBw?=
 =?utf-8?B?enNGZk5oYVQ5YWFDb2l1YlE2SkJnMmdlSWh6R1BsYjExck9qUnNFR004Q1JK?=
 =?utf-8?B?ckcvMDJNeFZkVmRzSkFsUUcyNEFHcXZ0a3JoS0g0N2xNUU1ZSkppZXFWN1JK?=
 =?utf-8?B?dm1GQ1p6Y0N0aXcyQTBRRXlzL0lrV0xySlJEZDNNWTJOWGFJWWs5YUlDVmcv?=
 =?utf-8?B?UVhhcmVLU055aUVGeGRGSVovZHVYa0J5UVRZcFFCbkRDeExRZUVJTW5XSTdL?=
 =?utf-8?B?d1ZSaHpaeVZrYzZxMWNnNzdDait1RmtFemdpL05rK3JpYWgxWWkzcE1lbDE4?=
 =?utf-8?B?ZDlQYnBzSUxyZ2F3c0pqRWhKdkx4TDVyTEhmRWdHa2ZvL0E5d00yenVHL1RO?=
 =?utf-8?B?Mmg5dnljVDBraWhDTVRYbUt4VlE3c3Rlcld2N3hnazljcXhDVHBCRGJ2eFNh?=
 =?utf-8?B?Y0tpUjFtcjBSejNxbkJuV1RnbDZsODZHS1VrMkxvR2lTZ0lXUGorUGZsL0ZO?=
 =?utf-8?B?ZmdCckFrYWZkbHhDSDh1UWNodDBEVFVKNEZhOGFDQ25ORHVqblJhb0ptMW41?=
 =?utf-8?B?Ni9BY1lKYXBIV3Q1Um9CNGxJeXl2KzQ3b3VzdXZDUTJqd2pReklab3I1Y3V0?=
 =?utf-8?B?K2ZSY1RqMXRhTjlheGhXc1VRZ2NZenlsNHd4aFNNb3BiNzZObzRtWUpTeU5V?=
 =?utf-8?B?TFdJWVlZeU95MTR0WkpPL3JKSVdiQXhnNzVQOWF2aTN6Mko2R1FnNnBxOWdv?=
 =?utf-8?B?RFlrL3NVdEFvUW1jTjNzMklYbmptcW8vbWdnNHpLek5JdUhqUTlSWTE3WElo?=
 =?utf-8?Q?TOCTz6szRQcTYQIjC9oHO5aZH0ffZtCO?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWJORmNlb0FZb3VwcTZkeVZXK2x4c2kyMFpSNW9JeXdPbFZCQy9iMGlQTFBa?=
 =?utf-8?B?T3FmNDdzMFh2cDJOUEl1eTN0V1ROQ2hoWFRNZDg0OTFoZjBsMFBhYXZBRVBu?=
 =?utf-8?B?N242TTRCUkVNRnhXT0VaQ2p0V0dBU0g3QXQ2Y01TcWsvelBBa2NrNDZkcGtP?=
 =?utf-8?B?L1BVeHZEa0lqTkJxZ2paMDQ3c01IOXpndUFaVU92Qk5velNYbGhsUEhoYTNB?=
 =?utf-8?B?SVMweWo2anpSa2l6LzVOQ0RVUklYYzN4dG1TUVo3enI5KzQvQzAxODE0K01U?=
 =?utf-8?B?RWd4UU1pTUM3dFNjNjducCtoei9YM21NbFBNbUhVb0dOM0p4ZTVPSnNyOTBG?=
 =?utf-8?B?TTVya3ZidlFKeGFibi9iNVR0VXJNT2RHUldlMlI3UWk1dFF2SnVVRnZ6REJ2?=
 =?utf-8?B?NFdJTU5hWUYyL3owVzN3b3lFUmZPMzRQU211SGQrdFVzbjJhQktZaThRNXJh?=
 =?utf-8?B?K3k0M1Q2WmIrV2hNWkJtM2taSFNkdjZBZ3czQ2E1cHlDNlgwcDVyRUxuOFFw?=
 =?utf-8?B?UzQvKytYSmVwOGUvUnQwb2hvT0FTVCtjMVpnR0FKZkRYMlJ6WlpOc21rOWFv?=
 =?utf-8?B?Nk1zSTVoTHFyRk5GYTJlNE9OTjZoNWxGMDFUY3g3SzhIS0xNTFUrd0dLcFVE?=
 =?utf-8?B?TlR5clgrcCs0RmhZRnVjOW1OTUJMNno2VkxIWVBkbXZPb1J4aEtCeU5lWXhW?=
 =?utf-8?B?NmxLYmV4L25Kc01PVC8vMmUyRWpEc3h6SmdXVEFGRTk2ejBDMi9va0YrUkg0?=
 =?utf-8?B?R2lnRXlYQXBCMk04OVhidzJXNndRc3EwQldaWGtmOUk3WlRhOE1QR0Yvb0Ja?=
 =?utf-8?B?eXM2TlNTQU5aMW55OVVTbnFqNElodGVueUJGVXRCVmhUY2RMSlVEcTlLekNy?=
 =?utf-8?B?emFxVFNqUEpkSkpRWklDR0dLMUc0L3E1dWJEcU9CblFQWWJVSDJPZy82bUJa?=
 =?utf-8?B?UFRsbG9vd2FvMjU0Z3lUbUhQeUFINjYxbHFzSys3NE9MVDNmWDRkaDZjeXVY?=
 =?utf-8?B?VlVveUg5TTVlQ042ZjdZN0Fyb2FoMmljWHhzbUI5N081WURJbE9Kd1VwV1h4?=
 =?utf-8?B?d05Wd2xJVTdzODRrWFlaQnV5REJFenhad0RBQlgvb3lCM3p0Z2lHb1lqRDFS?=
 =?utf-8?B?dkxacC94UGVYbUhuMmJSQmVEY0JVcFRtcGp1dDJOVjRqNFJnaUlNUkNaN0lm?=
 =?utf-8?B?UlBBVll6WkZaNzk4MU1NWnM0OVhXQVJxNVNHZWJ2WXdSY2VsY1dYNjZOY2dG?=
 =?utf-8?B?MGNlcVlyVFZkUlZ6SnJSMldSYTcyV3dYTUltN25IQzhJZDlUeHIzaTczU2hK?=
 =?utf-8?B?YzVRZ25GcWdPcE5JSkt0RlM0WEhlTTZ0UTl1SXlSU0RHYm9SQVFSOStSaEJG?=
 =?utf-8?B?WXRCZVZIUldHQmZnMXVXZStTRFZsUUcxUm9JcFlCOGk3aGwraFhEOU5PTjgw?=
 =?utf-8?B?MndraXJNaHlkU2FpRUxOYTd1b2o1M0IrbTExMDBnMjVzWXhuZE1UWGtINlJJ?=
 =?utf-8?B?L1lZemlBNkVpY0tRd3BYQVdkQm9zekEyc290ZzBxNjVnSXQ2NjJFbk84YU8y?=
 =?utf-8?B?ZCt4dXQ3ckJ1Tkx2VERpUFJPdHRmelNWMGg3dkNGd0NHMkMwaVFKQnJ1Znp2?=
 =?utf-8?B?aHhndkE0dHpsaGFUaU9oM1RjTEpDVzBBL1pNV3U3cGlJUWVobTMyU1RBZUx5?=
 =?utf-8?B?bmtWN3d1eXB4ZkVESndoazk3UnRBMEtjNDNJYkJDWDd1K25hWTdESGVCMFhn?=
 =?utf-8?B?YWxVUXJnU09GQVFSeHFnMjdVb2tNTDJmTnlvVlFpdG5hY29NOHgyWHhuS2g4?=
 =?utf-8?B?QkxvL0VuUTBQQjNDV0FuOVRqYjVKOEtFaVB5blBiVmxEQ2RqRHQvMU5IaVlY?=
 =?utf-8?B?VUZmNFVhM2pTWi9sUWNNSW43b3FpYXNSc1lrM3JyM2hONVFhVk45M29TSWtw?=
 =?utf-8?B?UTI0bEFhY2RBL3JxYysxR3lxNHpZSDB3NTFLMy9vTFpRcTkyR1k2R1RaUTdU?=
 =?utf-8?B?dXRYcFBsdGFrSmErRmFOazdWUUpRU0xsZ0Z2cFpBajRjOHZFMXZURDlTOG41?=
 =?utf-8?B?R05TRXJ5ZzkyQVBCTHJvZW43TkRRM2swMEtVQ2pScUtjV1lueXJsdDgxM3dO?=
 =?utf-8?Q?bumUSRNpgzGAN6ZFoLTUvJToP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F275B5F928E96A429D9D03F4B23BA72E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff938da-e050-4673-344e-08dd39478c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 11:42:41.7186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8/vG/UgcB5tUCCViJ4kBeV9SSMKR/5LnF3Qaj+QXfIVzKuji3ARmY6LsDAkbwAHWE4D2Qm8JAC64KJZQvDfow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 11:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210025

SSByZXRyYWN0IHRoaXMsIHRoZSBwcm9ibGVtIGhhcyBub3cgYmVlbiBmaXhlZCB1cHN0cmVhbSBh
bmQgdGhlcmUgaXMgc29tZSB2YWx1ZSBvbiBidWlsZGluZyB0aGUgdGVzdHMgZXZlbiBpZiB3ZSBk
b27igJl0IHJ1biB0aGVtLiAgSSBzaGFsbCBiYWNrcG9ydCB0aGUgZml4IGluc3RlYWQuDQoNClJv
c3M=

