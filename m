Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860FCC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 11:58:33 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.109])
 by mx.groups.io with SMTP id smtpd.web11.18035.1724241511394158594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 04:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=LYoOfoWK;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCSWnkWyw7QQfJTVudp22OhowB9H/Nda/AHQS+htR1qdvgtHqjEHtnWwHCZXktfkytMEJ259gS+5VdJmHyiYBcEPn7AzjRDjxR75+fP+nNGcv2IYq+vbFaINyNWxV0SMz9ppFOPbUZuduuuo7Dkn9VJ6wbZQSd3pB+Nr1wtdf2l4eneh9DdYdF99GI4Ytm6X/TRU7QJdsosBDGaJMI8SXhWTlrhu354ehRxLrmnIzEr/KJMNE1IjIpcQndoX85jTiHH31nF4JG0aRnhDNyAc15wNlyYUz1NuoL2BQMRZrD3477ER/u+hCiSBXnsE6b0f3J8gSwLMK105b0wGeziGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKT7X0K4cj62rDaY2ksP6Sz7lh8rNtNUwcZa+xpE67Y=;
 b=NPcjBrVQO65pYLprKu1YeQ3m2NN1Ie+amwfFQFoPfcYf3RpN1s1pXiv+UVle3BHYO3gKUb4AnrlPffluAAEIpXb2F3cN/obw80Cq07fKcKD3nuzhbtVDqMqB+XHpePNgsyZWIBgrYqff2WcAG4BFT64NRRrlmt1NERprclc9clFb0KJjHTcjMrprchm7Y+zZzPPUERwQ0MrtopHdTVlON+XZrWZZHxyt0HhI+pwwleVDUQne9xZksA7Siu05gQnfePzidPFwrFRpYfILp4O7zyeJR5CynGklSdTVySLhEx9SGcmT8x5jUpzZJ7hb0Xnm0PpCyeyKR0bqIrDLTYD7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKT7X0K4cj62rDaY2ksP6Sz7lh8rNtNUwcZa+xpE67Y=;
 b=LYoOfoWKDvLPFLOhHItI+L01In41vnbMm6gD6Ifr+RczV1Y7LSwtFYmZbpvlLNmg7fmsnI0elITSrF3xpOUwWzQC2+I/rvj8GtreP3DRnvpfFaS02NQk5oyB9JVJKqWAEDKEjkDhEAf1Z91RLNyEUlXyf2/q2kq7LXLvnLvQUAIJ+53HwhhuICMdbO3SUHLXitGArE7sIsflq5bfNBHKU6qpSz4/21CIGdzZhBJzo+HaxSwlS14dSduHbEVA9f7uwNRj63n+MN/AUZ/LnGFsEro94iqigeux7DgqMqtPpgWRclNbORLtywDNZ4xFm9GAg+nsgtOGXH0JDYHRJEUAJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB7793.eurprd06.prod.outlook.com (2603:10a6:20b:369::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 11:58:27 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 11:58:27 +0000
Message-ID: <f236db96-06ce-438f-843d-25530ac1d16d@vaisala.com>
Date: Wed, 21 Aug 2024 14:58:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240819182649.128659-1-niko.mauno@vaisala.com>
 <20240820191943c7d1348a@mail.local>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <20240820191943c7d1348a@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::33) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb5f2cc-c608-4c5d-9784-08dcc1d8911d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OStKc0crRlhkcmkvRnpaakIyaXFqS1hpNk5UQVNKZ2NvdC9EdGxxOXBXZHVO?=
 =?utf-8?B?cGJoRUxnMU5UaDlEMi8rMlV0SEZUblNUeldTbWtCVXZwTS9ZTlFVTlNDMzYx?=
 =?utf-8?B?VGVnUGc0OUt6RUFadmI0WjQ2bWhqVEE0djdQbWpHQit6NS81NG9lSkE1MSsx?=
 =?utf-8?B?ejQ2bjFmcmE5Lzk1V1ZMWkNUMmNDQ0lLWmY4eTBwOGhmMWtySHlPb2RmMXVt?=
 =?utf-8?B?TmZNbkVSUTB5N0I1d1UvSkt3Ykl5d3JwQ1U5NjNrQW4xcTNIRDNMeExlMWpL?=
 =?utf-8?B?Y0d4Z2Y5WmgvbGc5VUlseXN6b2dDbW1udXM2Ukl4SGxJZS93R0ZOQ1BXL2NV?=
 =?utf-8?B?TW11UUNUVFJMTE9oL210ZFIxQ1lVQThUeDgyMkZDZWVYYXA2a2pMYzRrYzRK?=
 =?utf-8?B?V0c3cHlURFF1K3lmRFkwVFNvcHZ5OTJXWWtMQ1BFRGJ4V0xaY0ZWNUl0MDh0?=
 =?utf-8?B?K1pSNjgyc0l4TzJ0b0VjYkJuYm5kNmhKYXY0cHFETEZPT1hlb0huT2JyQThq?=
 =?utf-8?B?WEtVdVBGNTBoVXVHQ1p4ZERpMjdLMUh1RUoyaFlLTnpERElrWUpUS3E0aWh6?=
 =?utf-8?B?eFlVVVRhdGgzVVdHbkxZQlVNS1I5enRpSWh4S3BjWis0VTZTdGpOcXpGRElW?=
 =?utf-8?B?dFRQbDZWY0ZDaHlKclVxQmFiL3A1RGMzajBqbEk3VjAvUWlyUE5XUG5VNHMy?=
 =?utf-8?B?OElJV04yVXdNWkdpM2J1bXk0bXVmeHVrYzJ5MU5xd3ZzT0JhdytZVEVqWjk4?=
 =?utf-8?B?NmZ1Q0JsVzJnMTkwTWNSWllXV1VuUjlFQzRGVUlDREdyUU9xaG0yMTlSUzFT?=
 =?utf-8?B?MWRqZWM5RU1EeVZiZ0JuT3Z6a1g5cE5qaGlHaGNNOFVaSDJTMEg4NmIwWldY?=
 =?utf-8?B?ZE90cjVUMTZMelcrdjlza0laSzZxZjUvSjQ5bG5BRkRXL0N6YWlweFNINEZv?=
 =?utf-8?B?a0ljSXpyemlpY1MxcFJpR3gzRDVPL1V0WlBwZFl0ZGpVYXVDWTJOM0RPL1Bq?=
 =?utf-8?B?cHRRRXhSRXNiWkdianNkTW9pVlRNRWh5OUtUQ1Y4aEVXekM2VUdtU1p0czFt?=
 =?utf-8?B?eS9ZeW5MWlhVek9PVnEwU1lNSWhXaEZpeElsOXlNQUZLeFNUeWFISHM2VFA5?=
 =?utf-8?B?T3lPQTNnZmR6UC80cktVY3Q1YjY0b0RpYWhHYmZnZkV2Mk5jemdRTTBlU2pD?=
 =?utf-8?B?Ykp3ckhtaHdoVXp3TlppdEhQbWZ3cmVjaTZ1TFBvaktIZVJnd1F0eDlSM08y?=
 =?utf-8?B?YWNuMFp3cG1nY1k3bU5jMVozb0JsaHM2aVd0R3NxZzMzU1QxTWh4NlU5WGc1?=
 =?utf-8?B?TFU2Tko3aEwxaElxTDNid3ZZMk9vZjV6ZmZ0VWViY2pPSVRaZ3BTR0RJRXg2?=
 =?utf-8?B?WjJjSGo4TmMrYXg4OVB1a3NxcjJwdkpGOTlTUWRXc3pVVHhFbHNyQnU0T0Yv?=
 =?utf-8?B?OWUyTUEvZUJMSFI3OW02bFJlamJsRWs3bE5XOXZjU2ppVWVBbGtUTlRXWlZV?=
 =?utf-8?B?eVJIQlQxMjBYWWVLVlhSbmVYbG9zaWYvelQ4S1NJM1N3amxadStvTVlOakJl?=
 =?utf-8?B?czBpdnZyS0NNMDhCSEJDeW8xUTZsNERxYVczQjJFdHJFUnFjK3pzQjkwajB6?=
 =?utf-8?B?V3pKOEIwK2RzQ3lwdkEwT2hzbmVpQWdLbjh2TVZ2YndiUVBQNERHN2paeFVo?=
 =?utf-8?B?aVB4R1QzdXhwRWJ4eGdvajhDL1R0WnoyazJTaFBpd3hPNi9VVS9aT2FOSFRz?=
 =?utf-8?Q?lyyOXHsQOF9IipfiQo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rnk1cm5DSDhqYklsR2ZhNU1WWlFFaG9LUi9JL0ppcVp4N1dlYnNmaUpPMVZt?=
 =?utf-8?B?STRWL2hCT2I0RmgwK0R2Q2JSRWxEMjY4cGp0OUZ6S2JhcjBibzlIdWtnbmdx?=
 =?utf-8?B?TEJYWTRlbXhHUHdMcktnbjFiN1dHUE1PMlAxckRUdVJMOGI0QmtBZ0hCWVli?=
 =?utf-8?B?cnhXdzM0dGpkemN2N3pGK1h2RU5qeXR0TjAyc1BPVUl2KzlFR3hkRHlJVlNV?=
 =?utf-8?B?SkhKUk9PMk0xTW9QcWc3WmV4LzBaM2tjWXlEZDJzS2xFUVl6TzNkTERsZDRn?=
 =?utf-8?B?eXZicFA0TGpnMnN6Q1p1Yk1ZRjQ2SXA1N0xicE5qUVRMdnQ4aEFxa0VDNXFj?=
 =?utf-8?B?aDAwaEVaMnRYZXlsRU55VER4UlNtdlBybGNoNXo5eDhZWkdwY1FOS2ozMTNZ?=
 =?utf-8?B?L0NUKzZQd1FXaDd6L0J3bHBRT3llSStkRkdxVFNmVHNObytVeUROdUJQa3pJ?=
 =?utf-8?B?QmpmdTQ2LzVkT2xMSmM4N09PcU9HNjl1UUFMR0Z2RnBLVkp0VGp0bmdqMHVa?=
 =?utf-8?B?RzNtS2cwQW5HN0RFYk12YWZmRUlhcXBadTZWUkZBbGNrWFAyWEd3Q2F0L3Ra?=
 =?utf-8?B?eW9GenNldGgrcEtvRzgyL1grbEFwMUtzQnEyM1h2Um1vVE94SWFMU2FSc2xF?=
 =?utf-8?B?Y2dOQVBveXM4SUVVMlJlZGRNWXBYMVVFYXRaQ3BsNWVmbWxZaWdJS3NkUTBL?=
 =?utf-8?B?MzViOGpzRHZJVnR1UmJDS1ZJVWJSbjNFRW9kVUN0R054cGJIVTZ5ODhtdEND?=
 =?utf-8?B?aU1YSEdubGtMU1QrWGhQSk1GTSsxYlY3K0ErSHRJejI0NDdYbmpVYUxRM1Bi?=
 =?utf-8?B?cDBUQkRQV1NLeDMwNjAyaW1IK1BmTWdsbjA0VnlHblhRbmY1cUtwSkZPUWJN?=
 =?utf-8?B?M1JwaU10VXJoa21CdEl5TTlhWDYxOFpOQzFHVFUrdmc4VE9IbVRhdldFSkQ2?=
 =?utf-8?B?S0d0aVJ0VWUrSVViV2RwalYvbmt3VHNhbXVoL2V1dml4QzdVZi9YMFRyRXhE?=
 =?utf-8?B?cEI2YlpmYmdtdkpiaFJnRytPUDlrL0d5UlhOdEVUREVHN2E4MzJZcHBDbEhz?=
 =?utf-8?B?S28wc1VvR1RiRVAvcE1PY1RCVFhMMW14NHc1Ry9TanNKbFdQc1loblJNamty?=
 =?utf-8?B?WkNaeEdXeUdvVTliam1FT3RWbVdOb2JIcVJtTldXbXVkMmE0Y28vNFY5OFNo?=
 =?utf-8?B?bXEzUTkwSlNvZzk1cTVVclpNcEZJbXdNWlhzanlldGVMY2lFazNpZWRJTHhK?=
 =?utf-8?B?Rk9PRWNNUWZmR3VFVzJoK3BPOEZuOGMwVUlxWHlWY1FVcUQvZlUyZkRidjZy?=
 =?utf-8?B?M2JpK3FmMzNkMXNMemQxMHV4ZXpBKzhzQm84S1d3eWkzOWtWOWJ1bWkwSUlE?=
 =?utf-8?B?VStQeXJkVzd4MDRoSEE4R1ZwenFBcGc1cGZieXA1OEc2NjA5YVdaMFhIWGVl?=
 =?utf-8?B?VWhKeDN2SVpzdmFpUGNpY0ZWNlhlL1l6aGc3QWZrc3BPMk04UkFxM1daNnMy?=
 =?utf-8?B?UTc2RXJqMHpkdkQ2UGczUTRmVWpUSW9TY2ozWVFHUWd6elRGYVFtTkNMOXVW?=
 =?utf-8?B?eklxM0JKbjNaUml0Y1VzbVFqMkJXS1JiZUFDOGlLQ0xXcUZBTmkvM1ozNnpn?=
 =?utf-8?B?b3BKYWVROUMrYVBDUFVjUTR4eW5lU09vRnlpcHl2M1QrQ0c0OUZPejNQRWNw?=
 =?utf-8?B?bmNBbkNGUlUzMjlVVUk2TW1oSkJzSk9vbFQ2RlhicU55YXRhdnM2QnZwVnIw?=
 =?utf-8?B?SkpTRzJWby9kb1h6Wm1vbkt0YUlpUFV3NGhaek5Pd0tuUTg0SzRqT2orWjBH?=
 =?utf-8?B?ZWtUelB2T0VGbmh2a211ZnpFWmRpNDZIejBybStTQTJnVmRhUXdKelpmMksr?=
 =?utf-8?B?dFlUVFl0clRWcTJ5RlhYbjQ0YW9rOEhGai9hTG05cFIwdml5QTNGREc2czd1?=
 =?utf-8?B?dWRla3oycko5K1ZVTkNKMmJvdlFtV29td3VYQTk1cFk5SFQ1NS9YejFKTWM2?=
 =?utf-8?B?emZPZ0g4U0RvdHZzbjdVSlQ0bEtMYVgyekdFVUw1cGQ5anJVT29vRFIyWjJ5?=
 =?utf-8?B?dDFpSTRGejk4OGU3VUN0UXV6Qm9sZ1I5T3N1Qm16ZmI3eC8zY0ZuZWFlUGl1?=
 =?utf-8?B?cHAvUS9IQWlzSmxRT2ZUdjJNdFB5WVBGLzBYQUxhU3dMWnE3K0dZL2lOV1Rr?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb5f2cc-c608-4c5d-9784-08dcc1d8911d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 11:58:27.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RahztPp4CluQ8vICdqypw4DkSuYAh/83E+qYLPLmGydocx4/5sIYAlsLmq/YWnVDbWoiWAsTPs7blr/FLQm8Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7793
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 11:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203585

On 20.8.2024 22.19, Alexandre Belloni wrote:
> Hello,
> 
> arm64 fails to build with this patch:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9356/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4727/steps/13/logs/stdio


Thanks, indeed it seems that on the older Debian build host, the 
mountfd_api requirement fails for util-linux-native recipe:
   | configure: error: libmount_mountfd_support selected, but required 
mount FDs based API not available

Ref. 
https://github.com/util-linux/util-linux/blob/v2.40.1/configure.ac#L1315

I.e. failure stems from the added explicit 
--enable-libmount-mountfd-support option that extends also to -native scope

I wonder if there are any proposals?

-Niko

