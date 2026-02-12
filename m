Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D364BEEA86D
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:52:57 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58333.1770936774190442376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 14:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dpTyDTsl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.22, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFYWE7EOLw+6hT1UfGuYemrGC1VYhN3MLa2wcliGCw49phBrLKLXt0x6DBIr3hU4EqLX6Py8gOgythXDnUHRJvxLWFEv6sFN4TfwToJPmBbAJ9TvFVVayo2TnTZwfC/fdSuHJRSuvCwbMnR94LP6tkf3XD4N0LAqaSDUFW7YEPu4YBrPSwp7jXp+xNmJkZgc8nksATQPEJJ45O8hnxzt1jbfBqUKw8fxKG68sci1ST4VYuFX/4caDLDth2KDtaQ+mbeOcf+p3Q1AQ3RScDH1/sRQmpdJ2CDJNMVzP/1LI0LRbO0rz0Ia9TljWzyHTnw50XT+kiUUAS04i0502iMoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhhwE2VObrPvEWMZgnP4PeJZuwvZtFO0wH7ugX4iAZI=;
 b=gkmDuIaAAK6oy8C1PN0gP8bSVwO9o7dA3Ub7Lf/TVvWwhVm2UvhmL4djgaxRLkLkLcv3X6wML3QMMcWDbf9R16+Ejn1xSvmBSY6Rch6cJ4KbYw4nushNfkQ/Mxfn6LXi11qcgsqj9sdegptRDYsvmfdZKynMqruZQn7sHnvSg9eo7WM+afHQOnBw9LpjFVCLhsFzW41dahbPnmBwpQNi59YlUp2PKAEBx6MkG2CdB/IvCEhSL++qXibEXiZLEBM1kmJjFWWVPjqoN/LqqrxjJhbFkkceIV4vOrSVp1Tik/ZNoz6JBJUuw+lqqSchMG9c2szAyZWX3cdcLu7na1t7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhhwE2VObrPvEWMZgnP4PeJZuwvZtFO0wH7ugX4iAZI=;
 b=dpTyDTslC8R89ZYE9HaDiHhwG6u/1ubXnD4JjYVXjwYcEqAKZW0UZ3GNMG7vOl2hBluiKPJdTZu9cZfuhwJTx5hY8WkKUVLrq+s+3fyroweqHxt3BadUg/kddTbTvUJNkLnqo6eB79ha2sTioKgh+o84gGt/d+2G3ZMjvcyUn6M=
Received: from BL1P223CA0042.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::11)
 by CH0PR10MB7536.namprd10.prod.outlook.com (2603:10b6:610:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 22:52:52 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::6b) by BL1P223CA0042.outlook.office365.com
 (2603:10b6:208:5b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 22:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:52:51 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:52:50 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:52:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:52:50 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CMqogw107600;
	Thu, 12 Feb 2026 16:52:50 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:52:50 -0600
Message-ID: <DGDCOWXIISMT.3QVFP5TSU5QCN@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
In-Reply-To: <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|CH0PR10MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 74654845-31cc-4bb5-b638-08de6a897398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTNWN1hMcC9QYlNaYVljWnhQOTZyN0xlYUhoVloyVkxwbnNQbklEcHQzWDQw?=
 =?utf-8?B?Tkp2TjJkMmNTRVczMW8wb2dJWlFSRWg2WkZwSWk0bEJuVHpjbGl4Rmt6LzVn?=
 =?utf-8?B?eTNLTEw4YmF0cWIwMkE4S1lXMTNUcTJxRFV4djIyU1dUNk03OTFyR0x4OWZz?=
 =?utf-8?B?TzAxVWNFY3dmd1R4L3BzVWRoaWdld0NENnhSdkxlallKcGdwRlNoZU02ZE5t?=
 =?utf-8?B?ZmtjMnJEeFF1QzdScHR4S09pTVYvUnpVUkxJNXIyV1hrR1Z0d0xxSWQ5V2hM?=
 =?utf-8?B?VlRNTE9kV3paVXM1cW1LMzdkTlRhbVhsYTRob1JySHJRN09SYWxhalVOZ1dP?=
 =?utf-8?B?cW5NcDJOd2p2dXREZUZFeHQ5RExWTlFvZDljWFR6MldPcm5pMk5LTnBnbWll?=
 =?utf-8?B?Qlg5c3hpS2hEOUNXeWJHeEhyT2IremhuV0J3WkpzWE53cFJocWg1QnIxMFRm?=
 =?utf-8?B?VSs5Q1BGcTJHeTY4MnlFTGJpVSs3cjdZbzZibk41NlhKanBGVVA3VWlHOEFH?=
 =?utf-8?B?Z3lzUkxvbDRUUHdTNDhXaUhidTFTbkVNYjJqL3Y1MWRqNWRMRVgvNTFtS001?=
 =?utf-8?B?SHBFOEViYUtKOUhnY2NTcCtYSnpETDBmdC81MVRla1Ezb1RyVnlpQ2hlY3R0?=
 =?utf-8?B?WDVveHJHcGxxeThnaTQ0SHZqUzYzcFpkRVVzMlpuUWMyWVE3YVRxK2NYMlpl?=
 =?utf-8?B?WUxFN3JSZCtwWFREdVpNaU8xYTJITUtNT1pjU3lzRWhwUXhrUE9hdE1oMW1k?=
 =?utf-8?B?SE45SWNMMkhScWJoOUpqcFhEbi9yRDh4UTlCY0hXZjM5cU9PUnp5aldKRUxo?=
 =?utf-8?B?MkZSd1MzdXF4VUU3amdwSjNlV2VrZzcwbjJzQ0wrS1dGU1htSnU1aGZyQ2Ru?=
 =?utf-8?B?aGFhbUJVSEx5ZTVpOXRscEEwTmFUcXlEc0Nzc1VlcEdXRFhwQURTNGhxQ0wx?=
 =?utf-8?B?WUlqR0FnUCtNK2d2VktQUlQrOFNPT0p3OFNhRldvcGYvRFZVWTFxODZ5NVZC?=
 =?utf-8?B?c2kzOFUvWC84azNabmZnTEIrc1BsSTNKck1ZdG50c2ROM085ejdGcjgyVGRW?=
 =?utf-8?B?Nmx3V3MxKzJLVlJPMlRPYVc1OFlPNkV1THg0bG1YRVdpa2k0cjV3dUFld0NH?=
 =?utf-8?B?V1htUFBKZHR4UGJhV3luVWR0YTVQcktSenFEc3RraTNhOHlsTWUwL1pvWWRC?=
 =?utf-8?B?c2VaN1ZscWd0UlNjM1VrNjlTY29DWnhrcE54cnNHMnMyQWVUVzdmb0s2M3FQ?=
 =?utf-8?B?dHdRc0xXbDE1MXdwYldWWDhZRHpwMURUUjYxWlpJK0VtRTNqaXlvaHMvbWsy?=
 =?utf-8?B?cUZQMlFqQm13TWhWY2RscWhWaXhuNEFvWlV1azZLMUVJZlh6KzFibW8xWHUw?=
 =?utf-8?B?bS91aEhnVDZOMnUrUVRSL1ZaSjR1OW9BbGo5K3FsTS9hRGhKQzI0VGdidVBC?=
 =?utf-8?B?UGpPQW5EMGhmbEsrR25XcFg3dVBEUm8yeXZHbEkvTnIxNlozZ2l5WG1xemxO?=
 =?utf-8?B?SnNWeTIyZlBrWUwyY0s1WFIvK0g5UEMyNXFmeUVRUjJ6R2xMaFcxZXB4LzZL?=
 =?utf-8?B?Z1lQMkpxdThXVUttUlVYb1lDTndHT0IveXlKbjN1OGdZNHFDeHc5UU9UOGlV?=
 =?utf-8?B?bExGazZ0RnpLOEp1SE4wa09UWk1DbFhSV016eHhpUWJDQWkraElDRXBNcUpt?=
 =?utf-8?B?cjVCRVk2Vm9xTEFsYlBXSHltMzdJc0VXVnZaZnd4RVNuZVd0djZDZEdNMDVY?=
 =?utf-8?B?dk5pbS91VytKeURiU01iZGNxT0g5QzJ3aEZVaDA4SzNyOEhDSHRXanoxMC9D?=
 =?utf-8?B?L3JoazdCYkw4TzdwMi9LSFJTU0JMbm13cEsyMHlKbW5SV3g1ZlhxdU56TTRF?=
 =?utf-8?B?c3RxUG5wV1pxVi9oUUJETy9FRnJRQk5YTld1RHZqSnltZlZnYkJUMFgwL2Z5?=
 =?utf-8?B?enJvaEY2Wi9Fc0thaXk0MzlxUmxDNStaMko1TXVINDB4NmowcmViQ1haYk91?=
 =?utf-8?B?enJTN3dqQ3dhSTFrK09waG5GczR5WG8ybDRRVjAwaVpjU1ZrMTRmM1NOaXdV?=
 =?utf-8?B?emtNZ255Y2VKR3FSOWJpL3ZPaHd3UFV0S1FFdWNkNUxXbitPemMrMGJGaHA1?=
 =?utf-8?B?NzVsZWxaL1l6SzB4TFc1c2tkck1QaUVBdkJ1ZS9obkh6T0VKMkhha3A5SklM?=
 =?utf-8?B?dTRBRVNaTjJoUDd5M0djcW44emhCRklkNFJ3amlLNXNLbmlPUTFLWlBDNS83?=
 =?utf-8?B?SWE5NTBud2NiSnArV1RibnZDV01BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fJ624TeUpRAkU4unMeW1d7z+X56VUubLJd4S1/pCL3iEjmftfrd6rtei4qxbGe97Wj9tSjYjykysRJcqGk90OXGkHR0GL2JbWBDE8EK/n0b3thmQrvmXX28e4S4jkL6XLLAEHBcbGs0/9d2TrbMLf/RFpJ68wKwqN6GsV2C+AhjqWV8QJVez4TUKcR6vd7aI3SxX9uUXYk0KSlGn93qZ2q6/3dwidcFCrquoATcDFP5Ijiy5qc7qB939P9ZQuglcToSB3HpHkyxGQOOVlyuOS/UlFFZwtiCsSA+r+5cPc051ElQmsDVwlwG144XLNk0wX0QKbniQCgJZZN9haVatp1+Ksi8XxT+xJ2l8nDXhulroYfIyMH9G+WgehJ32jtU3hfKAP6t5YSsv5+U9Y3Gax3yjUAFy9cM4+1Ntxkcy+Rt4WFgjEKMxZoAq0qyKl5eu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:52:51.4467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74654845-31cc-4bb5-b638-08de6a897398
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7536
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 22:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231074

On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
> On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded.o=
rg wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>> relatively lightweight display manager that supports x11 as well as
>> wayland through both a CLI and an automatic login mechanism.
>>
>> This can effectively replace the custom init scripts for both x11
>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>> more verbose logging capabilities.
>>
>> This is split into two recipes. The emptty package provides the binary
>> and various agnostic configs while the emptty-conf package provides the
>> default configuration for the application itself. This RPROVIDES
>> virtual-emptty-conf, allowing other recipes to provide their own
>> configurations to override the default behavior.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>
> Hi Randolph,
>
> This patch has been in my branch for a week now, but we are seeing some
> intermittent reproducibility issues.
>
> I opened a bugzilla entry by error, as for a second I thought this patch
> was merged, so details can be found here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
>
> Diffoscope output is here:
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslvz6=
_/packages/diff-html/
>
> Can you have a look at what is going wrong please?
>
> Thanks,
> Mathieu

Hey Mathieu, I'm at a serious loss here. The only differences I see are fil=
e
creation dates and intermediary archive sizes (normally only a difference o=
f 2-4
blocks), which I assume are being changed by the creation dates as there ar=
e no
content diffs reported. I don't have direct control over either of these
components.

I agree that this is an issue, but I have no idea what is expected from me =
here.
I see some weird workarounds using touch in xorg-minimal-fonts and e2fsprog=
s,
but from what I understand that should not be required.

Shouldn't all packages get hit with the same SOURCE_DATE_EPOCH enforcement?=
 One
of those packages is literally just a single text file that is installed wi=
th:

install -DZ res/conf -m 644 -T ${DESTDIR}/etc/${DISTFILE}/conf

On top of that, a local "oe-selftest -r reproducible" doesn't seem capable =
of
reproducing it. Are there any other logs you can share?

- Randolph

