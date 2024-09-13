Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F0AFA3736
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 09:21:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.69506.1726219318373323699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 02:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9986975a67=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D8qSTp009220
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 02:21:58 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44ex8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCRoaX/Sk2t4GFlJAJMqWG5nrGei14F3ELB1ui6llHfhW5F0gkpRmlVgrRvkWgsEkWyBrTpbypZDOpf+JHt5+y9oDDgICAxAi3jGO9f7t+DwoXquVSznQQ6spdHH0WVWigcXeLnuigaWGz35MPxR8upfcJ3UzpwfnZ0j9wmbstOnK85YnGu9QSl2mymKGxVIRz609DZEoGZsspurfppKQ/TAKFAL50LjlR27n6XQoBNHsChAhJdpr1c1rXvvGLvu9XQg7yYxTmibSrhsd7RJaa026wru6Doh1ruitBYgpG7cV5bcvGtnxytSbYbxji1vg68LZCo68XN0SFuL6SGoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLV2NS+egD5PFRWiFG3CMXjromFEYLodQyfm8897RX0=;
 b=EQOuSD3jmqm2KBOIk2UEhl12wUbuXrgOTVQ5hlKJA6u5H8F85vTTZ7D742p0z4Exh5wFfFdMPAlzGhWzLbe1BosFT/xHiZKAkCrfkSM6pB431APrVldhVSAR+TD7QdHPSVNHRV5k2/tbcgZNHKiI+xfo5wnY6ZLXdbm7OU46ELCVNTHljNgOahw1a+3z3cALGQN0zKriJEDDGhmoPcDcKqwfcNxWkR2ho6CmcdqFVi6rDE0CaNdjutr3oSXz6L7iqUsSogR7z7iSxy5rsNK22ysA7R+kKYLCPgqmxC6UYbuKufX/BBfToMw7ipL/UfpefNBzhCe8FJ/KJk2vwt8/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 13 Sep
 2024 09:21:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 09:21:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] qemu: back port patches to fix riscv64 build failure
Date: Fri, 13 Sep 2024 02:21:36 -0700
Message-Id: <20240913092136.2273686-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdb3fdb-ca43-46ad-52be-08dcd3d57ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?14yBDFw11ryvSKmNWPTP98z2RQ1MMs2h6tGeA90hffkvkMD3fo5UZVIxc+yl?=
 =?us-ascii?Q?19q0sdzoWn9yNQNomaG2WguUORoph36qDA5tS2XSPfw5YEBqddVxFF9B0sah?=
 =?us-ascii?Q?nBXhBnwXOg4QWFnZisUbR9Uueh4/H0JgkMPWxpgk/euDr9hlgNJXboUoxzgi?=
 =?us-ascii?Q?fzfIHfgv4LbOXoxeMrb6+uFx3EizaJ3L6sZEl88+dmfbEjp718KNi2gkhY23?=
 =?us-ascii?Q?fEJPjHjHf/to5l+QXDCFTXX/JvuNnRiOdzix9xYawdIm3k2ZXRoC8YHw6xW1?=
 =?us-ascii?Q?FXk5BaSH6FrgU5QM2uFURYi4OEkEi3zR2txOE+IHRNDjQZVwjUyGstFVetrq?=
 =?us-ascii?Q?q2Cck+awvCWiE+ZC+124Qa4dAKSC6PhA8I2rWKsYPu9DsSMHXIle4wufjm3f?=
 =?us-ascii?Q?zxPVx6MEneMaFkTOBBCZYkk6ECYsh77J5jushFeD7ZrtP+KBkj0rApgSe4Rn?=
 =?us-ascii?Q?JjUGHLBra9jwJbVbkf8cfSHsMSzeK9Bd92OShNPb7aoi/GY3+VpGSx6vAZUj?=
 =?us-ascii?Q?Leoj+utBMsJHFpofe5MifJnEZnFDMPE1E4Ju97Pl8XURB+G+hQsDeS2pBZGc?=
 =?us-ascii?Q?cUzUdpokXeZrms197QaoAL5qlncKTQcdBt7Ae+W78GXgN4NfXZCApTDrgC9L?=
 =?us-ascii?Q?8jVzVBr/p9fpS/QY5EMzidapgzUXgXgV6WoeyrVff5qVqNYFN1S4VHZpGYkP?=
 =?us-ascii?Q?UXLaMHLa2IgSWLgEvTRO81gliR7d1Q9HPBYS/RflJYrtTxXJDg2F+rS85kWg?=
 =?us-ascii?Q?TzmZkp2umBa8gA5iRoyPMHQRw2+XiYpONsvFnAZfaZGUYvYarN0SoIxbZxgf?=
 =?us-ascii?Q?q4+MntElHY+KhAsr/To8YcapB0uCQfOvPXTx7gSFQ6WYkhA9vq6LM9XQ61zx?=
 =?us-ascii?Q?k+xT3HdjvBIrWiFwEPWoERqjWZ+RpXEmqMWkQQYToKEjgOx4GeQiXVLas62u?=
 =?us-ascii?Q?7AOVbKNT9ovg+GryzNvMIEyhdlQA69oZIW/PXKo4sHHezT6MtLPgkkqJQne8?=
 =?us-ascii?Q?OJM/WjIK7CgFuTfkmfvlP/4pKYFdtkBBNCq91STPTE/ca3UmKrd9WZYi1HhL?=
 =?us-ascii?Q?Rqlofv9kJQFNYl7dEf8O/A1ZRimP2YjnEMjxCcHqVbmKdSyyX25SS2GDX7u2?=
 =?us-ascii?Q?7/vdZohgDQ2NnV9gny+LjHtYNCNmtPZLmh1DtJQepP2l5HNpj5w3jcE8hTP2?=
 =?us-ascii?Q?Em/NQcpGZDdCZRVGOfdDoNLtU3uzDOvDRdtiaPEJgy9VM7ykHzcX7bZV4Vho?=
 =?us-ascii?Q?PrnPzk3On51YRPPYWAeaPXdDSDLpm3wD4i1DhVfn0Bv/CddIt54gC8vrGBOc?=
 =?us-ascii?Q?Yte15TtQzIq4B6CKxY2hpV196VLGtQ6zn+7tiDNiwExBH0tJz3VMnu7PGkvR?=
 =?us-ascii?Q?wHV8A1g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?noqXQGm9UGtKfzW3thPncfK7T/X+bLIZMnLgBOsq/OmRjmKvoj/Vvu2rAXLs?=
 =?us-ascii?Q?oTA+TVOiNOdY8SN1HpeHQLrROZYsYrmzIppJrRMtbp5OezXt6Nasf3xusB4+?=
 =?us-ascii?Q?vSTDYcJQi+78aeqHaTaPVvnkEDKGWZ6k7+4skNtj8Iv7YfDbVjYE6W5oQw+j?=
 =?us-ascii?Q?1mN8MPf+sfCVIW2iU0ng+M8NThTU6uatM1v/MrvoCAXCIxffg9v+nF9aavDH?=
 =?us-ascii?Q?nX8uyTUaskc8A+SD1MpPBpbZD9udl8wS9mUYzyHlb2ioCLGpj3iBtqyJ5Peo?=
 =?us-ascii?Q?6XzKaWVEZBWupbV4HHDtWxo2HhIShIFQOP5EnTpPNJJOgZ2UgdXMdGSE8WJj?=
 =?us-ascii?Q?6egH0iNDPwPM3mKI1QLJNyhYNuafRLfYmi+foDNRRJq2KzPI9dpywzg9VoPv?=
 =?us-ascii?Q?4YYikdh8VfPX1oZ7P3oTn66BG3Brl7QiY3+1uLS+4Sp7SxuYIOA5H86C53SO?=
 =?us-ascii?Q?l5am5M3mQ28CzAEdjMp/eJ9oySJkU1HLpQglK3JYJyatohOMDQVOwrPEp3Wu?=
 =?us-ascii?Q?XnyT3NojY545rAPOJkEW6PMS02HR+kO02fpnGGhv4V4y1Mq4WcEtn3ObUSR6?=
 =?us-ascii?Q?GzFdCR1ogJsU7wqgJ4B8NgMzQtYuSzPXUNFpKvjCyhcgxmsa3gCGFdJTHYTw?=
 =?us-ascii?Q?qZ0x9TLILkC3nbUfdMKTozGIOJz/ks2cYkT7USWgOkG9n+MmkM1msGcapJo9?=
 =?us-ascii?Q?5ggLWYVQuYKOjMUosKkwZXLzOF64rDy1lUBwXjuyL7nbbb+fc2zN2uKSyv0j?=
 =?us-ascii?Q?XL2EGUZ1RL6HAq6eeFpaMG0cX/6SUPqH562TrvJ4sb5Oq0qCgIJe6QS7Y3Vs?=
 =?us-ascii?Q?D3FrT/tGZDN5SH7UUSeXJTDy9GOap+0vYhTlsGPTk9UBQyYCI2fLrYD5QU4h?=
 =?us-ascii?Q?NthZeuj4n+Lr40CH6SVOFYRQ+s+LHv4AePNbJUisU7PtKNJS1+5j5lVGBItN?=
 =?us-ascii?Q?eM//s5me5UO3C+Z35A9tWPupBbuK196zjZC5e1U+McbnPRYHq1ZTCCSR8S1p?=
 =?us-ascii?Q?GLWOI6AFXnubWkMWbX+UrrXwfVhcou7LXgmvdHqXRoCR52i/DKkbXZtiaQIy?=
 =?us-ascii?Q?slnQZKxh+WDKTsiAfBwy1ecSU+oI4Eqq9V+b0tAKibBiaJbZoIJY0cp4JZos?=
 =?us-ascii?Q?LJ691y1Rm1VOkMyRlIhCqgwgugQXdUsDzUE+RN8diwhhSKqxe1p3w4CUrN9n?=
 =?us-ascii?Q?H17800L1aTr2G6Wsi6pChcmafsr9EmlWZ0dKNhABzH77sV0B6tPVCjiPMUYZ?=
 =?us-ascii?Q?ogS5Jh0luPTjl3LxLoVf35yKwSQVc86YBmoZeIZ8FLKQQKB5BNnV/ZNWAwqp?=
 =?us-ascii?Q?kcbwotdd9bm0B7938Alpuu88/9HnKUx9Hu6l8V5ez2d0qqbXgcr2tszsW9SV?=
 =?us-ascii?Q?Icv4ewN7XpUbqcA2gLxvErkhmtGuo0uQMtF0aTTImm8nLfkKcncMNC3N7ZXY?=
 =?us-ascii?Q?Crx3f9n6DBYvz+zpJt12mPlgA7/f310ycL0jJ/BOT8ZDCUbpFh1AfZZtiBeU?=
 =?us-ascii?Q?/nWAFd7ybTj0lC/uGNsg6JfTu2nbaWjcPxym6FabkYrk1bWQtRToJtA1/CWq?=
 =?us-ascii?Q?WhBgz/ftmRfZummmhjQ7EgS0xyg3QiSREvKvQoxl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdb3fdb-ca43-46ad-52be-08dcd3d57ec6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:21:53.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGbeUMlPP16hVfYgzZpMZg5rmDYQ0fXUBdfmLiye0V0KQhuWuQt5wA/2urQA2GZNJEQGJM6RkV6gTfmDtC8XGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
X-Proofpoint-GUID: 6jTEAznerWOb3syH_1yR-8BSC8tQF4um
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e40435 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ID6ng7r3AAAA:8 a=bDdBU3oEAAAA:8
 a=JF9118EUAAAA:8 a=9qUTvQc-AAAA:8 a=zpzP5BTWuYmsjbWUsB0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=AkheI1RvQwOzcTXhi5f4:22 a=DN7SgORnOiO7RqxRx1GC:22 a=xVlTc564ipvMDusKsbsT:22 a=axOgMmt4Ejcwn1cqzmsR:22
X-Proofpoint-ORIG-GUID: 6jTEAznerWOb3syH_1yR-8BSC8tQF4um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_06,2024-09-13_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409130064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 09:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204475

From: Chen Qi <Qi.Chen@windriver.com>

Backport patches to fix riscv64 build failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 ...kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch |  75 ++++++++++++
 ...kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch |  73 ++++++++++++
 ...cv-kvm-change-timer-regs-size-to-u64.patch | 107 ++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a1d8a309a0..e9f63b9eaf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -49,6 +49,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-7409-0002.patch \
            file://CVE-2024-7409-0003.patch \
            file://CVE-2024-7409-0004.patch \
+           file://0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch \
+           file://0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch \
+           file://0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch b/meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
new file mode 100644
index 0000000000..39a6a85162
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
@@ -0,0 +1,75 @@
+From bbdcc89678daa5cb131ef22a6cd41a5f7f9dcea9 Mon Sep 17 00:00:00 2001
+From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Date: Fri, 8 Dec 2023 15:38:31 -0300
+Subject: [PATCH 1/3] target/riscv/kvm: change KVM_REG_RISCV_FP_F to u32
+
+KVM_REG_RISCV_FP_F regs have u32 size according to the API, but by using
+kvm_riscv_reg_id() in RISCV_FP_F_REG() we're returning u64 sizes when
+running with TARGET_RISCV64. The most likely reason why no one noticed
+this is because we're not implementing kvm_cpu_synchronize_state() in
+RISC-V yet.
+
+Create a new helper that returns a KVM ID with u32 size and use it in
+RISCV_FP_F_REG().
+
+Reported-by: Andrew Jones <ajones@ventanamicro.com>
+Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
+Message-ID: <20231208183835.2411523-2-dbarboza@ventanamicro.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+(cherry picked from commit 49c211ffca00fdf7c0c29072c224e88527a14838)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [bbdcc89678daa5cb131ef22a6cd41a5f7f9dcea9]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
+index c1675158fe..2eef2be86a 100644
+--- a/target/riscv/kvm/kvm-cpu.c
++++ b/target/riscv/kvm/kvm-cpu.c
+@@ -72,6 +72,11 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
+     return id;
+ }
+ 
++static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
++{
++    return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
++}
++
+ #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
+                  KVM_REG_RISCV_CORE_REG(name))
+ 
+@@ -81,7 +86,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
+ #define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
+                  KVM_REG_RISCV_TIMER_REG(name))
+ 
+-#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
++#define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
+ 
+ #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
+ 
+@@ -586,7 +591,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
+     if (riscv_has_ext(env, RVF)) {
+         uint32_t reg;
+         for (i = 0; i < 32; i++) {
+-            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
++            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(i), &reg);
+             if (ret) {
+                 return ret;
+             }
+@@ -620,7 +625,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
+         uint32_t reg;
+         for (i = 0; i < 32; i++) {
+             reg = env->fpr[i];
+-            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
++            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(i), &reg);
+             if (ret) {
+                 return ret;
+             }
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
new file mode 100644
index 0000000000..9480d3e0b5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
@@ -0,0 +1,73 @@
+From 125b95d79e746cbab6b72683b3382dd372e38c61 Mon Sep 17 00:00:00 2001
+From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Date: Fri, 8 Dec 2023 15:38:32 -0300
+Subject: [PATCH 2/3] target/riscv/kvm: change KVM_REG_RISCV_FP_D to u64
+
+KVM_REG_RISCV_FP_D regs are always u64 size. Using kvm_riscv_reg_id() in
+RISCV_FP_D_REG() ends up encoding the wrong size if we're running with
+TARGET_RISCV32.
+
+Create a new helper that returns a KVM ID with u64 size and use it with
+RISCV_FP_D_REG().
+
+Reported-by: Andrew Jones <ajones@ventanamicro.com>
+Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
+Message-ID: <20231208183835.2411523-3-dbarboza@ventanamicro.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+(cherry picked from commit 450bd6618fda3d2e2ab02b2fce1c79efd5b66084)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [125b95d79e746cbab6b72683b3382dd372e38c61]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
+index 2eef2be86a..82ed4455a5 100644
+--- a/target/riscv/kvm/kvm-cpu.c
++++ b/target/riscv/kvm/kvm-cpu.c
+@@ -77,6 +77,11 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
+     return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
+ }
+ 
++static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
++{
++    return KVM_REG_RISCV | KVM_REG_SIZE_U64 | type | idx;
++}
++
+ #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
+                  KVM_REG_RISCV_CORE_REG(name))
+ 
+@@ -88,7 +93,7 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
+ 
+ #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
+ 
+-#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
++#define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_FP_D, idx)
+ 
+ #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
+     do { \
+@@ -579,7 +584,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
+     if (riscv_has_ext(env, RVD)) {
+         uint64_t reg;
+         for (i = 0; i < 32; i++) {
+-            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
++            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(i), &reg);
+             if (ret) {
+                 return ret;
+             }
+@@ -613,7 +618,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
+         uint64_t reg;
+         for (i = 0; i < 32; i++) {
+             reg = env->fpr[i];
+-            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
++            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(i), &reg);
+             if (ret) {
+                 return ret;
+             }
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch b/meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch
new file mode 100644
index 0000000000..1ea1bcfe70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch
@@ -0,0 +1,107 @@
+From cbae1080988e0f1af0fb4c816205f7647f6de16f Mon Sep 17 00:00:00 2001
+From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Date: Fri, 8 Dec 2023 15:38:33 -0300
+Subject: [PATCH 3/3] target/riscv/kvm: change timer regs size to u64
+
+KVM_REG_RISCV_TIMER regs are always u64 according to the KVM API, but at
+this moment we'll return u32 regs if we're running a RISCV32 target.
+
+Use the kvm_riscv_reg_id_u64() helper in RISCV_TIMER_REG() to fix it.
+
+Reported-by: Andrew Jones <ajones@ventanamicro.com>
+Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
+Message-ID: <20231208183835.2411523-4-dbarboza@ventanamicro.com>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+(cherry picked from commit 10f86d1b845087d14b58d65dd2a6e3411d1b6529)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [cbae1080988e0f1af0fb4c816205f7647f6de16f]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ target/riscv/kvm/kvm-cpu.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
+index 82ed4455a5..ddbe820e10 100644
+--- a/target/riscv/kvm/kvm-cpu.c
++++ b/target/riscv/kvm/kvm-cpu.c
+@@ -88,7 +88,7 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
+ #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
+                  KVM_REG_RISCV_CSR_REG(name))
+ 
+-#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
++#define RISCV_TIMER_REG(name)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_TIMER, \
+                  KVM_REG_RISCV_TIMER_REG(name))
+ 
+ #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
+@@ -111,17 +111,17 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
+         } \
+     } while (0)
+ 
+-#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
++#define KVM_RISCV_GET_TIMER(cs, name, reg) \
+     do { \
+-        int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
++        int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
+         if (ret) { \
+             abort(); \
+         } \
+     } while (0)
+ 
+-#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
++#define KVM_RISCV_SET_TIMER(cs, name, reg) \
+     do { \
+-        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
++        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
+         if (ret) { \
+             abort(); \
+         } \
+@@ -649,10 +649,10 @@ static void kvm_riscv_get_regs_timer(CPUState *cs)
+         return;
+     }
+ 
+-    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
+-    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
+-    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
+-    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
++    KVM_RISCV_GET_TIMER(cs, time, env->kvm_timer_time);
++    KVM_RISCV_GET_TIMER(cs, compare, env->kvm_timer_compare);
++    KVM_RISCV_GET_TIMER(cs, state, env->kvm_timer_state);
++    KVM_RISCV_GET_TIMER(cs, frequency, env->kvm_timer_frequency);
+ 
+     env->kvm_timer_dirty = true;
+ }
+@@ -666,8 +666,8 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
+         return;
+     }
+ 
+-    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
+-    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
++    KVM_RISCV_SET_TIMER(cs, time, env->kvm_timer_time);
++    KVM_RISCV_SET_TIMER(cs, compare, env->kvm_timer_compare);
+ 
+     /*
+      * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
+@@ -676,7 +676,7 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
+      * TODO If KVM changes, adapt here.
+      */
+     if (env->kvm_timer_state) {
+-        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
++        KVM_RISCV_SET_TIMER(cs, state, env->kvm_timer_state);
+     }
+ 
+     /*
+@@ -685,7 +685,7 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
+      * during the migration.
+      */
+     if (migration_is_running(migrate_get_current()->state)) {
+-        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
++        KVM_RISCV_GET_TIMER(cs, frequency, reg);
+         if (reg != env->kvm_timer_frequency) {
+             error_report("Dst Hosts timer frequency != Src Hosts");
+         }
+-- 
+2.25.1
+
-- 
2.25.1


