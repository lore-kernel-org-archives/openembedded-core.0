Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB25C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 11:44:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.32])
 by mx.groups.io with SMTP id smtpd.web10.9622.1746099880460113431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 04:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=QYI6PV16;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.32, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBFpX+5YA5Wx61+0VH8W0YloXh77pmL3ieL9T/BXthIt28EqwTWmDl4BuGjbC7PJW9KaZyHyq4fj09iQb9+CBk6OntbpuY2e1vmMNlcfu+Ph69BeUbBym5s1gzfpODJXdgyO631Hs5bfPssmG7TfwMX0sA3L85C0PTep2VS0YYxfJpQ3tC1aa6nCbjchcBnSuxL2shA1UKqmYXpYS6JjEbPEsrCCImvjR+fPj3jQxddzwaTKDl96/iteXxzbnKz+SIl4mWqM+7XjaPZ/Mn3GAR8sTqSP3RM65VNmDdyUKnVe+4gyJNHyfP620UkV9cAMBlVaRxvcijXHf3xSTI7xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPiC2+y1McHU0G4z659dkBTeEPA5sAB72y//8uuetzQ=;
 b=xWOPNipuA7Uv7OSif3ocuCVJhINyGVNcxOe6N2mpNxKJPBFgDopC9yEk/WBDhRaG+TN2Yymw+ckk+GZIi+FRdi7lcWiPSyngu7YobvP6FAWr8+sa8NMSurwH+8lQcU+dzRQklMtvTr9hPGO7EnbPgg/KPUZq+NrgVDc6PZ76hivSUjbPviFVB4jctC0ANpSrCKPafxYnFW3KqdlM/ZTtADwWXN9BzIWBm/oh5y2y1yom4of0eOzn/jOefQNFPdrX+5pq3g0xwNZ5PhAaCwY6WPVnI01f0lkJ1JQFtmbqUz+VG7Fr6ANfzXvjYuNQyEKjLnMeWpm5BrumVQIx1Uf/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPiC2+y1McHU0G4z659dkBTeEPA5sAB72y//8uuetzQ=;
 b=QYI6PV16cGp07cT03DnHeBPkNZfx/DoYrCaQFFPwVjYcNn+jUz8AiN+HNILh+nYdnwvFx4IG9ROxmiHA4HcS+266aipUBF6qcYG+xzG2Pi6REEcnYbxoCun34ogMLxd4oVwXX7irxTuMEvrm6egB89gtMjKp5d6G3YDzpp1IotfKeLY7nStd7NHvOiGBhPiOlXA7Zm8ob4EbB0U2Y0sMiYOpYmRPxIzMaIGilSe7I26nHfMlrOWb7fHpEHrhG2KX6yHw2VBTmXQPJMsGFMQk77mis/Wbh8+zhoDsX5bY1jvqbgKtOgFFi9gPJ8NosPuYuRujKqAp962SYTZUBCk/1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GV1PR04MB9182.eurprd04.prod.outlook.com (2603:10a6:150:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 11:44:34 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%7]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 11:44:34 +0000
Message-ID: <319176ae-a09e-425e-be0c-2db0306826a0@oss.nxp.com>
Date: Thu, 1 May 2025 06:43:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] meson: Allow user to override setup
 command options
To: openembedded-core@lists.openembedded.org
References: <18372D83C40C1A33.11203@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <18372D83C40C1A33.11203@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH3PEPF0000409F.namprd05.prod.outlook.com
 (2603:10b6:518:1::4f) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GV1PR04MB9182:EE_
X-MS-Office365-Filtering-Correlation-Id: d6422f3c-f60e-4bd9-c7bf-08dd88a58ac9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkM0cmp3ZEN2THB3MDhlYmFPb0puMjNLaTJobTFLS2NsNmxMaDlFM1M3YSs0?=
 =?utf-8?B?Y004UWM4YitHalJpWlVPT0F2LytzYUhOdGp4Smdva3ZGaE5xVjh2RSs4SmhX?=
 =?utf-8?B?cTVHcnNpMG1jSWxLYzg0T0VCaWtkZ3V5L2s0L1I1WklrUkJRdW42YXBKN2ho?=
 =?utf-8?B?SHdMS2QvV0JXTU9SbzA1N2pheHg5VDVkQ2tXc2VWNllwZ01WMm8yMjlmY0xK?=
 =?utf-8?B?ZGRKSU5ndHByK0QwQnQvZlZFd3R6ODBWQXBmM09tOElLdTFVcnUvM3puaTVj?=
 =?utf-8?B?dFBRbWkzeW45cnZNM2tabUx3MW9jdFZUTXRzOW42UldpaVV3SVpYaFIwSzRy?=
 =?utf-8?B?aWJ1TkZrOU1TMHVZemRSRkV1RitHRG15OFdXLzUyeVBSWVZUNjR1UU44a2tV?=
 =?utf-8?B?R3hLVXJkWE1wUjZMeVhnTHVXQVY1SHFMbEd1M1F3VVluUTQ0dTR4cHlSRUNr?=
 =?utf-8?B?VEE0UVpxTlpYM1ppV25iRWIrUld2b0V0WnE1WVFWY1RlSkx0clhhNGVKeVZP?=
 =?utf-8?B?dStLdmczZkdVTUtWejF3Q1ljc0poSGVNRmV5YmNZVCtqSWNWZ0YvS1BMQjdT?=
 =?utf-8?B?UWtmUmpyNDNNT3JKOFRVSDJ6UWNjcTNSMlNsckZteGJlckF0WGlDa3R4M1p6?=
 =?utf-8?B?UlErZDRWbDZFWS8wVFdmT29vSFJab1AzUFNMV2ZCNWtQQmdJS3lmdmNoWEFr?=
 =?utf-8?B?cFl5K29Qb2dmWCtyNXVQc0R2OUVwODBVSW1nNysvM3hMTHcrd01xR3I4cHR5?=
 =?utf-8?B?QkRHVlZqcER4U1JZL1J5c3ZVOVgrOFlLeDFmMFFXU3hRNUM3WVFGd3N1Rll3?=
 =?utf-8?B?OUVKYVJnc1hUSWpVdVFNL0xXWVpSZ280M3RyYnBhaXNQN1E1RXJTbUhqSW15?=
 =?utf-8?B?bUxVbmJtNDVEU1hoNDd0WGhDOTFaWjUyUXBiSTNsTDcvOEpKK3ltc2RwMTN5?=
 =?utf-8?B?Z3VaNDRKN3NjNGcvNUg5L1lwbkV3SFA0QU1sdHh3ZGtKTmdOOEs5ckxqcjNS?=
 =?utf-8?B?QldSUUxQSVJCOTZDSVlYTy9xVDF5Z1NuYVJ6SWdvc09CYzhwVVRMZ1BUNGFl?=
 =?utf-8?B?MXcwc21EeE42ZnZmUWE4aXRIZGxJL3YreFlCVVNPN3REL1M5NEFhNUNOSmV6?=
 =?utf-8?B?U2RvTlIyZHgvWGtDcjBIdmJuejZKZXhucnJzMHFObUpNaEowK2Zhb1poY3NX?=
 =?utf-8?B?S05tQU1LOHY4eGx6TWw0My8ycnZDU1djaUdpS3dXSUU5ZXpINHRrdkRjMTJj?=
 =?utf-8?B?Z2lMRjkxMWxVQ1ZGbU5zNEY0RHVXcEhUVzNEdGpnNlNMMXBTbzBxRklyWGdC?=
 =?utf-8?B?RTNYd2xPa0FnNmZ4L1NoQkhsd05FUXM0K3RZTDRnUWtlbHRDNjRGc0t2NjNs?=
 =?utf-8?B?R00wUkRhR3NRWFJpWUl2cTZTRUVYN0Fqc1lRSDFMakN5bzF6N1NuelZVN3or?=
 =?utf-8?B?S0JBaUl0RnZ0SUp1RnIybnhNOUFXTVoyTCs5aHVUUUlxSXJJZmpscTl2MFRL?=
 =?utf-8?B?c2wrTnVRK0w4OXUvYkVabUt4NnhTdDlaeU5YU3IwZkNHRmVrK2E4bUtWZm9U?=
 =?utf-8?B?emFUd1lXYzlkYnAzNVQ0dDFyRGpGYmZJU2x4ZnM4blJ3RkRMU0lTc3paN1pL?=
 =?utf-8?B?Q1A3MW9TdUtYL0NMSHVCSWswcmZhdlZhKy9DMDh5RFV2SjQrTnV3cmIxK2to?=
 =?utf-8?B?RTREdWJtTVM0TXRjVE5HWHlxbnRwMDFMWXFPdnlzYTBlYjFhY01NUWtxVEZW?=
 =?utf-8?B?OW9nMHNxSzFZWWZBOVIzZzFFMEZZVzVWWUJ1Qm8vZ3VqbGoxcVVwTFU0L0c1?=
 =?utf-8?Q?T+Vq3OgONzCkTEIxuo2QUfHTpA7fftbzWsrxs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1l1cGNhQ2tiVzdsdy9NYVQ1Y3dLT1gwV3BNRmQ5NmtJc2swU2tCaitKVkFG?=
 =?utf-8?B?TUZDWEtLS3ZaNDFyNDArODc4Z1ByZ1ZlaU1zM1d6YkhUc0ZKd0JBaWxGK1Ra?=
 =?utf-8?B?bTdQb0Q3UFpnNzVEQWNOTUVsV3pQV2dFUEd1WWszRVpFOWJRUlBjOEJ6ekda?=
 =?utf-8?B?Sjc1dU5BSlZDL1M5SGxVeVJLd0t0OE1ocUhXdjdyU2FFeVF0ejZzYyszS3A3?=
 =?utf-8?B?SHBQYTQ5aFhTNGtwK2Z2NGttcGJ4bnhYTVY0WndMb1NRSEgxZ0pBMFpIazJM?=
 =?utf-8?B?aUZ5eENiVW80eWdvQUlwMnllVVVTRWpOYnNhdU8yMnk1VFh1KzBGamJCZVRt?=
 =?utf-8?B?UWNkeDhsSmdBUnl3SHArV0Q1NDY1RXhVVFU2RzZIbENYVzM4WHVtamh1NG12?=
 =?utf-8?B?ZDdiTmlPWWROM1VWSWxOelYzTkhJbU4ySkx5a0hCbjBSRkZwM0MzbGw1VjlO?=
 =?utf-8?B?Z1N3UEF3ZHNqL1M1SVZqSng1aHJBNjhoc1lQMTZyK0Vnc3libVFBN1lqQTV3?=
 =?utf-8?B?QkJzTjJPSThlRVJ2TUhMUFVhaFNCbmtFajl5cCs2M2QxamxpUjlLckZrRmNH?=
 =?utf-8?B?TGptbUJFQVdDT2thN1RYeG85amZrVkc5RlVSUXRKbDdlWXF4b0NTY0pZRTd0?=
 =?utf-8?B?NTh2YXFPUjM2VTV0SmVXSHZtcEJNQ2JES2tUNTBQQnFjOEZGYkFINkJOamhI?=
 =?utf-8?B?T1prWTQ1dVlOQVJsSzU0Y0lNV29vZGtNajBFWnpaM28vcHQ4QUFpaks3azQx?=
 =?utf-8?B?ZGFNVC9Pb1ZNTllMTkZ4MXZFY0hwUGU4SkVNZ1o4UHJkN0tHZHRXc0NkZHJB?=
 =?utf-8?B?YUE0OG0xZk5pTHZvY05oRXlxamtPTFhFVXl5ZXdsd2lqdDBaTHFYZDRSR3Y0?=
 =?utf-8?B?VEc1OW9TSkJTVmtkL1haa0NObWxXWit1NHdDeENJTG03V0E1Z3k0SkNyYVBI?=
 =?utf-8?B?UEZoS1d4RUc5V2pMRHhjY3hGUHVHU1NRN2tCR1k0dW95R2UycnBmbXNNNEMy?=
 =?utf-8?B?ZzB5MHVneXBWVHBKUUoraGhwTmw4L3BuNmR0QnpyZktnelA5anZOVlJTWmJ6?=
 =?utf-8?B?YUxXaTRlY1JhSnB2SUpDNjJBbk5wdDRDd0pQaFk5SXFNU3F3aVZRazlYQlpq?=
 =?utf-8?B?M08veXhaQ25rYVlCamFHY2U0dDM5ZlZzVHpJajlsYlo5ODNlQ0s1N1UvN0tU?=
 =?utf-8?B?Z0g2STBnU0NidG9xaklJQmlTL2lBUnBJVlpzMlMrRjZsVkh0YWpZbFlZaDdq?=
 =?utf-8?B?dWtnR2NTb0Y4VUlQNGNpOWZadnRpZVlXVkYvMXpmcnB5VnI2Z2RWYlkwQXZl?=
 =?utf-8?B?YTgzdEhINDRnb2tKcFdvLzFEMU5CZnJvV1Mzc1NLWm95Qlg1VFRldG90YTRp?=
 =?utf-8?B?WjNSZkt2TEdmc3pVMW5VNHB6SlpKbzN2elJPeExGS3MwM1VrUnpnbHR0Tm0y?=
 =?utf-8?B?Z2dyN00vN1E3OG5IbzhWM3NWc3lOQ29pNXpKakYwRm5JYUdRbWFmRUlSNmhn?=
 =?utf-8?B?c0YvTEg2TXY2WkhsRVJNVUJwZ1cvK3IwUy81VjErOEtwTmJpOE1tMUxIc3k0?=
 =?utf-8?B?bktlbTZyOUNuYUFzQmdnSkk1RFVPTWUwS0M5Q28xL0pjYWswSTlLZGlpMTYr?=
 =?utf-8?B?WHhjZ2lWLzNKcVpWMHRhL3VEN083dXNFeks3UG1PRG13RXRHanVqNHpWcUMw?=
 =?utf-8?B?NWxEcEd2MU5NNG0wZFdRRjQvNXQxdWpvWDFwaTQ4L1Q2dXdGN2lLTE1COVpT?=
 =?utf-8?B?UHUzMGVYcEJQcU5wOFJGQkl5eDZMS01nc0wwVkt1T2piL2F1NWp2VElDMCtK?=
 =?utf-8?B?SkRXZXZtektmTWpaZmhTWTBKcXQ3cTV5NGdvSmt6K0FqdWhyeURTN0dSUmVZ?=
 =?utf-8?B?VXVTZnlzYTk1SUF0dVFqWCtmVkJFVWhWSHJRZ3N1eVhYMkFVVWxDZWZ6bWQv?=
 =?utf-8?B?WllBRFpkRXhkdmdnWnVxTVpxNWxTMHZaZUNlMG1adjZiNWQrdWx4OVhBZlpw?=
 =?utf-8?B?cFgvZktacmNsWUEzYS9STmNHcU50dmt6aXRNdEY0YnVzM1YzdWlpWUloRjdG?=
 =?utf-8?B?QjhhbGtvdTlGL1NsV2ZkZjk4K3B3ZVVyNGhqL3VEL0NacnFhd2pxTU9yQ2Fl?=
 =?utf-8?B?d2JiR3Bzb3hkdGZqTnBVTkVFbzZoNjBCTS9RWUZxdTZwQ0lrSzBubjdLQlFG?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6422f3c-f60e-4bd9-c7bf-08dd88a58ac9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 11:44:33.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmjVHlNdVnJORy9vJL0WXzxoDc0WOw8+FnDB45a595a3H0SBYcQ2Hhl7TlydnEgOU4ZSYweq63nTTFJLNm18Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 11:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215767

What is the status for this patch set?

Tom

On 4/17/2025 1:08 PM, Tom Hochstein via lists.openembedded.org wrote:
> The user cannot override the setup command options --cross-file and
> --native-file because the meson-wrapper places these options on the
> command line after the user options. This problem was noticed when
> trying to build with an SDK using a custom cross-file.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>   meta/recipes-devtools/meson/meson/meson-wrapper | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> index 7455985297..3aa1a93520 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -14,8 +14,14 @@ fi
>   unset CC CXX CPP LD AR NM STRIP
>   
>   case "$1" in
> -setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite|compile|devenv|env2mfile|help) MESON_CMD="$1" ;;
> -*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=setup ;;
> +setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite|compile|devenv|env2mfile|help)
> +    MESON_CMD="$1"
> +    shift
> +    ;;
> +*)
> +    MESON_CMD=setup
> +    echo meson-wrapper: Implicit setup command assumed
> +    ;;
>   esac
>   
>   if [ "$MESON_CMD" = "setup" ]; then
> @@ -27,5 +33,6 @@ if [ "$MESON_CMD" = "setup" ]; then
>   fi
>   
>   exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> -    "$@" \
> -    $MESON_SETUP_OPTS
> +    $MESON_CMD \
> +    $MESON_SETUP_OPTS \
> +    "$@"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215108): https://lists.openembedded.org/g/openembedded-core/message/215108
> Mute This Topic: https://lists.openembedded.org/mt/112314001/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.hochstein@oss.nxp.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


