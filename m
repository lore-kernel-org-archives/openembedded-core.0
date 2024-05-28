Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0206AC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:01:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.136])
 by mx.groups.io with SMTP id smtpd.web11.19506.1716894096450211525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 04:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IuCDuydR;
 spf=pass (domain: cherry.de, ip: 40.107.21.136, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaVLkqqrKspgIP9WuWmYqfaLQezeR2LJyBmjprR+G5JLGuWy6AXeES/3mLBhaA7VMdyGTdNumt0hBxpr0zOHSWyhdS9zHLCSe8NElzhGiMg/ZAANhsmwM7uhfljaBdJNhJ4RZV7ayNUwsbycRU4xFXW5Nrytzg8251WirlROhJjZfSVOM55f/IHScXNo7nufc14MBwNE06TpNgCb0fZ4YIOXDnlNhrfVwnyGJkDAIACbIv5ndL4jNvrF7ofklAeaIH30SNnNx7ojlfZjuQ71ZnKHFuLyJQeRLyJz0WH1Bctmpc6OK9hAZfuBIJ9+81RFLUenxEpWWgUBZOEda+RPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIoIhgGI9LUCvt2V2wYww2dYLgic1Lr0QMTTr9Mox6Q=;
 b=k+qd3ip1SA0PqFYMbHPcGEJ6WKFjURihmfm9O5CxhKQukMpd++uXQsBJBc2LyIRA0koGEYey+OeKb2lmveOoAUblUWwdmtROcrMz66upNR5/7mLHUnErg0jE2G12Ch5fWQHFKxPQUbgsEGHaW3SF56hFY/bqT3BhM0Y+j7d6SwMUDac8uYXyYiCcJc9A1kaCmj4QcgnlYgzfJFIscSmbvegM1qNdQL7iVG74aaIhrh61kfdWNrzQkHgCW95C3wKD7SU4HaDnBK33z9jh/iB0COiPr3VYuo21XSYT89xE+Iv1J5cSh/mFJZyO4+ICNx5zS8WRG6qQ28EBi/fx2FijnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIoIhgGI9LUCvt2V2wYww2dYLgic1Lr0QMTTr9Mox6Q=;
 b=IuCDuydRpeDleVwI58Unw71lgpnqhNZ3+A3TACdCoe+29KVeSLTJYcTGMs9v423v2y02nhL7O9UjjU4jrtG2/+/1XiVlmMgWoIMm7tmVBJVESDZEUQsTPdkuCDF7AXOFmzSCfILeu1rhYW+92fIT1Lo4GRf+V7aQ3Y6kmE2Z8l8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 28 May
 2024 11:01:32 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 11:01:31 +0000
Message-ID: <5dbcb41f-503f-499b-bcec-882c54008d49@cherry.de>
Date: Tue, 28 May 2024 13:01:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] bootimg-partition: break out code to a common
 library.
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
 <20240528090832.725884-2-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240528090832.725884-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdf9402-6e71-4e5d-c893-08dc7f058825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXBmNDZJNHlTU2pLdVJVSEdrQmFNTW9NV1JkcHREbHRGWXpSVmhYSXZQU3Jn?=
 =?utf-8?B?VWh1OGg2MFlKMVlVRGxpZUVMelFPRU9HTWZaTEQ0anhkbjlWQVJHZ29Gc0V5?=
 =?utf-8?B?eDRRL1ZQaTBZc1EreW1FRWNtSmxzeWVBR1FzeW5tY2hDTGlyUXFVemRuOURu?=
 =?utf-8?B?Q3g0TnNlaHN2cGN2L3dFdkE5WXdYWm1qWEN2K3dLc3ZFa1F0amhURWsrRlVU?=
 =?utf-8?B?am1zbk92QXFKek5BRHZ0UFZraUpTdHRGWUdlZkFGdVVUMUlUSkk0QzZDL0p4?=
 =?utf-8?B?TGVxZGpvTHQ2UVRJSGFGbGtXcnBrd2F3bjRXUHQ3c3FCL3lYUTJXRUZoY1Va?=
 =?utf-8?B?MmhSaDlVN0V6R3NubldIdGM2cks2QjNIOEx1Ly83U1c3ZkpLZlJzRFFXZ0lx?=
 =?utf-8?B?YTVLSWlxRWR2SG91S1lvNDd6UWlsQmlVam8zTURMQ3ZYZFdzYXlncElNWTdB?=
 =?utf-8?B?MUVXYzZhSkNUcU9GaTBKZVpHOFJReUlyL0EzQWZEM2dyekgrL3R1QURrSmdB?=
 =?utf-8?B?U0tnQytwMnI5VFhOaU1Dc09STFpiOU9URHpFRmhzOEQ0RGlIMmRrSEdMMU8r?=
 =?utf-8?B?ejEzM3pudlVaR1FpcGVmYzZJQ01PajNFd2pTZzlzU1hHUDhFVVYyazljaVlZ?=
 =?utf-8?B?NUlxT0t5N0tmcmNqUDlCRE90QkxEWlNSUkl3U0drektIQjhPSVZwOEgvVWhS?=
 =?utf-8?B?VDE0R3NYQ0ZKUlVqak1PdnNUYjZFRzVyVVdxLzBYMVNKNWdOSDk5UVkvZmF1?=
 =?utf-8?B?VkxybjdyZUNnZjlQNzE1MmZ2aTljTU9QNUs2c0xTUExmT3JrVXhzVlFuQlJ4?=
 =?utf-8?B?dEtFVUtNRVFVNVdya1JKQ3ZMcG03dlhLZHpPTXNvUWo2R3NRd1ZnUVpKbnRj?=
 =?utf-8?B?WnpUdVFQSmlXZ1M0dEhwNUF4OU1pVHZYazFybzV0T05lZW84cXAxYXRsSlEv?=
 =?utf-8?B?cXdaNkxFZmtYd2JKTnpHQkFWYWkvUzFDdkpvWnZWMk5mRHQ1Z3ZEeEg3ZXF4?=
 =?utf-8?B?bVNwS0ptbXE0VVFpYU1waWg2UlV4anZJOGF1d2dvcGpoa1FxYU0wbVJwUUVy?=
 =?utf-8?B?WGFHWGtXeTZPYzRDbVBkbDNheGRpYVp0U1d1Y1orWTdjZGtDbGo2ejkrN1dI?=
 =?utf-8?B?aXFtOWYyOU5tbFcwbVRWcFQ2ZkZWUDdxRi9lUm1TQ09NOVNXMlkxSGRMK2lp?=
 =?utf-8?B?Q2J5UGJVL1ZnajlhTkJvRENXTitLZjJhY2dvcEI4L2tqbDFsR3YzWURRRXh5?=
 =?utf-8?B?SGdGcWh5a2JTYzV3RWxIWDNJTkh1czBsWTFmejJPWk5VT1JUdUVQSkZ6UGF0?=
 =?utf-8?B?Q3BlakhHUmF5ZkxWUUNiMFhEdGU1M1Y3NkcxZ3g2TEdmbS9iR3NJOWMxVGIx?=
 =?utf-8?B?MStUVHcrdG1WbjkrUVJGTStqeTgrQ0o4MDNMQ3puWndDNWxYQ1hBQTFkVCtD?=
 =?utf-8?B?TTA4TkxIYkxUYTU1VUN3R285RklDd1JUMElRd0JRRVd5QzdSOVc5OFBNRXVJ?=
 =?utf-8?B?ZE1mQTErOGJKV2NFaVBmdnU3bEttTFAyRU9PMC9vSDl2STljaDJpb25SUDBM?=
 =?utf-8?B?cXVZNzFjcFQ4TUc1cjhLMGZzUWtTUGVhVDFUUmg1MExvR1Q3c2R5ZkltWHdx?=
 =?utf-8?B?ZTYwYmhTRVBtRVVKbGp5WkRCTVI4UXkyVmpTcTZROWxBQ2g4bVBicDU3eXE3?=
 =?utf-8?B?dDRxMEkyRCtKQmlFRkpvWDJRcE5Wd1JvMXNpT21iZUZWaGpXOElDbzNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWdxT3k2bC9IVWdZSDRMdFpzcGtwSVFTYlRrdWdFTkR1Nkgrd3Rmc0cvMzd5?=
 =?utf-8?B?OVRTT1crNGluZzlKdGo4YW1jK2dpQXNjN0FRK0VTbEVwM25mWURqOGsrZml3?=
 =?utf-8?B?bW5YSjM0RDdxcXlZOFNKcGV4dWxNcnQwd0Jaa0h1UTJVdm12TUtpMWc3R0ZC?=
 =?utf-8?B?UzlWWktuNDlCZzNvUmpiMzN6REtvYklHaCtkR2VJeUQ5RjJGUmlhUUtuZG5m?=
 =?utf-8?B?U1FZUkJCb3RVQU44eWR5ZmF0cTUrU1hmVXJNWmlPNDdRbFZBNW9wOThpNUVW?=
 =?utf-8?B?bGprMGlxMVFpbXI4VmZGRDBhRnZJbTNKZVlRUWFrMTA3R1duZFRDeWRpU3kw?=
 =?utf-8?B?aTU0ekFaanR1U1lSU0Rlam9NNThIbGxXQzIxUExBK2YyMzJwKzhaQUlNRSsx?=
 =?utf-8?B?RGs3cm5KbnppQnozamcvL1hSMnU3a2lGMXhpTk1xUnl2RmRMR1ltNFhIb3Q5?=
 =?utf-8?B?UTNoemRHem0vK1AzRWhVNDRTOHh1dVc5b3MyQ0VaY3RpQ3JqMmJNT2ZRY1A3?=
 =?utf-8?B?WXVFMGQvaDdCcE1lNUNaMzJ3aCtobU9aYzZBYW5UUCtyMjVZTTk3eFAwVlpX?=
 =?utf-8?B?SGUrN1NFRmZVZllaRnhtRFRiMGNDVVQ5SnEwYWxjNTBhQXFOaXYzNGFDOTRi?=
 =?utf-8?B?ZUZyMDNxWU9uOVJIaGRLN0VobG90Nks4N1FwOFpKR2RyT0lRMnhZOHBkMzJE?=
 =?utf-8?B?US81VTV2OVVrTDJVcWJWaU1PRjgzOUoxcGo3aWtRZTdQQVdBSE4rZ21CVEU4?=
 =?utf-8?B?LzZSNk1CMHBnRzRDUmJSaUE4b0pDcVUxS2M3anVncHQ2WGF6b0dVemNjZGJi?=
 =?utf-8?B?YjI0TDVjbENERVZKbzJvK1BGOXNNMlZHNGNlamEwcGJsZG9sTUk2ZEQzYm1X?=
 =?utf-8?B?d3RuS3RyQmtETGo5T2VlS3pBZkY5M2lCUkRTSGRNazhQM0RaOGNSRGhPdklR?=
 =?utf-8?B?bGJNeEp4ZW14cUpmSjFxVWNnU0U4amxaV3huUzdUVjF3bVM2ZWpZQjk1RXFV?=
 =?utf-8?B?eVNDQXgzUjljZmtlUndrTDJPRml3N3dyYjQ5QWdVM1cvVHRsd0ZYVEhKc0Fr?=
 =?utf-8?B?VXpRa3BHcFJKWXMxT2pxWFlPdDBMRFloR3BLVUJ6eDJPYVJIRzcwSmxzTmtK?=
 =?utf-8?B?cjNXZ0trQmc4ajZrMmIyY3UxV3B2by80RHlnVDFnMCtHVWdIUTVQRlcvUHJz?=
 =?utf-8?B?cWREK1NvZ2UwWGpEekZVbU9hZGNCNjBUTHZXcmRjSkRFY3BvWTRaWEl0d3A3?=
 =?utf-8?B?UkZ4WDBSSDh5dnlOSzJrWklXUnNxa0dxZjVtUlpyQWdoQzZjS0w3NlVuN3E5?=
 =?utf-8?B?VktRemZHRjlzUHRlWG95SVdNWXhhQ1hOS0tlcDk3aUpxajZYTFZNcDJ1bEd4?=
 =?utf-8?B?WnFBMEpPcW5UbnJiQU02TDVqeXg2WUU5ZEVoR1FUUWhvVFdBelV3L01EdlNo?=
 =?utf-8?B?S2VMQVRCa1c0cXZrS2hKUFhQOUtnRlMxY1dlbUtRUkhLb0FJRDE5Y0JtWWs5?=
 =?utf-8?B?bDc2cFZJZkp4SmtGdENXSEFpeTVNeW1UMXhic1oyay9UWUhhVHhEMTlEVG1D?=
 =?utf-8?B?dEJ6bjlHSWU0M2N5blN1QjBKcE50dTZUSGR6cGNlb2hudDlUbkpGQXRXZ1dt?=
 =?utf-8?B?cVhqQ2tLY1FSc3BBMmI5RjQ3dUl6TWZmb2FTYkZFdHVUcXQ4bHc0MVpzSlh4?=
 =?utf-8?B?MEorMXBibzF1bmJVbkt1SWdMMllwUVNrcU8yS205Yk9CS3h6ZmYwNmRwMkVU?=
 =?utf-8?B?eEE0V25YQVd3TW1MMFFyNWgvVTlSd3RVckdUUVRMNUZaVmJCd2lCYmhUZlc2?=
 =?utf-8?B?SWdXSHdBUHpEYTJ3aU5Zb1NwcEk2ckt5Z1ZZTzR4cHJja0VtcEtzQk4vZjdz?=
 =?utf-8?B?aGV5SFBqdDB6VnMrVHhVOEt2UmQzNHVhOVVGSGRVQnZuNFNBM0U0a1A3ZnRk?=
 =?utf-8?B?djc5QkdsMW5ZWTcvUFNmR2F4cE5aZFBYL2x1VGZ3aVpYRHFXUThWbFNFZDR5?=
 =?utf-8?B?SUc5WjFiMlNxZE9EbnJWNDQzNk1YaGR5TlFhOUU1K3FRU2J2Q2tiWXJBYkFN?=
 =?utf-8?B?bUxlQnIwRWdiNGFlVitoOUZlV29pblQySE1MZlBUdWxCa2VBazlnSWY5elRU?=
 =?utf-8?B?RlJkSkMzSjVJazhmRmdydytNUlh5VFBSNVdmaUtFRURTYWIzN2lkcU9YSENo?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdf9402-6e71-4e5d-c893-08dc7f058825
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 11:01:31.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq2DFjgwLskgIOgA1bvCQIu9VJEFsQgvbFYPOvssvojXUGwe5QGc9BguiE3C5nTaTmM96FNlYt4ST42p204dVbQ/aSzf6Kcwm/c/xsy6T0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 11:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199968

Hi Marcus,

On 5/28/24 11:08 AM, Marcus Folkesson wrote:
> Break out the code that parse IMAGE_BOOT_FILES to a common library.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> 
> Notes:
>      v3:
>         - Removed unnecessary "import glob"

Ah, there was a misunderstanding here, the "wrong" import glob got 
removed :)

>         - Explicitely tell that bootfiles_populate() returns a tuple
> 
>   meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
>   .../wic/plugins/source/bootimg-partition.py   | 39 +------------
>   2 files changed, 59 insertions(+), 36 deletions(-)
>   create mode 100644 meta/lib/oe/bootfiles.py
> 
> diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
> new file mode 100644
> index 0000000000..666141df4e
> --- /dev/null
> +++ b/meta/lib/oe/bootfiles.py
> @@ -0,0 +1,56 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Utility functions handling boot files
> +#
> +# Look into deploy_dir and search for boot_files.
> +# Returns a list of tuples with (original filepath relative to
> +# deploy_dir, desired filepath renaming)
> +#
> +# Heavily inspired of bootimg-partition.py
> +#
> +def get_boot_files(deploy_dir, boot_files):
> +    import re
> +    import os
> +

We need from glob import glob here........

> +    if boot_files is None:
> +        return None
> +
> +    # list of tuples (src_name, dst_name)
> +    deploy_files = []
> +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> +        if ';' in src_entry:
> +            dst_entry = tuple(src_entry.split(';'))
> +            if not dst_entry[0] or not dst_entry[1]:
> +                raise ValueError('Malformed boot file entry: %s' % src_entry)
> +        else:
> +            dst_entry = (src_entry, src_entry)
> +
> +        deploy_files.append(dst_entry)
> +
> +    install_files = []
> +    for deploy_entry in deploy_files:
> +        src, dst = deploy_entry
> +        if '*' in src:
> +            # by default install files under their basename
> +            entry_name_fn = os.path.basename
> +            if dst != src:
> +                # unless a target name was given, then treat name
> +                # as a directory and append a basename
> +                entry_name_fn = lambda name: \
> +                                os.path.join(dst,
> +                                             os.path.basename(name))
> +
> +            srcs = glob(os.path.join(deploy_dir, src))
> +

.... otherwise this won't work (it'll I believe but only if the python 
module that calls it imports glob itself).

> +            for entry in srcs:
> +                src = os.path.relpath(entry, deploy_dir)
> +                entry_dst_name = entry_name_fn(entry)
> +                install_files.append((src, entry_dst_name))
> +        else:
> +            install_files.append((src, dst))
> +
> +    return install_files
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
> index 1071d1af3f..b22a448b65 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -18,6 +18,8 @@ import re
>   
>   from glob import glob
>   

It's this glob we don't need anymore, because it would then be imported 
by the python lib added in this very patch.

Cheers,
Quentin

