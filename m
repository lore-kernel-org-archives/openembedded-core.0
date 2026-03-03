Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64528EB364F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 01:59:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9057.1772503146170455237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 17:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nnw5t7tV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7522756f9a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231iL1i3404835
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 01:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yroXf3F/DzEBA7GYGb1DNEMZ5wvvysFBP8/sFkn6RFg=; b=nnw5t7tVGLJH
	e7tZL1L2zuFa2dbBM1Jhx+hksvwp8cujB8g2KGgxGJ+UpzENXnzh2B+jrrd99771
	PdzApK2qDNRZMjPdlY+B8Uh3/Rc63aimcOnpdDoresdCYonCHayGXlfpPPQCkejG
	3LHjTiagdriWe2QUsELoacRGuHInf2JxK5olvdXW/Z9XHHD8T1FjyvbQrHb+CHDD
	jFKSPl+q62KwFpn+ScYCYWFVVpxkEW9hg2cQDhSRr3DLIKOyJyhnUOqRx5JX5Og8
	nS4eBELHjymQ0dG6ELlcMDStIvzLYT8dPSkpZOQ5qyGi8fbuXiiwHSKtJs28Ttqv
	SQaJzPa5nQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvk63m-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 01:59:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luDQd7OAE8t4KRF/DhVkAK0CpwqjiWhOglyX5GDjP1nuM9toOLDRWTnyOuKQZpavzmWDpDYsb4jQ5gnaN2/pZsgVhcHA9YxQ7Ybdn3nuOGTLtf8PefdgXd7c+/NfAr5KKIn9iZeA0Nev39HdrAms9P3J3zFrT4ooEgOy0Sab3pWGpdNH8s5PiXKKjZYFMqfbvB0p1rhwP3pgA+9ANFBE5fatPbqlbPhi17CnJIclCBNNdQedhxM4i8EthcyHSW94LW9wBAdECvmapJqYbaxxyG73BJ6/1vNZtOvKEiWNaojTtjeskBgBjfaR1Vh5z9fWP4rpdVmSEnS5iwQyxkI1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yroXf3F/DzEBA7GYGb1DNEMZ5wvvysFBP8/sFkn6RFg=;
 b=yZXIjGFDnQbt/FaHBhELB8T40lTF+j/HrawJj3KBvVLbXdJN52ZUvm6jNr/uftGY4x8b79TK5qNEe7Lw+3Y/ylyr/repHaGl93y4pY1YWRiqzevTek3hAqi0p60B7IyygzzeP00t6f7/yvanMC84jPQd03dUa14+K7P2gntSRpfBC0A60vUxJBfsB6LppAFt7XqnjNueSNN45lEvyf7R64h/fapsbBUbC/vKtf2ibz35aYj50q5Bpe8GP5hj0tjKqWDhUYee6iRG7lOTpeU6iM4Yb42qtgFwQfSHmVNHu0mP0s6v4+h3mByZtZKgqdLP9tPd5rEonInpyYW2hpaaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 01:59:02 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 01:59:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] grub: fix grub installation error on i386 target
Date: Tue,  3 Mar 2026 09:58:45 +0800
Message-Id: <20260303015845.2213124-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303015845.2213124-1-yi.zhao@windriver.com>
References: <20260303015845.2213124-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b57deb-591c-4945-07b0-08de78c87125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	qf935v3vQ/SphG4wsPqByiaHUbHPgdgMDZmDjX+QNVx78DFJCY24hgPr2OeYWti+sUHWOrIP/jG2KuZ6ihVo1Vc3AWs2ISf54UluyR8VZnvDpnJAejfj3Px7PG1OdX399dXm8dacqfv5xSD+iKVuNSsCRF5L3KoGWObCbtMtGHzWjr6K12wlBlylXdU3lYZZatSaE8AIJfv4woQOPJGsrgRylS59nJCkuZGEDHR39MB+w/vvyWxzM3A6Ab/JPevRo/yV4qWe68e2+sAZ8CTa2jTr05KevkZqYkjMX1kOHBWodLDi964O9Qezy37HSrczQ/u/Uf0VCndiL1MFwea1odkIibiWrI6BsuIUU1XeOPYmmOK2XSm7j0qCywJ8WC80yAqBYpwZMQayV+IOy6N0CqOGrg6PJHkX7Zfob5nG6ErnSsug9dgG4fETmCxebEcKMRUgMk+4fm0tBQ210pvNxZJ4hsfBchF/zQAWAG/M1nEPqJZ3Rb+90lc3saPc2sipieA3xE3NcT1/yqancnlpEBR3ebq37tS2jPjzhkVneuOOvWHlGcMy9I/qsbVowZP1jpqm3L9uQ5Fx12n+zOQLEKycRBn1xu0IJY2DH0uOmUNXgy43U+oLy7QGj36h7W1R/MZ7NNCAmThrVmJFrsaqd8+OkTL5GhEIaDJJhlmOzjX+N1FFnwVsicK0jpjJunVtaSaKZNu/nfks8WXP+JNOve4bIXlwKeHRYbyuhw7+alda4Sh2jnsqJIsvznfaXo0b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YlGk2irkweudiNpVPGoxgSkTDy1SNUr0N5sre/60DUNJGpYc2ppCSqzboXbL?=
 =?us-ascii?Q?ErHRNTzteIpmLx3o7AruTUjiFPwj4d1mOoLD5QIAT+1kHs5oYfHYfJRv0kLZ?=
 =?us-ascii?Q?+VhO1pGLcl6/cH6/EjrN9ANpx5tW0ZKvh4RzgLoOJV81qHwj47m6PK8Zx7bw?=
 =?us-ascii?Q?Teh4yo0nBICqui6LKqxzxENN0am3zn8D6FJqcRfk+GTlE9Llx5OWGMpp0kYb?=
 =?us-ascii?Q?URMXtaiRdYILMIzg6KxpeljiA2r8iwbxYzqLG8ZfoUfUHZvaDr0u8SfnsrPK?=
 =?us-ascii?Q?g1Xmgc+ybS351xseevIiIORjWMBwJ0qozW08QGxEBaeKmqYdbErXjDjoRbFS?=
 =?us-ascii?Q?P4wEXUpMEt6bQ7WXI6NeqW/H+Ylgz1NmwtCucn+qyUuwIoriRLhfUtrqxzA5?=
 =?us-ascii?Q?2DSOpraNEnF5sVXHhXiLUqs2lA7SEVEvvCcl16WUwyldWjAfj+y2UgGx8HsL?=
 =?us-ascii?Q?vUVdlwdOeJJmU/X8Rz8Tg9IqK29uXRhXYJAT++w6QpxsO4IunUU8+mwFuWJE?=
 =?us-ascii?Q?KHtZT0yPnLcV8u0PuXzVRpYpa59A9/LNKnV3tE7tz+AGtOD9ZtNebxZX0EnL?=
 =?us-ascii?Q?PpPAgCKBrdwxK0FzUbvriIOMGAmFhyJi8eEwRoxajaInulz7SyNo8HubLgFI?=
 =?us-ascii?Q?aE35/mVrhdU9TwqOEr9XYNJZugGCLr2V4qzLJ81bi84/rvXIzmmvU79R+LA4?=
 =?us-ascii?Q?whjS6zBtFw8Mb6o3GRrqDJ6oex4YkpaA/bk0TTjtM/dulciG2CY8W1CYibBG?=
 =?us-ascii?Q?yBSja3B8cLAucrtOzrUexZADgG5DblnKGbWu8bATb4eQOvB7Dm4ctF3xOlOb?=
 =?us-ascii?Q?E3wEzlBeYcf9is7KI0zGfHIy6pmzZ8t15iKy4wWhy3wPM2Fcx7Jc03/VETXI?=
 =?us-ascii?Q?TpXW+1m6aXXlYnA3GAiG0Pgvr0zXKP24d9AXcgX0HAyqexajYTPrudSHAHn5?=
 =?us-ascii?Q?jnLvYIUFwSTVInXfyT9PRmRvZzH5dg3n9yvQCtMQqDc74c3SlxZ6I6GjQzPR?=
 =?us-ascii?Q?nsPX2FmXbjrboIOOkzhiyH5VvAT50LFtyxwmPk3W9WIFdlKM3oNzFAm61GAv?=
 =?us-ascii?Q?CVgU/cIABn5CIGmr/ZG3w1X6D0Jo/XRXJSMMoGU5SlGh9j0pDfnfgzQog7Dk?=
 =?us-ascii?Q?uRgiG1Bm4gUxagA8sRrhhJeS0Pwk7U23ZUJjpdGX/V05nMLIJximOuQvHBiX?=
 =?us-ascii?Q?WbEqlN9nGuL0Zx/F8lAa8c9h6P29zo4Rfn5fyDR9rTfiIqC9QJaadjOXLhIj?=
 =?us-ascii?Q?9bGVCRWx9p+iP+Wj11fuzg9NTMud5iMOrCiuUZJvERLLR6wBXfj7PSAmgrX3?=
 =?us-ascii?Q?/7hgs4b0no7lEqjIPGl3sL3/i4cN9sZn5q6LuAkI9DANov0XaIU/nJ6kyr1T?=
 =?us-ascii?Q?kSwAYfts/PTkLNFM6l1rhqJteydIYRStQSIrCcNxwrLaT5Y7eamg/jMhs/hc?=
 =?us-ascii?Q?Trnuc6b0Sn8X4gDQtA4PxC3JQYHBZufLgXLi4a4dk2gfO8f3RosHU2fYcNgW?=
 =?us-ascii?Q?HbPuOmfKazGBF6IhjwhMHJVr+dQoqSpou2ji6GTra8JPaxS6DNolvbX1tsA2?=
 =?us-ascii?Q?dCvwe69eivbC0M8Y/FNSCHBop41Vjn8gedmBa4Gl729RN0fGy5iHJNkHCeTH?=
 =?us-ascii?Q?cC2/MuJAn2ZCiL2xE71i7S7jTVnveHpnihz7SUk4boy51e3rFjtOxTHzyz17?=
 =?us-ascii?Q?FDEDEu5eymTR+LpgoOuZ+DDlJCCm8BNBZdcMQNV6xYtBoKdvs+b/O8Ya85tW?=
 =?us-ascii?Q?5nTzBQ1xFw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b57deb-591c-4945-07b0-08de78c87125
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 01:59:02.1734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkqvEnxG3TuL9Ac+E0bseQmSZbT/77q/7gjGA5tWMjhHM/whjy50xjE31br/hpCS5AnNw72X4D+moXmMzPN6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
X-Proofpoint-GUID: SNv-RWtRKyzwJQjLAu6dkNYOt8lrbgAE
X-Proofpoint-ORIG-GUID: SNv-RWtRKyzwJQjLAu6dkNYOt8lrbgAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNiBTYWx0ZWRfXw2OBapBGEbZ0
 hlKctlWcxpxKPtcJvaYPepWIsBRQjdzQQ6YMrakuVlpj8ryHz9JuoV7qBZsa+cO9W8SxWl2LO04
 W9UvQ4LC71WamdcOdy/eaPZnNLRFfher7zeTPNx3xkyDaLUtx3YnhJwdT/Y72UyMUm3hHY0qUds
 TVCgDC5cOX1prfe9VlBeTnoXbdmtrXrOgsiz3SQ9vKt9U1jxSaRaj3p/eeAS0PYk8pOumKrJ9Pq
 YXq9VkaytWlec49jRnoTNzZCh5bmKhjxwW3hksEWE3SU6c4lXMeEs8IVnynGIzTHXDD27a5f6Xm
 vrDIyOo90Mv952JVWZBieGf4TGrSG1W/VxBwz4PPTZKS7TCIsaqJJHvLsGPMZQS3j2BcdqZzMCn
 m//0c9HUiXlu64ZIIfgc/Olrfhk6BPZ5zoVN4PbJaJ5gZMI3aLE4R9JsLFPeKwuHUdMUUvZWPPs
 pIMd0ANWEDoiWl2ROeQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a64068 cx=c_pps
 a=Q5I7zFPfgszDbE/a6V3qwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=7mOBRU54AAAA:8 a=SXzkmgPmAAAA:8 a=t7CeM3EgAAAA:8 a=6i6iqLYdLYafi78HaMcA:9
 a=wa9RWnbW_A1YIeRBVszw:22 a=EWLf6cg6Bh5aS0AxDgDu:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 01:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232233

Commit 1a5417f39[1] introduced a grub installation error on i386 target:

  grub-mkimage: error: `/usr/lib/grub/i386-pc/kernel.img' is
  miscompiled: its start address is 0x9074 instead of 0x9000: ld.gold
  bug?.

A series of patches are under review in grub mailing list[2]. Once these
patches are merged, we will backport them to the current version.

Currently, referring to Gentoo[3] and Libreboot[4], revert the following
commits as a workaround:
1a5417f39 configure: Check linker for --image-base support
ac042f3f5 configure: Print a more helpful error if autoconf-archive is
          not installed

[1] https://cgit.git.savannah.gnu.org/cgit/grub.git/commit/?id=1a5417f39a0ccefcdd5440f2a67f84d2d2e26960
[2] https://lists.gnu.org/archive/html/grub-devel/2026-02/msg00039.html
[3] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=f5a995ac689a7132651ef6b2b87295c392899427
[4] https://codeberg.org/libreboot/lbmk/src/branch/master/config/grub/nvme/patches/0010-Revert-configure-Check-linker-for-image-base-support.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Check-linker-for-image-base-support.patch | 73 +++++++++++++++++++
 ...-Print-a-more-helpful-error-if-autoc.patch | 34 +++++++++
 meta/recipes-bsp/grub/grub2.inc               |  4 +-
 3 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch b/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
new file mode 100644
index 0000000000..123909cdf8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
@@ -0,0 +1,73 @@
+From 3a9d2dd2f5fb07b75a74c307d61b9b9fc5d20a62 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 27 Feb 2026 11:46:54 +0800
+Subject: [PATCH] Revert "configure: Check linker for --image-base support"
+
+This reverts commit 1a5417f39a0ccefcdd5440f2a67f84d2d2e26960.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ acinclude.m4 |  5 -----
+ configure.ac | 14 ++------------
+ 2 files changed, 2 insertions(+), 17 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 70c1912f8..fa7840f09 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -79,11 +79,6 @@ AC_DEFUN([grub_PROG_OBJCOPY_ABSOLUTE],
+ [AC_MSG_CHECKING([whether ${TARGET_OBJCOPY} works for absolute addresses])
+ AC_CACHE_VAL(grub_cv_prog_objcopy_absolute,
+ [cat > conftest.c <<\EOF
+-asm (
+-    ".globl start, _start, __start\n"
+-    ".ifdef cmain; .set start = _start = __start = cmain\n.endif\n"
+-    ".ifdef _cmain; .set start = _start = __start = _cmain\n.endif\n"
+-);
+ void cmain (void);
+ void
+ cmain (void)
+diff --git a/configure.ac b/configure.ac
+index d8ca1b7c1..041cfbab4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1461,6 +1461,7 @@ elif test x$grub_cv_target_cc_link_format = x-mi386pe || test x$grub_cv_target_c
+   TARGET_IMG_LDSCRIPT='$(top_srcdir)'"/conf/i386-cygwin-img-ld.sc"
+   TARGET_IMG_LDFLAGS="-Wl,-T${TARGET_IMG_LDSCRIPT}"
+   TARGET_IMG_LDFLAGS_AC="-Wl,-T${srcdir}/conf/i386-cygwin-img-ld.sc"
++  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
+   TARGET_IMG_CFLAGS=
+ else
+   TARGET_APPLE_LINKER=0
+@@ -1468,6 +1469,7 @@ else
+   TARGET_IMG_LDSCRIPT=
+   TARGET_IMG_LDFLAGS='-Wl,-N'
+   TARGET_IMG_LDFLAGS_AC='-Wl,-N'
++  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
+   TARGET_IMG_CFLAGS=
+ fi
+ 
+@@ -1798,18 +1800,6 @@ grub_PROG_TARGET_CC
+ m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
+ 
+ if test "x$TARGET_APPLE_LINKER" != x1 ; then
+-AX_CHECK_LINK_FLAG([-Wl,--image-base,0x400000],
+-    [TARGET_IMG_BASE_LDOPT="-Wl,--image-base"],
+-    [TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"],
+-    [],
+-    [AC_LANG_SOURCE([
+-asm (".globl start; start:");
+-asm (".globl _start; _start:");
+-asm (".globl __start; __start:");
+-void __main (void);
+-void __main (void) {}
+-int main (void);
+-    ])])
+ grub_PROG_OBJCOPY_ABSOLUTE
+ fi
+ grub_PROG_LD_BUILD_ID_NONE
+-- 
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch b/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
new file mode 100644
index 0000000000..bf6375246e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
@@ -0,0 +1,34 @@
+From d0f516385dc73e8dd92b78ce08c1df100434fe67 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 27 Feb 2026 13:58:44 +0800
+Subject: [PATCH] Revert "configure: Print a more helpful error if
+ autoconf-archive is not installed"
+
+This reverts commit ac042f3f58d33ce9cd5ff61750f06da1a1d7b0eb.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 041cfbab4..209c0fb11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1794,11 +1794,6 @@ LIBS=""
+ # Defined in acinclude.m4.
+ grub_ASM_USCORE
+ grub_PROG_TARGET_CC
+-
+-# The error message produced by autoconf if autoconf-archive is not installed is
+-# quite misleading and not very helpful. So, try point people in the right direction.
+-m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
+-
+ if test "x$TARGET_APPLE_LINKER" != x1 ; then
+ grub_PROG_OBJCOPY_ABSOLUTE
+ fi
+-- 
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 434f977667..8c62315e69 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -17,6 +17,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch \
            file://0002-grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
+           file://0001-Revert-configure-Check-linker-for-image-base-support.patch \
+           file://0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch \
 "
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
@@ -26,7 +28,7 @@ CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedo
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
-DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native autoconf-archive-native"
+DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 
 GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
-- 
2.34.1


