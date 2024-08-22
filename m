Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC8EC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:27:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9426.1724318817410936800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8964b93f11=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M4iO8a006526
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:26:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xn5uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:26:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpuSwEe4k/qx/KujfrvwtSxdtIF/OFY9k/nLWKcTOPr9PX5T//LyeFVsW3NSQR8pTpGScsKktLbkbfdp8x9u8PjkYcheHYDuowf2a8YRypoR0OpsPGGpsvhOf4OPeuPmuAPh0wUY7G4U0VjROmpAFJbgN9JBbQyGX+jKDnneOK4ys/784ze0Rt7cOywyuWMbAUC9wAi0sb4Y/WWEwEnt78bKVfoDOufinczuM5xlLirHNvEuXnLExayV0grtvJR1JaJgrO/AtfaHQ73cGX/kCT41rk9C5ppxixlQZy492RUxZXTn+URNaIvgns7lDd/bx5YlTAr3Vgy+pqLLaWFDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFUW4Y4IMciEchljQzG7/k+rQmTNLK9NJFE2F2ygJ64=;
 b=l1NmJQpyCYtd+0HZcxj9oJ3/ettzczthvfNXwde29Ic9b7T8EpR5et2adfUGESzuU3eUpoge51HvNCuhGduOquQkbFQD2WOxzStk4lOvl5p1P3U8AJaabCyip4802Vd6fqa3rxzLe/AWYzOJCnh/DopL3uHf/lD78ACEE4FpTGd/seZOkroDyB9VAhgKaDARaudahRS1+WAN4i7tYgoZYaOidrd/sJSf5QE0YWtcrceKdzqCiTqm32K8EUBsM7OHy9dR3mlpQZlC+iozt4ryH/ntJlEzJWdfW+t886qXZs946zoq48I7abKGn2eoVWXjMYE/U5InnVkoai/UHFma/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.26; Thu, 22 Aug
 2024 09:26:54 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:26:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from 2.40.1 to 2.40.2
Date: Thu, 22 Aug 2024 02:26:41 -0700
Message-Id: <20240822092642.893250-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d738d7-6394-463a-cc43-08dcc28c8f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qm9fTnEGx45iZMhEqzR9yn6u1kpC/+YNRSOVRoHF20lmmiSDMXlXmJhGxSF1?=
 =?us-ascii?Q?UgLlsV477hKwaObk4zS2ga2JGg5lQdbNtfpGBr8ib8p0XJHF+ftGmHGbYlgW?=
 =?us-ascii?Q?BPEHm8WBGmU5eCpL6ZKi0VKTnubMPrS19G1lt2qJyE3JhwzTPB+vwAls7hCB?=
 =?us-ascii?Q?27rOK0XB5LRLJDPWq3Pncqhy0lIX2UGYAcgJ3RIcHARSQTEVFZBfmum+kt0x?=
 =?us-ascii?Q?JPD1CwYS4KRBKXNyiB4fWLCPo1m8j6qcD1fUI97pHxv6Lm06/TNgzEOiZ5Ms?=
 =?us-ascii?Q?cOvtPA7KLQl3UwDMTsHGtyw99950IiSgIuKJFDfdCNXWY7lKdMgGutm+9aeY?=
 =?us-ascii?Q?fotqlZW41pYgO+eTEDWkWVYMq3ud5KuMfzCLDAq93IHcDynXm+4wGjRQZpKG?=
 =?us-ascii?Q?ZOmH7XxUXHs6kFSdAQsieE04AbIfjuAUVtO/YGfcGPmEK6Xr0kugonD2QDDD?=
 =?us-ascii?Q?2Wiyxx583V/ZuBr1vF2Mhboxdy+V38SozP2ju6mf/YN6DpYlOb5O3mDc+ntZ?=
 =?us-ascii?Q?6YZkDhcWfBpITDcRdIfWuGry94sVagX3G9gVn2Lq9KsEy443dcDZFLwQPYiV?=
 =?us-ascii?Q?QvGiOx9505+bzyWgBgBTyqvOtfMWAleDTg45fRD3KgwLYs9WeJtKMqzgXDVk?=
 =?us-ascii?Q?oIhO3Jvs0mAmMoAaMNvCrX6lTHPWG6RzkRP6TR1y0arDmeb6QIuPZDGXlaqu?=
 =?us-ascii?Q?1rIh744lcuCsY9cTxAfY/dmlcOBYlQpn1FY5qqU6g6hgIvXqGhBcmlNsdUuo?=
 =?us-ascii?Q?mc8ltKvVm32JPLqHtAePNtkV2bWnMn8EIyaHqtgPZL51STyyeX9op8fuOEu5?=
 =?us-ascii?Q?pWXk/abns/ed3dMgbE5JhYAbHwfAnHHbsZw48VV6aNhNbWJYNzSbgaB/jF3l?=
 =?us-ascii?Q?w0plgt8fj+DnA7g01UbQzLGVpelLDDCflDd8r2jV/iewyPuX+I4LFaZL0XJJ?=
 =?us-ascii?Q?5GbHe1yTVZwPAF30cD71eUGWjXcGtyGN2xldwj7p5yz7hCjyb2yut6Pt6A2o?=
 =?us-ascii?Q?cmJWg/IjIk0dMB54UTKr18+g6y1hQK0g+fjxJajU+lLSnOc3cT+MmofiN6yP?=
 =?us-ascii?Q?bSPJXsGKKjMfUYfeeJL06Nn0/mOjfzhaXL8cPt5VjHcjLGNbHv4zH3FxlahZ?=
 =?us-ascii?Q?qNqjQZyLtAiFPn3JEfxhfSQwsROLNPZ5r2ydRoEMCerNT7flANtoCSoZ8rQt?=
 =?us-ascii?Q?oPA162wQWlIJhWzBtKQI6hUaT3qSDxL0CzqbEDDtUcKKA2LUhB/DM9llNYGO?=
 =?us-ascii?Q?deQ1GO7pIc/NnpxG2XZ3KaoA3kzdudryoxjy4uBfJNLoergiuOpW6BEPvtix?=
 =?us-ascii?Q?MLXzD/AsJ8+MKhD5M8n5KqHVZpztj+vNdyLwy6g84KVpmpXU2CdUWKUULJwp?=
 =?us-ascii?Q?VkODxN4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kmcBIh4t3QO3HBRG2G0k8ZtM0hYw5CrrpqHtiTUbqpD1EAKDX4NrqxItvxXd?=
 =?us-ascii?Q?ryRVoxBgpVPGS/XZMqSMSGnCEljnDNbMEWOy6DexOU14gTEg3MtXtSPdqnqe?=
 =?us-ascii?Q?6x3FYAbaQjgAleifJ/guq2U7o+uKKt6+7Ks19NnX7QvB4Q+26b6nWMLAfSxz?=
 =?us-ascii?Q?uIKNZjpXtXzRtWSBKWsmfN+8ZtmtTn938USGucq5RJwbhVzfdO7rlirSm+D2?=
 =?us-ascii?Q?QxzH4Aow1dHgaeSxZPyd4VdeghPCZyzuoVPHJjETikfFGqlnYU/I74TeAZKh?=
 =?us-ascii?Q?I8rxwA8Dsn3KpbpOtundH+Cv/HwQ3b0Q7l+0kilMybZFRTv3n5jYEXcbK6Dh?=
 =?us-ascii?Q?2dc4+DKOtOrGWIsOVWPrK26qf5VgCN/2VmSRrKCqy1kgYltVYI0iQw2rVukU?=
 =?us-ascii?Q?K8tXco3AgHEbMsLjKHawaTjms+SP3spSX/0vC5l1mrqH9Enc1dakdzNHJYlp?=
 =?us-ascii?Q?oy3UNQWfCI9lkUR2MltDUTVlUsR8BX14AUO0O7fMXhu6HUyiBMSHHHK41B+B?=
 =?us-ascii?Q?Mp1LS3CFv2ZU++nBfJulWDRHDo9rJxdGF4TlR47/LCl/7dJkHsegNw5sNu0y?=
 =?us-ascii?Q?pnYPEKFoHLpWe4orggB8ZBTz8NH88I4tAhdGMizSUlBN9Qi+J1ojdTksWc+k?=
 =?us-ascii?Q?tLIcO7f3GU0knOwW7+f/lbSZLy7fE4hBFSqgdwpy8YxjXszv43HMiP2ynh/g?=
 =?us-ascii?Q?vB1c/6gy1dAV0MrsojGlwAqubfUPma+NANeSm8plS2iDSRAQJD2ez7jUnWiE?=
 =?us-ascii?Q?oMx+x0TBU+ZrpD8I02E+Atl9TFRQA98UBW9VGCXdbgEz/tB0c84pxoHMUfMR?=
 =?us-ascii?Q?YaLeVi6uWZwuhPBKsw9TmFpwB42nEVd8IS0hYjNLxOQ40lPpcQbpOri4pLh8?=
 =?us-ascii?Q?mDRvkoTueXWKl6/33iU5MSP/XmfDSOdRtYBb3a5ih32L+Yoz0KX32Q8aqTdM?=
 =?us-ascii?Q?U6ajxK9aFLn4vC9rSzRxhI7hOcunqN6n0pBnyJ0h8wvcECz0MrrHu7YADK4N?=
 =?us-ascii?Q?7Rd9F8txk/VpR8bE+Xn6CT36I3HkmwGjvj1PNsTTfEpHqiwwsHEG72hoK7L2?=
 =?us-ascii?Q?CKSCG1l8AuobCMvSr1ddVL+zJLB1I0xpOEaNCGWjR+3BPWx5gwRqrzorg3VJ?=
 =?us-ascii?Q?gRKIulqVc5iZnZspgZh7KsawoANy51Np8O7gDp/4uOFk4t6PnSMqYMxcM6gZ?=
 =?us-ascii?Q?9g/psiouYl0c6lxVdmdQEnPv/O6L9N4bRRXL/StRiJDx2uvnuNarAQU8Zwac?=
 =?us-ascii?Q?nmB2l5nd+nR9cH9FfguEKfaN+dIosdePpJr2YqA0eQKM/BXq+iyMFHEGVoys?=
 =?us-ascii?Q?CFeaMp0DnWdJ/IU/RbVbub1gFZhr4ABbxJriBkwn6/mVgdyK+dkZ7vhvhK67?=
 =?us-ascii?Q?4IdWbt/Q1RjNJp7P2YnB+qZ6W6et6wfzEJVNsfaKURW8WRyxzxSHs8z+p4g6?=
 =?us-ascii?Q?DZdrz6PY+x/arwVSGQiO/8VT+fF7A+Rv/JLs1CmhEN2fPgC80jwwXG2f4PFB?=
 =?us-ascii?Q?ZW0a3kfWGXlKAYbEoiKK5bRYmCROiImjL7gbyErEuVWmFzHfWRwrEQLA9V70?=
 =?us-ascii?Q?JRqi45DftP15xqwR5K1MRuP2fNMerm2xaQ2aK3P04glkgoU7j3nsULrU9vVA?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d738d7-6394-463a-cc43-08dcc28c8f4b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:26:53.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzJyR1Ee/UADX/LRoVRzoAOhpdM8SRJoVLUINPy/z0UupLjLo4w/UHt7FgJovEiLJzhfNVNb99vr7eESJZL4tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c70460 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=rLOfFyY7k6f4MMm4mAwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aW5Y4cokcMnHobI_lZRi1HGhd5W5ZOPg
X-Proofpoint-GUID: aW5Y4cokcMnHobI_lZRi1HGhd5W5ZOPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408220069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203614

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade util-linux from 2.40.1 to 2.40.2.

0001-Revert-autotools-make-pam-install-path-configurable.patch
is added to solve a problem of lastlog2 pam module not installed
in the expected location.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.40.1.bb => util-linux-libuuid_2.40.2.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  3 +-
 ...s-make-pam-install-path-configurable.patch | 65 +++++++++++++++++++
 ...l-linux_2.40.1.bb => util-linux_2.40.2.bb} |  0
 4 files changed, 67 insertions(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.1.bb => util-linux-libuuid_2.40.2.bb} (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.1.bb => util-linux_2.40.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0f5f838e84..ff47131d12 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
+           file://0001-Revert-autotools-make-pam-install-path-configurable.patch \
            "
 
-SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
+SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch b/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
new file mode 100644
index 0000000000..e9f01fd0be
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
@@ -0,0 +1,65 @@
+From af5b58cb77fc8e2e2e2f26aadef4b773b950eafc Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 21 Aug 2024 07:50:57 -0700
+Subject: [PATCH] Revert "autotools: make pam install path configurable"
+
+This reverts commit 0539b1ebd26f6a168b822374d7b167f8ef4a1997.
+
+If people want to use /lib instead of /usr/lib as $(libdir) and want
+lastlog2 pam module installed in /lib/security, there's no way to do so.
+
+Beside, we have:
+pam_lastlog2/meson.build:        pamlibdir = get_option('libdir') / 'security'
+
+So things are not in sync between Makemodule.am and meson.build with
+the original commit.
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3173]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am                    | 1 -
+ configure.ac                   | 3 ---
+ pam_lastlog2/src/Makemodule.am | 3 ++-
+ 3 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 54e0fd497..3f801c686 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -56,7 +56,6 @@ usrsbin_exec_PROGRAMS =
+ man_MANS =
+ pkgconfig_DATA =
+ usrlib_exec_LTLIBRARIES =
+-usrsecurelib_exec_LTLIBRARIES =
+ bin_PROGRAMS =
+ sbin_PROGRAMS =
+ dist_usrbin_exec_SCRIPTS =
+diff --git a/configure.ac b/configure.ac
+index 82d0e4bf9..35a70aba4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,9 +120,6 @@ AS_CASE([$libdir],
+ )
+ AC_SUBST([usrlib_execdir])
+ 
+-usrsecurelib_execdir='${usrlib_execdir}/security'
+-AC_SUBST([usrsecurelib_execdir])
+-
+ # static configuration maintaned by packages (e.g. /usr/lib)
+ AC_ARG_VAR([SYSCONFSTATICDIR],
+ 	   [Path to static system configuration, default ${prefix}/lib])
+diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
+index 6d2365378..f9a9b6b41 100644
+--- a/pam_lastlog2/src/Makemodule.am
++++ b/pam_lastlog2/src/Makemodule.am
+@@ -1,4 +1,5 @@
+-usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
++securelibdir = $(libdir)/security
++securelib_LTLIBRARIES = pam_lastlog2.la
+ 
+ pam_lastlog2_la_SOURCES = \
+ 	pam_lastlog2/src/pam_lastlog2.c
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.2.bb
-- 
2.25.1


