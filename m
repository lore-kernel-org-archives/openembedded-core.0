Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C133EE6B6B
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 23:28:42 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4105.1770420516861651313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 15:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lUoH3bws;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.63, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehvOI7cLvbqtjP+Vj/zJpxVaL5Uoz1S+39qU0isUZihNj30DIUw/hzNoTbGiA/5u+Bi/huB4mQ6wper0voqkhT4lFrV2qmEMI0qjEs4/Kpu2Aj/TtZUzwExjQsBfLa+/sG1ElygBtQVhC1Ro5eU8Qo1EQVvS6+kozgm4avo/LqBVEZ9r+cWTn1Bvu9K14BmNn24QoUrFTEdw3hlwHed+Bxcsu+jv0yA75sku/lV9goBWQHVsfXU9kdICTwB/hmsySUSWnXiuq8g2hg6pIadkuyEAXG7YNSXHVfI58+qPgn48gHgJO09JbKzC8WkvgUnz49wVcq1jFGF1F2F+QA0rDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMbfrts4YM7iISiPNtCTAkutxyznOpbMAU/DY5tvZY0=;
 b=a7UYvqpZ4mXGCY2AfpgMl9ZGiHy2A5qO+LPVzE1LTS6W/I+ogjj5McbyKOlIbIYWyeOXQoB16Q+QJ3p9gLMhKmabxur9eIazAFngCCR82Y2wwOFzUbqMUjKMQaqLjsHX+YXk85/bid6a/VVo47x4IJ+C0qtpDeD4PjLATvyExSN8+nXfP/WfJTfwbu6zZruK9X6K+HmYM8k0NXAik/H9oD0xFTbvAP+lUn9PkAJFQYa7mYg1ee72o6LKytVgBFG3i74IMQcGex/rGLRKa20ZepasRyuYLegTRjgXAhCksvJZp0D68pS70q4HS3I78sE1oaIlwsZVqCeslbztoeMemQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMbfrts4YM7iISiPNtCTAkutxyznOpbMAU/DY5tvZY0=;
 b=lUoH3bwsgzBhpGDCRYXxD1wy3s7wVSBfvWhV07YweJoZJfnOzcoK5A61ETRuKQ+OD/kd+6vTr+5OT+MNLG4U/7e7G/48/lNLTCtCQ5c0rxWRW4XRf944R03T9hqukkQWzyLAR9AqATHSdsADVJ3WI7UnWCtcGQaBP83qL55fUS8=
Received: from PH0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::14)
 by BL3PR10MB6090.namprd10.prod.outlook.com (2603:10b6:208:3b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 23:28:34 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::dc) by PH0P220CA0002.outlook.office365.com
 (2603:10b6:510:d3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 23:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:28:32 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:28:31 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:28:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 17:28:31 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616NSVEp1692567;
	Fri, 6 Feb 2026 17:28:31 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Feb 2026 17:28:31 -0600
Message-ID: <DG89OYYXE9HP.6VS6HH3DL4HE@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>,
	<afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 5/6] xuser-account: merge with
 xserver-nodm-init
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-6-rs@ti.com>
 <CAMKF1sqEMoKd2U7sDVQNyPZH9Xd=MKx62c=o-iussWnVDk+zUg@mail.gmail.com>
 <1891C0B4F3A2B8B7.419336@lists.openembedded.org>
In-Reply-To: <1891C0B4F3A2B8B7.419336@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|BL3PR10MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: dab1e14d-232d-4d94-9dc0-08de65d7710e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkZyMi9ZY1VmeFhFMncxSklQdUZrY3RxSVRMYUZIWHViSlZ6SzNNMXRyMXh5?=
 =?utf-8?B?U1J3aWZ4RDBSNWp0VmpvazJsTXFWZFIvbS9iQ3dPdENWbzZkRjl2MlRJRHJL?=
 =?utf-8?B?WlFDeDRhdVMwYTNuNE1JcFhCcmpWSHJkVVpZTjlxZFgvZ002b3RZenZvVmxM?=
 =?utf-8?B?RFl6WFBjK2xUSDlnQlJsKzVjNXNnK2orZzQ3M0d3Mmc2dFkzYkx0QllLRkFa?=
 =?utf-8?B?ZE1STVlOK3BHNWpHZjNmenlleWNoLzV2bEZPazFhZEVMNEJoNGdmYkNDaG10?=
 =?utf-8?B?eDEyeHFsdGo5V3VCYzRnMVI2dksyRmQ2T1Uwb0dVNnE3cVVhdWpxRklaZStn?=
 =?utf-8?B?bUtncVBUVXdkdmdOOC82TnJqblpyV2dEMUdqYmtzUUdTWEJLRzcrdUx6dC8v?=
 =?utf-8?B?R2VDRzZ1UUYzQzNZQ245TTNXZmp4d25CbTZFNlR3SEZPYjRCTFhlOUNHVGVW?=
 =?utf-8?B?UUZZeWlNeXFreE9zenlrcnN4WHQyTSt6blhCRXJLMTVRQk5XQzdGV3g0dFMx?=
 =?utf-8?B?cmdySEErYS96TTRXQ2hPbkV6LzFMRlo2emwzdWhyQUxMQXZtZmhiMW5DWTZ2?=
 =?utf-8?B?dksvMWtSc0tGNk9rSENUTm43WTBXTHJ0V1pCYlpoc2ExVWtCWjlnL0Z3Vzg0?=
 =?utf-8?B?UzMxbVEyYjFIZ3RXdW9YeXoxa3dmd2tFeUt3M1JBZFowT3cxb1U2MjRnanVV?=
 =?utf-8?B?RUVXbzNKbHdnSEV2UXFnUzVXTG9qejZKcy9zNHRqaU5yZm1LU25SUmFmREpR?=
 =?utf-8?B?YWl4NU5KaGxBSmxqQUdyNWRnK3FJODJvWFFUc3NXdTNvZUNLdFdYL0JaVjNi?=
 =?utf-8?B?QmZnMzkxRnNWTEJIVVVPVnN6YUNJUVc0VUpDU1ZsVWZMNVNuWGV3eXRQc0Nm?=
 =?utf-8?B?UUY3U2NyWGoyQmFHS3JsVkd1bXFKZFZDOVRraGpXVzJ6bHR6NlRhR0lkWE1v?=
 =?utf-8?B?YUlSSXh2K05mbC9NckJZcUkvSjk2cFBZMUxMcVhWNXpPaCtVT3U4U0pPdjVh?=
 =?utf-8?B?U0UvclpWZCtyZWVkTnZlRG5FY3Q5UW1KNmx0WC94KzJka2dOc29wRGJuOWwv?=
 =?utf-8?B?ckJiZnppN0I2bXVNWjVNa2U5V2pRZjJFMTB4S2NuTzhRc1lhcE1lekFFTDlE?=
 =?utf-8?B?VHB0NSs0RktIUC9XNWdqZ2dpcjY2SGJTOWZDaDhpZDFnZlFDMTFKb2kvak5K?=
 =?utf-8?B?Tnd2T0xMN3VIVkdnSlNKNVhYYVJUN0hINUEyM3YxKzZ6R2M1bHpGYzdiMWYr?=
 =?utf-8?B?NmZncjRYRkpRUFloVU9TbnBHc1JRNFhNcXU5QWtpU0NGQVQ4YVhhVU4vRlBP?=
 =?utf-8?B?K0RTbDU1VFFBdmlCVFpUNWpkQTk5Zy9uREw2QlVRQjJmbmVHd296UWlGUjZ1?=
 =?utf-8?B?T1V2cVRaZmhlNVgxdkhkTGFFRzNLZlhnYjJkUVFzRTd4WVpPOHlzd096eHpD?=
 =?utf-8?B?cDk1OGJLSFlYN3dtZ1JQUVdoTm1rajNNajFtUUNlS2F5dXdIZkkyczRXR01j?=
 =?utf-8?B?a3FicGdmSGY4VHE0Q2NYMDRnU2xNdCtIcFR6TjN3YzR2WWlKWEJYK0IvRi9n?=
 =?utf-8?B?RFBySGZ5eU9DcFU5dDFmWG1nSXQ1V2s3eFkwUTdwV3pYeEFWd2g4N05WWGZa?=
 =?utf-8?B?cXpyMFRNbXh0aWVxQnlMNTB6ZGRiejV0QzF4eE5jV0ttZnVZMGFRWG1WS3A2?=
 =?utf-8?B?MDcxcUJUMWdCN3FWdG42ZVJNNWN4YjZHbjdzbjFmaDJ5U1F2TXpPdW9oMFpP?=
 =?utf-8?B?L3BUaEpHaXpjbGhaalpaWFozMGM2SlAzbEJ2R3NNL2RUQ2Ywbk0wMU1VaUFt?=
 =?utf-8?B?T2ZaN3o3UERMZkJuZ1NQVm9mTEZkT0Y1QzRaaE8xYTJOd0FQZHpnczkycGFK?=
 =?utf-8?B?V2o5WEtKQ3lwSUpQSFNlZUtTOWtINk81Z1VSYW95YmQvbVJsL1BFVktuMmZG?=
 =?utf-8?B?U2liaExYQ21iTHFPL0h5VVFWcjBSZXplMERBdTdleUJxUEtRenZtQ2E2S2Q4?=
 =?utf-8?B?ODdJNEZZS2ZVQmo0OFFlNVNvQm1HZFlOa0tmcHc1SWF4cEZsa1ppeHd2WnhR?=
 =?utf-8?B?TVg0M2dNMis3b1MvWGZNNWxoSUVxWXNCdllXeWhHYlVCanhENlJOUUxVYWIv?=
 =?utf-8?B?eW5jQ1MwVHI0Q1hLcC9xWFVxZkdMNE9PcC84WnpZOFVXQ3RLSkJRR24zdGpu?=
 =?utf-8?B?Q2ZzdzBucWxtM3VFeXNQRlVyOWlpZWpQSkFJcitQZXBhbXVKS0FCTzB2b2xI?=
 =?utf-8?B?MHRGUnpaZVdjVWxHbzIzVHloK0dBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VO0+PWnYxGJMtdKNYQQNr9zPNVck21RmNXndH2Aw+GTEQyR9NzLMD67lxFZZkEebvKoEUFXE8rKf9s7qWP5xdKG9KzT80I0A1LBIedAMx5GGAFnudbrxHifve8ditNxbo6dkXBKh1IzClpuzFzU6t9dfMYkvN83EN1cYRZc4N1WucYeiF95WxRzvnJiw9My0XDufwvwfsxfZNIwTGNTNccAKsQD8foqpEtSi0fIAtjxj61CtXjtS3dANTOUHR1oGXIy1qhi/+5MofOvRneqOKuNOKSizRmb9iiQ2i9gA79ruudQPfoNJRfjW9QAnB7MHZ/3PMZqFpm9ESdxjssfQnMr2ZYPUpPlwkb+xc/wir5lwvP0tpoxYxOwVPzPbg0TKYzZXMHFH3mDRkogT9GialhoQi2UxHs/pkgson4Q4JTyekMDyln/0Ey53OxOaXZ2/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:28:32.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab1e14d-232d-4d94-9dc0-08de65d7710e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 23:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230664

On Fri Feb 6, 2026 at 2:00 PM CST, Randolph Sapp via lists.openembedded.org=
 wrote:
> On Fri Feb 6, 2026 at 12:15 PM CST, Khem Raj via lists.openembedded.org w=
rote:
>> this also needs adjustments for fvwm and xscreensaver recipes in meta-oe
>>
>> On Mon, Feb 2, 2026 at 5:20=E2=80=AFPM Randolph Sapp via lists.openembed=
ded.org <rs=3D
>> ti.com@lists.openembedded.org> wrote:
>
> If everyone's alright with this version of the series I'd be more than ha=
ppy to
> submit the necessary patches.
>
> - Randolph

Actually, this brings up a good point. The other window managers shipped in
meta-oe were expecting xserver-nodm-init to be present, but weren't calling=
 it
out explicitly as a runtime dependency.

They were also implicitly expecting the user account to be xuser, despite
nothing stopping any layers from changing that username. Previous emails
actually highlighted this as a reason for making a separate package, despit=
e
nothing being equipped to handle such a change.

Should we define some global distro variable to manage the default
GUI/underprivileged user? That would unify all Xorg and Wayland default pac=
kage
configurations and allow for seamless arbitrary user names. Maybe something=
 like
"STANDARD_USER", which defaults to the value of "DISTRO"?

Take xscreensaver for example. The systemd service hardcodes xuser. Practic=
ally,
this would be better suited as a service template with a default instance
enabled for "$STANDARD_USER".

I don't know if this should be part of this series or if it would be better
suited as a follow-up.

- Randolph

>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Merge the xuser-account recipe with xserver-nodm-init, since:
>>>
>>>  - This is the only recipe dependent on it
>>>  - This matches the current behavior in weston-init
>>>  - Running x11 as root is no longer a supported path in
>>>    xserver-nodm-init
>>>  - The display manager configuration and user account name are heavily
>>>    connected
>>>  - The existing method of integration ignored this connection
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>  meta/conf/distro/include/maintainers.inc      |  1 -
>>>  .../xserver-nodm-init}/system-xuser.conf      |  0
>>>  .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
>>>  .../user-creation/xuser-account_0.1.bb        | 31 -------------------
>>>  4 files changed, 15 insertions(+), 37 deletions(-)
>>>  rename meta/{recipes-support/user-creation/files =3D>
>>> recipes-graphics/x11-common/xserver-nodm-init}/system-xuser.conf (100%)
>>>  delete mode 100644 meta/recipes-support/user-creation/
>>> xuser-account_0.1.bb
>>>
>>> diff --git a/meta/conf/distro/include/maintainers.inc
>>> b/meta/conf/distro/include/maintainers.inc
>>> index a7425f7020..ec0a128901 100644
>>> --- a/meta/conf/distro/include/maintainers.inc
>>> +++ b/meta/conf/distro/include/maintainers.inc
>>> @@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unass=
igned
>>> <unassigned@yoctoproject.
>>>  RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <
>>> unassigned@yoctoproject.org>"
>>>  RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org=
>"
>>>  RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>>> -RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
>>>  RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>>>  RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject=
.org
>>> >"
>>>  RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject=
.org
>>> >"
>>> diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf
>>> b/meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>>> similarity index 100%
>>> rename from meta/recipes-support/user-creation/files/system-xuser.conf
>>> rename to
>>> meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>> b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>> index ed056df72f..0e9fe1e65a 100644
>>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>> @@ -1,14 +1,15 @@
>>> -SUMMARY =3D "Simple Xserver Init Script (no dm)"
>>> +SUMMARY =3D "Simple Xserver Init Script and user account"
>>>  LICENSE =3D "MIT"
>>>  LIC_FILES_CHKSUM =3D
>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2=
0420"
>>>  SECTION =3D "x11"
>>>
>>>  SRC_URI =3D "file://emptty.conf.in \
>>> -           file://default.desktop"
>>> +           file://default.desktop \
>>> +           file://system-xuser.conf"
>>>
>>>  S =3D "${UNPACKDIR}"
>>>
>>> -inherit features_check
>>> +inherit features_check useradd
>>>
>>>  REQUIRED_DISTRO_FEATURES =3D "x11"
>>>
>>> @@ -26,10 +27,19 @@ do_install() {
>>>
>>>      sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:"
>>> ${D}${sysconfdir}/emptty/conf
>>>      sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/co=
nf
>>> +
>>> +    install -D -m 0644 ${S}/system-xuser.conf
>>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>>>  }
>>>
>>>  FILES:${PN} =3D "${sysconfdir}/emptty/conf \
>>> -               ${datadir}/xsessions/default.desktop"
>>> +               ${datadir}/xsessions/default.desktop \
>>> +               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>>> +
>>> +USERADD_PACKAGES =3D "${PN}"
>>> +USERADD_PARAM:${PN} =3D "--create-home \
>>> +                       --groups
>>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>>> +                       --user-group xuser"
>>> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>>>
>>> -RDEPENDS:${PN} =3D "emptty xuser-account"
>>> +RDEPENDS:${PN} =3D "emptty"
>>>  RPROVIDES:${PN} +=3D "virtual-emptty-conf"
>>> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>> b/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>> deleted file mode 100644
>>> index f1e4cb674f..0000000000
>>> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -SUMMARY =3D "Creates an 'xuser' account used for running X11"
>>> -LICENSE =3D "MIT"
>>> -LIC_FILES_CHKSUM =3D
>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2=
0420"
>>> -
>>> -SRC_URI =3D "file://system-xuser.conf"
>>> -
>>> -inherit allarch useradd
>>> -
>>> -S =3D "${UNPACKDIR}"
>>> -
>>> -do_configure() {
>>> -    :
>>> -}
>>> -
>>> -do_compile() {
>>> -    :
>>> -}
>>> -
>>> -do_install() {
>>> -    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf
>>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>>> -}
>>> -
>>> -FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>>> -
>>> -USERADD_PACKAGES =3D "${PN}"
>>> -USERADD_PARAM:${PN} =3D "--create-home \
>>> -                       --groups
>>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>>> -                       --user-group xuser"
>>> -GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>>> -
>>> -ALLOW_EMPTY:${PN} =3D "1"
>>> --
>>> 2.52.0
>>>
>>>
>>>=20
>>>
>>>


