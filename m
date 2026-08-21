Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8C8C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 10:44:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4757.1787309079714360481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 03:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EkE/mVqy;
 spf=pass (domain: cherry.de, ip: 52.101.69.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muj6YFJGpakW39K2dIRoWHApUnJ7L9+i1q8sbefQeappgmObRmKdrZFInckasT61Gw7Iao2g2itSnvOrF9xJDRstGP4siHFYKbsFVoRFJ7ZbrXNXPx1o3xI1Uwkzztvp6Qccs3lLOh9+oLvR1gNk/ctKXxkzde5q8jj/PBSEAAQjpTL8NL7e8e127LSaFRJEjjmgsYctda78Jr3dWxO4u8S2gfZqWCNzi2o7lWb7Vpdlvk8uygMcghAh7nM45tOjc5FfGwXcSkkeM1/SiYVWpuwDPzqQI7BO5hlk43JFbDX+DZfsbRzNVW2WkQoowf3bxg7aJkWCW9VRSjdYk2eF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAVIGQwex5x5xSgj/p6ZbtE5GZ/fEXy3alCtZ0itP3k=;
 b=daH58PJC9emKhFAh8fw8aISTm+TsS0tS9PfsJ0xSFx4CilOWqWLB7Iw9jFy1Rmy8+RFaFaw3o1IF9syH0gxEVdv3nB4pBpHpdyOWUVIgnQKDFBIkgemz1/oKi5P1yKAG9yO5po3zW4SzfY1PoeWQL429r89M+qTAtbiqZj3OL3gybsC2uIudfSrHznrLCquKjvpmc2yqd/eu4L7CrjMpTBPmxmom8nWR77k5HOCDXOV0Hk1RiQCvKBJwmg1X7uVnQ6z+JJWjbgUPqdE5EA2s6TkzLroTND3AlVbf0OiPviWEmCFSt/H2/OnYqYonshuwIfuItHa/KnLpCoh+igMBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAVIGQwex5x5xSgj/p6ZbtE5GZ/fEXy3alCtZ0itP3k=;
 b=EkE/mVqyi6+0stVNolhaGi3eYw868nYMTvtL0NPk5Bq11xCVq0ir6IZ2zyiE1f4GHB45T9INRZfQrjBbhx9+Yk5ZI9OgeeaX4WB6rYGSqlTuOLls35N75rP3wHMmRE9FDmUF9FK+1qHeTurdcah9XpqLIC3tITZuadReAYOl1+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB8468.eurprd04.prod.outlook.com (2603:10a6:20b:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 10:44:34 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:44:34 +0000
Message-ID: <129f0895-a360-4779-8e7c-b05cdf9cd052@cherry.de>
Date: Fri, 21 Aug 2026 12:44:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 6/7] u-boot-tools: fix build with OpenSSL 4.0
To: alex.kanavin@gmail.com, jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260814051829.35088-7-jaipaul.cheernam@est.tech>
 <CANNYZj8GmNHAYqpZi58UFtC4wOVcgqz8veCwUNfR_sNoNAu_FQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj8GmNHAYqpZi58UFtC4wOVcgqz8veCwUNfR_sNoNAu_FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0159.eurprd07.prod.outlook.com
 (2603:10a6:802:16::46) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4cd76a-b0d9-4990-8506-08deff713055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|10067099003|5023799004|4143699003|11063799006|4133799003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MHs3UBgjT4+7UI6UOKIHYPJbfPcP1Np+0LHwMQhoxLlXDxS9SDLXs0q6+D+/AfbEm1smgI/DlR5x3HG5yyLuUTpePTNXlCfIAROUDRhyMamJgVBZW9PBHdNlJGg9GeenZfJxsaNAkZSRs+40scGXykYrjqSads/bpTyslpbi818Ro8A5jTvhET1SU1H/Y37BqemWiMKi71AjwQDL+O8O767xSk8tFKh1jNcf65SUHqhPW3qiHJ1MrWpiwO8TSe3tb549bTk/Ei8CHuSW9Qj2NL3dSTzU0yZ7Bqx4CckGWfAtBUDfV54Wq3KfeSNmshzvq74ZF/Tdr6AVOE2EkNTvC9EDkgpBYYwdMAFWfEl/jWPoXX0Q1cvMPKeXwZaFQkD/1iA/65SuAKkCzA1BkHxlwBCUK/7O8cIa0bt6AAlw0sse+cO+S39zHWePTJ4aeALhcHA9FovQMerybfdisADJznoL7anOXEmo1PWcoWcNtMsmL4RDCbFkTn1rlQwtwIZiho8bQVEJsjS4NYp/2lp2fr5nVWobNyfMhU86LbuC1rlZevM7F2cq24+v9pPtA2LH5uKb6VTRPnGp1zdXPjiTslAijf7w3iGWnuOc9XYJLmZXjqnvZ+kZUol070BepPRvsCFZpIdG8ZbgYzO1n8haIAXrqgfHKfOyNljfjgbbXLs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(10067099003)(5023799004)(4143699003)(11063799006)(4133799003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnJJZFpad3Y4L01qSzNuSGFzd0g1NERUb3hzRWppRWZCdlJBUzVvb2FQZ1hr?=
 =?utf-8?B?YWNkTGRRczdqcDA3R002dUdpNGsyNkN0MTQzOHdNYkFGVGRZcVErQVZVVWx1?=
 =?utf-8?B?TFlMSlZEd2pjUUhyYUtVcks5RmFHR1c4Sm0zZ09Gd01aRzZWcXVTa1RESHNl?=
 =?utf-8?B?cm1ibWVPUWsxVGFYNmVkY3JaWk94UlpHdUhlTTVwb2doUlh6bXRLSktZV3ZB?=
 =?utf-8?B?N2R0UjhnM0IvdXAzZXZzSFZKTFJNN3VWVW5NMWtWN0loVjNlaGZWUXR1TlRw?=
 =?utf-8?B?S3IwUG8ydjVQN0dWOEprQnhQUExiRFZKTFNWeTJ5M0FubDVQckxkWklsM3I5?=
 =?utf-8?B?WTNIZzdobldabkg4c2JqKzJuVlVISldhQTZhY2JuNXRsZWhDUzRaRnJZbTRq?=
 =?utf-8?B?Z1FTZlgzcEt6L2sySFJrS2RLUnRXMzN0bGhib3JTT2gxTlJ0aXdRc0lvWEpC?=
 =?utf-8?B?a0doSjZobDVtUzllMDFsSkRQOWdUZ0RUemF2cGhYSG0xVzZKZVA3NDFYc0o3?=
 =?utf-8?B?REpvb2RxUElIaVhxc0R2SmpyT1VQOGVSQ200VVRFdzFvZlp3WWNtaENPVWlF?=
 =?utf-8?B?RXZMMTNFbVZTYXNsMFVjcVRuWXJQNDNFL1lQdFRsZVRVWmw0MHB3enBUVEM0?=
 =?utf-8?B?NXpBaFBvQ2Y2czg2NEwxMHBXYVNFVlhXZmFPSDNzellaemh4QXhxNlhLVjdr?=
 =?utf-8?B?YUcwVEJVQ3JvWmc3ZTJWMUI5d1p3Q0V0WDNJaHl5TnhDeFI4dktQbUlGM3dC?=
 =?utf-8?B?b2kxODVMMnlhQjZvUWxqWWZ0MElQMGxjMXNWakYxUVNLRWhKTnpRbnptTE9H?=
 =?utf-8?B?S2F2VmNnNHVHREV3QXMxY2MxVUQxUW1XdVVTYy9aZE1lQlRaVFBabzR5N3Jy?=
 =?utf-8?B?d3k0OERvcFFyVDZNeGlTcVVGenBrSlJXZXdRaWUxTjYzckVhbWRyRWRNVUtn?=
 =?utf-8?B?Y0pYR3VQNUNaM3JEeURweW9RZGhRQTJvWjRzb0RLNVlTSnFyL29ORktRQXk0?=
 =?utf-8?B?MHl4ZjhvMjRKUFErVjRZQXRZWEIrOHo0UzRVVy9nWlY3K2RZYXVsTVNRN0l5?=
 =?utf-8?B?RE5qWkM0QUoyMTZZbjRtV0lldGJ6VlZQYjRCaUwrR0tsMkJZTG9BdjRiejB1?=
 =?utf-8?B?Rk0xbGNzNzVURGhJN1lna21PTUo4YnA3YiswcnFwS0NhczlDSG8wbVhoV3hN?=
 =?utf-8?B?dVArWHJ4TWYvVUFFUFAvV0NzVHRkMmozeE9wWFZZSUJoMUErQXFZOHpsTmZJ?=
 =?utf-8?B?MFZHYlVDU3NpSWVEK25SY25nejVtQTZPL0NCRjI5NndXVWhIc1lSUTMwZnRD?=
 =?utf-8?B?MFNvZWlDVUFkbGQwdXlkbFFmUFFWVmhUUWg2eWJ4dWh0OHo1aUxySElSbWVM?=
 =?utf-8?B?RjBEdFdZYUFOUHVxTkx4VlduK28xSlNNWTZLQVp0M1NodzZhKzNybzg0bGdG?=
 =?utf-8?B?NlQ0US9mWm9tSG5yQldqUnpoQ0VFZE5EUklZMEg5Rzc0Q3J6bzNtTnhZNzVH?=
 =?utf-8?B?YnVRN1gwTGMvWmZZZzRxU2RNL1RxK0IzelZRRGp4cDRkNGt0Nlh4YktkNGpU?=
 =?utf-8?B?NUZmTFVwLzJucWxwU1ZwbGY3d01oRDFRa1lRRGtvTXFKRVcrZS9vOFJiS0RT?=
 =?utf-8?B?OUxwZnNzMnZWcGtVeVlsODMrL0IvZmIvUy9FS214bHVmQ3ZPcGhVSlVrT0RK?=
 =?utf-8?B?bWMwaHJxNGZlY0ZxZHBsK3NCVS9JUXBQWDlLREhCSXI5aTNtR3BacWJPWFZn?=
 =?utf-8?B?dkJRNUJ3dTJrcjM4M2RTVUlQSHJZTXRVb2FPa3FwMmwza1FremdMeEd2TFFF?=
 =?utf-8?B?SHk5WUVtbjhETWtROVJGUCtCWG00aEQrdGtIbTBzVmVnTDdjbEdZanY3NmJv?=
 =?utf-8?B?ZzBGMFhOYU1KTGhzSlFydmg0NUJ0UDdyUVpqd1ZGVVBkWWVlQ3JZM0NqRThM?=
 =?utf-8?B?eTczWm9ZYUpWaVdxR1dnMzR3K3ZuMGo5MjBrelY3c3hWTXNPZUpZSUdZRFYr?=
 =?utf-8?B?cnFYTm1pd3o0VnRQdzNGNjNCSlprc2x5U0lvK2VkYldTdXYwYmRhek45Z0hH?=
 =?utf-8?B?MjB6VVZsTGIybmwwNWdRRlFwYjNBekQ1SmNEd2JLbE5SZlFYbmlnZkpjTk1y?=
 =?utf-8?B?OXRobEpPcUYyaGFyMUdhYTBPTDBMdElqUVRBSTZMYmh5NGNHRHErL21YOUtM?=
 =?utf-8?B?Tkx3ZmZWbTRzem5SbnhFSkdaeE5sMVZIZXMzbDM3ZWVEa0F6Mzk0ZWZtYjUx?=
 =?utf-8?B?OWJCMWFOSVdGaHMrNzdacnF4eSsyL3NlbHRwdUtKSGVTcW93a3Q3ZmlzMDRN?=
 =?utf-8?B?RGtRbTRacEtSMjhvMkxuM2RWcmpUOVJXbVN0VmRtMmVKQ2Z3MHkzMXA5TmJm?=
 =?utf-8?Q?rhfX5Xzg2lmoA+twlTfOkcFy8VRMJqijTH83aQd/Kb/Dj?=
X-MS-Exchange-AntiSpam-MessageData-1: u5Gp3lt93NRl3A==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4cd76a-b0d9-4990-8506-08deff713055
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:44:34.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKfFqn4n/TryohOdXIa05DsSpUeDQIe873b/F/05FJJABUTrQHTiiR22bH5R0tJHpDrLF14RF5PgnTIJ/L4rUaMalxksjIQAGhGetOH3w0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 10:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243920

On 8/14/26 1:12 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 14 Aug 2026 at 07:18, Jaipaul Cheernam via
> lists.openembedded.org
> <jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
>> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/pull/918]
> 
> The pull request is still open and nothing has landed in master, so
> this is Submitted, not a Backport.
> 

U-Boot also doesn't do pull requests so this likely will either never be 
marked as merged, or will be closed. We (ab)use the pull request 
mechanism in GitHub so that contributors can trigger at least *some* CI 
(which differs from the one in U-Boot's GitLab, but some CI better than 
no CI), but we don't monitor anything there.

The patch comes from 
https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/ 
which is where you should monitor the status of the patch (and look for 
new versions).

Cheers,
Quentin

