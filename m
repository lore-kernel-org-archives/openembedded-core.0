Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E696C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 16:33:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.536.1709224412422140857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 08:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Adil4h+M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3789626240=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T7csTa031947
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=xijzDVLZ2hr0PzNMjxU5EaH6ncqwXB3UZ4ysMv6yjwI=; b=
	Adil4h+MjsgZrSD+GIJU7terdXX56O80ck7mHfgKGW2SpPfqSWx+OPP8xUlgqQfz
	SMq87EZ0N2pMu5cj5WRuQQh6keX77qodObCrqHc272g4Epp79In6nf486P4b426m
	gMy117ADn0V+vZNMX8+okXpk6UUcacCsK/waDqMCwvVM3k+9vgCMlQ4CABmJuDtD
	lSlhgy5tGQX2kPjSX6qQq1sddCIMhheiF9QbKB+kthyVXJ0b5rBzmMiKVk8MtpWy
	hbhGehbvm+ul1PpIDq5Af5f+cSOCD8SR2pZ2M7naVupZftM7Hu5fydGdr/715at0
	jQY/nkfGrAQQHmyfSw1Z4A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6dn54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:33:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtgGSKKK6uwThcVb/TjPdKF9DdfsMoXRP+bsq4GEX52CWMRauayKk9oSusUKYa6hrIPPoaHmiWgAT8m3jQH7tm5A9DhhElXYs3eRZLbN4My0DqFCdxPCaS6Nm0MXSWpS2VZ/g1MsBkFOo2keGWWulG0Tg4wc+/W9xEF/vySGDbQ89P8r2oRqxBbFijzP3H4ZR0VpJGjgwWY7vNrC9pBK3iXT1DoT49gBjtQWfo1r2/Bj80cNWWqm6dVCfqce5beH4qJNFRFE+qjUn3cpRxG3VBabjktbmLs3D80ZN+4Z8kZgXUMPLWYS9mOl5IqvoxKNbbz0r3K+7xjEx0ZMGC/qMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xijzDVLZ2hr0PzNMjxU5EaH6ncqwXB3UZ4ysMv6yjwI=;
 b=M0KiVJw1jnvVxEGNloW1r6izP7hO+V3Z2hzs/odo7JO57OE7/+Ho2zjplcKKdzCa+erRzxWwyAdO5MphOT+PKJcPpvFoCUf98h4rWqed16qFL2X367D46nvF6Bzje9+HpKYGWMb+wu4RgpcY6gDJwl6A8WBlv/gKhek+e29KmLok4o4Pp1slRIdU1gbE2S6Oe8qcXH7n1AXEVqn43Y7H/8oQ+ZJqgx87rTZVb4hH703IKehNyNU17jErPajyThbSiBxnFyFY7GvBnRg4+6xiwBKkLGM6F6cbDWdzktg8duGs2Y7DZylSmxuVTWMl2Sm0M91T8/0igGb6uPv6P0VFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 29 Feb
 2024 16:33:28 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::a5f4:d259:146c:6144]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::a5f4:d259:146c:6144%4]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 16:33:28 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com,
        Deepthi.Hemraj@windriver.com, Harish.Sadineni@windriver.com
Subject: [PATCH 3/3] rust: reproducibility issue fix with v1.75
Date: Thu, 29 Feb 2024 08:32:42 -0800
Message-ID: <20240229163242.1415066-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229163242.1415066-1-Yash.Shinde@windriver.com>
References: <20240229163242.1415066-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:610:75::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: e953a85c-1828-49b5-320f-08dc39442895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WBbGA9vNRKXpYW97X7qhCRyLLC9+F94u+qH+xhwEUENhrQZyIBx63s6ZY+jZX/nIp9BUfacGqRMPlXvuCceYgRKrVjPOCd3nobLk6rFyCyGW7sqKMIzS0sXMfKEVqoXpTr1IQicqMHj2RgjW/ZtHDrJ1lKUI41+RZHm3/hjNkaawjfboxqLk1KiEHZYqctniKiMggfeNi3in0Y2GHdGqK2M1by3nBwCfaZLA6IyT4keApvJiEkaCgOBqLw4R10cZLkbBsWKG75CCOq1k+dR35EWgaVxyryz626Ltx3dfB5C1ehQMEGjNC2kSNOdMJ3YBHmtDQnRO8QGoYoxLRk4vQ2SmTVEC6cLGOO/T0gBCOaxIrsawqARsFy+Ssc2GkQ96IBF2/KU2qHlvUW+EvIEFemgAeY3/PAqoXpXS7Np2tjkoZ6o77WssoEivtu9y4XxDEWxsaMnOK9No5rJ0INHnbWoSkIaMUJ8gG/9ckSTG79qrL/ckNJZvBZBcmjynobVp/n2edcd4cD638IZE5KZf05D1uIme3eqeoC8GgAA2YgmPWXSY+5swQG6TU9xRUKQtXzTfFnZZV2/9CX7k9fwNsEUgYaMqAZ/ybJM/ry5xsia0+57GDzzbrborB7EZDAdcc/LPT0YuPr/aAwyB27/FZyxGrLwKS8+QogI8R2lojTKgCC0NzFbBD+3WXUrwJDv/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4X1hJd+dBoLtM/ze394kPAWVmluKO7qS9fy4GxTNnwSATUpn5NWmIn4/jG7u?=
 =?us-ascii?Q?TWB6mwYn3bu1/11eqiKMoMiLEWkPTeXZu0ZzKMuu1BYPAysKSw8Oev3RTMmK?=
 =?us-ascii?Q?u3Ks+zNbOmq619PapkgkiOyNiCTKuQ3wnxDXILgbChtY/MEMeCNL+KOGzJtE?=
 =?us-ascii?Q?5YmO+QnUDSSNsWpX5JP+InXFX+k5KoZoiMdGx4MVipc598ocVcGSwDAkPrny?=
 =?us-ascii?Q?l9m8AT7sGEUf8LBdvp8c6Kh/T31oWD1cM/bVOI4RS0FAc6HuA0TVCb/Fdbl2?=
 =?us-ascii?Q?D4wWFJcGfOqD7cJY4R4w9XcwjPZgb8AglqQShRO4V/JX5j/DApdkKkunrTVi?=
 =?us-ascii?Q?b+AEFV/1CQS6+MqtHXz1VNeEWbz0cZBOTtr7NbT5U0NPAiObKG6r0+odKs8I?=
 =?us-ascii?Q?ujzI0t2jDX6lBvoZR8ntcgherwVHoaWG5MDmnrl1naFA7ly/E34WuvrLy3El?=
 =?us-ascii?Q?cPSkGgrJLvdgR26P2UAuVVvZDpObrVoWzV6cZhrcF8NdRjMvlE/CELBBSHJb?=
 =?us-ascii?Q?6rg9Vf7x6UOZWOPzOeksZ9T/7ElOU7OLtD97c//OJuXOc6u/3za3pUUmFVX9?=
 =?us-ascii?Q?UTbKVnnEKBr0QbwfF2xSFXJEtkqBXT9t8yAjGsJRRKXlHbJbI8+iKvyiKWYw?=
 =?us-ascii?Q?oq0FAJ6I3T6c4WsNxIgpslOubDyzdvdFpoGQzmcv8/bow8mGmgREVzCDaLF6?=
 =?us-ascii?Q?h5FCujSmbuRdhkbG0C0rdgJ0werYmR7o9Mmnp1/8aU2XphN25EK4ZZKptOT6?=
 =?us-ascii?Q?F7/33fFFXhYO95RfcvRGo4xaawRwFB6MZ9CQcnkLrhiRsdbm63f1tFzCk3bS?=
 =?us-ascii?Q?WZZKasRpNahtkvG4q+vaCRzqsb2cbdNhP7zyNLztxBhKndtqtNwSWnVeRLm3?=
 =?us-ascii?Q?Yz1ctr8kbQNIUKUVPnZ0OoEw2TmIUaHXSO7SSuA4s4TmLV78wgmfKiEHRVfL?=
 =?us-ascii?Q?5T1vBvMMJaCf+dzw1w9L3aJRrCyqtRjGvIJcTUSK2JV2xoqfAp6Po5Mv/wBQ?=
 =?us-ascii?Q?+/Wy04UiBb6BPeS0oT7J9sOz9z+8Zz/rE0LznXPFCiFitxjbhm/I9n+4ufnD?=
 =?us-ascii?Q?QBPiIQhRqpf0q9Sp3Kh/GxaKrZ763BuEerMsjXOozN+t4Ur9X2JcZvDdB6eb?=
 =?us-ascii?Q?teU1a30+jCTFk5hFnBW4bOSf1jAeVdfhp0V1EedIbx4oNIO8H//ZkgRGdURf?=
 =?us-ascii?Q?fKkRTPrpcV9S2k5g7JpeOW5g66oXeBPQzg2GN5qp+02Jyy8cLVRXafxguIrZ?=
 =?us-ascii?Q?p9cfF+mQVL4tzRzor2Vdv0revd9Nx/NiDDB7ZoUMiiDoFIvrGBLKNSVnD0RD?=
 =?us-ascii?Q?qC5bHn4cymYcqs9V7TqHdY9GsX4Yvvim0wCvezOwX2C0Xw4eb+fSl54Ig2UA?=
 =?us-ascii?Q?R6JztFQzigesE+FjGEjet7KdbRyU9rAForcxJyIC+vnK47wDvDaAa/iwhod1?=
 =?us-ascii?Q?1LDVE8bUyNs0XVHojS+uhdjS7kQXRN89paCKMBjJp21kCC8LH5psh3a41Fyl?=
 =?us-ascii?Q?pCMv5Dimqk8WkdiPTiZjfMwXaePiihv8hCJGJ1ijI+r89OrOBbdTVyXQusxn?=
 =?us-ascii?Q?92RCpSPLk5k/YT4+esSU1zlKmzkUKDd4vNQI0HgRPKUuO50CJye4OBKVMkYZ?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e953a85c-1828-49b5-320f-08dc39442895
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 16:33:28.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PTYCJS8icsR4JTJgCrIMAYeCFbc6U15DrXtrxvpKb1hOsw0phl8gGu4aZTaGqJowQdAiUWaSknOCVK3YwxJ/84sQJdBSscrsU5XZ7dJfM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
X-Proofpoint-GUID: 81tbV7AZKnEUaSN3hOEWnof54Yk1Yisj
X-Proofpoint-ORIG-GUID: 81tbV7AZKnEUaSN3hOEWnof54Yk1Yisj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=883 clxscore=1011
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196440

From: Yash Shinde <Yash.Shinde@windriver.com>

With 1.75 rust release, the '.rustc' section of shared object libs are embedded with absolute path names which is casuing reproducibiluty issues.
This change will fix the path name format back to '/rust/$hash' as in earlier versions.

Below are the links for detailed bug description & discusssion with upstream rust.
https://github.com/rust-lang/rust/issues/120825#issuecomment-1964307219
https://github.com/rust-lang/rust/issues/120825#issuecomment-1964652656

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../files/repro-issue-fix-with-v175.patch     | 23 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch
new file mode 100644
index 0000000000..6840bafff8
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch
@@ -0,0 +1,23 @@
+rust: reproducibility issue fix with v1.75
+
+With 1.75 rust release, the '.rustc' section of shared object libs are embedded with absolute path names which is casuing reproducibiluty issues.
+This change will fix the path name format back to '/rust/$hash' as in earlier versions.
+
+Below are the links for detailed bug description & discusssion with upstream rust.
+https://github.com/rust-lang/rust/issues/120825#issuecomment-1964307219
+https://github.com/rust-lang/rust/issues/120825#issuecomment-1964652656
+
+Upstream-Status: Inappropriate [patches need rework]
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/compiler/rustc_session/src/session.rs	2023-12-21 08:55:28.000000000 -0800
++++ b/compiler/rustc_session/src/session.rs	2024-02-26 07:29:15.527577022 -0800
+@@ -1269,7 +1269,7 @@
+                 | CrateType::Rlib
+                 | CrateType::Staticlib
+                 | CrateType::Cdylib => continue,
+-                CrateType::ProcMacro => return false,
++                CrateType::ProcMacro => return true,
+             }
+         }
+ 
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 8ae8add495..6bef99039d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,6 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
             file://target-build-value.patch;patchdir=${RUSTSRC} \
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
+            file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.43.0


