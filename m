Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790CCC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4175.1707735623849545640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Oub+isEG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2772fcc004=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CAxQKM020222
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 03:00:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=+aLlBbirhZ7ctIL17i
	pmW07RGct2at9RFVtqbvYeubo=; b=Oub+isEGhew5qsyHMFB3JFZkMhZdetVPrF
	lgdrZ+XQRKr/IyRXRK5Xv+RkhAoNaKt1bHM2bafK3WUWChPjSPQpD680RebB0rp/
	93O33p7SIspA4c2UdYq7qInh8SAs/RaAaHVtEdcJOKVxAIApiQ/67T3WxYcKPGXA
	G3KLZc6BCmfj8DgemXucZ8wje0UauDd5RDcro/cgk/n4xHWCvJN62qONf7YpCrC5
	J6g9aXHSSUOXol00o67UU/5IEIPz2nqohEzqGoMDZYK3merDgCRSjEhmBXcEQG3o
	Vh1ygblBddgnghHwVXf1ZA2jsYbCwM5dDFv4LHUFZuGBjkdy21ug==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm18ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 03:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdjB2qhbBH1TV+wMrV2j9Wi+6+ssEgD8Gl4SgY0BSc5AhoLA0hWs60KM6BM5E/cdiAqYN6EQ9dnyXz5hF0vPXKXHh0eFQ4vARorqMay0UmVsUPgoXPUh9Dmotj2wAG4HK6gWKlR6gOIhOkgHtWhds/taqU1jvGD2qSw8jixlNE2BASwSkjeO+RaznktHeh0XCZvOQCxl4uF3zWHGksz0yAMAk1cR96VM9IH7006a0DMJu9vhPlJT+KKHJStNOcwp8btihMUdNrCZRS1iX45R+fqpYGqv9VMooGJ/oWyswpEL+4K/D3MciaLBfPXDuOvW2heh+5T4LeUbPPAjRZb5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aLlBbirhZ7ctIL17ipmW07RGct2at9RFVtqbvYeubo=;
 b=Cq+QmWDP576GDO1bUC6ArWXhWFKZh6/eBB9/d4UZti26QA/jZDlKXRz8jPoJMRjTe60GCEcHg15DE5SQ2YOtIUAO7BZm+y0Q9DeKcm0jtlBZ5HpNCr5dPLpknktbN2srPgw0gCeYPBBwR0JdftiEsVsLl9gRltRa+mi3wioR4+dLF1lQMCod88j8WBzcTYFjnXhjogTxbgKkbvPjKQpq/wBbkCk8kdJJU2xlUm8rk8zDtHirEoyl/GiVopfzodwWbfDmsdQBR5QsFKoPWzLelWYBwwlLvaD9U/kWwMY4KKlw4FpkJCXSoQrJovGI0qCgHBTUTT2jNygM1tq2QdvNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Mon, 12 Feb
 2024 11:00:19 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7270.025; Mon, 12 Feb 2024
 11:00:19 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Add riscv64 as a compatible host to gcc-sanitizers
Date: Mon, 12 Feb 2024 03:00:00 -0800
Message-ID: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: f845c1ee-aca8-4ed5-c5e1-08dc2bb9cd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GiXr3w8i65IXXVFwOfsRPSiswsJF9VQcnzzL2U8Dp33u4oNfjUSvg4+y7yFzMSdyFGkXMu+pCbTeFSA8Al3DY+qpdetuY/Bm0YRFR+I3OVyCeI6onQGm+ICOfGUSeVfSdFn6DSuM/vitqgOn+mn43JAUroDacJ9HnSHx/UMGHN/fOUOdFOLmFzvrMjUJQwTZeyepDiwSXic0uP4rkWeCI55KLhVlP5xHe7deikpKDfrQdzrbaUHIbkur9E9wSjlx4mqGyWfBbrB5cLjAjr3RxzVTkYf2r4BrdTOXR/cGRRpelompyrIJj3mBSpMppZUF/kTTEK5LMJFeKYqn0pMVU2I1UwK1LWOx1qLWWf764SPmWeXfgYPxTksL7EesIL2L/4hO+g3Ez5pPq4gVU2+FAizWeZDMQxmQtMxN9nlzr09EmnrxS1z2siRUiD/b7ttgsztrEkpFyW+Sj6KhAne7BBc60Q+lk9Gg5JjsrwUt5VRDWxtGohsRfnv+vx/cgb++pdn6tulqnKz0UpU3aG/UvneDhjSGBnOuKJqyx+c7l+UJd1vfH3AxfbgvlBoDpROc+UOQ52tOXELM09Cc0oS2Qcu4m7YRqa+GWScTERuupl8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39840400004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8676002)(5660300002)(66556008)(6916009)(8936002)(66476007)(2906002)(83380400001)(107886003)(38100700002)(26005)(36756003)(1076003)(38350700005)(316002)(6666004)(86362001)(41300700001)(6486002)(6512007)(6506007)(9686003)(52116002)(2616005)(66946007)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cnvfW1PPodg2poT5tJPNvdj6tB6GL7rBIWldsDJb4yaLRqhctHcB0LA6K3uV?=
 =?us-ascii?Q?yi3hQ5R533+epU1ozdX9nfrnVKFhEsKx/QBsbQE2/MzQ+kwJFigLhxXAVlVa?=
 =?us-ascii?Q?7O57AD0r9arWFsAUECTLis91TUrQ0UotymZ4lb3y1CUs4UisgThrnRiIxZE8?=
 =?us-ascii?Q?YU9eMY31JmdRy4E/QNoTSuaUt/kB20RWM7AnVGjsJuumCSNLfRMH6zzLdNA3?=
 =?us-ascii?Q?K5gfoSBbDUBE4OtJDjs+cRXleYq9SGJXQHFUoIR/U/KUnMgCQsZJW/d4tPt0?=
 =?us-ascii?Q?9lPNTuKf8ufGHnh60nyn5itvAXIutyGiaTO6QE3VOYSN5LeYKxVjUAgtv5rF?=
 =?us-ascii?Q?TrKovgsE4bs3OTQFqMNlusmTE+s32YZNMqX16aICgUtq4NQecHQighjwJ0SY?=
 =?us-ascii?Q?bI0Yxns6COZNBe28ytu6cNIB39d/bb0O7BHtzEGR8evW2rY94wX56FaxGjaP?=
 =?us-ascii?Q?MU+rVeyjMH5GAA7vErgYbLq9st1Dq7XLOGWNdO5pSCNFOwaccbhC2v8AvGgG?=
 =?us-ascii?Q?yCdsnx12BBviE3fm3LIJ6JCmAWDRFGf/RCmO8tBH33YKKo59XW3dVy+8yRYs?=
 =?us-ascii?Q?ITw90DbKrE/h/NluzYsCqdztS8V19HcrvzJRihO6WwNf7DzhmdVcZEAng52X?=
 =?us-ascii?Q?OhU8EvUH7I5jvROxihjzBhOmSLC/BcJr/tQJOxWWhpUfhpqL/y4V7PWbsu6D?=
 =?us-ascii?Q?3wqFTjJSv2DDglNqDI4N+u7IiFEv0vuShihfg0ASrgxzH3+u/MSJDlh+u5P6?=
 =?us-ascii?Q?5ALyFe8m6Sihpvw4yq1MhYcInMGiZhU/hxhITWtxRp8t8tMNo+n2nGZuaFLk?=
 =?us-ascii?Q?odVjbFUiGUR5LKknDh+gX/3UZP5ShVLQZpGnq8yEwVmuRMMndS8dSrHxroFt?=
 =?us-ascii?Q?83wx2BKnlyOmjESNAT3pnSwGTm37ztW1ck3BPmci8azGNqFaUtRW7VySDqun?=
 =?us-ascii?Q?UJHeH51Ho8Oju1jfvABAZqUzYc6M3AypkWtQfV3PvHSptkeD9NmOKyGSiFJF?=
 =?us-ascii?Q?jYV4sz+qmuuC7udDGsk8URvgwhSrmX9+lJavuxvWv/3nDu6sQykmift2fAR7?=
 =?us-ascii?Q?imy/bAmdvCX2KfvBpPTCfpvvTPa24C20T0IJUSQID8KUj7V4HijdpJSgajmT?=
 =?us-ascii?Q?YjPYuJDcXRad8SDKHP+FGoLaLDOJnvuaVR/0t4L9/+xL95oADPJeuer+sxxf?=
 =?us-ascii?Q?bT2022yQ0QNjwmMUPA2mN1cJeHrXgDNES4qs8hSk5LlSDDzdVmSzinvE1p04?=
 =?us-ascii?Q?caYNI+kjXmFzkqHXipXUS+uJcnJZvr8TOtQGv0eStou0JO7LPd8VPaC5xez2?=
 =?us-ascii?Q?t6Hf2QpTmjULBso86zFJVN5kVs6z1HHtDptyoxrfy0TjXqWrfjuGM6glcPqI?=
 =?us-ascii?Q?G941UrZ3VrWobiaxI+B48dYzqtxkRXXRMq5rYE2hO2gvlVyRkmHYkTrsf6YY?=
 =?us-ascii?Q?wXjp9h9ava8nkIldEcgXnbBRx/ochprgtztVQwHz3da9i3GTwejsHMbD6zzr?=
 =?us-ascii?Q?AxdbQO8eyyQC22Pn3JH8AEXqvEhit27cjYwDfM6abDIkoflqiZyGPjKyLZ2t?=
 =?us-ascii?Q?VaecLN3OP6dbeCEaGiqrOdcFXwsG+Ffw4HNMylNNBm5u5JOMssqmpohwwuV3?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f845c1ee-aca8-4ed5-c5e1-08dc2bb9cd06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 11:00:18.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB1u1kbdaKV357+ZwE9SJMPdmSo52JyDN3wB1gU2d7gWKYojV6MKosPyWBCFl18ST8N3ybMChQKbBPper+0TYeME7lHodBP/AlMI2UDvCg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-Proofpoint-ORIG-GUID: IEE26GjQp94EN-Zy4TOX3V74GF0FxsjG
X-Proofpoint-GUID: IEE26GjQp94EN-Zy4TOX3V74GF0FxsjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_07,2024-02-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195310

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

The issue address-sanitizer check failure arises when attempting to run a testcase compiled with AddressSanitizer on RISC-V 64 systems using the SV48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, which was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kernel to use SV39 by default.

Upstream-Status: Backport [https://github.com/google/sanitizers/issues/1707]
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = " liblsan"
 RRECOMMENDS:${PN}:append:x86-64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:powerpc64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:aarch64 = " liblsan libtsan"
+RRECOMMENDS:${PN}:append:riscv64 = " liblsan libtsan"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64 
+
+Disabling  48 & 57 bit virtual memory address in a RISC-V program, while the system's upper address limit resembles that of a 39-bit address space. 
+This signals a lack of support for the 48 & 57 bit virtual address space on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [https://github.com/google/sanitizers/issues/1707]
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] = {
+     [VM_1_10_MBARE] = true,
+     [VM_1_10_SV39] = true,
+-    [VM_1_10_SV48] = true,
+-    [VM_1_10_SV57] = true
++    [VM_1_10_SV48] = false,
++    [VM_1_10_SV57] = false
+ };
+ 
+ /* Machine Information Registers */
-- 
2.43.0


