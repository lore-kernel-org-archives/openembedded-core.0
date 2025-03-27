Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA8C3600E
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:06:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45763.1743066387546984949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=518172d04b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R6xZiE012105
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1ns8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLld3Z8x0Iej6Nf9dtzXOZ3f8QJxFRwumg0VQRNpIrsfOPzrw/2tv77z7G/8zhy0HiXlqkIogUCPvWtudATf7gU0AwZ+45FtcXkNI5r8SQfVONAlFtVA942VcbmIDMryBqEclRIIAf0IWOqz4FbUzFQFBiFV+GKneBN+vFf/lHfwgDAESuRgr7U2izbetR2lz34QBGJ4agqM85gzIWi5M1S1HOXh2SB1CkAYPeOKYOWonf+HiamoZtn7/QGM89a6XMyqb7XsJBKR8+cb8AnCNtHCvzdJ6V4kMxIPhRbtVsqUmCfUOD/bwpl73MNX3ppaqQHZzZmb138d1i63DE1geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx/snDYKmduJHVKwuqFiKLorFIIX4yp1TkvYFjshx4w=;
 b=IZQVyUE6AI1u+Dttf0AxfQF/uYkihKH8oTFVnIKVr0KR205SLxfdvjWHxZy25dgeqn6RON6hVPPGo1LLI42AFFmbTYfh5xqP7Vhb2IMJpbX0aPuqR+Eh2qs/aC4cv5JCQ20WmBYqlZWocIu43pMn64vFZEXO1jTgBPhM69S9mGOcHMvIXIsp0UcvhO6az2AAqy9IWXndJkOPEcPJW4wWzb2sDWkjh+NVu1jmOVhc2rjv0el66WrIt39i3mfmuiGX9rBKir8CBW/NVhilEXxQbB+hTaUnoxRq8xHYXKZwZFCuHsZmFJ1MrLZ9s83vWxWpU28c6YsRX6S/mCWy68FHLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:06:24 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 09:06:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 1/5] rust: Fix bloat issue in recent rust updates
Date: Thu, 27 Mar 2025 02:06:03 -0700
Message-ID: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a59287f-a824-4117-5a0b-08dd6d0ea635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pENXgPjaSDbQAEDDLPU08qb+2Dh4/JZ7p1cpq0GoU9QmpVrbcxzVpBD+cnMK?=
 =?us-ascii?Q?oOOnJAa5U20vIwQitQsICK3LeWsv9LnRgqSapTRU7Fg1usQJlCx4+dFihWTq?=
 =?us-ascii?Q?17jnaWqUYhpkt4Sp6GxgmNRh1nVJ+Cdi8cozDVlihD+WEyPHUE/5uEfmug9y?=
 =?us-ascii?Q?OCIOs6qP018nBdTsD3FyPD202nlN1EfB9dmpb7J0Q8w5h8a45aNoa7VtEwlR?=
 =?us-ascii?Q?COlyiGb6MB2cV4l4F3+6iJwQEWX+TcHdP3vT9Du9O4mhOzMw/nIwgOrqLXpO?=
 =?us-ascii?Q?ElGRjmhmuv5C+qqwLGMrvC+igPsZVtis+IdkUjaEXa/ACQtuOqsO9K6ZPEAf?=
 =?us-ascii?Q?U977i6+8MxSUX1/DyRIwjJ1hR0qXa8JJ/vim5K2hca0V00juxahwmZ1xbEDP?=
 =?us-ascii?Q?fddBcpwlKMT2TWhlilio2t1Rn7v/UD/YqlmBcVtsPCS/MVvl11BaihlnOIvE?=
 =?us-ascii?Q?G9UaLMu4ZzU0bW6kqByk0BXkqD1BUH+T9idySodqdaawPuAt3Boml79O+eIj?=
 =?us-ascii?Q?bdk7gbZWifUVliGb5H6YX0YlSrvTNsI1n5hHNE1bMoNgHeTht3Rw77fZj11M?=
 =?us-ascii?Q?L1+2kfYqD029pqWAKLI2Um57BLLNyHFhP+BlWotaw7jbzkKF4QKB/cVTXW3l?=
 =?us-ascii?Q?NzgQhGZyUAopRzvYDthMcj7HnaW8+wAdSdKSA12/3NtBG/ez0ANMG0V/Ryzi?=
 =?us-ascii?Q?oKbS5Gyu3jtiGnL83BNSbvw9t1p2wtzWsfAqNfdWrgrgzJycXL0IbsddlFgE?=
 =?us-ascii?Q?NYiVVxt/EodMOjVxRz9LxNjEO/IhAek3NBeXRhlzVnzl9PgcCArG2/nawC13?=
 =?us-ascii?Q?0vNF8hKoAdbdSBfr9aKAM9445IcA05dbmqemwUt204q7MJM1Tshvo9KvB007?=
 =?us-ascii?Q?0lgMbGFNhYn7IJMj3plqDJTK/0hf0e8a+RweEGUoeqsNw9dahNdfs5Fm7stD?=
 =?us-ascii?Q?NNfM57Gn7wPU1WbHL//pIJrHaJK172xjnYcB0QlvCc+qapjGq584iLWK+4pO?=
 =?us-ascii?Q?ZbyqmNbLU121XyCc4s2Zj+f6C/J+RwshWFS1uglmIBbtjGyL+YXC2+QwQ/Qz?=
 =?us-ascii?Q?C+dlk2rVSTsxkkNOCvDiFdznA/Ss21/4K74fy61CdOntmVAlxHIyQ7a7J/Fx?=
 =?us-ascii?Q?UgEtDT6zcMS3gy9D2guesBxiN2r6zT747dkKvHpGuoRlP3RvcUdMsWPv5QCN?=
 =?us-ascii?Q?C9nsBnjeYx4+wAha0g/0ungSiOj6pDpS5kGoe9cCUfwbv7FNeGRIiDX2vtNP?=
 =?us-ascii?Q?8QY891jnKOHgu4JgH5IFDqhA3D4RSW2s56XpIPJzLLd8WTVjK/8Xk1tPA/AE?=
 =?us-ascii?Q?FtZFerRxqL6vHV4F3YPqZiHbMJh2cO9NBRVAFYgQy9I0nvI5Z2iW7yuD/IVG?=
 =?us-ascii?Q?NNS6kQ2IGJgp+IxmtrLbIuv7f/s37n3lgqrNWzP4EvrDV8scf81ZKEdTMqxX?=
 =?us-ascii?Q?bihvA59LBe4rLtKs76a9w56EJih9FfPjUKbt1yOv8PJIpcUx5qJKEV9dRy+6?=
 =?us-ascii?Q?6+ZcKyOjnTvhpyU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s9WaRIq9eJC4jkBotKGO2mPY2j9w53jqQOiMNnV/iYCjSy1pohvnW/qkfEXR?=
 =?us-ascii?Q?dDnfriThzK4JgtxAQJ2autMEXFedHIDuBjhmSalESFDGZsHedfBPpHjQOCoC?=
 =?us-ascii?Q?+9dunu+204uEuTwPPKI5gorwU3UOzC0Fz4VZAcPzl5GlTDAw+ZKU4YK2a2xY?=
 =?us-ascii?Q?2DM+V6xz4LJ1Oize8XszpVhjQ3PUCXzP0XX8LFajBNPDlegkAr04TZ2s632R?=
 =?us-ascii?Q?Z+HVSTz/E/kb4RNdPuMr1a9VzV+YhigfXjGcdTeljAT0k8+hnU7Qr/w/lrsW?=
 =?us-ascii?Q?aAbe3hFpXlJtYLdJUoLhlTJZmaL+58YP3UtTcBjsxKrIJ/Muq21M4E3pey3Y?=
 =?us-ascii?Q?xxna2MaOqCgAPZ0UP6I8JTjEuFOcqKgjKGW4Z68P0NGo3LANI38d1iuNBddu?=
 =?us-ascii?Q?EV2kyDp+piLEr+QinE/+QXa5JI5jo80gC1ZPU97n0NjguXuibzlCavSQxzMx?=
 =?us-ascii?Q?Pd4GikmHL4TlzCAZRQrKKz6twqDFmOm8VL/ZPZyIa9RDWG7dH/XsN3liVLnQ?=
 =?us-ascii?Q?88vG46Tqmqy21bJO8N2gJkFwu0MftUOnBPUVd4sMnBdDa7dn6V9N9qaGnjkH?=
 =?us-ascii?Q?8VnedGhBJ4ooRABzqnuc1PH0455s8BdpG3EWnfkhAoW+rJcaAvY4eDedia82?=
 =?us-ascii?Q?WYa0Q4xfMd/CqfMSyDTImCMc5fcPvgwsNQc3QB2Ck/0xCI5T3nwAyLWyB6r9?=
 =?us-ascii?Q?E5M1Bjz9RvwQf14b09zh08LPuCcA6MIbGz2E8xXclUUGxSq/dAlDmEcFd2wc?=
 =?us-ascii?Q?W58OSV54e7cyOBdTHOdKgIwGjJ8LJ/UqXhe6J2UGCZSD1BDFPlbFMXFy1qqG?=
 =?us-ascii?Q?/fkPICi/padwz50t3DXogvGcdw87j/E+FIqowALHSysqIqKO02dVTy1MbDA1?=
 =?us-ascii?Q?nXUbmg57XCciP6hMLzQxtwWiaM0esr2G5frrZ0Nvj9444ETPI4ZkMahm6Thb?=
 =?us-ascii?Q?txLMLEOiVahfN3r5RjkBbXFfVd/fCRQaArmlINbd3WL0w3jFGzFMfhRompyK?=
 =?us-ascii?Q?stvHyo/ZeOf6yzrXq5/PxBRlrsl0tnFxdlra2DFxznZrNDhpqYQg2/Ta1C1Q?=
 =?us-ascii?Q?D5qNjlX22ZX4yFq1KdQOFIGX6SIG/6B7UYRYO4y++mFWU90ZhEbmS7g6I4kj?=
 =?us-ascii?Q?ajnXBIcQZM/2GtXleoPgCRrfCvdXQH7882eaUK9/OwK7liuEzexMW4324LDy?=
 =?us-ascii?Q?xMMU99nwHmT2R86fL2ouwbRPTkBV4l24LhnoIxMQmOG5NfeQZjRo4zLjtzkc?=
 =?us-ascii?Q?mCDTOmDmhj3JfuyLxlVZga66a/RfKjG4uHcOuLPwVZpY4bo8psnj0+LWHoua?=
 =?us-ascii?Q?6wOlFbjOfUa275s5S4cMJk8/CTXD1jSLE9JEJQvbUZN763PLAvBoSHyd5jli?=
 =?us-ascii?Q?qXrMdYo+SZp/D4+PUgWGgrzlXQ6Mo6cg4LaHCXj9R5FHrfyiWrBxIy9kX11J?=
 =?us-ascii?Q?3FwhTJahMiI9HU4sNDuFbZPPv2vPU6rFrT6zY5FnTNLQ0exGvWOdtinxefbj?=
 =?us-ascii?Q?TYHnCv1R+GPJPFUPT9uH6hopYM67w+QfiHdO2dbL5DSbRqBIe6GbiBuni+dZ?=
 =?us-ascii?Q?vfEe7kxi10aWX4nvyr7aD4H8obGE34ZBbpVjMD/cC0xfMJ1Y/onJZSHacwp5?=
 =?us-ascii?Q?i73jn+t6bVUf75hS3lgYChI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a59287f-a824-4117-5a0b-08dd6d0ea635
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:06:24.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR0/h5r6J/+zn+0s8a++0QHwBbDy0e3UPRWKo1djyTLjBDCHYEuoclxpKQ9I1fg3G3M95YS0TAnpI0ci8j2F9LQOO3UK4JEiHsYqIp1rVD8pacyhBQ8x3h41jo62WSMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e51512 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=iXH-TeuoBE7Hk7Wq4nsA:9 a=b2R5CYIeGhkA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WSAlm40vqvH7sposik64lXCc-IpWd-Qx
X-Proofpoint-ORIG-GUID: WSAlm40vqvH7sposik64lXCc-IpWd-Qx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213712

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Remove the "src/gcc" directory from the Rust source code to reduce the
filesystem build space.

In Rust 1.83 (and 1.84), a full GCC-14 tree was included, which caused
the tar.xz archive to increase by 128 MB and the unpacked sources to
grow by 1.3 GB. This was an upstream error that has been resolved in
Rust 1.85.

After updating to Rust 1.85 we can revert this removal of "src/gcc"

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 838544e089..40fc237a62 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,17 @@ SRC_URI[rust.sha256sum] = "7b11d4242dab0921a7d54758ad3fe805153c979c144625fecde11
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
+#After updating to Rust 1.85 we can revert this removal of "src/gcc"
+remove_gcc_directory() {
+    # Ensure the gcc directory exists
+    gcc_dir="${S}/src/gcc"
+    if [ -d "$gcc_dir" ]; then
+        rm -rf "$gcc_dir"
+    fi
+}
+# Add postfunc to the do_unpack task
+do_unpack[postfuncs] += "remove_gcc_directory"
+
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
-- 
2.43.0


