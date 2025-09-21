Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3E9CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:40:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.web11.27982.1758454833933686197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 04:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SaQAM9fH;
 spf=pass (domain: siemens.com, ip: 52.101.65.58, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDszw8vnoay7r4GkIthSRxUy1cCDGHrtqkOWNwFa8f0dS3JWYZzE00T3Hrcn7f3lg7KoeeFWPAv9iaX4i7BvcSdE7/J7ZmfKaaV258C7SJFY/gtVT8ycubkpVwpmM7zXaAVJTO2YFnTeRxg4GuZX96+e1X47V2PesCJeUjzB+/c2mqCu/K1e05uz7psUn18Qn6yvur4cz/JspDQqhCxRymDP8BWRMSZgTlgXBzp6zo1UreZiY7i77XguCjg3rsDjreJT3V1RpKgUJOgg/OSW5QhSC8b9gWB7VWXl/BrP2q9FS1f6QmSS4hpYmvleDwwhmIZ4GM8FCmoHTyVKUopgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHWl7qRdzdQlhP0X0o/cDS4IDFsh/mdMzK6FdHLMbZA=;
 b=tm7Qo2PjkS7eMMgjxVRHb0CwdBQJx2EpEgoDTyQAlzJhm4iN+m0Hdqh94KYfQQI0tK5XAqu2m6mlH/AF3MiECFCC46qJEl9vZSRH1ajiEtWB2gHQcOZ6wFwjScM/3gK5JY5k9Gst8pXtomvPzqmvwjbJ/0Avh77/dzj92fWcjThyFMUZ1ll4R3mEXEffZU3nYbaSaaR0fPY2vKULE0cqF3ov1ipVmJbZEYv9S1gDQXcUsfCqTi1GkeybeClUydGd++LIrH58kY796pspTZH1oZoDaDOcfIpA6Zjlpo0QVnXTdw1jJrj6+BP6JCIR2zAZvIiDgUllQsB8tOId6O58PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHWl7qRdzdQlhP0X0o/cDS4IDFsh/mdMzK6FdHLMbZA=;
 b=SaQAM9fHi5fBquEwuWyAhglEVKXzJFsSEkGImnjWUwGT6IAVFZtBZ6S+CciJKgNA/+ae9+BV2YKWvuAcsYpMEf4KhzPxCFVWlG1Nw56KBLT+7tKTucJZW6y9mxZegNbuVO0HgDPAuqaq7QSEcPTu2v0L7v1BNx8myRtFtJKt6H5mxUq7gqzC5SjlH57wYTPocz86rCeha5Uuk06U/W+Xq+yMrGIwAdq/PzvzqtPxeWKB6MjujJSeiqKK3kDJ6gtUD20bP1qYWwERQ22lKxc2zEZ4IfOFtOSSaqya1p13Kb+EZNp4sF9sii8FuzrQuGTamX8cSNFN3InkzoH7v3RK0w==
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21)
 by AM7PR10MB3953.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Sun, 21 Sep
 2025 11:40:30 +0000
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213]) by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213%3]) with mapi id 15.20.9137.012; Sun, 21 Sep 2025
 11:40:30 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "kavinaya@qti.qualcomm.com" <kavinaya@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] kernel-fitimage: add support for custom ITS
 file override
Thread-Topic: [OE-core] [PATCH 1/2] kernel-fitimage: add support for custom
 ITS file override
Thread-Index: AQHcKZddpT3u04Qs7U6XbOVo7IH8HLSdheCA
Date: Sun, 21 Sep 2025 11:40:30 +0000
Message-ID: <bbe0c5a1368b36754e800576d8f93d1ca406ab86.camel@siemens.com>
References: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com>
	 <20250919073335.2069114-2-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250919073335.2069114-2-kavinaya@qti.qualcomm.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3535:EE_|AM7PR10MB3953:EE_
x-ms-office365-filtering-correlation-id: 010988bc-b29d-4665-8c35-08ddf903aad0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VG5LSTY4TCt1ZzM1UTlYazlVY0IralBEa0ZrU1NxQ205Ry9BK2lUUmZJZ3lG?=
 =?utf-8?B?bzFTd21DcysxZ3BrTnFJZFA4ZzRVaHhFWUNMUmhJUVZRK0IyK0JRY1hqelBr?=
 =?utf-8?B?dktYWmFaYnB5Yzd4a01UODI0enRHWnYveTQxUTJqeHE4WHRRUk53S1hqTW5h?=
 =?utf-8?B?L0lXN3VYZ0dZOUlZSFpEK3FTU2YvemdmUFN5cGYzU3RNRHl5VkVOb1RsVVM4?=
 =?utf-8?B?THdnd0dyWnJZMjBXZm1NVEhEd2ZuL09XU3lqbzQ4YnhhZnp6K3UrQmJudko4?=
 =?utf-8?B?cm9QUmRzK1d2a1NFSnlZRkNhNUo0L0drNUI1NndCYUdIeFBMZlByUXlHQjFt?=
 =?utf-8?B?OVMweWZkM2pGcFFPZEZQOXd5c1lsaGRLdDh2UkxVb0VsQ3MzR1p3RXhiUzBh?=
 =?utf-8?B?NW5pbVJVUkNCVXE0ZkJ3bTVoRGx6c09XMnpYd1hGcm9TNkVXYnZTOEU5Nlps?=
 =?utf-8?B?S2h0dFRtNkNWS3BpWE9vdjBoZ0JqajYxTktaWlptNFdDVEJWaDIrTFd4MHNp?=
 =?utf-8?B?NHMwN285anJ6QWVwVFg3ZGRJVTdvQnNMN0Fqc2RuNk94RUwvSVZGTHEzNHBl?=
 =?utf-8?B?aEF6S3g4TFNvL0VORDJwTFc2WmIyazVuZWVvS0xpcGQrTkliS0E1b1BqSWRP?=
 =?utf-8?B?SlF3QXZRcHIzQ2ZjckNPaFoxK1VvZ3NIa1o2V1A4bUtDTnp5STNvUUExTlIx?=
 =?utf-8?B?Rm1hT0xieWh1K2VNSGFOOWU1VHBTeS8xbm9wa3NadzBreEZvRllKcjNuN1Rq?=
 =?utf-8?B?Ykx2U2pDL3A4bEoyNlBNV1ZBQUFlVVlZazhoaWlIdmJsV0FyRE9ZRTRlelVB?=
 =?utf-8?B?UStxWGd4SXBOTWo2NzBIL3J6MmwwOGI0WTA2Snh4TStVWE4wcGlNNlpsZUZM?=
 =?utf-8?B?enNXVVlwM2k1amVlWXhHSEMwSUFVOG0xM0VmeEozNnZyYzRyRTJnZTZ0TnB0?=
 =?utf-8?B?M1FIWW1iQ3ViOVlYNWRzZHp1UWJvVHhXWW13eWUwdVZBNkhiMVhqQ0dXaFlG?=
 =?utf-8?B?N1RROTJTU3NuRzdjMWtycjBwNGN4UU1DQmtoL1Rsc0JBeFBWVFh1UUd0Zzlw?=
 =?utf-8?B?eGtrVFU3R1J3Ri9tbkRCK0FqZnBCbngvbFZHa1JKdnFweUhMNzdKNjhPL01X?=
 =?utf-8?B?eko0eHlKVjluZGYycDZ3QmtxU0p1YkozSnVab080UzNObllXWEF5VWVWbWpv?=
 =?utf-8?B?OWNRajk1MnRMWXpaVWIzc2xCcVBqdW95KzdNbE9xYXlDWWgwQW1CS0lzQVI5?=
 =?utf-8?B?dFB0MVRZalJKUzBRRGltVSt3ZDRrRmpucjEyRGpwdkJBL2ZiZUhuejhGSnZi?=
 =?utf-8?B?OHAyRjJCM3ZkbHN6T25LMlpUak83TmNrRk9JKzlTMy9VSlJXNEV0VlhtWHQ3?=
 =?utf-8?B?d2htaEg5S1ZtcW1rNXJwRXF4c29IV2x3aThBUVpQM0g3YW5ybzJSVVpPTWJF?=
 =?utf-8?B?anduY1VpcnhPRS9EWDFVL2YyK1J6YUMrcWpvVFVnRUdtSzY4Z3NZMGk2Z0lS?=
 =?utf-8?B?WTk5dFprTFNXRUVlbEtOeXQrZkwzRW14STR2MFBwYkQ1cFNuQ2pYdEgvejVq?=
 =?utf-8?B?MTQ4VWJGTVE3N1hIZ3pkVitHUVRmQmJReWJUS0tGZG15d0FGb1YwNkJJWjZ5?=
 =?utf-8?B?Z2t0UUY5czNqejVuemMzS3cyTldaZzFYSjVBQkdBMnFoODdMSDBXMk5LT1Jw?=
 =?utf-8?B?ZlVCR3RGcE5DMzJvbm53M3pFK3N5cy9sN1pPRFFHRzFIeG13YWY2dVVFNCtZ?=
 =?utf-8?B?WS9MWTJMRGdISHVyQkpJNmlXRStySVdtc0lwbC9iUWJSK09YUUZCS0gySGl2?=
 =?utf-8?B?blJZdUgvcVdRL0RWMzFJSTc2UFBDb2ljU1VDN1VqOERNWEVFU2RjaXRtL2JV?=
 =?utf-8?B?R010YUs0WHlUNmRYY3BOWktuSkZUU2tHTlk5ME83N1pEVlNoYXBSa2ROZWZw?=
 =?utf-8?Q?EX31VIi7WCE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTZGaGFQZVJGUW5seWc2LzdGRXJwRjNNRW03M3NQemVkYXYxNTNTUU1TYXNZ?=
 =?utf-8?B?bU41bE9hVldBTGtlUXZmbGJlWDI3OTk5UXhyS0FOejRUSE5COGpzZ3RSc0ZT?=
 =?utf-8?B?aGlQNGU4U256K1Zrc3pUZkVyUjZGUUpNcUFHZ3VFeWQ5TzRIRC8zT2pVTG5O?=
 =?utf-8?B?cWtpRE9Ld2dVZU9QVlBXYjlpanp2a3ZyUE16czI4Z3V5MmVVN2Z0QWhzemlx?=
 =?utf-8?B?ckZ1bnlYNFZydjZETXl6RVViNE9SZXhNSU9hOFJJSDhKZFUvaEZva21UaWFu?=
 =?utf-8?B?RlUxTXlyRzBQa2xnNUMvbFFFaS9SVFRBWURFZEcxd2hKN2c5eDJGZEVzeUhi?=
 =?utf-8?B?SkMxK3dTWjZWNStvMGc3YjMyanBUdjdYQ2s0aWxadVptVnNGYXdTUHJ1TDV3?=
 =?utf-8?B?SzkxbEJUN3VCR3FwcVM1Vmp0RTZJUkFtTlJwZm5ZT1I2ZzlERTlOVXI0WU15?=
 =?utf-8?B?cmdteUtieGZoM0ZaV3RyTUpkbDd3bUtRQzl4NFZvanFpWTBhQitnVnpha3Q5?=
 =?utf-8?B?VDdvTVM3N0RleHJhZlRaazF2aFEzNzBJMllFTWdBT2xZM3JNUnNmd0lwUTJM?=
 =?utf-8?B?dEdvWGtWVitHRlltSzBrVjl3eG90VWVaY1oxNlZDSm5hWkZZK2lYV0s5TVNX?=
 =?utf-8?B?dVB0bEM4OUZteE5RQnZzaTFzN1VheVVsYWlXNkZSZ09TRDVFWDBDcXluZTVH?=
 =?utf-8?B?czNDdCtEaXpWeEduRmZNVHE3bjN1UXFhTTVOOWZqeS84a3pDOHE5dk9DSm1D?=
 =?utf-8?B?cHpRNWhSSjJkVkNIZmtFS1h4N3p0WWR4RmxlT294MHF4dTQ2WWQyK3dKQjVu?=
 =?utf-8?B?MU1TbWJHa0VVVGtLOUJFMnhBeEJjUHpKRldFMk8vZ21qS2t6bzdJZTNHUHY1?=
 =?utf-8?B?MEhuZzhCaVlYNXR0Si8wTzlYVFRKMUdZbmdrbTlYRDArSUZRMDlEZjEwbG5R?=
 =?utf-8?B?bXUxVkx2c3ErbGtCSVpNU2d6cUN1dEtibUNMSmtab3JQL3ByRVFQMXlXTFlD?=
 =?utf-8?B?Ym02MGU3WERLZFAwMWVFWHp4KzNVL3pLMVVncVNreUJ6UXc0TkhWTzhGcGNy?=
 =?utf-8?B?RGtkallhc3lKU1U2N3dyQ0QzUWJPSG5lTG4ybEk3RW5vQVczSjRGYzNkYUFh?=
 =?utf-8?B?SmtzZGJOSUwwUktaVEQ4cEY3bDRBcHkwYThqall4aStFdm5wNkZ0Yk5ld3B4?=
 =?utf-8?B?ak5pVmN1a2NBNDUwbWZIcllPWkpETXAvMm5uWjJLN0RhcUFMMVgzUnRqTTBx?=
 =?utf-8?B?SDNoeHVKZWg3eFA5SEtKL05MSjhtUUZHM1VFRFpPV1A1RU5MOW1vUGRaMGpB?=
 =?utf-8?B?VkJTSlhWb3I5TkpEam1GSzg4T0syTGV2WjdkRHFnc2hDSFVlV1Rxa0VFYXJs?=
 =?utf-8?B?WGFYeFFzeHM2ME50TDEvV1hYL2k3TnhtMHhzVDY5blBJcnRmTlFBcnFsQS9X?=
 =?utf-8?B?cU5wZzdhRjg3M0VqNnZxUG05c0tmejlDM21MZDNWWGJhYnBBbk5HTW11VlQv?=
 =?utf-8?B?eGRqNUZOWUFlcmNIdzkrdkVad0M2dndVcUJjS3NacFpvdnpwMVFxYkRHajkx?=
 =?utf-8?B?M1ZoMzBvSEVuOTVmNG9aNHZreHhSWjI5K3dZNVVEVU9kUjZDWEpmYm5tdEE3?=
 =?utf-8?B?bkxNeVRjd0tMd0JEWTVsL3p3dy9QNTlNR3JMMDA2MDU1MEtDWEV3WDZWalha?=
 =?utf-8?B?VVJ5bkRrZndGNlYzTlFpb092OGh4U0s1Y1M2YVZCM2VSSThCbVNQazVMZ1dQ?=
 =?utf-8?B?N0RuSzR4S1NhOXRrWEhjM2dMMkxFenhzdUVRUTdVdnI3NUpMQ0lPVmZHcHR0?=
 =?utf-8?B?eXY0UmNHcVBUQytOK21zWjg3MXJLQndOaXVHMnJ5QXc3OTRlWmRieitmYzFs?=
 =?utf-8?B?S3M0aG5YU3NQNGoxc2c5eUtwekFpaVk3TlBFM3VvV0xFZklQY1Bwbk9pTW5Z?=
 =?utf-8?B?S2ZtQjJ3MTVrQ250NDhQREF5M25YN2dEUU5RbDlYNDMvaXUwSU5zY2xIWXZU?=
 =?utf-8?B?ZVdJaVVhYk0zRlJhZ2VzRC9VWVY3cGlkSXdiRm1BQUdCWXZaSVIwRCtWaG5x?=
 =?utf-8?B?OHNaandabFFsNEhRNjZVTTdrQmhCMG1IOGtESWNzUGJPSlgzTkJwcWFYNXhI?=
 =?utf-8?B?aGEwNG5Qd1ZQNUxBRDZBQjB4bnpNeTZ2UFhLSVBjUDljdU1aaWxJb0kzb0F3?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8A9250DDA8E3742A08DEBD439C83A43@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 010988bc-b29d-4665-8c35-08ddf903aad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2025 11:40:30.2412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5zsX85PmjpUN3h62BfjXVmavg4JQY77Qwk8abLpne0vJkb1V5298H/9qY5CmyygggaHd7AQuvQ+M+LD4sajmPyNGRV99E9fJ77/uwmoi6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 11:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223790

T24gRnJpLCAyMDI1LTA5LTE5IGF0IDEzOjAzICswNTMwLCBLYXZpbmF5YSBTIHZpYQpsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IFVwZGF0ZSBrZXJuZWwtZml0aW1hZ2UuYmJjbGFzcyB0
byB1c2UgQ1VTVE9NX0lUU19GSUxFIHdoZW4gcHJvdmlkZWQuCj4gSWYgdGhlIGZpbGUgZXhpc3Rz
LCBpdCB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiBnZW5lcmF0aW5nIGFuIElUUwo+IGZpbGUuCj4g
VGhpcyBpbXByb3ZlcyBmbGV4aWJpbGl0eSBmb3IgYWR2YW5jZWQgdXNlIGNhc2VzIHdoaWxlIG1h
aW50YWluaW5nCj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KCkhpIEthdmluYXlhCgpUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaC4gTEdUTS4KCkJ1dCwgdGhlcmUgaXMgYSBidXQuIFdoaWxlIEkgYWNr
bm93bGVkZ2UgdGhlIGNvbmNlcHQgb2YgJ2ltcHJvdmVkCmZsZXhpYmlsaXR5IGZvciBhZHZhbmNl
ZCB1c2UgY2FzZXMsJyBpdCdzIHZpdGFsIHRvIGNvbnNpZGVyIGEgY29tbW9uCnBpdGZhbGwuIE1h
bnkgZXhpc3RpbmcgQlNQcyBoYXZlIHVuZm9ydHVuYXRlbHkgbGVkIHRvIHVzZXIgZnJ1c3RyYXRp
b24uClRoaXMgaXMgcHJlZG9taW5hbnRseSBkdWUgdG8gdmVuZG9ycyBpbnRlZ3JhdGluZyBjb25z
aWRlcmFibGUgYW1vdW50cwpvZiBkb3duc3RyZWFtIGNvZGUgdGhhdCwgZGVzcGl0ZSBpbnRlbnRp
b25zLCBvZnRlbiBwcm92ZXMgaW5jb21wYXRpYmxlCndpdGggZnV0dXJlIFlvY3RvIHVwZGF0ZXMu
CgpUaGUgZGlyZWN0IGNvbnNlcXVlbmNlIGlzIHRoYXQgdXNlcnMgZmFjZSBzaWduaWZpY2FudCBo
dXJkbGVzIGluCnVwZGF0aW5nIHRoZWlyIHByb2R1Y3RzLCBsZWFkaW5nIHRvIGVpdGhlciBzdGFn
bmF0aW9uIG9yIGhpZ2ggY29zdHMKYXNzb2NpYXRlZCB3aXRoIGZpeGluZyBvciBjaXJjdW12ZW50
aW5nIHRoZXNlIGluY29tcGF0aWJpbGl0aWVzLgoKVGhpcyBwcm9ibGVtIG5vdCBvbmx5IGltcGFj
dHMgdXNlcnMgZGlyZWN0bHkgYnV0IGFsc28gY2FzdHMgYSBzaGFkb3cgb24KdGhlIFlvY3RvIFBy
b2plY3QsIHdoaWNoIGNhbiBiZSBwZXJjZWl2ZWQgYXMgY3VscGFibGUuIEluIHJlYWxpdHksIHN1
Y2gKZXh0ZW5zaW9ucyBvZnRlbiBieXBhc3MgdXBzdHJlYW0gbWFpbnRhaW5lcnMgZW50aXJlbHks
IGxhY2tpbmcgdGhlCmNyaXRpY2FsIHVwc3RyZWFtIHRlc3QgY292ZXJhZ2UgbmVjZXNzYXJ5IGZv
ciBsb25nLXRlcm0gc3RhYmlsaXR5LgoKTXkgcmVjb21tZW5kYXRpb24sIHRoZXJlZm9yZSwgaXMg
dG8gcHJvYWN0aXZlbHkgcHJldmVudCBzdWNoCmZydXN0cmF0aW9uIGJ5IG9mZmljaWFsbHkgc3Vw
cG9ydGluZyB0aGVzZSAnYWR2YW5jZWQnIHVzZSBjYXNlcyBhbmQKZW5zdXJpbmcgdGhleSBoYXZl
IGRlZGljYXRlZCB0ZXN0IGNvdmVyYWdlLiBUaGlzIGFwcHJvYWNoIGlzIHByZWZlcmFibGUKdG8g
bWVyZWx5IGNvbnRyaWJ1dGluZyBBUEkgZXh0ZW5zaW9ucyB0aGF0IG1pZ2h0IGVuYWJsZSBhbGwg
c29ydHMgb2YKcG90ZW50aWFsbHkgdW5leHBlY3RlZCBhbmQgdW50ZXN0ZWQgZG93bnN0cmVhbSBp
bXBsZW1lbnRhdGlvbnMuCgpLaW5kIHJlZ2FyZHMsCkFkcmlhbgoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBLYXZpbmF5YSBTIDxrYXZpbmF5YUBxdGkucXVhbGNvbW0uY29tPgo+IC0tLQo+IMKgbWV0YS9j
bGFzc2VzLXJlY2lwZS9rZXJuZWwtZml0LWltYWdlLmJiY2xhc3MgfCAxMSArKysrKysrKystLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtZml0LWltYWdlLmJiY2xhc3MK
PiBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdC1pbWFnZS5iYmNsYXNzCj4gaW5kZXgg
ZjA0YWVlMTgwNy4uOTI1OGFmOTM4YyAxMDA2NDQKPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBl
L2tlcm5lbC1maXQtaW1hZ2UuYmJjbGFzcwo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2Vy
bmVsLWZpdC1pbWFnZS5iYmNsYXNzCj4gQEAgLTEzOSw4ICsxMzksMTUgQEAgcHl0aG9uIGRvX2Nv
bXBpbGUoKSB7Cj4gwqDCoMKgwqAgIyBHZW5lcmF0ZSB0aGUgY29uZmlndXJhdGlvbiBzZWN0aW9u
Cj4gwqDCoMKgwqAKPiByb290X25vZGUuZml0aW1hZ2VfZW1pdF9zZWN0aW9uX2NvbmZpZyhkLmdl
dFZhcigiRklUX0NPTkZfREVGQVVMVF9EVEIKPiAiKSkKPiDCoAo+IC3CoMKgwqAgIyBXcml0ZSB0
aGUgaXRzIGZpbGUKPiAtwqDCoMKgIHJvb3Rfbm9kZS53cml0ZV9pdHNfZmlsZShpdHNmaWxlKQo+
ICvCoMKgwqAgIyBSZXNvbHZlIHRoZSBmdWxsIHBhdGggdG8gdGhlIGN1c3RvbSBJVFMgZmlsZSBp
ZiBvbmUgaXMKPiBzcGVjaWZpZWQuCj4gK8KgwqDCoCAjIElmIENVU1RPTV9JVFNfRklMRSBpcyBu
b3Qgc2V0LCB0aGUgSVRTIGZpbGUgd2lsbCBiZSBnZW5lcmF0ZWQKPiBkeW5hbWljYWxseQo+ICvC
oMKgwqAgY3VzdG9tX2l0c19maWxlID0gZC5nZXRWYXIoJ0NVU1RPTV9JVFNfRklMRScpCj4gK8Kg
wqDCoCBpZiBjdXN0b21faXRzX2ZpbGU6Cj4gK8KgwqDCoMKgwqDCoMKgIGN1c3RvbV9pdHNfZmls
ZSA9IG9zLnBhdGguam9pbihrZXJuZWxfZGVwbG95ZGlyLAo+IGN1c3RvbV9pdHNfZmlsZSkKPiAr
wqDCoMKgwqDCoMKgwqAgYmIubm90ZShmIlVzaW5nIGN1c3RvbSBJVFMgZmlsZToge2N1c3RvbV9p
dHNfZmlsZX0iKQo+ICvCoMKgwqDCoMKgwqDCoCBzaHV0aWwuY29weWZpbGUoY3VzdG9tX2l0c19m
aWxlLCBpdHNmaWxlKQo+ICvCoMKgwqAgZWxzZToKPiArwqDCoMKgwqDCoMKgwqAgcm9vdF9ub2Rl
LndyaXRlX2l0c19maWxlKGl0c2ZpbGUpCj4gwqAKPiDCoMKgwqDCoCAjIEFzc2VtYmxlIHRoZSBG
SVQgaW1hZ2UKPiDCoMKgwqDCoCByb290X25vZGUucnVuX21raW1hZ2VfYXNzZW1ibGUoaXRzZmls
ZSwgZml0bmFtZSkKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5l
ICgjMjIzNzY4KToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzIyMzc2OAo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210LzExNTMzMzcxMC8zNjE2ODU4Cj4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiBVbnN1YnNjcmliZToK
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1
YsKgWwo+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0KPiAKCg==

