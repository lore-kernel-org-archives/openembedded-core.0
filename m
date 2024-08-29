Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA376C8303B
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 10:55:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.52])
 by mx.groups.io with SMTP id smtpd.web11.9849.1724928906578092487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 03:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=Dmt/hBs5;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.20.52, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQAosMi3cYEI0lBEDoZhar62Y06GWKqJIw4LjIDMBr1MRRnNr/kXMANxN05gUA3eBzA2a3CpGVimU6WROD17Ww3gpTtUjPDqP56JDZFa1/scIP5PD5YJdO9SFI+S+Lgwpi3brhdRCetKRdMVUzNHuErG5zJcHRuNqwBIoz/1uhgXpE7SHbL7ArnFOdfoccF7FgpLXCs44JL0XTWCaLvc/CT3euzbPVSHaWYaVSg2udeydtwF/JCqhfdAgursG5mT18vBXSmzvs4mh3ApHufgklsiGFCwdF2aOaan3fLk4zAPolSeP7sdTIhwrHB7suyWvhSifWTCR2ro4kMrHueG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmyoLB3WV+hHqiCJwrn7Qo24i8JDMmanMIDrcM4kmN8=;
 b=UdphfmNGR5Jc/2jJwXhkQo1jdn5fBPdT+MclSlR6nzNuGuYa0/TwTJDHrBVnYL/zFBLOdmWN+bCXxzSdOahenNE7JJJYCJdVRRSFTQKcZt+k8WPLk6BQNlT+O/84IW9OnthBukLCqNlEWHZ2lR4xqWo9M6SDfOphtRd/FO29kxaCWSJjkFHiAhL3OrMOg0qlS8dczZcC+6NLR+ktwGLhEH8XPhC9gr9gAqix+RGpi8guxXW8iVyMYCTQEq7FVEEsuzcELqkn0PEuOcDndO9l67+fZEHwFl4FcDn6sKrFn250sVyaSpZ8CY7ZiW065IeEi3vKafFz9+0JgQ//auzcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmyoLB3WV+hHqiCJwrn7Qo24i8JDMmanMIDrcM4kmN8=;
 b=Dmt/hBs5VCRe6JEc5eDj0dWWZMGeyRpl+CdLDwb760XnLTgHeqvV0rpARz9XspmoLI2DnlULCPC04ydQJOI9tyo13M3Q8LbKHVezMbuRE8Asy/iCTH7UUqRQFKYelz8QbjHThQFNlKBZS0tjW7VoPcPymWimbxzbDQJ0BsJMxUmmDkJiP3XvTZ4iLIaRfC+ImVTfZu/Byk4mLLa2A3fdXGfgkE6wgmW4MKoMpuGQAjvb2lzeLqgvdtLQ+zt8rBGc8N+2vSawBZ0JZdu072UCauLLyLpZbRvPXnJo9WESbhG8gdOYoZzG1L+D8+fpDtoovYmOGos0EFwahEuwjnZ0uQ==
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by GV1P193MB2136.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:2a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 10:55:02 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 10:55:02 +0000
From: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Index: 
 AQHa6ACN8leefanhmE6uJqea3DXRkrIb9HuAgAANigCACN0PgIAARCWAgBYDyqCAAB7JAIAC7ZlQ
Date: Thu, 29 Aug 2024 10:55:02 +0000
Message-ID: 
 <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
 <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
	 <864.1723536321789931548@lists.openembedded.org>
	 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
	 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
 <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
In-Reply-To: 
 <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P193MB0900:EE_|GV1P193MB2136:EE_
x-ms-office365-filtering-correlation-id: 00add819-1e1a-4505-e046-08dcc81908aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RzZTZnBGcEJmY1B6NW9OMUNUay9rckl0Qy91UVZJZmVxOXZvaFRhNFkwd0Jh?=
 =?utf-8?B?VlZ5d3dIdysrVkx2V2NtcElmRXFoZllPVDJDcmVHRVBjclJLWFl0b3BvZHJ2?=
 =?utf-8?B?YVc0WW5MMDRMTGEwS0RqTjFTSHJ4OC9jS2t1RDY1aFgveDRoSTZVeVUyNVUx?=
 =?utf-8?B?WVo2RFJzbUVwRlVPUEV4N0FSR2NTcFFkRmpVRjVobUlVVllncjgxaUpGRjNF?=
 =?utf-8?B?eWtaZmFsa0lHQ2tiQWNkTnJuNXB6b3FJTEFzSzk0ZUMwdm8rUFA3MWp2aUNF?=
 =?utf-8?B?YWNWeU5ubThQSjVrT1ZocDhYWnhtTTA5UmxFemZTQmRkZDc0aXdBYm80SlJ4?=
 =?utf-8?B?SGQvaWpiVDBYeHplVUNYcFMxellZMXppQWMxQk5oRmhiaEhUYzIyV1hVNHhN?=
 =?utf-8?B?djUzbE9UeVBBeW05djJWNFErWVUybkRMS2U2U2hsSDlyVUxmS2drZittUm5x?=
 =?utf-8?B?a1Q0UGw4d25sWmdTc1FGM1NZcHhLYWFnUHdXMitQcy9MUm9FNnZTaXJFUi81?=
 =?utf-8?B?VnhCLy9ndXNQOWJYcUltM1VYRjlWek5hdklqUEtRbVFhMlRRRVJDM1Y0dlFv?=
 =?utf-8?B?aFBlb2JHSlAya29Cd2V6dVFwMVpjQ3BBbmIzSXpENlJEVmkzM2hsaVAwYWdv?=
 =?utf-8?B?RjRnaHFPcU9aVXlMVzlJL1gyMXo5eVVNVUIzYlBPclFyQUUxREtMeWNMU0o2?=
 =?utf-8?B?UHJKV2JwV21GZjU0UGRyNkVGWjR6RWc4RFJ3bkZSLzVqOGpBL2xBZVhBeldM?=
 =?utf-8?B?ZE1valB4ZldmNkdkVWdlTUJVT0NPeHZwSjVQZDBiVmRwbXZ5RGw1MTg2U2dk?=
 =?utf-8?B?ZXkvVUY5MEc0SkxrRG1OTVFGZmVJVVAxTG53UVpRMy9lamZBdWcxMHVmYjBO?=
 =?utf-8?B?aHdCOFU4cU40K1BLS1dDSlpRQWZld1Ztdk1vaGgwbEFZTnIwMkhtQVNKbmNZ?=
 =?utf-8?B?aU5JdFUwUERUZE0ySmVaYXBBMXVoamdaakttV2J1ZHNEcnNWeVBrWlpyajlB?=
 =?utf-8?B?ZHM3Qm1CaG01c3RXenFlcDZzR0VSQVYvbXVHOWdETjBZSHdWd0g5bFp1Mk1h?=
 =?utf-8?B?OXlETjdtU2RXcXFMbnUrN0NjSXhMdkFiZmd0K0FGc0xzRngxNHVpU3owajhG?=
 =?utf-8?B?SnFCNGtIMU9tVHQ2OEpsbkJsR3VhTi9hdFpObTgvZzU4VWFsZ1lKUHhyWmIr?=
 =?utf-8?B?WlROaWJKRlliWGtSWWxaUGh5c08xdDhDeGlnWHhJMXJWem1NWlhQRVVRZzFZ?=
 =?utf-8?B?K3lnZnp1VXFWTFRHbkRTUWxqT2RUd3oyTVlBMEt0YW1Lb29wQkx0WGNTWGhL?=
 =?utf-8?B?RnBnRnRDcEhzcjVHaFZjSm1tWFVBeVRUVlljWlMwVEJySUdUMjVybUNLdDB1?=
 =?utf-8?B?cUdtaDJiWXRkeFEvTlUyRFVzUGtjbk1HbGRObzREWnZUSjB0ZmFvMlFRdENM?=
 =?utf-8?B?UHg0VGEwcUR2bVFXeVArMTVLR1hzWCtLYURITVY4dmcyRjM0eEZ4Zk9ucjdt?=
 =?utf-8?B?YUljeHRrNVJtWkozVnVCclhDSnMvQ09LVWwySU1LVW9EWXBkSE8rdEtOOGdk?=
 =?utf-8?B?S2Rxcld4SWJtaXdrU0c0d2RYNGJIVzZLWVl0ZStpcXcwSzVLSmgrcHkwNGhC?=
 =?utf-8?B?Z3ZMY1Q3dnVCUVExNHdTc2hySmpZU0cwWk9jM1ZDSU15aFVGV25NOEh5SkRt?=
 =?utf-8?B?bmk0M2dMNlhYbEFLUVMwMy9PZXFVZDFlejRlb2dBSkEwMTFwUWFpQzFkMFU0?=
 =?utf-8?B?dStYK25XelVmM0dkeHZ1MGJHK2FlYU8xTDE3ZXQ1Mmx1enBaTG9sWXAwSjV4?=
 =?utf-8?B?bE5WN3JGY3AxNDZwRENWczJnZnFSN2V1dTZKODB0N2FqTkcyWERMejJZUlNo?=
 =?utf-8?B?eWIwanZ3Y1VFdUZwdmRyZTZKOXBROGFxcTdrSC8zTERNdEE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFF4cmI1L3ZzMCs0TXpvMlNTb2kyK2ZjYXpLU0QvMmo5MWVqSm5pMnJPa2lD?=
 =?utf-8?B?Ri9WZk8rNGNFNXh5NGF5eVNhSTlVQnFlQXpweXZPUEdiWm1Wand5c01IcFlo?=
 =?utf-8?B?MERqK0VjbDZ5L1VEYmNmVnJrcE1MS0dGbUhIc0wwSTJyYitaeFJQY0FtZUJF?=
 =?utf-8?B?TW45dVFoWDgxcHdzOHZFaElVY0VTKzhjR0pWc0RVSlJVZ2N3dG4vRElEb1ND?=
 =?utf-8?B?TDVnRHJsd3QyMXF5cVpmblZUZnRraW8vNi9pOHBaUGZSYXR0MGV4WEdkOHJv?=
 =?utf-8?B?ZFlIYU0yTmZQL055ZFBKb3B5OUN2aWJVcnFJWlFtZ2xrdERxTzZCcVY4VEUv?=
 =?utf-8?B?MnpXYWIzMFluY0VsaFE5UUZINFhOYVNxeGpIRnRrNzFwQk5MUmFSLzhQSDJ0?=
 =?utf-8?B?VGhWWXFwUzNZVWxkb1A3UWppREJtV0pyVjBkU05LZjl1d0pCQXJ3VGVZRHFU?=
 =?utf-8?B?d296K3NvSVBONWJRNjlycHdPNkgzd1RTRVVTcWQ5RGExcktQbzdueThWN21P?=
 =?utf-8?B?NGlTYW9JdElWSnA4ck5BMFFBRFV4ZlpuZHdqT3ZRY3RrTk5ucU9WSE5OY0RH?=
 =?utf-8?B?NUR6WTZtT3pzRUJNREdmZ01zQW9waWZZMGtIM0paNXgyM0RqRUlQemJxTnkz?=
 =?utf-8?B?ZVJIVStQQm5UOXlDbUp6Y0QwUlZDeEI1bGtOMk1VTkFDWVdPWDNYeTl1eEY5?=
 =?utf-8?B?ZnE1VFJhaE5ibWFONDdPdEQ4bUw5b0JkMXdCZERPSU1aUU9CNGJNR2tvT1NE?=
 =?utf-8?B?cytZZ2VPTUpMNzRuNzl3NGMvZjN2TFJqQU5NL1NvRm5Fb2w4TXdmZ0dHMXk3?=
 =?utf-8?B?Q3B1V1BHcEVlSThPQ3dKeDNTNTIxOUw1MjZmUnJ2eUFyTnJFWHM2a3AwcUxa?=
 =?utf-8?B?YVU2OVRRNWtXeE5mUk5DOEJXM08vamxBbmsvT2FrL05IajdjMzJMZWdEK0Fo?=
 =?utf-8?B?NXIwVkJGRzYyWVgwdlpTT3VtTmNMbVp6MzRlR0pNL3RDMlNCWFY1OERkR0dD?=
 =?utf-8?B?VmxDMzJlcVZEMnJjdGdGK0hvdmdCTFNpdFh5bDlHNVlXWDNieXZrenlWanBt?=
 =?utf-8?B?SVhjcXlpL2dQbkpZM3dlL2g3U0JQazV0K1paaTZ0bWNZWDlIQWhZa25PMVNL?=
 =?utf-8?B?S2VLWW9YZWd5MDRJRm9GUEhPOHJuREJNTTQyR1ZmdmNuQ0NyT1RUWkgyZEJX?=
 =?utf-8?B?YUNvWHFnSWs5bmZtZi9pQ2lBZm0wZi9rTUdZeDRsMEczR2oyN1c0eFRkVHJn?=
 =?utf-8?B?VkFJQ2h2K20wRzNoWTEvQkRxOGh6VlMreTY5RE5mamUyclUrTGRzOFMxSW9K?=
 =?utf-8?B?d3NNQWpBK2tKSlBLNjBaN05LSDJrelE5SC9BRlhjQkV3a1BMMStWZUZRbVd1?=
 =?utf-8?B?TzJGdnlMcHl2YjVjYnUrbFJ1bkVFczFENnVPSXVwMVdtbEM4NjJoMGNQendn?=
 =?utf-8?B?dXZCcE9QaGVib3NPRFYyZDRreEk1VXRCSkRtZ2l4TWtjanVNLzBiZTVkTTNv?=
 =?utf-8?B?S0VjL2xqZ2I5eElxZG1oKzlrTDdyeUZJZ254Vi9FcUI3LzlOVFVoSllKM0FS?=
 =?utf-8?B?V09vZis4bi9FWk9ra3RPc2pBM3FXQjBCMkZMWE1Iak1Oa0YvbzhaVUkyRGt3?=
 =?utf-8?B?QTlFSHRqWmR1WVFFQzdkZ0dLR0lGajkwZXNwMzBHU2Ztd1g2anBwRkhPdFdq?=
 =?utf-8?B?TnVyYmlkcGhKUmtkZmZPK1o2WkNsOHFsMlJtUEVNZEwrd1hGSW1TczhkYnpL?=
 =?utf-8?B?UWtRMW5Pc1kxbkpxb0sweG1iL1JNYUt2WWQ2LzQ4aVNCU0JxUkN2TzZqTGJC?=
 =?utf-8?B?aDJNK1pUb0gycHRFNGt1Q0NmR2VBdnZLOHVZV2hWL1dRT25qZ1VDZkZtMmZ4?=
 =?utf-8?B?N0puU1VEK1ZoRU1ENHZJdFh4Z3NxeGxvMTR6SHFIczVuWVFWUDMvcXNSYy9Y?=
 =?utf-8?B?aW10cFVnNzVjaDBYMHJZbFFjSTNRa3VHTnBLMTE4MEpQWllIUThzaHVuYlV4?=
 =?utf-8?B?TUk0aXcwNlo2d2FGNzVpQlJqcVNzWmN6SmdSWW81VCtnM2UvWEl0RWlKS1dh?=
 =?utf-8?B?TjhRZjZhRWZHN2h4Q0pMSTNCTG1XUTBIbGFIU29Lbi82cTJSdlY5VWVFdFN1?=
 =?utf-8?B?Y1hPZmFTMzM3Q3M4bE9WdWVUNEV4WEdudTU2WnFVd2hEZkh4OU5CdU93c2xR?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00add819-1e1a-4505-e046-08dcc81908aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 10:55:02.4656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LTgm+zxlDe4s199A3hJxAy3VLW7IeFldpO9Xj35Mp629AtRxOdiu2mAD9BxHHd7Q7JeGFGQEsFKb1bIe63H59bHvdBd093R/j2gKRrwtJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 10:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203911

SGkgUmljaGFyZCwNCg0KSSB0cmllZCB0byBwaWNrdXAgeW91ciBwYXRjaCBhbmQgbWFrZSBpdCBm
aXQgYnV0IHVuc3VjY2Vzc2Z1bC4gV291bGQgdGhpcyBiZSBhbiBhbHRlcm5hdGl2ZSBvbmx5IGZv
ciBMVFMgYnJhbmNoZXM/DQoNClRoYW5rcywNCg0KUGVkcm8NCg0KRnJvbSAzYWI0OGRhN2E5NGI4
MGJiNjdlYmVmNWEwNmQ5MmFjZTEzNGUwYmJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJv
bTogUGVkcm8gRmVycmVpcmEgPHBlZHJvLnNpbHZhLmZlcnJlaXJhQGNyaXRpY2FsdGVjaHdvcmtz
LmNvbT4NCkRhdGU6IFRodSwgMjkgQXVnIDIwMjQgMTE6Mzc6MTkgKzAxMDANClN1YmplY3Q6IFtQ
QVRDSF0gc3N0YXRlOiBtYWtpbmcgc3N0YXRlX2luc3RhbGwgcnVuIGFmdGVyIHBsYWluZGlycyBj
cmVhdGlvbg0KDQpCYXNlZCBvbiBvZS1jb3JlIHJldjo2MmVlMzQ5Y2YxODUzMmRhYzg3MzY0ODg3
NTJjMDBlODlkZTc4ZmNkDQoNClBsYWluZGlycyBhcmUgaGFuZGxlZCBhZnRlciBTU1RBVEVQT1NU
SU5TVEZVTkNTDQooYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSkgYW5kIGNhdXNlcyBidWls
ZGhpc3RvcnkNCmNsYXNzIGZhaWwgZHVlIHRvIG1pc3NpbmcgZGlycy4NCg0Kc3N0YXRlX2luc3Rh
bGwgY2FsbCBtb3ZlZCBhZnRlciBwbGFpbmRpcnMgY3JlYXRpb24gbG9vcC4NCg0KU2lnbmVkLW9m
Zi1ieTogUGVkcm8gRmVycmVpcmEgPFBlZHJvLlNpbHZhLkZlcnJlaXJhQGNyaXRpY2FsdGVjaHdv
cmtzLmNvbT4NCi0tLQ0KIG1ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcyB8IDIgKy0NCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L21ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFz
cw0KaW5kZXggZGQ2Y2YxMjkyMC4uZWQ2YmY1OWU0MiAxMDA2NDQNCi0tLSBhL21ldGEvY2xhc3Nl
cy9zc3RhdGUuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzDQpAQCAt
NDE1LDcgKzQxNSw2IEBAIGRlZiBzc3RhdGVfaW5zdGFsbHBrZ2RpcihzcywgZCk6DQogICAgIGZv
ciBzdGF0ZSBpbiBzc1snZGlycyddOg0KICAgICAgICAgcHJlcGRpcihzdGF0ZVsxXSkNCiAgICAg
ICAgIGJiLnV0aWxzLnJlbmFtZShzc3RhdGVpbnN0ICsgc3RhdGVbMF0sIHN0YXRlWzFdKQ0KLSAg
ICBzc3RhdGVfaW5zdGFsbChzcywgZCkNCg0KICAgICBmb3IgcGxhaW4gaW4gc3NbJ3BsYWluZGly
cyddOg0KICAgICAgICAgd29ya2RpciA9IGQuZ2V0VmFyKCdXT1JLRElSJykNCkBAIC00MjcsNiAr
NDI2LDcgQEAgZGVmIHNzdGF0ZV9pbnN0YWxscGtnZGlyKHNzLCBkKToNCiAgICAgICAgIGJiLnV0
aWxzLm1rZGlyaGllcihzcmMpDQogICAgICAgICBwcmVwZGlyKGRlc3QpDQogICAgICAgICBiYi51
dGlscy5yZW5hbWUoc3JjLCBkZXN0KQ0KKyAgICBzc3RhdGVfaW5zdGFsbChzcywgZCkNCg0KICAg
ICByZXR1cm4gVHJ1ZQ0KDQotLQ0KMi4zNC4xDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMjQgMzoxMSBQTQ0KVG86IFBlZHJv
IFNpbHZhIEZlcnJlaXJhIDxQZWRyby5TaWx2YS5GZXJyZWlyYUBjcml0aWNhbHRlY2h3b3Jrcy5j
b20+OyBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCB2MiAxLzJdIGJ1aWxkaGlzdG9yeTogZml4IHBhY2thZ2Ugb3V0cHV0IGZvbGRlciBjcmVhdGlv
bg0KDQpOb3RpY2U6IFRoaXMgZS1tYWlsIGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gZXh0ZXJuYWwg
ZW1haWwgc2VydmljZSwgc28gZG8gbm90IGNsaWNrIG9uIGFueSBsaW5rcywgbm9yIG9wZW4gYW55
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB3aG8gdGhlIHNlbmRlciBpcyBhbmQgYXJlIHN1
cmUgdGhlIGNvbnRlbnQgaXMgc2VjdXJlLg0KDQoNCg0KT24gVHVlLCAyMDI0LTA4LTI3IGF0IDEy
OjUwICswMDAwLCBQZWRybyBTaWx2YSBGZXJyZWlyYSB3cm90ZToNCj4gSGkgU3RldmUgYW5kIFJp
Y2hhcmQsDQo+DQo+IEkgdHJpZWQgdG8gYmFja3BvcnQgbG9jYWxseSBwYXRjaGVzIFs0XSBhbmQg
WzVdIHRvIGtpcmtzdG9uZSBhbmQNCj4gc2NhcnRoZ2FwIGJ1dCBpIHJhbiBpbnRvIHNvbWUgaXNz
dWVzIHJlbGF0ZWQgdG8gc3N0YXRlLmJiY2xhc3MuIEFmdGVyDQo+IHNvbWUgaW52ZXN0aWdhdGlv
biBpIHNhdyB0aGF0IGkgd2FzIG1pc3NpbmcgYSBwYXRjaCBkb25lIGJ5IFJpY2hhcmQNCj4gWzNd
IGluIHRoZSBjb250ZXh0IG9mIHRoaXMgYnVpbGRoaXN0b3J5IGNoYW5nZSBidXQgYWZ0ZXIgYXBw
bHlpbmcgdGhlDQo+IHBhdGNoIFszXSwgZHVlIHRvIHRoZSBgaW50ZXJjZXB0ZnVuY3NgIGxvZ2lj
IGkgcmFuIGludG8gYW4gdW5kZWZpbmVkDQo+IHZhcmlhYmxlIChTU1RBVEVfSU5TVERJUikgd2hp
bGUgZXhlY3V0aW5nIGBiYi51dGlscy5yZW5hbWVgIGhlbHBlcg0KPiBmdW5jdGlvbi4gQXBwbHlp
bmcgcGF0Y2ggWzFdIGFuZCBbMl0gaW4gY29tYmluYXRpb24gd2l0aCBbM10gLCBbNF0gYW5kDQo+
IFs1XSBzZWVtcyB0byBkbyB0aGUgam9iIGJ1dCBpbSBub3QgcmVhbGx5IHN1cmUgaWYgcGF0Y2gg
WzFdIGFuZCBbMl0NCj4gY2FuIGJlIGJhY2twb3J0ZWQgdG8gbHRzIGJyYW5jaGVzIHNpbmNlIHRo
ZXkgcmVtb3ZlIHNvbWUNCj4gZmVhdHVyZXMvY2xhc3MgdGhhdCBtaWdodCBiZSB1c2VkIGJ5IG90
aGVyIGNvbXBvbmVudHMgdGhhdCBJIGFtIG5vdA0KPiBhd2FyZSBvZi4gSSB0ZXN0ZWQgdGhpcyB3
aXRoIG5jdXJzZXMgcmVjaXBlIGFuZCB3aXRoIGNvcmUtaW1hZ2UtDQo+IG1pbmltYWwuDQo+DQo+
IDE6IHNpdGVjb25maWc6IERyb3Agc2l0ZWNvbmZpZyBjbGFzcy9jb2RlL3N1cHBvcnQNCj4gZjM3
NjZkYzAzOGY3YmE5NzgwZGRhZjVlYjhkMjczODVlYTMxZDdkMA0KPiAyOiBzc3RhdGU6IERyb3Ag
aW50ZXJjZXB0IGZ1bmN0aW9ucyBzdXBwb3J0DQo+IGNmYmZkMGIyZTg5ZWI3MTc4M2M1NWExYmU0
YTdlNjNlNmNkODJjMmYNCg0KV2UgZGVmaW5pdGVseSBjYW4ndCBiYWNrcG9ydCB0aG9zZS4NCg0K
PiAzOiBzc3RhdGUvYnVpbGRoaXN0b3J5OiBGaXggcGxhaW5kaXJzIGhhbmRsaW5nIHRvIG9jY3Vy
IGJlZm9yZQ0KPiBTU1RBVEVQT1NUSU5TVEZVTkNTIDYyZWUzNDljZjE4NTMyZGFjODczNjQ4ODc1
MmMwMGU4OWRlNzhmY2QNCg0KV2UnZCBwcm9iYWJseSBuZWVkIHRvIGZpbmQgYSB3YXkgdG8gbWFr
ZSB0aGF0IGNoYW5nZSBhbmQgY29udGludWUgdG8gd29yayB3aXRoIHRoZSBpbnRlcmNlcHQgZnVu
Y3Rpb25zIDovLg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNClRoZSBpbmZvcm1hdGlvbiBpbiB0aGlz
IGNvbW11bmljYXRpb24gbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIGxlZ2FsbHkgcHJpdmls
ZWdlZCBpbmZvcm1hdGlvbi4gSXQgaXMgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRo
ZSBpbmRpdmlkdWFsIG9yIGVudGl0eSBpdCBhZGRyZXNzZXMgYW5kIG90aGVycyBhdXRob3JpemVk
IHRvIHJlY2VpdmUgaXQuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwgeW91
IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJp
YnV0aW9uIG9yIGFjdGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBpbmZv
cm1hdGlvbiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwuIElmIHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgY29tbXVuaWNhdGlvbiBieSBlcnJvciwgcGxlYXNlIG5vdGlm
eSB1cyBpbW1lZGlhdGVseSBieSByZXNwb25kaW5nIHRvIHRoaXMgZS1tYWlsIGFuZCB0aGVuIGRl
bGV0ZSBpdCBmcm9tIHlvdXIgc3lzdGVtLiBDcml0aWNhbCBUZWNoV29ya3MgaXMgbm90IGxpYWJs
ZSBmb3IgdGhlIHByb3BlciBhbmQgY29tcGxldGUgdHJhbnNtaXNzaW9uIG9mIHRoZSBpbmZvcm1h
dGlvbiBpbiB0aGlzIGNvbW11bmljYXRpb24gbm9yIGZvciBhbnkgZGVsYXkgaW4gaXRzIHJlY2Vp
cHQNCg0KVGhpcyBlLW1haWwgaXMgZW52aXJvbm1lbnRhbGx5IGZyaWVuZGx5LCBqdXN0IGxpa2Ug
Q3JpdGljYWwgVGVjaFdvcmtzLCB3aGljaCBsaXZlcyBpbiBhIHBhcGVyLWZyZWUgYXRtb3NwaGVy
ZS4gVGhlcmVmb3JlLCBwbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmlu
dGluZyBpdCENCg==

