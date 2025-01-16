Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A14C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 09:10:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44336.1737018611089872884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 01:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111c5c6c5=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G8vnmK022250
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 01:10:10 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt7573p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 01:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPVU+iG83R9Oe3KlwOq1aBNsNk3lq0udCTm88rg+OW/uf5vO5ouWG2ymBDjy7xHQSxwQ7uJ6vtqpCbTZ7iEIM4HwJs5R9ljjJv53l2lkzLDx4DlqLJAkcSBvKxoXXircufMc9whi2gERaA6tlILbSPpR6ZeCegL87fdesXRSgmsiZsQzxeB7JsguyDITeVUYwxSzdwOpz7rLHFjNVLE0qTtu/5OIeYGOa7RflkbezEoIZAQE9IpAo8d7zkEXtR25xZp7vsH0tfDXBnlGrTOcHm4Uk7KIDIJ0MWJW0fDIJXNEVUwJD3fSvH190BrZ92iezMTTufVBvNlbfCm8XZFfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgdp+W6xq+qMRxZIESNyh+t4dZMYpLSsYhJaY59DX3k=;
 b=eWUI3f0q00SHLkuia84YZJyG7VoPxaXlfpysu9zZsR5Q2OTnot3n5F7lS7W6KzdowVyIYS+VBVv+sUl4i8GHVFISUrJSWlRIH6LuIEW9yVFUBSZt7x0oRXIvliMMsyMzmxFeJ4tKIhnasrjWgzWsyCqfxOfAx9ZcPdEGtWRsiqBbYXwOElNCFq73hxlmYoGuJXIfOP0CmKTCfU6sFNVE/6Yn+osS9wjOyw3JViki5HcaFRiEzdqLTjA4M25ZmEzbj3vaS8YRMIJ2lUMQP3Xy1rsBusUBqQcORd7vJZzuI34GvoeVw3JHF7RPQKhPs3IL+PkUqDxBE85Tmip/e9QaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 09:10:06 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:10:06 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: poison-system-directories patch updated for missing paths
Date: Thu, 16 Jan 2025 01:09:44 -0800
Message-ID: <20250116090944.1194383-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: bc308063-021c-4413-d665-08dd360d918c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i14acnYvWMtzwFn0GaAdj+H+YyNh0jE1OiQroUT25+j9NDPJlL8DcgIgTtuX?=
 =?us-ascii?Q?sli2nsgLjYn8BvCTH6ALgT4epJDEnBPtbFiu2Tu7YyUcqoCwZxzj5m8tZiqC?=
 =?us-ascii?Q?9Ks4VNCbdWiffDN0gCHRYPCyaY8CaZRVlzTUW7gruyR95Xf0LFRMDZudirdK?=
 =?us-ascii?Q?axGx/xdLioRJRXib0tg94DvJ+Znp7FmgkoGeUuHNLbLMHmuS08qU9c4fOwCq?=
 =?us-ascii?Q?K66HSNolQo/E5cMs185qM6rqi74B7C0ixkhKjLEIznbFIMsgzxzS8OH4hZA9?=
 =?us-ascii?Q?VCU3FU69SeavRE+qOLXBgdgFi4GBZfZCWHLUJpxJJ87g0qmwqtCQyZlbANOK?=
 =?us-ascii?Q?seKMYkkOHNxcuqjzp9q2f5twL2cqbmZPVTLhWegosRIS/O05RxCOdZTLESlq?=
 =?us-ascii?Q?MmvHWKZeGp9DN8ymoRj31q7b21roI2KXdw/SaDyxZ7FEE2E+4Pw7nfzimq1K?=
 =?us-ascii?Q?irSt2zXgWMBrToSPnRTfSz/4w8/O0wRrLsiIKzvPb4oeS1NyMr0kd7q58bjy?=
 =?us-ascii?Q?cyXI1H07gAGRM5jPGjMSYLURlArWPZmyoJXJeHgMgNXeU8bikxvnYLKdEiGk?=
 =?us-ascii?Q?fHIPkbTo3lxI4rqJNh0V23SuRfQF/BqqXvdKzaYv6SolenDV8HYTo/jtj8Cz?=
 =?us-ascii?Q?PoJxhrp8iUa/XCy34xpYQLCNL0eNxNxpcmKihGxkRxUxiMquSor4TkPquu+h?=
 =?us-ascii?Q?fdXW8hgq1ZkL6EcmJgrIoSvS1+mABr9s8nhLYjw4SorPopBdU9Pp2jYXJj9F?=
 =?us-ascii?Q?x8BR9bKvq4sGdEPBE3yQYsPxDoGaByPW+OwL8FeoSYwrHcsvOvLSE0NEcnuL?=
 =?us-ascii?Q?sYCICrTj2IrS1TK/BRorZOZ2m5UBvbB771ZWC3SvUOrO066lkNsM8v55kMMZ?=
 =?us-ascii?Q?mQRLD9QpXrfRCZ1gNXy3sq06szfh0z2GWoRHdonuE7VA3v6XCfFXCsQdVa6W?=
 =?us-ascii?Q?p6Z64ZRuIJUcwN8oHGdkecMBnK9wmRt7ahq1YqkAHNg3DswUpIg+KfRwXcuX?=
 =?us-ascii?Q?C+in+jSoSN7h78/FOivmZs4JteyNPFrajyQ8vTG4xbNyPIbBQ+7ZgIrUPS6Y?=
 =?us-ascii?Q?fn4mH3FmOYV1QBd2Iu2fjwROmdBeiNFgUuGr+n1EE7858LpfbUKxJWSBvGZE?=
 =?us-ascii?Q?PeFmQgTUO3nn5QtgFzYkE7NFFJdkJu5Ynun4/qpTkApIjre+4aeXaORzWnxE?=
 =?us-ascii?Q?k/8KQ22bYKMZc4sUCO2RFj5MZ/jVzwiJrXdlSYVq+R/U8tM8GNz0cdWbEdUn?=
 =?us-ascii?Q?q1GneVbYl0E5Xn8Cnspilgsgg+ZUbfAGfqMo1P59HQtDzBL81fKrQwVv3qD+?=
 =?us-ascii?Q?h6Cz1y0q2STnLWoGqaORxibGZ5oigXw3K07Vb1yuBzlyXYlPc0uAie4lXbDk?=
 =?us-ascii?Q?ZYOCXTZ1IQcbKTgujNlDWYfT5J61reoMzOn91lNPlbSwBGLdGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kGDre8w4oZQ8pEGrjZGk54s5tmZvEFJHTEpZ+vFTz8pUjr7siG06q/bdlYbW?=
 =?us-ascii?Q?604vUEX+sqFLHAfPV9Y2pnxFrF6YyXQDH1yHXcl81TNYgHM4tVOkEeY+NTiv?=
 =?us-ascii?Q?nBjGueBLHN5PhG0F5fsi0+jQdU4sxcZeglZgmm/nktkliq+CrxvCjgR5F0Q/?=
 =?us-ascii?Q?l/85LjUlmEaYL5qENzbMZLodxla+SKkuRYOi3y0dFABY87Hgoh1VY0bj/fkO?=
 =?us-ascii?Q?fF2T5f8UD3WpnS2Ln7o3p86FQBH1QL8M6q9KpoAXiuRImrHK16Kt2ezrPlgn?=
 =?us-ascii?Q?vitbJh4G70R2FzJ5JNk0BxSmuw79E17aSQT5fL5wxlwCOtRBrS+YOPxrAKiC?=
 =?us-ascii?Q?gCsFy8bV7YPsZ+r1y5UpB/tKFkBk65DF6CSDXV4LXI4NxHxij/p69gZRphAf?=
 =?us-ascii?Q?DW+tr4Yh+mJW08ncM5RInGIk04DuoTwsfAUeHET66VndTQV5GJeKPQiZdYvb?=
 =?us-ascii?Q?es3qvscBXB5K+dbw+m3LI/dIMDo1+L9FZUh+tg7QbwV5GXL/O+NY60QgUO6a?=
 =?us-ascii?Q?WDPdz0JnKafcKPeu8df2zTQot4LBq5Ac+cfswtdsQitu4q8tGIAQrz7nbnaX?=
 =?us-ascii?Q?oNmsZrYPXTVIXky24dolMB48rycIkPBT2K9Tdo8yxQQd7WS67E14PBTdXt68?=
 =?us-ascii?Q?94JZFHCckpevYW2o20KsbRIsvy2R2a+tE4TCB6iIKeI4JIs9it8PlEuEBYRu?=
 =?us-ascii?Q?bOQoDTDMLAzjnJt4xIlhdNB1JG8GIRYNaxBSEOF0o5EdHaNFcdDdAGp8PFXe?=
 =?us-ascii?Q?aDn+9TW3qDxJgq6yfADHDPX6Jqogg9yDQfcFsydkAlbhVjxb9UCkndQ0hUAH?=
 =?us-ascii?Q?7ASWVX6HKXbNxBzhM6KjKab2ju4Dcs19hrnd5tx3NMz9xzEC2CATPS50L/9b?=
 =?us-ascii?Q?+00D6bdYZnLLHB8WANDMVsB3DNGJ/9/+5+Av7HKerzaxUxEkvfz2gpfgjB9Q?=
 =?us-ascii?Q?ZvuZ3oNIELlP3ATslvAC/QyLHOvlVB8iUdTX2A0ZTrAShDl2LDMbVvSe3475?=
 =?us-ascii?Q?WLfa9XiZlsAzIrwO8ss+ZVubtQuTpI02Vr8Qqy9eclEE7crFw203kotefseT?=
 =?us-ascii?Q?QEh901yyEUIkNpV4QXQ1zC4MXIbwHkoaBEyDGIkScZIRDtFlA+dp/V4NWaOP?=
 =?us-ascii?Q?u1OVnJb4HR82Txcyj00+LNf7SG+shLdPBZu0Q9N8btM4IJ5pednhnzJF6F7n?=
 =?us-ascii?Q?GAyZD3q+rTr/rfaI1dpbsahAKPciK++nc8pvgvDepyoISWzjUzeBMvcRbEYa?=
 =?us-ascii?Q?wNflSUEXPrlXfT9qaacYYOIZOyT91K0Wk2ghFXaZjMy4wpczrm0KWjZz1FaU?=
 =?us-ascii?Q?3qD64bsOsGlYz5MtKsO+iKmDlWeg72uMbmACtXh0v0I3nJmRGXWzfi4IuDBI?=
 =?us-ascii?Q?R158QOGLUV9NzVacqPzZNqy2DvbU/tyJrblt0qBeByBn2VXD6hZQbFYKRjUV?=
 =?us-ascii?Q?lgcwO4ovZ7B7oh4IpPH4Wvubt1QV0AdJLJHM/A84fb2G6H8keMAYmf6MwHM/?=
 =?us-ascii?Q?YCmQbtx4KfIypcQ5mvU2l95KCWSx8EHLIs++dajHrKNd01uFxQDzrmPmdgrA?=
 =?us-ascii?Q?yyS7psPn2luYXTYNoN04+GClfY7DYSpyfFAi8McVogI2IX6VmA9jsQRnyvuO?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc308063-021c-4413-d665-08dd360d918c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 09:10:06.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO4UrwMyjK4OQ0X+VeUnfCFY8Oksv7+C+IEPHbPtbTFjYM/PEftU4ZyDGH1IAaqTExXmgoB6UkHmBCK+rBgcNc1pdA6bPESDpF1FVTxnMR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
X-Proofpoint-ORIG-GUID: QloezXa2fqleGdjRgAiI89XbVeKyxEir
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6788ccf2 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ayRE358LKASKH7s7ZH0A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QloezXa2fqleGdjRgAiI89XbVeKyxEir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 09:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209940

From: Sunil Dora <sunilkumar.dora@windriver.com>

Modified logic in gcc/incpath.cc to ensure that non-existing host system paths are
not deleted during cross-compilation. If the build system attempts to search a host
path, gcc will now issue a warning instead of silently ignoring it.

Fixes [YOCTO #15672]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15672

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../0002-gcc-poison-system-directories.patch  | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index ca75d08f59..367c9e3821 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -14,6 +14,7 @@ wants this to be a failure, they can add "-Werror=poison-system-directories".
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: sunil dora <sunilkumar.dora@windriver.com>
 ---
  gcc/common.opt      |  4 ++++
  gcc/config.in       | 10 ++++++++++
@@ -21,8 +22,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
  gcc/gcc.cc          |  9 +++++++--
- gcc/incpath.cc      | 21 +++++++++++++++++++++
- 7 files changed, 86 insertions(+), 2 deletions(-)
+ gcc/incpath.cc      | 25 +++++++++++++++++++++++++
+ 7 files changed, 90 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
 index ad348844775..df3992b420d 100644
@@ -186,7 +187,7 @@ index 728332b8153..343e4915097 100644
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
  
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index 64cdd2f4a1b..e572d98ab17 100644
+index 64cdd2f4a..89f42900d 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -26,6 +26,7 @@
@@ -197,7 +198,18 @@ index 64cdd2f4a1b..e572d98ab17 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -399,6 +400,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -273,6 +274,10 @@ remove_duplicates (cpp_reader *pfile, struct cpp_dir *head,
+			     cur->name, xstrerror (errno));
+	      reason = REASON_NOENT;
+	    }
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++	  pcur = &cur->next;
++	  continue;
++#endif
+	}
+       else if (!S_ISDIR (st.st_mode))
+	cpp_error_with_line (pfile, CPP_DL_WARNING, 0, 0,
+@@ -399,6 +404,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
@@ -224,3 +236,5 @@ index 64cdd2f4a1b..e572d98ab17 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
+--
+2.34.1
-- 
2.43.0


