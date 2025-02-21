Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E75C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 08:12:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18761.1740125551057024170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 00:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41470c5b36=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6pNpW006635
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 00:12:30 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kufee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 00:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsjLM/QDCS+SqwHxJ1cqCmL4eh1Jy+EHAWLKaL6hkaUdDCXhIy9QjWCn0/Ig2gIu8RRCPRiAoOE5luJ9+trcPCJpwZ+nR33p3Fjs8MnMuUr9rrIHLJ7pspruUkC/FRkVxjWarzzYA1nK6AeZbwRMfIrriXuSE/rh90/gHH92528EC7R/sEguj49g4t3sYwy28K4HmJ3vlaPZy4aOyrSQvWK/JJsyE+Tjg8xFE+TY3xdHNVLcPFxtOgYha5Hc5dUw2wibXR1NOScZvNMq6y72DWTzBBDBVz5TZfI+wOOiZbS4/cqo1YkzrJapCmk1WJX5XdLKILz+CIU16esrweUN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ1W5oHAkMtuQTh/2e8KrwHFAOYAVtBHYvyK7GfkZ8I=;
 b=EvlFJQpjh4s6Dv8t7dydzBCCEjY48b74B0l8fFLWA0t0wouZwYWsRXbeNjC7aJeXW1iazTmcsGWzg59aXUf1+7a1sbWXbRX2+Wh0ICulT5lDS5KLOT2Ey8ZvlBAQujaJboSvoQUn7qi7loDgD/BpHFPvNoz/3RVC7VPvEulExsNIZwc5BqHo9RyPft0HAsrFzf5jMDxFmQ9g7ZjWL8QrHJM3MUGyZXWtWXm47fqH3bV7kmyk2ajtbtbNbiAjSpePEwmUccGVjIK0x94icqwkKhwBbSsoRx5zBnEJuk2GOg7DbJHG6PZuH3NeA8qQvszQClprs93zkTxc3MnbsDUiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 08:12:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:12:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kea: make kea environment available to lfc process
Date: Fri, 21 Feb 2025 16:12:06 +0800
Message-Id: <20250221081207.2318014-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: ec25fb2e-97ba-476c-f964-08dd524f794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rA9TGe6Q5i3irpLTiIQvmMzMw5GInzihuyCjECWQLVLJm8/5kla7QN1fLjBI?=
 =?us-ascii?Q?zTx+D6gR+XCgZpn00JYPWzfGdIjqVV5LZXxsquaHygj2OCXZwXMJHiCWXeB1?=
 =?us-ascii?Q?qcea9QCoJCqPGr3huMdbnSy/+jl73wIgDTQQlxIh6fP/huShdUgiv8TwolIy?=
 =?us-ascii?Q?YwvtHb0AnZObOZ3p2NMpOBZ71YO+Z95jD73PN0b3Zzj8Aau7yOvQ9LHnZNAP?=
 =?us-ascii?Q?nqFvHquRPuSHDdcExNeC2lXfahc9IKpptEeNwUdKSpQfYVdqKlbB5SInKDqP?=
 =?us-ascii?Q?pIPitqtyNpNBxxaOBU6T/gGV+frQyvnncBqK8o/JkU38UTmTbLSfl3ZtcIRq?=
 =?us-ascii?Q?EqJqY83JWi+eJTHf+8KtiV+rrkjd1MWjZtRbH6eDoJVUq6Afv8z6GiM1gEqa?=
 =?us-ascii?Q?Gpkg9MWzwek9nAHmIZVoAEhaIt9UWzpHb7WBiRTbdlGNPl7w3VTP9bpe8j3q?=
 =?us-ascii?Q?7GJE0TPelaZSNh+gFLsXKiQiqRubT94OJkd92Wfe5b80upJidOImea/o7zGp?=
 =?us-ascii?Q?i/BHWh0mySDGew+5VJVMLU2I8LOoSClKgEIqGdHoNhS9TbVM2Swl/XGuM7Vk?=
 =?us-ascii?Q?6V1ifAzCfwBKdec5Q1UIM/a5nAt/0BOnm1FX0CiSMkCUIItKiwDVn3onuR+M?=
 =?us-ascii?Q?REWokZOn3DFtmY+ChgJdpDV2AJtCpKXnzrpPBHJMzLFjMVc2bem75D7h7mbQ?=
 =?us-ascii?Q?paG8HyJkQV1e3Ax/mu1++Oz6vXma2JAcoiTk54waJME9Qvt7j6jyxsAkne3l?=
 =?us-ascii?Q?ifB0kI3sYvS0R9NjT5RzYanth/IzQr1krJLr02qM/sWJZP57wrZncX74ImLz?=
 =?us-ascii?Q?7umQvegaCgVUFXUHUQmf1QlulCBwPi14QZm78mn2j/MRAD7pbtzIMfgS/6zO?=
 =?us-ascii?Q?yfPLeIyYQceuIbg0MG6HIsWjZA8cTlhxDUwoCt6OaonhsR0EKE4bNfZYpzCx?=
 =?us-ascii?Q?bo4QU5eRLQoWHb2yo9o7EdExAcToirwkio1lryDgH28cgX7WB8IAgUQyWrnw?=
 =?us-ascii?Q?DnrvKqCPH7GcPbxTfkKjIlCHBbMQ2lbA+6KvrzF/8nRV653zCLXc3mfdvfpm?=
 =?us-ascii?Q?VIfXzmPWHIuIbWjXAbL5xE+lohkGieISyisy+iELvIy12TrZpyCdDFjaInRm?=
 =?us-ascii?Q?gn4lh33q9y8UaTp5dSxWr44DMbUsjlIPoxSZaJ9OL1o3XT3xx1apTNIWuPi+?=
 =?us-ascii?Q?bzA0gW2hrLlC9rCHecfa70MgLp8N4mf8XhKEvJzps6WB1BovfNHLVGPPKDtS?=
 =?us-ascii?Q?M7YPAAw7YUokSwnJd6GWuYIN8DpaH2QXIRLhmMgNLdtkNEStoOGmOOa6+cn1?=
 =?us-ascii?Q?e8ZCldtGXpEQEX51AmVvQOlSVOPOlKGpiMJhAdHlHrTgL8U+Si2ZhnDwmnv6?=
 =?us-ascii?Q?Bz7Y1rpU5HISNMc0YizDIL+BQUtRb2fGI6jhTAv9JeQiktwknCS0QKJ/DTQf?=
 =?us-ascii?Q?jd80N+jFgECzTnRMdc1AnfSH68AU4ZnywGXxYMrdiO3IIeYrYpEHbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IgUuwcnn3a+rwPxbSt2BDfT7mbTZnOlSzCAf/ADxhnyvp9TIk76P5t1+ItHR?=
 =?us-ascii?Q?XWZXLyeerIyEpxfgp0Tg41qBr49srTTfwACqgdt1E2cwOGFGGuVq2yZItwRS?=
 =?us-ascii?Q?QPW+cwHntpOxp9fFVviQ6azyz5qmd9s+9AIvF7f1CeAejzUmISNN59eBdsGp?=
 =?us-ascii?Q?t3KdeSbbSEZlefIZ3DjesagcC42ORBcWA9E/P1AtbN3uctbdOQKaxc6UBxSj?=
 =?us-ascii?Q?bvEwGVpNC5oRFonLzqglwvRenJgiTRZQg5oS9b6UP9DNqZlrVpOV81uHakBf?=
 =?us-ascii?Q?yNb+UHuQ12Ox9RYmYmx+VlC77DK2IEtS75qkVvwBfIlLYC+57XFVJUnZHww1?=
 =?us-ascii?Q?wyfcDu6h7WylORURrMeMxwSBFisKJ+eQEAMOJW4znr2lSOd4eWVJT4KjW05V?=
 =?us-ascii?Q?qQgMV2atQA7r3DycUxBURWJAKFPiDElqMepzQFMWZZBq8ShyCqtlu7GHc2gV?=
 =?us-ascii?Q?85tsvElyFwy1i9PusoO+KTujlOIkmsbVh5VynWyL1v2KmPr6py+eEp1VSmZU?=
 =?us-ascii?Q?WQpnl0YGbRYEwkdfnJ/NO6nxCQu48p49tEK7QZmmFSWEbeZ/gohI4a930FzS?=
 =?us-ascii?Q?XJIFn4kp6/zC1HsDI9666RL8Qv0D63XDB5IbKwOj3/gONpueVlRz+jmBz1vz?=
 =?us-ascii?Q?has9tT7kVBK2aZduuJ6xxoqcJeUG49nEJfsFAGUYyiyEHbvfp5G+mEr/zW67?=
 =?us-ascii?Q?i9XUXfJEjkgHLoWT78VPXQ3y4jLAokfQqnY1mKWdUlzDG2U76bKOGWV73QHf?=
 =?us-ascii?Q?byyzkj5Wigy+UVQk/5d/lNRgVE6Y23tMXHU6GHEzp6KKhDoWPla1dNHBjAv5?=
 =?us-ascii?Q?dbWy9uqNa2kH3Tx/D+j+t0AGFHsMW5HOH1VfZyNZaqK1kkUrliu3NaNS+4mP?=
 =?us-ascii?Q?YPGTk1zrfrL93rBk2tGc/iQ8cwAc7E12HeQEMBI/s5JC+iODU6baTsWPGqpK?=
 =?us-ascii?Q?plaHoR14Lqv9nJnbavD3yNo7PgsoAHePWCnpx/8lYu8Is19+GGFMWa0SjokA?=
 =?us-ascii?Q?mkXyxrig4wC5QKnPRc7XTB0pXtrrnWD2W54wTmZ6QKrNlzQTjNoMHiQZBsrO?=
 =?us-ascii?Q?9+Z3Rkir4Ioe95WXiDAmxtD6kpZx1sCm9yMdfiDmcij7UPf469bsk3JcJ/q4?=
 =?us-ascii?Q?WIJmXFtwiXzDImMJMLrYlbwNkUEmAcAwtf1UbSexj8M+UXqI7+tvJvjRkdlQ?=
 =?us-ascii?Q?M7Vb+LR5OOomwZ6AEpJXhwMP1pxtvRW06lK94PZVPC/OFrttk5eLjX2fBhZ7?=
 =?us-ascii?Q?/2jM45YcbVKi7PVSRAQncycXWXgYBs4/uxVTUq0klGqmQo4cemsU1x+rkJLr?=
 =?us-ascii?Q?fq4BSUauy577JuFoBXqdyHrFUcShno3CT52krFHbX6nuYCbLJlfLO5xhHsiU?=
 =?us-ascii?Q?Vy8KLzgmO5oDsWdSHhSmalT6fO+HkDiOiZKTJzJEeOEadA2sM7Ut/MULaHA3?=
 =?us-ascii?Q?a1y2eKUU4rBUNt5pgHkeq3zKzvb6zhULmU9L9Fu0eyCXBW5s25AO7r5Zoopq?=
 =?us-ascii?Q?6IdSkDlJ1qIz65yn/6gqeQSg9kuseusBM/H5D5brztRRDhvIe+bHnBLqLK1z?=
 =?us-ascii?Q?RGzik2aDj02jQ4TBMh5+1vKcx+TEOcsBilZm9Uq1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec25fb2e-97ba-476c-f964-08dd524f794e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:12:25.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/W3Qz0GItSWvoOqIW/l6ivDrG2FitTn4TfTIPkCqWRRGkHoBKhW6B5M10QrF7BqfcNz0p2XRzAwkGQnmlFuAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-Proofpoint-GUID: 3hyGFSeySa10QOsVWb2duEd9-SALnGU-
X-Proofpoint-ORIG-GUID: 3hyGFSeySa10QOsVWb2duEd9-SALnGU-
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b8356e cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=XzdbgVAW2zvpJcglhTUA:9 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 08:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211793

If the location of the log lock file is changed using the environment
variable KEA_LOCKFILE_DIR, the kea-dhcp process will work properly, but
the lfc (lease file cleanup) process spawned by it will not inherit this
value and use the default path[1], which will cause the kea server to
print the following message when running:

kea-dhcp4[6767]: Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile

Backport a patch to fix this issue[2].

[1] https://gitlab.isc.org/isc-projects/kea/-/issues/3450
[2] https://gitlab.isc.org/isc-projects/kea/-/commit/f477e8ebcc8b8e1f1adaad4d55031084c0ff6f40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ake-kea-environment-available-to-lfc.patch | 96 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch b/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
new file mode 100644
index 0000000000..15c09d4c41
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
@@ -0,0 +1,96 @@
+From 72d7e6c0b6b5af4fea2e4db9ed33757984ccdc5b Mon Sep 17 00:00:00 2001
+From: Razvan Becheriu <razvan@isc.org>
+Date: Fri, 14 Jun 2024 17:09:50 +0300
+Subject: [PATCH] make kea environment available to lfc
+
+Upstream-Status: Backport
+[https://gitlab.isc.org/isc-projects/kea/-/commit/f477e8ebcc8b8e1f1adaad4d55031084c0ff6f40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac                                  |  2 ++
+ src/lib/dhcpsrv/memfile_lease_mgr.cc          |  3 ++-
+ .../tests/memfile_lease_mgr_unittest.cc       | 26 +++++++++++++++++++
+ src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in  |  6 +++++
+ 4 files changed, 36 insertions(+), 1 deletion(-)
+ create mode 100644 src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+
+diff --git a/configure.ac b/configure.ac
+index c00edb5..7b572b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1629,6 +1629,8 @@ AC_CONFIG_FILES([src/lib/dhcp_ddns/tests/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/tests/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_libraries.h])
++AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_kea_lfc_env.sh],
++                [chmod +x src/lib/dhcpsrv/tests/test_kea_lfc_env.sh])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/testutils/Makefile])
+ AC_CONFIG_FILES([src/lib/dns/Makefile])
+ AC_CONFIG_FILES([src/lib/dns/tests/Makefile])
+diff --git a/src/lib/dhcpsrv/memfile_lease_mgr.cc b/src/lib/dhcpsrv/memfile_lease_mgr.cc
+index db4f5d5..0ecf3e7 100644
+--- a/src/lib/dhcpsrv/memfile_lease_mgr.cc
++++ b/src/lib/dhcpsrv/memfile_lease_mgr.cc
+@@ -209,7 +209,8 @@ LFCSetup::setup(const uint32_t lfc_interval,
+     args.push_back("ignored-path");
+ 
+     // Create the process (do not start it yet).
+-    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args));
++    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args,
++                                    ProcessEnvVars(), true));
+ 
+     // If we've been told to run it once now, invoke the callback directly.
+     if (run_once_now) {
+diff --git a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
+index 034f1f5..9edf637 100644
+--- a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
++++ b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
+@@ -534,6 +534,32 @@ TEST_F(MemfileLeaseMgrTest, lfcTimer) {
+     EXPECT_EQ(2, lease_mgr->getLFCCount());
+ }
+ 
++/// @brief Check that the kea environment is accesible to the Lease
++/// File Cleanup process.
++TEST_F(MemfileLeaseMgrTest, lfcEnv) {
++    DatabaseConnection::ParameterMap pmap;
++    pmap["type"] = "memfile";
++    pmap["universe"] = "4";
++    pmap["name"] = getLeaseFilePath("leasefile4_0.csv");
++    pmap["lfc-interval"] = "1";
++
++    std::ostringstream s;
++    s << DHCP_DATA_DIR << "/test_kea_lfc_env.sh";
++    setenv("KEA_LFC_EXECUTABLE", s.str().c_str(), 1);
++
++    boost::scoped_ptr<NakedMemfileLeaseMgr> lease_mgr(new NakedMemfileLeaseMgr(pmap));
++
++    // Try to run the lease file cleanup.
++    ASSERT_NO_THROW(lease_mgr->lfcCallback());
++
++    // Wait for the LFC process to complete.
++    ASSERT_TRUE(waitForProcess(*lease_mgr, 1));
++
++    // And make sure it has returned an exit status of 0.
++    EXPECT_EQ(0, lease_mgr->getLFCExitStatus())
++        << "environment not available to LFC";
++}
++
+ /// @brief This test checks if the LFC timer is disabled (doesn't trigger)
+ /// cleanups when the lfc-interval is set to 0.
+ TEST_F(MemfileLeaseMgrTest, lfcTimerDisabled) {
+diff --git a/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+new file mode 100644
+index 0000000..3eb71d5
+--- /dev/null
++++ b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+@@ -0,0 +1,6 @@
++#!/bin/sh
++
++if [ $(env | grep -c KEA_LFC_EXECUTABLE) != 0 ]; then
++    exit 0
++fi
++exit 1
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index 19e07f5da3..c2818c3386 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
            file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
            file://0001-Update-asiolink-for-boost-1.87.patch \
+           file://0001-make-kea-environment-available-to-lfc.patch \
            "
 SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
-- 
2.25.1


