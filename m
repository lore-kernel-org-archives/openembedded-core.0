Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CB5E9A039
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 19:15:18 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20117.1771355715416770743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 11:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pBARsz/V;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.33, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMOojKPXA3t1WcDIHJ/JcjpbKLz1Qt4udrwrHnAb7wocEcRvsACmg28uCOp6ezHmsbu+rr+qdF+AcCX6XGYf8kPXefVjReyKC7uAYuYMjGO9/fRkI6qemr1IvNEqwXGWlz1RbdeTERBYPt77kS8os4wcikKGA7JEdc2R5csLK7XVqRCs+NlhFWPUPRtdiWF3j2qw30XquT15H34IKo716MJrS0yvrQ07YbzOaxirEw+l367pfi3kUjSe/Oas83JcnLUEp5dnpwc1JWJDdJPbNPXpis+Vi8l61E8l4/JhNPudLBBcLuDGc0rFa2KTfG5ST7X0jpCk86MwkvfKsPOSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSDchyXtrTzZ7rGKaeob5MZQHOjpASiDj/eAOV1I6Fs=;
 b=ogux5/NUpQrwX2RU+aQvy9IfohQf0AkWQ/eSVb6Aq+vePMXvsEhSw/rmMT82ORfHmQfixjQX/wIHLYqi5BNeN/FN5jDwYM37Ry4UbwuSlO7n6cZHk5AaLjl4adDR2bDNjrBcB0zjqt3Z1a43UUmNZqCGnIKKfvZ7L42vVxL7Zhht9C8VW+Nl0NbtIFnAj9NS3wlk75FTtf5OTrvIyILH9zJcxtkpH10+Zr34mMhYXE45xUc+tKDxOmhI6EMg+gQwdSwUoYOgKKlj94ciSoeOyslj3383JW0BLOyn7DjubTP9NKZR7jzDBuo3tVknS0bXjeKhTt3jh+nO3Myjo+JdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSDchyXtrTzZ7rGKaeob5MZQHOjpASiDj/eAOV1I6Fs=;
 b=pBARsz/VGUVh2w0RkeVPnGe1QDweHByorUCJhobN4ASNVXZezPOu74TV4wN7JZqc1QEB7SPi3Fzp4wabx1H0BoG4K1S9vRKvNir8D5k99waOdALVAwFbz9kdHDeq5Gbm5Fb2uFi6gQPxEMOLbWp8wMCm3ZGhwxZ+5n49P1fu7xw=
Received: from PH8PR21CA0005.namprd21.prod.outlook.com (2603:10b6:510:2ce::21)
 by SA1PR10MB6566.namprd10.prod.outlook.com (2603:10b6:806:2bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 19:15:13 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::cb) by PH8PR21CA0005.outlook.office365.com
 (2603:10b6:510:2ce::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.10 via Frontend Transport; Tue,
 17 Feb 2026 19:15:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 19:15:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 13:15:12 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 13:15:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 13:15:12 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HJFCEp3357964;
	Tue, 17 Feb 2026 13:15:12 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2026 13:15:12 -0600
Message-ID: <DGHH70CESGIR.2VMOJM30N4RB1@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][RFC] xuser-account: convert to standard-user-account
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210002506.95298-2-rs@ti.com>
 <DGFEXAE48FOM.2H2FQ3F1P9HSX@bootlin.com>
In-Reply-To: <DGFEXAE48FOM.2H2FQ3F1P9HSX@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA1PR10MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: d971aa65-0796-46d9-5491-08de6e58e03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZVBhVllaaXRFQW1CcXluNmdoc2xkVXdpb2JWSDFQVzZvOGtZSFI2MEwyUGd2?=
 =?utf-8?B?Q3Q1K1BhY2ltc3krVnVqWGd4R01YU3BaNkVsbVZUcjVUdEpYaWRnOVM4cWhv?=
 =?utf-8?B?V3lxNldzT21iUzRXUWgxRUtGUDlXTy9UYm5hRkJUQVNaRVd4b0JkL2laWnA1?=
 =?utf-8?B?N0ZHT2pMSkJaWENlN0kxaUNORDVhRDRmaEdGVTFwVkdiY25VbG1EeWM0OUZ4?=
 =?utf-8?B?SHhKNHNnU2FiWGpWVVo2YVg2Zm1obm5hMmx3d2JiaEpDRWR6ZTNBSkhpSDhU?=
 =?utf-8?B?QXRKaUgwVStoL1lrcDhycUVENVlZN1d5UUFXTFoyQjFjK0pRcENacVJBTFB3?=
 =?utf-8?B?VEIzRDRVdmR0YldoU0tObE1qcXJScnVKblY4WlQ0Mkl2Q3haaFpvRTlxdHhv?=
 =?utf-8?B?aHlScUpHcjZNcHJuTG9aQWh1YnB5Kzk2c3F0UVVXNWNRWjNSWkhDTnpmQWxZ?=
 =?utf-8?B?TWU5cjZValFmVXVhRXFZK2NWZUFPN0JpckxCRTNqcHR6SnI4NTVkSkNuNG1j?=
 =?utf-8?B?SlRiL29UM21LclI2STFqZXBFNUZxZnh4RTNid1JyQnZ6VDM4UmFYMFVuTlpD?=
 =?utf-8?B?dUYvT3VqMUxZckpxNHRGL1kxdC9wcm1jaW53ZGJGZGZYOHZwN2VHSXV6VGM5?=
 =?utf-8?B?VTcyRW9jMTJnNjhZbG92MytxZ3ZYeTFwRHFoQ2cvcEdMaFRqU1dvYUtBU0Vo?=
 =?utf-8?B?TDhlMFRDUmZTL0IrN2t4RkkrVmhOWnpmdk1uY2Q3R0owcmx1NTl4UmkrenFp?=
 =?utf-8?B?Yk1nSUQycUI2ZFlHTGl4ZEtyWkdpOHdvcHg0RWF0czVla0JsZlQ1bS9RTm1J?=
 =?utf-8?B?L2lZeUhteXBjN2gxMzVuMGdNVmFpSWRZbFhOaXR6UGp5L3dMZVpKZnBNSHUx?=
 =?utf-8?B?eFNZeEhwdGttaUJyT1hRVnJmS3dkZFB5ZWl3QlVQTTZCUG5VVEtPZ2tvL05U?=
 =?utf-8?B?dnZ4Ty92ZGxJNlk2TExRVmdKL1FBOHZrVU9veERxZU1SR2I1MitsK2Iwc2Zo?=
 =?utf-8?B?OEc0d2UrMkhEM0drR3JScTZNVmhlV0hEY3JkRWxIcWkxQldxdWMwTCt1Uldo?=
 =?utf-8?B?TUYyY2xhZU5RWFEzL1d5VkFINS9nZkMydVhrdnRiNVEvYUxHYnczdFdlUk94?=
 =?utf-8?B?cGYxY0dWbTRWZkdCZWpVU05SK0s1dVB3M21NUy9sMURVQjZuZDJibEltQXpE?=
 =?utf-8?B?YmhsZUhkTmVkTkU0QVFWaER6elpWamkwN1ZUUFRXajdpUUpoOExYbmZCeDR1?=
 =?utf-8?B?cGphdVJyYWZqL0s3VW9TUzBsTjFNazNMYXp1M3VsdjhabmNjOEVsdWZPYzZG?=
 =?utf-8?B?dXl1Vm5jbzFjVHZnNGxSRFhFblRuR2dXVmd1ckQxZi96MTlwNm9aeU9EcUY1?=
 =?utf-8?B?dGxxWHBGTXMvZ28xb29YNW9Hd2Z4K01lTmJBcXc5ZkYvZE9OUDFZN1YrN09v?=
 =?utf-8?B?c3VySkl2SWZud0t1bTlZUWNwU09SSDVKV2tUb1dDelRkbUdwcVZLbUp6VUxC?=
 =?utf-8?B?UjVoSVZxRUpzbWNlMmZqNTJ5L1pzcVZmNWxLL1dmUms3QVFYeGZtOXd1VWhS?=
 =?utf-8?B?dlo4a2NPT0s1RmR5WjRjT1M2bkF5dXFhT0g2TG9zQlBURjFVNkgxdnZpTXlq?=
 =?utf-8?B?VjYvQmpidW1rRi9uUjhadWY1QlRORCt5UzV2R0FRREdxakxKSHdEdGpnYk41?=
 =?utf-8?B?NjZBaVo3OTBUTWRVQ1hoREFTWEdiL2hMMTJ5c1ZuTGJvYk9qazlmWmFCVCty?=
 =?utf-8?B?b0VtcUkreEZJY3VmODVsd285WGhwNjUwR3JkbndsTUdpbVZ5OHVHb1VqMStK?=
 =?utf-8?B?bkZIYmN2MHVQVjdPSXIvcTljVUEyUkMxdzk2TGRYaE5NTGsvQzJVeWl0YjE3?=
 =?utf-8?B?VXNpL0RCQldXdGdVZEJvY01lQStsSjJjUG5oTjl6Rk5kcTlYVHlWeVdzcUVy?=
 =?utf-8?B?Qm53YVF5SEx4NURwVmlVZlNTSmtjODRYTCtFM2hwNmcyaWlqSXlyT2FvalVN?=
 =?utf-8?B?R3pEY3V2OTJFVGRUbXFxeUZwaWR6NUFRSmU4bHhhdmZVdkk4S1l0TTdzQ0FZ?=
 =?utf-8?B?Yk93TE1ISU5nVWk2bDRBSHFuRFdjNjVPQlFxcXRZcWFBMmY3MldDMm42czlz?=
 =?utf-8?B?aEIyUFlDMFZoUTBqM2dIb0pxMlVUZlgydTZUNDdDUm9rUFpHM3BpNS9QZ1RQ?=
 =?utf-8?B?b0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B5l4SFXQ5m+oebs3gAvtV0tgXJ/IB8XMAVuHt9sxf/OwEiPGTl39EjDRDASEex5Kfy1MQXEMx+bZtGkaknMNdDHFfufVhwMoQx9tkB+wO4y5bid4963RtcX23tD9nlEvljQSpTEwsXSqvCfLAy0GJMrabeCpD1yIWtRLE+4eHOKi+LNW+SmZSXGFA9+K5DRxf1PMtMoX8kE5TYFJwxfgZUKhWhhOf/A1T73wE6MjStUQaRaoHKwh+uGueyXBShM4Igc3FZmN8CoxSl0dYqB8EhssPWnt+FRNmm5gg4xHo3zwhOWeuotMFTMAPlj78Mngx/4V4LLXrtWIOnRsFGxwjNOrSYILeRb26noexxSijNPFUa7Khgzj5pIakiMBwYCDvWGLIZtDYNo+1JoxSVSO5nMM5hxd2wuMscPjVSOPPO+o+54kI/wfYdgQtAIFI6PH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:15:13.0635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d971aa65-0796-46d9-5491-08de6e58e03b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 19:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231271

On Sun Feb 15, 2026 at 3:03 AM CST, Mathieu Dubois-Briand wrote:
> On Tue Feb 10, 2026 at 1:25 AM CET, Randolph Sapp via lists.openembedded.=
org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Change this single xuser account template into a generic
>> standard-user-account that uses distro level variables for
>> configuration.
>>
>> This allows for seamless configuration of multiple out-of-box scripts
>> and tests across layers without having to implicitly hope that the
>> username or groups haven't been changed by a bbappend or recipe
>> override.
>>
>> This was proposed specifically to remove some issues highlighted in:
>> https://lists.openembedded.org/g/openembedded-core/message/230665
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>
> Hi Randolph,
>
> I know this is still an RFC, but it went into by weekend batch of RFC
> patches tested on the autobuilder.
>
> A note first: this was tested without your other display manager series.
> I hope there is no dependency.

There isn't. In fact this conflicts with the other series at the moment.

> So far we had the following issues:
>
> AssertionError: ssh exited with status '255' for command '['ssh', '-l', '=
root', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '=
-o', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', =
'-o', 'LogLevel=3DERROR', '192.168.7.8', 'export PATH=3D/usr/sbin:/sbin:/us=
r/bin:/bin; export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; export WAYLA=
ND_DISPLAY=3Dwayland-1; wayland-info']': this is likely an SSH failure
> id: unknown user weston
> failed to create display: No such file or directory
> ...
> RESULTS - weston.WestonTest.test_weston_running: FAILED (0.80s)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3189
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3316
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3214
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3090

I didn't adjust any of the tests for this yet so that makes sense.

> And a second one:
>
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       ERROR: Nothing PROVI=
DES 'standard-user-account' (but /srv/pokybuild/yocto-worker/reproducible/b=
uild/layers/openembedded-core/meta/recipes-graphics/wayland/weston-init.bb =
DEPENDS on or otherwise requires it)
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       standard-user-accoun=
t was skipped: Recipe standard-user-account, package standard-user-account:=
 system groupname "disk" does not have a static ID defined. Add disk to one=
 of these files: /srv/pokybuild/yocto-worker/reproducible/build/build-st/me=
ta-selftest/files/static-group
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       ERROR: Nothing RPROV=
IDES 'weston-init' (but /srv/pokybuild/yocto-worker/reproducible/build/laye=
rs/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-=
weston.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedd=
ed-core/meta/recipes-graphics/wayland/weston-init.bb, /srv/pokybuild/yocto-=
worker/reproducible/build/layers/openembedded-core/meta/recipes-graphics/wa=
yland/weston_14.0.2.bb RDEPENDS on or otherwise requires it)
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       No eligible RPROVIDE=
Rs exist for 'weston-init'
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       NOTE: Runtime target=
 'weston-init' is unbuildable, removing...
> 2026-02-14 17:59:08,803 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['weston-init']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3355
>
> Thanks,
> Mathieu

This error should have been an issue before this RFC, as the xuser account =
was
already being added to the disks group, which was never actually added to t=
he
static-group file. Suppose I'll fix it if anyone chimes in on whether or no=
t
this is even a good idea or not.

- Randolph

