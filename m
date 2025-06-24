Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED9C7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5342.1750761740520163925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O4cDGw027019
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:20 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14ttyd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSSM7z+93vAPkspgo0wtkHN+/W1wC5tY8Hz1Zk26DwPuEPFoAK01bZnsgtc3drLI5kO+zKZXVmTFf+zGrOHeyP9yyWyR+LKtSI72V9Z8L836iVaaitYHRctD/IrzVdFJ1lNCpuIwRSl21V6pppGe4zwz1ssD8ikyl45ar8zPtJ4FfUxw93PdKRNRozJ+14ABIlbCoWRPMzAAVJjNgZehqyICygYTN9+pptA3v8xFV2PUkMRj/7bSBmHcNz7rJhZRZ5sBrw+tmRQCaH/H7H+NvY98ottPJMRpcwnQ5Oj9N4Kao8QDSFml2vrAdSvpjpxBkudpKrsLxZJUGq9aKhgWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNP5ACamjOvOXTnUqCsjETHuOLr/K3M0VflL4c8r3yo=;
 b=xnLcwgJf+9mbB8qTz+TM80NiNcruZbpOBE/oca+PNR77kafxeXu9kroqcXl+vyVBKpykGXoq6dCoT7DBF6pbvnIwsChV3h5T8ZfG1VWa2n9EVGTZ59AAmvltwB8eTlQTdUGCv+En1a/gPV+9QP4OnMJMUK2plDGJGSyRgXcOl/mtVLdh2XR7eP2kv6+mbJS0Y3UZDaz48mFvCsCKeHS869SLERAT9Zh7odzq2HdJwbVHQQdTjdFjlbK9bZQ+24z0gY4bYRruPtWJx054IRmQEjbxOVw7XMXnjbIdrf2mczRZfMI9SMfw9QD9gr3BnlTj68A0j3NdqBb+xAyM4EEu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] procps: fix runtime version when using git shallow tarball
Date: Tue, 24 Jun 2025 18:41:54 +0800
Message-Id: <20250624104155.559827-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee0da0c-a0d7-4230-13e4-08ddb30bcadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t6kaKRSHa9H3M4F7B2NLlTaq5EuZp6LuVwFAdn4iF65531+YvFfuA91mve/A?=
 =?us-ascii?Q?l/BFvbGdKLQ0P4S1UjgEOJULhzm9miVH9TMcI3FLFk+J+QwoBqmDXz5SjK0K?=
 =?us-ascii?Q?SCnUzDeEhy1gmFWSUMZjSq36aP3Zl1yp5DfuKnOv/G9+b5qLAM5qIc8XXKGS?=
 =?us-ascii?Q?6I0i5j4j4MRU7+UNpTu28AwtiOvSsMESvamgmVT9LNCG7lBqwp+071go8yqM?=
 =?us-ascii?Q?+/Lx1jEpZAv+3HkWF0/cWcWzvbjfYBTRBJXVlRGOUMJefbl/aUxSr8vca6B0?=
 =?us-ascii?Q?X5ob1UkloU7JKzAdIdH1pqC70b06Ipq/UWg53heMZFf4IVD1Qv6S3X+CEL/Q?=
 =?us-ascii?Q?W4ctwnv/puVrmktKEdb1GjEuXPR7gSgLM4s+GMYJJGXFGfNUSPFGvsSxlf60?=
 =?us-ascii?Q?Y5YVexeYqtn5QLCo3p6BlnFhVwHI14oU1szJk5Dn/EfJIcOXRVV+1s96N+xY?=
 =?us-ascii?Q?p6xqlbCj++Qpo6+aX6oNX7NSuGFvxpKwl0sBVbSpAy1sMMv0J1UI6C+gmNja?=
 =?us-ascii?Q?SrDKauSucAZVpkogkqUe9K575qdRk6S97mqrUUc3KUsozI7Bat9kyh8wQ9BE?=
 =?us-ascii?Q?wpqUU5WXu9/jIa82fNDA0vfk+YLVgjnQ3wW0ji+65N4sOmfrQS4tZgezQAfz?=
 =?us-ascii?Q?sGiOBu9pjKjD1fX6NSznwLLL9L8Z7J7r/xZzpmlY2JNkVKcO5LUIhGzQcPsl?=
 =?us-ascii?Q?v+Nb1UaRASDOdOz8K0UY9IoI8EvaoEdIS1K9NMdQS1YPB+z/vtT69fZRhS3M?=
 =?us-ascii?Q?eHsfmZTrHVbVtwmcKg1THusw6hWfEJbLR9Q8RjZyvcPhLCclk+eqfvZsggOn?=
 =?us-ascii?Q?80nX3YGiECN3BIm3M9Far/8RQ8sQEP2TwTTw+POC/VkzoIQksgq2hBLgUiY0?=
 =?us-ascii?Q?gTo9h2VyWiB2zYyipq/95aqbjmkrBKn+qoiwLauQRbj1WEFpE+S1YvYMIZzU?=
 =?us-ascii?Q?JgANUtyW1e1ryubbWetBjDP87qK9j8IugAegRqVR5qQo96j8HM1k8jvO/Gv1?=
 =?us-ascii?Q?zViPFTLsrokXC6mYgRtORACp+hiNnLFVQsD3a9ybrsD1sdvrdMrfKLz++j6e?=
 =?us-ascii?Q?sLdrvWkVzqn3qJE32SrK6yJdOu6KNibh+/ZL2YrtKCV6Y+s504InCFfe99xX?=
 =?us-ascii?Q?sugMJEqQJqWZteBHFz4FZIKXCjm0IGFY9A1gQFF+6a1nyKB3YzHn+fzyrfvT?=
 =?us-ascii?Q?l9459JrWFUv0Mq3SGasIEarTm6/n9dsUQxF9r2W8Cppfb3fMZfYLhIpoPvXh?=
 =?us-ascii?Q?HwqMcvvtn4sOFCLWkb6ksUinekDfQdrW5hrdJLZg7VbxJ0P//KJ2MMn/aEKy?=
 =?us-ascii?Q?XzizbSqj7+0YF/nuOIGgsyhsy/ztpD0fbl5P/dPPv9ANODVft4PzTtCrMAmM?=
 =?us-ascii?Q?lI54IqIhGiTFZcv2/p9IQmDv7VY5+8JriBxDnSCSqA3hiLZ1m3FIfFcAFO4+?=
 =?us-ascii?Q?7kbR9K4cMPGI4NXSMtI4b8vwjYGxumjuWFVebwXki3raTrxERbU22A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mIAUwnAFFufs9n7lyAa5ez87/7+liexTteOKnH7H5t7z+j4Dh1oyoliUEDjR?=
 =?us-ascii?Q?VYKiDKWYGI6rl93r5jvbG7E0KYiC+oa2gpJPQl5/TVCBhsF7oBsJZUx8lc0+?=
 =?us-ascii?Q?G/OSxiOTDvJzTRMdbphpqD3+ns5/ONdrliUCiSlafJJNvgG14rZ6QLSDIaI5?=
 =?us-ascii?Q?spqQyvjqly6P33OHpT9o4OTFhEL+LUxCQyBG/b1x6q9rEFbBdKUH5XhqNNqm?=
 =?us-ascii?Q?BtOxNDqx0c7IC95dG5E5tAPvSXVdQ0mv6juHqpCfvXbKUaWtuMIOeGpeUW6I?=
 =?us-ascii?Q?lMF9UHNGrq9bhLY9VW56AvObfVikf0A49F7YNzvDbOVYccC5nQMIXrCyiX5s?=
 =?us-ascii?Q?XISmQ0MDyGZymnYKM2wnOTIyhPfLTMZ6I4h39HNUDMc5nDfsoGnBPHOlPerZ?=
 =?us-ascii?Q?p7IVje7fKskLpvfe7cJU9HsrJPrcIKAvGXyd3ldKGxLlU54u/7qbqYBWyxPJ?=
 =?us-ascii?Q?Okm6Uf6qnuMaXlv2Z7N1kaow4ySYu+8x9H+Kp1RD72na9vdSAdn6hNSAnHXf?=
 =?us-ascii?Q?WjP9b40JYJrIW1Rvq1qtbOTp8ew4uOgbrVlHbWXvPd4Pvc5tXElvQOsgBl0M?=
 =?us-ascii?Q?XNZepYjtFc24kJN3RHGuvDvBDCLP7FKWsX8txwsOUaUAnZvxwu3tV2/CNJBy?=
 =?us-ascii?Q?EQJx316gsEVcFs7Y22ZcCRQJ7NfFiPILck+xgrhMsn5GhbQ7C1XuL2pGhAoe?=
 =?us-ascii?Q?cZgk2OzPU8XIykjLxMW2FvIbD0kYGvZb6fni5zg/DVlOJaO6rQNwFXTsRdz+?=
 =?us-ascii?Q?YKvB4j4q4lf02XYb2Mfj4cGGOooa0t02B9lQA2yuSv7+Sce2qz8GLtdXRKg/?=
 =?us-ascii?Q?KYz9V2Tn+jqKqNVsARzN2V6nX2zPq4onNTQtWhP1F3rHo2mdXw4cGzH9vW8n?=
 =?us-ascii?Q?ImGyyZAQ+TfTZ/aHg8ibjsYOUCfbOOsMGAAiwH4ID1UtIWVFVoLe0MrD6s2v?=
 =?us-ascii?Q?Hjexx0YVy5vk2pPCgB4i0MaRpbfU4QFzTdwNXVeNnghsFNL9KWr9BLwb/Ys/?=
 =?us-ascii?Q?WnUpQO0wC2iNi1+VN0FIjUoUJ/FAh0vbDQoMAJI32sp2E31Rvdxozhzczw0D?=
 =?us-ascii?Q?D2Hk4NbA/iLNnfIpBFmSohcJK2Y9VnZmzn2OmjQqrQIrHJXi3DHZPWKhO5AJ?=
 =?us-ascii?Q?NnCZHNpwazVuRIHmFV8d63hQFpKM5wqxRTZvH0rgt1tgGRZoDCyj/KRLZ2Vq?=
 =?us-ascii?Q?mzwAm9dtp/WGCcHoZRZAFLRxO1k9zJ5CJds5BdzkLVtz5U69JqJ1t+p4SxND?=
 =?us-ascii?Q?A3KxEaLayd3MFRlILsDRmSXnJPxOHrzX9D/LvBUxy38Zmx84xq7xw8VyHPsC?=
 =?us-ascii?Q?nYMIzqGKai+XiBzpTgYp90fVU6WpqyksGGv0/ufXaImqhL8DFhVsDlHFwCVV?=
 =?us-ascii?Q?wiGmsP02Gi1HXhvgyY1P7I+D+ZFktt/UTH8i+Vd6hao0wvevnGlVyVQdBO7E?=
 =?us-ascii?Q?DNILiBnuVK1HJnK/K5EaPoV7PkbQDeHP2icYY+M0JSynHLWldt6Rt/EtimWw?=
 =?us-ascii?Q?gLkNF93YJlJR1qBKV9XHrVqdS+C3UsPN4bxVVqFmO0Eacl7VdCSEe+ghp928?=
 =?us-ascii?Q?1mj5nac8zRYfSos+o1zFKdaiDz3G8qPkuAoXMwkr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee0da0c-a0d7-4230-13e4-08ddb30bcadb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:18.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZjzjxhhgfyZohrn3hDkIZA31jjysEC2upWy79fF7EEiV1gkkhhwzMTYmwSiXnKcXSWtOKoratHZSlw5hUkfng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-ORIG-GUID: HxXoOOoa82v0BkMNQ5jQR5YuscC_WDT9
X-Proofpoint-GUID: HxXoOOoa82v0BkMNQ5jQR5YuscC_WDT9
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a810c cx=c_pps a=3w+TbvVJ0pkczneH0cxqQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=YBbYe9Zt53ihzEGwkDYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX+jbuK3Cxd5sO oD8ASSvTqQOOT7C9R0jyO4WvbfUXP+N32t8rBdsJ4MoqLilMVDbJwTsiZjUA7j39lV/Sj+U7H6U 4ijQWgzBHTjC19A04VeyE/TgczptlO8c+Cd6EzoXu6ZTi3qyUsyLhW5TqB9K54kaJT9FrgzkyHD
 ODtpz5znOWTwf3p/7pYZes1L7ecdbdGFYqZbfjxRjrEgOppFMiSGEIuE9m9LoEiaIzz9cGoiFV5 iAsdBzWZfdxCOBQlQCF3xiraGei/RqA15kgob0ipdcTpl/N2B7fKDxHOOs0rmiuu8a0jiS+if1K stxgKpNVs1qqraz/imAGwS2pcVRuHiFLA9VwafeZXcbhQMdIAi5d6Rdrrsdu9yhltiSHdkozNQ1
 Agd66rEjIy9y5Rl2j+9kUVS/v7EaqzS5Xn1KD7fFetlJZ5SelpxFLxCwhxNBh3GpXPNbVbYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219248

The runtime version of procps is generated by 'git describe' command in
local/git-version-gen. But when using git shallow tarball,
git-version-gen can not get the correct version due to missing git
tag/commit messages. This actually breaks reproducibility, since the
generated binaries should be consistent regardless of the source code
packaging format.

Add a .tarball-version file in source directory. Then get-version-gen
can determine the version through this file instead of 'git describe'
command.

Before the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng UNKNOWN
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng UNKNOWN

After the fix:
root@intel-x86-64:~# ps -V
ps from procps-ng 4.0.5
root@intel-x86-64:~# sysctl -V
sysctl from procps-ng 4.0.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/procps/procps_4.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 2b41be3930..db05eb3449 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -29,6 +29,10 @@ EXTRA_OECONF = "--enable-skill --disable-modern-top"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 
+do_configure:prepend () {
+	[ ! -e ${S}/.tarball-version ] && echo ${PV} > ${S}/.tarball-version
+}
+
 do_install:append () {
 	install -d ${D}${base_bindir}
 	[ "${bindir}" != "${base_bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
-- 
2.34.1


