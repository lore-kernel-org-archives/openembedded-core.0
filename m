Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E99BC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:19:20 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.99])
 by mx.groups.io with SMTP id smtpd.web11.465.1714670352738899217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 10:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MbuvZkCH;
 spf=pass (domain: cherry.de, ip: 40.107.105.99, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0kCwnS9dYK5Z1nB6mYna+4UEI8wkePjOBtMqR5VK9FwBJeswBzXkldMdWdagNHh3WdDHZPRTZ9K5oLWNE/paC2m+C7L6/7Bud7gLmewONvUgR3gBB7C6z3sTt0kSXHCBmvxwVop6Sjh165SwB2vDVFaNllHQ5he9Xdghz8iXhpJ+COtdGkXACVucqyAjR2CAaU1qql1s+4iuFECJlEez0fNyqnxNg/qGMRguWGiaFKECazVeEnYxWGrNP7Yyd/++PQ3aGtiSwkf6Cc+TMCLBBFLiyOI+xtB/+g9VbF9SCutTOY4GoIt+S7h9epofZWQ1UPIETWhgVFCwRx1cCjn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rO4ukkgxUyLQHrqapjfIqG75hrRbZ9uI0Jid1hpr8k=;
 b=dH7Ch1aBCHxdYfBomwtKKn4oIa5QiBB4mRkT374q3OQSAXwWmHQbGC0JanmN0z+dICFRpXjFxVWzquDQaM0e4Zrc69Ix77i9FDiMsPiZYSOQe9NT4PihWmzRfqSx9ryyjhbms4QDYJOF3FozqeILjJnrsSJW717fvBaju5DI6iqn7NkFyXQKk6OtienhmI9F0gdkfmLE2VJT1/5C6ycYWhmsdZDpzdo70gMxxFXUupET9QU90GG7mi1AkpGxSTGqlX6mvsTKJCclwBsqvT9NDb6Q4VXCUA0FNPfVcKx0vri+MYZS11ZKqdnJzdZK2w6HTB3LXCXZu10jykdiKYmgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rO4ukkgxUyLQHrqapjfIqG75hrRbZ9uI0Jid1hpr8k=;
 b=MbuvZkCHiYbYATO9wwY1j2O4UlX43S9MXFNQRzkXJK3Klf2kNirLxajIVXJTBAK4dHuw1UyH/g6BkKeNr4kwEzDSHcAKI2fTI3qiE1/Aq5SPOJa+RnvudvVIh/awZs6+RJbA/aKf7EEWn+vmTgOzi01tH5yWJRH6+V6C9PfRbc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by AS4PR04MB9716.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Thu, 2 May
 2024 17:19:09 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 17:19:08 +0000
Message-ID: <af6e8a05-7c2d-4310-9414-a747593275c7@cherry.de>
Date: Thu, 2 May 2024 19:19:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ipk: Do not hardcode payload compression
 algorithm
To: philip.lorenz@bmw.de, openembedded-core@lists.openembedded.org
References: <20240502142716.2112863-1-philip.lorenz@bmw.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240502142716.2112863-1-philip.lorenz@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|AS4PR04MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fb08e2-d89e-4b05-9ffb-08dc6acbfa01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3NxRk16M0ExUXVMaFlHT2V4UE1Cbmc4VXMrOWVabG5IS1pMaGxhditNL1BD?=
 =?utf-8?B?YllLZjR3Ni9NODJESURaUDd5TlY5amZIQWtqSHE3b2wyeXMxYktSaXhPWTZY?=
 =?utf-8?B?amJ0Smh0TzFoRUU3YndrQmRRZDlmdGpiZUVaR3A1Z1FqTHRkb3IyWld2disx?=
 =?utf-8?B?ZHhnSGg5S1lHaGpLSWFJdGVuWmxCc3kxMll4WEJhUkNjVkMrN0NJYU9wUStK?=
 =?utf-8?B?YVZienllMU11NDVFRlNOQ01GT3JZS0kyWW56MlRud1JsV0dablVZdkM1RU16?=
 =?utf-8?B?S0hMM29SYXR1OGRmT1VlSS9Qbit3NlJFTVUrVUlaWDdmUWZZTFlyUGIvV3Zq?=
 =?utf-8?B?VUlKdEI2L1JEazc4cnZKa3Q3UGNwbFRCMittZjFvNjk4MTBZZDd2cW9temp4?=
 =?utf-8?B?YlowYW5VeGp6aTBXdFRyYmRPQUJZRzl6cUVrT05QZnJLMXVnbWs1Q1pkN0lJ?=
 =?utf-8?B?cWZuN2JOak40eUFuNjAvRWtPbzIxZUhydk5FOXdrcnRaZ1dCUS9mYnU0Nks3?=
 =?utf-8?B?RWYwaGFOT2Q5MnJ4Z0dVRlBjMERtc1BlRlVVbFNBWmJrU2liWUgya3YxYysz?=
 =?utf-8?B?QVZFWmVpWFZ5M1FDRHpkcGdrME1nYVBQUVVoNC8wRnpuUzZ1R0V6MWh6UFJP?=
 =?utf-8?B?S0sxT2dIbHdTUmlQc1dwb3JGcjI0RnlnSHU3Z0NUQmdRNlZtMGk0czhTMGZ0?=
 =?utf-8?B?VFI1QmJMQVNnUEw5WmhoMTNoRWVaYjFBb2xEWWtyQ0R3NWVMNU9YQk5zbkFr?=
 =?utf-8?B?bzAydTlxZ2haK25ub0VSUU5GalpiQUZpVWFnNkowT2tCOTExNjdiaVFKMm52?=
 =?utf-8?B?MXp6eEdReFMwUWxhcjdlZ2tPMWU5Nit4R0lDdVBmVk93UklQYXdER1EvSE01?=
 =?utf-8?B?UGtrQmNHQUpOcFFOSk5UMmFFY2haVDJNTHFMd29RZWplMmIwL2FuT1hKbVlB?=
 =?utf-8?B?MEpwSm9XS05DckRJc0FKbUtkWFRWOUxNZkFHVU02T2Nya1ZGdGp4YzFldjMv?=
 =?utf-8?B?ZG5jVytGOVZ3UHZlemFWSDMrUGRqdTlCV1Z2QjlZM2J6YUZ3Mjc2c2ZtOHc0?=
 =?utf-8?B?M1VQNkhNZlNpQlNuUjNCaEdaWHRaSVE3cUt2RjZHYSs4YklmemZUNGZQMTJC?=
 =?utf-8?B?bUFVTDRROU1ReVhoa3FGWDk1aW1DYjlOUHR0TjJTVzdHTnh1VWFNanRhS1l2?=
 =?utf-8?B?UFdOQ3ozWVdELzVzRnhKdG1JVUI4OENRRDVwZS93QXd3WUJZb2ZlRkxZSGZT?=
 =?utf-8?B?RjRhNlkzVzRybi9zUndyN0JMcXlEcG5ycng0ZEQzb1NkQkdiYzgySXdzNFhC?=
 =?utf-8?B?b3VkeTRqakpCb2ZXVzVzK29aM2gyVytHTjVLYVlLS0xjVWdsSkpuVDV4RFFK?=
 =?utf-8?B?UGh2RmIyeDJQYTFBaWEzbFgzRlF0QmpIM1R2MTEvN3ZLeUUvNXVaT01wYWxU?=
 =?utf-8?B?R2NOcjd1UHZmdjdIdDRwYmswMDZJOU9IWmFRbTM5ai9qMFRYTWJmY3hVdWdX?=
 =?utf-8?B?UnVNTnFQRnRQY0dZNFgrY2p3T0FyckxPVUZOUXFyWk1CMmpZMnRhUldmd0Jl?=
 =?utf-8?B?cmFPNXpXdGNPbzVjLzcxQnRJN1kxYWl4UndqZjdQWVBXL0FSS0lLaUtsOTR6?=
 =?utf-8?B?U09xRi9wd2ZpejFBcGtLa0h2R1laZ2h1RmsvQUt0cTFHYVV3bWhZeDdoZTZx?=
 =?utf-8?B?VXdMZmJlRXBRNjJxdVk3RThQUGREb0pjUnN1SGZNeEUxYThSL2RWQ09nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXQ3OXE0VWNReDYzSU0rQyt6L0doWERuVGZyRGxrT1ZGaUMza1p0aHgzYUIw?=
 =?utf-8?B?aDNPL3NEZVY4UFlJUHlldE9zWGVkbTN1QVkrc1kyZThtQnlsVzVsV1FBMElt?=
 =?utf-8?B?Rm5NcjV4YXhiM1FuSmRHd0RydVd4NCtpbzN3VjFSTEU1MUR3Q2svdHgvUmJU?=
 =?utf-8?B?clU4RlRGNDhBVnhCWUZpT1BXK2R1MHJpTEJkRE15cUlqL2IxMytla1lDbjND?=
 =?utf-8?B?Vi9LL2FvTk1CNG1BRHZaOE53bnMzaFdtQlhyUkNqYXBVa1M2cWUvYjdLa2c4?=
 =?utf-8?B?MUwzV0d1bEU1ZXJvSnFlTUpZVUluTm1Ra2lNT0ZKQmNDViszUy9jc2h4VU8r?=
 =?utf-8?B?NzFjM2ZNcWluZDZkWis4cWVwdGZLbzhGUmJZZDFiTm5XR3VBQk9qWFMxMWN3?=
 =?utf-8?B?eDBPSGIzTmREUmlkOEpNZjBDRVhNQzZXTE4zVEpDRHBBbkNOb0xhN09rWWtY?=
 =?utf-8?B?UFlneWxTREJQN21EY0RDcnRVMnJvM2VzWkJTdUhPZ2FlWGREQjZkUS8vNGFU?=
 =?utf-8?B?bnQ0OFY1bWtkaVNqTGZ5NU9TdnkrNUFtL2ZCMmt0SWNOUGJtcmxka1N5Y05o?=
 =?utf-8?B?RkJEdUVwbWJoM2tNVjdQSVNQNzNFWWt3OXF2dGNYQitPbytlNTQ1alpialkw?=
 =?utf-8?B?STZPaDV2T1BxQkJMSDExOUVQcS8rQzJ6RzI1bHlpMlFKY1B0dUVBUDJGK2I4?=
 =?utf-8?B?SGRMUjlFOXdoRGQyQjIwWmVRVDAwSjRxd3lheFBEeHE0VVJyTEM2QXlDZzVn?=
 =?utf-8?B?M2JvelJPS1NjeWIzV29lWlNsRVhnSFVSK0F6K0VCVlNwTC9RYmNoSnRCUysz?=
 =?utf-8?B?elp0OVc5b0ptaTJ0VEVlUFRTUUp3YlZOb3h1Uis2Tnc2cy8yNWczcERlVEhh?=
 =?utf-8?B?SnhiTGtsL3F2OGVRaVNLTHRQLzVydEk1QnpFM3AwZW1XWVgrLzJTelcxR09y?=
 =?utf-8?B?aFJtZVZmN1ZjeUxYUlVoRC94YjhtRGwwamdhVUNqRWc3emhkNVZaMElpQloy?=
 =?utf-8?B?aVZtaE5MZkI5MU5OYUIwczF4ZVpKZzN0ZUM5L05uNkpJZzFxeCtKblNUeW1a?=
 =?utf-8?B?T1pUWWJyVXFUMEFYZTVtemwzMW1qdk5uYlNQVllWcURnL05EK2ZlbHY3MDRE?=
 =?utf-8?B?emJkTGRkd0ZpeU95UHJwNll1dG1nUXhoYS9aY3JNaFI0ZG9SQjJTVWJMRWhp?=
 =?utf-8?B?cndYMlVyRjNtQUxVQmY1aUMwby9xaExJLzBKSm5abW8ydFNEclBvWVFPbGJz?=
 =?utf-8?B?aGxsZmswVXpjQnY4L25VV0RPZGcwZWprMmpJT1pNN0xXVEFkbityZExPcGhn?=
 =?utf-8?B?YkZqMzJyb2poamVxL3ZtVDA5Uzg2VURmQ040TTYraEsrMXZpRGxNRXRpTnQ5?=
 =?utf-8?B?b2tWZ3lLTldvZFY3bjFnVUMyVmVHcjF5SlBPTHVYSW1kL3Y4SEZ4ZWFHa0N5?=
 =?utf-8?B?SnYvQlkvUTdGc2JxT05nV011U01GV2doQ2QwNE9nL1hzSm9CTDVHaG1YRDE5?=
 =?utf-8?B?RzdKZnd4T2daaE9ZYy9hdGxvT250Y21Ga0x3ZjRmTWg3ZVIrQVovSE1wSTFJ?=
 =?utf-8?B?VWlNMVovVm10UU5pVXJINnpiaThaR3YzR2hXMW54MlU4UEppaTh2a2l4STRo?=
 =?utf-8?B?Um9xbnVaUWdEZXFLMVhHd1VjRnN2MVUrVi8wQVBsZ2ZOQWlveTNaU2pRV2NF?=
 =?utf-8?B?dWltZ3lwMlRHZ0xmMGJVSXJQRm80YUR6cmVOWDMyVldXOEcyMTJSRmE0Z1Nq?=
 =?utf-8?B?Z3ZGTXVMazE4VlJXSDVTd0N0SjhzbzhKWmpBVHJDV2R1cWo3NCtHTEFyY2x6?=
 =?utf-8?B?Q2gxRStIcktycXp0SVg1WVRlYVliWG4vc2ZzdUtjR0lLVzVoaE1ya29Uek9Q?=
 =?utf-8?B?ZmZCWWdwZER2MmZXcXVxQUNSK0F1czZnV203ejRMK0ZrODlkbS9ZVlRZZjB6?=
 =?utf-8?B?WDRZaDZmVUJUOEZFQkJJbGdpdHJibXRpZGt1ckF5MzRtMC82clc5d0VrQ3pX?=
 =?utf-8?B?cWV0TnBnTlFSRDdTd3l5dFk1c0N3ZnhzYmo3ci9LNkQvSGZPZ0puQUhLOEMr?=
 =?utf-8?B?YzB6eUwweElEaEpnYXg0bk1iSGdtYVBzc3RpUHlHN1JQUW12dVdzTFcra3d0?=
 =?utf-8?B?TGpxaysxQzBqd3pXVC9RTzhGTi8xK3NuQWx1N3ltZWRVWjRrWUtxRjdPWFdi?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb08e2-d89e-4b05-9ffb-08dc6acbfa01
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 17:19:08.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1hL4ClRsaVSHlCh9qEQTUG2mLqM0XW/St2+5Xl5sBzHy+RWz7xN6Dip279wXE7vUXwMLIGVi7PJl9dcvlnv4iFo8ghhoPr4E5yvHkmkDxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9716
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 17:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198929

Hi Philip,

On 5/2/24 4:27 PM, Philip Lorenz via lists.openembedded.org wrote:
> [You don't often get email from philip.lorenz=bmw.de@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The chosen payload compression algorithm can be changed by overriding
> `OPKGBUILDCMD`. Ensure that package extraction deals with this by
> globbing for "data.tar.*" to select the actual payload tarball.
> 
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> ---
>   meta/lib/oe/package_manager/ipk/__init__.py | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 8cc9953a027..0f0038d00d9 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -4,6 +4,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   #
> 
> +import glob
>   import re
>   import shutil
>   import subprocess
> @@ -134,11 +135,16 @@ class OpkgDpkgPM(PackageManager):
>           tmp_dir = tempfile.mkdtemp()
>           current_dir = os.getcwd()
>           os.chdir(tmp_dir)
> -        data_tar = 'data.tar.zst'
> 
>           try:
>               cmd = [ar_cmd, 'x', pkg_path]
>               output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
> +            data_tar = glob.glob("data.tar.*")

What happens if we have two consecutive builds with the same build 
directory but different compression algorithms? Would we have two 
data.tar.* matches?

Basically, I'm wondering here if we shouldn't have a way to extract the 
compression algorithm from a variable instead of trying to guess?

Cheers,
Quentin

