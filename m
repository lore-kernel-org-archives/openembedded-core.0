Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDB6E77188
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 03:05:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2039.1735095895575880182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 19:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208980716c=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2GsA4019698
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:04:54 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0ukbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:04:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0KkNSkvyQ1u868lZp8JLSZVYy15oYqHRdWG6s+rqTf8Uocy0M8Zr095sAa1pM4Flhque5U74mdgu0BxCXP7Fl2KizEzdjtHpqcJp6amtntoXc3uSX+QfahSPf4q0Tj12rM/1lIkofJB3Ak+prOcKpoh50ZyY/WXBOwhkfIxk81DRbmFAgf8A8QJ5nn4NEmngfVn/qFMtLHcyuA51cpZXyueBh4mvSEFHIrznDwrnA9HNYdkEPTHzbQOd22E+c9wAVM3eV02ta4X6OPRxNI+8c79jCSsZhwPH+iX0drgwXJD0u2dchWMm0ihwDAUqGy6tLNQjIVPFz28BwiiB68NBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ40keL2vcmJNf7KGf1IdAi+wICudHE7vKl5DR756rA=;
 b=NgvN0eSAc1LYbmytDLnI/xFnAScK/aSj5Eklt5qLFWQ+YNU5WRWBUdkPbhgznV9Gil/uZsD+WHkzIMvy24gU7/E0vBbApez0FsH6pr/AOSlOkSK+uE5b+Ydmg8mC9ZHoA8I4RBRTbjrueBnqxArzgbgY/EUsiZlRaHKZ/8HQwC+v/MBjV1YKyyWt1uq1eFp2VpLfrzWRIWrjWdaBILYHmG402YLb0I0Z33joeeMYmo9Ohop6Hdm/jj1LjVGhDs195IHjhpmT8dThyXdbojb4veRgXr8nRr1sHk7ypWuIrjuYz+xmZMw1k1zMAiXvWe4QwN05MxVApGyRnRuluVUJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 03:04:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 03:04:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building 32bit binary with 64K alignment
Date: Tue, 24 Dec 2024 19:04:37 -0800
Message-Id: <20241225030437.972359-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::43) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: bc49dbfd-62ca-4320-e966-08dd2490e449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JgHFuZOkFinlLyeIVVbquS/2dOFMQNHzXYiORucpwwwX7IUtl8W8IOh8lIMb?=
 =?us-ascii?Q?BhFA657ELY59woC7c4Zrcb6uS8s3FtvfrkCAkWd4wIG7qeoKy2K4srMsBEqz?=
 =?us-ascii?Q?LtJVK/uQNKdXFvEP7BGpFcJp0J+JNDk90rjtskVvaicFFDFHKUpvsv/Q47+v?=
 =?us-ascii?Q?J5mHJANbTV68dOUNT0HHEYTIrgYRHjBGspQx8XeJhMNiVygmfTy0t5ECOT9+?=
 =?us-ascii?Q?xb9CpFt/WBMPi37qjf//K9H9GiRQyZ70dsAi8kPlfGyZsLWMFfQhkwTMkR3Y?=
 =?us-ascii?Q?2K3ixb45lYvxs7nSfdg3cQEjdVfIvzeumk6dlZ45iXTm6MfeZ0K6LxdK3/d0?=
 =?us-ascii?Q?4lv1PuNAk3TfiSom5Zq6YBimMTQB+KsyzsWoenrGsJ/xjq6jFgSXg6wh79lK?=
 =?us-ascii?Q?sDkQry02QtI9kV2XIuMRyI9JlkXCu7ulbm6r1tOBsbBIcbAKs1+DHDFm0LV9?=
 =?us-ascii?Q?R6hClzJx4SCoKllzDOnaQ+AiaTbx2PpVn7xZEfKRShSd3YPU1wBsykIItAye?=
 =?us-ascii?Q?Q7GM+XbQFZlNDYY0/SLiW1knNPfNWgWEhgNLWyX8BbExYavzuHnhQrUL+FIt?=
 =?us-ascii?Q?cdPcfeAiSKsIbPg17H2TjHUnfCsq+m6jxlThw+W32D3odr9hN4nv7/0uJa4e?=
 =?us-ascii?Q?IArLQoP1o4xZ9dNQfXLyCP/29t/VdRAknCX9ff339WvP1REmCd+EMPuCcyIJ?=
 =?us-ascii?Q?+8S2NhxUyo6iNhp9TgCev3pVdUMPvRM7v8DrCB2kHwuFYxYKG7Eo20sTttM9?=
 =?us-ascii?Q?pGEw2bwvIPqSMxUOnM+pbfCfDBcX7jebNkwq8xKeyQ4fczwT4xj6UYxthzDL?=
 =?us-ascii?Q?ZdSldwDbSs1xrjeEb2RXAvVVyBS2wf0HjI35wzSKzJJNuaFh2b4q6C/w0+oP?=
 =?us-ascii?Q?v8haGrbno/kbMXQnb33vVZJEdo34SRQVDaGyTxaJAmfkuA1UczB/ZhjRoTps?=
 =?us-ascii?Q?0dMmkbZ7/LvIYCbV2jnTz1ltOZk/mMoSOxHuRZY076kXBrLZFnD/WMKFj9Ge?=
 =?us-ascii?Q?osySeSCiwJlZ+5usjAynqW312yvBwvMv49oOz397YcO/j0r8tXUwwR8IteAQ?=
 =?us-ascii?Q?18rUEd0i+byshIrGMF3IM4+FxMXQioC4IgImu/VVYJA7phbkDb8g9GHe/RRV?=
 =?us-ascii?Q?5vC2q+2K7v2C605sLPXzSIb9p5KsyEWuhF169dSAhap/cGmSimRqYz5J6mow?=
 =?us-ascii?Q?E+8YZo6/vL7UJfM7eguZzLt0v7vWhwegnUzIW+UEkGyhWkNYqeN19F/Vgx9T?=
 =?us-ascii?Q?f0dO8sDcC1LkAHQoub3ka9WlfULTEa/0n1cbNxycsyUg/5hG/5i+Ag1c9fTr?=
 =?us-ascii?Q?9298IFSx7xiDGzHRsiUiRsOzbK7nwnBwsn3bVtNCBBKMWxWVvMXpPfX06xNW?=
 =?us-ascii?Q?msZ53GYDt4NjIEIvqLtymQgKhC7NN/7s6A0ajjJVO0nULqcgcw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d/hGDDy7lZQCJjkYmPnyv2BQC1yuDZD0/j/kQoj4uX86bPAaM+Xnc6gmpAgj?=
 =?us-ascii?Q?FBpU2EEXJichO+sYBIjD0Ac4gEpAASQdn3NgZ2zRl0luXCnJw6VrTX2ltn3P?=
 =?us-ascii?Q?X35PIgTsfSRQtWrb1bZ6fenK13pNlmP+6h/71IBsOqic86EPibuaR347SOxF?=
 =?us-ascii?Q?ryDscGg1mcPtfpR/DWsGoaX2TDoxfV0nwmtSiYhepK1ELJm310IfLGvSRFNM?=
 =?us-ascii?Q?U3kg3CEuDv6OJZPQAYgZGUbnr0leL9zcV0ajLtxxAK983VCZ6kt8c9hk7STM?=
 =?us-ascii?Q?vgEA3Li/cL/Rs4npmivqP/H9DImR6LGsDDTPyzpYBTQ1H4BaN2BOoV7AjD53?=
 =?us-ascii?Q?W4+cKNxsHzso0NnBELPGaZV4FScZd9WEWPcYe8P4UBsHjjdLo/4lCANmhCLG?=
 =?us-ascii?Q?fA5IL9fk1kF+3isFOnOObYWMV79HLrJHXptKWZDGq9ZJ2qAqSl9THp0arzsK?=
 =?us-ascii?Q?UqrdLljjb67H7XqdFTKOm9Qo12HnCN7RG/k1yDfLuMSBhjspFAC1JztyTAVm?=
 =?us-ascii?Q?y99zWpCQfCBWqmZD6e/IXhhMT543IbsH/+rqBVqgkfT/fZDl5JR78PZ2rNS/?=
 =?us-ascii?Q?DLIRr/fl9Gkw4ZqCaDJySGPi0AwzBRDQyKYl7M7fuzvrT44C/BCqzfDO0zIy?=
 =?us-ascii?Q?eF4K+yIBZyKf4+g4y5leAtJsqby2HCRA8My0UQoI9Ba6WGGpME76C/19vure?=
 =?us-ascii?Q?TWrJ09IUruLDUB0PENC68GR4pvfgu3ycflytLmG9PZtjz/rDTHbCp27X21ii?=
 =?us-ascii?Q?7BeeTwDqRLO/d/PMII3568gUV0XDRy4LvJOheMIciY6T/73LRXBBZS208zFj?=
 =?us-ascii?Q?X7u4GwVhAzg6UEzU7BywVt7oqmAvZAZtC0gPb2LNEmAVzkdXbfkWIko1oYld?=
 =?us-ascii?Q?ocMb7e9358iuPTyDBrOKkQ3D15oIK6NXYAW8tWOcMCW/dmbmBqppqYsP8VGP?=
 =?us-ascii?Q?yYciCij+AO0kXfvkG038a33zS4xDu45ueySvJacObNS6RxktzGm/psgTy5DM?=
 =?us-ascii?Q?YuuMiu+S8+ljJG5KHoXDh/aqW02sPdu6dbQH835YQCIoS2FZXz9nXWyz/uPF?=
 =?us-ascii?Q?b62RP/hvuL505zH7W00vrEZEbENhR4o0ahKjaDbfJU+nVsSdHTiC8ipQ2k3Z?=
 =?us-ascii?Q?aj6BLSrWJS2prynVRpi82IpR2Rds0ESYRR515M+SpyPSYM72Zl8kmAmtA/gH?=
 =?us-ascii?Q?vnOCbhUIuEAJTpRSkL19P4WGR7voOEcIvm8ihQHjgYS+R07fmtEhkL6Z0jfZ?=
 =?us-ascii?Q?K3QC8OQpc6l7wQjp/1ecw5H63etrClzvSmKb/cJpzbmHmTkkXbP7G5nJlxWO?=
 =?us-ascii?Q?vm1vfYIbrJxoFSGBKUFMqOjx72kPlaMf7/yZiTXQ15opCRJHEeHPJr+JysRE?=
 =?us-ascii?Q?DSY4yGImlR1uEwrVjIvM3YMus2I8Fz+WD66TivEDPqaD0e9AI5xg1mo1K63M?=
 =?us-ascii?Q?Qvi0IldsPou6YJLDpHVOAFhQvt4y5wKEoQ3IgHgryQpaxomHu+XvTpTD9jtG?=
 =?us-ascii?Q?jxsEPj70eRw+MMeFPYtOTrjkjKvUe3vylbVC4O1/uc+qzCGehwW83ti+f0sO?=
 =?us-ascii?Q?ozZchsZXZ43h2F+t+ukom2EYHhUrDkSP2lwPFSwD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc49dbfd-62ca-4320-e966-08dd2490e449
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 03:04:48.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUlesIbqVzDx+KaSEGz2x0mNOTC96yV+khf8DydKFKz7sul4vdSBWsiNNp1VShsMFp9Pal9nZJP29biu518Qbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676b7656 cx=c_pps a=LJpgAVzrtcldLI4wrjuEkA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=R-yJd_OdyGQsRlUo3yAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iEHYqsUMKM21mkJ3LnhVv2cQdLvFK94z
X-Proofpoint-GUID: iEHYqsUMKM21mkJ3LnhVv2cQdLvFK94z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_09,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412250025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209071

From: Chen Qi <Qi.Chen@windriver.com>

When 64K page size is enabled, for 32bit multilib, we'll need to build
applications with 64K alignment, otherwise, we'll see errors like below at runtime:

  root@marvell-cn10xxx:~# /lib/ld-linux-armhf.so.3
    Segmentation fault

marvell-cn10xxx in yocto-kernel-cache enables CONFIG_ARM64_4K_PAGES=y by default.
And the issue was first discovered there.

However, there's a kernel config fragment in yocto-kernel-cache which enableds
64K page size for arm64: arch/arm/arm64-64kb-pages.scc. So it's easy for other
arm64 BSPs to enable this. And when they do so, they'll have problem with
multilib. This patch adds a config file to help people a little bit in such
situation.

The max-page-size option is used to fix this issue. This option is added
to both CFLAGS and LDFLAGS for the purpose of covering as many recipes as
possible.

The systemd-boot (bootloader) is an exception. It uses max-page-size=4096
in src/boot/efi/meson.build and it has a hardcoded value in elf2efi.py.
See https://github.com/systemd/systemd/blob/main/tools/elf2efi.py#L233
and https://github.com/systemd/systemd/blob/main/src/boot/meson.build#L192.

As an example, below are the lines I used in local.conf to enable 64K page size
for qemuarm64 and use mutlilib on that.

  KERNEL_FEATURES += "arch/arm/arm64-64kb-pages.scc"
  require conf/multilib.conf
  MULTILIBS ?= "multilib:lib32"
  DEFAULTTUNE:virtclass-multilib-lib32 ?= "armv7athf-neon"
  require conf/distro/include/lib32-64k-pagesize.inc
  IMAGE_INSTALL:append = " lib32-sysstat"

Note that people will need to enable CONFIG_EXPERT=y to make kernel
recognize 32bit binaries. As qemuarm64 does not enable that by default,
we need to enable that too:

  EXTRA_KERNEL_FILES =. "/PATH/TO/build-poky/kernel-cfgs:"
  EXTRA_KERNEL_SRC_URI += "file://enable-expert.cfg"
  SRC_URI:append:pn-linux-yocto = " ${EXTRA_KERNEL_SRC_URI}"
  FILESEXTRAPATHS:prepend:pn-linux-yocto := "${EXTRA_KERNEL_FILES}:"

With the above lines, lib32-sysstat can work correctly on core-image-full-cmdline.

Extra testing include:
1. qemuarm64 enables 64K page size + lib32-core-image-full-cmdline can boot up correctly
2. oe-core world build succeeds

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/distro/include/lib32-64k-pagesize.inc | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta/conf/distro/include/lib32-64k-pagesize.inc

diff --git a/meta/conf/distro/include/lib32-64k-pagesize.inc b/meta/conf/distro/include/lib32-64k-pagesize.inc
new file mode 100644
index 0000000000..851a3a65a5
--- /dev/null
+++ b/meta/conf/distro/include/lib32-64k-pagesize.inc
@@ -0,0 +1,4 @@
+MAX_PAGE_SIZE_FLAGS ?= " -Wl,-z,max-page-size=0x10000"
+MAX_PAGE_SIZE_FLAGS:pn-lib32-systemd-boot = ""
+CFLAGS:append:virtclass-multilib-lib32 = "${MAX_PAGE_SIZE_FLAGS}"
+LDFLAGS:append:virtclass-multilib-lib32 = "${MAX_PAGE_SIZE_FLAGS}"
-- 
2.25.1


