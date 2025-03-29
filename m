Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6509C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:10:07 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.7])
 by mx.groups.io with SMTP id smtpd.web10.15959.1743271800691159313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=XP2GFEZr;
 spf=pass (domain: oss.nxp.com, ip: 52.101.65.7, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShuycPv7+4HvDEDu776oJcl2240+zSzuD8apcDr5Ya8z4aNatwdGfFspvfSmjbs7FbvzfYY2UwL6dyw0u/huHr9zssGonbtYDGj+YCwilTPvZRpCmniS5pxJBABChoarWXTJFj5Zcnu4NofjQc7DKdTr6Za3yXkttD4IiVjAnoBpQQEcRvOqCPl8W0wBfXmAXp+7Mq3TToJnAoOntEfLG4fciTu0TSlYX5vFThzIZ63W05Lu72Gk2w7594dY1Hj0tyAgi3QSQL+mIe2mKUOdLpK8cQdmG3Hvk+aGAXhxxLSrMB8vdlOm8cXqMTC1PLpmVrkY4Nh9aV9mfTnUicwwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+w3pME1eI6TEoCUrllVK6R9T4f3Bhm82OWMZIIPPKk=;
 b=k2IauriQGd52phT5skR6BicYfKMYG2rZOB2k8+wX5POF423kHnryJWW3XeK8kBdEzZerjUWmX/PAzqkHquhw5U/vEcKCWfibdXY7tAHn6RbYR3alAM+HGFC5/CzlVHWlZOHv2a8Oe9aBWC3sm/Fn47hboTo9x/4eQGX2rwGhUxgVH12yuo7x7Idq8b4W/lcqQnxAc4lYV1Sle9uXgj15bfB5dH4IBlnpGmyBLt4Vp/0HsF92RLTgZROfUDJHn5cPHmp3Uw1Q4rb3U6cgn7Hg5MQ4iS8nDA89ClTXWlGMhiL9cDqI3S5M5VlbG205G/ROX+vXyV0soxJYVej7KEC1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+w3pME1eI6TEoCUrllVK6R9T4f3Bhm82OWMZIIPPKk=;
 b=XP2GFEZrIcuxTjruOsOqRnLD4q7ggxY/HCsBbx0edMd/uDdPYy45ziG4P1bpwt94VRZsVtzsX25qqpWgeUiswYntXbpy0u6gA6alWxl1JMaewN5I/H1iIfXfjFRPd7xywJUzrIQ9XdB5XOgw4fNQv/X02p0E6qI4mVAgECa2Zstft9fecCj3cUbs8hfVTJr91HgnWO4nrHiCVwDsMbvqo2hplr9fWrm8vY92/MtYAAlGLLLA/vw/sqPQ923NAj2HstFvRdkS5vTYB4WwP0NvkjWglZMZehU9fJd0tIasiy8jsObj58FC5BjEeztUs5SaI3ElcbuRGr5eeMg40eFghA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9394.eurprd04.prod.outlook.com (2603:10a6:10:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 18:09:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 18:09:57 +0000
Message-ID: <2d6b7401-08dc-466d-b03c-c1feea0f564d@oss.nxp.com>
Date: Sat, 29 Mar 2025 13:09:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] meson: Allow user to override setup command
 options
To: openembedded-core@lists.openembedded.org
References: <1831574B856D1B1D.15810@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <1831574B856D1B1D.15810@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:a03:60::23) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 25161e26-ad21-44e6-ac37-08dd6eece981
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rm9BcG1ORXJKMHNLZTN1K1hCQ3RrTWtUY1Z4QmtHcFlKcVFuTklwQm1FRXc2?=
 =?utf-8?B?U09xTUlkNlVidUlmU3J6NHl2M3lDNGNNTXZ0N1o3dXBIdlJBSnAwOW5WRytE?=
 =?utf-8?B?WjJXeWtzYUVMOTBmR3U2MXVoTU1FYjRyalhNeEV2M0htZDc4UDFHZFNkMVQv?=
 =?utf-8?B?QU00cnhTdVdxT3Rxb1VFdkd4NGZCSUhaaU5ET24wdlFsN2h2N0lsaDZCblVs?=
 =?utf-8?B?bGlTWW5FNzE3cVhqcnk4emNpRmx2RjMvSlV2WHhoeStKN3NvZGM2V0xNdG51?=
 =?utf-8?B?VXR3M2lZOUNBSU9ycHVZRStqMzNkUzd1Uis2bVZCNW1JeU1HQlFyVFU1ODB2?=
 =?utf-8?B?cjZRY0pCbTFQdXdNcGVlaUFFenhvUmllRzdTME9KZndwWFQxZlR1d0R4c3k4?=
 =?utf-8?B?am4vRWxyYzlKakxxcklmNTExVFZNbEVFR1hmb0pHcDZTTkdORXdGZE5CcnNS?=
 =?utf-8?B?STBVMk5LRzFNYWd4N3h6T1o0VDhMNjJ0c09nSERXQUVNM21FTVAwd1RtTmVO?=
 =?utf-8?B?RWVoS3dHKytMWkJjUTdkSnAyOHJucFNPN0hvQzBrSlhoeHNENWh4aTdxYzhB?=
 =?utf-8?B?amtjMUY4NmtSY09HZXRSVytYaU5mV2JTVytiWllaVCtkMHBHMStTWXVldkRa?=
 =?utf-8?B?b1JuRVpNb1crMEo5eE00STdyRUdrMVJFSnhmL0N0VGpCeWgrMGNiTitaL2FV?=
 =?utf-8?B?T29Hc25RaFFIV2NMYkJRWk5QMkVTdHJEMnc5RjJhOUtEaThyTE8rMDNEcHh0?=
 =?utf-8?B?ZHRUWHlwVndZQkpLMHNyeHhVajk5YUZiSmFBc2QvYnE1ZmcySmM3a3pSQ1Uy?=
 =?utf-8?B?KzBkY2FvQkR4akIxcnlGVWhIdzB1MllJRkNwZUZBR1c3M3cvTkxmN0hKd3lX?=
 =?utf-8?B?Qi9aN3czcUg5VmpJY2tDQWs4Zk5KVEpYdUZNck52cEVxdHh4bUw0V3lVRHRw?=
 =?utf-8?B?RFJYNG5qZFcyVVowM3U3Rm82R0VxM0ozNlpPRE45UlBtRHlNTzdTNFRRK3lx?=
 =?utf-8?B?NlRiSGxpcFF3MU9aWTZ1K1pYeTJJeXBhbFBrb2NaK0plVXZkc01QK2JRdXR6?=
 =?utf-8?B?RjNFaWYrWVlLR1BJOFlvU3JVQ1NXa0JGVnlOMWZCdU5rUExwL0hxaHJpenJG?=
 =?utf-8?B?Z0ZZNllXSDhGaEhKOWd6Uk9qdmU0bVFxajRWSFNoSms2UGlrbFFTWm9KNVdu?=
 =?utf-8?B?UkhPeVczWHZhUTJQQm1mclVQK2dyVjVlbFFjL0l2S1BvcWZwc2pySjVrNmov?=
 =?utf-8?B?dkNZM3JBZzVHSUZIVk5QcEczbGVoZnBCc2w0UXJXU1dzZFJtb1dxQXVGdHo2?=
 =?utf-8?B?RmF4K215V0hPeE1PSlhNQUFiSGlCWkZ3NTZzTDA1d3NpenFOZndVVTREZW5y?=
 =?utf-8?B?MUhzc2I3azRUZnJ4aWZ0dWg3ODk2WEl6Q2U1TncrbytwejlhVHBaZVRwVlR3?=
 =?utf-8?B?TjY3cEpCTy9yQ2krWnF2SkhFUkxjVTlwcmpJNTN3TktVZDhna2E2WVhhclVk?=
 =?utf-8?B?ZWNXVVc1TlpCUnZ6ancwdisrSHh5V2tqa3RZc0lObnZ3V2lBTXBLODlRMHpH?=
 =?utf-8?B?QmovVC8rL0NKQTdYRnlpZkJMbVg2RnF1ZTVsVHBBUVVTaVdkVFhiZnNiRkZ6?=
 =?utf-8?B?KzBJN1VJd2NGSTJpa2k1UDhPNmUzb3B5eW5KeFI2N0RZUWZOQ1IxYjk4Rmth?=
 =?utf-8?B?YnM0MnRSdmZ4NTcxcURPTkVDcmlmditZK2VjOThWNDVMcndDREVjbEdselNi?=
 =?utf-8?Q?BcTtjXo91L7VtMZbl5EuVQme8CM6V6DQ2uaKlot?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czlZcWowODlvVUczbHovUUVsaUg2bWlOOW53UTk4Z3E5S1Q5b2hueVl0alJR?=
 =?utf-8?B?SUExVGx5ZlViSWEwWCtGRzNvOSsvR2JwMURudnhSdUh1K1FodzZLcU0vOXNN?=
 =?utf-8?B?Q3hwaVlCYUJhYWN2WjhhRk1zN0RrTXlYZzdSOXlWKytpWUNBVW83YXh5TURi?=
 =?utf-8?B?Y3ZvcEx1VUNSUStMdEYxcFN3c2RMM1ZPY0c1SkdhOGJGQTBUN0dUQWVPMjdq?=
 =?utf-8?B?OHdBQXVhNVlOZERYMTdFUkRteVEwd0NnWVRSS0NZRGIrYTRQQ2NkU0lvWlBx?=
 =?utf-8?B?dVRIMGM0VlJxMmczSlNnUWNna3B5SHhlZEJ1S2dOb2Q4TkdpT29jNk0yaDVy?=
 =?utf-8?B?WTBOWGJkaUNISE5zOEtmbi9VNVpSRTF4MEZjaUJZUlVXbEJDTnE3RzNMODE2?=
 =?utf-8?B?bmhWblhvQzh3WXFnU3pqZzFIdTM2UXVTK2VFYkJrQXZ6WXN6TzV2dmdIRDRt?=
 =?utf-8?B?TUM4eGs1ZVNhSFdDSnlza2RIYTh0ZXZLSmowTDA4RE1rdW9RK0tFM1M0R1Q4?=
 =?utf-8?B?MzJ5YzVEcHZPSkhCZzRvL0xxM0FTbzhncmRRY050bGlvREYxNGtVTGFYU3Bt?=
 =?utf-8?B?VkVQWktENElZN0Z1OVJuMHpQOXRDUXNwKzZaQVVYak94NDZVWGdlbTB1Tnl5?=
 =?utf-8?B?VndIL2NZTXNyS1V4ZG1zUFVnbWNUVi84QUcwamVaQXRZdGYwVGI0bFdjMVoz?=
 =?utf-8?B?TEs2U25wZGxIYXJ3aGFCbHV1L0tWUzVpdHBIU2tVNUVVQTRFcllXdHoxMzhq?=
 =?utf-8?B?TUFxQThITGMyQjFuWCtudkU1WUY2QnV2bG9SYWN6QjBKblBDMzg0RmQ0N0xD?=
 =?utf-8?B?RUlPcVNNeFhWdUJzSXhwRkt3ZUR3dWtQZXZuVGR2dVAzejhsZTg4VUN0Rkh6?=
 =?utf-8?B?UVNtemhvbW1vVC9QT2FZdVcySGtFQlA1dlNxbGZxdnlHanNOWllNcEM1OXBa?=
 =?utf-8?B?K2Nibms5aG9QcjZ0ckRXdjllVVVhL20xR0RBYWJnTS9ZdjhPWkdVbmg4amtY?=
 =?utf-8?B?UVNFRTlCTTNHNnJjbER5ZWxpV1ZjckRwWTErMy9KVlFTNmkxWElyRTdaNXh3?=
 =?utf-8?B?WEs1d1JoUDMvcGxHUmdrZE1waU83T1ZYUHBSWUVpS29pQ3M4YkhnVFFjTUpI?=
 =?utf-8?B?Zy81NlJlUW5pclpDWjM5bFlXVWVXaVdvTzhoYzczNTUrSUlkd3ZUakR3MDJ1?=
 =?utf-8?B?VjhBK1poRUs0K0ZQWG1yMWt2eTQ0ZlU3ayttV1kxUHRCRFJTZ0JnZHREUXUz?=
 =?utf-8?B?ckhncDl6RC9DT0NyUzlNVHVORlVwSDYvdlZnbGxHUFRuZ09oVCtqdHlkdC92?=
 =?utf-8?B?djFQa3ovRTg3YkpsOFc3S01DaktpR2NKZlI3cEpuWFBFSHE1SmpoNGVOc1Qr?=
 =?utf-8?B?ODBDV1RTZm9oUW5zaHJLcURSR2lRYytMTnE4YnRNOU12OXJTNFFDUVRTbURG?=
 =?utf-8?B?T3pocC9DWlR1Yzk5enJhZUI3MEFiS2x1MkpyNmw1ZkZvamFmYnR3b3h4NEhX?=
 =?utf-8?B?TVpNeGlXOFljVEhNZ2hqV25vUCt3cW1weW1nLzhYaDJCaElBcWV2bjZ4NTQv?=
 =?utf-8?B?cjZDZ3FvaFVvbXJuZ0lNOEhSM1EycG1hbEhZdkFyZFdJMXVSZDdWUkhmWUh2?=
 =?utf-8?B?VGpFWWtOY2ZVMU1CWitvdHRJb1ZRUG51Zk9wY1NoYnJLUjBxWnJjMFA3QXZz?=
 =?utf-8?B?aFZ3bVJoQ3NpcnR0RUpKTjhaamRsQjhqbmJWT0lUOGdhbzFYT05kU1RzTWpV?=
 =?utf-8?B?ZXA3REJ6VnhEc2ZuYUR4ZHdDYU9NdE10WVM5R2c4NXV5bXZKcGhFWGY1RnVF?=
 =?utf-8?B?OWthQlpZWmZwZzl4U2gxVXp1K2hjVmhyUWUyUGhpMGgzVmhwZUFWOWtjRGZU?=
 =?utf-8?B?UFY1b0swV2FncXBabVNzYjRQa2I4V1lrVkwvZDFRcGtwZlRaRnl6eFM0elQy?=
 =?utf-8?B?TU02SEVwRHcxM1c4QmFlc0R4NUh5VDJ0Y1JwZDdRejQ5QVlhWEVHRWJKRW1H?=
 =?utf-8?B?YXJPUUh5Z01qa3hjNXY5cE94cG54a05ZZjJkSitnMEdvVEI3TkM2REgzSy9I?=
 =?utf-8?B?TUFJSW5nTUNJb2NvMU1leWVRTTM2NUJkK1FFbllQTXdKK2o4bDNBbGhtNEd3?=
 =?utf-8?B?RzdoNFJja016MGtxT1Vxc2I4QmNpRU1ieVkyR0h4dy85cVBXa0s4ZXVuejRw?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25161e26-ad21-44e6-ac37-08dd6eece981
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 18:09:57.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z69bOyGMSNriwygCGRtphT/1bArAoMo6p4bW4Ngpn4AAJwFQPcbJw6mVfwajFkR63ZC33zMEtl9wcAlTdXGJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 18:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213893

Oops, please ignore this one.

On 3/29/2025 12:48 PM, Tom Hochstein via lists.openembedded.org wrote:
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
> View/Reply Online (#213888): https://lists.openembedded.org/g/openembedded-core/message/213888
> Mute This Topic: https://lists.openembedded.org/mt/111974936/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.hochstein@oss.nxp.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


