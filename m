Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F46C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 06:55:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45860.1739775328864761534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 22:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4143e1bf64=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H6tSCP020295;
	Sun, 16 Feb 2025 22:55:28 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tq381evd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 22:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfpoP9vBn+M3OqfLx81b451kajG4dMa+2S4dru1/heWhlzhGbVNQd5SHBUfjIQ5UGGNp2t8PgBICeZfrlC7pu/fJC+wnn/ek0tWkgZtwBVf6kDEDN2cqkDD8eRppUunqFLhq0D98Pwgoh3AEC4PC6w7jmXZEGHDna2jF9AX2DIKizBwRRbYuDTtVtpyngA39jdtljh/aFtr1qVLYPFAutBZCp3QFPdxeHDTrupfKgFR4mCBHsdRxgBgAqUdRzK87cZEB507bJcmPkY1naf7T3BvfsRspob6brsWx0yuaW3gQRnHgR378GRwLb4qeiS9XjkVXyDsAeMNAvvy7zCcwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaJjR3iIP8X84V9EMGlxJPGnyYFU63JitIRnspeuKrs=;
 b=FYWdBXyFLvmhvZCreHUMQ+aYq041NTXT7HDgGDw2OTNMFkakRKqI6CVaMzs2SNI2QFc8WlkUoCiO4rAD14YXf9cdgcP9J1zOXaH8lvJvtnRwIBo1y27DI7bsMQXAG9czhOAlXnuamnp82ugUEAegSfTyuHUXkyZVxhSLCdOZJGyqYHJP8561dZb6b1cOGpZTi3eYstWQ9uF8LYRlcauReJ1j3BNkXWNxVCQjcxc8UiKGLdw/TWiLEIt+E+fxaHG7DUnws/tgo025EXcVF46el9gPhpvIVB7XmCUNul/IJWvi6d5NnYzcc4/cWsMVdL5Yo71ahJcobNH2UNjQPqCZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 06:55:25 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 06:55:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd/systemd-boot: upgrade from 257.1 to 257.3
Date: Sun, 16 Feb 2025 22:55:13 -0800
Message-Id: <20250217065513.2154649-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CY5PR11MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: f84af4e9-8e9c-4f05-7db3-08dd4f200de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v8n37MjCXjhFWF5vb9fbGV+cCbncsUuiXknuq7S/eNq4BdvpThjY42m1QIm0?=
 =?us-ascii?Q?XnvL1hFjN/FHRv5t5hNaCJdhXHAI8l/CElYZQ8IcExdcVpHadeUhqfnLRPHd?=
 =?us-ascii?Q?9WDDNDpQEfhtZx1HVy/yQ2uZyry+uG3+9fQcLVjykrBtjCicL7FAqfjxdJzL?=
 =?us-ascii?Q?eho3zlcleiKzBlG8CUJCDdBB/1mU/Eej37/cQWU3X9WSTZm4LXto2Aoa2H3a?=
 =?us-ascii?Q?WbAZqFjuSAcrURlVljRr7nlZofL7SkCDkTJSPNNsovDbzuVn2jRi4x87m25+?=
 =?us-ascii?Q?FAbcWihsKjieOLcQa/8JgzmJKSutB3NS7s3rzThTsXa8kuLLiouhVPJmSgkb?=
 =?us-ascii?Q?idMa4qRjA6NAgjtP3+eoC+g6cy+3SbUdqRnBSLJOvxsWC5erbWLlOdeXcTKI?=
 =?us-ascii?Q?eQDjxiBfv7RlkPWZ4xycxdgIw02Te8ujg8JtC2z9Ag1FTZTJbMtF+iI+GsN5?=
 =?us-ascii?Q?AsC/fvgTkXHTJIeXCOxlTmDpQqnZcVLe3XOdgfJtbt4gLicJOi9eJFRTF4OJ?=
 =?us-ascii?Q?J3P9OEBMQgINbKtsH0hbOWqtxxznBQMxvhLGBbpWbnBsh6a4MIeXyu87oLGv?=
 =?us-ascii?Q?baeTvfJTQ/ip6R9orFV6Ku8odvgTa6uiQxFaBKt6xvhN/qJRFpfwm7ttjOcQ?=
 =?us-ascii?Q?PC7c/H7u2mYaN2VXR80srqFYkW0uFUOgztE5VZUkIdD8YVb8ucLKCHs0b9/d?=
 =?us-ascii?Q?GtabqhkgClZv0pMgkacr4/xYW/+jLMzN3+8EwQxLLISxs8Zx0CINODXJnIgy?=
 =?us-ascii?Q?Z308GkjM5jynmFpzPQKgWlLeHlzL6O9Ibz6NYjiqX4O9KxJwTFnxcUUihsRt?=
 =?us-ascii?Q?ZBTRKpZdwcUAfmAN+yjBjqw8fzkTCDOJWzrVrP587SCH/bFoSr3r2B7sxnlo?=
 =?us-ascii?Q?7ew0FiDJuu9J9OVTBokJggBgt+QUSZnJcIDg7gVN+95LXSvClx/lEVIP4TXP?=
 =?us-ascii?Q?uz9JTG9nzpNheWE2sTcFzmLedl5K436wmzzYWwaOJ2qzbgng3AdLAddnwS8g?=
 =?us-ascii?Q?PqQikdRjyOHfooxa29/0/RRU+0kb55edDxM7oIDPXAG1kPr5WKiq/SumNqKB?=
 =?us-ascii?Q?9nsOWwYIMtLhAnQecN+IJ9IhqfR6GsXCPibzyZLMXBstAkcZ5DN22TCFnRRM?=
 =?us-ascii?Q?GJ/ynbBjpYiG/8UxPFzBQ2GMRrNCg5XDDO/ZvMMvnIpM6CoEPSfoSwD9lMz6?=
 =?us-ascii?Q?Cyq3zc72ZijUJnYhBZiWyprTc9O2fCIONo8IsOqe4q7SaUAaFoRc2DBuMi6M?=
 =?us-ascii?Q?kFoillci3yvZPTeMifPypsZ/WN0y9/QKuHFRSkJxPCikNmPq+R+u12/lPKwI?=
 =?us-ascii?Q?Iorq+i3mGpdPvnhJOQKhkHKFPN/Za+bEwbc0oVd6mHy8TME5cNIzMVHv5BdV?=
 =?us-ascii?Q?50QfjIxvB5Zm8x5hOVsGNWJ7WJvESPIn+x2dk1RL2UlxGHCXJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WLU9FbTPL6hmOghM9WSHTCpR17Ra9PNpFacmycn8CO177yG75QnMIzX/zIfX?=
 =?us-ascii?Q?bmuUxfe2RN4hh+76B9WLo1wrvR4vZPgbiTdCrULN/iNU02iY+qlpmPqqJN42?=
 =?us-ascii?Q?OYuW53DtYd2tXYwlMysc5pvB5EsrP4ppvRBDD2HhoEGzPWjdt1fxrsd1+0F/?=
 =?us-ascii?Q?r3L+JwHpakLQlAuSllyv8fSsqZN6pKDYJ3UZhUd+B1eKXGGGyI3x0kDa0noN?=
 =?us-ascii?Q?wJRpATkL8tGvB0+3KBJGMfrVqH9TDX+5wBPRZ9J/RUGgYJ7qoEZ+JgOTptIw?=
 =?us-ascii?Q?zXgdwF6EKR+7iUmMBVUzdBdonmJMygTlM8TPY1vySnsnCF7k16QLvxSCL6Ql?=
 =?us-ascii?Q?IAQ1pNro9LnmoU/nQW3KHd5q51DXpUXfFEnVWaIxyvOxxA1+2ahxMxIUKxZG?=
 =?us-ascii?Q?+lSsycOQBOA1eN0EG3+SU5w7dvRCwzbrBLTZeoVJ0ALgxwVWi0SwK9BXUm4V?=
 =?us-ascii?Q?bcYvMjFv3If9nITpAysTi3O4UKM7hfkY/FDMu6a/sLXMf/ZfuPNxZyifQxnk?=
 =?us-ascii?Q?xxJ2eVwRb0BKbtN+kEDnKP9AVOEpI4zXvlHvIeqbp7UVskTZ0WXyTcmlLDkt?=
 =?us-ascii?Q?ass8Zl++xZmTv4ayyRyawxyle3HqTgmSbLz0tHtYANaaRXNmiReXoBprCmKr?=
 =?us-ascii?Q?qW8jc0KzyLL46u0F17VP6pCa0WYyjNWDfmV4xKICCprdDjy96HpPbvwEvJgv?=
 =?us-ascii?Q?alMUCm0JlcD8V/JNfSbWV6Kyj62iSKfGjCuoseRH0bgnFFmGz2WqkVWTHaGZ?=
 =?us-ascii?Q?gPYRopEjZunuktp2OO6/yohy0R6C6mjZOPWMw7TS9pf6D2MCdQWWVGJ20gQJ?=
 =?us-ascii?Q?p/QFL3hYPBYdtFfq4lBQA4bRWMo4bw9wSKyXkay7WxfNgNftHIUYu4zaBVh7?=
 =?us-ascii?Q?Nqv46x6AG3gKSHMwTJI5/8DtH0OmmyedIkeerGtmWxY4sqm0TGuBas82w9Hy?=
 =?us-ascii?Q?B1r8SpUbmgNlHKpBmwAFQPQUCBCnLqX1Of+i7gylk/0EKpJGhillcdy2Yz7U?=
 =?us-ascii?Q?ft83oWdl83OOuse8tDDNcndJK39wx24Ai+GCWy/TYQUtAsbq0wckv2gvDiaC?=
 =?us-ascii?Q?zF3qapByMKT0sGPu31JtX1nWgYY1LpV7fcaT5+LtDIjFvUXcZB8fL3bIiuTx?=
 =?us-ascii?Q?8NeKzMV6nIpsliNgf6lXHa+lw8F5XglKYlis/WMZUEFo/8zHn5bGgbZci0tY?=
 =?us-ascii?Q?BraFGrKEkd07VFZDsrJBu8GdV88yGVKG+ycC8EgKVE/b1oeRVDmedYFtmHzP?=
 =?us-ascii?Q?tMGJT0uxq7z7M8Ar1lN5oQQ/YFSBu1/+QZLcQlug//ELMB0dtE+CxavSU+ax?=
 =?us-ascii?Q?sbb0NnMw8+k4jrkIO7+pTp5XLQtapHfzR2OE3lpKGe7kbSoijb29ca1K57Lh?=
 =?us-ascii?Q?caI0oXBC09ihorJhVaLDqKEEBx148AyQEkK/RMQHL+hXAVfLulL9e6O0uKn/?=
 =?us-ascii?Q?A0TN2p75x7QsYDAYX4Z3SzvBtlC/ch+GiFoWwANQaUX3crQamEPEJVKipFhB?=
 =?us-ascii?Q?3ZV9umjI6jkzjESf5Kh4auukNiKY8SXJEXQZwgfJbs9O506C0TYGygaXLchK?=
 =?us-ascii?Q?pngYxd80bUO5mams8X3m4naTHNuSJOZfOaJ+YMoqnqZ2YMJm6lqGs3WPXXmQ?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84af4e9-8e9c-4f05-7db3-08dd4f200de8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 06:55:24.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eB1ZzZSSi75dCt26MI4QzB4RjVchwvQQxyim/UkIY4zdE1bpVF+gC/ocebHb6xLwx44LH3mfr3yyQv0vKgdcaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
X-Proofpoint-GUID: rjb-fjHa5pur4p04eHob0PtT1_rYu6ig
X-Authority-Analysis: v=2.4 cv=fLPD3Yae c=1 sm=1 tr=0 ts=67b2dd60 cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=90lSomI8bR4duVVO9MoA:9 a=RacOqOSlOfnCFp6Q:21 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rjb-fjHa5pur4p04eHob0PtT1_rYu6ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 06:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211515

From: Chen Qi <Qi.Chen@windriver.com>

0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch is
dropped as it is in the new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ..._257.1.bb => systemd-boot-native_257.3.bb} |   2 -
 ...md-boot_257.1.bb => systemd-boot_257.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...vert-changes-to-use-SizeOfImage-from.patch | 122 ------------------
 .../{systemd_257.1.bb => systemd_257.3.bb}    |   0
 5 files changed, 1 insertion(+), 125 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.1.bb => systemd-boot-native_257.3.bb} (79%)
 rename meta/recipes-core/systemd/{systemd-boot_257.1.bb => systemd-boot_257.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
 rename meta/recipes-core/systemd/{systemd_257.1.bb => systemd_257.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.3.bb
similarity index 79%
rename from meta/recipes-core/systemd/systemd-boot-native_257.1.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.3.bb
index 15db156d4f..05ebe7b63e 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.3.bb
@@ -1,8 +1,6 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
-SRC_URI += "file://0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch"
-
 inherit native
 
 deltask do_configure
diff --git a/meta/recipes-core/systemd/systemd-boot_257.1.bb b/meta/recipes-core/systemd/systemd-boot_257.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.1.bb
rename to meta/recipes-core/systemd/systemd-boot_257.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 65785ac098..31d26a9fc1 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "47eea9ee9f46537bc18d6a64fa21fd9c50538e13"
+SRCREV = "876ee10e0eb4bbb0920bdab7817a9f06cc34910f"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch b/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
deleted file mode 100644
index 3be56cb9c0..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 60d76dce7b013406412bc9720dbf05fb558ea099 Mon Sep 17 00:00:00 2001
-From: Daan De Meyer <daan.j.demeyer@gmail.com>
-Date: Tue, 4 Feb 2025 09:24:26 +0100
-Subject: [PATCH] ukify/measure: Revert changes to use SizeOfImage from Linux
- PE binary
-
-With 19812661f1f65ebe777d1626b5abf6475faababc, we make sure at runtime
-in the stub itself that SizeOfImage from the Linux EFISTUB PE binary is
-taken into account, so there's no need to take this into account in ukify
-itself. By reverting the ukify change, we again ensure that Misc_VirtualSize
-reflects the actual size of the Linux EFISTUB PE binary in the .linux section
-which lots of tooling depends on. It also makes sure we don't measure a bunch
-of extra zeroes in the stub which should fix systemd-pcrlock measurements as
-well.
-
-This effectively reverts 2188c759f97e40b97ebe3e94e82239f36b525b10 and
-0005411352f9bda0d9887c37b9e75a2bce6c1133.
-
-Fixes #35851
----
- src/measure/measure.c | 32 --------------------------------
- src/ukify/ukify.py    | 16 ++--------------
- 2 files changed, 2 insertions(+), 46 deletions(-)
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38801c91292fde004bec0974ed5602984701e03b]
-
-diff --git a/src/measure/measure.c b/src/measure/measure.c
-index e583444e0bf..2057ce2a0e6 100644
---- a/src/measure/measure.c
-+++ b/src/measure/measure.c
-@@ -544,38 +544,6 @@ static int measure_kernel(PcrState *pcr_states, size_t n) {
-                         m += sz;
-                 }
- 
--                if (c == UNIFIED_SECTION_LINUX) {
--                        _cleanup_free_ PeHeader *pe_header = NULL;
--
--                        r = pe_load_headers(fd, /*ret_dos_header=*/ NULL, &pe_header);
--                        if (r < 0)
--                                log_warning_errno(r, "Failed to parse kernel image file '%s', ignoring: %m", arg_sections[c]);
--                        else if (m < pe_header->optional.SizeOfImage) {
--                                memzero(buffer, BUFFER_SIZE);
--
--                                /* Our EFI stub measures VirtualSize bytes of the .linux section into PCR 11.
--                                 * Notably, VirtualSize can be larger than the section's size on disk. In
--                                 * that case the extra space is initialized with zeros, so the stub ends up
--                                 * measuring a bunch of zeros. To accommodate this, we have to measure the
--                                 * same number of zeros here. We opt to measure extra zeros here instead of
--                                 * modifying the stub to only measure the number of bytes on disk as we want
--                                 * newer ukify + systemd-measure to work with older versions of the stub and
--                                 * as of 6.12 the kernel image's VirtualSize won't be larger than its size on
--                                 * disk anymore (see https://github.com/systemd/systemd/issues/34578#issuecomment-2382459515).
--                                 */
--
--                                while (m < pe_header->optional.SizeOfImage) {
--                                        uint64_t sz = MIN(BUFFER_SIZE, pe_header->optional.SizeOfImage - m);
--
--                                        for (size_t i = 0; i < n; i++)
--                                                if (EVP_DigestUpdate(mdctx[i], buffer, sz) != 1)
--                                                        return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Failed to run digest.");
--
--                                        m += sz;
--                                }
--                        }
--                }
--
-                 fd = safe_close(fd);
- 
-                 if (m == 0) /* We skip over empty files, the stub does so too */
-diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
-index 3f36aa7af6b..08e7622c499 100755
---- a/src/ukify/ukify.py
-+++ b/src/ukify/ukify.py
-@@ -388,7 +388,6 @@ class Section:
-     tmpfile: Optional[IO[Any]] = None
-     measure: bool = False
-     output_mode: Optional[str] = None
--    virtual_size: Optional[int] = None
- 
-     @classmethod
-     def create(cls, name: str, contents: Union[str, bytes, Path, None], **kwargs: Any) -> 'Section':
-@@ -918,10 +917,7 @@ def pe_add_sections(uki: UKI, output: str) -> None:
- 
-         new_section.set_file_offset(offset)
-         new_section.Name = section.name.encode()
--        if section.virtual_size is not None:
--            new_section.Misc_VirtualSize = section.virtual_size
--        else:
--            new_section.Misc_VirtualSize = len(data)
-+        new_section.Misc_VirtualSize = len(data)
-         # Non-stripped stubs might still have an unaligned symbol table at the end, making their size
-         # unaligned, so we make sure to explicitly pad the pointer to new sections to an aligned offset.
-         new_section.PointerToRawData = round_up(len(pe.__data__), pe.OPTIONAL_HEADER.FileAlignment)
-@@ -1166,6 +1162,7 @@ def make_uki(opts: UkifyConfig) -> None:
-         ('.uname',   opts.uname,      True),
-         ('.splash',  opts.splash,     True),
-         ('.pcrpkey', pcrpkey,         True),
-+        ('.linux',   linux,           True),
-         ('.initrd',  initrd,          True),
-         ('.ucode',   opts.microcode,  True),
-     ]  # fmt: skip
-@@ -1182,15 +1179,6 @@ def make_uki(opts: UkifyConfig) -> None:
-     for section in opts.sections:
-         uki.add_section(section)
- 
--    if linux is not None:
--        try:
--            virtual_size = pefile.PE(linux, fast_load=True).OPTIONAL_HEADER.SizeOfImage
--        except pefile.PEFormatError:
--            print(f'{linux} is not a valid PE file, not using SizeOfImage.')
--            virtual_size = None
--
--        uki.add_section(Section.create('.linux', linux, measure=True, virtual_size=virtual_size))
--
-     # Don't add a sbat section to profile PE binaries.
-     if opts.join_profiles or not opts.profile:
-         if linux is not None:
--- 
-2.43.0
-
diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-core/systemd/systemd_257.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.1.bb
rename to meta/recipes-core/systemd/systemd_257.3.bb
-- 
2.25.1


