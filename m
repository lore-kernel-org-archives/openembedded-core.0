Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAE7CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 11:26:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.131])
 by mx.groups.io with SMTP id smtpd.web10.11043.1756466751334713749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 04:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=MexvkSY8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.66.131, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVQKz8cAFBsFgUhmizau+q1U11hNthGBj/CMT6h1L6ns5IRv/KqQMcIBAdGcEcpnN8wyXNWzhoD70RG+oD2bC/skHQw7Qw88/awPSFMF8eaVtsqnnbI/z0Gw6e01B6TKVZ0DCbVEZ/2sqtA029TCiX5uW9QUEGdC8q/erNy3lgZUyYQPeSs5KS6Cup/Mlu6CzmLl68SfrIE20EOIb/xMBr4yYoOb2eBxCO/54VpcUy8v4ljfDTRMXyBQG/Ue5LR0XDp43Gw7kBZht4/kZTk9eNubQySlh7vbCXfbDs8H8J9EFm4/3016gX+qJuqzTtaaiONNewyqk5hhGtoRaPc+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpgJEjJ9mSNah/lHSbTftLsoZWVMfl+TA/WO2veNFsI=;
 b=wM8yXC3sm78cZW0qnN3WXtr3yoIKk5fGXcGwRwG7dAKYMemHPwX5EWgPrQJV4aQwlKmLZOZwBfWChJ2K3AueGa+82DDEF3KwNqIfyvs4c2FLRkOanWlv3SBXsZjb7Nq7PDEog64L6KPVKWzVEzfNtFA2UN66SPiUYrpOAkq276afcKqYxw1o7GOnPJpK5I302yKmpzSI57CcHuyd9Zt7uRuPB9nQyNrij0bCEzSCAt18JhXb+YJTlAokyl+SV9/pGkvAzlezhWSex7Ri1XFDke+U2SZ9hSZ4GUQZZydNU/ecKYxXYxo8TxkmIdOGwNjIYOzmLGlZJVw/RoNtxzu9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpgJEjJ9mSNah/lHSbTftLsoZWVMfl+TA/WO2veNFsI=;
 b=MexvkSY8nr5dRA+4yT3LdKvfru0Bjazkypg8UC5cTKWIQxKZkga8/mYxTrPAC0i2GdHOREcvnVXWgFHLoEExok8Av4+vGNbEjixHzG4uBbQAIAx7qFbyUhGhNtoQ3X7JKz5mQrhj5FVqSL5vuA9csq+MlQPY2g/25PEX/POp4/wBPjRjxnyCEJ19Tki6L2kn9Yp/vYbiMzxgNcTabOSZDVPgRU5GORx8QdO33ym2t7uigPDrCtQZBizifvLF9BBTT2GRcBeQRQYsCwtqzsrgMcJO6mddeYT9g/qzwNVRgLdDSY8vZ9w0anUesgLZjnlARBojI1wnEjL8SwdT0X5EWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8026.eurprd06.prod.outlook.com (2603:10a6:10:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 11:25:44 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9052.023; Fri, 29 Aug 2025
 11:25:44 +0000
Message-ID: <2fb2bcfc-0bac-4d26-a78f-838084bd67b0@vaisala.com>
Date: Fri, 29 Aug 2025 14:25:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1754412086.git.steve@sakoman.com>
 <4d5093e5103016c08b3a32fd83b1ec9edd87cd5a.1754412086.git.steve@sakoman.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <4d5093e5103016c08b3a32fd83b1ec9edd87cd5a.1754412086.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::20) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ff43be-d946-4f51-d61e-08dde6eecb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?azRHdEJmVytXRkd3UXNJb01XNkljMFQyMEN2VDhMZHVRUElwY2FYWDlMSUYz?=
 =?utf-8?B?a0JkMDhWZzlnZGRnZFA5a1AxNzJqM1RnUFNWTVNKTyt1SjVUcDdpT2p3Nmg5?=
 =?utf-8?B?TzVqQ2c1cGFlc2F2UTVFTEZWVFRJbThZWTNiaWJtaklmT2tYRVIzdERHeCtZ?=
 =?utf-8?B?QzI3QmdJQkF0bHJMdGx4bXFyaUlpZnoyTm9aYm5xbG8rbGxvK3Ryd1ZHVG0y?=
 =?utf-8?B?ZWJodThIK2puTDNVZDl4bXZMSWltTDlTRWJ6WWRCV0h6bG8xRmEyNXdWcVZ3?=
 =?utf-8?B?amRwbGIrRi9ielYzRGtHb2s5clZ4UHIrcElhUExISWtwMWhXZTZrcGc5aGVl?=
 =?utf-8?B?QURFdVJBRlZIeVNCb2xPOGdZb21tM0l1Vk1Ba2s3S2FxYkZGdS9jNEpsSkpJ?=
 =?utf-8?B?dVN2OW9qendjam1QSFhxUndwN2pnMUFoQ0dJN0lxM2grSGZvRS9SQk9GNS9t?=
 =?utf-8?B?dkk0WmNFbmYvOUhEd1FiVlZSSTdVTXQ3elpLK0JEOUZuSXdweG1sV0Z2UnBo?=
 =?utf-8?B?VUl5TldaSWM3OGhQUWpGY0swNG1ESXgxZEp5VGl3UmYxZkM0SGpkY1c3aVVB?=
 =?utf-8?B?bTdDQTNkcHM3cVo5RVMwdlFXZWxSWWNGYWZreHphR3A4dWdBUnBjcEdFWGpX?=
 =?utf-8?B?TlB2Q0M2Mkkra2lmZGJwUkRXcnRaSVdsN0IrMGs4K24veUk1aW1ZMkVHbjd2?=
 =?utf-8?B?UmJKQkRPRHZ6RHVxSFQ3RThEQ1hqcThBLzFkNXVCenFlbmdCa0M5QVFRKzVs?=
 =?utf-8?B?Z3YxbjNyTmI3VSs2VzZqWVJlWUZYRzlhcXpudkR5ZmIvRDl6MEY1MUZOMWZy?=
 =?utf-8?B?S1ZaWEhLK3dWcFhSeVh2KzBPRzMxNkloc3gwOWUwR3daWUZtYmMrL0F5a1pm?=
 =?utf-8?B?K1U4dGl1aVV1TU1SNVhFbmNDZW1XRk96SzJnNVhXVGdzRWVQRWFsUFRjT080?=
 =?utf-8?B?N054VmxNSHVxbFNxOWdHU0xZUmZ3K1N3TXh4bGRybjYxcW5YK2RGTlZySXh5?=
 =?utf-8?B?bGJpRlN2aXkrTVlHUUJjamZKZW5VeFFWaStVaTN5bEZ6RHZ5dzNLTFRsM0xW?=
 =?utf-8?B?ZVhCbkZIMGpuR25HYmczY3F3TW9teWIzcFVUVGhPVi9ieTFTNUZGMkJpYTZU?=
 =?utf-8?B?eHZUM2xLODhRZWcvUjBwZzBseXdaNGRyaXo4UjhyRXF1aTFheDNKT3hLZHZq?=
 =?utf-8?B?U1JuMHU3OXJDNVhpaTMrbm83R05kRDlobkMyUnVNNGJVTnJiQVhZU2Q5UkFT?=
 =?utf-8?B?Rm1uQzRMTUFTajFWaDRxOEViNHZUczNSTElpQmF6aXowM0d0bzRjM1hWUWJl?=
 =?utf-8?B?cDhrRGh3b1NKVkN1Y1AvOUllV1UxMzB2allpYXI1ZmJ0bjRlRVdlcmhNSDdN?=
 =?utf-8?B?Ny9tSlFRMnRBbWV6V250MGJuVFRyNGhCVTNObHRPalcrakQyMEx0QWlxV2tE?=
 =?utf-8?B?T2Y5eGx5Tk5XeC9DVUU3ZGU1Q2Zzb2JDZWJONmQ5cW9qQnBkRlVNY29sc1Aw?=
 =?utf-8?B?RGR6Qm1HSWtERGJ1ekVVSFBjWC80Uk1KQVNqT0lJSVRsbFRrR3hKRG4yVzFx?=
 =?utf-8?B?NXRFdXN5Ynh4czJ4dlNrV2N6OTN5RDVMczA5V1hnQ05iN2pQOE51NTZKeW1y?=
 =?utf-8?B?N1VFZUlqVmlvVTFZWTlBc0pITUFSdlJoNm9zdGJqaVEvUWhHNUR5WFAvTk1w?=
 =?utf-8?B?RmRWOThsYUNqMllPYkhXQ1lONEZWMml2ell2WVFoWXB6eUlPZjBCVDdRT2xV?=
 =?utf-8?B?cDV4dXgybHRFT3ZiRWtHdjFRUkw3N2RNWjVXcHN5ZDJ0WklPTXJOdkIwZUo3?=
 =?utf-8?B?TE5sM3F3azFxclpHR09VT0QwYkJXN2g5b3Z2VDMrQ2tnRHp0S0hMSktORVhv?=
 =?utf-8?Q?v/yp55ehnqhqY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkMwUkZLUE11RUFCY3RsZ0I5V2JHOHcrYUp3elR5Zkx2L09wbnp6Vm9vNDQz?=
 =?utf-8?B?YW5mUVBnVFc2VHV4KzRWMkNNTUtnY2Z2cnJhM0ZYN0FuQU52RTAzUi9hQ1cy?=
 =?utf-8?B?WHdWNkNBUGV1a1BjRHAwaGM5RTlaLzVGcEc2dVNNSkJxTC9kcTN5ak9tVEhy?=
 =?utf-8?B?Z3k4ajdEaEdIaGVBSHBISnpwSy9IZC9XODh0VGtIUjkvZXlyT3VwV1hLQ0NN?=
 =?utf-8?B?dVFvU3g5MmJOVmdoV2RhRmFLZU4yRFBmOUMyZVpOWXg5SnhBUnFHUFNEL2VT?=
 =?utf-8?B?UUdiQjlJSElLcTBDRkx2czBYRWVPOVhaSVFjT21MMmJUcUpXdGpTY1NycXUx?=
 =?utf-8?B?MVVXUlFoSEZtbzlZYTJTMDF1c2pkRzl1SEhsRFlsTktWZDFRSG5Va242VFZp?=
 =?utf-8?B?SE5zM3RHek5ydlRLeFBaSncxRjdUQndaL0xVbUlEcWt1d0VSVDVrOW9pZ3U5?=
 =?utf-8?B?K25oY05McjUzcCt2L3FxVTdhYzZXZ0ZWcElpb3E5QWZRSGNONGN5M21Sd1lm?=
 =?utf-8?B?YnhZWVQwbjlEZE9wVzdsSHBLOXdIMEpZa1grK1poOVJ0cmtnNldTVGp6MEJY?=
 =?utf-8?B?c0RveWFZYmtqRWxucnB3aG55QTRNeHBpYmFtSWNnUnJ0RWtOQUMyODJhakZH?=
 =?utf-8?B?SkFKR1Y1Q2lsRWViUjc1RkNFOUFGOUJBdDFRbkNydTkvYW5QVW9ob1k0OTIw?=
 =?utf-8?B?WnMzY0o5RGRWOXBYenozR2xVWUNGdjZ6d3J4UW5PR3h4dnU3b2NXZmQzQWFN?=
 =?utf-8?B?Qkk0YlBTalhJQnZmVmdOcXJTRE5tYmc0L3NzMHQvOHlvZ0dMSWZSRGVOa1ov?=
 =?utf-8?B?Mll3cGRlY2NnbUY3aHFaSmxhNmxEOHNrTEdSWGNUc1hGekdGZjl1SjBDM0lk?=
 =?utf-8?B?UFJMbkxqM3l4TlNKVU9tQlRXY1V5ZmF2M1dFRCt0a1VTWGh6VVhRRUVIVmU5?=
 =?utf-8?B?R2wrVzNuSjFvZGhQTHZOaUphU1JHSzVmd2grY0VoUUtIV3N1aEJ4Y0RrMXI0?=
 =?utf-8?B?eWp6c0xBUktsS05xaGU5MjkyNnA3MkdYRkw5aHJBNFRxaE55bll6bU16T0xV?=
 =?utf-8?B?MllmVG9WQlFQczhRMkZjek1TYWhZeTJTdXAzeTZOVE9IcDlUVjN2bVdMeFhs?=
 =?utf-8?B?TE96c2lCSDI5bnFUbHdBVmtrdHlLaUZzemlTSVFZRThCcnJzOW14L3gzaGo5?=
 =?utf-8?B?cXVySDBNNlRBTTNhNFcxNnpheDNsdThMUDNNR1FyUnNzT1dJSEQ0cGZkM01k?=
 =?utf-8?B?OWNOQjRPcitVNGRqbEErS01FUGlwY21Qb3grc2dTRk8rbDU5S01ZcHUydjZF?=
 =?utf-8?B?bzIxMjM0NXY3QnZaRjdDNitqcFNJMkZ1L0M3SVp3cm1ZMTFyVVV3emQ3bGtR?=
 =?utf-8?B?Yk5SZU1KZkpmeFRZNHBZS1RUTXVZbW9FZmhXU0Z0Z29GeERFeFlGMXpDem5G?=
 =?utf-8?B?M3N5dkNWL1ZCZlNvTkxjV2Q1NlRUeFpOcTJmWTAvS2R5M0FPbS9vdCsxVEFs?=
 =?utf-8?B?cVA3emp6enFqZnZ0VmpRZ2hoYUlISzlPaGJ1R3IyWlJQWDdHR0s2dzRZQ3FC?=
 =?utf-8?B?dEd1RGhQMzdxa2daZzl3S2ZGQ0xxdjFmbXA3YXNJaVFRY1ZYOUtHa1lUSHBs?=
 =?utf-8?B?VG9DUWE0Zzh4MzFGUmFSWUhHMkFqL3c5T0t2L1lNckpjMGphZTRrcUM2SDI5?=
 =?utf-8?B?LytxMTl0b3lNRy9pbVZGZmlDZmI3UVVnWmdGV2lDRXhhaDkzaVRFOWV3cFZE?=
 =?utf-8?B?aEdWRDd6MVpCZ09Zbk5xNGUrNVZDSGREWktQbllqcThtWDNMKy9aZC9BVVBL?=
 =?utf-8?B?d1BUSE8rRGtLN3BrbjQ5Yko5T2x3Sm9QM1ZsZkNwZGtydW5TdTZGVEQ1OXVP?=
 =?utf-8?B?Nm15SWRhTHlDd3BINzJiTm4rMmxjU3h6ZGxkeEozLytZakwvQmtIaC90akts?=
 =?utf-8?B?bEFOY2x0aW5ybkRSMTVlYVl0MkRXVzc4YmtkYlJkS3FHQ1VDM2RkOU50Y1Q1?=
 =?utf-8?B?MVMxZ0JzeHhXRkFUL0lsVnI2amNxeU1Nb2NqSXd5dFYwMWVpdzVXZVZJdWF1?=
 =?utf-8?B?c2lLZTVGbHdOMHpxUkFOKzRybEhXYjkyRW14MnhPV2pOK2xHcHNZYmZnbDVv?=
 =?utf-8?B?MWlucXdUb01NTERrU2JETjRKRGJKVmxlbWlrd05aRDVXOUdMRHVCSFM4TGw1?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ff43be-d946-4f51-d61e-08dde6eecb27
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 11:25:44.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkTUfWMUOZ0qdzUyv7iKviuO08zaaaT/DZlxgReAYSUhLGj1gHd/nDnr2eR0uUC/+1is7PBWQesVXA17lxwcvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 11:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222610

We have found that since this patch SELECT queries with COUNT(DISTINCT(column)) seem to cause sqlite to segfault. E.g.

# sqlite3 :memory: 'create table foo (x int); select count(distinct(x)) from foo;'
Segmentation fault (core dumped)

-Niko

On 5.8.2025 19.43, Steve Sakoman via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> Pick patch [1] listed in [2].
> Also pick another patch which is precondition to this one introducing
> variable needed for the check.
> 
> [1] https://sqlite.org/src/info/12ad822d9b827777
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-7458
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   ...mpts-to-improve-the-detection-of-cov.patch | 91 +++++++++++++++++++
>   .../sqlite/files/CVE-2025-7458.patch          | 32 +++++++
>   meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  2 +
>   3 files changed, 125 insertions(+)
>   create mode 100644 meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
>   create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> 
> diff --git a/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
> new file mode 100644
> index 0000000000..8fb037bb0f
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
> @@ -0,0 +1,91 @@
> +From f55a7dad195994f2bb24db7df0a0515502386fe2 Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Sat, 22 Oct 2022 14:16:02 +0000
> +Subject: [PATCH] This branch attempts to improve the detection of covering
> + indexes.  This first check-in merely improves a parameter name to
> + sqlite3WhereBegin() to be more descriptive of what it contains, and ensures
> + that a subroutine is not inlines so that sqlite3WhereBegin() runs slightly
> + faster.
> +
> +FossilOrigin-Name: cadf5f6bb1ce0492ef858ada476288e8057afd3609caa18b09c818d3845d7244
> +
> +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f55a7dad195994f2bb24db7df0a0515502386fe2]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + sqlite3.c | 28 +++++++++++++---------------
> + 1 file changed, 13 insertions(+), 15 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 4cbc2d0..b7ed991 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -147371,9 +147371,7 @@ struct WhereInfo {
> +   ExprList *pOrderBy;       /* The ORDER BY clause or NULL */
> +   ExprList *pResultSet;     /* Result set of the query */
> +   Expr *pWhere;             /* The complete WHERE clause */
> +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> +-  Select *pLimit;           /* Used to access LIMIT expr/registers for vtabs */
> +-#endif
> ++  Select *pSelect;          /* The entire SELECT statement containing WHERE */
> +   int aiCurOnePass[2];      /* OP_OpenWrite cursors for the ONEPASS opt */
> +   int iContinue;            /* Jump here to continue with next record */
> +   int iBreak;               /* Jump here to break out of the loop */
> +@@ -149070,9 +149068,9 @@ SQLITE_PRIVATE Bitmask sqlite3WhereCodeOneLoopStart(
> +          && pLoop->u.vtab.bOmitOffset
> +         ){
> +           assert( pTerm->eOperator==WO_AUX );
> +-          assert( pWInfo->pLimit!=0 );
> +-          assert( pWInfo->pLimit->iOffset>0 );
> +-          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pLimit->iOffset);
> ++          assert( pWInfo->pSelect!=0 );
> ++          assert( pWInfo->pSelect->iOffset>0 );
> ++          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pSelect->iOffset);
> +           VdbeComment((v,"Zero OFFSET counter"));
> +         }
> +       }
> +@@ -151830,10 +151828,10 @@ static void whereAddLimitExpr(
> + ** exist only so that they may be passed to the xBestIndex method of the
> + ** single virtual table in the FROM clause of the SELECT.
> + */
> +-SQLITE_PRIVATE void sqlite3WhereAddLimit(WhereClause *pWC, Select *p){
> +-  assert( p==0 || (p->pGroupBy==0 && (p->selFlags & SF_Aggregate)==0) );
> +-  if( (p && p->pLimit)                                          /* 1 */
> +-   && (p->selFlags & (SF_Distinct|SF_Aggregate))==0             /* 2 */
> ++SQLITE_PRIVATE void SQLITE_NOINLINE sqlite3WhereAddLimit(WhereClause *pWC, Select *p){
> ++  assert( p!=0 && p->pLimit!=0 );                 /* 1 -- checked by caller */
> ++  assert( p->pGroupBy==0 && (p->selFlags & SF_Aggregate)==0 );
> ++  if( (p->selFlags & (SF_Distinct|SF_Aggregate))==0             /* 2 */
> +    && (p->pSrc->nSrc==1 && IsVirtual(p->pSrc->a[0].pTab))       /* 3 */
> +   ){
> +     ExprList *pOrderBy = p->pOrderBy;
> +@@ -157427,7 +157425,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> +   Expr *pWhere,           /* The WHERE clause */
> +   ExprList *pOrderBy,     /* An ORDER BY (or GROUP BY) clause, or NULL */
> +   ExprList *pResultSet,   /* Query result set.  Req'd for DISTINCT */
> +-  Select *pLimit,         /* Use this LIMIT/OFFSET clause, if any */
> ++  Select *pSelect,        /* The entire SELECT statement */
> +   u16 wctrlFlags,         /* The WHERE_* flags defined in sqliteInt.h */
> +   int iAuxArg             /* If WHERE_OR_SUBCLAUSE is set, index cursor number
> +                           ** If WHERE_USE_LIMIT, then the limit amount */
> +@@ -157504,9 +157502,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> +   pWInfo->wctrlFlags = wctrlFlags;
> +   pWInfo->iLimit = iAuxArg;
> +   pWInfo->savedNQueryLoop = pParse->nQueryLoop;
> +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> +-  pWInfo->pLimit = pLimit;
> +-#endif
> ++  pWInfo->pSelect = pSelect;
> +   memset(&pWInfo->nOBSat, 0,
> +          offsetof(WhereInfo,sWC) - offsetof(WhereInfo,nOBSat));
> +   memset(&pWInfo->a[0], 0, sizeof(WhereLoop)+nTabList*sizeof(WhereLevel));
> +@@ -157575,7 +157571,9 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> +
> +   /* Analyze all of the subexpressions. */
> +   sqlite3WhereExprAnalyze(pTabList, &pWInfo->sWC);
> +-  sqlite3WhereAddLimit(&pWInfo->sWC, pLimit);
> ++  if( pSelect && pSelect->pLimit ){
> ++    sqlite3WhereAddLimit(&pWInfo->sWC, pSelect);
> ++  }
> +   if( db->mallocFailed ) goto whereBeginError;
> +
> +   /* Special case: WHERE terms that do not refer to any tables in the join
> diff --git a/meta/recipes-support/sqlite/files/CVE-2025-7458.patch b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> new file mode 100644
> index 0000000000..6b041d9332
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> @@ -0,0 +1,32 @@
> +From b816ca9994e03a8bc829b49452b8158a731e81a9 Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Thu, 16 Mar 2023 20:54:29 +0000
> +Subject: [PATCH] Correctly handle SELECT DISTINCT ... ORDER BY when all of the
> + result set terms are constant and there are more result set terms than ORDER
> + BY terms. Fix for these tickets: [c36cdb4afd504dc1], [4051a7f931d9ba24],
> + [d6fd512f50513ab7].
> +
> +FossilOrigin-Name: 12ad822d9b827777526ca5ed5bf3e678d600294fc9b5c25482dfff2a021328a4
> +
> +CVE: CVE-2025-7458
> +Upstream-Status: Backport [github.com/sqlite/sqlite/commit/b816ca9994e03a8bc829b49452b8158a731e81a9]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + sqlite3.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 19d0438..6d92184 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -156989,6 +156989,10 @@ static int wherePathSolver(WhereInfo *pWInfo, LogEst nRowEst){
> +       if( pFrom->isOrdered==pWInfo->pOrderBy->nExpr ){
> +         pWInfo->eDistinct = WHERE_DISTINCT_ORDERED;
> +       }
> ++      if( pWInfo->pSelect->pOrderBy
> ++       && pWInfo->nOBSat > pWInfo->pSelect->pOrderBy->nExpr ){
> ++        pWInfo->nOBSat = pWInfo->pSelect->pOrderBy->nExpr;
> ++      }
> +     }else{
> +       pWInfo->nOBSat = pFrom->isOrdered;
> +       pWInfo->revMask = pFrom->revLoop;
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> index 656e2d8bd8..86d9b4b33b 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> @@ -10,6 +10,8 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>              file://CVE-2023-7104.patch \
>              file://CVE-2025-29088.patch \
>              file://CVE-2025-6965.patch \
> +           file://0001-This-branch-attempts-to-improve-the-detection-of-cov.patch \
> +           file://CVE-2025-7458.patch \
>              "
>   SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221481): https://lists.openembedded.org/g/openembedded-core/message/221481
> Mute This Topic: https://lists.openembedded.org/mt/114551672/3618471
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [niko.mauno@vaisala.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


