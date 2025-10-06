Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09584CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:56:30 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.19])
 by mx.groups.io with SMTP id smtpd.web10.676.1759769782929004855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 09:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mxM/S0Qt;
 spf=pass (domain: cherry.de, ip: 52.101.70.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFEYXusjzJVE2hwePKfQAXPzKOU6eXPJW4aPW9AFMuFx7wDcebVHlgUkddrPvUGk3/7pD8kdOpl6buTITWPxLmtI/FBRcg7L5Py+qgjPtc+M+ZBbjLlUwQ76haCt2V8hhzvvzzsyCOGCfRQtgOPbAJMkJN16QYyaRDNYphjkGkfHUv3FgduoDhZC9rWtXatRnqY3MvW+fD+813CYA+1eDT4boE/ClqKrq5vn/tpOV+hyedrs536bFxzp/QJbP9bAcP5LOqsZWf7r6YDJI9C5GhSITdR3o6R8Mf1P5k0UfowzBq1noe0HgkAjYznBrNZF69akoN8tImv0N+lRpRKfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F+1S7edcMUxB/k6kBfxcGsypnNlGkd/L6SQjm5d6EU=;
 b=EnF/dE8gmiQjaZS8x0HWMT5NoAU7P7yM/XfUEA0ESoSCIqCpOOutsBAiq9EbEVZttRP58YCmJ8CUxGkyxWPoBVILzuldWTLwqJ0JESZrmghQiqsEyjyTmVjHc9/HGRgY7AojQY9pqZZU1d8bkcbdzfH3CHDzZwSR3G/5f0CGZvbGD5TS3lOUnl8iaA1bWa6f4fGUyGV14GjyH776V9/5gevLSgPlLa4ibJMaG9BDU+ftJVT0oQXUBVsHk52CC67eFE2OU8na0hOSXGrwzFVJ9WSkEQgUhZECk/xiWD1mw7DOdt0W8rjSiCUwaE+jqPwD2m2/6lG0lDSvSBBqObCsGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F+1S7edcMUxB/k6kBfxcGsypnNlGkd/L6SQjm5d6EU=;
 b=mxM/S0QtMhB7+D+RUCOlEPClPuRS9RigQAw0JmFEY5xl1qYadZA9xJgwwMJUtk1CXBEoA3wc5/O6uxokNLgAl7FYuxK7WR56IhVwNsstY9kcZzD6kDv5bEI/3gucHbqyg2tvuF9RCVdF/QL8dfpjG9R1hbI0C2MKeQBO0zB49/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10530.eurprd04.prod.outlook.com (2603:10a6:10:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:56:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:56:16 +0000
Message-ID: <ff5c5818-a596-4f5b-8a50-dfda83a3664e@cherry.de>
Date: Mon, 6 Oct 2025 18:56:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/selftest: Fix single threaded race issue
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20251006130902.846106-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251006130902.846106-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10530:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a6cf27-c9bf-4b0b-0c54-08de04f94371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QWtWaFJpam5YelRSR0dlSGVzaTBUNGlkMmEwQThrV2VRSHJ3RGN2aGtrMlBa?=
 =?utf-8?B?NWFiNEZVK2tIU2w1dW9kVDR0dmZYS3ZuNTBrQTYyVkZ0bHNuUm1UWTBhL3Jv?=
 =?utf-8?B?SjYxWnhQZGd4WjdURnY3VVZyb0I3U21qZXhCRnlsVDkwMHlpTDBnWUU1Rytv?=
 =?utf-8?B?dnd4bzRCaHVrWjRRUGpRbGh5N2NZNnp6bHpyTm81bVZvQWV2NWY3RmZnTU8z?=
 =?utf-8?B?b2svTm9GdkNoYTREaFcxWFIvVkxRZTA2YURrU1hNcXp5WklEc3YwWjA5YVFr?=
 =?utf-8?B?Yk9YQ3c0S3NkN1BVTjVXUklQVTJ6SzA3b2hsRUJyeUZyc043NkZRMGVzcG1r?=
 =?utf-8?B?Wk9DdHdFMnlteEpVbUVqd3I2QlBCUktYL3hZWXFLVkV2TkZJY0ZvV2dJNk9Y?=
 =?utf-8?B?d2hnTGI0a3dWWUpqK2xQdUNnckxPeHA0em50Z2lFRlkrQXBsTDZNOHMwKzVO?=
 =?utf-8?B?YkJVSGRKdmhvNkxCdVFSNzlXNERydXRzMjd2QmRQWWl3TmoxYks0WG8yU3hr?=
 =?utf-8?B?M01wUWFwR2FhNFNRTFR1U0FDN0dST1hjckUxR3FUd1JwcExGUmFpVXRXSFZT?=
 =?utf-8?B?TGMvemIzeXRFSFp0Uk5ybU4wcEZUTWdwS2lDZWhlZjB1V0s4RWNDT0U3Ni9N?=
 =?utf-8?B?cDZWOTV5UHZRbzRCK3FTeHhjZTNxT1l1blpHSFZMYmZka1E5VHF6bUN4VWJT?=
 =?utf-8?B?N1AxQ3FiQ1pjMW4zcVFQSUdDbnZkdGRVcUMyaTJhVkhFeFNxY1lpSHVrNDBi?=
 =?utf-8?B?MlduTDZHMEQwR3F1SktGWVcreVNzcEt6OGRiUWFNb2xaNGVkVXd6ZUNiNzlR?=
 =?utf-8?B?djRTQjdwdFFhM1pjZFN4L0xVclJDT1dRb3pobWF5SDFidXJESkJCQml4VGJK?=
 =?utf-8?B?QWRzYzdVVnFYZzlWOW9HZkFGbjAxZ1Vlakx5aFhIeEc4VVpmdUx6UldVRnZB?=
 =?utf-8?B?bkkzdkQzc2FvaWREWktieVdjTjZId0RFZzA1ZXQ0Y0s4MkNGcHRESGI1QUpy?=
 =?utf-8?B?a2tZb0RzWVNzZWFDZVBQMktDb1N1WEpFRGFra3RpcnFMKzJYK2hpMlIvajZF?=
 =?utf-8?B?ZjMzeUhiT253RmFLc3JGbDVqZHNDSFNLbGkrR05DbE5wNldwd1l3R0kwVVo0?=
 =?utf-8?B?R2ZOWlVwajJYV0tsK09WSExnbmxNVVJ2Uk41c1Exa0p6THRYSlBrT0VENFJp?=
 =?utf-8?B?Qk02bzRCbnd2VmdwSDNNaU9FUjFQL2tVOGRDR3NaWS9QTm5MZmRwWFJEbkRt?=
 =?utf-8?B?N01MWWxFM2sveEVUalMvdHMwZ2Y1bEVORmpTS0tRYzNnemU4Mlc3bjJNallK?=
 =?utf-8?B?c0lLSko1SmdvN0Q3bDNReit5M3Vmak5tZGFTN1U0RDB3b0NsWHR5UnRjK0Ny?=
 =?utf-8?B?eXNFMDNNaTFNRUFqTEZBS0pyQUt6REI5T0RTQ2dlRXBzdEV6Mi9TRTgwVFBp?=
 =?utf-8?B?SVdRRDFUVXpSL2djQzlLV1ZDMkFNVVdGbmFMVEZ5c0RhdEVpSmVDSmpVc3RN?=
 =?utf-8?B?ZU5sTGpBWjVUdjM4U045Q2hoVkRHYStQYUlUOE5MV2pvSFF2b0J4ZEpZS3Z0?=
 =?utf-8?B?c0luVk5hOE1XMUJ3ejROeEJHeVNLbDV5RkJ2Um1HMFQ2RGVZemhuWUxCSy95?=
 =?utf-8?B?dDloZDdCUXVRSUJWMXBxQmw4L1FoSkZRckpFMnJiMkpxSjQ2ZGpSR0liMG9t?=
 =?utf-8?B?WjVHdkhaZFpGUWR4U2JUV1JYWWhUU25BYmhENkY2S3ZyK0tGMG9HQjhtaTZr?=
 =?utf-8?B?bXdYeDJ4NkkwWWNiQ1hibHp6SzdiaERPcGZudEEwMlNYQzh4U1NiWHVpSVUv?=
 =?utf-8?B?WkJTeitKTHkxVHlValBWUWFpSU9HUWhSdXAxRWdqVkU1aW5vRFlrSkI3Rjl6?=
 =?utf-8?B?RnNrdUZTeWZFbURMdVJVbjZPTVdEclZ0K1U2RnlRYjJJYkV5TWk0U2g2MmUr?=
 =?utf-8?Q?nwMozIGD3X89ovtVECGFTJlUBkHMslkA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHBRazhqcjZCbCtxRGh1SElVOCttZGlPTENYWFE5bzhEMGQydDR0N2lXcUJ6?=
 =?utf-8?B?eDVuandBL2NVSG80S25SVWU4VGprMXNQMzh6REkveHFaeHBUWjJqdmc1Yk1j?=
 =?utf-8?B?L3lqVDg2V3hUYTdScXhacHFxZVM3OXN5Zy9KblJVc0ltNE01QVZvMFM4Wmwy?=
 =?utf-8?B?ZHptRVIrY2ZBMlZGdGZZSUozMklON0IxSkJNb3NuSVIzUHhaTUU2T1lacDk5?=
 =?utf-8?B?OWE5WDlwRlhCaDhVeFhTU3lLUVFrc2lxeGgwUSt4ck1UTkphcUEvb1lkNUVv?=
 =?utf-8?B?UEhEM0VJYldaenpJREsrT3RYajdFVEU3cVk2dGROSHZPcXYzUjk1bnU0L2tN?=
 =?utf-8?B?RDhDdWNQL2hJcnhmb0swQkNodlF6bEgyOWpqZEE5UnB2UnpwSXROV1g5TG11?=
 =?utf-8?B?R0JMenIrMHNrcXdjZGdWRG52SjZuKzNINGVBeDJjUEJxNXNjWUdBdDFjRm4x?=
 =?utf-8?B?SmR3a3ZpM1hSQ2oyb3pyYUszMzFabG5qNkdxMlZGZXdMRjJoNlU1UHc0eXdJ?=
 =?utf-8?B?ZTdMUzY2UUxIZmVFYS9XS0IvS3J1Qnc5blpaQXpMajNKY0RKSVdyYno5d3VW?=
 =?utf-8?B?TlNlSU9UN3VZOHQrLzQrR3d6aXFhN2VTNmNIeThhUDIxdFJ5VmZGbG1lcHhX?=
 =?utf-8?B?ZmJZWkQvK3h2S3c3U2FVMUpRS2tJSnkxSkpQK3BSK09LTUIrdkt3QTZZNmFP?=
 =?utf-8?B?WVF0Z1ZpMTd2STliVlFZamk3N0xpQ0Y5M2ZFL1hVaUU0b3BHa25RbE9HMWZa?=
 =?utf-8?B?bVhOVHgrajc5bGp5eWJETWRaR3lCQVZYMTg0djljNmIvSG5RL1N1dDNGWU9I?=
 =?utf-8?B?YWYvM2lGR0FMQ2dtYlJ0RkFFN0FreEZ3cGF4VTFkdWxQUmx5TTljaFpMNFls?=
 =?utf-8?B?bi9oaWxRQWFVRkN6WUNwUEprb2tsM0dLUUtlMnQxN2pHN09CSkU1bUZ1VlUr?=
 =?utf-8?B?c1IwVUVjWE91Y2tsVTR6UDZTTzNZMHhsS2JqcWsyU0JyNXpKeWlPaVl2TS83?=
 =?utf-8?B?ME1zaDFLS0IwQ0wwSU9reXV4OU51NVhLMmRxcUdobHhTV3ZPUDR1blhrb2R5?=
 =?utf-8?B?cmFJNTZxWjQwVWFuN0F3STJBZjJjbWJsWFpJYWZrSldXMWhncmFqUTJMb1RD?=
 =?utf-8?B?b21kWUtjNVRIK01Kc3NYYytGNlZJUGlyUmwzS2RjMzhDRTU4ZkVMdzhGSU82?=
 =?utf-8?B?K0lrL2U5WkVoSHpFR21jL1IyYzkxdzgrWWNQU0ljSTVXenNuZVJNVmphTENx?=
 =?utf-8?B?K2FEQnZweXJaVDVTNFlYVjhrQ3B1a1I2MytjeHluQTNmV1A1d1p5UHhiQ3Vx?=
 =?utf-8?B?S3RqN2pvZVJLRFFXbGZoZFlrMUo2cndLVXJGbmVYOWM3c3ZpT2FJd3MvWC9m?=
 =?utf-8?B?L1pPeTRLd210WlJXU0ZKcm1hMk83TWRmTHdaeFFleHFrZzI4a01LaWtlcUpP?=
 =?utf-8?B?cjhVYkwwdHVRbXVDRUFSdlVub3d1NVlwYUJSWmR6WjlWZ3NvMXNuaDJDS1hj?=
 =?utf-8?B?TWZzZDZxQTcyZllMYTBhbGMrc0d5amdyUDVzTTBRVExiSE1pZ2xCSS9wVmdH?=
 =?utf-8?B?Z3JjSVN4M2RCZDMyRkhYa0phRWVoNUtvSE16Z3IyeFBENEN4VHQ4V09QT3gz?=
 =?utf-8?B?dnhodDh6SVE0YkVsTnhLVllVNEpHbGlzSUptaFNoUVdvS0NWREJ4NUZrUjVq?=
 =?utf-8?B?bDZKeUdEQndkaWZWUW52V040bTVhV2o5cVd0RVlxaGRYQjA2TzBNTElJY1E4?=
 =?utf-8?B?U1lGUkNuaVU2STM5VW9CcWduMDlFM0NxYmJaa2N0TVVMbU1IeVQ1TVRoR25o?=
 =?utf-8?B?LzRmRXFDTFVVYnVVRXN1OTc5dzByaldvMnFtaHdpT2JGSXlWeHpzNlkvamJD?=
 =?utf-8?B?Rm0vRFRUdkZITkVsTDNXaFFSQTdCMTNVS25RR0JiL3FyeExYRmxlbUxISVFX?=
 =?utf-8?B?UnVjS3JHZ0tKcUt0Q2lHdXdrWUtJZ042eTBoRUpsclJCRmlhbTROYTBuNHRH?=
 =?utf-8?B?Kys5WHJ4Y0p3QlhWcE5hR1ZSN1hacDBuVmMrR3hxLzBIOW9GSVR2WTRTTWVr?=
 =?utf-8?B?RmovdEZtUTNqVllQcXVnUTg2YVBvZGxKZnVvZ0tac2paMmVaMFloY0p0MVQ1?=
 =?utf-8?B?SXozMTF2V2tETnMwbkloNTVoa0VCRCtBQUJjczltc2gzWWdKRW5nZGZkZVFk?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a6cf27-c9bf-4b0b-0c54-08de04f94371
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:56:15.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQAARq4FqAmVtKUEeUmpvplcK59dPc9aZLVdN6gWb8EaAPlzc0cGOtLBym7cUJyU2aqYK4IIP08tMcsO442rsVHswKdKYMJVNk7nPxdZ6Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10530
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 16:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224496

Hi Richard,

On 10/6/25 3:09 PM, Richard Purdie via lists.openembedded.org wrote:
> oe-selftest sets up separate build directories to run the tests in.
> To to this, environment paths pointing at the previous build directory
> are updated. In the multi-threaded case this is fine as the thread is
> destroyed and the parent remains unchanged but in the single threaded
> case, the environment is broken afterwards. This can mean we try and access
> a directory which is in the process of being deleted (e.g. by clobberdir).
> 
> Restore the environment afterwards regardless to ensure the single threaded
> case doesn't try and access the build directory which is now being deleted.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/lib/oeqa/selftest/context.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index 16f82c6737d..c9eb4817253 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -44,9 +44,13 @@ class NonConcurrentTestSuite(unittest.TestSuite):
>           self.bb_vars = bb_vars
>   
>       def run(self, result):
> +        origenv = os.environ.copy()
>           (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
>           ret = super().run(result)
> +        # In forks we don't have to restore but in a single process, restore cwd and the env
>           os.chdir(builddir)
> +        for e in origenv:
> +            os.environ[e] = origenv[e]

Wondering if we cannot replace the loop with

os.environ.update(origenv)

which should have the same behavior?

Note that keys that didn't exist in origenv but exists in os.environ 
after the copy() will stay there (in the update() and suggested implem 
in the patch). If you want to really have the same one, I'm wondering if 
os.environ = origenv[:] would work, but I'm assuming there's a reason 
you didn't go for that that I am missing. Another option could be to 
delete/pop all keys that do not exist in both, e.g. with (not tested)

del_keys = set(os.environ.keys()) - set(origenv.keys())
for del_key in del_keys:
     del os.environ[del_key]

Though I'm wondering if we cannot simply call os.environ.clear() before? 
Not sure what the side effects could be, I have a feeling this 
os.environ is a bit more than a dict :)

Cheers,
Quentin

