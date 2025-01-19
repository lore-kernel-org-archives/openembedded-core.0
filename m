Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC990C02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 11:06:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13647.1737284785155819105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 03:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311467406e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JAh2xk027859
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 03:06:24 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4488f70qyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 03:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiARwQunfn3PYvVmNgAXogziZysJ9Il3g6On3uT7B8+ki9OVKlRLJD9tMBPzBXzddul/NxMjYEPBk9uUdZkbma7feJcnyEmfhOQnuDBGUK+pRPwm9PPtk3NcskbRUaif4Eh9TNDjvtnqCxgU2CmPIB3sr9p6c5U/IFhyJ4vgJTxw5ZadRsbfZ4dbEBjEIQbVIuMK+zXCT1S4ry2eGoyrgim1/ejcN26PB6RPeK9uDArOh93lY2vQ2rfJZ9apdz/KqdldFx4s/NduYaUwbXdSm0at78T4ORuV7Fdosh1reGRTlt7tMhxiDx0FoqKj21FHln02+aJAJc74kteJGDiYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5taPF7/6WoICPMy4ac/6SPSJEAosVegKJT4ENTBJgk=;
 b=ZCK42X/J5zGrP0d8fMlYAENusRJ75hJZqmKHBN1oVQbRDV84CXcauN66VCoX516rQW9uEEd6sq9hkGutGi4noAN3N5PCX4lXRQ9ZFv+I+dz0MJIOqRZtpMpqfeHXjGOp5sk7HfKNcVh2/gKILS7z78ju+KODehE/LxpeF/eGquWI6JZG2UpVkgse4rvDFcvWi2e/J2vjvq3MZsS8scAfOaunFaUki2anuGVjMeYCoSp3XzDytrZUWse+zHlFSntoE70WUZ3MiBJyiYp4JeurK+6lI2Z190n7JDLzd5LnSfRZje3GXA9wm/Q/8o2RIl+cDrchd61ZdyhIz2l2J7eMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Sun, 19 Jan
 2025 11:06:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 11:06:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nfs-utils: add PACKAGECONFIG for gssapi
Date: Sun, 19 Jan 2025 19:06:09 +0800
Message-Id: <20250119110609.1669802-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0231.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: f75cf3c7-40b6-43b5-515d-08dd38794ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+HF9sJ/7cvpuPnkXvViZVw0mjLe+/90l45M64ksM7tqSdd4XQplaMFgf3wZz?=
 =?us-ascii?Q?EA2oDqf2J8wI5OqzwhwxswnXjQyyvw0d4iftFRFb3WOTWGH1/JCopM0uqV/I?=
 =?us-ascii?Q?4XCI1dHbNdTK2rv/kgEObMWNRV+QQOUlXvn4/HZPTDbB7atqm3QKfGOnTbiq?=
 =?us-ascii?Q?VUgSsdIrQ5xV+8mVhjJ1/lYsVpKpmDGwlIQS8vhAVP8/O8E2V2S64S7LNPIF?=
 =?us-ascii?Q?/i6HNfpUoMoJ06c+Vh1l0iTs1L3raKqPU38EyjESdRysiEqWm/Uc8LoS8LBa?=
 =?us-ascii?Q?A6ySmNYn1+80gVRtG3iK3u42RYY7AG5yK33h+ok8qisYkg6RrOi0FblFhASd?=
 =?us-ascii?Q?vycLHoX6TGv7xxhIrhkqFrXnv9YKn1f4ezB0hZTnbso0nifK2sOTsC0uZj3v?=
 =?us-ascii?Q?Gucn1unKrPluYzWyaPQ/uKpXnDUkrMUJMzVvhsjd0B0iVCncZFlx3ym/YW4P?=
 =?us-ascii?Q?g6i4rJagwGv27u21frrfZ3tvHGly6lJAuNxYKW5vyP2Vxju0afKh+1Oqz01/?=
 =?us-ascii?Q?upFMXxVL1aOYj70E3+SGElTBn1ZJhEFuZpv1fLlW1lJCrqlC6+IBYIXZ2TE3?=
 =?us-ascii?Q?Pwq/Kn/Xy+m2nI20+sFYuhUVtbRC5l+D7MTqY6wr7uE0AzrBj7J2Uz/dh+YS?=
 =?us-ascii?Q?oNP6vl2lJ1pwKpWPbsI14J2Fs5g++z2FhrK+JsBdSELo+zYDmiWetWRYnWtk?=
 =?us-ascii?Q?tSJfXr67UzwNAGq4u9joU7cAEuqwzDkqYtioRcws3fkkh3iwe6UZWLM+gtBC?=
 =?us-ascii?Q?K875CsuXe6KqVfHGRJzXwmOo3/hC1+ivExyODvNL8m2z2x0HUX5WgzoZrfH8?=
 =?us-ascii?Q?Mo5sqHBEPJQPPIYmpC+uTYC8aRNbIRz5a+bu2UIHeMY8VipJDcyO3pxFXCnK?=
 =?us-ascii?Q?ziNbkSv0xwnepgzAO94DYKDC2AtPwmsRL4BGVwkOBGY4xMlbM3afAGiAV54o?=
 =?us-ascii?Q?mPeMuuz2T3jow2oxtPnvCQx8vmFBZAFZfSA5IyfKLpefxIkQYrK1WyAdAKaP?=
 =?us-ascii?Q?qvzNb5QaBj6fcH8bRPNGdAbaqhGT312ULatz8hmx9NNbAE34nRmz5U62Br6C?=
 =?us-ascii?Q?wBomOuFou/FVl3fQYtFqVMdwHz9kTxFcHY9ZQrLrBXdORxBRNt/oZtx2/0zp?=
 =?us-ascii?Q?qIOd4segswAFyjjnfsWLqy9orTgmqzP3lL05g9AiWJpezRwjnlG/BUXn00XX?=
 =?us-ascii?Q?E57PsT6tFqbdifklnO+P9aIXiLoSRhcrl65PUDGUxX5xCGJVyM8T5c3v78S+?=
 =?us-ascii?Q?6GYYV8AIB60TVhm9d8bmh6aAwjq5XZX/N4jShgYVh7kSsShH6anvbF92LBk8?=
 =?us-ascii?Q?kQd3DPm6i96+IDit4S3b41v+CsO/xxSWQ6VSDDguN5nV/u6OG4l9kl9j54A3?=
 =?us-ascii?Q?qJ+/GJN/ttoCPmK0sJbsYhOSsz6xZN3VfQlJyaCuUv7L4x3oxlBX8iC4j0DH?=
 =?us-ascii?Q?8d/McBXMBi//b6h6DelTu+iVGbOspjBf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XGpuCYrRnktgaKqlGe7GdwOiAzYJHtEpqd45UEcfRL9KndTICMnLNURccC2N?=
 =?us-ascii?Q?bDzFT5IaePzvVPXxexKeKpnzTXRwzi8hslJrEAnpC+k0JlBWDpcUEdw6Pgxn?=
 =?us-ascii?Q?V/D5PJxSQATX34P6sGKJRKXfdtr96cA5+PUf9JsS3DEx0jRchzdpO8eTbH6J?=
 =?us-ascii?Q?yGHgn1s5BVVFDw1acHGqKCJD60qn6HwyNyU5VgN3YS/jFpSnJ5oxITauNtly?=
 =?us-ascii?Q?6NFgPp7K8apKFVthAq0gd86x2sP+CsrDQ4zKbtqM2CJZ9qLqzNRKb/bPYzR8?=
 =?us-ascii?Q?dkHuDFwk/2tlktYkcGfv8ayqm/LeLAtrBUfjKhdbyWGmmULSgbThotsJKBnN?=
 =?us-ascii?Q?6BZPOmQyk5OhjV3Tyb1PVp67YB73zDIwQBWxSPum5LIF6HpXlNJQtCP3Gjmp?=
 =?us-ascii?Q?3JpburQsXVUWUkzEkaI4+Vz9yy9Y0Wx5MpWxAGnEj/XLVVTlxIEsKDbjmdvx?=
 =?us-ascii?Q?lbbc8hCevJQ8VWvTWCyM9r3vsHp2P13LqSgY59BZSuTvBCta/SsCUZJGhpvy?=
 =?us-ascii?Q?dJzhc4EGK5+E5W5uRD3kEMVObsW4VXQDDHrOEsD0kHL5E6KGMjdqmNEQ2DFW?=
 =?us-ascii?Q?nQESEJL8p9FUNLyGjQFDMnUfsRW9FakzQI0FHEqo4xrRWLsHmN7g1InHSYgs?=
 =?us-ascii?Q?btJeYywL3P4+QVcsyb7Tb2Y8PFnxNF9nsT1sZ71qUbWf0KZ2DAHFBQCKsBPl?=
 =?us-ascii?Q?11oUyqYXWWG4QWv7MgEAdTW+cKeQILvt3N4JGJ0MlyjqaVyFn3fwxDy6sSzG?=
 =?us-ascii?Q?BIRj12O1Vfjn7pIWYXFWrdYky/v9yLsorneDlFLFZsMFnYf9mH7BU/LR22Ar?=
 =?us-ascii?Q?8BRqhoextULHl6UAXhEQy+fV5Qnvx4Xt8T1nxmSDAGJnHKnQtcm0JeyUKvY/?=
 =?us-ascii?Q?ubP3EVG44k02DztFQSn5ksXkfeaw6++NgaC+XXK4uNBRmKJlZ1KcnpxKHodU?=
 =?us-ascii?Q?sEjGOYBETIsbjfUsGEKEl++fnSrRCal1Wa4M8TxITShGdZI+8NfXn1VbYQnI?=
 =?us-ascii?Q?WeS1uhfquEKyRig+LLp7GVPdZ+jPdOhwU81ft1VIvMfqxmD5AHxZ/aeQKILh?=
 =?us-ascii?Q?ok9cutRzAhKBP79fvqrTNkLzJHVkolENW2WULVi4Dp+QO2hr8xtp6uPatfuz?=
 =?us-ascii?Q?ZOTHHclETOZoVuXlBZh1GW5r1I9P4muGPeTBVVj9TgrgUwBKvU3duCSbScGK?=
 =?us-ascii?Q?bPVnsrnVWigc8sE4zKslT+htqJuymSvQpfzsZZJ+uCg17xpzWBof97q53TTX?=
 =?us-ascii?Q?zJsgwcz5rU+435kMxQOAJ3oAzjoN01fiJHhqryPUTvz6XlMRhCHlAvtD6I/e?=
 =?us-ascii?Q?gymqUfWSmsX5Z/p7RRHXE8AOfCnrdYp6S+kC+S4qdEgE2rn1YNNM3/MwtGf3?=
 =?us-ascii?Q?xhp6F8VDOHN+bPZfZIsOw3xYpFo7KDRgoYUuq9f8TtESQ3oGvVXu9S8oIWpM?=
 =?us-ascii?Q?8HFLJmEMRi9C7vQ7Z8Z3orDrIRWeZwbmu4YjDuhtJirHLMj8aZU/xVVdrYXT?=
 =?us-ascii?Q?DylTYN66pjssGmfuddIcoNF7u7WXgHLp5RnL0dHaAr9MYRgYXoAfe9kVj3t0?=
 =?us-ascii?Q?+6mhjCGTQQI6kPUs7iZ3K1LmBooNH7QzXxunE3y5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75cf3c7-40b6-43b5-515d-08dd38794ec8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2025 11:06:22.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA44T4a8oNi9MvBcmuzw3Kv50fmHjT/javYTALO/7BuqPT955PrlGgnmnjVWt5cwOzIWI8kTCbpfSCBoPalT9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-Proofpoint-GUID: gASeAn_4jF6FKHVHsDekKXRp9Ur2rpLn
X-Authority-Analysis: v=2.4 cv=GqG4+l1C c=1 sm=1 tr=0 ts=678cdcb0 cx=c_pps a=7lEIVCGJCL/qymYIH7Lzhw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=VYZrXKHHCgO7o296qfcA:9 a=dhuFSI6kwDLaQaL3M4PZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gASeAn_4jF6FKHVHsDekKXRp9Ur2rpLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=4 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501190089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 11:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210002

Add PACKAGECONFIG[gssapi] to support build with gss and svcgss.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...nd-krb5-config-for-cross-compilation.patch | 53 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.8.2.bb              |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
new file mode 100644
index 0000000000..019660c12f
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
@@ -0,0 +1,53 @@
+From 74d01a9e6d19eb963bbf081e3ea7c692759a8fe3 Mon Sep 17 00:00:00 2001
+From: Stefan Ghinea <stefan.ghinea@windriver.com>
+Date: Mon, 18 Dec 2023 01:20:21 +0000
+Subject: [PATCH] Find krb5-config for cross-compilation
+
+With $dir being used as base search for both libgssapi and krb5-config,
+in OE krb5-config is found in $dir/bin/crossscripts instead of $dir/bin
+so add this to the search posibillities relative to $dir.
+Remove check for needing to set -rpath in KRBLDFLAGS.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ aclocal/kerberos5.m4 | 13 ++-----------
+ 1 file changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
+index f96f0fd..61bc81e 100644
+--- a/aclocal/kerberos5.m4
++++ b/aclocal/kerberos5.m4
+@@ -26,6 +26,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
+       K5CONFIG=$dir/bin/krb5-config
+     elif test -f "/usr/kerberos/bin/krb5-config"; then
+       K5CONFIG="/usr/kerberos/bin/krb5-config"
++    elif test -f $dir/bin/crossscripts/krb5-config; then
++      K5CONFIG=$dir/bin/crossscripts/krb5-config
+     elif test -f "/usr/lib/mit/bin/krb5-config"; then
+       K5CONFIG="/usr/lib/mit/bin/krb5-config"
+     fi
+@@ -71,17 +73,6 @@ AC_DEFUN([AC_KERBEROS_V5],[
+   fi
+   AC_MSG_RESULT($KRBDIR)
+ 
+-  dnl Check if -rpath=$(KRBDIR)/lib is needed
+-  echo "The current KRBDIR is $KRBDIR"
+-  if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
+-       -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
+-    KRBLDFLAGS="";
+-  elif /sbin/ldconfig -p | grep > /dev/null "=> $KRBDIR/lib/"; then
+-    KRBLDFLAGS="";
+-  else
+-    KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
+-  fi
+-
+   dnl Now check for functions within gssapi library
+   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
+     AC_DEFINE(HAVE_LUCID_CONTEXT_SUPPORT, 1, [Define this if the Kerberos GSS library supports gss_krb5_export_lucid_sec_context]), ,$KRBLIBS)
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 18c4a249b3..4cc698f62b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0001-Fix-typecast-warning-with-clang.patch \
+           file://0001-Find-krb5-config-for-cross-compilation.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
@@ -56,7 +57,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
                 --enable-uuid \
-                --disable-gss \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
@@ -75,6 +75,8 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
 PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
+#krb5 is available in meta-oe
+PACKAGECONFIG[gssapi] = "--enable-gss --enable-svcgss --with-krb5=${STAGING_EXECPREFIXDIR},--disable-gss --disable-svcgss,krb5"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
 
-- 
2.25.1


