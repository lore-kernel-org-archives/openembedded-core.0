Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2CD106FD87
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:41:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10128.1773384058852185130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753254187b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5RFja2281535
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:40:57 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqs8du-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:40:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciRxBMwhU6G4ZTKZJ5GbijEcRLeWomGyOTaoQpx3nCrF8ZzVFti9fYqGXiV5aCczFhtVFd3HcY0MpqWyLoTAckaIRKoAICdI3HbtmAhMM0ClQYWNhrHXwFPFvavzSbaTQ98Y3MB+0kigj5BD5FxbdHuxI2J5DyClfSPe9g9/20oUXGkNjtsD3Q59IWgVqUNmervpe98fi1v0OGLmxq9lpIzGoafU7b7wKjwUNXaRtqgnZ8CtVRkWCS4YHIGMo+DTh9jiosq7s6QwPHW7cqZ8hyZlkknbo7cseZC9WQUlDyjrXamP5NufeCM0SipaBOxuP9DXUGxuX5T+tzy2OPuKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkS8KOKze38vi0DN7G3pORqNiiGKWQbOxeKCnIP9bIc=;
 b=PHh6OM62H8E3BjIpOpBkESNBW/rQeUIisXEG7mWjcBMzEOZhSt3QiipEBpKR2yKBCiRxaR/FyBeCZ3amXnliTFvdHPr5rbLGE9xfIWTwGhwmGqyIC4AmOuAqFQ8AlfPQqosLvH407ufwXu7XVgtD48rv0XWn7rTCxgnW2WSnTBXwb+F7tvzz4oVfQNmxx98nUNfVawIIb+jV5QnyRl8VWmFrV4J7OjV4eWlGm3uMlTEY+JJT2X1hBd1227jUliUNizTRXRv1HSmuIBDk7C+Sh1gJ3LCjq7kE5W/6PFRw7lSuyDOXC0a4bksLq/mZLd+JIB3Z4YFVUX4vY8n+oby+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by PH7PR11MB5767.namprd11.prod.outlook.com
 (2603:10b6:510:13a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 06:40:54 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::4fd7:cce3:ed40:ad73]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::4fd7:cce3:ed40:ad73%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 06:40:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-modules: Upgrade 2.14.3 -> 2.14.4 to fix build issue on kernel 6.18
Date: Fri, 13 Mar 2026 14:40:43 +0800
Message-Id: <20260313064043.2113572-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::11) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|PH7PR11MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 05079560-8a69-45a3-e3f0-08de80cb798e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8WxB8UrMvymaDkzrd1DrngUfJx5VQ0z3U0EtFyOs8iMUpd2xekrJOp5T1Xv0BTdx6RIamG/IpzUm+vn4RNzPlIuvFk1xI07WZzLC6AqH5HmPZhKLrmtgF2DWK+NGFKnBaypPP+4bZR8aAuYBxJGjBbaUtFPKaJnLDLImQ8NhUSgiAh3JQmX0YY7MtVIu/h79YXGc3fQgK/NrPEgTDsMd5eoHLH3176BAqZbVBNijy2mS2AvVGvn7ICKTe5nFz6T+hGy1UnCpZVHq2xdBaAMK6uKodqFNlY2BHG6h42b+WJRHidYt/6Pa1jYtDYvZLil9WDJh4vXo5/kLc7yrTKIktgVKMOAO+oStjKfJYKSWtSg27MNh4UMECKmUGc3U+ZmZnSfRLZ1lYN6vww39p4ItNW07hFlZxKnaMhWZqkMhsRiauGFdvwPjtwSx3ux2pJCSHV9I5ADZQ0jj7PChvP7CgxE1xVymxdcfIdHCgZ55tXTuntCkn7cSTq8kxjk/MNPaypsjw4RrjyA9yaw/ZujR8NozA9MyqnqbK49PM5Htx6Inz+KV2ePelcN1NfNyF4HlQjbaPjdGSfirZc78/JUe2q9OwTSfqu0D9POAh+93sPJgBk4ghi6B65lallIhWu5OfjT7u4D21q3Ucl6if6Fok0HSkR7nTttskk1UCq+RrmWdODEmjoK9eiqhAMS3W75WZr4MMLdcmWLoRrZCCrAln2OV2lLUt5f0fQh8uDxfMmM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ftHXJvz2DywvCchDoSWyBRz0PxtSJGBx2aLqp42Dn5SWkvml8iy2eXZDhev?=
 =?us-ascii?Q?/G+DJspRZlLseR1XlYl9XIsHLV3pQExYVkKcUOP0YiyFNHZblOEHD7Hyz9G2?=
 =?us-ascii?Q?Isv8F5Bthn3Pv7XJ66NyZIpnqaeV1n9lWLxzBOSSIICoKX2r9MFUjYAhnN+V?=
 =?us-ascii?Q?mPlAzxOoUqfRp6Haluh+o28mEyJMbB6vwuT5uR2/itEdimN2F7JSBzSecZQ/?=
 =?us-ascii?Q?4zMcGi2OmHrYGn0vYHKbJGaDRcAnaGQxQyo2/nvWjrg6DBNIyPS5G+s+9v1O?=
 =?us-ascii?Q?vNg4UkeblHWRvJUk8XPAVaSt03CzE3jm+ngm+AgSgVNpHSnEaDsdVDWDd4/r?=
 =?us-ascii?Q?ALLlZ8d9+pvA3F9md24aNozdSgLlthbxsE1lLCBPZRVzUfXCSiG1o5FyjmAJ?=
 =?us-ascii?Q?LaAjVYKss3JclPpDm9r8lPaB48BbfpgpxKN01H/YUKo6M5UPpKQYG8KV/oaJ?=
 =?us-ascii?Q?0dRQl4Ol0DFXdy5EmBcO+8sgX+4RcG96yQaYhp7n8yZyd/xGH26nMZkdy1XB?=
 =?us-ascii?Q?vuCPtOEUYOLTjCuW5O2crtBkQfqCa/uPwpmueM153h5Tff41HUKw5stdpDqN?=
 =?us-ascii?Q?y5uSZNHUUMuwLNBhRDSc0Alyezi5i1cG96y+QazBl5lAWS7dmJ7P9s7iGfpV?=
 =?us-ascii?Q?HkgsrmEUzuodaXTm+IrZLZWKFbolFsBcDLEDmQI8GERRj0ug5LF+2wlmuFuU?=
 =?us-ascii?Q?MobPAOk8IAg6aex1yId1E+f05w33iwXtwIp0rq/sBR1ESCXbvbGESq5/SBux?=
 =?us-ascii?Q?GhQxIiYZtv3SNun91V0O2Jg3jgXIzjLYAdgu+/52EdUpeHlC+rWTMhMfoKq1?=
 =?us-ascii?Q?nKuh3slxsE1pabkYn3dqcv9QxyYDY5LozvryuIjvc755h5BB9EK3D8pkt8dV?=
 =?us-ascii?Q?W9iSDYlxSjD/qNjk9oY0hN44tQg3ImBi0gPaVILKUYcGcbYUsHjL9H+RqbyZ?=
 =?us-ascii?Q?hsFsm6/g5uIOOSDIKW+/D+0Az6Ore8Kt4BTnAUqhavUnRYLSMqnkJJXMrPz5?=
 =?us-ascii?Q?o3HKBiUnuVEZkHYhx91sbiZjkwqzjKSae6Ej9JCnW1NrpXEXIK6SsgYKNvLt?=
 =?us-ascii?Q?bFRav/gdmjvQFIaXPVAA/cwGZfue6HoBsEG1tmioevd8jC9dS/NRggtcuEtK?=
 =?us-ascii?Q?PnFUsMafLYRNOP9ziTjIPqN5QD0G79CHVm7zeIBrEBbjLhJGjTBIBLgNavwX?=
 =?us-ascii?Q?Pft74HoIwkREthbsv2wVGpRugiFdCFB8DMA9l9UaM0FonNeLV5XjLIIrkWl0?=
 =?us-ascii?Q?f2FB5mmvJKBQz+bRrjfcVch7nfKDGj8XQdcJgXcMEZZ/0qKAqu/zvA3iS6E1?=
 =?us-ascii?Q?S8fzjW2+JVV+j5Uv3y7Sl1HhVK/yjxw6imuAt3DNNXTSxzHss6UNEUGsc+FE?=
 =?us-ascii?Q?mj8be/EvB6GV7B8sipDh9HteUNv4XHE3GRcdHjgmS2bf0nEmaZPmectYrLIM?=
 =?us-ascii?Q?Owwoq8hDJnj7PW0mLAMiX0WacC1ByxwV7ktR5R+y0s83BWDo1MyTwDd4+tRR?=
 =?us-ascii?Q?X8gfr5Fi8QN2rUNeCD8g8l+hxuuPLJMPg0rSAsihOfqJDCLt9U/46IYpF1Qz?=
 =?us-ascii?Q?INoO4MGE/DqQb7LRlXKFha2KGB+dG0s8XVYyQZfLacbcsX+GQyYYoQo3fIBG?=
 =?us-ascii?Q?6Xt2Rp3UAODVFZBCr51jGil5Zlk4i38qW/dpdSd6CMjbkz+BX6scDlvFoS0W?=
 =?us-ascii?Q?QRSjYfRwGELhSO3ba+kQmnWGwl/OSAclndGUZFGPPwpn0CHt4TEmADkBPNUl?=
 =?us-ascii?Q?/vzFtvyzOfoqQn77J6JGTsCvfA7p1nI=3D?=
X-Exchange-RoutingPolicyChecked: 
	eDHAfq1jxJgZBRJig9cMEdi5QB+cKMOm51nXmOTHdKSSlGIjAhFBLfax+RsZ+SpFQn0DpqDnmiZfgTylk0tBtZySHAkeEHDkjWnicur9kZb2t74dcQSnZOKm8GfZfN2foXc1LWBBk5dF2jXjz2FWhM107F2v5Yf+n2Iki66ALsJGoQzknskIBpLSvLX6UpgiFevbNaS0Ogeo/9jCPz0TmtIs+9xRGZ3sJxKvUIK6S3D8ddEPNIrweF0M7Q403MjfPcxX7hbhcX20Uiou74bNt/bfOxkDEYZOYs58ZdcWh6Zlw/nxNgtjpi9kyxHqLRoPsTRg4bocbYUTcOldUn8iHA==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05079560-8a69-45a3-e3f0-08de80cb798e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:40:54.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlJDcgwEc071IkCb0TlYsVccUIGbg3IEAlJxnl1BgEDG7XjvxaemQyZwt4D2MKLVdvTbetOzCFN7tXK5b/FgIZrUZovnzpcgkHx5JWIzUrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5767
X-Proofpoint-ORIG-GUID: GNXhV44O90cjfCpHRdTQrJno6tnO4B1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MSBTYWx0ZWRfX8WaRJnxIAdgL
 GuFtgsQYZyAZgkpX2IzRM9kkjtRRoln9l3hBiljOCHVTS0jZzDSMd4vauGj/uG5NrSVq92xMidt
 b2VE834xdLDf13x83iQMeJ1X2E6bSb6vbC+3goePieIQ3bI75Bg+mdCxels4k8ci1lyYP22ykIv
 RRPdbk3M+YrJEU3O0D16acLHbJElM82ljfQqLUONmg/Lij65fjoHvxHDIBMgMRaXVKp4I/NO/YZ
 CbIYv8YSC6exIGgDx2BgG4VuyQ3yR3aaJB6FuYg3xlgNenAwI7Eb8mbrzWqwSoms93leXov+3ki
 UuwzQGM0VflM1BU5rmkZfzTLr+3InO2Dsa7k/I2xv6Hd9sYNdqMdXPLHDhBosL2Y5IrMsVyDRQk
 zNEwnon7MirQSRh4Lcek7ik/PdL6GgFeRM14dFG+RVEfTAkoWcIRlUj5sBYMTaZdu61peO4ppP2
 W8eYyWeB+W9iFya9nGg==
X-Proofpoint-GUID: GNXhV44O90cjfCpHRdTQrJno6tnO4B1V
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3b179 cx=c_pps
 a=lexSm1xfraBw67q2grWtcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=a5LkSv8FAAAA:8
 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=1iWrAX3iE9CZFub1qHwA:9
 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233029

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Add 0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch to
adjust Brtfs probe header for 6.18[1]

Change Log:
2026-02-09 LTTng modules 2.14.4
* fix: Manual conversion to use ->i_state accessors (v6.19)
* fix: btrfs: headers cleanup to remove unnecessary local includes (v6.19)
* Fix: Initialize syscall tables sorted entries
* Cleanup lttng-syscalls.h: Remove extern on function prototypes
* Make init_event_desc_enum_desc_sorted_entries public
* Update .gitreview for stable-2.14

Ref:
[1] https://git.lttng.org/?p=lttng-modules.git;a=commit;h=ca93dc3b05fcb22db5b653858a1b08002496d783

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...st-range-in-btrfs-probe-for-v6.18.14.patch | 36 +++++++++++++++++++
 ...ules_2.14.3.bb => lttng-modules_2.14.4.bb} |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.3.bb => lttng-modules_2.14.4.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
new file mode 100644
index 0000000000..662a803680
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch
@@ -0,0 +1,36 @@
+From de7ca66c797ba0b3273a217a47c8fb791d896f7c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Fri, 27 Feb 2026 17:54:39 -0500
+Subject: [PATCH] fix: adjust range in btrfs probe for v6.18.14
+
+Upstream commit c5667f9c8eb9 ("btrfs: headers cleanup to remove
+unnecessary local includes") was backported in v6.18.14, adjust the
+range accordingly in the btrfs probe.
+
+Upstream-Status: Backport from commit ca93dc3b05fcb
+
+Change-Id: I51c5cb6345c6a1e1aa4e5e3cb9a4af2ec962ecb2
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ include/instrumentation/events/btrfs.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index feb4f40b..e87f0085 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -12,7 +12,8 @@
+ #include <linux/writeback.h>
+ #include <lttng/kernel-version.h>
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0) || \
++	LTTNG_KERNEL_RANGE(6,18,14, 6,19,0))
+ #include <../fs/btrfs/ordered-data.h>
+ #endif
+ 
+-- 
+2.47.3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
index 6a1bd6a27d..722b1ac5dd 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
@@ -14,8 +14,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
+                   file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
                 "
-SRC_URI[sha256sum] = "35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2"
+SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.34.1


