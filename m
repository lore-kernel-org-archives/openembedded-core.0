Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68C0FEFB72
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 18:00:03 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102294.1772215202006268648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 10:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ERQT4aNq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.6, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2JKY5bB8h4MTSS7Au6fi7mWRAKngq3SWBCamSDv9Wgj1bxGHwxqyCB7zpHnomZGikkyT4uNhCDn6fg9uGtZDPhbIT6rPchSsXZ8NUNqLWQU3ZHQQ0ZrZo0kGAoMtxbleeTzVbNWXGQTZK6VYKcqwcHUjqp/MLojKHTtCVG0upDc3H24ofWQjA72SDgDQb+3BiGW1NQ/eK76/ICUndb+RB4+SSTij6G0BxKLUX20qWQuxNxe54OFxSWY03mkdYFy/rSy1q0N6ZFMRmYf+RrMOD9nsouLCxV7fQpZCuo5x/0ENN87keUXrgi3B75vpo190hohTl2ZnduyInD8X2nD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y5EB1M9/5z286AlLFkdhciJkb6O0bptGwdEvOV/HGc=;
 b=wTZBCRaJeBrLtrpLDe4lRdMYpuDsXYCbwoGTF8M/e1DBOwl381FdyCBUJvMuBshHBunOSJ/ZFtEEClXbur7L40cCn+hudn7yrAK66219PrXYCwmeT9IBJIb2OEEriL6kKMi4s++qp91x3A0UC6bciebJ/TmlDeBefKP1/oEqlH0ExVsiSLyST3ao1Wfn1InYcucd2CoMKMORjC7KvyYNuXOeFPQfnQJYJ7L3qPsBPhLBhjgFMdSMKap5b6y/xFJXbWH3kcM0S21PwCPw7Wx69Q+PZYooZdapGK9lghbPw9Mn1jXYum73WTiJkwpgbE400mkaifzZiwDqrXPmUmKnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y5EB1M9/5z286AlLFkdhciJkb6O0bptGwdEvOV/HGc=;
 b=ERQT4aNqzKWbfgOaK2C0GAqDnC93idOtuwUCi9eMihTgx8+mIowKKqHaeJ/lXLawl6Xyxc4Q/RDNoSgXErdRArZip0fPHaXcrZM8gXO+zOgjNLYeImflvb7yMG3w6g3ZaVYRFCCIQcurqEwbrq5fCXyY6xLYxqAFSNWos6HObTE=
Received: from CH0PR03CA0098.namprd03.prod.outlook.com (2603:10b6:610:cd::13)
 by DS7PR10MB4909.namprd10.prod.outlook.com (2603:10b6:5:3b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 17:59:57 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::a6) by CH0PR03CA0098.outlook.office365.com
 (2603:10b6:610:cd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 17:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 17:59:56 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 11:59:55 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 11:59:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 11:59:55 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RHxt1X457938;
	Fri, 27 Feb 2026 11:59:55 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Feb 2026 11:59:55 -0600
Message-ID: <DGPXUT7N5LMV.260EO8RTV7SRF@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Randolph Sapp
	<rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com> <DGP3FIMYUJ4C.GDARTKLCQ59E@ti.com>
 <DGP3JP9X4ICJ.CFLI2RD62CME@bootlin.com>
 <DGPKRLLSHG5W.1KG0652WTNI6H@bootlin.com>
In-Reply-To: <DGPKRLLSHG5W.1KG0652WTNI6H@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|DS7PR10MB4909:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d789dd-8749-4ebe-50ad-08de762a042b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	QymuzrGFMeCBmFaWC1i0s9Yihx3tvvhOJ5v35H/28/arovGdwo0HZf3MR68Y/UjTob5grLGonDoidyXjM9n5s8jL5A0v+XxX7pP0HoMkIWR6t5R6+Q5D28aliY40QD8nkzkNLOnJQunvAIylaFQ5hdpanjBy60PFfSwxDCxlL/g+senM/vQ2Ivw3Bf0A5io90ppRKxaK8K80fbNGQK5mTH4s+MCGM/VLvpBw29tPojivISwhUfDm2cnAx79blqfhoM3x6o+jqIPERhuCuySrkd0srOeyJvZx9nkc1xkLXn1PNmzt6EWs9p4BorFxXaT9/cfxpGM0iuJ8BVg1mLAoG1gdP8YBaLHM1NsE12qzbd11AyCOQcs+iqt4VSwMkCWx0FV0wzWLx1zO8YqpsASQzALkDsgrKF8gVuEzqJd0/d76iW4hi0sDLINI8xbKrO0YoeZm3lI1YGY0wIlYPVv01yrwbzbsBHC0mRhkKIQwxXYqTHLyWbhQO8fYX22/JRyAtbUpRWROVOTq1qIKSiZam5lEzRERCQyKAV82uUqHF6s31dTSe4Fi9THun5lK3YQiL/H2qxJxIwMqZ9DH1Naw1fOMLCeX6W8JOd1XuIYObvDLWST9vTUsWTAjnEO5bhgLfUUnrHYVkTk9gRetBd/ocPKktTz3TMyJhRvb4LFvQYO8T/UI+FGRn6CJVvdTZ5iTLDwcuUajAX4b8lRfZzvlUvqTIKcl++0VhSBgXXY/Emd9SZuupkaIPzf38ldNnLQ5SDohfO9KrhW7p0tJpxYwqgkHEE6mnO7Vzz8saOATG6k=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4n+zTeyCmL/UdO8RuTD+1ZcTjcG93nhPRmSe7rNJmT1WMINKBQy9Lg2Mll8vzCENepALyLBl8CPQk1Jp7Uz0OZD5E/eL9DrmT8taTcURfO3Kk2fc+94c5Q9XAqSpxxNp8HCWminrKuWvcj/dHPZAGhPHBmMuJu5V9LandYN+I2LgiOaCgZzJYQdtVDGJ75vkbOZNwN6KDgh/Psx1jFA3nlRtHTGTsKLfst+dDoMWAoha+wGarTi2U/Aj/1vaAxsl8a0vZdfKGQUS/LfP923IjWK9bC+G4ScgIh5iuvJ4bTMwBIxjlA582Y5aCizzk1tzNCbbiqBb2LtkaNYMBzeQ1gSei0+jH8p9/jTbv7eEM1fY+TlkFK03MEvd97EM3/PK4T2k+aRlzP/BpLcwZ2p8psbV+haXI86R2rfXkSHdDF1//aygWPk1RGrhXrbeH1c1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:59:56.2793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d789dd-8749-4ebe-50ad-08de762a042b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4909
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 18:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232103

On Fri Feb 27, 2026 at 1:44 AM CST, Mathieu Dubois-Briand wrote:
> On Thu Feb 26, 2026 at 7:14 PM CET, Mathieu Dubois-Briand wrote:
>> On Thu Feb 26, 2026 at 7:09 PM CET, Randolph Sapp wrote:
>>> On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
>>>> On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedde=
d.org wrote:
>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>
>>>>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>>>>> relatively lightweight display manager that supports x11 as well as
>>>>> wayland through both a CLI and an automatic login mechanism.
>>>>>
>>>>> This can effectively replace the custom init scripts for both x11
>>>>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>>>>> more verbose logging capabilities.
>>>>>
>>>>> This is split into two recipes. The emptty package provides the binar=
y
>>>>> and various agnostic configs while the emptty-conf package provides t=
he
>>>>> default configuration for the application itself. This RPROVIDES
>>>>> virtual-emptty-conf, allowing other recipes to provide their own
>>>>> configurations to override the default behavior.
>>>>>
>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>> ---
>>>>
>>>> Hi Randolph,
>>>>
>>>> This patch has been in my branch for a week now, but we are seeing som=
e
>>>> intermittent reproducibility issues.
>>>>
>>>> I opened a bugzilla entry by error, as for a second I thought this pat=
ch
>>>> was merged, so details can be found here:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
>>>>
>>>> Diffoscope output is here:
>>>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-sssl=
vz6_/packages/diff-html/
>>>>
>>>> Can you have a look at what is going wrong please?
>>>>
>>>> Thanks,
>>>> Mathieu
>>>
>>> Now that the source epoch has been addressed [1] should I resubmit this=
 version
>>> of the series? I won't be changing anything since the RFC [2] for the o=
ther
>>> issue reported on this series didn't get any comments.
>>>
>>> [1] https://git.openembedded.org/openembedded-core/commit/meta?id=3D70a=
74fa2bd9c374bd07b89b426a86991b1d93a5f
>>> [2] https://lists.openembedded.org/g/openembedded-core/topic/117730556
>>>
>>> - Randolph
>>
>> Hi Randolph,
>>
>> No the action is on my side, I just forgot to take back your series when
>> I took the source epoch fix.
>>
>> It will be part of my next build, thanks for the ping.
>>
>> Thanks,
>> Mathieu
>
> Hi Randolph,
>
> Sorry, I come with bad news again:
>
> AssertionError: The following rpm packages are different and not in exclu=
sion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/emptty-conf-1.0-r0.x86_64_v3.rpm
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/emptty-conf-dbg-1.0-r0.x86_64_v3.rpm
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/emptty-conf-dev-1.0-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3463
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260226-7ma9odl=
e/packages/diff-html/
>
> So it looks like the same error as previously.
>
> Now, a first idea: is the version on the right side of diffoscope the
> correct one after your SOURCE_DATE_EPOCH fix? It looks like it is.
>
> If that's the case, maybe the left side comes out of sstate from before
> your SOURCE_DATE_EPOCH patch was applied, and so the test failure is a
> false positive. Incrementing PR might help to fix this.
>
> Any opinion?
>
> Thanks,
> Mathieu

Thanks Mathieu. Yeah, that looks like the old date. I'll bump the PR and we=
 can
see if that does anything.

- Randolph

