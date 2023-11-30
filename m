Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20D8C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:37:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.70257.1701344248496211508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0698bd4b2f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU7Ogbq031272
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:37:28 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3upgxtgfhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSdbeRyk2u+Rc8MHCoo5rMWIhSIAZ7jQxgbAcW+Jc2aprvsSVzXCEJFmKF059GaOGOGbNdfozp1GmA29K4cfDWirjITqmKddcFBL6k3HK5yEl5obuhhi8qtWX9WDNHyWUWQqWpDJXiado9BPULOxiJ0lIrBVgqQEblfPTbV3Dqv30jwyguRkkE+UkVeCd3Y233MHiENlL+kRVTH4Xu4VHJm1OdAkkqWqJ3mtbM1rQVKjh5ESNOMbM5ZFs1i75ifze2NLft4zpYiKFQLQ/oCutca3yzoybvriT1wviKAej2LUk8tme79loKpQLTS4cyFwCFXnpXE9rQgi6hw0WKQTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDIfhldW4lUanfFJSjZYW6S0pfF8fVM5ps1fVBDnpGs=;
 b=Tzjlb/y13gaEtogB5iMfs15SAUmqzmWGZXcjNbzfxipW009UMTW6f236UR3hsUc59+udMXuv4l3UspDg1AyNS/SLTn6Q+UQiSHzedC57k36t8qKv3AK9a3reixwdxwYlpxyt1jPNTzoeYFpF+UUL+ncKFt8qI9eR1s7EmwtO4LukNwpms0BLZM5gZAwMxW5K6IAdsfovPAUXz7KR7JQPayRj69OYX/lId+a9JhhRI+QVKh8H7vLhGxJ5bzrYmq04qWlw5OuoPniWrDWpFMaXN2DzUCVzfyYjD/f7bO1RtqRlebyNCRRR0AcDyq0rDwImbyxTaa+N1HBCzYvGy8uPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 11:37:25 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 11:37:25 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bash: changes to SIGINT handler while waiting for a child
Date: Thu, 30 Nov 2023 20:11:59 +0800
Message-Id: <20231130121159.3119668-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::14) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efb08fc-7ad7-430c-3b24-08dbf198b9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GsFHQIK9uqkaClIkyNL89qTQ/LGyPlYATLU/ILqYtEDKTEKU2qRqPMv0HRr6CEvuNhM+wSa9iHA6IfjxG1VEdNdUTpNCUlMj2uzI/dKAAIldkx5KoLwtyc3LoDWDEkrmZpqqPQdSgXaX0LR0hI4LHWeXBiMZt2sPoHDsxgM1uHGcUNofuW1BMKFJaB9UZ9E4Jr7R7272NnslSke7c53prHkZwV+hce0T5NZIv6eLQ8tfN3TAJ8lGzU3uZ8xK3aPhNGPcf5/jsyf8bX7a8FmRyupUcrOH3g09rQAjqBl/u8Xs6HlYrwzb5lr9MWYUbIs1cyJAVJRD/anzvyfTZ2h1b55giTzHUDVIczzdicCZU0B8zZ2VHgQL5CET2uxo1BHMHrx+miZ0Q7T4OT1bAPZbBnjtJFOI9piUOhukzF8le5IGbJiSiHGzANxZPcuOXMx84qdFjn7gUmXJhg2nQ5m2tG04QKuRgfLHEbCCzm26BEfnluE+DvdJsExHO8wf6k4OdsPChLPS3AcnjTELIZpN8LM+bbhniCtJPtiI1G4vh0CBSMIWWoOorTFQVk2IESIENhHg8GO/DJ7H4Idk3B3OaWBvJ4tKmYv+syCt+GHKGO28kt1c6EIEo9JIf5Uw4WCW5m1cqUmff5h6D8EPyEFfvmHilZCINPrs0J/BCC+5U6E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39850400004)(376002)(346002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6916009)(26005)(6506007)(1076003)(316002)(2616005)(6512007)(44832011)(8936002)(8676002)(6666004)(2906002)(478600001)(52116002)(6486002)(5660300002)(41300700001)(83380400001)(66946007)(66556008)(66476007)(202311291699003)(83170400001)(38100700002)(38350700005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IKJaceSTljZRw1CJl6Ds2c03d/oWu6VKMjkY7dUGy9Umv0Q/uYTKMiOW/xLL?=
 =?us-ascii?Q?WctDCTKsVEorGbeEzU4J6bQYactdlMpavfbgCeGrz38xgs6FgB+GUUrbhhfx?=
 =?us-ascii?Q?8tIghAukfhHMGuhMv2fhrI5dlvU/4jLkmjEaEC9cKS646jSlmALi0msbBc5T?=
 =?us-ascii?Q?q6yj/qcXiAI7fbtxj8TMNX5nkyRozbxw9HVDZOv8KTKW9Kl1t5LY1tpwyHQB?=
 =?us-ascii?Q?xs1kDVO08mweRSdddDJ7Rzk98Nl+rVu4WbvIMc86GUc+G1Gwi7iHDG+PsqLQ?=
 =?us-ascii?Q?6CbziBs++rSb+1oBdZNr1th08iY3IvjQqA66WytnkX/3dHLNks6PHyTwYL/3?=
 =?us-ascii?Q?bV4pYagXP5J+HGzbnEvJJAOLrA+Fnzli5ejklRohY/JNilA442CQhOpS90mW?=
 =?us-ascii?Q?UtCrv/WnW7owgkkfkP7lo4k99pUOVdpbJ9JVOXBsjNnw//5kXyEX2pnMFrEq?=
 =?us-ascii?Q?oY0XCUebyBuOJJN8mezl5ZtAZQ0JDp5KPpWbQDCLKBWw8vbsHWK9zct6tJBG?=
 =?us-ascii?Q?zL3tCBtKKt7E90rJGvfv7gTGoySKXiLnwy5bX5ri1h8gC+VNvsG8h2Ne2txG?=
 =?us-ascii?Q?t1rQVzTXDfkE/PuW8RWLGNSocjH0O5yEwMesBejxvT7FQCI5iZRIxz/cGP+4?=
 =?us-ascii?Q?IEBgyu5scbRUOOBBuWxKRjx33fytxWl2n7Nz/J6qVNzeMsBVzRY0bsjkv04C?=
 =?us-ascii?Q?EzNycWkhXauAegmR+5jpwi4FiwMoUp+hl9Bx2Fbao06oRJfReeqtB0ZXJNJQ?=
 =?us-ascii?Q?giwQ4N7Ki6zVT3t3lbM6Pz2+LZf/t9FS9lxRx9bVpSzKOh9QFrtsMyTINUzh?=
 =?us-ascii?Q?vMJhjTZyhtqeswTO4WLJJ53Cu0KMCjrcYCmQZDjjgffe0VOaGDxcIKsDqsnD?=
 =?us-ascii?Q?pfBMhkk97VB8oiK2mftcBAV4rMUAiyHxtDZ0BU/RAhTVFigQiqaIn7BLQqTO?=
 =?us-ascii?Q?0WerAHI/u0j0NgyaD/d8aRsZcZOzNgD2gL0TsgWsMS0diHHIEQTqyV3Pm5q6?=
 =?us-ascii?Q?cvZUBDUQeD9qnN1ssQAV8vJyl3du3CYQ3Snx5v6vYr7LqPinx/6XfYn44QNY?=
 =?us-ascii?Q?m/PrCjjSePzlCdD7apkDhGp+LpmRFTFxU99RP3ZdQkBAEI6iJ6+Q+rYw3rTm?=
 =?us-ascii?Q?ZyZMTYnvUdUbX9bHD6Ot7oFykqBu8RZ4gyFxbLQflUdrh1FWWnLr6k2m4sX+?=
 =?us-ascii?Q?aKGYOd87LDnipF9dIixhLGG1Nl7DTNqcGYjVhdpc2fHqmAP6L2yuH+Wfogf/?=
 =?us-ascii?Q?UDdwzlfr2S6kPYZuqNPZIgrMirB5c9K6lUD+senFuTwvIrzfdDBdS7AzMxKV?=
 =?us-ascii?Q?S5TfZTOn+GXGHfxf3LNOJ5advwPGk2ShxM1EHS/Mo2+U0HmeV5iR/5fteJ5s?=
 =?us-ascii?Q?9DTBHAaSFVrHK0NtRB5r8Jr2/UIdgIfXU2TfP/ZTwlTpRfbU4sEf6DHfBz+U?=
 =?us-ascii?Q?B9j9ZB9H/E+xhUd/Sn7wYYFiAiO/5k3ubFnB9Xve3BV1jyOITChI0/jiNjZ8?=
 =?us-ascii?Q?qWYoomVMLMq5ycm4Bg716EHFmm+blghla4yM8G9R91gUsvIIs3oR5wTMUkbC?=
 =?us-ascii?Q?okc7Ae6L0GcXvyaMYmPrx5spSkNcqeXuWsKrj+2KUqfRb1FjZTHHEh2ElI4e?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efb08fc-7ad7-430c-3b24-08dbf198b9bb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 11:37:25.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlRZJub8cegKt2hEPdec7o5nj2wdBJMkhk9u5ahzEROM3Ce1Uu4NeNgdfsLV4C3IHOrfvwTZx9zvajLAV3YFC349m/rf10Z+UVwA49sBEFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
X-Proofpoint-GUID: TlLVooKDqBVZuFMhrCjSjdI8ojA-YuND
X-Proofpoint-ORIG-GUID: TlLVooKDqBVZuFMhrCjSjdI8ojA-YuND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191500

From: Xiangyu Chen <xiangyu.chen@windriver.com>

It rarely observes the problem while running shell script aborting
test repeatedly, at the problem, the test shell script never returns
to shell

Steps to reproduce:
1. Run test script and ctrl-c repeatedly
2. Observe whether returns to shell after ctrl-c

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 226 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
new file mode 100644
index 0000000000..df92c2475d
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -0,0 +1,226 @@
+From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Mon, 30 Oct 2023 12:16:07 -0400
+Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
+ vertical whitespace after translating an integer
+
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=fe24a6a55e8850298b496c5b9d82f1866eba190e]
+
+[Adjust and drop some codes to be applicable the tree]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ general.c         |  5 +++--
+ jobs.c            | 24 ++++++++++++++++--------
+ tests/redir.right |  4 ++--
+ tests/redir11.sub |  2 ++
+ tests/type.right  | 16 ++++++++--------
+ tests/type.tests  | 24 ++++++++++++------------
+ 6 files changed, 43 insertions(+), 32 deletions(-)
+
+diff --git a/general.c b/general.c
+index 85c5a8b6..65e2ee06 100644
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
+index 6b986ed7..262d78de 100644
+--- a/jobs.c
++++ b/jobs.c
+@@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
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
+@@ -2735,6 +2739,7 @@ wait_sigint_cleanup ()
+ static void
+ restore_sigint_handler ()
+ {
++  cur_sigint_handler = old_sigint_handler;
+   if (old_sigint_handler != INVALID_SIGNAL_HANDLER)
+     {
+       set_signal_handler (SIGINT, old_sigint_handler);
+@@ -2758,8 +2763,7 @@ wait_sigint_handler (sig)
+       restore_sigint_handler ();
+       /* If we got a SIGINT while in `wait', and SIGINT is trapped, do
+ 	 what POSIX.2 says (see builtins/wait.def for more info). */
+-      if (this_shell_builtin && this_shell_builtin == wait_builtin &&
+-	  signal_is_trapped (SIGINT) &&
++      if (signal_is_trapped (SIGINT) &&
+ 	  ((sigint_handler = trap_to_sighandler (SIGINT)) == trap_handler))
+ 	{
+ 	  trap_handler (SIGINT);	/* set pending_traps[SIGINT] */
+@@ -2782,6 +2786,8 @@ wait_sigint_handler (sig)
+     {
+       set_exit_status (128+SIGINT);
+       restore_sigint_handler ();
++      if (cur_sigint_handler == INVALID_SIGNAL_HANDLER)
++	set_sigint_handler ();		/* XXX - only do this in one place */
+       kill (getpid (), SIGINT);
+     }
+ 
+@@ -2926,11 +2932,13 @@ wait_for (pid, flags)
+     {
+       SigHandler *temp_sigint_handler;
+ 
+-      temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
+-      if (temp_sigint_handler == wait_sigint_handler)
+-	internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
+-      else
+-	old_sigint_handler = temp_sigint_handler;
++      temp_sigint_handler = old_sigint_handler;
++      old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
++      if (old_sigint_handler == wait_sigint_handler)
++	{
++	  internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
++	  old_sigint_handler = temp_sigint_handler;
++	}
+       waiting_for_child = 0;
+       if (old_sigint_handler == SIG_IGN)
+ 	set_signal_handler (SIGINT, old_sigint_handler);
+@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
+ 		 SIGINT (if we reset the sighandler to the default).
+ 		 In this case, we have to fix things up.  What a crock. */
+ 	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
+-		  temp_handler = trap_to_sighandler (SIGINT);
++		temp_handler = trap_to_sighandler (SIGINT);
+ 	      restore_sigint_handler ();
+ 	      if (temp_handler == SIG_DFL)
+ 		termsig_handler (SIGINT);	/* XXX */
+diff --git a/tests/redir.right b/tests/redir.right
+index 8db10414..9e1403c8 100644
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
+index d417cdb6..ca9854cd 100644
+--- a/tests/redir11.sub
++++ b/tests/redir11.sub
+@@ -34,6 +34,8 @@ a=4 b=7 ss=4 declare -i ss
+ a=4 b=7 foo
+ echo after: $a
+ 
++exec 7>&- 4>&-
++
+ unset a
+ a=4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 3'; }
+ a=1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 4'; }
+diff --git a/tests/type.right b/tests/type.right
+index bbc228e8..e0a66745 100644
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
++./type.tests: line 59: type: morealias: not found
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
+index fd39c18a..ddc15407 100644
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
+2.35.5
+
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 6df73b653b..46d921bbe6 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
+           file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
-- 
2.25.1


