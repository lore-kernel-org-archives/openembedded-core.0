Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB06AC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:55:29 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.60])
 by mx.groups.io with SMTP id smtpd.web10.44526.1747994124609021109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HjtE0ms/;
 spf=pass (domain: siemens.com, ip: 40.107.241.60, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhHXvNEDVuXKPvQUeyYFrgliUh/XJFehouAWThAJ+faB4GECUjaGpWcDJIerivNfVRzoXcyvVrkPvQ2k7SGTweSMlDD9vsBEhrEmqQmj5s+xKApmif6Dzbt3ZnRHGgeLFLtn6jNOuccF7QRolipdi87eBko4Y+2LHCVKJOc3NJE3Ct8Tw4i5byU+BDYnEGU/UQ6FMII94rvM6nFa8kOn4F/0a0HygAhGgOFdz5tndtcUlCuVJmodiePQo6RpuBg2QiqjcswPJieoGginpaPM8Hd3cevBXOrmGnACh3XainkMtFqkH3gsM0VlmctNNbg1/uoLnzMZ6Fg/leTyhuyeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fTkefFoTIb3E29fbx3+ddBw0j/R8XijcLN6hI28IdM=;
 b=OH9AZtkBdLuQRiVWNhmkmtLEgMgc5SSdCeG+I4BHe2ADlmqlSVtQmY+1fCiB5lF7ZhU/ixeOnfdrGK77aQlxKOPhOObVS9pBGPlD/s6LXRA+MaSy3gbV22l96ufSq3KT4TPDt7MDwyJNyq1VlbwJMaFZ2VzGF+sxWUhkW31zRuUxCfrEJSkkHd+6VDPprgzMTge59KXEfpf0wWJFyYdDX6436EwT4jMQDP0/2N0abayDw8g2ofQAwN8/yUsnTHk+TREEQO3OfgGFsOaoziRLtXu9tJxQSJwJwh7y+XaXoVJygM5ven3xfUqRMZbzeQbM/jHy1LG657EPDqmBLcEHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fTkefFoTIb3E29fbx3+ddBw0j/R8XijcLN6hI28IdM=;
 b=HjtE0ms/IRjNh8JrRhgCqQHn1AsYbRh7GfBqToPJBUQRp8xN0zSEVEvfHi81OX8MSgohoZCqoKFCUQ7YoFqjNTqBf2Z7uK8iCextElfO16X44L8/hdlDB/9P3Bj5FwLKJNi2lYaM/Puv1NqmLkOIptbrApxdy2CRJdrbsyBJ0jfK5lTPEo4c3Gu5JXgPuh/Xn8sU0aPA/mrw43AU0OnTH217qdZayEB3A4nYIQdqORDedIZWsoKuekXhbM2q4hrcBGalTrbwOpFMSs8gW8pa6CITWTPsPVXjpdkFFI3V1uKsjPCYhnneTa8OXJKSs/d1VCSN9DuYdu5G+lxrRx5hCw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PAWPR10MB6855.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 23 May
 2025 09:55:19 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 09:55:19 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "marex@denx.de" <marex@denx.de>
Subject: Re: [OE-core] [PATCH v4 00/16] FIT image improvements
Thread-Topic: [OE-core] [PATCH v4 00/16] FIT image improvements
Thread-Index: AQHbyK5q6RzfcGjRfE2hPioA1wgnL7PfuZSIgABGowA=
Date: Fri, 23 May 2025 09:55:19 +0000
Message-ID: <6434982eca3cbdf04bd7213e343ace21572b8ab5.camel@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
		 <1841F71260544116.22209@lists.openembedded.org>
	 <7bc2bb3a7f938d67c37031baff442ce95bf52bf1.camel@linuxfoundation.org>
In-Reply-To: 
 <7bc2bb3a7f938d67c37031baff442ce95bf52bf1.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PAWPR10MB6855:EE_
x-ms-office365-filtering-correlation-id: 80cbf6ec-884a-41bf-d927-08dd99dfed31
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dTlKNllSb3FYTmlFNStORkhQU0hmS0IrVXVqY25qcDN5TWVjL3E0OVgxRXFx?=
 =?utf-8?B?Uk85d0MwZkd6b2Exc2ljelhOS0F4aGQzS3pwbDJ3Y3RwNkZDcmtwMDVOcnJ6?=
 =?utf-8?B?T3ZNTjRkQWRzZ3dQamR6bmRyZmhrdkxkT3piU0NlSTVGUUZhY2dEcGJINjJW?=
 =?utf-8?B?cFo2NmxieWhlMlJCTkF5OUJXOU05dGIvc2dlbi80UmRBQXB2K2plazVIVHBO?=
 =?utf-8?B?Q3pQT1lYWXRKbm5aT21kc0RZcEwySXpQQ0M3WDJWVWlPSW9IVnZhd2NRT3Yw?=
 =?utf-8?B?ZElrRE9GY3dVeUFpV1BnSVRLYUxrYkorUXpTdE1QZm5yVDdzOUtWNm9mWjUz?=
 =?utf-8?B?TmIyd3ZjTURZRCswQXVKRzl4RUhEZUNFTWVzOERFVTFzZE0vRWprbGdVOS9s?=
 =?utf-8?B?UHV6TkgzWHRBUHRibHpMZkUxRjBsRUJ3YUVEZ0dSS1JxdlY1RFVuV0NIWGkw?=
 =?utf-8?B?RytLZ1NtTjlab01nZmozSzJ2KzZPbUV6aU9CSXQ1a3ZOZXQvbjNidmFxQ0kv?=
 =?utf-8?B?Z1JnQkJxZG5ad1ZRYVo1R0I3VGw0VEhiUXkzZ0hqazZJZ0x1b042djFXcDdG?=
 =?utf-8?B?VkJJRGZQeFoxM0ZnamV0UjRsOS9WNm0wa0NtNjB3TnJ4Wm5tQkZwMWRoUXF6?=
 =?utf-8?B?L2dJeCtJcEJlbzdVbXcxNkk1K0s3OUZSVEZISW5sTWpwUCtQV0RLc2JEUHNj?=
 =?utf-8?B?V1pPak40VFJIVTF4akpvZzlxVkZGbUpodG1nejZFRGNWd2hiaHVJcXpUejBC?=
 =?utf-8?B?Wlk0aEdDWm1PODZtZFI4QU53MGlOemJ4c1pabVRJdkNoTXVDQTZ4VENrSC9k?=
 =?utf-8?B?UE1MdUxFOTFzUXVMOHh0OEs2WlZHamxmaVdoU2R3dFBEVkd0Q0FYNEQxL1Nr?=
 =?utf-8?B?SGt5ZDlxWkMrQnliYzNLRG1TR1Z4bjZFdU8vYk5Oc1RWQm10WHpXSE1yZWlU?=
 =?utf-8?B?L0hiQUJ6L3hNeU56azZHZ0taZWQ1WmowSDNzSFhReDFRWnJvQSt3c2ZMODgz?=
 =?utf-8?B?MEdLQmxLb21oZlRPR2lXcFhNTWRVZ3JWbWhQTFRJODlZL00vUFhnUEhZeWx1?=
 =?utf-8?B?M05qQjVRRC83S2w2c0liRndQMExyN0ZybFgzMHVjNDVwTjBwdkVWV3E3aU8y?=
 =?utf-8?B?T3RyQzk0SzBUZGp3NjlYMDJtSGtLa1gwTHRRY0hwbzdkZktqNnZkUGFtQ0FP?=
 =?utf-8?B?T0xZZ1g5M2ZFTTM1RXlydDBUMVdpL1kxQktaT3lHYmM3WkhmaFlOcXFsYlNm?=
 =?utf-8?B?RDlrYlVCR2lpQjlIZFZvc1IxQzN5cmU3UWdPdGY3MEZoWlNZeDc4KzZDZkR0?=
 =?utf-8?B?MitXZ1dLaXpIUWFQc0RTNDgycFNJaHNtZlVLS2RNTGZtNERheHZLQ3FyMGUx?=
 =?utf-8?B?NmhaSk5JbHVSZk9RaCtiQnZSNzdweVNONXVmQ0pWMEx2akpkWFU1SGJXVkJj?=
 =?utf-8?B?anlCMHdiQmllRm9yTFQ1QzRrTms2RVk2TTBvWThwb1l3eWhpbFR1V0NaS0U5?=
 =?utf-8?B?Wmhwek81UHFrLzNWL3BGNFNvMXoxekZySitoSzlTS2dxVDRqVFNkUFdrN3hk?=
 =?utf-8?B?VlVxc2FMK0RhMXdFQWRxNVFGTzFyNzhWUWVkcVJkWG5zS1BPdWpETWUxMFhq?=
 =?utf-8?B?N0dZaWxmQ0d4OFpLMGhvakhGWkV6OUZ6ZG9Ib1UzQjlWRTRGZ0x2Z2g0M0Zn?=
 =?utf-8?B?L3N4YjlPRUhKeklZeWxLU09FdjRoTjJHREZ2cmlpUnFpWnR2aitTV2tnYngy?=
 =?utf-8?B?azNYQ2YxODdSWEgrRDdWMnY3RHRUSDUyemNvYWJkRllzb05FUC9JK2dCNjVu?=
 =?utf-8?B?enFKZDYxV3YzZ1AyUXFXUVd1MlJSd0h6VDNTUzN4dlZtOERBTHVPUkJiS2VZ?=
 =?utf-8?B?V2Y2dzNzaXY3eDZCSkZqMXhGNlZzaFpNMDZhR0VIbmV0RkF6YzdXSlNkSFhJ?=
 =?utf-8?Q?v+L/uiX7UJs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXlCbm5xWkI2Zmtvalc2UWhHWi9FOW8rTko5TFZoNWZPb1Y1TmdZYkZySWxx?=
 =?utf-8?B?eWZXQi92Z2pnWG9oQTRuYWZPRzlqaFhCMVg4ZWJQMHd0bk9kbzdsR1EvL240?=
 =?utf-8?B?aVRCSUwyZW8xTnZTNHp3c1E5cnlzNVJZbGk4aTlwUkpJbG9jOG9ucXRCQldw?=
 =?utf-8?B?aWE2R2lldkxJS3F2dnBQbmlQMVovRVNJMjJvTTNXVXpDTUpxckNTWG1adDVZ?=
 =?utf-8?B?U1RXcFU5aVo5SXorYlROckJGNDVwSUFjS1hiUVZkYlNzWmFpNHd0MkFKb0VX?=
 =?utf-8?B?T2xlUm4xcTlkZzZicWo1bEcxOUlwSktjL0tsL2hEQ3hhNS9JRGNhaGhEMnJP?=
 =?utf-8?B?ZWxoMDZ4UW1uQ2FodjZpQkRtQnNvbS80RVNyNFQ4N0s2R2ovS2d2SUp6YmxN?=
 =?utf-8?B?d2Q5T3VCM0JIUHZzNDhjRkVsRW81cFlTMG9KWlFNcEdzSlNKVmgxTUtxQS8v?=
 =?utf-8?B?UlEvY0tsdmQ5WFc3WGlReCtrbnAvM3ZReWt2aWxxcG1ud09jUFBGc0g5TGYz?=
 =?utf-8?B?OXk0NVRHTFlRUUlaS2dpZnNPRzh4ZCswQVloVlBETjkzRGFTV3lPbzRRbmNm?=
 =?utf-8?B?Ynh5WTM2eUx4NDB6L3JvdlB6WmxtTzhNQ3BJVml2TE1yVnFRQnM4SEsyZU93?=
 =?utf-8?B?Y2lTZlVyZXJiaUczUHdGKzRUTnVXMzA0aHhiRWI5aUM1UkZQUnFzeHBTTGVS?=
 =?utf-8?B?Y0FlV1NabVVlcHl2STF5dm1MUUtBa3lQRWpLbDhIWFRJYWtaWE5ucVhQcjYr?=
 =?utf-8?B?dlI2b3FnS2dIRnBSNllRb0tDQVRiVVhPOGEwZFFhSnBsNEcwSjU1Vlo2UGdi?=
 =?utf-8?B?V0NmcGVGajY4RVI1YUhpbW5xUFJ5NTQ1Vlg1eSsybHlIZUxmM2FuTHNoeDdF?=
 =?utf-8?B?ZnZRcHhQNUY1UkowVGtoaXF3ZVNoTEptSlMxNDNxK1IxbXZERlI2QkFKUXRZ?=
 =?utf-8?B?MVJyN2tycXFYNUtSa0M0K0N6NFg2bHF5NW1xQVp0WGs0QmpLL2EwK01UcW1J?=
 =?utf-8?B?RlBhamlWRDAwK25yK1pxOGNqTWp4M2RMSXpMUmk1ZFJtcGZsVExlb3RkajY3?=
 =?utf-8?B?TDY2YVZyZ0FsaU5wRFUwZWlLZzd4cUVaZHcxZ1QvRFYrVzQrM2s1cHhZRHJs?=
 =?utf-8?B?dWk2ekJhS1NTV2l4TE1oV1VlcytiK1Z5MGRIbHlHMkpmZHBCZzVIV1FiTE1W?=
 =?utf-8?B?aU5lOENrOG5hNjdOVTNveHFoRk5xbVl5SFBqRmhHWGwvSmZXMzM5MFVmd2s5?=
 =?utf-8?B?dG84ZmxlQXFhVzd3anZraXIvb0poK3QrVC9lZ01BV3ppdkhwWWwxS3p5WTFF?=
 =?utf-8?B?dTh3ZWpMOWRQbzJZNzRqbEtFcG9uOWZmRlo1clZ1K0xER0hQQnBTVEh5ZllQ?=
 =?utf-8?B?MGpBMytQVStsbWlnSTdsMnBaVWVpd284R1NkNGRSTVdtbDFiNmpUa2VqNk8z?=
 =?utf-8?B?Znd6UXBIcFRBYzhwWTcwdkQvdVlwcGFnT3pTcXlqY21EWXp2QmxOdzlsbXJz?=
 =?utf-8?B?eGp0akFSbXdYQ2RUZE9rbHFBRXlHRWl3WGhmaWlRemhwdzM4VTJtck93UlNG?=
 =?utf-8?B?Nk1qdWRWWWZmeG9vb1JTc1c3VDVUcEYvK3dKbnpZdXlkd0ZqVllKYjAyeXFY?=
 =?utf-8?B?azdTRnBuNlM0Nk5xZE1DSWZlenlndzFiTmlKbnQ1ZTFDYmUrQWw2dTd6TE1J?=
 =?utf-8?B?azQrMFVTYVRrZWd3aUE3TEZEbit3eGI3ODFweEFTeTk2OW5aRkY5bVVjT3h3?=
 =?utf-8?B?WDFKTWRXN0xhYlk2VmJEdjFXdERtUVI5Sk1BVHNKTGRiMW9CWStXRklKRTVr?=
 =?utf-8?B?SjY0WDN0Z0ozdmp5VnY3MmtsQVlFWkxMYmcrQVRWQ2FiY3pKd3czMFZpN3Fm?=
 =?utf-8?B?RFlHazZrUFhmS21xRkhHWTRQVUdMWW4wNE5EVUdIanBMNW1Kbys0TWgydlJh?=
 =?utf-8?B?bi9KdHh1SkFWNlViUW1QTEZ3bml0S0ZuTSt5MVVyazI5UzFLMVVWdjFNWGZh?=
 =?utf-8?B?dlhDUFNCWlN4WDZmS1dCWWJmMFNQNi9ZVmlTMTZQWm9UMFdGeTFtbExqZTg5?=
 =?utf-8?B?MVo4ZDkvWTJpUEdzMFFDTjNMNFFSTFo3dWExUml4dXR6MEhtRnduNE5nNFUy?=
 =?utf-8?B?TjlBblUxQ0t5RUt4MUc0Q0lLUUEzYno5YVlveldzemVNTkI0QUVXT3g0dk56?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64FDF78AFA47D54F849B1B2CE19EF875@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cbf6ec-884a-41bf-d927-08dd99dfed31
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 09:55:19.2049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYEayyfYAuis4WP6qqfyyUeLbwuyuEAicKhgMaas7AcLaPUMTgGPiM/fGTLZrI0xRgVzxytO9KZBbxkRFDNUVQtG3TuH1yfJkywlTfiIYDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217204

T24gRnJpLCAyMDI1LTA1LTIzIGF0IDA2OjQyICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVGh1LCAyMDI1LTA1LTIyIGF0IDIyOjM2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjUtMDUtMTkg
YXQgMTM6MDcgKzAyMDAsIEFkcmlhbiBGcmVpaG9mZXIgdmlhDQo+ID4gbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gPiA+IEZyb206IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVp
aG9mZXJAc2llbWVucy5jb20+DQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgcmUtd3Jp
dGVzIHRoZSBGSVQgaW1hZ2UgcmVsYXRlZCBjb2RlLiBUaGUgZ29hbA0KPiA+ID4gaXMNCj4gPiA+
IHRvIGZpeCBbWU9DVE8gIzEyOTEyXSB3aGljaCBpcyBhIGxvbmcgc3RhbmRpbmcgaXNzdWUuDQo+
ID4NCj4gPiBJIHJhbiB0aGlzIHRocm91Z2ggdGVzdGluZyBhbmQgdGhlcmUgd2FzIHN0aWxsIG9u
ZSBvZS1zZWxmdGVzdA0KPiA+IGlzc3VlDQo+ID4gcmVtYWluaW5nOg0KPiA+DQo+ID4gaHR0cHM6
Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVp
bGRzLzE2MTANCj4gPg0KPiA+IG9lLXNlbGZ0ZXN0IC1yIGRpc3Ryb2RhdGEuRGlzdHJvZGF0YS50
ZXN0X21haW50YWluZXJzDQo+ID4NCj4gPiBzaG91bGQgcmVwcm9kdWNlLiBJIHRoaW5rIHRoZXJl
IHdlcmUgY2hhbGxlbmdlcyB3aXRoIHRoZSByZWNpcGUNCj4gPiBzb21ldGltZXMgYmVpbmcgYnVp
bGRhYmxlIGFuZCBzb21ldGltZXMgbm90IHNvIHRoaXMgbWlnaHQgbm90IGJlIGFuDQo+ID4gZW50
aXJlbHkgc3RyYWlnaHQgZm9yd2FyZCBmaXggdG8gd29yayBldmVyeXdoZXJlIGFzIEkgc2VlbSB0
bw0KPiA+IHJlbWVtYmVyDQo+ID4gcmVwb3J0aW5nIHRoaXMgb25lIGJlZm9yZSBvbiBhbiBlYXJs
aWVyIHZlcnNpb24uDQo+DQo+IEkgcmVhbGlzZWQgdGhpcyB3YXMganVzdCBhIHNpbXBsZXIgbWlz
c2luZyBtYWludGFpbmVycyBlbnRyeSBzbyBJDQo+IHF1aWNrbHkgYWRkZWQgb25lIGZvciB0ZXN0
aW5nIHRvIG1hc3Rlci1uZXh0IHJhdGhlciB0aGFuIGRyb3AgdGhlDQo+IHBhdGNoc2V0IGFnYWlu
LiBZb3Ugc2hvdWxkIHByb2JhYmx5IHNlbmQgdGhhdCBwYXRjaCBpZiB5b3UncmUgb2sgd2l0aA0K
PiBpdCwgYXNzdW1pbmcgdGVzdGluZyB3b3JrcyBvdXQgb2suDQo+DQoNCkhpIFJpY2hhcmQsDQoN
CkkndmUganVzdCBzdWJtaXR0ZWQgdjUsIHdoaWNoIHNob3VsZCBiZSBpZGVudGljYWwgdG8gd2hh
dCdzIGN1cnJlbnRseQ0KaW4gbWFzdGVyLW5leHQuIEJhc2VkIG9uIHlvdXIgZmVlZGJhY2ssIEkg
dW5kZXJzdGFuZCB0aGF0IHY0J3Mgb25seQ0KaXNzdWUgd2FzIHRoZSBtaXNzaW5nIG1haW50YWlu
ZXIgZW50cnkuDQoNCkZvciBjb250ZXh0OiBUaGUgcmVjZW50bHkgbWVyZ2VkIGNvbW1pdCAidS1i
b290OiBlbnN1cmUga2V5cyBhcmUNCmdlbmVyYXRlZCBiZWZvcmUgYXNzZW1ibGluZyBVLUJvb3Qg
RklUIGltYWdlIiByZWludHJvZHVjZWQgYSB0YXNrDQpkZXBlbmRlbmN5IHdoZXJlIFUtQm9vdCBk
ZXBlbmRzIG9uIGEga2VybmVsIHRhc2suIFRvIHJlc29sdmUgdGhpcw0KZGVwZW5kZW5jeSwgSSd2
ZSBtb3ZlZCB0aGUga2V5IGdlbmVyYXRpb24gZnVuY3Rpb25hbGl0eSBvdXQgb2YgdGhlDQprZXJu
ZWwgaW50byBhIHNlcGFyYXRlIHJlY2lwZS4gSG93ZXZlciwgSSBvdmVybG9va2VkIGFkZGluZyBh
DQptYWludGFpbmVyIGVudHJ5IGZvciB0aGlzIG5ldyBrZXktZ2VuZXJhdGlvbiByZWNpcGUsIHdo
aWNoIGlzIG5vdw0KYWRkcmVzc2VkIGluIHY1Lg0KDQpUaGFuayB5b3UhDQpBZHJpYW4NCg0KDQo+
IENoZWVycywNCj4NCj4gUmljaGFyZA0KDQo=

