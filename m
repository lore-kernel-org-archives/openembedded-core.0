Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11479EEA871
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 23:48:28 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59398.1770940102047374740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 15:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ddM+LLS5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.16, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkC/j5D3YgtbGEHPranYO2HBr/Mq4dG7yxKQOt8QHKCdwf3FSeRgCfLiuWQ7Qv4cY/hYyOiFs6kHHptNoxyHN+ZuC8o6jj0Ny/ekSnF0hG6LpqrR7vrZ1FF31HapU+mXaWz6dHTuqqXH9rRfHYLWMUJAMxGVL2Cth8trCjfT2HQGmUDeHGVpf3OC+UfyhyAA1PrnTLLzaa7rJL7Q4AogXReaQDTxcgVk31V0cM4RGv9B7WVHy34IR1h39aCbd9GXevcuf97PCKYjtA8bFRkDPEO16Uw/wC67pVcdaeHZiZw5aIz6faLPBNHoHoNfMZ8GAdCeWcl3pfdMRnvCv+mh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVeMFhVRWsAlzdLNJPwpjBjIep4yVdvpKXXeu7H1elM=;
 b=OZk73NyV4qfasheb30Sy7I5B+kzp13PKY+U08WUVLvQxKvC8bYKFYfmgciNgr09ph5XRkprXcpvcf22YTVvRNZtIlzTfG4gtcOduonyFX3qx8mKUTR+Vi2P6nlBnvNkc93YeLmox7GEqozasv1gwnd0HI409HWkHQSPVC9pb1XYTnzMmLv8EBivhPKHnGwlxp8LhqZaSQPEqYLYEnaZZITIqr3KIRPqLAsrGfLgmieCkekanrrBCCvTi8fl2NWSUoBJOnwlj9iy92hCA7cI7SLGBXJwUltcs7aq/ly35bvzoCIfvaTZ5hVe9StdW3hpZsFArgaIbI83rem6YZnsvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVeMFhVRWsAlzdLNJPwpjBjIep4yVdvpKXXeu7H1elM=;
 b=ddM+LLS5UrnPnI9PELbmfOTUvKwR0oewEwS28playy8YPPAopLNPjWmvx18yTJES7Ikcmcf/+kq4aMllxQ3cw6hL1YYZtNL0evJC4+RUx4/XTRBnhWbw6UwrU1Uls7yflSW6kZBbekGJlRhOmjtS1z7je4LDYtGekhOM2ydd/GQ=
Received: from SJ0PR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:33b::15)
 by CH3PR10MB6689.namprd10.prod.outlook.com (2603:10b6:610:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 23:48:18 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a3) by SJ0PR05CA0010.outlook.office365.com
 (2603:10b6:a03:33b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 23:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 23:48:17 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 17:48:15 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 17:48:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 17:48:15 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CNmFL8170582;
	Thu, 12 Feb 2026 17:48:15 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 17:48:15 -0600
Message-ID: <DGDDVCGW0B4M.2HGFOVLBM7TXI@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	<richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
 <1893A19D18D5A1FB.653184@lists.openembedded.org>
In-Reply-To: <1893A19D18D5A1FB.653184@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|CH3PR10MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ef596f-08e5-4921-f461-08de6a9131ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTdCZjJ6U0pmWWt2NGU3Y01xYXo1Q1hwd2FpY0lMSWVLNFBMSzcvaE1WMXVQ?=
 =?utf-8?B?VTlIMWtUR0JremhxbkwvNWJXek43SzltT0p1bldJNjFQa0s0SVlKekMrWk1O?=
 =?utf-8?B?WEVWT0xtYnJSNHV1azU1MzVqd1R1NGI5VzR2WFRsWjlhSU9ESkNqcDFzUFh0?=
 =?utf-8?B?WkZoeFRQS0JRMHJQR0JmK01wRlZiSWhjOUxIY3N3dnUwZUdYVUtnNFNJb013?=
 =?utf-8?B?L2Y2MGxSUzFuS2x5K3VEQ3BTMEhxRWxJZGdtL2tGMXZJeTNFUytORmx0ekVv?=
 =?utf-8?B?cDZDRlE0eFE3WkM2MlBwaU5iSGZlQllmdnJ3b3Nuby9ZV0ltRXhTNkRMWldZ?=
 =?utf-8?B?ZVMxTkVtVDBSNmRxMlQxaDJHNXlSSTEyeWVrNnRmZ1dXcVllOVRTdXpheGEy?=
 =?utf-8?B?VHBPMUZpZy9zMUpjZ0tvTTBIMm1DczBQL3ovMzlZRXcvQjl3Z2lOL05wVkJY?=
 =?utf-8?B?Qk1TWldUMzg2OGlscis4UGhWeVltMmFkMS85elk0eUVjdFpkNER5RXUxUnlD?=
 =?utf-8?B?eEh2QllUZ3JHSkNUOE96ZjF4aEFNaldZOHRSem9jWk1kY0F1MXBZMGVOWFR4?=
 =?utf-8?B?U0JvOW0xZThJVTNodHVjNmtTLzJpSGFweDZOVUJzZ3JYOUIzZTNWa2JEd0FX?=
 =?utf-8?B?VllsOVBwUlFuSEQrSVZLWnRLYUhTL0NZTk12ZlJSd3FTa1p2cmxmNjVKaVBi?=
 =?utf-8?B?ZEpIUk5UL0JvdjFWREdxTWgzVHY4aSt5Q09pc1ZqMDhGK3cyUzZiTEVzWmxR?=
 =?utf-8?B?ZjQ1cGFqdE1UWFVQL3cxMWdRelFIWG5GZkVGbFBSKzE3ZVpBeFFFbGk4N3dh?=
 =?utf-8?B?aUh0MjNaZHhJWWtrS1A5VlIwdkpGUVdqNkVHWkc5aHlUUUdOb0Y2ZnZCYS9M?=
 =?utf-8?B?OXAxYjl1blpQeEpuVGluQnJpeFpGSHBVdkk4NWZVeDJnSEk5NFNaNzJpbEdo?=
 =?utf-8?B?TS9FWU0xR255NmNwVVViU2NtU1N1K211SGova1FnNG1lRWwyMGtGdm5WZkZ4?=
 =?utf-8?B?NEdBTjBoSDh2WS92ZW9USUIyd3NvUy9MSTUzT3FrSWN5eExtbWc3cHhFM1Fq?=
 =?utf-8?B?RENoL0NNMU9aVUpjVVFUSE9zSjFyZGFIOFNBWGhTV1UvYURJbEhDN0NFZi9O?=
 =?utf-8?B?Z0lYQU5qN3lxdW1CRFlWbGI0SWkwWWRMVHJrbUNqWkRRelJiQzQybmRrbUFS?=
 =?utf-8?B?ZmszMnUwR3Y2M2phbDFXcFkwRXpuT1c5dnJnQkI3b1hHOUhCOVZlVnBuSkJx?=
 =?utf-8?B?R09id2lnZ3NDaUpNY1pRbW5SbmdzbEh5OTFpOVYyMDJjRHJCK05MU2JmRlQy?=
 =?utf-8?B?ajFyaExLZGpxY3VRM1hOVm5GeHMyajRramtYWFVpMEVxT2M4U1dtZHhQY0dw?=
 =?utf-8?B?eWRvMFlZQzNncWcvQ2pFdHcvbzFyblhjMzF3Q3hFZDk5eTJERU1LLzJHVlNI?=
 =?utf-8?B?RndHQ1A3bFBJeDZxV2ZEWmxiTHAxVHJLSEljZkloT3d1aVFqTjlmZXI0ZTdN?=
 =?utf-8?B?d0xkcUVKWVNOVUIrUFhvY3krcmZiNWQvaGJmWlpBR0JTaUpsZkh1eGRJL0tt?=
 =?utf-8?B?dXducXZjTXloYy9hc0RZeTEwa2s5VDJRbGpwYk5Wemx0UTN3WG1IVnV4amVv?=
 =?utf-8?B?bTk2SVdKblpRU294TElKNnFYVjBjbzFJSUZobU9ObXJxUDIzelFpQitJOUt4?=
 =?utf-8?B?U0d3ZWJrcnBCRXhqWDJ0VzhKSDB6dGFuYUlpWUtBR2xXUjIxc2xVaHdqR1VI?=
 =?utf-8?B?R0JVWTFQWjJaVEFjUnk4dTdZSGp3V3pVaVdlYTRwVkdYN0lzWTQ0UklyWTM5?=
 =?utf-8?B?OXhIcU5RRU40OEZTUlNCellhSzdWcFBJTWpFUDVFYVhkUWJueFpWYU1OOVRR?=
 =?utf-8?B?VTNhcmEvelRnNnMwY25QZTQ2c2RiUGZTOEZBOVlROWZudFlzUHlRNEljVnA0?=
 =?utf-8?B?bUNxUmFwa1ptK0RCbHpYOG41eDgxWVhLeU12RDlhUHFtQ0NkMUs3NWdPMnFQ?=
 =?utf-8?B?TzBIdWZNMjhheVdxM3VHZVhRV1ZHTEFFRFdnNWN5NzErUnBkbnc0OThCUlpo?=
 =?utf-8?B?YS9JdVJkaHBEZ1RaY2g0TUhaWGNDUWo1MndRN0ZpTXo2bzU1OWNubGJZR3I4?=
 =?utf-8?B?Q1dDaDRFanlPL3pCcjVjSDFmRUNaRlNRY0JsV1pucTJGekZVd1JsQnROT09J?=
 =?utf-8?B?S0xtQjM5UG4vRVBoYzUwbjIvVFZsR1ZNa3pEVERWemFLMlJpMDFNV0dHYnlr?=
 =?utf-8?B?TEtaVDdSNWlVbW1LS2JvQlRaVVRRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j4vk8MV8eIalKfJC1PcZ/+QAApnfWQFdKnAWHxjeM8+N7voEHsjNZk9zqKxll/u/YTl9JLBMCFhUcfi1Th8nBFr83lQCA3iqqxjXVYQtgT9yK1+YbhNBKfbhwcRxHzcHbsD4ZDiOQik2tMnw7DnqF8DAYhQxPD+nqfw4Jn0zQmn0MB4NlaESaV/qWkWc/XAFFLIPfwo5ZnL2/Qw5S6WiUKkdXZituZCTON2sUpgbiPRmEaJXp60JJclwYlT02se19/oGIQ2OGmjzv2iA78z2F97nNIqp0ORxDIKevXU84KeKJkl9dZPDCFMyGuqNGnjVMa6YTGk06umt2gE/0m1FV7n/nzyitJbnKCDSjvBiikeEOj7/DN9zKDgryN2bIUA39sIaoylH6Leo2nNUyEpFVz+g976vyQ/s544w5ok8PWk0B7+TR9xJKdNRTL0nFVhM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 23:48:17.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ef596f-08e5-4921-f461-08de6a9131ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 23:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231076

On Thu Feb 12, 2026 at 4:52 PM CST, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
>> On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded.=
org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>>> relatively lightweight display manager that supports x11 as well as
>>> wayland through both a CLI and an automatic login mechanism.
>>>
>>> This can effectively replace the custom init scripts for both x11
>>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>>> more verbose logging capabilities.
>>>
>>> This is split into two recipes. The emptty package provides the binary
>>> and various agnostic configs while the emptty-conf package provides the
>>> default configuration for the application itself. This RPROVIDES
>>> virtual-emptty-conf, allowing other recipes to provide their own
>>> configurations to override the default behavior.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>
>> Hi Randolph,
>>
>> This patch has been in my branch for a week now, but we are seeing some
>> intermittent reproducibility issues.
>>
>> I opened a bugzilla entry by error, as for a second I thought this patch
>> was merged, so details can be found here:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
>>
>> Diffoscope output is here:
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslvz=
6_/packages/diff-html/
>>
>> Can you have a look at what is going wrong please?
>>
>> Thanks,
>> Mathieu
>
> Hey Mathieu, I'm at a serious loss here. The only differences I see are f=
ile
> creation dates and intermediary archive sizes (normally only a difference=
 of 2-4
> blocks), which I assume are being changed by the creation dates as there =
are no
> content diffs reported. I don't have direct control over either of these
> components.
>
> I agree that this is an issue, but I have no idea what is expected from m=
e here.
> I see some weird workarounds using touch in xorg-minimal-fonts and e2fspr=
ogs,
> but from what I understand that should not be required.
>
> Shouldn't all packages get hit with the same SOURCE_DATE_EPOCH enforcemen=
t? One
> of those packages is literally just a single text file that is installed =
with:
>
> install -DZ res/conf -m 644 -T ${DESTDIR}/etc/${DISTFILE}/conf
>
> On top of that, a local "oe-selftest -r reproducible" doesn't seem capabl=
e of
> reproducing it. Are there any other logs you can share?
>
> - Randolph

Ugh, get_source_date_epoch_from_git is the culprit. It uses os.walk in the =
event
of multiple git sources and simply stops at the first matching instance.

