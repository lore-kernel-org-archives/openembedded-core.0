Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCEAC02196
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 21:38:00 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web10.24748.1738791470451003754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 13:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=O9zil2h/;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.84, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4bzUh3beTSHGF4Sy1hcmctYuzceGLmtfffrb09kA/QzNP+ju7LYidZme9dOBQ91HIAUk6g+aCbR4VnujJdI4Rgnk3eqzc43u9nxQjKkrTmS5QIteed7oMx0/GGNurfqe8ExWBG00fi3ZM9jsCoudqZy+5U2W4JwmQAtBmcXMPnmthqEF1+WQhJE+AHL6ou9JAHTc+MeI2SR1boZ03RGisgGqiCzZ2VMGahXuVz3gFQ9YHdhTtJdy+oGlVQZ+REX6aOEPENmbjeNg7ip/sk8JpeE0R6TLShNjMHu6u2w04IsIvuR0AF6K9O5TbRsgHUbtAA0Y2UtoqGX4aD5OltNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ3arsW2CR3MQaTc4dKLPpaB6h9c/aB43B8Q/jvDo/c=;
 b=Yc4uFImo5oNStJ4kPs3V0eCcZMihUJk1m0CteCWt/qKYU83Dfhb5oiZ/9mgO3bkRPJ8+WUURsy47x8QiRPZ/vTOCn62bjzzEK9EA8m+649aVtplIDFyOWvTaFdIyLFxMKrhE0HxTmKGzLlktV6kaSMaBAGnY923OAD5B9gbN93VaR4pXvLdKHp2r3y1H6eAwHbnU0HnkCTuv1ArNuWNxuXM9lZyO6+E+cyRZT4YcmCelPtXJVgc04/5v48SfBY03RLoSdRlNVM7ORS6dtillY18CQejYJSytoDo4IUFj3ZQ/4JSaLDdpgKLOHi6bHMk3KG9TCLfaJ6Mt64hHPDLXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQ3arsW2CR3MQaTc4dKLPpaB6h9c/aB43B8Q/jvDo/c=;
 b=O9zil2h/i6+imEDPrWZCIZnRatbsEhWz+Z0yu30RVNSeBmp3gIb8jbnAd+QIEQsI6nupRYc/rAN9fJ88NlVRIlVUgiyLL47y8sM9SNwYpWYoTwIGGMkuhE8+u4xIuHptneQaWIzMkp3MrAzqhaoCLQzYMG9U7eZdBGk4cwgMu07SxcFJom8Bt64hnqTD334EVkzFN4OqeaXesy/mFyVBVxXQw43GEryB/u22SfCTYFhenA9yIH7rowM4bLX8IzBj3uLsYw1A5N1Yn76g0fb13v+W6u1LIdekDkYS0yZxHaf8MeSe67Ah0EXmEzrGDpbjNF/7fzL/MXbqPmwFyR6rCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA4PR04MB9662.eurprd04.prod.outlook.com (2603:10a6:102:260::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 21:37:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 21:37:46 +0000
Message-ID: <3358af59-dd76-4d2f-aaaf-ab544f515b4f@oss.nxp.com>
Date: Wed, 5 Feb 2025 15:37:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH] uboot-config: Fix devtool modify
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20250205181015.3064866-1-tom.hochstein@oss.nxp.com>
 <01010194d753be6f-f0a3e7a6-2aea-4b02-8a10-bcc02f54d001-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <01010194d753be6f-f0a3e7a6-2aea-4b02-8a10-bcc02f54d001-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA4PR04MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: ee818943-23f8-414e-709e-08dd462d5459
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVZGdkd5cFNvTTZsTFhHVTZjak9ITWcySml2aTZIdUZsOW1JcW5xRHJFMlJj?=
 =?utf-8?B?SlJSWU1OcDlvZ1N4c2hwZVFFSEJKWGdWM0xsVllSSjRpYjI2L0JoQ0lqeGMr?=
 =?utf-8?B?WmUxQnk1UW12UmE3eWdkNnZmNzRZajFlTUlXYldpcElEbDNXbWJCNlVOSDBW?=
 =?utf-8?B?ZDB5NXhlUVdHNU94NkVad0t0dmorcUtrSUp4TEpDb0M5ZGRvenloeExZdUlI?=
 =?utf-8?B?OTBuZzZuRFFoWlIvMFJJa0xQc3JseUppUDZyNWk2akF3SlZrakJldGhYVXcx?=
 =?utf-8?B?T1F0U0N4SDhSMlgwa1luMWpSVTg1ZDFOcFM4eU04ZVhnUFFOaWE4Z3JEN2I0?=
 =?utf-8?B?NTIvUlJoM2pyS2pqek9ndmtHb1hEV04zTGUrL0hzRWVSUFhubTNDSENsZG1Z?=
 =?utf-8?B?UEtDaWZHdHlKQWs0K1pZMFdYbGl2dGE1aWhpN2QyRkhTSGZhOGhBbGZIMVU5?=
 =?utf-8?B?L28rdEluekxkUnY4WWdEdTZaWGY4ckxCR0tDSVBPUmVjWXZ6NmdleG1ScHpi?=
 =?utf-8?B?OG4vT3hnTDV5TUFqSE5ZNUh0Vk5IYVdabmR6ZWNTQS9zV2FVdGJiR2Y2MlN0?=
 =?utf-8?B?VEliRG5vbzV0K0VZNlJIcVorZENMTndXS1lzRHhKUVhvK0grZFlrQTRDaFNa?=
 =?utf-8?B?clBYUHNMbmZQTlFVMmlKTVMyNVZnYXhuVlBXUDFrbTA5Z3M2WUhLcmp4YWpZ?=
 =?utf-8?B?RHFTWkJSaGFoYXBNckdEak5nd2lwMExsVWRMUVlQS3RIRkVPcXRVR0gwcDg1?=
 =?utf-8?B?VW16NmZrTEtIeUtSZkRXOFZPL1lnVGRVNVFJQVAxcmVzd2UzZ3FDa0dPQWlu?=
 =?utf-8?B?ZjZRYzFhOWpPZ1BDRjFXcU1wczk4Vjh6bXQ4MTA1bE42UnRDcDZDU0Q5OW9q?=
 =?utf-8?B?NDZ4SUYyaE9nZGZRMGhBb295NFVjUWFXNGl5dFZVbDBuUTZJdWdhT3pVdVJE?=
 =?utf-8?B?b0VMald0UmE0ZlVXUE9kNWtBVFUxR0tpUVQ1TjRFVmk2cXY1YUw1Y2lTQ1ps?=
 =?utf-8?B?b1gwQWZWVzZKTlNjN1c3UjBQODVxY0haV1VReHdFTmtTaDVtcDhuZWFsY3l6?=
 =?utf-8?B?enhEcGI1OGFpM2NhWFczbVl2NnhMT2tXa0hUaDlqVHNjL1hrRGZORXdqVUgx?=
 =?utf-8?B?WEV4alVLdmFSUG4zNTBTMSs3YnA2enhBUXhxZ1VhOHBnaW9od3lGVTRIYjV0?=
 =?utf-8?B?L3ZiMThnN2xuMjZPakF2VTQ0eDMvSmZ3RDVnbzNMTU82cXdITEFOUXpDMG5u?=
 =?utf-8?B?bEsreW0wWW5CeEo4aU1pYVNkVFl1QlhMN3BUVU9CUFQ4TzBxbU9CVTJqNzJh?=
 =?utf-8?B?NU5MZjNUMUJkMXNLR2N5azcxYVNaMVlWajdXZHFhUWN6V1pmcVFLbm9KVVFx?=
 =?utf-8?B?Z0tvSG9YZXBybEtRTjlpNExuVE90QVhkWHNJM2I2MWtLUnZYMmJCSXhRTzFP?=
 =?utf-8?B?SzZlU1BTZnJhK2M2ekxlblozNFc3Yllyd2tDT3RacTQybFVXTDlabkpZLzVT?=
 =?utf-8?B?NXM3T1gwSCtJanFoRkVRRmxHa3ZSQ3piUWVyV3VaQ3l3RUtMZU05T0w3UDNL?=
 =?utf-8?B?S29NZ01UU3hiY2hVMGhGMTVzTmJucklEV0RsaEJVY0p1elNTOVY1ZU5YVmRu?=
 =?utf-8?B?N0Jkc25KN1hMOWI5bG53TFQ4Yi9ENnRHUVZhd204ejY5Ny81LzQzU1B6V0E5?=
 =?utf-8?B?K0xyM3FJZUJFcmtyME5WbzU4Zkg3V0I2RzlvdkdqM1J4aHBWNVlOa0lDbHIr?=
 =?utf-8?Q?j7USTWbMaHr3nLMDZF/2ZamspY2rdzvlS1YAyK8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmgyUm1vU1dKRGtyZnpRYXFpTDRvMmxrOFhVT29XdjdZd2k1U3o2TnJEWU1o?=
 =?utf-8?B?eUVpQVJKbE5PSytRSDIrd2lXanZ0Q1ZhYjZ5ZVI4UHlGdjdZdko3bjZHclhT?=
 =?utf-8?B?NXdEVkNCbjlBR1lJRzhRODBPWEg3ZStMOWRCUW9mNXBpTGxObDJ5d2szbGow?=
 =?utf-8?B?OWZ1bjBYQll6Q3JSV0R2bXZIYng5czRROUYrc1dyeDI3WjhEVTVYL0RrQkJQ?=
 =?utf-8?B?T0xzZEt4Umdabk9YYWtrWkZSajRMN1BudGFYTDJGUm9vSHoya0x3OWVPTGhD?=
 =?utf-8?B?STFGNTdka203cWVCMDB3dy9nNFdLNzlqc3YycEordjNVd1FESXdLWGxiVFN5?=
 =?utf-8?B?UDkxM2xVRGt1MjVDV25OTXN4TXp2cXlQM0ZVZktOeVBBc29yQ2pxcitXaXdO?=
 =?utf-8?B?eDZLWit6THJtZnY2K2hPL1J0NU9sMk9yQm16OWtCMnRPU0ZzUVJka2tnQ011?=
 =?utf-8?B?MWI1WHVaS2hhdXBmTnJtTmZtRTNSMkF2TkdNdTIweGlCN01rdmJxZUlGN1Nq?=
 =?utf-8?B?dEJQM2FoV3pGU2VTQ2ZpUFNMY3kvcmtMdFpDaG9kMVgyRjZZUUZIbWFVQVZW?=
 =?utf-8?B?d0JhbnZhOGRucjBkSDJ2aFF6Q0J4TnRSUHVDQnRGWWgyTmE3ZW0wLzVyRVpS?=
 =?utf-8?B?MG1oTmpMMVdvTEFYVytMZkxWSUdDazF4TmM4QXJTU1czQk1TK2o0dWg5WVJN?=
 =?utf-8?B?UVk0emFKN2d6RHFOb1RHT0RSYlFsazdlZ0ZXSFI0NzB0WTRzQndBTHpwZ0Zt?=
 =?utf-8?B?KzZSZW43QklPSDlpZGpONjZkUUFRcnNnZzBqaDNMU3Z3a3Y5WU01eG5LMlV3?=
 =?utf-8?B?Y1MxbTJZKzVQQ25XOWZMVExnVGJ5ZUdXVXN3Y1JjK1hwdzRDWkIrMmJxb0hZ?=
 =?utf-8?B?VzF3bDJQQkVvcXE3aDFtekNmeTVMSmVFdEFQMXVyUzErV3c0VTU3bVFzeWtV?=
 =?utf-8?B?Y1cycG55d3A2SEUzWmdLSEtDck92QWVSM2dYQmxtSmpoY2l2K1M4djdjdzBC?=
 =?utf-8?B?NFFhR3FibjhRMGJtYUdWblJuZ01MUkdpRVkvVG1mV0wyZ1A1cDMwUlorUlJs?=
 =?utf-8?B?N24rNnZScHkwNFdNUk5wZDhWQXNibUsrY2NMSzA5cngzMzgwM0hEVzJROTFO?=
 =?utf-8?B?SHJzd2ZjbDQvMHVTamw0dGZhN2VRTFVCRllWczZkWGQ3UG9CYWdjRmZ4cXRO?=
 =?utf-8?B?WDFyU0tLYy9NMmt4ZTkxcDFFZ1JmZVJGS1RFMEVhWVhGS2xONWs1ci9EWDFl?=
 =?utf-8?B?MFdkTFdjU3dsRGZDejM1bWlhaUsrV0kyM1BPTTlYMWduN2NIV3ZHSFdzWGhO?=
 =?utf-8?B?R3R2Uy9YSFpHYmU4NzhzTWU5ME5JMHFieEd4UU9lSDhGOHNVQnQyUFNPdVNM?=
 =?utf-8?B?dk9ZalpWeDdQRVFNdnpFN1RNMlRWYW15WlBmdGJyaXVLMkpESDc5MlFHdUJ0?=
 =?utf-8?B?cVhuMVlqNktQYnVPWklaLzJEVExTNFR1STdnUEVSUWtPZnZzYWlFVEVPaVRz?=
 =?utf-8?B?RGVvVVROWHdjSUgvK01RZnZySXk1YU0rSWtjVDBXUVozTVY0bHJ2UjBUbWxo?=
 =?utf-8?B?d2s4aDVlOXh4UEJYQVJVTktKQTIxUThoYnQzZ3luWUJUQXo4bWFWbGJkSGJm?=
 =?utf-8?B?VnA3REZ2a2d0ckZCcWNqaVErcnhITldBUDFCaGFFQVViaWlvUnUvKzljUEhJ?=
 =?utf-8?B?L01GOU1tUWl0UFNLa0w5ZWVBWkJKbVlRU1BvaWV4SjRWZ1dMdkNBU3Vab1lt?=
 =?utf-8?B?NkxiaWxDb1hGM0hYM1NQSVpxN09sclgyN3J5ZFMyUDRRWWtGenFOcU4raEJp?=
 =?utf-8?B?Mkk1SjlFbU1OK1h1emR1UEVSUjFaVW1UcmVCZUpQTW42by9LYVJ2S3llUU9M?=
 =?utf-8?B?cVU4Snk5QmNyekZFak8ySnVSL1FKU1dSR3NTOU5HbDhBck5aQ25BZEhyWExy?=
 =?utf-8?B?Qnl1Sm5sNnlQVzRjajZYcmZFSWIxMjJkN0NPN3o0Q1pvZkN3dVFRemNaNzNV?=
 =?utf-8?B?N1VTNUNxcWExcUhZMTFGT2VIemtVWDN3L2U0RmZCbFNINi83Wmtva1hWZUIz?=
 =?utf-8?B?ZTZkVmdTYkhCYW9vcUF4WG9VZkYrRWVPd054Yjk5OGU1T3RINEFKdE14SHpJ?=
 =?utf-8?B?MHJJNTAwcmxjKzlnUEVpa3l0bkNJZW8yNGY2TUt3Q2FQZGtZOGczZnNxWCt4?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee818943-23f8-414e-709e-08dd462d5459
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 21:37:46.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nR5ZUVok/jvUPVyZEmDX9nP5E8yHRnazvRN8E0qAdKymSfx2//et1e87Pxe9/l6t4/wZf8+uapnHBrboJCg0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210877

On 2/5/2025 12:16 PM, patchtest@automation.yoctoproject.org wrote:
> [You don't often get email from patchtest@automation.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/uboot-config-Fix-devtool-modify.patch
> 
> FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)
> 
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
> 
> 

This failure is a false-positive, entered here: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15736. Please ignore 
the failure.

Tom

