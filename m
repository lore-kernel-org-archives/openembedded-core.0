Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB04C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:55:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1606.1745564099389666237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6210502670=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P4gS8Y004493
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:54:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh63cs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:54:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHQHdDFDCXNkMOpwyxxNJ1HazYXjlAlHrwPmr6TBRK8cudA2oL9m+5VfMYWKVRw2xVH2eo8CQt8wVqLe6d24tZ9BpKVUa9DGk7tBHLb/vhK2rhdxRZeKGQ6NSGOUy9VCMvGCAFsRcb5NnHT+qHS6ShOBbGrmlxK8pzZ5G3SmP+EmBjQMNQbWNGaBZMKefRI6q4laHJwmgH8Pm0vMcTivfEiEYo0X9+Ae/yVSD8RtJF26tJapnw3/TJtZk+eWA0YX38czhJmZVIrOHKnWhQSkn806UuUlrhBzqwC6po8bAKDFrdDb3e+PJy0NPAIzN5/oj/Yg/Gy2CutsNuh/8tWeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyE8pc9HJfcd2pYPP+T9/sJlXwpmuwMOAOGwyt4NmrA=;
 b=NDWgZW+aeR+3SE6DMQN07QSAduQICGZZ8JRTFfZ3fuJUkH1I4FJ1GfKUazkyQQVPoEjFGI4xslRU+oWshRawcbmDYmuenYzbjwtgtD7sopk+5o3ZIx8akbyRFKyQutsErQEOWcIPBKl0V3sLFbxEJO7dePUj6P05z4zPeu91T1oAXmY0egaue04YLu8lgFzf3PDiQnNJPTh/P4YfQ6+7d7Lwo06uEZRAMO0OEv/wK85BMuj+s+39+3EwMPGJF+S+99l6q7If5yi07YJUZKZWs1TjKsULu4UXuuMicdiz1FFCBoJCwmu0Zh2+oj3ZoDPUvEdSj8VtwZ4mzIGgdE5GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 06:54:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 06:54:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] sassc: fix runtime version
Date: Fri, 25 Apr 2025 14:54:38 +0800
Message-Id: <20250425065438.377577-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425065438.377577-1-yi.zhao@windriver.com>
References: <20250425065438.377577-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: bc692a56-fc52-48cd-6347-08dd83c615dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JJ8g7GOqznLzsvRZxxFwvDORdI6WbZ3DGG+09HWcWsyA93HNs211sAJZYBUa?=
 =?us-ascii?Q?xadJPXuIy0FYD5tanwxuI94KRiytggAGOE9TkRTIM2rU6ZVZaMI1TimJ+V8f?=
 =?us-ascii?Q?2qDzomRI0Q9yS01fhUdv8/tDYQjZ00bj1RAkRK9c76KXoi4aR9Ep4New0Ebz?=
 =?us-ascii?Q?QxqSMRApenafHmafzillR2Rx8m5EgGc1x6eJR0X6tq6rJc17doOKABiHl2k+?=
 =?us-ascii?Q?6yEwDclPsAIFbBoI2iHHKYpIxAYcuQHeTw5qM5IuwC3O4Y2orzRFH/clYVnj?=
 =?us-ascii?Q?fqa6OhfuU1HXqRDRIePvVoZaYAutpwi4GpjuVM7pAmi+4IMSx+QmlfOsxuCU?=
 =?us-ascii?Q?/Gke6h/d5VMgIuuPk6Gl4qofem5tRjLAaCP0igXre1sngRTlLZuO/td20wH5?=
 =?us-ascii?Q?+zbLfruPIS3SkfvBRADbEX2jAb+aiMc0qKXwcNkc0DY1R/KEtTgGUC0Lno+/?=
 =?us-ascii?Q?AjdgkBPTXPRodQ1T7p4lUv9rFMO5AocBH01yv8PKWvj6SwNNzqZQxbrR+IlZ?=
 =?us-ascii?Q?g/EeU+1z/egVwSdeuRrlRGVpI4O4rVtpUoDkBF9xnNAxJxfTSCFq+cxk13qn?=
 =?us-ascii?Q?E9txm/nqF/BJDI02vofzR0OW4eCvFP6sf6dsPt2PssIaxVMZlhQEpRZ2N0b4?=
 =?us-ascii?Q?6FBpEhFH877lgFMPlTYq/eg/7/G44hRDsV6aKTcRvXf4lU23GOME8ExZL990?=
 =?us-ascii?Q?8s34VrnTVfWAzeXykc/8wd0Zrz0K3YIjFHq2QlOVCAhDSn5yBrel1vbc5Goa?=
 =?us-ascii?Q?hX5Es8uPgYgrhecfw3En9eX+RwawefeitRy6BFLoN9rmsWGCz6b6BWG8nSey?=
 =?us-ascii?Q?EUNGtha3Lh4Vx2dRPyuER9JVPomKSMCZbXNA06rz2iiLoX37WLU7nh366MNW?=
 =?us-ascii?Q?CNPRFlQjwZLTt7fDLtojfA3nitBnKamp1wJUtbR/JRtk41Nkf/SPmY5hJapN?=
 =?us-ascii?Q?I+6vsqnFx0bxg5T09wozDYR+ixmUCnjqEyIbrgoVdcIy6cW1itzzx5Grm7jO?=
 =?us-ascii?Q?UOBrGd2egzVGQqgaQTeuKV1TwXOmX9TMgHTkv6oJBxIMgqGXJun/primUv+r?=
 =?us-ascii?Q?gZHKcrMyR4Tw+CmqMK7EezIuhgGn5478oHM5vR8+Y/AlrTFYibR44T1hRFSf?=
 =?us-ascii?Q?hLuXcTGErTHelc6Cio/cyhvwtNgw9cIbG2Zr6s7nxeSUJCPrV5hO/gChVbJF?=
 =?us-ascii?Q?ODnviLVkDkFatE+n0QjAtkQKR2gidnZ2gIoA161lR/l4RK+zI+lhQu2xdd0l?=
 =?us-ascii?Q?y7V4whWjJ7mvDwIOG2g7OQHqzKVKG+nNzgeY+YPwnWepZkpj8W1ITGBexT7F?=
 =?us-ascii?Q?kiShbr/2go6iUb/iwhOIDpAon8odhjD7A9IzVl0Jg2Gxxj25QKQTJd0DD7iD?=
 =?us-ascii?Q?0x269NwtasZokqKZzs3kKL6nGqpUIX/8fzCV7+WHLlBrHlYnLlX/YDM3n2/K?=
 =?us-ascii?Q?r8TW2Xc4bVXMKeGdjUxyNvMrNzvIadtsXhufon4znC0sgTqvLLj6zA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G5dFaGUh5NTsd/7z//7c/Pchj1aywvYtQQDdMFo0gRV+8Wb1jREdMXnnjSGM?=
 =?us-ascii?Q?Su+muRMhV6sZqfACB6D7YSntOuwwK1JxSedGv0+QdTdJLC/lxMofsr2GrAyL?=
 =?us-ascii?Q?B1zKkY0r58Gl01E6pAaniHTFP+QCEyyIo4HLP2cHtq/4Uiz2nxGDotHnyreg?=
 =?us-ascii?Q?IDzhnVikDSHfqRGNrRb8AlG2vHyMiqeFbdSBfiIHd/YNGMdmqB8qYEVjzS0l?=
 =?us-ascii?Q?k5vSMEYcoSh/PqPRMjjMMCTcPdOBJ+OGFVQYpTBvYp+qAiC6pXvgTvy3VIy0?=
 =?us-ascii?Q?tzz6gJ5U6zVuLSbjlbMgaOJOrRdPnyC/lDalJOdjTxVxl3XPupH5j/KTGxLO?=
 =?us-ascii?Q?2A1B/Te0UzbmjvTkT8oa/QU/5CFHHbFIQNRgnRlLRbfgNMh2zBrJYP4RfJOu?=
 =?us-ascii?Q?4Zqwr59UpCWCItynPmKNCZoNyIiRbjwx4JP95ju1U0wkF69a9uZU4U62EX1v?=
 =?us-ascii?Q?SaQLU64CijK/0F9hZvqvZbrrErr2zfLnV+HY32pNCSsf+81NejJ0tm8Xz/am?=
 =?us-ascii?Q?iTpJizyjgvKprmcmLbJwErzOtVgtmmZ5IEQbK1VwaJ9YSwGX8RIb4nIxArLB?=
 =?us-ascii?Q?aNojKAd0pvgc+TXr0+V0ns5iKy4cHURsYBtu7FBG5x+4in8n76jawfz+yymg?=
 =?us-ascii?Q?6XTSvdeO7XKp73DBQ6kVY0cb8MLVbym1JJZz/XG0q8VYPadBEHFGBBC1mMw4?=
 =?us-ascii?Q?T0GOqEXLKpzlTQwgPTvvlDhLMG5ZH0BIMgYPTxbV6x+FQRvdXpJIaStxiKOv?=
 =?us-ascii?Q?J05bRVhPuaNcobAlOA9TA8FFMXIu+lAexLchuaQwNH8JFcis2l2hvUylnPAZ?=
 =?us-ascii?Q?12bI4EGBELKTmA7Oiz/KB3ErUJpCEq/iIUxQeNmzE4942RvnpNdNUNVAROFg?=
 =?us-ascii?Q?wLrKJZPwpXI45VKEkqQb9kKaXSzmxzJlKIrcqtdLBb1835e4K3lZ+BA0hVre?=
 =?us-ascii?Q?5PAixAXgEJFZ71qRLLTsea6vqygxAyR4kPEcQTKlvMQWm87nNN4ojfkobAr9?=
 =?us-ascii?Q?MBMcHebBt/WXYG9EOtzxYuXLkD4jvgW1vKqYC1+gEDJBjAT/TdONxav4X5Qf?=
 =?us-ascii?Q?kdOmltNsoS97akiDrsXwucNyocdVqy7QjheoijcCRWuBT5CSZAe8Ygx8LAw/?=
 =?us-ascii?Q?hszG1c/N6Jufs2Nwll147TSp/6T3IPb0XH3rYLGlFh5PswMj25MMJznmrx5i?=
 =?us-ascii?Q?k2/LGEa34yG1TCon69lNRrjuu9vLOPFRh7GMx/BchghaG76oRVbQVM+Ibrtq?=
 =?us-ascii?Q?dFwcxBn1M0rmTdrN5Akf3G8bw3vjfU7xoSyrrNyIdcRHm6Fyx46G257n52cM?=
 =?us-ascii?Q?ib9Qv/XnizF99PYXm79pSHUWMSsaMjNgJ2jMRiz9oS/fMUhTeVhbqJsisIwb?=
 =?us-ascii?Q?NBccWmK0ZFM9FemVn3iJOGywqy5EW+W0xEOrM7m/2k6FqJEQx6p3MduTTXm0?=
 =?us-ascii?Q?p7Fx1n8zLAguxv/mIhSsfO2vBIdEBa8KdkjIhTNUv2T2I7AQrYrowR5dXe0C?=
 =?us-ascii?Q?doYM7HJDlJgtgOjNCauE67/WoJjhHpFwYCUJsW+rYaUq2CJAZuC0ipPscCiW?=
 =?us-ascii?Q?EzlEsdpC/ircImW4UOzhpLIxk7l3esc5DjagtvGL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc692a56-fc52-48cd-6347-08dd83c615dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:54:55.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Dj0KhFCe/PSZhnlKRnZLWTDWJGGoSv/bK/Tan6OkDoIM6Qv7UP9oUwt2po9320kgIKgM2qG27+C7sNg7shaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-Proofpoint-GUID: kbcBhPOA8X7ncQeul7-x81dSYt_S0JSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA0OSBTYWx0ZWRfX8aX9AdrX6TQB DjK5hg/oXUlMEofPAdZiQvBnqB3Zc+X/8czoF9yQK0VJwJ4ocaM9hE9DuLx6Jagdb+ImOzbpX91 6oPr29ew/p26+rGpjajIyBtE2KvHp0fvSjEm9O/mI3z0iI1d7K5G6/sdUVpb9MD8s692IdtFbda
 nbJtzNH1e/5Mn5eziBKbVuU1i15Vx3swMTuARTTxWfCt3b0bjynJ8Hagwk7jRgl5SjxDRlosfEq e7vdLakM28xNPYTJw+U1C1aBrLurfzM07/Vs7D0JsEDcA7oNrNXCUqXVRwgmUseBJ76xJi6LC7m NtJtlhTgYHz+ZoBCWJMkPOfrEyPCJ9LgYNiQ6XeaeHuDCm1/j9Ix5Jg2Bttx0jovwoS6TgqqHJT
 SPmzFdvxpzRLexFlj4swjo4A8NNVcZnDJYCRM9QDXMCMG+64pApvOYw+foUjmjeXa9lGD+s8
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=680b31c2 cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=yiAupTA_kx3k_-Ck1uwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kbcBhPOA8X7ncQeul7-x81dSYt_S0JSy
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215429

The sassc_version.h should be generated from sassc_version.h.in. But
there is already a sassc_version.h file in source directory. When ${S}
!= ${B}, the sassc_version.h is generated in build directory, and the
original sassc_version.h in source directory is not overwritten.
However, the latter is used during the build, resulting in a missing
runtime version. Remove sassc_version.h from source directory to ensure
that the one in build directory is used during the build.

Before the fix:
$ sassc --version
sassc: [NA]
libsass: [NA]
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc  --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...assc_version.h-from-source-directory.patch | 61 +++++++++++++++++++
 meta/recipes-support/sass/sassc_git.bb        |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch

diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
new file mode 100644
index 0000000000..04f42d7322
--- /dev/null
+++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
@@ -0,0 +1,61 @@
+From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 24 Apr 2025 21:28:55 +0800
+Subject: [PATCH] Remove sassc_version.h from source directory
+
+The sassc_version.h should be generated from sassc_version.h.in. If the
+build directory is out of the source directory, the sassc_version.h is
+generated in build directory and the original sassc_version.h in source
+directory is not overwritten. However, the latter is used during the
+build, resulting in a missing runtime version:
+
+$ sassc --version
+sassc: [NA]
+libsass: [NA]
+sass2scss: 1.1.1
+sass: 3.5
+
+Remove sassc_version.h from source directory to ensure that the
+sassc_version.h in build directory is used during the build.
+
+Also remove '--dirty' option from 'git describe' command line in
+version.sh to get rid of '-dirty' suffix from version number that
+was introduced with this change.
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2020 lastrelease: 2020]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ sassc_version.h | 8 --------
+ version.sh      | 2 +-
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+ delete mode 100644 sassc_version.h
+
+diff --git a/sassc_version.h b/sassc_version.h
+deleted file mode 100644
+index 3ca12e3..0000000
+--- a/sassc_version.h
++++ /dev/null
+@@ -1,8 +0,0 @@
+-#ifndef SASSC_VERSION_H
+-#define SASSC_VERSION_H
+-
+-#ifndef SASSC_VERSION
+-#define SASSC_VERSION "[NA]"
+-#endif
+-
+-#endif
+diff --git a/version.sh b/version.sh
+index d56af99..cf97d82 100755
+--- a/version.sh
++++ b/version.sh
+@@ -1,5 +1,5 @@
+ if test "x$SASSC_VERSION" = "x"; then
+-  SASSC_VERSION=`git describe --abbrev=4 --dirty --always --tags 2>/dev/null`
++  SASSC_VERSION=`git describe --abbrev=4 --always --tags 2>/dev/null`
+ fi
+ if test "x$SASSC_VERSION" = "x"; then
+   SASSC_VERSION=`cat VERSION 2>/dev/null`
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-support/sass/sassc_git.bb
index b7f57ca244..64e92f48cf 100644
--- a/meta/recipes-support/sass/sassc_git.bb
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -7,7 +7,9 @@ DEPENDS = "libsass"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https \
+           file://0001-Remove-sassc_version.h-from-source-directory.patch"
+
 SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
-- 
2.34.1


