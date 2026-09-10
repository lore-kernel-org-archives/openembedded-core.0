Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE1C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 21:06:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25402.1789074375281347629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 14:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=J5HG5zsm;
 spf=pass (domain: est.tech, ip: 40.107.159.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9iYBLnucDMIEZMbEROasuup1rmubhBV34qHcYgHOHyD5Oiyp3nJVy7h9NYVPTT3kxY7bqafFOgwDZiXEHz0oX3U/jw1zfY4jODgPbP4D5OJaEexjeHl6bA0Ts5AfydbuNDGpYZLx2MzXngh+nisKq4lV7UzHeR/Agjf0ByOUn1H5Ya7ePLD1h5AkE9PBERERVN2c6+3vBY8WC7t7y/1gG2lAkuOrGNfvAAZ3rk5qRZ+LOXmebttH2NVE21hA2QK44D/vsum34rLzH569MmqAmRLfZG5BB3ofRuGV7cbg0siu4UU2KNaEP7zhvv+ApFKRIdE8E1sVpKY1QEchIeOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB45oYV3dTppQs5xzERQm+7u6Gw2S7OweaSCGu9E/kM=;
 b=V4Ogl9m7/BzFd0WQIOI3wLwRGgexnEujQx9ZVSD/fbJl4hvlM5ggsBJbFmmzWhTkbaHcKhtNReMLHfgCpV9WyZTBlQjcix7wtDt7d2Aw014i56HcvHdz/f+fMdMpmWt6FkEUySHxggfbTmtX4awlaajKUqYityh2RwYgRG70XoXm3hNfIQ05dJ5lOxBNVbTEDDTO/NgdrXCHlSscCdkjLlzO/bQePUCzJe0ZSirc3/cdmruX8X5K5M+O98+lPx2O3ZCzTb3/nget3Uk3OVDSyQRjZW1VPLcFC1q8B4mVaeXrlQVS81t/Lcnld5UwqTzD3/zHvpabzTFHUrkmQ8Xe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB45oYV3dTppQs5xzERQm+7u6Gw2S7OweaSCGu9E/kM=;
 b=J5HG5zsm47SJknefNFLLvDoxU6ebg6O/dnVg5DVINrk+AeAePXOafkawQlMULTH9ZDErJh6vuYQjC+RnTTKb0yC3pu4/etuDlqstvWNki6Wryu/zfJs91BKSVgCRYjSSCV8ueOmYV/oVq9VfRxbDiqDXKrEjRnL7D4/xvbJbPaRXbozL4WWwKi22JtMo5waM4um66+BlwBS/cpLYrOIFcGKt98lo8qNIePjdeIX/4XtNnRdDHKkCoCcFH/q4zawgIVNW48dfMKy5ocpJGIoFVCPCndZgY3E4SKSw2xtNeRkUK4AFT745vpRRaxtG8FFqeATlQUqHjKtMzdoOqTtkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3577.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 21:06:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 21:06:10 +0000
Message-ID: <9e7b33da-c8be-4a77-893c-37c7afa4701b@est.tech>
Date: Thu, 10 Sep 2026 23:06:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Areas we could do with assistance
To: richard.purdie@linuxfoundation.org,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3577:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c2ce8b-e499-40d5-d467-08df0f7f56d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ax664wHw9rAksPmHPpwSeXcR0BrJz1JPDj9d9kvu0F1VFcXZs8gYizH+Q03S/l0elr06Uou4k3yUxaKqFii1Rzw77QtXM7a6GFy9CGwAnuEHunHIBV8DXvfAlwvJNIQ8bENM9PQlyPMn5L0UbH5RMQaHDEBnAqbqMPOcUnFoaJO6cpkQzYiprVFJYeMQaVtCi7FBPPBoqA0pkEQ+ya+lxetu+D5PKUixidlFe3VznV4BYSmcriVE2DVdBI+BMOJx92cf5++eohNRHAiOxMiihWz1CEFdOVneJfUV4hBVqnzw8PMT4lZjzPT9URHCNcYUWap70dJqT9e9QYu/o8isHMqf8PeHMjNNGlQGVjB604YPdGCXgwsP0lZtsM6JD+0lXbR/g/ZUkyYXE/yHSn6nWa0Bjt80fWOi0cVkW2lZmqrw+AxYCMHPqhBZKecBkN2/Pc/e7zptWUo+4BQ4W4TGp4seZZP7dS/9LSkv8+/UjrRIlj+GZbcAQ4BQVCZBEhjk0T4ymNnfL6gfW4XsHXC1SHz3m3pcgCIYRtDPZTuCn4fIxWg3pjA9aaLNE1lRVAZ4lHotH1V8Whm8QkybZ79s0+sXQsM/PgwxmDAvv82Td+4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3I2RTJ5NTA4aUo4RW5rL3NvNTBtKzVnMG9zdlgvRnJlSjhFZnBTd0hUK09v?=
 =?utf-8?B?c2h3UkNCNzFuNUpPNXlrS1U3S3BWazBhdnhoVjdnUjNHTUhQQnhFeDlpS283?=
 =?utf-8?B?cFAzc2U5R2NEYzVCaHlXMG9nZlRYSW9SZk1PY1hpWCtXcnVlUVVOU0dFOGJN?=
 =?utf-8?B?RVUrSlI4ZGh4MHBWMjFVc1daSktDTXBDME5ONXhLL25FbDg0SnJseDBmUTBt?=
 =?utf-8?B?QU5UbHJISUNJZTdVcGVEN0dzN0tXbmtqelRlMEN2TlZCc3hEWHdMRjFSbHAy?=
 =?utf-8?B?WUlTdUUySEkwUDA3cmo5eHJqV0k5OWVEWlJRL1F1d2VUK3hRUWVQTUxzY2tp?=
 =?utf-8?B?SnZvOWo0STI4YzQvOEExK1E3VVJBTVRPTVo4d0dza0hFSnRQbDhZdlh0MWdm?=
 =?utf-8?B?WHFKMzlTMzBoU0dOeCtScUhHK1ZDalppaUt0WWZla3NCQmVJOExRUHBXNWU3?=
 =?utf-8?B?MU5yZFRmdXdLSTdUZGI4MEJzamx2VWNzb05MSWxJOWFxVE5OS0VNMzBlK3BU?=
 =?utf-8?B?NjN1NmlFR2pDYXZrTHlMRjRKZmJXOUJaK0dJNDZaTTNEK29rdDFQK2FNQ2gx?=
 =?utf-8?B?azNrMEhtdGhwdC9TdU0yUXdIRjZ6YkNZZGRLTHN2Ykdzc3VmTVF3ZGRmcjBX?=
 =?utf-8?B?MjhTeWt5RUxickFmbHR6YSt3eXBzUGF0R1VucGd6Qm02S3pMU0pDRGxIRlhR?=
 =?utf-8?B?QWVYbHVnL2JaR251WjdFdkNSWFJHVnJzYkQxSmxtc0pMbWZXbjhMNGozYU9Q?=
 =?utf-8?B?NERwUmpKSk1ReFBtK2ttVURFek56TGZwdkNKbXAycnJ2RUFhWk9uYWN2VUIw?=
 =?utf-8?B?TEoyMTN4WmtRL25vQWNJM1VhMkVCMDFUaDBxWUt6MWNBck9Bczh1UEo1NVFi?=
 =?utf-8?B?WllER1pBaWoxWVUwMUJCK1hZeUdDVnhzR0lVcmloRFE0TDhxU2hBVE5mQkRT?=
 =?utf-8?B?VXZQMmZnTGZURmxQbC85STRXMG5aOWhoazJCVUdWMjl1SDZCSVg0L0NVR2hT?=
 =?utf-8?B?cVd1OWRFWHB4dk9Kanl6MHhTUHZCejdhRDFhaDA3ZTg5bERFczQrVENTdit4?=
 =?utf-8?B?dmxDdzk1QWlZQ3RncEh4ZUl0VmZJRGRJVmY3WGJNaW4zVkpBZjFKdEVYT3dB?=
 =?utf-8?B?ckdsR21JOVBuOFU4dXkxeUZCaFpyN3lCYzJIWTJjU3M4RVNsay8zNkVueXpO?=
 =?utf-8?B?dUlWdDA2RFZqcEk2bzJyb01JUEJiWjNDdmRoN2JlZytnWnJWbU5MWFc2THFP?=
 =?utf-8?B?TnpKNWl0QWRDcW95UVNSZ3R2ZGJmTG9xNG4vVUdEa1o5SXk2K25zQ3BpQ0dh?=
 =?utf-8?B?Yktqa3IzeXZsTENvaUpMRmFwTkFCdzBmK0JJUzY5bU1qWVU4a1JGYloxTUlD?=
 =?utf-8?B?MVZ3VGw3c3ZDeEVaNmNXUnNtQ1FrTDdTOGdiYzdsUGJJSkE3MUJ0MS8yTytC?=
 =?utf-8?B?RFJSejBad0RBNGRDNUpYRWF6d2g5MWdkdVdaSFpUd2pSVElmNWxSdVFHSEIy?=
 =?utf-8?B?Z2U4SUZ4TGVMa2tWN1JEd09jYVI5OXV4VE5CckxxczVRMk9UL1Y5TmVON1Jw?=
 =?utf-8?B?cTVuYS9heDFNQ2RkMGNZVXAzdXNkV04vM1dBQ0JiTURZeW1zc2ZiNVBibzdy?=
 =?utf-8?B?YWdrK2REdjJzZFBYa2RSdjhGenNXbkVBUWwvdHg3R3hpaW9wU1JXaVUvQ0Nj?=
 =?utf-8?B?NUgyTWl3VlNrRE5BaDFEaFAwTXNSSlc2dUZnWHdkUWhRYWNDTERSQjRra2hz?=
 =?utf-8?B?eEdEbVVGRkNkYTVPdVVIZjFVZW9SYkJWdGlMNjBUUDlJYVQyOG5yR25PTkNX?=
 =?utf-8?B?Z0FTQ001eGVBaExLeFBmQk1kV1I0YnZvbC95ZEs0MFlKM3VLdXo3cG9hZkk3?=
 =?utf-8?B?b3o0em1kNXZTZEFWNTBHdEpnTHJrbkdCNW42aE5neDljSmFZNzloekVvYmQz?=
 =?utf-8?B?ZnNPSVlHajhtOVR4dFRoczNpMnpyMU5GU3VWZ0Z6dzNrRjFjQzh2M3lUZ2Mr?=
 =?utf-8?B?Y3FMQm9XWVBVWnNrRGdtZGxINTlnNHhiSWYrTy9MTTBzUlhDZjgzY0JaMjNt?=
 =?utf-8?B?ZGc4NytKcjZSREZ0YlV0RjBSL2R6Y01OOGhESFVLUUdjeXpGNlpxWkhlUHl0?=
 =?utf-8?B?WFcvSXFLb0FMWGZSYzRhb2k2cWkvRXVKVXNDM29vZ0srWUs1N01zV1VERjEz?=
 =?utf-8?B?VnltVi80NGNOUFpQQnZBZTNQOGt0OTluZDVhNkRXYWJNQ1FCcTlaTi9GUXJy?=
 =?utf-8?B?ajE5U2tDRDJmeWV3Z0hPbXVDaG9sbVBDV05OMEVaUWJiYjNtNTBmcWtYTHd5?=
 =?utf-8?B?NUtENjRqa0g0dVBXRVlhSEZaOWlVU2x4WTU1eE5ReXBYVk9wRHkvd2kyT0ZD?=
 =?utf-8?Q?A68CWwqWFTWzmFfMC/PTRQqK3Ld+esvVFgSeu6eKr4hoK?=
X-MS-Exchange-AntiSpam-MessageData-1: naKX7yiZ3H/cADFs5H+2SKvxhKoqXXFhTtU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c2ce8b-e499-40d5-d467-08df0f7f56d4
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:06:10.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkJ09vJp4av8sFN4KXckzLZpNDilCciSylOBCSKsQDqnY355r1Lg0QLSQv86UVwaUjgnxQqvDV8qF40fD/jwhTqd9wc1NfjdJttaegR0dBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3577
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 21:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245601


On 2026-09-09 12:32, Richard Purdie via lists.openembedded.org wrote:
> a) ptest in util-linux failing for qemuriscv64:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2369

Hi Richard,

I send a patch for util-linux and reported issue to respective upstream 
as well.

Regards,

Jaipaul


