Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04ACFD8FF1
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:09:32 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76535.1772129368175193931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 10:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Aj6+aimq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.16, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEVhJidUw7/LRpho36cjdK3dZGCOOX31/F01n4f4MOYfW+RB/F3rivSHpw8j60P5MvJUzOjVnm7Kb/z3ku+TJwMCtQuiT60cW575SmSpOJ6k4Is43ZtMUKSbq6G290xGXcxyfXml7nUyRIpbSL28Kc2autZeUAnMLQLIf424xnvWNxATVOybOhJEWJkaTQdBvjkhLaK03IdXpqtbSuUVrTOjroj4ImVSll8t1Dwx8za+ZJzlLGmVwuutYEdlEbpofGnsC9tS85I/NuX+UW5D4ih0W5YLTaCNb1L4tbiuEq/n48fbFuPsHb33nkGv3wrpVA+USlvwi79+IcOb8ioj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtH2mrZlQ4bsnJABNh8bqcJNHGXDOtAMYl7BeMPrif4=;
 b=qekiE8Ecwhbxi+5+Hl6C6ZvbDvgaWgkgYm1+4oRpY9yCgti8HyGL65DH8zBr7js805C1wU5Sbe9MfRs2+Ru39MDPUhR4rOjBoFYCgiWZh+pqD8y1R/a+J1lj3GAOkjIFxFTkPLAlJvxjdo7s1W8B5aXTCuitkwnVm/msICcMqxp7RaNuQ8H1SHgjldqYsA9HvPzHeQRFbB85KALmC2nIipNCHQL551AL3pcScoudZV9YhNDMiCVr1LkCUOAA0tFBS97o/LOcseXr1LDXqetiGqRZguJARxU+wh8A8fbLxXRnSthV3q42WJP6pyz2TMDWGrOkUPG/YnGTxtJZn69rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtH2mrZlQ4bsnJABNh8bqcJNHGXDOtAMYl7BeMPrif4=;
 b=Aj6+aimqitFtwlIKS0+pCQX9QKOElRrLRtp8cWl6f1mUtRWdy6ARgpsKcY6Avfy8AJZWAkXz89CrfGq9t24fNiZV409REC/gejRqQFa+jhldSwwXp/IL2kAAbjw5o40RKXP7fKt+MzdemAOXjtcx648VHi3qvR1k6BI4EoIG6e0=
Received: from SA9PR13CA0130.namprd13.prod.outlook.com (2603:10b6:806:27::15)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 18:09:24 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::b0) by SA9PR13CA0130.outlook.office365.com
 (2603:10b6:806:27::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via Frontend Transport; Thu,
 26 Feb 2026 18:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 18:09:23 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 12:09:23 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 12:09:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 12:09:23 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QI9NGd2317537;
	Thu, 26 Feb 2026 12:09:23 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Feb 2026 12:09:23 -0600
Message-ID: <DGP3FIMYUJ4C.GDARTKLCQ59E@ti.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
In-Reply-To: <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: edc69968-475d-4c21-3d56-08de75622c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	zD4zrqm87VNbTA77WFoQj/N2xL7wg7g48PoSfXRPTk8c8dxAZWrhjceFFKx+eA3VoTnvuBHc2gPp06deksBzH9ifaWXOqrYiFaTiPNyZmODOT7gFbMNJekHRB/ZiWmRshQrcT2uSjOpJOvesWwDNvJXEB82r1Ju+NzQsee1htBrYMaXX9c2vEZ/ZjFgiGpYH6C7aqF8FI0aYwDpkdgAJhTmcDyR5LI8igsFkkNLmee3h00pDPmfauYk36R44qCjHEZa27W0v9o2yHbKQ5BiuiudubHzVmu7cZBlGzsHUTLU00hur3XIAuq3287FRbXzAC10ZH9fsduUGl7c5OlBBYLGwVvdsvHVkelnE+xVaG40G0bwA69eslNRICqF3hRRA7z3CLvm/at9GQ9GmwP+Pv0k2vkJ5pN5hTh3nWpAw9xZ7bqBij2ntV51d4cTlsynHsavah/MUtrVV71hy472fJeSxZjhhU/IkwgFkJK2xHUL/WO2BovmjzCLLYmAz17dNIhffPfCpSpe1B8gdQUUSkYU5fVHaqqtNEkee0i/HoXz+wl8Za2sGOXs7ZJcoGI2hFu9/0VGGe150ql0DMF+l9JsbEY3BGes+nENv0vNPQ9ZXJ8UV1JeAgG5ZCXnhcE9/P5WYKq8lNehJ6vB7loLnGJPSoO5VeMevZt1IKsGcJKLrsMiYx/XlAX2NbPt/nwYJI8jFtFZPKPm8PDBfuhifVEt6DCWhcV/NdW17BkjQ1NmMOQgJcF7GyYAjr2LzsmBwHXMDM0HdVgi4M89bxakdawil8bg5QLkmQhrrn8iB2/s=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rkGb9bAZWwGiXThTn1tRuaxfSlwe2dKLMzcjwZNcpanLWpTwlQ4CqFpmxYecTeJCr5RDLarLs+OVZeWxL1nArcSJuPURqF1Zdr1rhMr1B/a2gIdS97t0W0gCXmfe04S7ivORcmORzLP5ptPmRMRzJmrFY3paZR1sB2MrcUiTxmxEo1Inp+LchaUxAUy1xS80ZSLgOnKocMdKDriD3j4Jqa1TSUJji0KlGuShQgV3pZXDn7JQ2JvZ8Zz+BUN/ygZnfcJn4uyWZgE2N/Qxd7N6k5c+ssukNl/6E29g9H9OYtjo0WXRzV5tT3VxEau933XUs5iug8lJpjhkPcPW9OINsKkF/nJzMDDgU7wFJTkfRdNiM79Bf6V35sYPhGezlUwxF8Nch7iTaJN1AHP9GgOoO3Ix2iM5vR96n8P9mp+oSL+voGZiRlktsRyAk0sBVpE6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:09:23.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc69968-475d-4c21-3d56-08de75622c17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 18:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232058

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

Now that the source epoch has been addressed [1] should I resubmit this ver=
sion
of the series? I won't be changing anything since the RFC [2] for the other
issue reported on this series didn't get any comments.

[1] https://git.openembedded.org/openembedded-core/commit/meta?id=3D70a74fa=
2bd9c374bd07b89b426a86991b1d93a5f
[2] https://lists.openembedded.org/g/openembedded-core/topic/117730556

- Randolph

