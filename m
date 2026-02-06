Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA6BEE6B6C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 23:43:02 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4252.1770421373237385620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 15:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bwFVriGd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.59, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAlYdsDEnSLnE8AIZ/FkKlIA8nA8/dn5NAsTA6VEQ5YlimCdJT8ZUjRtWRGUF6DvWQxi3pK4YEaRszhM09bvngvhLMorjUKJcIpMDV/c4O6We+xwq+n8dpUfiH1BTOkmJxMUVweUcxBZQr7QVRDe854yV8a1GERlMCC5asOrxdstxH3I9cdGkykbCzb7sdHnOqBT6orU8/ZqhGSZZNrTrgK9PnCPa+LkWR8N7s8+xss+wIVphGMS7Wd/ux4NHAAozlRexQD6qN6HclsqsDSXz0HGQd+yet7TvzyGEFT+UuB6px2pU44vugNzl0ieKk324VYQ2ixregaJ80QvlSEmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgRb6rSWdbF+kCZ2wMlTDlkNrnONmR5K5mN3qOwgllg=;
 b=QsA8AkvaZuEZmAPaAkQnPCkqpgD5ghluUkJjM9ZLtUTsFTULWa8YCl7jWkXbPc9ZPYzRsCyTd4u/vFqH9vjqMo+W0Zkwi8pT+0YvCNmEqJR2wA0T5YYmElcQSF/pJtfpU5Zqu1AqvQD/Nh6kh14RxlmtDaO6wXIIVjqX36JmOCMXETup3JoPtF0+yI64C2u7/IX2SsGbWXtuIMka2Ote8l3yjzuqBLsQ2Y068+WOs7eX0YPXpju7fM73mrF3oO1RzdY6HgpIGWc+S91DKpQIJKzvZ9kQjSxtaodqjrPp/8D19a/+iaiag/3+QZNfcj3DuuJyr/o5FBT/J1rqGjIG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgRb6rSWdbF+kCZ2wMlTDlkNrnONmR5K5mN3qOwgllg=;
 b=bwFVriGdLgbaQgQx6TPWorzsdvvBsqGIWCoqWicNeWE8JGPrWz/jomGCFmIHMV0FDAB3KR5o/dZD1+Jm2mBnEeQCwSXH1boQN28fJ0HLAYC0AHH+PiM582/KFJ/eVCfSBMYNf9IyOnyQg+zWoeNES+FQdMAgKnicmjAy4biSQJU=
Received: from PH8P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::7)
 by IA1PR10MB6122.namprd10.prod.outlook.com (2603:10b6:208:3aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 23:42:50 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::82) by PH8P223CA0008.outlook.office365.com
 (2603:10b6:510:2db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 23:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:42:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:49 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 17:42:49 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616NgnqT1708070;
	Fri, 6 Feb 2026 17:42:49 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Feb 2026 17:42:49 -0600
Message-ID: <DG89ZX5618M2.2YDQWAWH0CRL2@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>,
	<afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv15 5/6] xuser-account: merge with
 xserver-nodm-init
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-6-rs@ti.com>
 <CAMKF1sqEMoKd2U7sDVQNyPZH9Xd=MKx62c=o-iussWnVDk+zUg@mail.gmail.com>
 <1891C0B4F3A2B8B7.419336@lists.openembedded.org>
 <1891CC14A53C0CE5.426509@lists.openembedded.org>
In-Reply-To: <1891CC14A53C0CE5.426509@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|IA1PR10MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: f9357e5a-1084-4da6-8bc6-08de65d9707f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2RaNjFLd3AyQmJaSEwxcmdaOUxPRGNkampGRlJVSmYxdk51Q0RxbkpCRFQ0?=
 =?utf-8?B?RDFhbGxvaGRldkpHeXZ0Mk1JejE4YXNlOER2aEQwZ2V0elFhKzZxSUoxMENS?=
 =?utf-8?B?eEF3TWRtMlNQak9NY00remFtVW1YcHZFZTlrRSsxVndpQTZtemNSY1JzNVRM?=
 =?utf-8?B?T1pNUWplclFBbFNIR2NoTldMM1FuMks3N2FZSjRRajQ2VkJic1dXdHY4SGdQ?=
 =?utf-8?B?MktWWTdjVTd5a2ZaMWZLM1l5bnBrTFBobTg0K1JTMWxOWEk2eHJsRjgxUndB?=
 =?utf-8?B?YUt1bXhFY0w4MFV1TmNUZ1FJYVJiVjQzUWpuODRTc3U5dWJpbUtyR0R1aWhR?=
 =?utf-8?B?V0dHNDAvaXVpTmxIWDZwVlNBNHVnTzllM09pMnVOZnhxbWFhSHlNME9BZUdE?=
 =?utf-8?B?dkZQSVV3SkM0aDFWdnVBWDFHbE9YbnluRS9vTDhYNkV5RTc1MjhDcjJrZml2?=
 =?utf-8?B?YnNtU1RlWlRHSThOU2pGR1JNc0ZROE9ONEYvZmhzeW02TTZnU01XWitTZ3J1?=
 =?utf-8?B?dmdSSUIwcXcwdlQ0eHpEL1dlRkF0TUNOMkNBcmxKQTBVTUdQL1Nkb3ZHNmlm?=
 =?utf-8?B?bmh5YkZ0WEk3L2l0a3Y1UDNFbmJFalh3d09ZelFDSjRnMk14Y2hIMm1MUWg5?=
 =?utf-8?B?K09uSjYwWSsrY1lqNzZsc250V29xR2Q5dnBTd3lTc2htSmlseC8zTG1pakdE?=
 =?utf-8?B?WnJrbmYrSm01VWF3Ui84aFdJTnlXc0VoblZZTmFMRW1EcGtVcGp6SjU1Q1hE?=
 =?utf-8?B?Y2t5N09mZWZsOHFEZHloTmxXdUlXWDNVV2F5VklwTDhFbVJSbzF6Ti8rUnJk?=
 =?utf-8?B?K0NQYnBrNVNmTlFlbE5oWGNIeEh4blBZaHNqYWNTWXUvNjVTZ2hncmI1L29E?=
 =?utf-8?B?bDNNQkZCbGkxSlZEb1hLMHFvUGNKejBtRTVKVkRBbmdGUnBTeXF5aThZOFh1?=
 =?utf-8?B?Rm5FWmJieVNRUFNTeFBSV2ZwY1E4K0xkdkM1Z3hOd1QvdVE0MGsvUGFQWkh3?=
 =?utf-8?B?NHZsNWlYWGtQN1luUzhpMmxnL3dpY2YyWXpJTnZNNStVQUtVRUdpRnFuSFRh?=
 =?utf-8?B?Umc3WUU1K1IwRDNBRXNkSVVDbkNFRnVLZVpzbGtKWjdqWWZqL1g2Z3lLb0U0?=
 =?utf-8?B?bWxSeVJpc05tdlptUWdSNHVIazQvcUFHWG82S1BZZk16T3lnY2xYOHVJaGZP?=
 =?utf-8?B?dElaUmxBT2ZpdWY5dDJzSWltZjlZZmxYZ054Q3B4NXJCTG1obTRBRkVKWlMz?=
 =?utf-8?B?MVJPV3lwdGg5bVdXRVo3bkdXYW1VZi9ITTY0UzdIVlZTUlhCMG9PL3pkNXVa?=
 =?utf-8?B?YllzaFVyeVBrNTgvckZkVUNXZ2QzQTlrRDlqKzc1dVNnUXdjQmpVd1pWY3dn?=
 =?utf-8?B?YVZjRmxsdmpLb1RENU1KbzdmSktURURLQktRWi9jM0lEdXFqakdUN2c1OEhn?=
 =?utf-8?B?cTlXNThYY05ESmJsOVZ4TWFiQ3kwY1JjRU5XRGZBeHRBcGdIWTlUWUR0cnJ2?=
 =?utf-8?B?WDZIR0Y2K210ejllNXlzN050YnRsaEM2SGx1b3FRRXQ4ZnBxeTkvNW5sWFNw?=
 =?utf-8?B?bG9IT0lpelpEcmJnU2JoQTdzcnNudjlVT0dKcFc3SmJmdWR4aVhER1BxQVFJ?=
 =?utf-8?B?emw3WDlra2Rrc05HSnBkSForRlZsRkJ3SnlVcm05R0tWRHVDZkM1OVBXTUFP?=
 =?utf-8?B?REtVR1I4bzEzUnRUNzhJOTJZdkloVkp4NTQwL3ViWituckhaZG5hZVhNclBi?=
 =?utf-8?B?bjcvLzlrWWRuNmhqSjRlZ2cxblI2Q1lxRlRQZ3BLbnZMdEc2YUhIOHJzdkIx?=
 =?utf-8?B?SVhxdWRxTFNEbFdSTkV2dU5VN1hxMG9HSEhCa2hmUVhGTWRUb3ZrZ3pabHZL?=
 =?utf-8?B?UU1GUnRJVDRrQzYvTm10bHd4aHZBaDg4T2txdXVUQkFPNTdFdktBWnhsVm5y?=
 =?utf-8?B?TXcrRTJCellwNmhFUXJ2d3cyc2VFdjVlYnowOGNNVjRQUHQwbzRmcEo4TFRw?=
 =?utf-8?B?R3AxdUQrekpKZmJvUUtsY2QycnVjMm9nbVJCY2srZlRxUEk1Y1NWMms2WHV1?=
 =?utf-8?B?dVNNZEJrNCtSa1JpTlZNMEZ0RTRIc0tacXJvTzBhbmFBRXhhOGZ3a1l6ejVP?=
 =?utf-8?B?RkZ2MDdFenhFR3Evd2FSVVZqMVBWWjR6OUV6a2RHa3VLY0VNUE5rYTBCWXhI?=
 =?utf-8?B?dms3a2tGRVoraVorWDc2UjE2TVAzS05VL2FXZlI5VnpDVVlIRC9yOW45MnhQ?=
 =?utf-8?B?aDIzMnFWaXdtcThSQ0tFMnRSbUJRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qa+Vx2oWhXsacnI9Ye6/un9iEAvhM1u5Syjd1OT1mxtImQYQtUNHElaBwpRitqYYo4INYNtwzjO0HIU5mcGXpJDPoD7HnPDEqL8Tq4hoAX7SBMgNL5ojKuphsaAso0wxyVZ0OQ/Skw90gLaYIowAkYRQeI4C6zpJlH54FDetFc7fIIFBJUft3IYRJJqAwnl4uDecV+WMqFRjjJvJQvVAQKupinzEzEeU0s8qrHVgT7pFAuUXvSXLwrMG4VHviGEdmhZinzTBTaL6A1tn8BfS9QjM2gkOpaJxgtdETxhOHNbtTfXZVFz3fOTJ/nF0SQkNRSlO4A+yJiQFwdtGeYUCXrsZx5jIzyvl1QTfkXQk7yYBw+NEkA6/Zx6NQIUdfNBuvxecZKRN3fSbk0b+GxR9UZiSYl78W2api8VcXi4lNtqkn2S5+wZCz0h1nLocGJNt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:42:50.2000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9357e5a-1084-4da6-8bc6-08de65d9707f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 23:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230665

On Fri Feb 6, 2026 at 5:28 PM CST, Randolph Sapp via lists.openembedded.org=
 wrote:
> On Fri Feb 6, 2026 at 2:00 PM CST, Randolph Sapp via lists.openembedded.o=
rg wrote:
>> On Fri Feb 6, 2026 at 12:15 PM CST, Khem Raj via lists.openembedded.org =
wrote:
>>> this also needs adjustments for fvwm and xscreensaver recipes in meta-o=
e
>>>
>>> On Mon, Feb 2, 2026 at 5:20=E2=80=AFPM Randolph Sapp via lists.openembe=
dded.org <rs=3D
>>> ti.com@lists.openembedded.org> wrote:
>>
>> If everyone's alright with this version of the series I'd be more than h=
appy to
>> submit the necessary patches.
>>
>> - Randolph
>
> Actually, this brings up a good point. The other window managers shipped =
in
> meta-oe were expecting xserver-nodm-init to be present, but weren't calli=
ng it
> out explicitly as a runtime dependency.
>
> They were also implicitly expecting the user account to be xuser, despite
> nothing stopping any layers from changing that username. Previous emails
> actually highlighted this as a reason for making a separate package, desp=
ite
> nothing being equipped to handle such a change.
>
> Should we define some global distro variable to manage the default
> GUI/underprivileged user? That would unify all Xorg and Wayland default p=
ackage
> configurations and allow for seamless arbitrary user names. Maybe somethi=
ng like
> "STANDARD_USER", which defaults to the value of "DISTRO"?
>
> Take xscreensaver for example. The systemd service hardcodes xuser. Pract=
ically,
> this would be better suited as a service template with a default instance
> enabled for "$STANDARD_USER".
>
> I don't know if this should be part of this series or if it would be bett=
er
> suited as a follow-up.
>
> - Randolph

So far, I've been trying to preserve old behavior as best as I can, but I r=
eally
just want to sit down and break things up into their logical pieces so
components can be replaced piecemeal later if necessary.

Define a global standard user account. Define a display manager package tha=
t
ensures the global standard user is in the proper groups and sets up a skel=
eton
config. Then we can provide the separate config overrides to do this whole
out-of-box setup that the tests and end users are currently expecting.
Unfortunately, I don't think I can do that properly in a backwards compatib=
le
way.

If people think this is a good idea I can submit another version with all o=
f
this in place for oe-core and we can see what breaks, but otherwise this is=
 the
best I got.

- Randolph

>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Merge the xuser-account recipe with xserver-nodm-init, since:
>>>>
>>>>  - This is the only recipe dependent on it
>>>>  - This matches the current behavior in weston-init
>>>>  - Running x11 as root is no longer a supported path in
>>>>    xserver-nodm-init
>>>>  - The display manager configuration and user account name are heavily
>>>>    connected
>>>>  - The existing method of integration ignored this connection
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>  meta/conf/distro/include/maintainers.inc      |  1 -
>>>>  .../xserver-nodm-init}/system-xuser.conf      |  0
>>>>  .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
>>>>  .../user-creation/xuser-account_0.1.bb        | 31 ------------------=
-
>>>>  4 files changed, 15 insertions(+), 37 deletions(-)
>>>>  rename meta/{recipes-support/user-creation/files =3D>
>>>> recipes-graphics/x11-common/xserver-nodm-init}/system-xuser.conf (100%=
)
>>>>  delete mode 100644 meta/recipes-support/user-creation/
>>>> xuser-account_0.1.bb
>>>>
>>>> diff --git a/meta/conf/distro/include/maintainers.inc
>>>> b/meta/conf/distro/include/maintainers.inc
>>>> index a7425f7020..ec0a128901 100644
>>>> --- a/meta/conf/distro/include/maintainers.inc
>>>> +++ b/meta/conf/distro/include/maintainers.inc
>>>> @@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unas=
signed
>>>> <unassigned@yoctoproject.
>>>>  RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <
>>>> unassigned@yoctoproject.org>"
>>>>  RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>>>>  RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.=
org>"
>>>> -RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
>>>>  RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.=
org>"
>>>>  RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoprojec=
t.org
>>>> >"
>>>>  RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoprojec=
t.org
>>>> >"
>>>> diff --git a/meta/recipes-support/user-creation/files/system-xuser.con=
f
>>>> b/meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>>>> similarity index 100%
>>>> rename from meta/recipes-support/user-creation/files/system-xuser.conf
>>>> rename to
>>>> meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
>>>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>>> b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>>> index ed056df72f..0e9fe1e65a 100644
>>>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>>>> @@ -1,14 +1,15 @@
>>>> -SUMMARY =3D "Simple Xserver Init Script (no dm)"
>>>> +SUMMARY =3D "Simple Xserver Init Script and user account"
>>>>  LICENSE =3D "MIT"
>>>>  LIC_FILES_CHKSUM =3D
>>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de=
20420"
>>>>  SECTION =3D "x11"
>>>>
>>>>  SRC_URI =3D "file://emptty.conf.in \
>>>> -           file://default.desktop"
>>>> +           file://default.desktop \
>>>> +           file://system-xuser.conf"
>>>>
>>>>  S =3D "${UNPACKDIR}"
>>>>
>>>> -inherit features_check
>>>> +inherit features_check useradd
>>>>
>>>>  REQUIRED_DISTRO_FEATURES =3D "x11"
>>>>
>>>> @@ -26,10 +27,19 @@ do_install() {
>>>>
>>>>      sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:"
>>>> ${D}${sysconfdir}/emptty/conf
>>>>      sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/c=
onf
>>>> +
>>>> +    install -D -m 0644 ${S}/system-xuser.conf
>>>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>>>>  }
>>>>
>>>>  FILES:${PN} =3D "${sysconfdir}/emptty/conf \
>>>> -               ${datadir}/xsessions/default.desktop"
>>>> +               ${datadir}/xsessions/default.desktop \
>>>> +               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>>>> +
>>>> +USERADD_PACKAGES =3D "${PN}"
>>>> +USERADD_PARAM:${PN} =3D "--create-home \
>>>> +                       --groups
>>>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>>>> +                       --user-group xuser"
>>>> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>>>>
>>>> -RDEPENDS:${PN} =3D "emptty xuser-account"
>>>> +RDEPENDS:${PN} =3D "emptty"
>>>>  RPROVIDES:${PN} +=3D "virtual-emptty-conf"
>>>> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>>> b/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>>> deleted file mode 100644
>>>> index f1e4cb674f..0000000000
>>>> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>>>> +++ /dev/null
>>>> @@ -1,31 +0,0 @@
>>>> -SUMMARY =3D "Creates an 'xuser' account used for running X11"
>>>> -LICENSE =3D "MIT"
>>>> -LIC_FILES_CHKSUM =3D
>>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de=
20420"
>>>> -
>>>> -SRC_URI =3D "file://system-xuser.conf"
>>>> -
>>>> -inherit allarch useradd
>>>> -
>>>> -S =3D "${UNPACKDIR}"
>>>> -
>>>> -do_configure() {
>>>> -    :
>>>> -}
>>>> -
>>>> -do_compile() {
>>>> -    :
>>>> -}
>>>> -
>>>> -do_install() {
>>>> -    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf
>>>> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>>>> -}
>>>> -
>>>> -FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
>>>> -
>>>> -USERADD_PACKAGES =3D "${PN}"
>>>> -USERADD_PARAM:${PN} =3D "--create-home \
>>>> -                       --groups
>>>> video,tty,audio,input,shutdown,disk,nopasswdlogin \
>>>> -                       --user-group xuser"
>>>> -GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>>>> -
>>>> -ALLOW_EMPTY:${PN} =3D "1"
>>>> --
>>>> 2.52.0
>>>>
>>>>
>>>>=20
>>>>
>>>>


