Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B58CD4F56
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5924.1779102229449400394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Awbo7d/t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oQuQ851963
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=; b=
	Awbo7d/tLxGeDYbrdWR6en2vhth/skf9+jwXzeKkIMU4oFXzIJGkEV0eBfvFOkTY
	50SSe/23K3pyuehDi82hEftXYsgkW1fp0DKDpwXR7ZK4RejrOB/FMwE5pg1q0GBx
	b5YOtbHj0qERky/vqt+MhHomvLA7Q/nnQ0EmaQ8DDkuxbxX5TEUOcEGan6PS23ce
	DTkTey3A7t78L9kwHLEFbCPtpimwiIDxIgAoH65eXdxr8ECdx3r6b0IW8GpI46Py
	mCsXAxPl8SR9gAsqC65bjTnakinqWP4ypq4h9J1bTT7T5/4VjSsX4yzOZAuAfRVW
	wqSlxlgWSj1Zl9BycH4edA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9pgk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRjXq1myYf5oE/sRjnv6gQYC7JzJRZQW3xcoDHGLa9xtPHzTTb+RUREg5hWnmtg2xstilmBEsRqvqCqwUpPme+U7ehgXpNlrhVwLlRMRcwqSSBcoqaET2yGgDMoLScqAmjdDcf224IGbvODtvtiZfdUm94WreMfTX0T11l++b6qI58K68bkdpipWrY/ayQprshawmhw+T2daFy5Cke3mLonPCnsykoDE55k2SEY7jyYu2f8JpvoewfvMeAKfymjsn7X2k1+DYWzUOXXfkJEQuVIujkha24SZ5R4jjT91vq5QhmoR68jjdztxYCvy/4IAhdcSdxjdeZrqfFrUTcALIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=;
 b=LHkxXuxn1FJCVPY+0y9gefVLaU8V4j+nuKTmJtvx3qi9kTUP193t6LYYCKJQYnhckzsGhZqF3Myg+6Q2uCMOVbOcZSN5VZpQtSrk86uxOjupU2/UXlqfOW/Zdjj7oHC+DMMMaOfbGvVTHNDFbrP2oQir7Yv/DyGtPAOOGW1K5zYVfiplV0oz55Hu5e3yYN+nSpwm8vheEWFKtMQWrRBnpGnw7eMPgSuH9RYe6OLluyFz6IP7kqGT7lRjoLWQYRjKiAQsnPLs6a1ms/IWpczRpxZLGmzqYaMYy0yQ+j6AqyszoYcUzqvW2jQMvdWZbLlEdND8UsA8xN56v9yk7/Yg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 11:03:45 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:45 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 01/12] piglit:backport a fix for building with gcc-16
Date: Mon, 18 May 2026 04:03:16 -0700
Message-ID: <20260518110327.2347543-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 86113fe1-5fa1-452d-e765-08deb4cd2177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|13003099007|11063799003|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	H070B1BKF+dhgVj7muekP2C61L9vwN6BRUPJg3psyaclYmQlXcFCgfV9ZQhlnOQou0js9CAysRPGSxSsZvcEO9HW2xJ53hge6ecqT719Yru7JHIQxS8wiLv1xSuetFIfw8eoBhsHikqtM3EB33Ogmm+2hhvxZWPYiE15E8CcigSBEZnRGzXzxNr4HYxFSS5dp+zYqcqtBXh2nVkrhDCm4Rp1ZUgnsFIvdJNr6D8fm8EHQNYKSp+YGv7/fohPptWWeLunGDERpGQnu+R9E063FaGnVjl1Wd4fp5Uo0qLlafmRbHr+LzUFhc2UnisRyf1BpGNdlMolhIEoJOQDqE7lKku1Th8eHnvCmp81fg20r+M/qmcnDo+I56KLQ5WqxUYtzCOZo/TtVSLt2mp5d++b9kLNM4eFl0QuV2o/Go5o0oN7dFuu//TMc4cD0JCETYkz+cP3o/+sORiCgg9t2otoPQzB6rRpqXjTmeLFpyHqJa+iNjOagURholW/9HnaVy1HDtmBJXBPNDQHp798nmdr51yE5ofdSDI9gwDFcFGRo8ek3V/N1sIL5dxcfRbF9fb4vIsDW8dAKC3B60/ya8T6rgLmKASI2DCN49D0EBYyADoka0fFYXcFBxQRHAicR3e3legrBhuemOLx25deG4r2cjnMH0zOzcugIT0Fob7k+OUiBnfoQ7wYzbXL5tSNKVGftURcOiKACnFj2gPtU+W2PA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(13003099007)(11063799003)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ajq2FNxCZe4mibPAXuysX1VPcX6HTV3/R1s55cTSNq+Ou/8yMGOzytoSJRbL?=
 =?us-ascii?Q?yHzweLND64LhwQhRCLbCUijcvLnwpUrWB+HjHQZ8eITSvVrmi9N7j6unV6md?=
 =?us-ascii?Q?0VqCJsqa40jeUhcjugQ1etCI7HqGOv9A79vWnQyVBJV+2hNNG5kfHfQorm+O?=
 =?us-ascii?Q?JIPM9xbMEJeViKwLrK2isvkYspUfZFfraj3iFmO69r4TTCrWF+g3XCkzWasn?=
 =?us-ascii?Q?bUlUZQKTo30/dHXjeDkmdN+FHg99hKx4oHK/0Zz7fwEqS3d0avM2N9Ykzh81?=
 =?us-ascii?Q?bhPosjFB2FYB23NuqWN2XxwPntWX/CndQN5C2X7v4wvJzbVNHeSbM7jGrVZu?=
 =?us-ascii?Q?TeVVP8BUA/Nst/M39AyJarp9+pL76nPHiQx8oQ4Mr6cfE0u3wdR6d0c1V55X?=
 =?us-ascii?Q?wQWkRtVxrGGa3tnEk9JpdcB0BUPjK98NupIN3mY8yTYadQDdchHlg1RSLgs/?=
 =?us-ascii?Q?pDGBPaIwzGUvZLZ1b9V30CaAq7GO43qWYOuSi2eTbVDKOWqzef5zN12a2Qff?=
 =?us-ascii?Q?IV8mUvdO6bK7WD97pKJJvkcqMUY9EDKQ/X9dYYrEzMGodncSVVLj8cDGmfk8?=
 =?us-ascii?Q?xUga+XFPj0xBGvnzVu4xvx7v6m4wpTM7P496UVemvWTM3ljsumRnbwRrZUnL?=
 =?us-ascii?Q?HfmyIRsFqvuIxNSpRz/4E2u7W2PKuFD0PViuQhKzbeuytRlbBFcho8q+WMeH?=
 =?us-ascii?Q?Jxzlt9MNkHl92xGAbJ3G0+Ryk2kAi1sEbc7j9Vwinl6uVhIAsoDwXIcGj05I?=
 =?us-ascii?Q?UGYscv0tjMV6t/sYpU6xVpXRqZP+Iuxu1lqwYO7/Ou+reThIq9U1P4aO6eAf?=
 =?us-ascii?Q?wj9WeZ/mjDiHjU7pJkAz/qXVYm6Mz/IfyzYjKo0Vsnxnsxn7548fZbO2OOWc?=
 =?us-ascii?Q?5W2E2bKL6zjLyX5CygGHazr5LF28kkYhLd0X79R+9nr8Ot2kjxLpOD4vA4Pf?=
 =?us-ascii?Q?Vj3Pl1GS0Yfyubtqo39tuVVjzwvsq+6o1buGl1qoSZZdEern0bGOWOx8sq64?=
 =?us-ascii?Q?e//B58TExvRRHQ+dhKIDYIQ600rpwtka3xuk1nCwdZFr84KmELPlT+Jz1MBJ?=
 =?us-ascii?Q?ALcequc5pgRHB+UV2wN6rfroznFwCn+vgsKH+PUPewcw+SDAwbJxifuMBkMm?=
 =?us-ascii?Q?EEqFx17bI719IYvpPZmBNm3HeXjqrz/PQqBwccH9WqG2H97jvuVN3ZY7PEPu?=
 =?us-ascii?Q?qUvUL2qMMxwxFZPsPnLmCRiGteeTUEteVIr77P4j3kVxPrQ0wBzLo/ieyY5Z?=
 =?us-ascii?Q?H6nRfUmZh2UhWtca46E+fXWkPo3o2Vma0qD3VzazoBVJ+ruYimiVSXpBUrU5?=
 =?us-ascii?Q?Mdy+4iPUEwiga39qYA++niumxcALb154GJ2mbkOoa63s6H1oPB1VK3umh1g5?=
 =?us-ascii?Q?mwBJl7mJxbblLIaf994c9Mn3FqRVXZUAATEv0Xvzw7GMd4PEJ6x60JcmWTYv?=
 =?us-ascii?Q?b8dMZ1CFILHTNs/dCsKVlaoA+Yw+Gq8XZeSt8KdJqGnuvaNTbf5chUNF0ULn?=
 =?us-ascii?Q?kxsvEKnxVouskwHODQy+mdo1/ocLVes05etCJ2+qzRdZtnDGYSdm7z8XKdlQ?=
 =?us-ascii?Q?mY+n/96IZbjoKK8dvMQv/eL/9aImmpkH1DGBKzgXOVBaD2YGmTnjOvCUzw7F?=
 =?us-ascii?Q?VZ2DXXRtkJjWR+lw5trcJoqkBKYWeC42+UKnoJS71YWvXn8r448cI4roLwJv?=
 =?us-ascii?Q?oSzsb/xvRqNalleLIm84MrHiz7VqIp5F1BPhyTwWWAIzvoKNmU97Bj5GHZ01?=
 =?us-ascii?Q?AYiAHEB0Fh6/hpZUrrn1X6BpXMo/Eh8=3D?=
X-Exchange-RoutingPolicyChecked: 
	SeWYJm6H35kB7YzrztaxkYYXdUIHKLGXej/hI89eMN/czvI5KPT4uceI5nV51p/m4v5OCHAm4S7BkK2onqKtmLAUSZep8tCX7QFuuty9fs799oUAkPJzHCaELVCOD3QHvQWzQyGdMQyc0u6FoR6EzuZx026fPKJlct0/63pTtutX/yzKQCpbs1hX2pvoNFQErg0gx2vVVfDbkKF+rs5SPZgQ6c/qKnP5Mi6weFUTlXslWs/q1ztXHafEXI0hn0diTCjI5llnc9NnkyB5Rdw2rlqq/ZR9lqqzrmK7DQ/pMLb2IUOGmIRtXmx5yS+3kn3j480I7rkOBWQz6XOJjb+r/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86113fe1-5fa1-452d-e765-08deb4cd2177
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:45.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtBi9IkX255xrpPitNCIKR9WUTxC5hsfXj3dcwDNR9qjRHGsI2xdAhWPvtYvkHhdAhrF0vwT/rn1LSqSjC0IcuSa9hPOpuTd7ogodyWOuZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: GwIZ3cFBAKxShhAfbHbmfBVElN_eaxqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX4ReFFG1WQVOB
 95Krf2J1CqRfyVf3rPsyDjpki3/kKIUc53p+yB8XJ4YSDyHNM/y35nsIbxMnBN9YhbQqFn2KXXI
 Zrk+mwgWJChVTdEvjqvmn7Q3JcRmkDSeCfji5YaxbBfwYCviVUu9DclbdVjMartHvqlO4mMKmvr
 32BxLYOJLGrEr5LitRYP4wTSG2AWrGbH1TKF23s1yo0/sEZwRsyLm/3jreQhXJgQ/JQ5dTwQ+Lw
 NyVrjCwMRyUnVi+09NI8CzcW/hpGYTx3vYALjT8CSGuCOu0wX3BI77mweNHmdLjlJ8m50NJDs4y
 MTxqlTFQjo8x7y+58A853v6vtyszqIEZMFcgOSKRzMdKn+MUapr2atPD8sPkYcMQVaIJW+yVpqw
 lEN9u8tjgkmqSqR9fpgHxdii+PTAwGkQBP5lL0sRGD9jVA5uksjmHBgSzTKUnxopP6TP7mxgFqM
 iFeSulUsnf/VQWXCG2Q==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0af214 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=0SOlGnYWBby2Ja47d9QA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: g0Li-9TmfrD8GXYYCacM9FLFKYjZ-wKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237221

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Avoid conflict with C++20 std::lerp from <cmath>, which
causes redefinition and ambiguous call errors with newer
toolchains.

Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...h-rename-local-lerp-to-linear_interp.patch | 46 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
new file mode 100644
index 0000000000..05f1dd687a
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
@@ -0,0 +1,46 @@
+From ec0fc2fef0755b1595c3799ab25129174a4b2007 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Sat, 7 Feb 2026 18:39:39 -0800
+Subject: [PATCH] fbo-blit-stretch: rename local lerp to linear_interp
+
+Avoid conflict with C++20 std::lerp from <cmath>, which
+causes redefinition and ambiguous call errors with newer
+toolchains.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ tests/fbo/fbo-blit-stretch.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/fbo/fbo-blit-stretch.cpp b/tests/fbo/fbo-blit-stretch.cpp
+index a83288c0f..b0d362ecd 100644
+--- a/tests/fbo/fbo-blit-stretch.cpp
++++ b/tests/fbo/fbo-blit-stretch.cpp
+@@ -173,7 +173,7 @@ clamp(GLint &x, GLint xmin, GLint xmax)
+ }
+ 
+ static float
+-lerp(float x0, float x1, float w)
++linear_interp(float x0, float x1, float w)
+ {
+ 	return x0 + (x1 - x0) * w;
+ }
+@@ -181,9 +181,9 @@ lerp(float x0, float x1, float w)
+ static float
+ lerp2d(float xy00, float xy01, float xy10, float xy11, float wx, float wy)
+ {
+-	float y0 = lerp(xy00, xy01, wx);
+-	float y1 = lerp(xy10, xy11, wx);
+-	return lerp(y0, y1, wy);
++	float y0 = linear_interp(xy00, xy01, wx);
++	float y1 = linear_interp(xy10, xy11, wx);
++	return linear_interp(y0, y1, wy);
+ }
+ 
+ static float clearColor[4] = {
+-- 
+2.49.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7659635062..0dd9c58714 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
+           file://0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.49.0


