Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF1FC982E9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:07:56 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3699.1768586873845006648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 10:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QHUXKotB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.31, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taxzOFsH/0JjpMhXgzRn07FGQ5zKTC4cuMAppQ0igksjKd+t3MqnU+yVTW7ibBOR/kmqxRz3KsOjZKPBTKsWPqlfuxwDM+f6A6FEpLbDla4S3BV8oKkx0GLBHwsuAC9OTCvsyP9guH2GmCsBClhNVmUUT7+Du6ueH4hM4mqzyqx1tLJcaZGRD9oWoyEbTj3nvNMKaSWLETfHg9XJTQJHJx3A0nVjdvIli8AgK07UZS2qvAabD+xwnNMgfzs5zbtic3wuM555E6JF4gGX2VIJROF1kESH3MpYkjZZJOuBkkqRB8ssw8NRTADF92F9Pk8FxjpyUPhOgOQznqh+uE4Xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fllbp75p9Zmsb0o4KxKv77r+KUv6m8CsPNZEsBRvYjU=;
 b=YCn82+4dFqoDktKrRmmgluKWW80qTLMZVSBTJO4M1bz2je/ukb83+/JDxP0xheElRPxjR0EXh0ac9rfQYASQ4hv4hOVjufsiNDiWeT0/2cQ0baL5udZ+1uis/40Z5JcjeuzfKEWEpKMJNcH2NhUQ/NAkYd6ERF/ZajMmCSLlB1ZXyIDPCD6KtseU4OoXeLz2/OplCG/mjWibzQttCBENZkBPCSNu4n7ZjznGNbsgse8rzYCo8hq3oU+SzJvrBzhKnPtdli0H0RUmX17GZMvego/b2bHMAj6Ots3Q08iTo8G31fVDSnEKYNoNpjJmMQt/i48o6oAARz2pqwhJ50eaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fllbp75p9Zmsb0o4KxKv77r+KUv6m8CsPNZEsBRvYjU=;
 b=QHUXKotB+FOCOWNMTZ5yTzSkI39XwrMTi4zKp0tDIvKBScu9TvDC7ZjoHpULQyZ6TGweTTP/nk/BfnUK+TxB67tZeb80lBrZ+ErFJgy/D+7yQ7jx7IlbU5AZ4ltotVH8OAEOTzb9pxN5qQekityg6VNh/F7YdVec80QmnEmfSVw=
Received: from PH8PR20CA0008.namprd20.prod.outlook.com (2603:10b6:510:23c::18)
 by IA1PR10MB7515.namprd10.prod.outlook.com (2603:10b6:208:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:07:50 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::f5) by PH8PR20CA0008.outlook.office365.com
 (2603:10b6:510:23c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 18:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:07:50 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:07:46 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:07:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:07:45 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GI7jbD3543963;
	Fri, 16 Jan 2026 12:07:45 -0600
Message-ID: <fbfc6e16-0fe6-45bd-ba2a-068d73f103bc@ti.com>
Date: Fri, 16 Jan 2026 12:07:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] alsa-utils: fix packaging
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
References: <20260116174128.1478960-1-ross.burton@arm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260116174128.1478960-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|IA1PR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 63834fff-2734-491a-0503-08de552a2958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NjRYc3N5aXBRekxkelZ3S1lqeWFJQ3pqSUpVYlpCMTVvSW85VEc3UlBTai9H?=
 =?utf-8?B?bXE1NmYzZzY0RnFIWlhkRTM4R1E0akpmbHk1ZmhVNDg2MEhHNWhpdUhDeW1i?=
 =?utf-8?B?MCtjTC9aTWRCMERCKzQ0OGMzdTNWNDJMUTk5OG5Ob094RUEvOEFiKzNJY2du?=
 =?utf-8?B?Q2Y5eVl1Y0t6SmUzWHQ0dlRFcGdsUWJQYlJIL21TdEcxeCs4OEF0TzNvMHcy?=
 =?utf-8?B?dGhWTjhYRFlmNzVaeWtzRDQvK0E1SjZKMzhmVWdiVktJQndyd09yeGxBZGJt?=
 =?utf-8?B?dDUyRmd1eDlXN1FpMkJuOVVPeW1hejdtekt6Z0hoLzFzQ1QwellFQkpjdXZi?=
 =?utf-8?B?NWxMd0JVY1ZQMGRrRE14eEVxSk84SHRqRUZCdll1WXQwNzFoVktDeDRuT0FD?=
 =?utf-8?B?MGxzc0ZvYllRVGFIYVpZT21TejZ0T25OOFE0QWVlNTBXTzFtbTJ2RHgwTlpq?=
 =?utf-8?B?ZzZyR1NBR2xyNC9ScXhKUG5BSkc0eThoUldyaWMyNlVCWlNuQzFyQk1RaWxW?=
 =?utf-8?B?dVVlbTdtbFppRUJpamwwMFdaK2d3T1d3RTh0K3o3dW91a2NxaXVOdGhickYv?=
 =?utf-8?B?MjlPY29jVHFNZ1FBek9rcHpKUTVxMHJteFRwd1NaRU8rQXE0REROcFREa0RE?=
 =?utf-8?B?akVQNXRIT2Z3UEVxeTVrQ01qZWxOcUx6V3lzbXhCVjhWUC92MEMvNDVwUGVi?=
 =?utf-8?B?Z3VZUGpkVVd0QVNGN1l1czNBNDViVk5WVVNlZThoN0I5TTU3SzQ1VndNczV3?=
 =?utf-8?B?bm90bXdRRUxoVmh2dUFsQ0xUMTVHbmhlNzFKVkVFM0xYWG9YeGNkNDBEM1dv?=
 =?utf-8?B?VW5IZ0dEeFQ3WU5Td0pRbnJwTXZjMkNxU25hSFhTUEFVOWpZOE95VmdEeU0z?=
 =?utf-8?B?QjlLZGJkb0FNcUFEWEFxUFVGM3NISnJBNG9PbExlL3lpL2hTN0N5Q0tWV3ht?=
 =?utf-8?B?RnE4Zmhqc3pmcURCMEZKZUpUWWIzNkhyU21CQUM2dFZBejFvS0hkQjVGeVhi?=
 =?utf-8?B?Zm5MN0pLZ0Y0T3NhSVVJYWNhclg3dU9wVFROTXJyL0RBMFZkWEhkSzdBeEpJ?=
 =?utf-8?B?dUkwK0VESWRqd3V6aXVaaFdyZUl5UytRblZ5ZEUxclFYNFhpcmt1ZG1CZ0xw?=
 =?utf-8?B?QzNZNDRUblY1UlRkblFpU2VhdnF5YUZLSGU5T1ZBY1d0aCtHcTJVKzE4aWw2?=
 =?utf-8?B?aXBTd0xvWlo2THpnZGdmMXhsVzhRKzkyZGZCMjBCdGhQd0RvR2tmbjNZTDBT?=
 =?utf-8?B?MHFKbUdoOE41R1gyNE1COEdVWlZUbWZyRlBScmpSUTc4YzY4eWE0QTY3b0Qr?=
 =?utf-8?B?aVJFKzBkSlo5RjZERjJiNTZ0K3R2RllrdnNKR2NKRW5FVVhFNGlvSHlKQ2J2?=
 =?utf-8?B?TnRsd2V1K3RlMGpZcDB2MEUydVA0SGt0b24xeWJHekRhQ0VPZ1lHdVpaTTZo?=
 =?utf-8?B?SDZSTHZXS05tKzBwZFVUdlFGYzN1Y3lEbnlNNXdBSTF3bk5hZ3NoeFBSNVZh?=
 =?utf-8?B?OWtPbXV1K3BUUVdTWjlaTmQrUUt3WEFIZFc2Rk1qOVBuVFhyM3JkYUhIemVU?=
 =?utf-8?B?eUlObW9qb0FvWms3TWZhUFEvQy91ZlVUcUdkT1VJNWkza1RFN2FhRVcyU0pU?=
 =?utf-8?B?Nk9XeGNYSE93UUlCaDF1VGFsM1FBcDRycVV2OUxTWkR5UVVEK0lpQ0tyS2l6?=
 =?utf-8?B?aTE5YW4wNDNweFN2cTd2eU1VN3RHak9vL0ZYRWZFMEdVV2o5cWp0WERsSitW?=
 =?utf-8?B?TDRwZXhEZnpWL3kvV0d3RGQvekptblBYenlrcEptMU95Mm9kS3VFS1hyV253?=
 =?utf-8?B?S0ZmV2N3ZklxMGdaYVNNQk14RDlPNHNYblBzSzZFK1dSZk9TaEd0anJWYVZE?=
 =?utf-8?B?NFpTeCtEcHFSSVJPZVJNMnJIc1pDVTN1TmlvRnBRZlRDYWhWckJ6R3pXR3pm?=
 =?utf-8?B?QVdudFJzVzVhNCtyY1NNclhyb3lTUnhpNE56N0MwUmdGdk9QWnNnRUh4T2ZF?=
 =?utf-8?B?emtVNXpLeWo4anZFb0FtMWhxTVpLck9laERiMml0SEZGMjcxcDUvcWR2Z003?=
 =?utf-8?B?NXhZdzFjYndTaDBRczBrZ2lrSmF3NG5ZZURTRVgyMVZ6T0k2bjNCYmZtYStK?=
 =?utf-8?B?UEdMZHRWTEdtb2VzelZZT1hxQTQ0amxmRkhJYmFEaWhWbmtrdG40azVmblhm?=
 =?utf-8?B?ZGhUOXJlSklxOUlvT3F1N2ticFNIVlRoTk9OMiszSHI5dC9ENkVkZ1ZoRGNK?=
 =?utf-8?B?YU1EVmcrUWlOTTkwNGhXaVlicWZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:07:50.3434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63834fff-2734-491a-0503-08de552a2958
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 18:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229556



On 1/16/2026 11:41 AM, Ross Burton via lists.openembedded.org wrote:
> In the previous refactoring of this package[1] I forgot to add provides
> when merging some packages, which meant that installation of alsa-utils
> wouldn't succeed:
> 
>    - nothing provides alsa-utils-aplaymidi needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-aplaymidi2 needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-arecordmidi needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-arecordmidi2 needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
>    - nothing provides alsa-utils-axfer needed by alsa-utils-1.2.15.1-r0.cortexa57 from oe-repo
> 
> This is because the auto-splitting generates a package for each of the
> binaries, but there are explicit FILES that take priority which result
> in the binaries being in another package.  However, the dependencies
> still exist. We could filter the package list after the split, but it is
> easier to add RPROVIDES for arecord and a*midi to the relevant packages,
> so that the dependencies are satisfied.
> 
> Also axfer is a separate tool, so put that in its own package instead of
> merging with aplay.
> 
> Finally, add a PR, as it appears that dynamically-generated packaging
> isn't enough to change the hash, and the wrong packages were being pulled
> from sstate.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Tested-by: Ryan Eatmon <reatmon@ti.com>

> ---
>   meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> index 927f94afb6..2e85f936fa 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> @@ -11,6 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                       file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
>   DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
>   
> +# Only needed as the dynamic packaging was altered, remove on upgrade
> +PR = "r1"
> +
>   # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
>   SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
>   SRC_URI[sha256sum] = "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327"
> @@ -35,7 +38,7 @@ FILES:${PN}-alsabat      = "${sbindir}/alsabat-test.sh"
>   FILES:${PN}-alsactl      = "*/udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
>   FILES:${PN}-alsatplg     = "${libdir}/alsa-topology"
>   FILES:${PN}-amidi        = "${bindir}/amidi ${bindir}/aplaymidi* ${bindir}/arecordmidi*"
> -FILES:${PN}-aplay        = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
> +FILES:${PN}-aplay        = "${bindir}/aplay ${bindir}/arecord"
>   FILES:${PN}-speaker-test = "${datadir}/sounds/alsa/"
>   
>   SUMMARY:${PN}-aconnect       = "ALSA sequencer connection manager"
> @@ -53,12 +56,16 @@ SUMMARY:${PN}-aplay          = "Play (and record) sound files using ALSA"
>   SUMMARY:${PN}-aseqdump       = "Shows the events received at an ALSA sequencer port"
>   SUMMARY:${PN}-aseqnet        = "Network client/server for ALSA sequencer"
>   SUMMARY:${PN}-aseqsend       = "Send arbitrary messages to ALSA seqencer port"
> +SUMMARY:${PN}-axfer          = "Transfer audio data frames"
>   SUMMARY:${PN}-iecset         = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
>   SUMMARY:${PN}-nhlt-dmic-info = "Dumps microphone array information from ACPI NHLT table"
>   SUMMARY:${PN}-speaker-test   = "ALSA surround speaker test utility"
>   
>   RRECOMMENDS:${PN}-alsactl = "alsa-states"
>   
> +RPROVIDES:${PN}-aplay += "${PN}-arecord"
> +RPROVIDES:${PN}-amidi += "${PN}-aplaymidi ${PN}-aplaymidi2 ${PN}-arecordmidi ${PN}-arecordmidi2"
> +
>   do_install:append() {
>   	# If udev is disabled, we told configure to install the rules
>   	# in /unwanted, so we can remove them now. If udev is enabled,

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

