Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D89E66884
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:09:02 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25321.1766174933076438962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 12:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ShPPzq8q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.8, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eULvIjtW2ectuzWL5f4M4wdBvKggdv315LPqhzIaRY7vfdi9EZ3vIliY25sYBtXqTSVCqdQN85YCgluL90IudxxYDqum4Z2nPRvBDVEtJ43PepiZS3fG5l3lv1TkIr2e3yr94V4s/Zd0++YTb1qGIPq2J42xmnJNtMAckjdOtuuqXTgqaw0mkVwqY1weGayJ7dVjgbuc/K1xFCw/qAYaY9Ku8xX8Z3Fowo6f8qiV933wHYFBFhj99wVGKm0zf91pekvXSGzCouQx3IIyeZlGw6RTpkIDRZUORKu7yLbQxomAj+9sy94hlL3IK4QkdUmAggbbETkNchjre9wJfx2WyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pN+0hB+pb7s+iXZEsJp+ER1xUFgAPPI/bkCxZTQ/zw=;
 b=rd+ZKzSCPpulRa8AiHLb5Nknl1t/o2sACmQhE6ppj9CaEEr7t8iw2CaTkj6z7lofqV3lStODI9eQ4MaeTDfWkR425QPI8/MH/LxP65/qGaYhAYLBwEvrh86tvxXiZfusn+MZc4/7sLJg0HgeqB6/bQfljjoUdOVc4hgKxE06m9Qg1AwzZBwuYJeckLx1tMtPUXlV95JVHwc7uZhOfP23bTzsmCUyFIjx6beeISJP+MztpAH40K3m/KGQ75hG1tQkSx5ZtZpXSYjGmQu5AYTHuIpBNBfA3AeCIggvnT6Ty62WLEtARA+ojb3jlaBir9jj3wb99I9c04WDIiJ4oCOlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pN+0hB+pb7s+iXZEsJp+ER1xUFgAPPI/bkCxZTQ/zw=;
 b=ShPPzq8qCOlPyawqveQVf20ReBMnrXYtYbsTzAV6nvNBMW51e/HeT1ZQfBrElHTrSDoB8+WEIYa936+52voevvzVe9TfR/GML/knZsqTNvOfSl0VJln3m808asKz3O4nPNY+0rjBPSM7dY4qQf5eB13OAxdqdh7hI7m1Z+EnVeE=
Received: from MN0P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::9)
 by CY8PR10MB7338.namprd10.prod.outlook.com (2603:10b6:930:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 20:08:50 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::b4) by MN0P222CA0006.outlook.office365.com
 (2603:10b6:208:531::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 20:08:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 20:08:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 14:08:48 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 14:08:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 14:08:47 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJK8lDD1460934;
	Fri, 19 Dec 2025 14:08:47 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 19 Dec 2025 14:08:47 -0600
Message-ID: <DF2GRCPPDAR2.1JVZW2RU0SKJT@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv12 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218191025.667701-2-rs@ti.com>
 <DF246UM8MWVP.1AE5NZSCNETPG@bootlin.com>
In-Reply-To: <DF246UM8MWVP.1AE5NZSCNETPG@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CY8PR10MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 566c436c-c59c-435c-2931-08de3f3a6d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amVNcHRpWUV6SWhGOVQ3bzAyS3A1RXY5Z0ZRWkZSSW9wMURIZjNzQUZ1bS90?=
 =?utf-8?B?Q1NqcHM2Y2FXNDM4RTJyamwzSE5FZGRxLys0V1RyRmZpcjR1NU9jTys2WkRZ?=
 =?utf-8?B?NTlYSVpqVzMzS0Iwbm5FNVdNWWxYMHN5V2VyNGR5Z3BoRkM5ckxPbFNFeVZG?=
 =?utf-8?B?T1QrWjlUdk93dUVmR2J2ci9tVUFTVXB3UzhRcGlySFpwOUdKS3diQWVCYW1B?=
 =?utf-8?B?MGt1NUZWbmRYSDlBbG5VMlRPaDVSR0hwb2pSYzY3SXR0R2o4ejgxeEsvS2xX?=
 =?utf-8?B?SXZqS1gzOWs2VHlmUU9mVG4xLzdlZHZXZ3plOEFocUkvK0ZsNWZFazJZMWZX?=
 =?utf-8?B?bFFPVitvQThSQlZVaExRKzQzZlBLNVJ4b1NVbHlIS01jN2VzcENHWmp5VXlU?=
 =?utf-8?B?RUN5czVOai9ZTWMyYVUrZDBwM2doOVNKb0pKK3R4QzNuL0w5OWNHTFQ5WlV5?=
 =?utf-8?B?T3h4QnAyVGdRUjhzTkFvNno4SGt6eVZuS042QUxJSU93L0NNaWxaQlJsOU1X?=
 =?utf-8?B?N0dYb3ZZdEQwQWF4aVhuTWhaSUYzcXM4WkJlVzBWVmhrZlpQL2NqVFRVbGh6?=
 =?utf-8?B?RTVwNHpWa1lpcUZQUnlZSTZoRmdhMEZlUHM2THVQcm1pOHlZN3FQNDErTTc4?=
 =?utf-8?B?YkphVkh4TGU1NXQ3UFk3K2VVNzlsSHNUZUpPdFExRUduQTNIS1JCT2pFRk52?=
 =?utf-8?B?QzE0MWhsaXJCTzlYL1lyWHFSRHpVYzQySkkveEIyS0hnYVd2S0YyVExtNE9z?=
 =?utf-8?B?K3FqYk1RVmE2UWRsNTh2cWdFYkdPVUc1UTdJcFg2dWF1Q21vV1RNL1ZjNjE2?=
 =?utf-8?B?RDRaY21lMnVQbktwK1lITHRLbzEyR2ZBSXMzdnBwbEEyWmVBYmRHWGVLNEhh?=
 =?utf-8?B?eEVSSnEwSUQzTHdDZTBCWG00OEtOQ2hNWUZYRGkwSGpjOW9MeVMxSitRY0NN?=
 =?utf-8?B?eVpMOE11YXprRUFVcHc2ZXF6bXp6SWkreGVXRzdKWVdSYkZtdTE2NXRtS2pI?=
 =?utf-8?B?Wmo2YlllTjBEblQyUW5HYmVwYnJKQVJIMjhkRVJtSG9oUTRIUVYzVWE5OTBh?=
 =?utf-8?B?RXd2ME5wRWVuVGlrTE5LVEdMZWtFNEYwUURtbDBjTU9NTmM1OTQ2aC9aWXEv?=
 =?utf-8?B?SXBZZ1ZvK0NpM29HUERocHdWb0xXM1pyZ1dyY1pTdWRyaDBzakVBVFFiOWVU?=
 =?utf-8?B?aDIvQ0pvSUFicld2ZFdNODh1VSs4YVRXNTlwd2JOR0xSSGFka2RHdUl5K3BB?=
 =?utf-8?B?Q2NsODh0NHlQTkRzc295TXBHcHo1YWE0R1AzV05pMzRMbGhxSkprcUFiZGJO?=
 =?utf-8?B?ekVwL0VOY2txUzZ1MG9RbmZTZm1sZXcxcjhKUEwrT1hLTXkwcEJlQUFVdEpK?=
 =?utf-8?B?MWcvYnJPVG85RXpvR0ZPdVNrTmNRM1doTUt4Mjh2aW9abGIzVEhrRjZaeDVa?=
 =?utf-8?B?TjFpYVJReDV2RlNIbEk3RUJPbXpBeHJxeWRMSXl3aC9iTk9xMUltK2dPM3Y5?=
 =?utf-8?B?a3F0YlMrZWpZd0YrQ0xPbm5YNDJzdS9uV3hXZFlXQUdUL1BXOWNTcWhZcU1S?=
 =?utf-8?B?Y1dJcnA4WnAwcUIzd1M5a25wYkVWVE41aDMxT1NlNFBueTFaejRpWnYwRUcx?=
 =?utf-8?B?QWp3L1UyM2thSHVvMjd6RTRCYUNKeUlqQTFvRlFWM05FOUlBZHNYRkh2NUk5?=
 =?utf-8?B?cmJtbWZMdEhDcjk5blVWVUpaamRDRTdjTHFOYW12NG9jc0JPbGpqYTdQeWNu?=
 =?utf-8?B?Q0FzWVU0YlNreUo4YWRuazZQS0JXaDVpUE9QTjRVNVlHbmtjL2R5RDZWZ29p?=
 =?utf-8?B?am5COU5TMjBmZFB4YVljWmJ6NnRuRXllRHc5YVhIYzh0Zk5XcXVkV3JzSzNr?=
 =?utf-8?B?QzZiS2dEMjI1TTY0T2lNZElVaHBxZVl0dHdrN1RxMkZ6Q1ZXejFIUWk3V2No?=
 =?utf-8?B?STdBV0dpclZ2YzBHQ2lkWnVTMHJlSzZJNmhFMzVuQUVxN1FGWFBxRTdYU3R4?=
 =?utf-8?B?K3dvcU9aUkl0RTh3akZoMXZrWHk2QU9lb3lBOXVXblpZV0dJdkpSMCtMMGJ0?=
 =?utf-8?B?U2hwQUpXMS8wUkdwc1RjNndXMzVJSkVvMHJjQT09?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:08:50.4129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566c436c-c59c-435c-2931-08de3f3a6d22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 20:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228243

On Fri Dec 19, 2025 at 4:17 AM CST, Mathieu Dubois-Briand wrote:
> On Thu Dec 18, 2025 at 8:10 PM CET, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Hello maintainers, I wanted to wait for the latest tag to get cut before
>> bringing this back up, but here it is. This version addresses most of th=
e
>> concerns I've seen regarding this series and adds on a little more funct=
ionality
>> considering we now allow for proper session selection.
>>
>> This led me into a bit of a dive into the desktop-entry-spec [1] and ass=
ociated
>> validator [2] that I wouldn't mind some opinions on as well if people ar=
e
>> curious about that.
>>
>> Legacy details follow:
>>
>> We've recently run into some issues with weston-init attempting to start=
 Weston
>> prior to all drm devices being registered. There's not really a good, sc=
riptable
>> mechanism to listen in to device registration events that works with the
>> existing weston-init package. Well, at least one that doesn't involve po=
lling
>> files or introducing more dependency on the init system being used.
>>
>> I also see there is also a lot of scripting around starting X11,
>> xserver-nodm-init, that (from my limited review) should experience the s=
ame
>> issue.
>>
>> I'd like to introduce the following display manager for oe-core, emptty =
[3].
>> This display manager is, as described upstream, a "Dead simple CLI Displ=
ay
>> Manager on TTY". It supports both x11 and wayland sessions, with togglab=
le build
>> parameters to completely remove x11 and pam dependencies. It's licensed =
MIT,
>> which shouldn't be an issue for any users. (It is written in Go, if you =
have
>> opinions about that.)
>>
>> With this, both weston-init and the xserver-nodm-init packages can be re=
-tuned
>> to leverage this display manager and simply add a user and emptty config=
 for an
>> autologin session. This can resolve the current behavior across init sys=
tems
>> without additional scripting, and move some development out of this laye=
r.
>>
>> This lists myself as a maintainer of emptty as well as xserver-nodm-init=
 and
>> xuser-account since these are currently unassigned and I've reworked the=
m
>> significantly here.
>>
>> Sorry for the delay on this series. I found a few bugs in emptty that I =
wanted
>> to address before submitting this officially.
>>
>
> Hi Randolph,
>
> Thanks for the new version. It looks like it got better. Still, we got a
> few issues on the autobuilder.
>
> First, issue, probably because of nopasswdlogin group:
>
>  NOTE: Resolving any missing task queue dependencies
> 2025-12-19 08:42:54,839 - oe-selftest - INFO -       ERROR: Nothing RPROV=
IDES 'xserver-nodm-init' (but /srv/pokybuild/yocto-worker/reproducible/buil=
d/layers/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup=
-core-x11.bb RDEPENDS on or otherwise requires it)
> 2025-12-19 08:42:54,839 - oe-selftest - INFO -       xserver-nodm-init wa=
s skipped: Recipe xserver-nodm-init, package xserver-nodm-init: system grou=
pname "nopasswdlogin" does not have a static ID defined. Add nopasswdlogin =
to one of these files: /srv/pokybuild/yocto-worker/reproducible/build/build=
-st/meta-selftest/files/static-group
> 2025-12-19 08:42:54,839 - oe-selftest - INFO -       NOTE: Runtime target=
 'xserver-nodm-init' is unbuildable, removing...
> 2025-12-19 08:42:54,839 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['xserver-nodm-init']
> 2025-12-19 08:42:54,839 - oe-selftest - INFO -       ERROR: Nothing RPROV=
IDES 'packagegroup-core-x11-utils' (but /srv/pokybuild/yocto-worker/reprodu=
cible/build/layers/openembedded-core/meta/recipes-graphics/packagegroups/pa=
ckagegroup-core-x11.bb, /srv/pokybuild/yocto-worker/reproducible/build/laye=
rs/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-=
x11-base.bb RDEPENDS on or otherwise requires it)
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       No eligible RPROVIDE=
Rs exist for 'packagegroup-core-x11-utils'
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target=
 'packagegroup-core-x11-utils' is unbuildable, removing...
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['packagegroup-core-x11-utils']
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target=
 'packagegroup-core-x11-base' is unbuildable, removing...
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['packagegroup-core-x11-base', 'packagegroup-core-=
x11-utils']
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target=
 'core-image-sato' is unbuildable, removing...
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', =
'packagegroup-core-x11-utils']
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       ERROR: Nothing RPROV=
IDES 'packagegroup-core-x11' (but /srv/pokybuild/yocto-worker/reproducible/=
build/layers/openembedded-core/meta/recipes-graphics/packagegroups/packageg=
roup-core-x11.bb RDEPENDS on or otherwise requires it)
> 2025-12-19 08:42:54,840 - oe-selftest - INFO -       No eligible RPROVIDE=
Rs exist for 'packagegroup-core-x11'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3049
>
> The second one is again on xorg.XorgTest.test_xorg_running:
>
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-=
core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-=
core/meta/lib/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
>     self.assertEqual(status, 0, msg=3Dmsg)
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
> AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER =
      VSZ STAT COMMAND
> ...
> RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.30s)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2862
>
> I had a look at the corresponding QEMU boot log, but there is no
> error in there.
>
> Thanks,
> Mathieu

Ah, thanks for that. Didn't realize we needed to cover the case where both
systemd and sysvinit were enabled, but sysvinit was considered to be the ac=
tual
runtime init provider. Out of curiosity, what's the consensus here? Should =
I
ship the legacy inittab entry only when a legacy init is set as
VIRTUAL-RUNTIME_init_manager or should I just always ship it? I'm more favo=
rable
to only shipping it when necessary, but I've seen a mix in the past.

As for the nopasswdlogin issue, I'll make it take the place of the old wayl=
and
group in that static group definition file. Should be good enough if I'm
understanding that error correctly. I'll also make sure this group is creat=
ed in
the emptty recipe itself since the pam entry added there makes reference to=
 it.

Unfortunately it seems both OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS and
OEQA_REPRODUCIBLE_TEST_TARGET are unable to reproduce the issue, and I don'=
t
really have the resources to build *world* twice in a reasonable amount of =
time.
May need to rely on you to check the result of that fix.

- Randolph

