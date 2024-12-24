Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE404E7718B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 02:57:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26958.1735009062701260633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 18:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208863f08e=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO1idh1001697
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:57:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0tevt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:57:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYZ2rXztyXIBT8Wd2ah1mZfjkGUrx2Fr9fiFdPBkvMOnxbRKnj+xCJ51dmf1Thi5x+3yF4ntadGN2uVtL/plmB65v6rI1UoOssA8f+778tEoGTQF03NAHY/1X2r8OOC/UigueWUbQfHwBtoScpBLKUz6KLIVGIVtfEq7FG93k4j0nkbMKcuX0dPRsgHMmZ5BAdbtYAU6AYFNL63OxgbM7SZLu+QuptdscASb6YgCz7je+svLyPSbRZ4aEMUDaYxP0MkUh3bE9yX98d1O5vGvfMdqlWNM2BycAD5Uu0MoLUFNLbbk6kE8mK12gxhKuh8qQj0O53hZSK0BnP8OEozj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ40keL2vcmJNf7KGf1IdAi+wICudHE7vKl5DR756rA=;
 b=ncIZ3GxBj40MnZrx+1WcutvVEmw8UE/s/8yI8EHYzkZPhVvvZnsn00I+4m3jQtD6pZppoe5s4MwZsIRFTNaSypBqCrSACYxDrOWLUMZ+f6grMezfc/ob8iYfPEnmS6BWyIMb8aj/QwokLG3PfZ4yaHHo6NtdOgMGVbeecVzuiubKH+24uWAab/EeAwzOebnLD1DDlWyST7zzT/nSCPrFR9k55oXGMDZosAAn/de+Cn5+xmBy+xLdFYLXNL4LoFugAL2UMQ0W5Icj8blG0uk8shDcKGKEe4AEqTX+GOWxFG7+SADiLDiYa8ONAU1vtarmGlOCIhYipMuIphz5xDLf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 02:57:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:57:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lib32-64k-pagesize.inc: add conf file for easier building of 32bit binary with 64K alignment
Date: Mon, 23 Dec 2024 18:57:08 -0800
Message-Id: <20241224025708.4192067-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d31a359-2d5d-4814-150a-08dd23c6aeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hz4F8Ut3XXAJPQqiV/TxBGPQoB7Sc6vHZTyQ7tPvytssoRpq1qkRQ0n5Gr5V?=
 =?us-ascii?Q?UOnYaqzGYpWftjzN7/8OibRGqY2pJ7LuJehjy6r5ild9VdL0x0MX1/eNx0Av?=
 =?us-ascii?Q?HW58kPzrv+2wDFz97Jf5WJ0iTJHAefze3p+yV5AIS3maXzPo4Jd3ak/MUZwD?=
 =?us-ascii?Q?yXCdZhudsTS9gvfGCOkVH/VBuDv1vUHR1iPPzngx+51OiSjo/x1/EuKmRN7y?=
 =?us-ascii?Q?LOoZwCG3m6ri5U/vCb/tQOJCdVKYuv3b6GaWybwGYLyzqSucmgBbNAwxtD/i?=
 =?us-ascii?Q?N6W8+ts2SBZv0CBrWHx8gbJOQcTMhFbctFPB2IePTJB2T8U3W3Od7JxTp7+q?=
 =?us-ascii?Q?ntCFtD2tS9paZNj7mgI9LMeGm9LuuCRuX7h83ftsbN6oMxB8YtZHoNDmSgQx?=
 =?us-ascii?Q?iy6QSkeGd5Be3Prs+HM3LwRH6UV5gUvcfm/Fg36iv5MT6jLkTSx1ZuobnkeR?=
 =?us-ascii?Q?BilsGkA2W4XNLGEa0USsTuHiRnKfmybQKEeLZsY14DWU0v2wPVOxjj1xAqtX?=
 =?us-ascii?Q?9M+aMxLQpuybS0US9OVQKkUdkP+QBQ8K9/Xy6H922AtPmdbIJ0r0eJFyx9Fm?=
 =?us-ascii?Q?8AcS9djufPnC3JVzAt91YUf9lf/ccxCfGosqFwI/kQs+pptM0hNjVjPFnUDD?=
 =?us-ascii?Q?mQl6H5r7U5wkej2JV8MRDakap2gX/UOmZYAqhz2wagNNF7rK731iFCFdesVI?=
 =?us-ascii?Q?HiXhWQTLcTBsKbYv8cOHZzvdBLePGV9zXSzNIRnBxPiEvDHZrZYOUGwKBr40?=
 =?us-ascii?Q?azFz1/tM9yKmIHJCp1vr+uQpWaqbBqY79MxC+dwrCe9+w7gmQu4nXnR8IuYb?=
 =?us-ascii?Q?JRkWHhsyFgtG4o0GDe1/ZATzX/3laKiv7WNR8DdG/DaEtfwd0za0UxETecho?=
 =?us-ascii?Q?9Laz0BGzx3iSsQsdbELIhbBnj3elLlswnwu+p2Eo0Ph1WOjO5F7Ugd5uP45g?=
 =?us-ascii?Q?Pd4WJeQRR9oply+Tw4ksQWjmQo6a9mctJw9LJNFXT1butH8px1akupKncEss?=
 =?us-ascii?Q?BAAiL4/dz7D2S9JD0z5qMUzcRPeyB8+KAIEtW+SfXjCVj3qFUohmmL0XJkSq?=
 =?us-ascii?Q?uxGah+Hg5/rcxoXTmFWEquFvbDineNhzPmSzv6ELXX183YYMPHPUZyZWoSzm?=
 =?us-ascii?Q?T8J1d5TuNih+hjwc9cKgvLjGxtbegGtWKf5DcQfBzNPgh12JmKwrOZOL6xXX?=
 =?us-ascii?Q?76hm746RRv/pj+tuyxsDgSVDSxMkfcWyjH4w1+1BivJgeYB76DgLZbnRQynC?=
 =?us-ascii?Q?vlY0HXWHa+RP/durGjtlfY7huyXzdf9o0WXb1LpNossjgjjXq8MwKoUvhz6u?=
 =?us-ascii?Q?hhqyJDph0By7aBg87/81XGOeTh1qsRo9ZQgUZUCRY17HEj4j5SbUFD7n8tSR?=
 =?us-ascii?Q?KFdJPgcqKE0HgEcWpGakHSWg6YTs9+d3QqxN6Oo3Wk+Qql2Ocw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ek8OaE8PKm11LyFEtljS8awbKBK5Ihd9s3Iup9U3DcZAqs1DF1Vd/KCMZ323?=
 =?us-ascii?Q?J/h9c3QM2fuRraw0By3z64cM1v5oJ4yqog9BeYc+r1gyO3obNtgTSPFjYCZw?=
 =?us-ascii?Q?ObZuEy3JOkkiDrOERbGi0ypCJ94hkhPx20yTKPrW9+m7X4TpZemdmA9PuUzZ?=
 =?us-ascii?Q?P0UJiFxsLtZC0rGE5it+x2MT9xLGO1WJLepZ3qof6xdfJjqp/4LMn8SsLHs4?=
 =?us-ascii?Q?srbRaSJcLNFypIFGWuXUPbXGe/aA0CrTrVSfzGoq9i/qqrIwncaNVyc1MFbl?=
 =?us-ascii?Q?t1vGjn1eM4tCo88AwFJLI9dKURQE0yH5qzlYzfnDSOeDlGr9GY77Gr6NVh3F?=
 =?us-ascii?Q?GA0akOgmsWRIcHCNJThe90ATlfI8evFSSfcTyOYOqfMxkM7WH1tEC8/M9Ul9?=
 =?us-ascii?Q?pQ432zzvOVjw5+K2JvsAuieQ4FqZhidvAUwMvAFaZLQwwt/8/o3g+Ggbd6XG?=
 =?us-ascii?Q?JhssIiqoLSY5nGvEC9l5OFogXNgzv/T2jWo1buCT8wx9uNDiMKW//d5d/ZK1?=
 =?us-ascii?Q?L4v/3r3fcD4s/DIHviIYpdord0nMvxAvbfetLvY9rb/rrdcvbV4jVeKsgOUp?=
 =?us-ascii?Q?8RC42JPWSFKOD/3O1/ENwjyDffxarXshthJZDjnAg5NupNQD2SvgVSZuKoci?=
 =?us-ascii?Q?jsTufwYJRvH8QDuuW7CEUTB9QCvJrwZ7uY6DDZM8cCEWjDfiHkRDgwMu02DJ?=
 =?us-ascii?Q?crOVmEWqiQauHdL3RH3134DiVJYQ9cuuUx86peJc1j8oaDMhNwB+uP40+lRq?=
 =?us-ascii?Q?n3Nm9BtV1akJ+pUC3Ilvg2Am3aPylGBCBkIlZ8xG47/4uDgL3Bt7jFS+ENhc?=
 =?us-ascii?Q?zi0vFbnsUdb8NfL8rIWSb4NKt+QDa+zYV+zT1kNNzkKLOqZRIeMRS/1qd0kS?=
 =?us-ascii?Q?nshSQrGVVxcPyJtth4sRgqqq6LBZ2WCT0lIvkICUW9+IazpkvYK90BiF4r7N?=
 =?us-ascii?Q?qnnOSyN/WtZhv8XBiv6yVJwaBWSjiMM3nwAOYOr1XL4TNvoRSEuOR0tbyAWo?=
 =?us-ascii?Q?V/LFztTfUUfFOPDMnBH3hgL9adoOFS9JWgJTfmQS2VA6huItgHy9cjUHZUZC?=
 =?us-ascii?Q?M3t3GYCVmlueBO7Q7umbBNa2Ym2DPusY1NCRs3gwodkJ3yOqI3ZTljLecy/A?=
 =?us-ascii?Q?2Rdc//0uTO+CCjs3RvhcmT25+8oIsRpyqL99PgsiXufUJ2oPM/gpvcgMOuwC?=
 =?us-ascii?Q?chB2SW7U1czJkbOu4gMUdZfbodrrLVbJWrsMiPHnGAvsof+DrF6XbcE3nm8T?=
 =?us-ascii?Q?dVhOmCfDcEqiJhAjB227FxSePpdEYfy0p4zRLSYm5TJWi4LRBM9SFZowOaJw?=
 =?us-ascii?Q?q0ZX0uLZOlKTTwFv/l5uYoZXz9s4pHVqiMW7ahSAG0cqk8P02xOHS1WKYQNM?=
 =?us-ascii?Q?p9LSp69BTssgvya3bmBcjtq9s9hPoVdaGOBXJL9PvX5jURS1EXVXu99fX9ZF?=
 =?us-ascii?Q?vXNe13w9UoOPrKkF1rlUEj2w36zv5Y+fKhtNJmM/Yh8FeQYdXpdYh8Agwe7J?=
 =?us-ascii?Q?seT5exCwA8rlrf2pOIk6YxFlNyTfjoFMSvWCXzuInfZmhiZW4gs9Y8HC445b?=
 =?us-ascii?Q?NZcnlnMA9x0WPwUVaUfF0/d3hddaEVUjbcJEGSOw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d31a359-2d5d-4814-150a-08dd23c6aeee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 02:57:20.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85uVeGqzuMi5iJ6kMM0ifKWq/7O2NPyn4IgzfVDaFjwNjPlj6pc+uhPi00w8tio85gxjtgm3Qj7/2dK8UjSi6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676a2325 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SHiKCT55yI8qsbkO:21 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=R-yJd_OdyGQsRlUo3yAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JX5nwFRHPJlJ38n77fL483KMVvg7mqbW
X-Proofpoint-GUID: JX5nwFRHPJlJ38n77fL483KMVvg7mqbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_10,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412240023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209056

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


