Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EA7C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:55:40 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.50])
 by mx.groups.io with SMTP id smtpd.web10.47580.1743411331867876083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HwAltJqH;
 spf=pass (domain: cherry.de, ip: 40.107.103.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9wHpCXfbQakcQz4XtxoSceHRqDj4xJ5drpYRowXTvF6kZ0uNEYzKl07i8VDVi31p2SvJRgRVZwzQGwWfV18zrTBOTxiOzHYPeG3m2C4yAXpeQ3kP+O3i6hhS0ui8Ri4ViSGEJeVrfuiIfkdqkZxOeVxASM40/EL7hruIKO6bisQMsFkuT/m1Zo2LBuRiX2RHtAvoDDTeRTOqR8MeCk04eXwVpKmuLwgblsd7M95pgZtp+GTd8HhiNxZG7s8yDVjA3Ae7ZjOoaLjYmMmIdxqOB8UlZuLwX45oGOih5COcAaPF53W4fVcQOS8ferWiyZVkxDl4QPm8FxmJBUrGFNosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKS4MlESHtypdxodHYFfPoXYKipWpb4aaoGnHgldE0c=;
 b=UP6lOi/bErThQer99k1T3vfj98pSL2FUO0jTXR5mtWbDSr5lGUHd5gzKzgeRq0++WC13lfDx9w9L5gY9Qgf1TEz3VpHVv4CcxG5iXuScfRFDQbazs12+JLgkY4RzkvBuMSdj6QjeNrS66Sil149Jc/R5RAX8pnEGC2kLjscz7kr00CAsMEEq0wLLVF8/8mrv3IM6P5D/zzo30vF5ZFcFruh7CmVnNWKt6otvm+G6OVAT9IontzPTAwa2CWJ9yad6rhpHyo4liE9i8Y9cc1vth4EhIhAke31EwdeRsMyOrJt8g+DWbl/L2VsbDJ1YdFkTlxVC41DN2EPPLeohAmuwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKS4MlESHtypdxodHYFfPoXYKipWpb4aaoGnHgldE0c=;
 b=HwAltJqHuxsl2kAOQea1aCChvnUyQLAdZaY4N+xBUgn0RwbH3JBd3zbML8GGMbHWzLLgMtFLSR1aHk2/MzjSuLCl7tB6Mu5nO5QRbRJ3xPs/zqFrnCoSIynhZT8hpYBvqp+y39mXFYLdNldne606UpZpM7obFDmBxXSNspAjazQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10708.eurprd04.prod.outlook.com (2603:10a6:150:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 08:55:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 08:55:28 +0000
Message-ID: <0d0a738b-3b3a-4d23-99f8-c0a6de9bf48d@cherry.de>
Date: Mon, 31 Mar 2025 10:55:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] flac: upgrade 1.4.3 -> 1.5.0
To: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>, Ross Burton <Ross.Burton@arm.com>
References: <20250328215955.95519-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250328215955.95519-1-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b307c56-48cd-4750-54e6-08dd7031c8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnZGRHNSU25QcUpCYmh4NUVQbnU0RjNrWUxZc2pQWWpyaWUyYmhSSmhhS1d3?=
 =?utf-8?B?czZEc1RNVVlzdlU3MGdBdUUrM1NZWmloLzV5bHFOcE02N21yKzRLQUZlOG5C?=
 =?utf-8?B?ODFOSmF5dnhkYkdhTnROeXB1TnpOWmgzSHV4NUZpSTZ0ME1BSU5NcjQ2K3lJ?=
 =?utf-8?B?NzIzRHFSZG1XK0tNMXRaWmRpSGtkYmhHV2ZqMHp4NXcvZUhuWXdSRWlLeXRI?=
 =?utf-8?B?b1M0a0xZMXNpWVMwSGljc1B4SlNFWXJHY1FKM08yUUs3MklUTmRLMmdZS2xP?=
 =?utf-8?B?a1JzZUM5aTdyYWhpMXRBWnlhR2U2aythUW96cnpLWEN3OXJoeE54alhtcTJn?=
 =?utf-8?B?SHBlQzhhVU9yMGtGcVh5akhBWlZadTNwbmdXRWV1Zm1wZlY5QWpQeDBuLzZL?=
 =?utf-8?B?L3MraHRPZ0wwZ25NcEdJdTlsTlNKUUJyN0MyZjVkUVc2ejZCVGpuMDhGQmta?=
 =?utf-8?B?cVk4VWhyZzI3UHF3UWVEMkZJeTBNWEdGOU5IamMxcmllTkdkUFJLOGp0NzVO?=
 =?utf-8?B?dUJIMVpIYlBET1dLUVlVY0FRMmg0SzY2emN5eGRjNGFwTzlrb1ZXQkVRN2Rs?=
 =?utf-8?B?NVJielVTRDgvVDJrc2FtWkNRdXc4R25UN1VOYUVNWFl0WW9vOXlPcXNFVGdk?=
 =?utf-8?B?bkE5Nk55ckduYzhDVHhWR1pJWEtGK1BRL3NYQzkwY043QURKNWl1MmduVGtx?=
 =?utf-8?B?Yk5vQXNGRjArUllHZnF0VGdxMWhaa2pDL3BJaEcyOHNpaU1xUHpkUmEybHVZ?=
 =?utf-8?B?V0t3STlzdmYzckRYTmJoTG40elJGS2g2cU5WSkROT2k4QUI1dUx6Q3NpR09F?=
 =?utf-8?B?c3NUYXZXWGVLSlJuQ0FnOHgvU3V4eWpDS0pzb3lYQytjWTRNeW5PRWdLL3h1?=
 =?utf-8?B?ZDlJc0M5MXVVdCtMeHlWeDEwRTZnRHUxZCtwSVBtekc0OW1mVWlsbnp5cVNu?=
 =?utf-8?B?RFNCL0psVjJGbUpVSVhIdmkxRVFHd1lXY0lYSjZiVTdoakg1Z2svSTNVQVJM?=
 =?utf-8?B?K1JGbjIyUWdnSjhZT05mWlMrT0VheTc5MHJoZ0trTjBFTXczOWlpSFBVd3Fk?=
 =?utf-8?B?cVFIdHZQeHJpUndidkFOMDNUUW1NUUw2b2FWR2tNZ2g0RTE2T05nejdXMjR6?=
 =?utf-8?B?a3hpWkxrNzVyS1hhT01DbThKNDIyRFhYeVQ2a0EySElDalU0TVFwMmJmNnN5?=
 =?utf-8?B?TXl4a0thWTlranJZMGhEa1JKaENxcmM3QnNaSTAzUWdST0lWN2VkT3l4eVB5?=
 =?utf-8?B?NmtXWEZwc2xCTk5ubE1DSFhEejMrN3hESmZrM2V2VmZqcWExZzExRnJZK0Qr?=
 =?utf-8?B?cERvNlhjYlQzLys1c1NkWGpISFZHbTUyc1pnQmJxNjYrK3JwZVNjZHVWU1Vs?=
 =?utf-8?B?aFVONjRidDhVdXRRWDBHMXVrWjlxeE16bGJpOXdnQ0lwZ0ROdFprMXNTTDBM?=
 =?utf-8?B?TGJKNGR4MndBNmtrTXRjS09WNUtDSVBrRGp6ZDUwTFd2YnlTa3cyUXZqZXpG?=
 =?utf-8?B?MnI1UFh2bmM4Umh2bGNFZ25zK2JTSE0yT25Dc25yYnBzUkZHMTdXMnBjVkxU?=
 =?utf-8?B?ZDd6emllQ3V6SXN4WmoxRmhiNXU4d0RBT3p4U0JDZ2ZPWmdENklpeUNSNEZZ?=
 =?utf-8?B?R1JkZnFWRHZxV0dJL0RlYXNnU1kzTER3Q3g4R1h5WlJ2dE1ST3NVTG4wcmVW?=
 =?utf-8?B?Q3RiYXBGY2dnbnZMU3BzdzZla01sYS95YmR1cFV4YXVSaldiRUE2c0FqZm52?=
 =?utf-8?B?RitNQklRZWtYZmZtZHJqV0I5VE0vQ3pyNDhBU2NHZW9lMDJ5NEVaWUU4eXk2?=
 =?utf-8?B?QlZmZlNKR25lclZ2ZnRFZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFpBZjV5dlNGYlNWUjRubk9sdGM2d1JQdHBSVzYyOFdEak9QeXY5UzJmVUNK?=
 =?utf-8?B?NEdhaWdsS1hSb0hYR3Fwc3h4T29aWFpzVlRpeG0yY2FuSVpLaWtQNFB2WUw3?=
 =?utf-8?B?emFQMkdYWEJGcFVwUVBuVzBScGQ2cFg4ajZwSmdtZ0wzWTlvZkRTaXFyeTI5?=
 =?utf-8?B?MjRnR2ttekZlRTJMZUR4Z2paSHpRYTR5UXRGVnpwdkpwNDJSejEzQUpLdVk5?=
 =?utf-8?B?cHFobTBJUS82d3hOcy9URG82anRnV1ErN2R4SndiZjZxUE81cGJZUlpEekt3?=
 =?utf-8?B?S3ZKcENacWVrS1BOUzBVUVp3ejV6WkVUV0N2ZzFHVm1Wam8wSG1NOW04alJp?=
 =?utf-8?B?WUYvL3BhVTY0blpEdzk4MDVIa1QyUndOLzE4U0puVEtzQ21yMmFpUVpGb295?=
 =?utf-8?B?dnBxMlBwcnZqd3FBQTc5YjRIOWxnZUE5aDNOVnN2dk9GZ0NkeS9EakRIS05q?=
 =?utf-8?B?dmFTUU5MWm0wK0IwYnBDMXRJOWVpYkRlY01VczlmaS83TkR3U3ZBTUc0UTlC?=
 =?utf-8?B?c2Y5VnNkZ212ejYxdldkVW1GTVZyRDV1T3ZZdWhaUUYzV0ppOVFydWprR0xK?=
 =?utf-8?B?NVFsUXZlc0ZQU08wdWtFNTNFcGl6aXUxMWJrN3NORW1uMDI5RXFNNWJaaGd3?=
 =?utf-8?B?Y3pZOGVjaE9uYUpXYUlMRGpnRWg1WlV2U20wUCtxYkJCYW9WaC80RUMyb0NS?=
 =?utf-8?B?bUxZODBXY3BpZEphU0R0QUkyWThGYks0MDdicjNmbVJyNFFUTmVWNEV6NzFa?=
 =?utf-8?B?WHErODUvMk1wL2FqbmppV1Rna3kveTJmM0tvbVRsNjYzWHJ5a1dhR1ZZSlRq?=
 =?utf-8?B?WXZXTGFpeEdyL1oxc0JCdldXa3V2SFA2MGxNSEsxMW9CZnM4KzV6SmNJcVhK?=
 =?utf-8?B?alhZT1REdkhMbFd5cFNLWHRiNXFPOFRPQVdRYzFUaGVDNWxSckplZks5c08z?=
 =?utf-8?B?OFBKS2syRnJGSk9OSFo1YlFnY3RUOHNPNlBBQWxnWW5RbksrdHZUWGZHdG92?=
 =?utf-8?B?NFZySkJyT0owRU5rcVNheWwrZVM5RGo1Y1RVaXc1OG1GTFBWM2hMTTVjUlh6?=
 =?utf-8?B?cGVBdE50bW40L3FKUWE0S0VpWHlxbGhNUEFGbXBnYkNuRmVEQ1BKOVZGSkZE?=
 =?utf-8?B?YjVIUkVNZXVpUHlwNU1meXplZGh5emhnL2Z6cW1PZHFmSEhFTUk5L1JvcnRk?=
 =?utf-8?B?YnFDUFNYNHo3TXFnaVBMQ1lsekxydXJSWnhQSEhrZEc5NUxBRVNHek9vb0p4?=
 =?utf-8?B?c2gwZnphdGJPYTJOVVd3RU9XdFcyQllFMGwzcVkzelBUNTI4VEtSdTliZ3Nr?=
 =?utf-8?B?emtHMkt4MW9XbzVyT3ZQNjhBdWJreHZKTVd0SUZZVzZWNjVYQ1pZTmdOYWJM?=
 =?utf-8?B?S1FzTmFreFFtNDlwVVlMTzBYU0thdFZqdVVEZFkxLzZiWVpLaDB6b205WWVp?=
 =?utf-8?B?ZGI3N1B6U0YrZ0pHUDRUTVBBdVBZeVVpV2JocHdldU5kU1UxV2F5NVdWcGIy?=
 =?utf-8?B?SlB6MEszNVI4Mkg5ZFFLQkQ4TGdaTUNORFYybTZWUmlneW1wTmN0SWpzaTVV?=
 =?utf-8?B?dTlHVDkzb2hTUFhsMmluZUh0cHNnRWMxM3pOV3JoRUpsc2tDS3J3K1l3Zzky?=
 =?utf-8?B?eExORkh0RnozdG9qSFN0dDQ0RDJMUTNSdFJ3ODFOT25KQktVdys1bkUzK3Fn?=
 =?utf-8?B?Zk5jNDBicGxyeU40dnBYUkJFNUdaelJBc3hWeHRiQkxlcGJHZnA0bUNEanA5?=
 =?utf-8?B?V01iYzYvQnhIOXZlYVBZb2Z3cWQ0NStKTHdaR1JWelcrK3ZTTkliL3hXcW5h?=
 =?utf-8?B?YWlzckE4aUVqbTk5aElDZjFFdytzMFpvd24yMml3T2dNa3dZZlRHOVdELzFN?=
 =?utf-8?B?QWEwalRYVHd3TnZicXlEVHhtNWdIRnpScmhpVDlvQlZlMisxRVNPTW5rcFhq?=
 =?utf-8?B?QTUwOUdPeWFnd1poNk0xeUxyRzNjY2ZaOGMzRmQzeXRQM29xdnc5cks5ZzAv?=
 =?utf-8?B?eWk3eFU5QkhJZG1qYzI3Tnk5b0xNN2k0cUd4ZGprdGxxbXhrRlExQkFTYzZ4?=
 =?utf-8?B?NTJpTjFDc1dDR3VaRUdMdmVaVGxaa3VZSE5kdWlnaE1McFJqZ1N6VGErWUdm?=
 =?utf-8?B?QStDUXpTTzRGS1lCZ1RncHQ5d01VUnVzYXN1VE1jOGxmVmtqbTVCbjZRK1Jz?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b307c56-48cd-4750-54e6-08dd7031c8f4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 08:55:28.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW1nwyM6ymhIYVviXexCpvp4Y/DmWbuIQhTSYju72YfoVu3m4LTX7mFVk/sBji7rfc2pOYd/i5ofW0dmu2qCHL5+wfs+E7p4u6AebivJMGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 08:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213952

Hi Michael,

On 3/28/25 10:59 PM, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> License-Update: GFDL 1.2 -> 1.3, copyright years update
> 
> Add patch that fixes a new documentation generation issue in 1.5.0
> https://github.com/xiph/flac/pull/824
> 
> Remove the check for NASM, no longer used in 1.5.0
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> CC: Peter Marko <peter.marko@siemens.com>
> CC: Ross Burton <Ross.Burton@arm.com>
> ---
>   ...n-replace-modules.html-by-topics.htm.patch | 45 +++++++++++++++++++
>   .../flac/{flac_1.4.3.bb => flac_1.5.0.bb}     | 20 +++++----
>   2 files changed, 56 insertions(+), 9 deletions(-)
>   create mode 100644 meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-modules.html-by-topics.htm.patch
>   rename meta/recipes-multimedia/flac/{flac_1.4.3.bb => flac_1.5.0.bb} (70%)
> 
> diff --git a/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-modules.html-by-topics.htm.patch b/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-modules.html-by-topics.htm.patch
> new file mode 100644
> index 0000000000..31ca645c27
> --- /dev/null
> +++ b/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-modules.html-by-topics.htm.patch
> @@ -0,0 +1,45 @@
> +From 6ad5b6a9ce81383ef75e6f7b88f54d3c29294e63 Mon Sep 17 00:00:00 2001
> +From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> +Date: Sat, 15 Mar 2025 11:50:08 +0100
> +Subject: [PATCH] API documentation: replace modules.html by topics.html
> +
> +This fixes the issue reported on
> +https://lists.xiph.org/pipermail/flac-dev/2025-February/006696.html
> +
> +Newer Doxygen versions call what was previously api/modules.html
> +api/topics.html instead.
> +
> +Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> +Suggested-by: Christian Weisgerber <naddy@mips.inka.de>
> +Upstream-Status: Submitted [flac-dev@xiph.org]

https://github.com/xiph/flac/pull/824 so we can follow its status easily?

Cheers,
Quentin

