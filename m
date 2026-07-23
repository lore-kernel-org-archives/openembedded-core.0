Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2630EC531D1
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:02:52 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25600.1784818962728381844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VOd3jjfP;
 spf=pass (domain: cherry.de, ip: 52.101.83.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+00/F61oR0vYZffpS96t8ZUAtCmzazMLxUQJfiGrU6x7/53k3t8ILe5H7tnYYP8Vpt6abdwhbY1MouChbrZV6C2CPyrMg6dRpWkdtP3JeMKdr7YcQzDb5CvMtOgv16mOd1HF1yu/38E4ua5S3jzPB5pF3iJkoTFmv9L+yT735SnaKf/9HBXhYXQzVXVoYaS1KETZhhNtFteFt56azqIj0DU0AI7qh2G3b/9MQqQ6u/K1Mke1c3td2KD6DGPltOBA0GiAraZLeaZj7NciGHtV5ZSVJcWRdo9vh709cK79WushvhUZgC7MoJIoFwcpAI5MZMg7YGXpRj7xWyzQ7hYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn8AzFbibbQHXqRazP60fyPT0iLD/D1hMUx8l7iPHpo=;
 b=yXuDXQsALJzQgSDNw9hPdj1+NoLNIr/tDDzmSi5EuosqeGX1yREr0+/F14PQNQq+h1FybJ66e+ty4SEY8hbcbN8SZcotA1RWRs+xJOP3VUjA1Cl3d+8kKdcjB+IYD9VX9KgfrsnZkPfVCPlUDABlDynHP+MrWYfKJAysYX7XhxMhOdBA/ETkEa/SGhpK0i0w/6SeTAUKO3X9mZChWyLuCdhDiCWFAg9NtFcXn7mAFYJPVqMoHujpeuTISyseK9tQTXUivDAAXzQPNorOITFvU6BnZY+v7ehrPhNjspmShTL9TNZJPKvbOgvWJGd5/RWjOuBYNvj3xyAbdgjBSDs93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn8AzFbibbQHXqRazP60fyPT0iLD/D1hMUx8l7iPHpo=;
 b=VOd3jjfPeg85crDiOk5u1l5xRd8nfvMzD08+yniqueyDQTdvWCgOEh5Nr7xWSS27pglCkyanUPgLXcEljjDjIKzIV1KVmClrD+5iv7of+gb4jhhrJGJBAr1dSglmK3BfSeHKtbZfCqDenrOIr51eVBRAu9mvtI9dVmtO/+fiYrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAXPR04MB8528.eurprd04.prod.outlook.com (2603:10a6:102:213::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 15:02:36 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 15:02:36 +0000
Message-ID: <2a1f01c9-e9ea-4233-9c0c-5f3d1d35dfc7@cherry.de>
Date: Thu, 23 Jul 2026 17:02:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] libseccomp: upgrade 2.6.0
 -> 2.6.1
To: jaipaul.cheernam@est.tech,
 "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
 <0101019f8f631dbf-218257e3-e261-43d2-b5c5-22bb30cf356c-000000@us-west-2.amazonses.com>
 <DU7PPF66507B2D750AF512C9E0859CF2513F3C02@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DU7PPF66507B2D750AF512C9E0859CF2513F3C02@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0093.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::10) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAXPR04MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 23afd0dd-4b2c-4484-6aaa-08dee8cb6eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	liMOxGqDmmyHLyLGLg/V9x/7IWHGZdQ/MQ04LT7t7GDk4iKV5YEmwxHbzcAlJuqC3sYVncnsuUlyI+waRZUwQPHrJ1Ei3athksNCQt7DxSQGWhxK95VKp5qyIA0vwKb/V8uPQ98fDSpXWM6fmKoHSQPuzf9zBBEp7JZExtZlUcDD7q6vyMpVA1MVDGN2YnDEhVXCavsd/l1nyApZB45stVlUgShF8OIJJf1mPrGIvu+PafSUHXJ6cRREswFcsXTGm19zxnkFlcenhBuA7FeFcPR6UCydTiQ7ceWP43iXN8C+v4HtuQKE8gDt/I9/S+z+Wn8OqkmqFwK2jEmXnIv9OFL5QIRG5fowq7OBXAE2ai8gVK/KFzWTVT/XtbiYEb9M+OSyB/eC2EyZsY5O5LUUZbm8XEa/3FK886Yux+NemZ+ldch9062KN3M70t6c2FDKs1vQOMQH39+m4dwiy0cVCYj5A8laRk7fzqxR7hl/4tQzC/O/y5EOuMP3cIkJ+wl9C0+NMgFi9SabCO4FPYlsu7GGjvq+krutIrMUP+qSABnmFcdpeC3zloO3rn8Pwz5W+j7QA0Gczclk1/k5TEmmrmnReyhmzxVd/ttTJh8x/KAfAqr0HjTBg/taMN2CZvFMDLaWvhsmsz4kQIiQR8T96j2mYdCFh/3RsHL6KSHYxYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0JIM1g5MWZTTVJvRGczYUkrY2h1emhhY0h5Zk82TExuelZCemRMT2lPc2po?=
 =?utf-8?B?STIvYXJQWTJOdHlheDlBSERSMG1hd2piMlQvczNDL1R0OTJjZ2RudGVIVUE1?=
 =?utf-8?B?UlplbGZobWxKMEVSTFNIK1cxYUl0RHpTSHN0U3JrRnlhdXVqMXI5ZmVjTlpj?=
 =?utf-8?B?Rk94aVRKYWE3OGxRTk01TXhwWi9nTmplY2V2S2dlcXFqWkhZVUhPOHhkUFlK?=
 =?utf-8?B?Y2pBNURyS1VENXcxemVwTERMM1hUYUFLNmUwNFdLNFJ5N2EzWm1qYTk4Vk9D?=
 =?utf-8?B?NjVmU2dBME9ORmR3enMxQzZuLzVQT3lXUmdzS1BwNkF2cVpBdWN6LzdqWGpD?=
 =?utf-8?B?UHE5dGtoZUw2cUs2SGlCVzU1Tk1CU1pCeGdBaXp5bjJUY0FwYVJWaDl4eHhz?=
 =?utf-8?B?dkNJVzQvQmcrSm9PSVlRS3ZpZk8yZUxGK21xcjdVM2tIeThxTVptdDB1MEVy?=
 =?utf-8?B?RDR3ZlMxaXk3ODQ5aEhRNjNQT3dib3lrdmpaVk52TzFYQUxucUZsMHhsdmor?=
 =?utf-8?B?N1pJS0lqc0JmT2hvZnRxVlVPbnhVQjVvdy9RRlg4SER4R0ErTGhwOXY1NXhP?=
 =?utf-8?B?L05UdDlNV090UEVrMzFVYjFyaXN6N0hPdnlrdDBrVUY1aVIwLzduaStra1BS?=
 =?utf-8?B?a0ZmSWZYaUdUVDl6NmJaejVNQzg4V0RQQnJwM1dpamFlbjlTQkhvRzlSS3A5?=
 =?utf-8?B?RTBSSWV6N0UwUHBPWUx3anZEbFRtMGFrTEwzM1B6RjV4SFRvMWxmcDhyQ201?=
 =?utf-8?B?MGs4SWwyWHY5aWl5RXFlVHNOVklFUXNOQzNnVVBxekV4QytXWWxDK0pWNS9a?=
 =?utf-8?B?a2ZTaFh6aEVOeUdIRlhicWJDd0lzMVFJdUEvcnNMUFliZTM4eXFsbUdqc1Vz?=
 =?utf-8?B?a3B2ejFCMWFsc2xweHI0SVZobHo0Y0dMU3Q2OHczc0Vpa1FXc0M4anJHeUsv?=
 =?utf-8?B?K2hmUlN2c3ZYQVdZRFVoWUxvOGhVNllPaWZyK2lXSXBBQlAvRzZkOUJYZEYr?=
 =?utf-8?B?TkZIV0E3L0YzZkJVMlZtQ2wvblYxbnpsMGJKTllpWTJOOFpiYjRYdWJpYXVn?=
 =?utf-8?B?WGNDYUtEK2h6blZXakhXajdNc2htRHRSS3JuQzBBc2ZQZ3NzT3hEWVNsZ3V2?=
 =?utf-8?B?TlNDMUdJajkzWlFFNi9Lc2FmT2U1OTJjYjRDSjUyekdzZkJocTRIaVEraTUz?=
 =?utf-8?B?bVlWc2xlVnZjWVo0dEkvZmthNmIzUEQ4YzZJV3cwK3VLZ0FtMU4xNCtaVlJK?=
 =?utf-8?B?WVRPTGFRb3pOb2Rad1NyVE1VY0ZDZnhoRDU1bGo2VFNPNzRGVkJzNjg4MnZT?=
 =?utf-8?B?a09RWElzTkFtNE85SmdqbmVYY0h1TUFoNGJJMlRTOUd1Vjk0eW1tSUl3dG5m?=
 =?utf-8?B?U3gzcUprTUwzVGQ0cWVPSFgrWjROclNNL2t2M2FVbFBvdGNTU0ZkSjlSQmx5?=
 =?utf-8?B?WkZvZGJKUVMzemZ0blIvUUxHK2VZUGk5ZUNuT0VhbkV3RVZkVy9SODFiTmpD?=
 =?utf-8?B?eE0wVjlJQTJCYmU1dFUwWHgwL2hoRVNROWRKVXlrSi9zc25vMnJ6ZzNCRW5u?=
 =?utf-8?B?WUhGb2tVTitvMXlZUE9YQXJ6bC9FRitxd3RvbUtwRmVKVDZwWXJ3RHJ2cUVi?=
 =?utf-8?B?dXBzK3RmV0tTK0hORmZabEtSYVFjMktmaDYwakFvT1QycHZZSXZtUFMrOXRU?=
 =?utf-8?B?NHFuTCtUdXVGeCtkTGFZVElNK3pUYjlTUXM1bkhSZzhJZmJJdlBraHpHSExW?=
 =?utf-8?B?OUZNaCtxM1QwK3hkRGViUE93Wm15WkEvS2VRWFBoakwvQ08yMWNJSkdkNk9Q?=
 =?utf-8?B?Mm5rYk1mVmpzSWhBQ1Rxdjl0MFFzaXQ5YzZxSVpGSzRPeFVObUppUlYvbzJM?=
 =?utf-8?B?NXdOMHNucXFZdVVidkJNSEdUQU1xZWsxcEhMMlFacXBtYkg3OWRDalZ5eW1m?=
 =?utf-8?B?WW5KMDIzZWJ1ZWJqKzRWbTAvZDJrbnp3bkFNSjVOdllqYTFUcmlNMU5qRFNh?=
 =?utf-8?B?YnBPK0k2VVBVd3doc3RqblRIOWRZRUFma0wvRGxhZGppYS9GekY1MWZEQlgy?=
 =?utf-8?B?dXNYWWEwT2VmMDRQS2RjOG01QXlzL3Y4SEdLWnZ2V05OL1AzQUs5dmNvY1Q4?=
 =?utf-8?B?UnYrblNVWkJqVURqWnJTTUlHOGFnMUM5UFdRa2RZUVNhSU1RTnRqZU5RSEtO?=
 =?utf-8?B?NjdCd1ZhL0ZYcHB6UmE0d2VBTjJtT2RrS0NnU1E1QTA4WGt6emhuMTFKTFZv?=
 =?utf-8?B?L3lXdm53eXVRMXFHc2h0dVF5Q1hzVGRwUVc4ZUtIaU9zT1A2T01lMkVVeUVN?=
 =?utf-8?B?elFJcEJtU1VIVXFNTG1kVDIwaTBNQXlKc2dHcU9STzFFQ3ZJMzliZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23afd0dd-4b2c-4484-6aaa-08dee8cb6eac
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:02:36.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA9nawE6VxuKvXUitdTdf/QPQS0oaIF23hB/O3cHASy7zj2gAQV5oSxBj32yHb6WpgKJDc9wLTwJytNViFkuHg178lkky0DzBObI80RwRos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241854

Hi Jaipaul,

On 7/23/26 4:58 PM, Jaipaul Cheernam via lists.openembedded.org wrote:
>   Hi,
> 
> This is a false positive. The @v3 flagged by patchtest is from a verbatim upstream git log entry:
> 
>    8e31cd254be3 github: bump codeql version to @v3
> 
> It refers to a GitHub Actions version tag (actions/codeql-action@v3), not a GitHub username mention. I'd prefer to keep the upstream log intact rather than modify it.
> 

That's not the point. The point is that GitHub is stupid and will notify 
any GitHub user wherever and whenever their username appears in commit 
logs on GitHub. Considering we mirror our various git repos on GitHub, 
we have decided to stop having @xxx in commit logs due to many people 
complaining to us.

v3 is actually a valid GitHub username, see https://github.com/v3.

> Happy to resend with the @ stripped if maintainers prefer, but wanted to flag this as a patchtest false positive that might be worth addressing in the test itself.
> 

Please send a v2 with this fixed.

Thanks!
Quentin

