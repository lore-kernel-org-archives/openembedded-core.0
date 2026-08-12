Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DAFC5DF68
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8363.1786578564525100966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aPyMPB+O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNL5l93964106
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	aPyMPB+OsQqkpcyt4dlcCiXxutgiJuMEq93bEezSShKBVu4HtRuFAaWMDVGakyIf
	QAbaZ5S23VisCe5r8g3P1kowt9LAh+tDixDPFViZkUVf2Nu05daPvAajrA8dSKqD
	8N8Un3iBu5j46aoc1+tILS5JSjf6fNXrCP+4KKl9AcEenOylQL84GxfxREDYG9L0
	Z8mf1BfYtl3BMCZOtK2SLGSfTxTkTOEFKZpNigtANRbEw2BgudIirxqA5F58a6y8
	Dzl1AbfaOc1+4ip1d6/UP7+9ejYJNSQ/y9FWgB2Op/ZC623Cy2GCILkBRIF/Cf93
	cC71O14Fx9xJdurUnhZoiQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021138.outbound.protection.outlook.com [52.101.57.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwv4n0-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:49:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFsZ4J9G3x4mnscwJrNUcXa3EcRT128cIJA8VBdvl17hYaLo2InoKnCcozLmPH6hg9cZWupFQNzc3frL/ibaGdt4fKhRKz8q9eESKieboa2ctVtZrG6xmFK0eLQq0K//ijxXaerAVH3CdycNktVoZ/rKMjfe5KBjBOoY9FCShNYJyb4xW2EeAcQVCeo5DopLQ+ScYmTMnT45Vj3pKJ2ateqSC4Qt5YHxnggGdrm/zyzMiiZPeN+syo7Al9Cp9MD5YFIulK9oQNSuo3juO4dISSa26xRNeUYvTBtQp7Lgj/Mbanzzhi9UBEziekTdA2eyzdL+ZMcYmGD6gsZVT0T62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=ugc1RS+2l0YMfNqzPvnYzhiCV4LDTTpDddOxnJz7fPpPjXvIO8PXdf5cZkQlV+mqVI+dA8HVrBpiVgcWZJGpvpNjHj1ZL5SpzIGVFFyMzeVDGAina4GbTRTITB+EluaryGcAN+U/HRSukcmTiS2goCPWzW66R1Fr3hojajasC8c+B2IEuZhBdqPM+xyymh6BVMIBMygR2ZwD2cq7q7XQzH0p94rKejd7MXVY/iBYYnYnOny5LYx0eN8tIKe6o4OZ9xQPjNg22l1U94nkeylAAKp1k1bFG3dU+PFUDsW56xdhz/ivy/MuMXcOhSWvSU46hXfe2oS6uR5Z41oAo2/ESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:21 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:21 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 03/10] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Wed, 12 Aug 2026 16:48:53 -0700
Message-ID: <20260812234900.866436-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: ef909c90-f5fe-4024-ba52-08def8cc5484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Evs3VqsMl/KlQ/SRYJ8wj9EmucnNAU6BbwP9f9yqVY5CPGyECrU1Idq8nivc6/Z+KcO3Nhq/lQ6sedveOZHUtmH3iemguBV3H1kFs7tuBauc/dVbJo6QAGr+OztL0K2xEWjE/PwG6ARhKldRVT4dT3Yq2FE7fBztj6RX6Ns/DC0N1+a10gVEqVUhStydGi3+oZqDAwZAHHkl4+Z2EYaQnL9nTjxXVVbi4tOltAs50qqwMdZ1OjgEXRzRxMXMHha2M2S4U1rl7oiOatu+KwbMfd8QROy4P1d55RIQLBDM2wwiOtB/fEtoNs6T81+aaZBNUPl6qmts1HHyn1l+VoRDwcRCJzl4raNDBxIFISdkbcAC6aJxHwFDO61xq/nzk/CWDzDx+j4lRBsJDnTPl2yQjRvk3GAndUkSWiuCaQrHuxU3YDAXLF6Vr/WA+XrvTV1o1jWyYkxq8OyyHTbgzfjMDvOKBgdO8kOR1QDKE0WJR8nh75/VWnkAOkBAvgyof77KBIE+WdfbaUo649Bl6W49wa2eFfSZyXI+ez0KHUOURE3n2JbzzgJcf/qTnl54KLlFuLY24XWPlk1dyCFHVbtsOsX1+QKtvDQF0xvJDLXq4rCgqeNbjC17US2BQu9yUhtPRlEi6PqbOzyeP2QerjKqwT4qe/vl/3IyequFnNrnWYxq3id6DFJZ03SyDYgzK6w7v6W//79HinmqbSI6VzsEIr0WMC3vAwBK5/PMPP1ly7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tA5bnQg2rn8JMgRNctvNBGyy8uEW6qiqykxJXkJPlya5Ib8KM3We9PGpeYjc?=
 =?us-ascii?Q?Wc2MCQnIdes7Ck+RlmO12BF3dmk47FdPUAdPkUf41/qLgKgF/fs56T7ndN6h?=
 =?us-ascii?Q?LHQFTBzP6G+DPRcr5vqwO76RV62/mFRcHKyUpdLBBsws0xjMf31MzUuDVC+Y?=
 =?us-ascii?Q?xFb4IACX5KnMVKLtE6qM/QBPY666dOg8Pj6NVwGPBz5ygGnYN3qCW+5QPnOc?=
 =?us-ascii?Q?+f72T1P60BLjK90FhKI1M4MakcynuV1TlN0N83FkaT38xc6Up+hC5kcz0vYb?=
 =?us-ascii?Q?/RmPrjV+VyZMFM+x4ke9B35vW1gRYRgbyurprkA4BZEze1xFL3/Fwz0ina0k?=
 =?us-ascii?Q?mMRZVImP0ZSTnRC0cI5L4ie80ujEVSnABSK4O1or6n8kfE29MmNl4vk9fOUI?=
 =?us-ascii?Q?d7krDH362L2YIn2pMTlgLtj+lk5N7HgFgFuW+0407thmv9wLfCFLrCGNGEnk?=
 =?us-ascii?Q?XZ/A6Vl7nyN4tmh9bjFF4e14BK6ybrA5PUqjFFQ7oxaTumopPHH8uNRB90+i?=
 =?us-ascii?Q?+PTdOYUvhwdFdyXeR2XOSoTdIWrnfNaR36i2KyCuNoMwsASjaEzzXt2hi+cM?=
 =?us-ascii?Q?wGqphaLDxj9HIM/1gs4LX6HmYx8F+pA9y/Uzv/hPUI61hm3tHH6RbdeAMJzN?=
 =?us-ascii?Q?TaiLCYxKrwVJFRUFfxqydyq2N54qWjsyqw7oPGYo7IobPTTyAWlKIsjGLWFE?=
 =?us-ascii?Q?Cy1qGMym9ow0QwwdwstFz90BPJks3wykkdg97yodxmEhmvtR9D5Bya6UR8eH?=
 =?us-ascii?Q?nZC1YhbTOK8NGXSy33A+LpFH+Gj7xFduv5G2r1wScfL9v6Xb5vwHwObBucEn?=
 =?us-ascii?Q?jcbk3MwdD6WdOfJoo79AfphFzfi/q3ZkSRLBZQzLjBe4G5mjmHzsNpy+dJt5?=
 =?us-ascii?Q?UOiBNRZWLW+EEsHNiUhm0LuF4NjfHv8eax1pXRmTAbNPsLtCSleqmuAb3kIy?=
 =?us-ascii?Q?2d3XDx2beUyDOeGpiJI9gjvEWatkaKnNsQpophwPgXTaqZ0G8Dmw79XPrTjV?=
 =?us-ascii?Q?KbCq+5NttJ7n1e0XqljLRMN9sBD3ASbQDE5/PCdaTnL3YV78EQ82lTjHYaZG?=
 =?us-ascii?Q?YXU77W+ItVKmxJifHCBbo7E0OVAE9PEUMNtWKYZKBhdS5V87bQTzLKZGxLbR?=
 =?us-ascii?Q?agWgARiOwfTkJdmxrblizyXrCABWxF7Ud8r3PDDSLRCl+wOGE1oDaNcXlrdP?=
 =?us-ascii?Q?1SXm3oBZUmYkf7t87XZuVa/WS/PyexSVq5xQmn7c/mcJDaK61EZY1k59Db3G?=
 =?us-ascii?Q?m3cock1mjbCLj8NefZawJK0YGOzMrXY5m+9r6Hv20C1FpDyUjsBwPgBTUcJU?=
 =?us-ascii?Q?9df60c1Udu/cYxj9DuuzlehdVHoTRXgiOmSnMQI4N3+XqYe4/E04mMAZNqKs?=
 =?us-ascii?Q?KscUbdVYwra2JZG3qWfIn214aOl5udUEH9D6wpnuoqzPHogHkVJSYhMIWUA+?=
 =?us-ascii?Q?m/lPREXh1p4UeSheDqxL0rekdjiHzarPaI5eEw2EMDLSVwAo+Af7ESNNX8Jo?=
 =?us-ascii?Q?UKnKhlidhh3liWYtUBEyROwT4kNVGdX3ngAxqRv4WfA1odeklY7jueUAVpZH?=
 =?us-ascii?Q?emzMmeRE8wgKuYUSmfaCppgltC0ToVxcRp6wSKPL40zrrD/ajCqsC7BqhCrU?=
 =?us-ascii?Q?9Fxgtjjh75TtWljVKg7HjoytDIx53G1/9FQV1C1eKsKm+3nxLgk49psc9XQs?=
 =?us-ascii?Q?xYSC4ACc5yGLn710mes9XKaQ1Fg29M7SEyA91h3NCxfaE3iU1atZZ/3GSpfF?=
 =?us-ascii?Q?2n81enJCoNFN6sASnQINPKSAH8NHJb0=3D?=
X-Exchange-RoutingPolicyChecked: 
	NQ9h29jjN2jleHg9a4LbWZSpE9+QxB+1moa5bXfTTns0L5JEo+ADVRn4/TskuQlBU3tMqJRqFQaCbNBzvzHh3HptN4xw56zZRZtX/vkyfEgnWFK/3pQFwbA+xj3prEvKMNfSzvGZ2UCzT9s3fmlRljd95shZGA80ScAgiEORTYjxfT2BH+0BepWrAfrCrnk4QO7bOcBBLzvActGcMMm9/YdVG27cH4zAiEIqa00G2Qz0dY9vAJgk0zdC89sXt/1D2AsUZsTVstvEnaBjkn1DCoBswfBWwDrEGTRU9DW1hzF7wYxazRJ/Pc56+IbvLDSSa4wkLG5etUiK+N+OL+NFlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef909c90-f5fe-4024-ba52-08def8cc5484
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:20.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tlxzf/CJo1h3pL0MwGVzorgG2lpVTWVWQf0LthYPaH4LFzxYD1MXbT4xIHtQ93ISdWPmfwQVbxmCoidK2O3YQp5k18bWic/umZZDudkUkCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7d0683 cx=c_pps
 a=i28SWj9gb4XoQK1xikdYvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX/Hg2YStCloJz
 S9H/lCorM9dN5AJsoZNCZQNtvXrKDKo2AWpu9cd9z2hSCDVfTKqMaILJTdTrxoC0WzjwddQ2hrR
 X6YRpT+0lmLOn5RY3gHK9X5UnpwEJK5BepQl+0qyVA0gCANwgZIs
X-Proofpoint-GUID: GhcNh5MumrVfcoxJ6UC_TAcYO6jKQUuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX9GfNB+9QEq6p
 UYAuXE5CAF5QpQsBJO098w68Ocd0XO9nJED9wTgbEz7jTM+0+reIlsB4c93x4hHnkl7h2eZa1B7
 URJ+MopW5OlHA37WYbULyDtSpN9mxK/3BNebPbQZK5QK0Wp+N+lFIfs3GNQ1c7YmO9VbIzXaqqk
 Oe4XteXKyJuKzy5UQQd/g4hv3aeq6JmohRi9k+SM9b5lBdX32HpOysD2crHywK9XL6ibzgk0YuH
 2uaqEAg4xH7zXLPsFPtgnSTXW8n8wGmMNfnQyjMOtVPIf8ggjN6wYP0lrJkEP5LvIHQ+GIfwbdh
 vPDruYW9AHXagNOJX1Rfj2AaqF7b1lnQE3CYIE9eIt82Tx58u9Q7D2+Z1YPC/T6jTMyDtSlaPK9
 iWB/S4Hyqno6w3x+5jSxwKYp4chXFDaz2JHUG8+htBzqNNqxftfrgC+LMwCK+82l/XIep0QU0H2
 BjUEIG5O9aujFd/1duQ==
X-Proofpoint-ORIG-GUID: Jdt9kMSyqCwjYLhJOEfmiawCOcvgxgoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243312

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78..8ccd89a190 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

