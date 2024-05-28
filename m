Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F8CC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:01:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.135])
 by mx.groups.io with SMTP id smtpd.web10.18412.1716890503227645402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 03:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JwPPGbQj;
 spf=pass (domain: cherry.de, ip: 40.107.22.135, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/kgOKysZ+6f6jeJshcCPpw5wk7ZRUOuluuBvw6PllkO4H04DMGUdt7AxsnjUhXg8+v6j94XQ2lYlmdVDwXO3SCgPR0/xST/Yjmevw0Mio9DGb9FTfodfELgYlwYwnV3q5GIKFWFeCUqOMVMjKu8/kjJzyAsVt/Y48+/1JpUxzlcKNkV832t0XQg+ifQDkHmtLPVGFbsIBqxPLSBa99218r7bUW/EC6ZXX7hzwrDhdbAS8BXPcRQ6bKdp/qoH726SP7Rs3mfQ9GXaYC2B1bf9NoUcqDx+gdniiO9V414f5Sy2omQ2Wxq5WW/kJSiLgi5dWk+ODZib52pX6UV8Vlvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWVeAg7nO4wl77bS54N91TIjoS0PJApxZzcsMTnb2gg=;
 b=Yjw3r0/ssGJpn27adYEcd1QSgMC3ePkiVCY0IvBBWpDr1xv+QVtapIlqPGiBCnG8BLn6PJTNboRA2PNW9gcPjL+1NGWZvDwPnYVReQKRk+nmNJSXs2OwsY0qFD1xnR3vc7XY6mqx4R1tJ2QE+b/LRCFFj+QgIHN8YP81FyZIZkgBcXl+2b07Dw3qXMJmwuOTV4uyytQUTs1RGAmNtN5+HvvVKYHUphnKuPkoNnNvOnisW4I9CnFzrXjRJHjS5DiWJAe57YU4cBwxCj+wwX+crVPfE1tFq1gNwySG3tdRxk1jNOu4AcMlHRhYy+/YvB6fVWKWUvQBzqFkz3Tf+0iRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWVeAg7nO4wl77bS54N91TIjoS0PJApxZzcsMTnb2gg=;
 b=JwPPGbQjs248u2JaoLh6/7t+Dx1PkT7B7xQrou0LgFvBC7ikDNLl99Ap/w4MAlXBTpoan033HMCuTgcamYGP/KyEJNBOhWB/SKK6V0y3FbldtfrKHrtZDZqZo3XtTHu9SmYRzWB+k5mjjvmiyJNAafOi4HYvFnCIpnzd47uecuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 10:01:36 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 10:01:34 +0000
Message-ID: <d943f300-e170-4829-9984-48a3bc6a22e0@cherry.de>
Date: Tue, 28 May 2024 12:01:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: mike.looijmans@topic.nl,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
 <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
 <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
 <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
 <da23b251-8a2e-4bf1-8c96-812593f52d96@cherry.de>
 <4a28c790acf8e06fd67761a6867dfe5fe412d8b3.camel@linuxfoundation.org>
 <f3d14378-3a29-45f3-bea4-9a8ad0396a9f@topic.nl>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f3d14378-3a29-45f3-bea4-9a8ad0396a9f@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e733d1a-d273-464a-2386-08dc7efd2836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3V6THZ3MXBndGlDS1BuZ3VpVk9SUnc0bkN5aUhYTU5FRWRhYlczTmlPMjZU?=
 =?utf-8?B?N1MyZWI3cnVIaUYxU1JtY2N1SDBwQ1JtQXJEci9WMmU0UHRKU1BtOFREMWVY?=
 =?utf-8?B?Vk5mTEhpTDdPQmZRSjdCdVhaMzNpSDVBVzFPcDh5QnpoZDNlWEdLMU1aVnRt?=
 =?utf-8?B?UDFVdHRNNTFIRXdKWEt3bUtzTGR5VHozVEFMZUxiVGRhdC9ybnRveThpYmUw?=
 =?utf-8?B?Q05SRjNHc3lyRjVJLzV6dk02SXp6QTBuUURmYmROWEVDdllzNitSK1AyS2NZ?=
 =?utf-8?B?c0dTZ2dEZnFhcWpRb3hVM3owc2tXNU9rcjBXU3QyS055eVlvUnA5bXVSbzVw?=
 =?utf-8?B?UEt4bG9Tdmg2VlAvUFJXemx3ckNzVG1vSklhTnY3Y2FaeEhkT2x3dldVUDV4?=
 =?utf-8?B?b21jMWxaNWxZZU1NTlMzVHlLUzd5S0RIblIzTVI2UHA2SmZwMkJkQWVFUFo4?=
 =?utf-8?B?TGhmMk1ZTlpnMUZ4cEk2cFE1anZsSXZjeXhQdndPbktRcUI5ZENvVldPcHVQ?=
 =?utf-8?B?OGxtWkFTUVhRSXJKazdtWGdvaFFma05ESjhaeXdnR3ZGTHJNdU1YVHB2V3pJ?=
 =?utf-8?B?Zjh0dmJQTU4xZkpoYUYyRjlqTWZrbGR2cTNHR1JiamQ5SSs0bm5Sb09GU2tK?=
 =?utf-8?B?UEJqYXlIbmdBY1Myc21HZXhOZ0Y0OERxWjRXVnduUzNiS296enc1ZlYxQ1hB?=
 =?utf-8?B?OFJpSC9MMmhqZ3p4SUVRZk94amYySElUTDJNL2dvSHlGNHI5ZzZDc2JYTUtQ?=
 =?utf-8?B?bFJlVDRmZ0ZMZkhBSU5XcWtOcmJzSkloZzgrRlZYMmt0MEZ3Y2FZbHBsSTJ6?=
 =?utf-8?B?dFJtWWYvenlyRERURkt1U1g4YUVUM1d2bkpPMzJiYk1RN1JRZndnMjRRc2hD?=
 =?utf-8?B?ZW5QS1A1ZG00VktRY3I2YXJxc3JzaWw0ZWlzd3k2VS95Q2hVcWRvcTBSbG1r?=
 =?utf-8?B?bytqL0tQdUtZczhYR2ZkdU9ER21NOWdyYVkwNDVObjUyVnhRNlVVMXR4akJv?=
 =?utf-8?B?WFZRVlIxTE50NlpCbWxyWlpZVW1kWmdJZnh3TFkzZWhrc3hhMFAxNTJWMFR4?=
 =?utf-8?B?NFNlRWNQd2ZiQUF2MnUyd1RxREVuWmluZXhqM1Qram1tY0pXYWtuR0E1VVVS?=
 =?utf-8?B?Ulhvci9HSTZZRkVJSndjRUJTc2JYL3ZsTjFPaXBLVzVvVXFjdHMzY2htWTBS?=
 =?utf-8?B?RGlZa2ZLRzhDZGpYbVFod0lwRjFqOVkvS2RJbGJtY1ZtdC8zekRFUW9Kck5O?=
 =?utf-8?B?OG1XTDJwUnFaVUVoUk1JZVRydmd6WWpHSmVUNVBhNHFROVpqSGMwbjJBQk1z?=
 =?utf-8?B?bXFUZHJHeXY4Q0lhMXVHT2ErcGM1TmY5ZGx2cHBZZFZNUnVlbDE0UzZGQlVz?=
 =?utf-8?B?bzVwOURDY3BYMTZ0K2IyWWw5Z2oxZi9zeUEvbEJENkljTzFPYWVlajlwbjEy?=
 =?utf-8?B?UzFscHh5R3BYaTRkTGtmZzNlZWo4UG4zVFYvS211RERiS1RwKzZDemxMTEw4?=
 =?utf-8?B?S2dFMXdvWW5ScnFRWHhEcVM4UjhOVlY5QUt3RjRUNWVqYzI2alBTRjljWWJT?=
 =?utf-8?B?bDFkQ3lUZmpyR0RpNFFOU0VUOUJsOGQ0Ni9jSW9DdDd2MnhKTDRhbjFyMFYz?=
 =?utf-8?B?MkxRRWt2dEI2b25HeFJadGRtRUdSSTIwbFVwdklRa3lmK1ZJT2hzcEF3Wm51?=
 =?utf-8?B?eHB5akJBc3hjbk1YaTk3UDU4dk9iQkdoZzZDMFAwVXFjSDFvMjMxd013PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b01Mck5lRnRhckRmL2JPcFU2UDdxb2lmdXcweXlmamx4bTBVangwdG1qSEdD?=
 =?utf-8?B?Vm5KbkhRYkUvemkwY0xkakFRUTV1QWo0RHFGaXNWdHoyTWdTWW1VMmNYQXdF?=
 =?utf-8?B?WVJNcXZ6d0NQeTFSWXN0aFNnaVozczZuVDhhN2ZiNTJIRzM5dkdScXdpcm5h?=
 =?utf-8?B?WHRTaHpqTXhVQlUxYytDSThKTDVWQU02am1NeURKRGxnQTR2ajM3YjNQN3V4?=
 =?utf-8?B?azlDMnJMRllpckliVWhKYlhVb2hvRlk0ZlNvcWNPMStIMjFDZUd4TkZ4YTNK?=
 =?utf-8?B?QWc0enVGQ2Z2dVdHZStGTWRzMXZjd3Y1U1Y5L3M0K3VxY1ZsN2hyYlJscVlT?=
 =?utf-8?B?KzFDa3JVR1FuQ0pFb2EyOTRxbmpJMDNhQi93dURKU2dJMzljdklGbTlDZkln?=
 =?utf-8?B?Z2F0TDdhUHlIeDNlak9LbU1QQWFvOTJEcm9KSGg1OERJM21CQk5mUnJIQlNh?=
 =?utf-8?B?WjhLaXRGQUY2cU9Jb1E5d09FZENyN3Zwc3B3Mk9jL05QSTA2MndlRDd1K3Jm?=
 =?utf-8?B?M1FtNUFIb1ZRUjhDQzMxeDQxeXZ4SzdXMjhqQzJ4bGJYUEp6cTlQMFdWRFA1?=
 =?utf-8?B?Y0t3TGNGZmRGYmdjcGk0dUNSTjdDeDVLUWxRaWI5enpJVTZ6U2Fka0xaWE5Y?=
 =?utf-8?B?UGtjQkpCNThreEZqbnF5K1o3ZXlzMXJycHV6OXI2MHhreDlNWElMRDRzYmV3?=
 =?utf-8?B?QWVsa1hBWG9hVGFBbi9Zb29HYlFKcHA4Nlp0WmV5cWNkdzdvT2YxZSsyWG5u?=
 =?utf-8?B?QmlsQ0NMVnV3QnBqbEt1ZzBhNlV0elVwQXNYOXhzMGk5ODE4N1lWQlhRdWQw?=
 =?utf-8?B?Q2Y5cDJiMy9WcW9ld3krTDhnVUFud3JDeFlqV2gwdkFFN2VGa1Byb3dmZnZ1?=
 =?utf-8?B?UVRxZFdRUlp6Q1RDa3djUGkrTXFpTlZLTWlMUWd6R0ozUXlNQUJSNkFEVW1l?=
 =?utf-8?B?WW9FVGxrMitiblI3SnhVdFAyK3pYYStFVmVtek1DcE5zVkxJZkcxOENyWUpL?=
 =?utf-8?B?NkZ3MWhPc2xpZ09mU1R6dWRUQU8zRHB5bGRMZVcvMnlDa3k2eVFKTzRkbTlU?=
 =?utf-8?B?SzcrcWwwT2RLUlY1ajlUU1JKb28zZUkvWEZISWVjWXVYZCtDbk41ZXdaUlJJ?=
 =?utf-8?B?SEdrWCtScGNuNngzU3BwTVlYWjhqbldCNStYbE5Xa2FkaW1JL0JNWFpObnZo?=
 =?utf-8?B?QmttcXdXejVkYzNCY1R0RS9jRVlzNmVRV2Q4ZlBDc0tVQjdnSmFJblR6dmFY?=
 =?utf-8?B?MU9vcEFJc3RjYnpIbmxubWI2TnFnOWliYS84ZC9BeDEzTSsvWjdtdTZjZXpw?=
 =?utf-8?B?cDZxZTJVcTMvODdoTkg3NHR5Y0JIdVVhWmxTcHFEbGd6VDhMdkg5bW1ER0ox?=
 =?utf-8?B?SnpzVXRKMFIxY1JZellhQ1YwMURESU42cENOVTlKU3VOYWxCdVA3YzFER04z?=
 =?utf-8?B?NzRhRlVnUktyTFU5a21pcGhidURhY3hpTUZEdVlSZlBXTzk4Sml3UDh0U21O?=
 =?utf-8?B?bFJ2T3dDVVR2YlFHdzZNY3ZPQ09lOHdQSGc1MDNKL2UySWNYekNVQ2NSOXhR?=
 =?utf-8?B?bC9najVvUUt6dHR4MWIwNzlCR2dqM0pSS1pBZm1QYWV4a1JvZXd5R1hJZXQw?=
 =?utf-8?B?QnhUSDVCMEc3RGFwamtBRHoxNHB1WlU5akNQYlptNUJPOGNlRjNPQVZIZ2sw?=
 =?utf-8?B?NmFXY0QvZkdYelNqMWxTc0ZBT3hhcXlCa2c3VEtCSmZldmZFeXF0U3c2L3Fp?=
 =?utf-8?B?YkpVdGF2VUJZZ2Q0RnlER1B2akxzaW9xU0JabTQ2S3BtNVlCWUFqRVY4amFl?=
 =?utf-8?B?enJpaGtEZUVzTHhvUzRaVXJpaGpIZW9lUW1aU0QvTFBWYys2NFllNjhFcjk0?=
 =?utf-8?B?K3ZmZ2Z4empMeS9LSjJwZG5WREFyR3BuaS9ZWmg5WnJ0Y244TXg4cngzVSt5?=
 =?utf-8?B?UDlHWkMxSkhEUzI3K0liMW9TcWEzRVgydzR5TFZHM2Fza29KTFdQSkhHYkx2?=
 =?utf-8?B?U0dLcW4wdkM4WjBqa0FaQU43ZkN3WTI4YXhJakRzOTl6MkZidW9UZjBITmFn?=
 =?utf-8?B?UE5MaXlhbTFmSlEzQ0JscDJNbGdCNStuNXMwVUF6WTFtaEZGMitrZGlCN2Vh?=
 =?utf-8?B?cW8waUR6L2wvV2xOenR1bld0N2c5R29nVzRrOHgyNm95cXR0Y21RbmpnVEFl?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e733d1a-d273-464a-2386-08dc7efd2836
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 10:01:34.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP9cG+JP5AFjWU3/Jikuku9tgw6wuJ0VGp/wttoyn6roONnxQU0PWCpJ1gfr8rdeCm5H/5S+1NfGrhy49byyGve0CIDgIEE15UKza1D0DOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 10:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199966

Hi Mike,

On 5/28/24 7:20 AM, mike.looijmans@topic.nl wrote:
> [You don't often get email from mike.looijmans@topic.nl. Learn why this 
> is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 24-05-2024 12:22, Richard Purdie wrote:
>> On Thu, 2024-05-23 at 15:43 +0200, Quentin Schulz wrote:
>>> I was about to comment on the v2 that this should rather be a class :)
>>> Do we have some information on how/why this is the direction the project
>>> should move towards? What are the pitfalls we're trying to avoid, or
>>> benefits we want to gain? Or is this just some better/best practice we
>>> want to go for?
>> There was a post from me a while back complaining about repeatedly
>> splitting class files into smaller less manageable ones so that people
>> could access some variables without the task/function side effects.
>>
>> I have a belief that more configuration files would help this kind of
>> problem and make classes more specific/focused and usable.
>>
> Okay, so what is now the way forward? v1 or v2?
> 

Go for what Richard asked, he's the maintainer after all :) I was merely 
trying to understand the position of the project, not suggesting we do 
something else.

I think you've already sent a v2, so just wait for reviews or for it to 
be merged. If it isn't merged in the next few weeks, then send a 
reminder as an answer to your v2 asking for feedback.

Cheers,
Quentin

