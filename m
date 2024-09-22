Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3A3CF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 03:32:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8995.1726975924344323320
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 20:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M3D3C1024523
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:04 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41sse4h4n5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuM2P5DOfA+c5evpJF94hdmzh4y3B6oOziuH+Ic55vE+DKWU+lbLm8YUUi9WJ7jGEUn2weMHdw/7TWaQfoEPbpQJjGCwCYyjVyLh6n3RWTVlj+TijucMyR+OFfPwp0Jn37P1oTKdgCmxHCIEQsoUBUVHUQ8o95qeSt4i9wIYB9nH2no+NDi5rjgR1eqkQ9xpTaLEOacwRv5hpfeDmMiqiTrEf9rcANwBX5FVpcb1WbIPgnu4DloWYacOgQ5/Hp85Tsy+fYHn2c5WYizRw0WVggF9SW2HPJQ701z7Z2jWJaKudR/r4saP1r6W/1w5OWMk70S+f8eTOZF9oXjV7tBshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcBOfPMg/RnMUz32W1+mSrbMj5zTR2ABadqiu+6VwE0=;
 b=cpwcSdSQ3fGs6Prd8FnsmpoGuQy9Dcv9Jq8qicdWn2M+QieVM8wkU03N7qIyOWBnYPs+GqWhdGBZDRJdxrHPaEBlUuY7VLRZlD23fa9WJVGoj0KY7+o9DqxaplrvIp4Rp35HpoBnlkRsRFY6oJhWXngKycTh3kOUcpgjYZyK8EPo0nlNBMz3TevP8f7bwJgX0AlwbH2K4ZbtT/6qh82dqbVbtOzSQeRMF0S9uv1MK9NIcWGc3sa/XvkyFNjIKrcqafuOCHRFslPHUoTrfoCExQuRF7B6OiXNyZz1VFq7u78LidmWft+6yTTKs9qbyh8+CI6yylJypgr1CVTNKtWlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Sun, 22 Sep 2024 03:31:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 03:31:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] tcl: upgrade 8.6.14 -> 8.6.15
Date: Sun, 22 Sep 2024 11:31:47 +0800
Message-Id: <20240922033148.1138038-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922033148.1138038-1-yi.zhao@windriver.com>
References: <20240922033148.1138038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::34) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: a403a430-e652-4390-454f-08dcdab71d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q7qcqecku+bOFw2tLAJCEcHVcVNkkrsSn6kLjPyn6WQ3ce+y/WHaNVKyH3Ft?=
 =?us-ascii?Q?Uh3KvQTbBGltKAjkOAEmmV+RpbGkBq7KLJy8S5gBBXo3xmYGNXanw4LHvorh?=
 =?us-ascii?Q?4dpJazxqPTTRnZufKzd5G4+eeszuErwQ4UfxOS7UXNn8K07GQf/Hq3wICaWb?=
 =?us-ascii?Q?ItT/kgTN/NjIiQ0Y/obOsEOYbATCrRazMw0famNrFvKe/G4ViTo7l6Sbu0/L?=
 =?us-ascii?Q?sss7e5Y3Ir369v3rvpvJf83/Se1Fn6fk4aGmqTcAUtds/j+CDRwx+CeEFAZR?=
 =?us-ascii?Q?GD8jI9o67EJp9YNE+evWh6fUgXqX7RXltrW8XqpapkX+CVWMfoA5kHse3Fmg?=
 =?us-ascii?Q?ZDuVvS9MKq/2UygpbIVFJbuufmypLSfepXahqw9XPp2wnXrHY/7uH2TOLcA1?=
 =?us-ascii?Q?0pUcDXc102UHAygmhjOZiw/zUtJ7m3jaBqMYDOI4lsQ2phcqOFIRuU8YvOMF?=
 =?us-ascii?Q?SP5TbWGWzFXDAbfMC6SfMLxvVEn/ZsoU7dijyhyNfiM8v5AKJ2eFyOgIape6?=
 =?us-ascii?Q?Lfw/qUzyY0usygOcVEmw/Qb7sV4E9utpOpS3lSFuVsSgS7GxA0JjYShF+AGc?=
 =?us-ascii?Q?QafU9275ePlXBxBT4a2eMeEwCQi5nnPlFXcb49Tq4RquE5qI0gE/KoVk1FRy?=
 =?us-ascii?Q?i1pugWhdd0Y+v+vwdqMd5ZdB7CqYVILIvTYCD/m70dg8iOHn8BoIDyp3kdrc?=
 =?us-ascii?Q?Gjfa0OSMVXfky1nlSyeldeFN3g+OrECpieg0iyvS8dQNxy+sgBDNeFJYhsXu?=
 =?us-ascii?Q?Vc2q1Ev4nbTteRW4RTppWEck2Q+QCrWhb+PJxay4hLLm2EH8vBxtaTc0XBlJ?=
 =?us-ascii?Q?7TAlJwrqEWIWce935aLT4bZ/s1cjrA8cpeNEl66LSM21h2J8i/e0bB9F3kBH?=
 =?us-ascii?Q?2wyezlTjqxsE7bBkwK8/7VuvO4qg6+vSjwr49RZaLPTu9mobqyb26J4NSDve?=
 =?us-ascii?Q?3eHYBtojoVI59UArYUFg2jjkxf5Z0ZY5+Asj3Bl+lGJNsMku3rCa/le24vp5?=
 =?us-ascii?Q?wULhR54t98y0hmBK1Dod4rt/r+vsDgYe0j/5jvQlIu42MNyLyPD3XocfL7z6?=
 =?us-ascii?Q?9MQnM1q76AfeGLmN1t8Ewm3wHYZPL14ZZ3gyFEHAys2GKfFUwaCe1wzJvu/i?=
 =?us-ascii?Q?n5TntAlhhP8B5Oa2UlnNXDpoOJ2QC3qdbsXoKty4dW1Mg2V3tNuEaKXLEq5v?=
 =?us-ascii?Q?tWQV/7ymMH4nBQdsQx+iPUeKFgk+s4k95C5kc2EcXqZBXVoyHtPNLgu6YSoz?=
 =?us-ascii?Q?j9aDe34HxjdIfdlg+o+fCwSYfJxcxyGW2tDCMk8TaoP3ZHpfZogGl7vGjrAG?=
 =?us-ascii?Q?Kpf7LFa3VxojK9ID06J7e4kOcxxDMrEqq9YQ3UvJrUFGCAoI3Upw3N4QexwU?=
 =?us-ascii?Q?hqvojmMbbEi2YIDYout3LBPcIPuO4OLWnCg7dHd4Y3fHboRCfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w9zI4qUHMwf9d2buSme3kiT/BK/SavJa7vITm8TLe+l077nPi+KcvYoUyeBU?=
 =?us-ascii?Q?2f0YxsUadjZPu5edawt/r7tIHTkotxNFB5g37ZbHE5MgPblEZC0X6YZoIx9H?=
 =?us-ascii?Q?APirQya6QOTtveLzs3pZZpPmO0LxpEYe6Mxg11Db0UZpwS2Z1G8Xo9rgakXh?=
 =?us-ascii?Q?250QqMayRBxna+wvpl/v4SJStFhNFQmqgFVL6yfCkMcuFabOTLL3MZxTe5aR?=
 =?us-ascii?Q?ZbosQc620z/+IImH5Z5YzM1joqUbe01CF8EJKYLwPzw7rTvGjnRgoaaeqsBA?=
 =?us-ascii?Q?9SHuffNCJ24rlsG8MXYVoJgtnamh5r1X3fYyry5qD3tUPoMaFg9pou08TDUM?=
 =?us-ascii?Q?FuFeTGWdL1SL8BCAmGusc+NwyxrW4Q/h4TxhlERR3q6l/FQPF0b4N2z3KBYg?=
 =?us-ascii?Q?wax21UAa9LhbYQYHuJAt6N/i6wkEm7+XWsZFdN5+XtknVAgMsEnQIPSzKz5Y?=
 =?us-ascii?Q?bTP2yetxqg4zi2StnZEvlgq8oHov4xd0vStW4a0wOBs27ENfW//EYkbAxWg6?=
 =?us-ascii?Q?/8zKhw+eXmduCNE76JOKTSNXfGVR+9wHoWbmZG1BT08Hhf7F+Pwn8F9pd7zw?=
 =?us-ascii?Q?QFHbpIurL3VCdkI0bmkdwz5B0Dxnztb/1To8aWZSp2JAMaJethEZn11NzeCu?=
 =?us-ascii?Q?89iwmJA18iRzzzbhCtXeUEwBA5ppX9Jl/PWFgIedv+2+uXLk1Q/ZwOLBkIEs?=
 =?us-ascii?Q?Tvwj0mbq3QTBAs/yR0jBJKNHfUTIQNM59vY1exrugXnAPDzhiSeY8r6ZePp6?=
 =?us-ascii?Q?KBj2wEoqXYZcV09MEsSn9ZMHEFwSxW150iZ4f2MHX1Zwv2y/iWM3xLQkzxEg?=
 =?us-ascii?Q?WW0f9WWSxCMXSPgLT8Or04t4YSMakpu+U8ysbctI3BnHfqq4wqwG5nKW4fQi?=
 =?us-ascii?Q?40ohUw0+QKcVX0EeMTIcePrbz5dmohHAF1SSKU5ZLxZIPVXs5eSswMgWOGMb?=
 =?us-ascii?Q?V/hk8XI6uJoxT5theRIFiS7v7tmyKCYgjVHuTmSd5p6UajYJ7XEzDhyRUfYH?=
 =?us-ascii?Q?mhHat1KYCf6SBxC9/ZV9JMQaq+h94TSgHb+TLME4SdqigNqoq2jkNtedsa0L?=
 =?us-ascii?Q?SQcbaLUz+qxKVHKV0Mi0jrzNe/C6NY/bsXhzs2IBRdbcwkEL8mn8Vplcfktn?=
 =?us-ascii?Q?TvC4FqKfCe9AsSHqYEFH29Bx7EpaLFJJLmyg6lE2uu+PJgtUzcHn6cpHiX2g?=
 =?us-ascii?Q?EJawYHxcHAD8gcG8qx7w5AvmHo+JXSMw+4bjPLWecT5J1w+1we087q7pVrSv?=
 =?us-ascii?Q?O4ZpMw+Xha6XKBD7q0lzbuVLSlJ+4AUEebe2/CEXf9XPR/9fQsGTcBzML3Q/?=
 =?us-ascii?Q?oVrsU5KeK+3R3N5bTHaq10AbLjAY0PWKPHmPKNUhZwGEY4qkAOb7bocgH40V?=
 =?us-ascii?Q?iOgoM++d/fGVogFs78GhbICLsHSZn7QuNnjd41g4xVO1kTtUPPep87YyDPiJ?=
 =?us-ascii?Q?Sh2R7NFawj5z24aofd3AAHxU6C5kIz2eruP8e3pd7KKVpMEjSSH51Nzf411e?=
 =?us-ascii?Q?xM/SSEXhjRmHyajhVhletnvEnAK784ghi9yMy+WIAEytVGz7SdsrXrfbnbFr?=
 =?us-ascii?Q?Cz5n9K+Bv939tZtjw7ZaAIeNCeJR4tzzNZ0FMKaM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a403a430-e652-4390-454f-08dcdab71d78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 03:31:58.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l15zQfkm4pgpGxYPfiiQE8FjYQxEwQItJz1z1xw7bhFtpDH1AvkVOk618D+7ixQmzrRU2Prg2ZyPrRzirwgnwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-Authority-Analysis: v=2.4 cv=ANzEoFnr c=1 sm=1 tr=0 ts=66ef8fb3 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=vnU8Wx6SqiJeCmBbrZAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XrhkXvTx_3D7PQhPmawcsStVIs5fXH9w
X-Proofpoint-GUID: XrhkXvTx_3D7PQhPmawcsStVIs5fXH9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_01,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409220025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 03:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204768

Release Notes:
https://sourceforge.net/p/tcl/mailman/message/58817026/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcltk/tcl/fix_non_native_build_issue.patch     | 14 +++++++-------
 .../tcltk/{tcl_8.6.14.bb => tcl_8.6.15.bb}         |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.14.bb => tcl_8.6.15.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 09c49daa2c..fac7ed7e28 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 371aa300369e9ea3234cba22d5c0babc7d40dfdf Mon Sep 17 00:00:00 2001
+From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [upstream does not support installed tests]
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 9dd053d..a3b7d69 100644
+index 965f6da..a0bd63f 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -815,7 +815,7 @@ tcltest-real:
+@@ -723,7 +723,7 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -21,7 +21,7 @@ index 9dd053d..a3b7d69 100644
  
  gdb-test: ${TCLTEST_EXE}
  	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
-@@ -824,17 +824,17 @@ gdb-test: ${TCLTEST_EXE}
+@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}
  	@printf '\n' >>gdb.run
  	@printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.tcl\
  		$(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.run
@@ -37,12 +37,12 @@ index 9dd053d..a3b7d69 100644
  # Useful target for running the test suite with an unwritable current
  # directory...
  ro-test: ${TCLTEST_EXE}
--	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
-+	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
+-	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
++	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -852,28 +852,28 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.14.bb b/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_8.6.14.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.15.bb
index de4f5b878f..340854056e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ff604f43862a778827d7ecd1ad7686950ac2ef48d9cf69d3424cea9de08d9a72"
+SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.25.1


