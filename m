Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F27C07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:31:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.68781.1701336692243096552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E/IdeLQF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698233ea9=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU7rnQr014143
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Aziaw0iWZ1s6q06OMq
	8xPcnidIp7Cf/uXlG1QIxfR7E=; b=E/IdeLQFdToJoEvoPv69tSwGnka/txBKp7
	AsN0wYNH8gV567Lrw3q7JdtnpPQjrVjD6zcOOlzpjcYHhe1iBNWTLfMO//sK6mmw
	tBKSzQCXV7T7aGxX4jBzBjtskVZkQqaxNk7FmqFMX/Va+rOE4Tq/WSinR6l0pmZN
	bo5qMgz/TFa1n/2Yz3u0BUWbc5YIFH3Y0E9ZGuO4IhEMFrGMFt7KKSIi1nwZhx3n
	RYIw8//h64vVB22unDg5RPpCxm9niTQu/8IZ8G31kQPMsCWXqEVgt9e22y82OZhy
	7dVTWoHf+8QZ/j4G6r4VH6lW4vPSRFUdu0gmzCFUgeB9FaxqwRuQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph108bfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:31:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRitDM/sISdvTVeH05RgcCe0zpzg1ybZ0AxM8zR1cvijlDTXB5VU+SNza7E4FO6Hodv1BT4J1D5s8eGUjZDkkaGUQs/OzgJXp4h+1Bpc0KQ5IdqVCy4n3b+YIrDjrXAZXycF4P6J3Hm5gQCm591FC92+3uPHMNlxOBMc1nLidr6UwOjGkLPXvX+0mhICwAtqApdcGVgx1d/EOhOd/4lRsP98xrXBGhlrxWj6qF+yYnq9AMFasOSMuNyQ7Rk+WLDROWrFjJakJ8jl/8Oq/JHXVOmyeuP1xbrYIdYz1kBc2Q5J2TPL+7XM1R2Rz0zefHfAN3j25U2BiIcXuk0chgD/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aziaw0iWZ1s6q06OMq8xPcnidIp7Cf/uXlG1QIxfR7E=;
 b=QhdA5fg3xVsvW3Ekri8O99IgEFljgOk12L1ygazEBcpC7zrTD1JFMdhB73rors2PNWkl97PMUheWY8R+FkJj3Hq3iptuSeg9E654xUUL2L7YnDEsVwJs6fLHCIA4nJoWKmWaRyQFa+YE94PuMRCLC91jm3+LFEKXB5syHwkFtFwHaosmnsRHELYtGd7crhxKcojm7XlE6EaGrpI50fzbL7WwyWLJ/wgyJL5yNzynDFmWw8JSvdh6wo4Yh9xTLrnuqDLGbBncwmOsFFfPXySxlrV1wscRIvZzXtwJjWRaBPopwAhww0BoLWuF5IblpVmsJHIp3o/Jr2z9nHHhPwxDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) by
 CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 09:31:29 +0000
Received: from DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::2cd5:2aa3:c5d6:ee75]) by DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::2cd5:2aa3:c5d6:ee75%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:31:29 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] bash: changes to SIGINT handler while waiting for a child
Date: Thu, 30 Nov 2023 01:31:22 -0800
Message-Id: <20231130093122.3068620-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::28) To DS0PR11MB6325.namprd11.prod.outlook.com
 (2603:10b6:8:cf::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6325:EE_|CO6PR11MB5586:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae00156-440b-4f6a-c73b-08dbf187219b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JbjZL4RY9lSkcpMgGO1gfCZwljVWLcXzHdMN4UIxCN/68ThdbU1NNHRs8m1lgQbLJvtewMiJVS9he5cn3z4TLF1+OQtt7xvMDZOthSIJ8xK+Me+R0s+lY39uNqGnLQ52t9M9x1u7wGwxNDVuGQY/uC9RcoIVU3TEXo/VQMr80tiuqyZNxbWfwGq4saWzdvizhL0vRiaZML/0fG4XQXRftam3jhji2i/tlE65IhF0xiNEKbSBv6OzbyXcEYXq8vcAEhnWRSldc/8LcKMq5B5T1nETnJCv0EV81onTpccnTyCSVsftK9YiFk9zxjigZIpWQ0e9qQYpbVTZsmsr4BJ2OW4/tsKs/FF4ZXkFuOVKpLaagNrQ+A2AWeR4cwiDUvMi5U2nOIUoChmpoFEJhm0YRyc3i5LRaB0d49ufl17ZfHIyyF/xoD9OR3MraeTtKWcrup+DvZLNo/mSPkprUNaihYxaDw1rK6NKMkyRw64hW2cTpk+9WB+iJv9lwKNFvHhNz7t0WLRU7MPmiBvI5Bi8BziQyo6Wi4RpzzCLxUT32sQwCXWvsH9AJ2GUbJ09mDW+am7jUNv3znv2Xp5acRkrsg+HjV5Sb+5h14kcmRrbEQY/ViiDHzm7KQXUabUjmvz2UCo7920/pJXCF+ICkCJVKRUHl4vmo6t0GNF3JOTqkxjGA2jD4UlqvTtdKqQgQk/ylgwdvkCi+dIel51vn9eGo1MS3Euc0I8IuN+6E0r6+f0EGXjerpSPQu3q5HWhYyV8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6325.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39850400004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(1076003)(6506007)(26005)(83380400001)(6666004)(52116002)(2616005)(6512007)(5660300002)(8676002)(8936002)(41300700001)(478600001)(2906002)(966005)(6486002)(316002)(6916009)(66476007)(66556008)(66946007)(202311291699003)(86362001)(36756003)(38100700002)(38350700005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ydfUeotXxXls3spo/VSvHJ+VRrLjuv9HjTMbdd6yRmOqsMebqNHXmD7021Eh?=
 =?us-ascii?Q?BFaDlkuO4pc6VXKQzp3g/wOuucVTqcIfdnmCza40swZ7gdAK5+L346PfxM/8?=
 =?us-ascii?Q?Kg0g6YK24mDleU9XwLWzF6MlLakHdz2orbJ7a+17WahupKfvRt2ZH7Y75AX8?=
 =?us-ascii?Q?h2p0dhkGeEaKMhqPOpk6O6wEEFtX5+opNLf173F12Db46MxhTx2f1Q3qUqHm?=
 =?us-ascii?Q?XiOEUmqGCV7NJijf+hg6JBeWc2huhCKqnz8oU5rGNJAenb2GX0cLxKesvNbt?=
 =?us-ascii?Q?6/4g5zaZHSIZJfmBsQIXiBRvIbxylklIgvC+ARcutRlie8EiIRxR5elvA9uN?=
 =?us-ascii?Q?iThDC1+5wXSxIbj1JSaDMEmlQr7hVZx2V8mkXuYQrKWvR0yxplt7BGEBGK/p?=
 =?us-ascii?Q?ifJafMfe3FWAm4Qnv4zzxiYfT03AqB3+50FglM5M0ulbTofr58fJ+dPLj7PA?=
 =?us-ascii?Q?za2yelvvwTBzUZHwWgA8BLEqS7AUbqurk3xiyXYzDhjhy8XB+P40NEsKBqFT?=
 =?us-ascii?Q?NKGtSQzqwnHQMo012n2kGqe54tgUdhgTNzi0sT2FVakcfKGuCFaaZRL9EB8U?=
 =?us-ascii?Q?K5Jp6fD9rRyonRV36gJwP+lQcOGLWjczYkAP6qwLBVvmda707SrGtE1vQ9ij?=
 =?us-ascii?Q?XbZSs6OdlylJqCoKNLn9APukgCJuxmQxNzA3ODB2+IErC1KfNGhwg/1yuTcD?=
 =?us-ascii?Q?Q4l/VtAKkSCvavvkDnjxUgQOk0Qi+FU4WHm2i0grrtj8elVTXOFsvrjMylJ3?=
 =?us-ascii?Q?y3YR0r1y5uIsCctl8v5xDrx1aovo33KrgiV4y1y1DJRBY4Fmxw/X3Aiyyael?=
 =?us-ascii?Q?mKAWl0qmyZyxL72Re1OxFptVj6sjvoa2FeKA+6qW+fh7aVwtUq9r7CQi1/op?=
 =?us-ascii?Q?QuujTS8Mxmbg2tEms37lCdJhw93utKIKkjRfr0oJtEErqgVuOIU5D4lrBG5E?=
 =?us-ascii?Q?IjeXqCsycx783eqFBzG0L+fv7Hyxd42E1WN+lwhM76so7vUcLrsrlcl2ANpY?=
 =?us-ascii?Q?c6Zu4wZW2K+Q7fl56lqlp4s8mcEYDRALHrrx9y6wwr2NOLrQX/Vk1gr8SlbZ?=
 =?us-ascii?Q?wmy8FFEdqQalyDSj2nJ0WH58yiTNKyENsWbRzJZQu+dhdvwqvnMzIfiKFEBn?=
 =?us-ascii?Q?4emImTJi1m68v1SQQsof2h8grDuT5ywUEpozEW7ctbjXxsfIhXcnCV4qZG5F?=
 =?us-ascii?Q?DZgvMoOSybH/SjsIuUigkHUXLYAAZsI5kOQxVY3uA3rY2aanWDNctBEaSucs?=
 =?us-ascii?Q?AfjnKguSdJ4yiAvvihuApGdTyEVjkrgeB6wHloiM2363xtN7pYyTWc0THm4/?=
 =?us-ascii?Q?xWd0cS8yjpsu39rbDrw0Lgp6blsaM4lEuJLrJDHtORhWi74JrK7UfmwtZPCZ?=
 =?us-ascii?Q?OgPz5zZCnnxgOD4nYCkckm/E/jGCw42otXVBCNqfh2BFBfNU039AH+pG3N3p?=
 =?us-ascii?Q?5XooS9chF2Q0cpO/fMr3mtOa/6Wdf2yUw5N/4pkjGmOxH0ni7uhAIAvKR3hh?=
 =?us-ascii?Q?Fa/rU/QzQjsAEUjszmgXAb5S+g5wsCLp1gct8Vi2yHRdYuc2aZQrkiuTYnzz?=
 =?us-ascii?Q?lOYWeTRMrR240Gs7CE6IQGJwOrbqeTsrJ0EfaZVJ2g15aR0J1j6KQt1tRWqi?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae00156-440b-4f6a-c73b-08dbf187219b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 09:31:29.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ud/R7zfArNXjtSeMUkag3qwm+QXzyE8nbRh6T8oMHFc/Oov6gOJ539KbHdmzRdZULCqasBM3KsDzyC/wc3DVuYIeoxLVV5/YUm/cooqM3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-Proofpoint-ORIG-GUID: 1gxaPr9T_-B7jFjZUbT5ohsdObLbCTaX
X-Proofpoint-GUID: 1gxaPr9T_-B7jFjZUbT5ohsdObLbCTaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191485

From: Wenlin Kang <wenlin.kang@windriver.com>

It rarely observes the problem while running shell script aborting
test repeatedly, at the problem, the test shell script never returns
to shell

Steps to reproduce:
1. Run test script and ctrl-c repeatedly
2. Observe whether returns to shell after ctrl-c

Fixed issue:
https://lists.gnu.org/archive/html/bug-bash/2023-10/msg00131.html

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 229 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
new file mode 100644
index 0000000000..c12b4b7766
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -0,0 +1,229 @@
+From 7e84276e07c0835a8729d6fe1265e70eedb2a7f7 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Mon, 30 Oct 2023 12:16:07 -0400
+Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
+ vertical whitespace after translating an integer
+
+Upstream-Status: Backport
+https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=fe24a6a55e8850298b496c5b9d82f1866eba190e
+
+[Adjust and drop some codes to be applicable the tree]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ general.c         |  5 +++--
+ jobs.c            | 26 ++++++++++++++++----------
+ tests/redir.right |  4 ++--
+ tests/redir11.sub |  2 ++
+ tests/type.right  | 16 ++++++++--------
+ tests/type.tests  | 24 ++++++++++++------------
+ 6 files changed, 43 insertions(+), 34 deletions(-)
+
+diff --git a/general.c b/general.c
+index 50d5216..68987e2 100644
+--- a/general.c
++++ b/general.c
+@@ -262,8 +262,9 @@ legal_number (string, result)
+   if (errno || ep == string)
+     return 0;	/* errno is set on overflow or underflow */
+ 
+-  /* Skip any trailing whitespace, since strtoimax does not. */
+-  while (whitespace (*ep))
++  /* Skip any trailing whitespace, since strtoimax does not, using the same
++     test that strtoimax uses for leading whitespace. */
++  while (isspace ((unsigned char) *ep))
+     ep++;
+ 
+   /* If *string is not '\0' but *ep is '\0' on return, the entire string
+diff --git a/jobs.c b/jobs.c
+index 7c3b6e8..84dab4d 100644
+--- a/jobs.c
++++ b/jobs.c
+@@ -2727,6 +2727,10 @@ wait_for_background_pids (ps)
+ #define INVALID_SIGNAL_HANDLER (SigHandler *)wait_for_background_pids
+ static SigHandler *old_sigint_handler = INVALID_SIGNAL_HANDLER;
+ 
++/* The current SIGINT handler as set by restore_sigint_handler. Only valid
++   immediately after restore_sigint_handler, used for continuations. */
++static SigHandler *cur_sigint_handler = INVALID_SIGNAL_HANDLER;   
++
+ static int wait_sigint_received;
+ static int child_caught_sigint;
+ 
+@@ -2743,6 +2747,7 @@ wait_sigint_cleanup ()
+ static void
+ restore_sigint_handler ()
+ {
++  cur_sigint_handler = old_sigint_handler;
+   if (old_sigint_handler != INVALID_SIGNAL_HANDLER)
+     {
+       set_signal_handler (SIGINT, old_sigint_handler);
+@@ -2766,8 +2771,7 @@ wait_sigint_handler (sig)
+       restore_sigint_handler ();
+       /* If we got a SIGINT while in `wait', and SIGINT is trapped, do
+ 	 what POSIX.2 says (see builtins/wait.def for more info). */
+-      if (this_shell_builtin && this_shell_builtin == wait_builtin &&
+-	  signal_is_trapped (SIGINT) &&
++	if (signal_is_trapped (SIGINT) &&
+ 	  ((sigint_handler = trap_to_sighandler (SIGINT)) == trap_handler))
+ 	{
+ 	  trap_handler (SIGINT);	/* set pending_traps[SIGINT] */
+@@ -2792,6 +2796,8 @@ wait_sigint_handler (sig)
+     {
+       set_exit_status (128+SIGINT);
+       restore_sigint_handler ();
++      if (cur_sigint_handler == INVALID_SIGNAL_HANDLER)
++		set_sigint_handler ();		/* XXX - only do this in one place */
+       kill (getpid (), SIGINT);
+     }
+ 
+@@ -2934,15 +2940,15 @@ wait_for (pid, flags)
+     {
+       SigHandler *temp_sigint_handler;
+ 
+-      temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
+-      if (temp_sigint_handler == wait_sigint_handler)
+-	{
++      temp_sigint_handler = old_sigint_handler;
++      old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
++      if (old_sigint_handler == wait_sigint_handler)
++		{
+ #if defined (DEBUG)
+-	  internal_warning ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
++			internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
+ #endif
+-	}
+-      else
+-	old_sigint_handler = temp_sigint_handler;
++			old_sigint_handler = temp_sigint_handler;
++		}
+       waiting_for_child = 0;
+       if (old_sigint_handler == SIG_IGN)
+ 	set_signal_handler (SIGINT, old_sigint_handler);
+@@ -4148,7 +4154,7 @@ set_job_status_and_cleanup (job)
+ 		 SIGINT (if we reset the sighandler to the default).
+ 		 In this case, we have to fix things up.  What a crock. */
+ 	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
+-		  temp_handler = trap_to_sighandler (SIGINT);
++		temp_handler = trap_to_sighandler (SIGINT);
+ 	      restore_sigint_handler ();
+ 	      if (temp_handler == SIG_DFL)
+ 		termsig_handler (SIGINT);	/* XXX */
+diff --git a/tests/redir.right b/tests/redir.right
+index 8db1041..9e1403c 100644
+--- a/tests/redir.right
++++ b/tests/redir.right
+@@ -154,10 +154,10 @@ foo
+ 1
+ 7
+ after: 42
+-./redir11.sub: line 53: $(ss= declare -i ss): ambiguous redirect
++./redir11.sub: line 55: $(ss= declare -i ss): ambiguous redirect
+ after: 42
+ a+=3
+ foo
+ foo
+-./redir11.sub: line 75: 42: No such file or directory
++./redir11.sub: line 77: 42: No such file or directory
+ 42
+diff --git a/tests/redir11.sub b/tests/redir11.sub
+index d417cdb..2a9f2b8 100644
+--- a/tests/redir11.sub
++++ b/tests/redir11.sub
+@@ -56,6 +56,8 @@ foo()
+ a=4 b=7 foo
+ echo after: $a
+ 
++exec 7>&- 4>&-
++
+ unset a
+ typeset -i a
+ a=4 eval echo $(echo a+=3)
+diff --git a/tests/type.right b/tests/type.right
+index f876715..c09ab73 100644
+--- a/tests/type.right
++++ b/tests/type.right
+@@ -24,15 +24,15 @@ func ()
+ }
+ while
+ while is a shell keyword
+-./type.tests: line 56: type: m: not found
+-alias m='more'
+-alias m='more'
+-m is aliased to `more'
++./type.tests: line 56: type: morealias: not found
++alias morealias='more'
++alias morealias='more'
++morealias is aliased to `more'
+ alias
+-alias m='more'
+-alias m='more'
+-alias m='more'
+-m is aliased to `more'
++alias morealias='more'
++alias morealias='more'
++alias morealias='more'
++morealias is aliased to `more'
+ builtin
+ builtin is a shell builtin
+ /bin/sh
+diff --git a/tests/type.tests b/tests/type.tests
+index fd39c18..ddc1540 100644
+--- a/tests/type.tests
++++ b/tests/type.tests
+@@ -25,8 +25,6 @@ type -r ${THIS_SH}
+ type notthere
+ command -v notthere
+ 
+-alias m=more
+-
+ unset -f func 2>/dev/null
+ func() { echo this is func; }
+ 
+@@ -49,24 +47,26 @@ command -V func
+ command -v while
+ command -V while
+ 
++alias morealias=more
++
+ # the following two lines should produce the same output
+ # post-3.0 patch makes command -v silent, as posix specifies
+ # first test with alias expansion off (should all fail or produce no output)
+-type -t m
+-type m
+-command -v m
++type -t morealias
++type morealias
++command -v morealias
+ alias -p
+-alias m
++alias morealias
+ 
+ # then test with alias expansion on 
+ shopt -s expand_aliases
+-type m
+-type -t m
+-command -v m
++type morealias
++type -t morealias
++command -v morealias
+ alias -p
+-alias m
++alias morealias
+ 
+-command -V m
++command -V morealias
+ shopt -u expand_aliases
+ 
+ command -v builtin
+@@ -76,7 +76,7 @@ command -V /bin/sh
+ 
+ unset -f func
+ type func
+-unalias m
++unalias morealias
+ type m
+ 
+ hash -r
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index 11c2314fbf..ab1ecffb3d 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://makerace.patch \
            file://makerace2.patch \
            file://CVE-2022-3715.patch \
+           file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558"
-- 
2.39.0


