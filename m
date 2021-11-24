Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88747C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:20:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.98])
 by mx.groups.io with SMTP id smtpd.web10.1048.1637774445783455159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=D/qZREMr;
 spf=pass (domain: outlook.com, ip: 40.92.90.98,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev5GHg2qEDOX1FMc1uSbIk8TjiQpDhbN9Z79PMmQdENWGubOzchmLjhrXEYJtTyNAIFlvA6t5rea0ISUhz+AoZzYdl95KuKLTLjEMLm1nYqDaLFbDUKcXrcBvSrPJJpzm4ZN31vRqWJ4Tr/1xQouRwfQo6wOAgUYR2Jb+wSotnsLbbrhbAtNzisBKacolyhmLFCh48lUEDKuHlfjPWaarFAVgsYnZ03ig3YZvSa/VnsUTHZZK3MqlksfJ4jM4+oLkarayyt14QvQ8VybiqZe62vxX93xKvLUhPeCHDRFSILxvtQIJa7eNqeBXSLHsdfwt1UoXwhvRsfEnHdoaMHBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZqGki6qQioxOv+ztlcy5OrVyZwboyrIli8kyr3egHU=;
 b=EL+uQEdvniC7S7EW/jivEy0LhHaDcihZK7DjyJEpB2ye9LphSWIkwIx2Rc5t5PLYE5onC/w8l2aQkANy5QpQ2F+OcjBrD+H0ci4R/VwXSjyV5cMPgzZ/3sffXMUlhl93Hv0ls0uwnhROVO3FsAw4CZ2UmcLsJwCiG82Fu+HDHkU6z6+rA5FaulQvt1lnYwhxFoDb/Z8n2F7xP20mZKY/ezM9KstkTkXXSOhl3T0UKzWw/B8GjFR3SJcYhptSchuWfNmESwZybQZnfV3IuBkiVGqO8SG5bETSFeO1BP+LNao3iI5swD0no8A/nRUmiiKlhJViLOkVLCEM2qJto960lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZqGki6qQioxOv+ztlcy5OrVyZwboyrIli8kyr3egHU=;
 b=D/qZREMrZwfu98XXAHWKJyPxcf1sb/nPjex6sjSSFrE0JFCd0PBlF97T0d5H5YFLYb6G7zABBfpbtI85j5D/fhOwzQo+dyDJrqyjdQ8OKJNWbkzhUN4oXy+7UT97yy7WajHJj5obN7DU1TgTurHzsTTXhw3z0YY3GZA/nupTKDiFFRDsLrRRxNSJzOtP0d94AbFp47WRyNZe+G038GQDprn9fvT0ajPiX6kkTaTr11MhQkdApdgegwM99FiKmEI41YVkXkUDW8mnQs9tpB2wGC4wZCiqhQ1aH9bivMql+SyJHi0lh7mJevMNPpTk/0iUmRPUvZa4trNX0ASg6ACyyA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2705.eurprd09.prod.outlook.com (2603:10a6:208:127::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 17:20:43 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 17:20:43 +0000
Subject: Re: [OE-core] [PATCH 3/3] oe/utils: by default cap cpu_count() to 64
 cores
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20211124171529.4107434-1-ross.burton@arm.com>
 <20211124171529.4107434-3-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46426C98A19F3C79F8094367A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 24 Nov 2021 18:20:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211124171529.4107434-3-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [1H+jU/h0Nrsd/ZbpzXZn8LNmSWrBmLz8xXVrSdGidJlNPntwXVq6MuYCiMH5fQLw]
X-ClientProxiedBy: AS8PR04CA0144.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::29) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f333fe5a-7e96-8128-be96-ac09b69c6809@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AS8PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:20b:127::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 17:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d882d8a6-9a89-4530-b468-08d9af6ebeb3
X-MS-TrafficTypeDiagnostic: AM0PR09MB2705:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u8/SxlceEt7R7aRvb1fqubLqIzY7maCDodKzZDGqfIfoz4lge88DWS7ddElSXMpHU3IC5jJ6tf8590bj/+4EFWfHzKs2KhtFSBWxacH8YJejRd0YILXAWBVul+rZsN4m1hkOUNi9AcjNJSDPOZSjo1qirfX6MT63vgZzyIf18TeyNMSTah6FrFaM1jTGqcge4kDTnpzT2eIw2+pnpZCW2dIlnG2a4gqxVPyBQlzVI1WglB8HSHM5k2PtKEbb5YUbBgPxWbhp/DLT88umeEGV9rW2qdD8zcvuenYU31DvwqD43rpNsQtORCZ+2WPHdg1SYuboMJcWcVT3r17rZC/TWY5jnVxPSOH70MPNEY3I1lC0phyoN25V1gfYOpeXo7vAyg6L7WH/Do4GvRV5fZQp7IBXz6exRvb1i2DkkddQq9yvzB4PuOpHtTqXkwb8ounOXblquGRRxXjlsJHKCiYusV4yxag1MyFPYVBf1BajW8lhANM35YDPf+EQ5YFzknoRS6E5RRYpZKngww4cm67tsSWMq/PbRJBY0jlcVn+fGploJvIdhMDbRTdPm1VPBoat4bhZxgdwUvwqywGw1t7B2j9OTJ6qWwQd1Ke6qLXUZDnsYnM8LwuPCzUgTDJXCs0yexysgM137NtZw2ts75W76wxNSn2z2RgQEPasmLJPYMg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mrvybSRBl0+QbtZYfiy65U+cTVgA37VCpd39ElP4qLbIE2+QG1E4T1lmvCG39BDMvjYpuFYH91btdYZQycE3c/112b5SbDw+ylIdYDLh2QOQI3jA2OUQSHjiDTlw2NycdLyg4L16RIh9qz2VvK0Qtqg0UV69jslhDvuwG/xSkS8JWdtX6JaCupSti7NODeMJeqLxAFelhdj0aKFSCzzvWBCBEvoxUfMLWJY8oqsYxfsx8NonXcghhWenoNihZ3qbtO0jM3fnQ8vQ4vsAPXvc/lGE3s8xXm/0ihmcEMK11Sl3ffyVdRYh/9p40ZKv+1WqE2RDK+K/O5IEa6U9BaPhu8fCeT+viAo6Sda7MXw/bRU+ELCUwlVwNTN2SaeqBLjpxXQGmZ45M42SwhJQQpJoTcBG5fnvnqBvB8vz89ao5uM7KfGVNxzK46UOwNnF1bXYX5J90e+XMgcbmUsOfKeMBuVEb4xHn6WdS+Hh3Bm3fONt9lQz38EFO9pXKXT0St7nV3lYzuTZKT8/hvY4J3M7AYomserSqff1gXjFWhkrhXpvQir71XDU/+m8lziWKnG7bDuttDyi/UREi8TxmKfABvxmw+NZI1p2qCyUuPjvJzhdFsyqUS+hXEecZsdaTN7a35P7l7qKuIdmlxienPF9AdhWhtOfijMUcW4Q3usOGYjSiD/xdjUkJhLfNq8tE84R6NM5J1SJ4opOndRoktw+AwAPBDAzORHm5b4skpdTykUE0z83h5TvcqCuRvVapjRWlIF9Up4sXgy8/YQxf4a6Gw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d882d8a6-9a89-4530-b468-08d9af6ebeb3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 17:20:43.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158732



On 24.11.21 18:15, Ross Burton wrote:
> Larger systems may have large numbers of cores, but beyond a certain
> point they can't all be used for compiling: whilst purely
> compute-intensive jobs can be parallelised to hundreds of cores,
> operations such as compressing (needs lots of RAM) or compiling (lots of
> I/O) don't scale linearly.
> 
> For example, the Marvel ThunderX2 has 32 cores, each capable of
> executing four threads, and can be configured with two sockets, making
> 256 CPUs according to Linux. Zstd using 256 threads has been seen to
> fail to allocate memory during even small recipes such as iso-codes.
> 
> Add a default cap of 64 CPUs to the cpu_count() method so that extreme
> parallisation is limited.  64 is high enough that meaningful gains
> beyond it are unlikely, but high enough that most systems won't be
> effected.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/lib/oe/utils.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 7982b2b511..136650e6f7 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -248,9 +248,9 @@ def trim_version(version, num_parts=2):
>       trimmed = ".".join(parts[:num_parts])
>       return trimmed
>   
> -def cpu_count(at_least=1):
> +def cpu_count(at_least=1, at_most=64):
>       cpus = len(os.sched_getaffinity(0))
> -    return max(cpus, at_least)
> +    return max(min(cpus, at_most), at_least)

I like that patch, 64 threads seems a reasonable choice to me.
Can we somehow have that documented in the migration guide for instance 
(??), as I think there may be one or another user out there, that will 
notice a change in their build performance.

>   
>   def execute_pre_post_process(d, cmds):
>       if cmds is None:
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158731): https://lists.openembedded.org/g/openembedded-core/message/158731
> Mute This Topic: https://lists.openembedded.org/mt/87285695/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

