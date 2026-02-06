Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C442EE6B4D
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:00:12 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2301.1770408011476519274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cWe6Hv97;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.12, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeRkB4F/8G25lDo/UkgwgW7NZPXaubzPOGMMCY+MPB7XAmlGoTkTxpqXJfOaBmp55Nb+h0NCmJZlDnlVoGDE8XQ01YNzaV+bU/d4watTwiQlmS3UV3uxCqIdURqSR8nVdVcZMOjnzBeM55brkcSasexqrx36/V19GqhfJyQtYv3jxCCVLDx1SY07NxPGNEfmeLnEp5+qQqF5XViwLO0HiCwyqGlA6oVjAubot3B1vWQ5YzogDWW3r7PKd/6N0p+rSyb3RWZEIEZgsIJ31vhCJR9R9792lM19AC9i0nf3HrV+/Bah345ae16LIkNYhVAOTyJ3/yjS6Eq9zYT6a8qk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI6eNuzT9WjVYnQvQBAEVWqu9nRZ/+TyCabS81+b5Pk=;
 b=COIeUShzmJOeAkBJUGaiL3uGnE99lvZQF8k2qBSXALYUyBz3zsBq0ktbKk/0M4p0EJtO4WGXqEPfEyPhTHjNkRSuXUy8ZXZssbTKCfHdU0snieztz4VMbEQUxp6sZbEIJBvRO55RKylGEy4UkULnWdEd8AkJ6bixWYn3vqrQr1JJoR+Wo6NzCHdHpAiFGIoAGlYpWCiZQEHSShVveQ22v9RndMo9AkWGeijgcMrXMIj8Jm9U63DsmadyTc8tJQArKHdooGZBDEoS1PLIt9MHKhBdxNJ7GaSd4ZJZ+BmMZvs0a9vNTGkd2U5ZLfpyfVnsL6qizawPd9IiFbgFdtgDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI6eNuzT9WjVYnQvQBAEVWqu9nRZ/+TyCabS81+b5Pk=;
 b=cWe6Hv97NXEragsM1ay0j8+WhJFQypyS45UHVWfUYpBeDIEv75JSX8eWoQuufiKQQ9DlLnf4pcJHy2uAHNAUddMUjI8zOvfnLqYxYgHnYOz2XclENaZ+tI0fPXgWP+LaR+4xje3Jtps93DQxrZyYdIl48K9e1jLJYZfAenxepEs=
Received: from BYAPR11CA0044.namprd11.prod.outlook.com (2603:10b6:a03:80::21)
 by BLAPR10MB4996.namprd10.prod.outlook.com (2603:10b6:208:30c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 20:00:08 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::28) by BYAPR11CA0044.outlook.office365.com
 (2603:10b6:a03:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 20:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 20:00:07 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 14:00:04 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 14:00:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 14:00:03 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616K03iM1877116;
	Fri, 6 Feb 2026 14:00:03 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Feb 2026 14:00:03 -0600
Message-ID: <DG859CXX3LWP.2BXUQMRVSRAV@ti.com>
CC: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>,
	<afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 5/6] xuser-account: merge with
 xserver-nodm-init
From: Randolph Sapp <rs@ti.com>
To: <raj.khem@gmail.com>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-6-rs@ti.com>
 <CAMKF1sqEMoKd2U7sDVQNyPZH9Xd=MKx62c=o-iussWnVDk+zUg@mail.gmail.com>
In-Reply-To: <CAMKF1sqEMoKd2U7sDVQNyPZH9Xd=MKx62c=o-iussWnVDk+zUg@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BLAPR10MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: ebddf647-ea00-404d-2185-08de65ba53d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blVhN0lINDB1eWFKRHJ0THVFdkVvbHZwWG90WVlod1Jmb2c5eW1xaUh4cXZ6?=
 =?utf-8?B?MURjU01Fb3BkRHk2RFRvNU9GMExKTWpJdHhLODFRT1ZPOWgrenVKRkxuWHNy?=
 =?utf-8?B?RXJJWmpTdDRWc2NFQ2s5N3NEWU9Venh1WkNKZ1NYN2U2bkxmYjVMK3lHWVJY?=
 =?utf-8?B?WWZ1WlJ0RkNhUTMvc1JYak9tNVRwZktVYjIycUZiQmdrcDNNRUJiU00rYThF?=
 =?utf-8?B?MjR0dUxtUlE2L0MxeTFXVHdwNFVhRU5oVXZjU1FPMkRudUEzemRBQkJ0bUFa?=
 =?utf-8?B?UHlSaU1UTjRYd1o3bmhsYk1Jd0trdVhJaE9wYWJLOTBmS2VMTmM3TVpPSmly?=
 =?utf-8?B?RDdxUDRzZzNsanNtQnFJdHpoR3p3WktSWGtTMSttSTBWYjVlUDgyWk43Qy9v?=
 =?utf-8?B?dm5pSGt6WjFKYXVybFRlSWRzU1owNHhhUEhwcFFDR0JBNEE0bjFkZzI2Y2k3?=
 =?utf-8?B?NU5JRFlpSEVBdlVxdFNQWEFVZEJ5OWVKR0xQbDgxRFc4OEpWNFJMaFd1MXFE?=
 =?utf-8?B?MlpCblRXT2hXTElyMHI5Yk1XODJMM0ZHblYvVWYyU1JEZWwydjd4T25YdDBM?=
 =?utf-8?B?REtZNE5lK3FxZWYzN1VQeWhpZTFaaEtZKzF1Y2ZqM0hVYjU5N2tKbEJPRmgr?=
 =?utf-8?B?WWdiTWZ3anpXRE50Wm5nWlA5R2wwVjVpWnd1bm9TbWR6a0wxVy9JU2NqbGkr?=
 =?utf-8?B?ZlN0ZGtzTU4rMVZsNTA4OE9Ic0hXaUMrdi9oZ1BRSkZTdjZuTFIvVThLL2Mw?=
 =?utf-8?B?YTlYUGVSQUkwUjNZbkRHbW1Mclh3b0VMMlJnWnB3UXh0SWRFR3c4NXNmVVNC?=
 =?utf-8?B?THBEU1JmejlCb0lVbVpPUXVBU0pJeXJtTnZpRUcwM3pJQTZOMHJZTnBKNGlS?=
 =?utf-8?B?bUFPTVNPOVJaU3p3bTZmRDVzWVhqUXZvQ290aVRzcW1vZEFzb0dLWVlyY1Vw?=
 =?utf-8?B?R3l3SmtIdHVSTUtPa2s0Zkl1OGFqNU5LdVJXdUFMTUU4ZzZDQ1UvWWVJQjNv?=
 =?utf-8?B?Mjc1TE5Fam9UaWQ0Q2xZdTdLRTlNM2ZBMXAwYXhUK0pPUERGSU0vY2lRUEZQ?=
 =?utf-8?B?R09zM1FEcTl4VjR6RnR2ZHV4QTlMTmJ2ZjlVbkdhTjNoMUN3OWgrOWNNSW0y?=
 =?utf-8?B?UVlTSS8xM2RDRVFuR0VEVjc2ZUtMcGcxWDJJSlg4WnpSQWJxeU16QmhtcVZH?=
 =?utf-8?B?R0tuTSt2T01qVXVocDFRT0JzVlRWRkFkWFhieWhIblQ0T2V0U2xocW1FalZJ?=
 =?utf-8?B?NlpDVWpGVU43VCtjQ0kzZDl2VW1EZTFSazQzMkdqQkpCbW1MQURTdXI4dXVp?=
 =?utf-8?B?Q1BEcDIvMFU4dWZhVzA1QU9mU2RTdWZ2N3Zna3dPNXFCWG4zcDNEWk1PeTU2?=
 =?utf-8?B?bUlDTm1mN2hsMVpaTHlzQlNiWkQxYktVcFJiSnkyV1FZMSt6QjIwY2E2RW9J?=
 =?utf-8?B?NmxucVo1bXVDNjVXYkVJeTg0KzFzREZzUlFCbFNDZHQvenIxOG1uSURQVzFF?=
 =?utf-8?B?SFIrSGJxTnNDUFJPV2xwMURIbVM2OGVJclBqbGpTRFI0Z3pDdnpmZUs5TFcy?=
 =?utf-8?B?N0ZpRXY2ZlZvQmdCVFJ3dlQya2oxV0FqRWV5MEJFMG5BZkRLRDFGSmlWcHRt?=
 =?utf-8?B?MlVaK1FKUXR4QllwMjNpQTY5T2lmVTBDY21COC9YOTF1cXgzRWpiY2pnT0kx?=
 =?utf-8?B?UVhSV3RBdVErZHJkN1YyZDNPUEhJcWN2SHo5Tm5ETVBOWUt1d3J1NE5Ebmox?=
 =?utf-8?B?L3oyTU9FdVNvbm5nUEdwMVg1dHBSOFFtUDg2VFdLeU9WTUxiRkQrby9SczQv?=
 =?utf-8?B?Z0MyTTkrQk5RNVR3OHpTZm9renZubk0zZy9MRkJ0VlJZMThwODJOTUJvejkv?=
 =?utf-8?B?cjdCbFFtUURPcDVZUk13Nk5VZ3dPaTFrY3AzRXRRSGY0aUptSzVYc0MzaTlW?=
 =?utf-8?B?ZWFiQTM4ZlgzeStSS29qMnRXSzVHd3FkMXp2T0U0QVBKcnI2bjlSV0x4M0xy?=
 =?utf-8?B?dWlWVkRxcG1XWjhGNnFjYXFTTmo1dy96UVdFemp1cHJaQXJTdndlS0g3T2FI?=
 =?utf-8?B?cmg3ZTB2b3ZCYWs5bWJBTFlBTktUYmNEVG1LdGsyTTB0dmdnNlBQdGw4eUls?=
 =?utf-8?B?aHA5S2Y3cG9WU2lrYmxPOVVycTcwVjhLWEVLQ2VwMEpwZWRJYlRBdUs0dkJM?=
 =?utf-8?B?RFpaRytyaGhlRmVyUW5Ld3FvL0k4ZEhIdml5STlKMDhFb1c4N0djcnJFODN6?=
 =?utf-8?B?MlNSbWU2aVlUS1RtdGRXWHhCemdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	71u9k6LZ909o71tnEdIqZspiAQeiZLLch3NdbHLSV54pNy54pheI9W1tyVWyeBVi+HWrbvJPDA5IWq18oRzcY0KRXA6+98JaVZjkmCAOlpVffw2f6lMgzdiEaIQVyN/shk9d/zxmFvuj6ba/l2m+1iA4uIOe2oLkb6jvEW58+yc7jUhcZ2lGdO3jdHgH45VDJfJ2nRH7LbaSW+kX8Q+KpdkoWhH195I2A8UAUHvhZxcJG3xhpMdpJ+MGGbsd92vWJZ7FCwOZbXaZKB9Rkxv6ahym5SeVN+VfnnJrmdaO4JPdFW14HrBaQZQBCPwLPapW2921E714pPTuwUxWtfHj6Or2Ll1dbyv/iUWMMhw56NB0AM2Ax1khuGIXE4fy3CeI2GvQN/kMIorI785EP6EWInWrj4kJWfLtF1l2mo2D3b0TIViPPVMqaXFJQcYY3j91
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:00:07.6503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebddf647-ea00-404d-2185-08de65ba53d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230643

On Fri Feb 6, 2026 at 12:15 PM CST, Khem Raj via lists.openembedded.org wro=
te:
> this also needs adjustments for fvwm and xscreensaver recipes in meta-oe
>
> On Mon, Feb 2, 2026 at 5:20=E2=80=AFPM Randolph Sapp via lists.openembedd=
ed.org <rs=3D
> ti.com@lists.openembedded.org> wrote:

If everyone's alright with this version of the series I'd be more than happ=
y to
submit the necessary patches.

- Randolph

>> From: Randolph Sapp <rs@ti.com>
>>
>> Merge the xuser-account recipe with xserver-nodm-init, since:
>>
>>  - This is the only recipe dependent on it
>>  - This matches the current behavior in weston-init
>>  - Running x11 as root is no longer a supported path in
>>    xserver-nodm-init
>>  - The display manager configuration and user account name are heavily
>>    connected
>>  - The existing method of integration ignored this connection
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |  1 -
>>  .../xserver-nodm-init}/system-xuser.conf      |  0
>>  .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
>>  .../user-creation/xuser-account_0.1.bb        | 31 -------------------
>>  4 files changed, 15 insertions(+), 37 deletions(-)
>>  rename meta/{recipes-support/user-creation/files =3D>
>> recipes-graphics/x11-common/xserver-nodm-init}/system-xuser.conf (100%)
>>  delete mode 100644 meta/recipes-support/user-creation/
>> xuser-account_0.1.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc
>> b/meta/conf/distro/include/maintainers.inc
>> index a7425f7020..ec0a128901 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassi=
gned
>> <unassigned@yoctoproject.
>>  RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <
>> unassigned@yoctoproject.org>"
>>  RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>=
"
>>  RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>> -RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
>>  RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>>  RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.=
org
>> >"
>>  RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.=
org
>> >"
>> diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf
>> b/meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>> similarity index 100%
>> rename from meta/recipes-support/user-creation/files/system-xuser.conf
>> rename to
>> meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> index ed056df72f..0e9fe1e65a 100644
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> @@ -1,14 +1,15 @@
>> -SUMMARY =3D "Simple Xserver Init Script (no dm)"
>> +SUMMARY =3D "Simple Xserver Init Script and user account"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420"
>>  SECTION =3D "x11"
>>
>>  SRC_URI =3D "file://emptty.conf.in \
>> -           file://default.desktop"
>> +           file://default.desktop \
>> +           file://system-xuser.conf"
>>
>>  S =3D "${UNPACKDIR}"
>>
>> -inherit features_check
>> +inherit features_check useradd
>>
>>  REQUIRED_DISTRO_FEATURES =3D "x11"
>>
>> @@ -26,10 +27,19 @@ do_install() {
>>
>>      sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:"
>> ${D}${sysconfdir}/emptty/conf
>>      sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/con=
f
>> +
>> +    install -D -m 0644 ${S}/system-xuser.conf
>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>>  }
>>
>>  FILES:${PN} =3D "${sysconfdir}/emptty/conf \
>> -               ${datadir}/xsessions/default.desktop"
>> +               ${datadir}/xsessions/default.desktop \
>> +               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>> +
>> +USERADD_PACKAGES =3D "${PN}"
>> +USERADD_PARAM:${PN} =3D "--create-home \
>> +                       --groups
>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>> +                       --user-group xuser"
>> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>>
>> -RDEPENDS:${PN} =3D "emptty xuser-account"
>> +RDEPENDS:${PN} =3D "emptty"
>>  RPROVIDES:${PN} +=3D "virtual-emptty-conf"
>> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>> b/meta/recipes-support/user-creation/xuser-account_0.1.bb
>> deleted file mode 100644
>> index f1e4cb674f..0000000000
>> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -SUMMARY =3D "Creates an 'xuser' account used for running X11"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420"
>> -
>> -SRC_URI =3D "file://system-xuser.conf"
>> -
>> -inherit allarch useradd
>> -
>> -S =3D "${UNPACKDIR}"
>> -
>> -do_configure() {
>> -    :
>> -}
>> -
>> -do_compile() {
>> -    :
>> -}
>> -
>> -do_install() {
>> -    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf
>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>> -}
>> -
>> -FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>> -
>> -USERADD_PACKAGES =3D "${PN}"
>> -USERADD_PARAM:${PN} =3D "--create-home \
>> -                       --groups
>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>> -                       --user-group xuser"
>> -GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>> -
>> -ALLOW_EMPTY:${PN} =3D "1"
>> --
>> 2.52.0
>>
>>
>>=20
>>
>>


