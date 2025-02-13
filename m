Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BB4C021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5002.1739426420616419109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139e44f67=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5OBsv022595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:20 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jkp8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkwvzZEX1BYZo63FSC08gX/S8H7RCrNNPhSlo/NiT63gz0+/N2QgySlQiDrQdp2u9MhM6P0cwEYiQHROXN9bzgAuNX/inpFBhvHugdxDY2U+mTNlJe5DN4/k5gSiI7Rp+vDeGkLiFTnYQLTAmKeUBMaTZpzOuZwLk0SZs6Q12M9BhsdE/HzlqDpmJ8kUnrWAkyz5jhzT4KNI2bgPlcFNMh8e6sKz8xG4Pe9yawlX5myd5TMNjezqBE5iSMxVF0wYTkY6MWkG8clFQZvQ58Ji8jRaQdzMb1ZMEgOyB+fMvo8TDTvNU5C2suBJrTtPtwoV0Ae1a4V1Y+UlVnpP9PV82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk3gjQKOXRZZg+xiR/g7rnJs8nhzwFSBdqjJpNsWmYY=;
 b=hp8++Jf8ShBpJ8QYooaBMM6e16j2hNU4VYBnlIkCDhM0hwk65rKtZ/YpbMJONo567QTwqNKsw6DFWrdNs1Y0EuEzswArFJJDqZKW5KoFiLeL9V/oOlltZvw5PB0eMK8cl5ab9y1p+45klH/d/MdWqdg92ndW+fiF4DrOhR8GvUmA5/JcSfyfGadQrrxDzBP36CoV9Opi1pvT0fRHN2gcY1lFTKr3nzbaY1Rxa4mUpDjCAAZU3UUcxf5tfDIr/EBnvc2YYMopjbNQUXsPP4YQBonm3CjU2O1Ih6dyMRFQP18EQGQbvoGiWwZV/jB2fGsJh5iSPcZElSmAS2ztMsWprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 06:00:13 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 06:00:12 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/5] shadow: upgrade from 4.17.1 to 4.17.2
Date: Wed, 12 Feb 2025 21:59:57 -0800
Message-Id: <20250213060000.1092285-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213060000.1092285-1-Qi.Chen@windriver.com>
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f2c2e3-c988-4c90-321b-08dd4bf3add5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cWKj1pFFSMjb/qJp9OUkckic5Z6hS7OPyiWfRKu3HpEjLZjpizHPkrLRzy9Q?=
 =?us-ascii?Q?d4jGYlR6bCuNbSi9svWAs6H0o4Vf9Fs9fcbSwYguvQ5Xu04M3Ro93EMfRxIY?=
 =?us-ascii?Q?SegMqonk4TQrRrkuHzGt1zaregkw0wC2e/TTU3C0pidqt2CsGhcuWjOxEAWw?=
 =?us-ascii?Q?Oqt8WmryJdmgrj5z5gHCVSEq90401hX5y/EXyRdlnrpQQ41QZW9A1UIc/FiF?=
 =?us-ascii?Q?x10MQOg8yf3JtjmL/WMHsxO4pMdNkfnH6Gnv+qQ+xs0xsp/0WUDGRm/TXB1a?=
 =?us-ascii?Q?4qG1i8n2SPgt9B7p3vGSKhAJdu0d+ol2/nm/8XzZHtdZ1gG8YMQdGj0bbHC3?=
 =?us-ascii?Q?9Am17u75qHW1XVwnahsrYzeJGVkZpl+1xRg1pT9gx1nzLi6eRbXU9Bjlc6lj?=
 =?us-ascii?Q?VtjHtVR+Cdttw0+ex9HHLTmn8OVB1QzGVug4IK8FWqjg/t9gWa0nX4lyrUfF?=
 =?us-ascii?Q?9R024VaA5gHldck3oSOfX1K/OZnEHqq4UBqANybTX8SbRmWbAbQ4S1d+AKVr?=
 =?us-ascii?Q?BCTjyZwL2o+NuN3m0Tqenulhi1W/zf4nbiCc/YmYxMTt/U/VRgJw6hVkq7Qz?=
 =?us-ascii?Q?babQb0EoWGRYpVKSA3n9p2/A3Ngi7U79zZOaOxW/pzoxMPFBazqDgbb9Ey2D?=
 =?us-ascii?Q?j/WsG7jlzxa6hhH74YqW157wQOrV/Tdhx+Xb4TqF3GvEm8pp11nLgMZhGiWl?=
 =?us-ascii?Q?/1kr3679Z4BrPGkNNkuE/wCAdF03LAuUIvmLaDhj11S8OQ2fWRvYKTVSCYJf?=
 =?us-ascii?Q?8DeobSIP4IIQdvuEdJh/OlO1dxzAKmShuKHn4D4jVHA57Ik0ocNr5hDFl1DX?=
 =?us-ascii?Q?uSvi63bHHw4gTWDpLqDCIRdfMgqY/OmVPxKQD6mQjbyc1pbQ0MEMvnemG+bz?=
 =?us-ascii?Q?oTq8jGGBPlXN2fz5Z/2o8YJbxdDuIoL09r7dtFG+/uzRALB5JlbTHBmAWR7o?=
 =?us-ascii?Q?Y51jmrPN3a9S8DFwUF1YufxBBqgl5QLs/2aQx0PO64a7wd2AB3KQ5OIaf8gl?=
 =?us-ascii?Q?E6odmwUJpm4lY4BuQRg2pwB8h4C6vZdg4a0Qe6XyHEhnAiBrZw9vx3rEjydU?=
 =?us-ascii?Q?ruHLJNqLA+CyK9gabcC5M24RvWyBw0t+A2g+SAyojei2clX4ZCzjxMrm1Kh5?=
 =?us-ascii?Q?ersaT1VQ/b1tBPBQ5Lvj9F5GBSayzXWJmhBeBPX9JlMHQFQyVc42I9VypzX4?=
 =?us-ascii?Q?0QNFnRpKKoKN4s+r6HADL7Q661jyLZVCkT3H3+3jTX3Csf8JtGPgx1sBmbaB?=
 =?us-ascii?Q?pr5pMGdQJMl3PR1B5AN4+TwrR8ZkduZE1+2RMNxxh3XHlRu00n1uwWvFUjIJ?=
 =?us-ascii?Q?8d1cPs0n3fARHejowhciYzTLkfcgqtRLWHz8hlXrdGEeOpvs5L0Wx93+JENL?=
 =?us-ascii?Q?eNaOojPqxQUcr5zLWn8rtItkgNQdn/tdAQXndfz8m2TX0xf9ckyfobHx5NQC?=
 =?us-ascii?Q?YEYdXju5Jfq3wIoNSqVOfPTgjROMyu3j4pXF+AkgmcIF73GGHYsf9w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ilrClWoSyMrbnoi2sbNRc3SsC2hpYxfJfQHlrYEej00ILGP0Pk+cGsY4oN3s?=
 =?us-ascii?Q?fUMAZqCLRYtSpNEAz4oqDNbGeDCIg7PV+ZerxsxY1GL6VpHMwpbocPoINqkv?=
 =?us-ascii?Q?ffO8A0msjIdcZES5kXIky5mqv0UuA5PfcnK+cTNN+rAyQYDkcgMQypYu0Ll8?=
 =?us-ascii?Q?p+fP+urKueVVicMOA7poqnXA+rBCB+RvdN93oCmFHDu2Cn5rjW72Ju9Js1k/?=
 =?us-ascii?Q?9E0dPwJDA005Bj/eBX8S+Y65/FUtVXYOYnxpDdLNOrFvkwdZDcZdivucTf0r?=
 =?us-ascii?Q?ZUGCuuFFlDaFED5JqZ3rN8SKffE+SeD6Y6kjH+JSfFudzaAC5BsTGoV7fLI4?=
 =?us-ascii?Q?lumEjjSp8+zR9O/5qP96hi3JAz2jot1iJllxUGG/6VWj6MIoT9ekVyX3C84q?=
 =?us-ascii?Q?FyMP/AlxOVbTEykGpEEVj8hl5bUJP9G9beuwJCQcaSap3O9paM+f2fyfIh20?=
 =?us-ascii?Q?5qP1ZQvhdP1ABTv1YgWCmNyEv5VQoN3UyisSmDr3h+rZGbreiqV7WD5aumvz?=
 =?us-ascii?Q?ocJ4rD8/T/etDVhggWmw2zW4NTscP6WzrQ9bG37TO4JgN3euWxeEWXfIFsRf?=
 =?us-ascii?Q?n8p9AjZ6J5GYSzx+s3nK9RJWYtRCdBOWdWt/6MEjScPalxwo5213XyylrIDb?=
 =?us-ascii?Q?8KQI7nhdEgZ8z3e+h7IezDyzkJh4i8zObXgWcR4ooWkvvXONg4i313uKurnn?=
 =?us-ascii?Q?yyONxYWF0XlCf4oQTeJ5lBto1gCPG7TazDpls/BEwMelEYNuOOyRnFtXrk2c?=
 =?us-ascii?Q?yG4Cmqz3TSOoAvkjUJPW2ArK1E+0y46/cvsOxbMolAf58J3SlDnRkHdjGCGF?=
 =?us-ascii?Q?CZ56lx4PT/T4VxiTR1H97B9aoD7En7liy59FOSj4/bK5sppxnT2xr/k5u8vo?=
 =?us-ascii?Q?ovKdhzP8xr1Rw3qiv9slqvYUfyUPiDenBA6Lq0fBxmcQh4+jcOvk2JPM9Csi?=
 =?us-ascii?Q?hbBlhJ8DWbC8rzMVWfemJzSB3uMmzBGTXO5GTEEd64q8kGS1NXoxUYVuhiAE?=
 =?us-ascii?Q?//T2/QabV5eI2kfWc3vXutgMN4rhbd4arFH8sew6sUMdZri87J9+Tytfaj2p?=
 =?us-ascii?Q?dN809vBgg5o+eFYOT6e4ZWGy7K/tv0sADK5JIZCJkmOCIbS4T0JtNbcRcSTb?=
 =?us-ascii?Q?gcHwDs6Q5v6RE0em7cWQFEAWoenNBnwoceF1s0jXOIISKXJd52KdwQiojwSq?=
 =?us-ascii?Q?B1W2TXdiyB5fBsEt+q3YgOXmIdaVSFWeIjTj51EFdkgWUUCwc0YAO9qcitVU?=
 =?us-ascii?Q?oez+HHbyzDVpPfW35d8VJaKYbJhiLbk7JnInQkgIKBROlPqCjok5tW24spIt?=
 =?us-ascii?Q?Fpg64V20IyN0tPd0w1fh/mJesx7C5sAXsdir0aZgUn7cByrQA0YtDVkkQEYx?=
 =?us-ascii?Q?PsRLct1hw2iAj2xQx3OiBFtCAfIf1MSNbBkpOLUTk0fWBee+hukqF3bHGk5y?=
 =?us-ascii?Q?dP67lVu7YXnP8hnNTPj8tcl11VV5e26iO9huS/JqMMvtSF26Be2AMO6Yt/ZU?=
 =?us-ascii?Q?spOMonKPYIddCb75UqQd9Hf6uURslqjjtOFqIjdcrMjr5K9aX1kYrK98b1PZ?=
 =?us-ascii?Q?VD6cG2EUz5hnsuq3WK1ROHoYdeS+u41Yfj21m9X0xPXoPnbvEKQh3/pVuDas?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f2c2e3-c988-4c90-321b-08dd4bf3add5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:00:12.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE1+dM3Im1DwTj29wwmELISPB6TgbnGcIXFI2kUyr5ILGosZ472D2UthDNLPEV5Pgt5zQHdBWqwHBvtEd44kSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-GUID: FbUsEqqZTtLW2Q3EF98gXumiRv8hyOxs
X-Proofpoint-ORIG-GUID: FbUsEqqZTtLW2Q3EF98gXumiRv8hyOxs
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad8a74 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=RNqT8wjk3f1p8UlrOW4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211296

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade shadow from 4.17.1 to 4.17.2.

0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch is dropped
because it has been merged.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-use-C23-attributes-only-with-gcc-10.patch | 29 -------------------
 .../{shadow_4.17.1.bb => shadow_4.17.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
 rename meta/recipes-extended/shadow/{shadow_4.17.1.bb => shadow_4.17.2.bb} (98%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch b/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
deleted file mode 100644
index 4e2d3a89c3..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f2d8d96e8586772becd68593a5bd9e14632841af Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 7 Jan 2025 17:03:32 +0100
-Subject: [PATCH] lib/attr.h: use C23 attributes only with gcc >= 10
-
-These are not available on earlier versions and builds break there.
-
-Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1172]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/attr.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/attr.h b/lib/attr.h
-index 02c7e252..290514d8 100644
---- a/lib/attr.h
-+++ b/lib/attr.h
-@@ -5,7 +5,7 @@
- #include "config.h"
- 
- 
--#if defined(__GNUC__)
-+#if defined(__GNUC__) && (__GNUC__ >= 10)
- # define MAYBE_UNUSED                [[gnu::unused]]
- # define NORETURN                    [[gnu::__noreturn__]]
- # define format_attr(type, fmt, va)  [[gnu::format(type, fmt, va)]]
--- 
-2.45.2
-
diff --git a/meta/recipes-extended/shadow/shadow_4.17.1.bb b/meta/recipes-extended/shadow/shadow_4.17.2.bb
similarity index 98%
rename from meta/recipes-extended/shadow/shadow_4.17.1.bb
rename to meta/recipes-extended/shadow/shadow_4.17.2.bb
index 7c89062646..5459d4e57f 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.2.bb
@@ -14,7 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-           file://0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "51a946bbce141c5de14b6d47cab167206cd685d2307e917611dbc1be46c84a18"
+SRC_URI[sha256sum] = "064a7c048e613ef5b5f3613e137d79d35d062ab434e89020f743e90844ec5c4f"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.25.1


