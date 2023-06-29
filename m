Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C45EB64DD
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:19:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9427.1688048344472322139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X1WTIH8C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6544a6758f=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TCS1Zm004293
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=5KNu3K/5zmMjKvlE+PvZkOfGs6zsQig0MylcxVzqceQ=; b=
	X1WTIH8C3M41SzIXoH8KH2h9KmFnFbiKGZAmt7K3ogD/JMu4dhK2ok8E2T8C0vEh
	+8yTcEKbZANtAGifxjW+vUTItDs66GMQT0A7WKIoDst11OtFMBb7sB2UduWMokk1
	3hv1wXCnSu8ZERDZcX5GkhM+LFgkOZkBYoJDOxQ/AsUOwcQLfuvQf/Fm9uQKb8zD
	wsLtqxUA0FKJxpmvvkT0JeK37jAoz1dEczGEt/MYEX6YWqs5k7Fh3Ew4AgWz7YmC
	VZ3Ef39/uKrMWeQLEgEKiJlTpVd2pRmLHo9wo1lWLoWzBiq8EmolkM44aUuGFYoa
	ck+l9y22WQuBQw3exZfnKw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb44ef-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB/eOSR0ZMa2JU+xxWBb6tFREMkBa9G0VqDMXfTV0byv1GDTB1fvhv16BFcF/DzR8O6mZy7d+H47/umcZi3zb0Tm0BwZUkVGBaih2/bocz8jytFCKTZZpXOGn2jgABe6aKkP4KJAF1hFXOirLr4jpFg+XSUUV7VUjZ7AO7dvxx1jnmnVzr1rt+F6bfG3+uzm2Iteek4zRwJdWGn4qe3IUbqnOYbLfvAU1Hp4X4k/lbx5vBt1Lehl+JLX3MGzFsFdBoYQyrKS1vwK7dcwmNtLm5udHaXxu8KnyVVwY3P/dwNqJF5bJ5zfBP5HHcYjaQs1VlitkVxPR9SpWqpwKA3+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KNu3K/5zmMjKvlE+PvZkOfGs6zsQig0MylcxVzqceQ=;
 b=Pb6UG0CxfzmcsRia6zAEtUDayAhEVlpIB4FxwU/Hz6zks8GWi72mVhzAWzT55W8FJoUUUQLzLbPjW2qQLoYWgePKSHmzngclOH94gI/czGtog2pmRWWdiiN9XkOeGtspoyDVqWGEP+r6gaYlfyDZc/TW7AZEexavhiSHkwL4cLA6XCSGXfhjEMGystYUDPigwjlqT9MMgzvOunKoFvzU8EwYBmff+dziFq4ZeJlOmfBDpYSDm4nS6hBvY5zr6SkFbLYzsmAkcXSCuZKBWgPZLr2p8S980Kv1LTKXE75Z9ejY4bhEHwzKbjLR2wZ23HUcaA/SftYgEuOBhypd+MOABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:18:59 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 14:18:59 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] mdadm: skip running known broken ptests
Date: Thu, 29 Jun 2023 17:18:36 +0300
Message-Id: <20230629141836.3431391-4-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
References: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|DS0PR11MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cf5a60-ec20-4645-a4fe-08db78abc7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/UPhCPY7zueXuy2URxn3Q0ftpfokjJABrcwmu4G97mOl/mVSvqKUHxqWZ2oFBgRPfS7KhPAiScQgYYmKNoX8aqd5U2FegDL/Q6VGdCJ+ujKeOF7wM0HiAqNRddSgZO882ZIz7pilihxPdag7GNbE2rXtLdpmYVGlSjuLBivZ+r7+RXN6Z5Dt7ucGuA32sLsvResAoD2+sdk57sqNIeQ4ilDZ1yRQKYXEeuKZwjL28PhlsZObm+1qGgCE4pkFL+T0abevbHonYW3imkMW082GB2IpQSf9mmYUHJ+QiZwj+4g532Vmu2yyF8RpGDUl4Ukpj+2OPeY3XgH7YP/NZ1u0m2Lk0Mugk1cB9Lw9L6Kjy0y9kjZlnMhIpCQ313wFp3ZuwtmGSSi+Xzg45sc6UIer1tI2OqyC+rL/WxEjQhP+HaiIE3ZsTbrjUrMHzJfZiwXdNwoQYIrSJfcEH1iFDcN+kHlm9CxU+8EAgizJSvp5jQwObWXYQER5r9RVN5Pd25+bea84+E1YBnnrqULGXp9THlrz/qtzLQvsVypKBFfF0t3qoP+7fMbUCJen11nWturmRMpA/8OZ88vcqH6vSTV/rPWfB6ih6NyppKDSjYkBfiatEdh4qcQFIrQIIQOB9VUe/TDVxnkyKCt7pfT73+Kqy/mdvcy6H0F+Avy8hINo2volpjQ7xcWuHxiy7Di//sdWWwgkV2VZPuA5e7awKWZwWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(451199021)(186003)(2906002)(5660300002)(30864003)(26005)(316002)(36756003)(8676002)(6666004)(6486002)(6916009)(966005)(478600001)(86362001)(1076003)(38100700002)(38350700002)(66476007)(52116002)(83380400001)(66946007)(8936002)(41300700001)(66556008)(9686003)(2616005)(6506007)(6512007)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C0i8GzaDjWgzcdxjGwwPZQYPvUyealq4RQKqvWQDbKNjREP75nxMi39WitXI?=
 =?us-ascii?Q?oabgSnmyF+arqGjYGu/P8qq7dTmJ6TpDuYa72gCDZFdtu1y4R9l+ixpXJsQJ?=
 =?us-ascii?Q?KqyuflP0l3bLoM1K98HBRdBvYikT+dNXCkFXGQ3ZakFg8x1/FXV0hjmfnsGN?=
 =?us-ascii?Q?uohIwlzijSbsCzuFtj10CCBcKRdgUeHw5z6ey3DTGZZSeuz0oElrExki3PtE?=
 =?us-ascii?Q?M98bpWiuu0DPvceG15dqKRe6l7fEZAUVJC78HxLsbO+wv5h/lx1YdnaIThkO?=
 =?us-ascii?Q?YSja3FSQPaOOK+E+jBHMEeHBgXBZkUiOlbCHVavKStQZ3ulfhNLOvGXSXv7T?=
 =?us-ascii?Q?UZJzXTr4n0TXS6i3Yedi7zdPnZSp/XqGHx+M8g3wtScNJF/Le5GYeVZQ/KYJ?=
 =?us-ascii?Q?LcKOljYV3E7Ry/0sC6jjgoE7i1B4aITUw8erPYQm6o28XH0Z6BEq20NV00HV?=
 =?us-ascii?Q?PjSJV6T8CJRWvPRvPe3LA+DF/p+C9IfaU6oJDBBNT1xgzN6QPlLPHM2M/f2M?=
 =?us-ascii?Q?TOERC9nIB2/FW/+RWnKQ46ppzg6UQLcq+SjEy+02o9s5YeL5vw33wfnFv0Gs?=
 =?us-ascii?Q?VeT3yY0weAbB2Iwi7Lr3CrV1MK6b+umjn5sfsIo7WNglKdajdpTy+QtU+WaW?=
 =?us-ascii?Q?351sO6YNyhNOOVfTJw8liSRSukKIvQsEFnJ7M37u5R17ZE3znDFASezhH38V?=
 =?us-ascii?Q?BeDX1w7NR1lezsfhiFIEsUMtJl4N2KduAR7fMGTYV5MrzvdbEc9BbjPVc1ft?=
 =?us-ascii?Q?AwOLP0iiIJlt5z8gbIhktesQUPC7UbKepRNBf0CJns7kmQ3ogMLBtYusQlcP?=
 =?us-ascii?Q?TzvIsTOVadpQTNS3YWTR0PVS0EnN6Rwj+gUiAHkJZl+vg2wM2xFxNaNgDb1s?=
 =?us-ascii?Q?rNSqPjx30J2Gv4cl0sch5gQORxoDXGreUTSJOHeEtOrybGEl+dEjLchnjh8P?=
 =?us-ascii?Q?QcJgKS+JeDutZtr7s1J69lPskTRvxjLw05R/CShjC6jIxcQf5CwC21pORflr?=
 =?us-ascii?Q?EypDef1W88vsgOIQDJaZjN3fJL34PuwCQbN/MkK7hQP+/cH4r0JhRggNk9iQ?=
 =?us-ascii?Q?+M9m5bS7f+4bIOpZEvgKuMlyf6EGSOZuU73eem9DIAo/cihPDjbQ1reb7X3J?=
 =?us-ascii?Q?dceJSoGXL3anLRIjJVJmlMKjuaej0Ujj+rOp1kJsmDphkqL2bUwkqK2yw/SC?=
 =?us-ascii?Q?udrcsVPe/pnY4xn8K0BuzlvaW9ulGJBzeumkQOMT65qRL5IgJ2mzQlI4DBm/?=
 =?us-ascii?Q?noNialDFfkrndpR/1ufPlSu9kV2ZU4yvgDPS59Oy2Ou5QtxIklISJ2iKFOc8?=
 =?us-ascii?Q?Qn09jhJ55vSdKw0TQlH+Cew/BG9q1ER43T1An8maf8fHVHrNPvmaNQyIJBBW?=
 =?us-ascii?Q?ZPDZ3LNJj39A80IUnB9kJto2anPtjg1PJjAxLuAkW12HWDQv682ae/Q+MXKf?=
 =?us-ascii?Q?DuAruqAeV50j3TvrBeBloC75bCFOrd61khYBxqElJXlQLUiyIu1Dn9l4Gasj?=
 =?us-ascii?Q?Z1T6aNqDSRnrYbWiOQ3QtBpDQVR2ZfWWz3Vle8o4woBdq/M6KYJo9qgTkIuE?=
 =?us-ascii?Q?9f0MoMNiHBHWCbnpeVsHd8lsqmDco53Z7b67uM1yYLo75znBBqL8cI8cDaUh?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cf5a60-ec20-4645-a4fe-08db78abc7f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:18:59.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erQWfaTtR0gnzqIdCVSDmsITc9cy6T+6cgM6hFfK5qJM8OkKgBEleyJPB6wytHA063aytVyOKiBazB5RgsSwermLYFn3YZWIJ1iLl2reG9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
X-Proofpoint-GUID: RpfhSIqlyYOsKKXxP23UUcz30dh9bTvJ
X-Proofpoint-ORIG-GUID: RpfhSIqlyYOsKKXxP23UUcz30dh9bTvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183634

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Upstream marked some testcases as "KNOWN BROKEN" and introduced the
"--skip-broken" flag to ignore them when running the testsuite (commits [1]
and [2]). Backport these two commits to get rid of the last remaining ptest
failures.

Also, add the "--skip-broken" option to the run-ptest script.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
[2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...Mark-and-ignore-broken-test-failures.patch | 128 +++++
 ...dd-broken-files-for-all-broken-tests.patch | 454 ++++++++++++++++++
 meta/recipes-extended/mdadm/files/run-ptest   |   2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 +
 4 files changed, 585 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch

diff --git a/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
new file mode 100644
index 0000000000..c55bfb125b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
@@ -0,0 +1,128 @@
+From feab1f72fcf032a4d21d0a69eb61b23a5ddb3352 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:18 -0600
+Subject: [PATCH 5/6] mdadm/test: Mark and ignore broken test failures
+
+Add functionality to continue if a test marked as broken fails.
+
+To mark a test as broken, a file with the same name but with the suffix
+'.broken' should exist. The first line in the file will be printed with
+a KNOWN BROKEN message; the rest of the file can describe the how the
+test is broken.
+
+Also adds --skip-broken and --skip-always-broken to skip all the tests
+that have a .broken file or to skip all tests whose .broken file's first
+line contains the keyword always.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
+
+[OP: adjusted context for mdadm-4.2]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ test | 37 +++++++++++++++++++++++++++++++++++--
+ 1 file changed, 35 insertions(+), 2 deletions(-)
+
+diff --git a/test b/test
+index 8f189d9..ee8fba1 100755
+--- a/test
++++ b/test
+@@ -10,6 +10,8 @@ devlist=
+ 
+ savelogs=0
+ exitonerror=1
++ctrl_c_error=0
++skipbroken=0
+ prefix='[0-9][0-9]'
+ 
+ # use loop devices by default if doesn't specify --dev
+@@ -35,6 +37,7 @@ die() {
+ 
+ ctrl_c() {
+ 	exitonerror=1
++	ctrl_c_error=1
+ }
+ 
+ # mdadm always adds --quiet, and we want to see any unexpected messages
+@@ -79,8 +82,21 @@ mdadm() {
+ do_test() {
+ 	_script=$1
+ 	_basename=`basename $_script`
++	_broken=0
++
+ 	if [ -f "$_script" ]
+ 	then
++		if [ -f "${_script}.broken" ]; then
++			_broken=1
++			_broken_msg=$(head -n1 "${_script}.broken" | tr -d '\n')
++			if [ "$skipbroken" == "all" ]; then
++				return
++			elif [ "$skipbroken" == "always" ] &&
++			     [[ "$_broken_msg" == *always* ]]; then
++				return
++			fi
++		fi
++
+ 		rm -f $targetdir/stderr
+ 		# this might have been reset: restore the default.
+ 		echo 2000 > /proc/sys/dev/raid/speed_limit_max
+@@ -97,10 +113,15 @@ do_test() {
+ 		else
+ 			save_log fail
+ 			_fail=1
++			if [ "$_broken" == "1" ]; then
++				echo "  (KNOWN BROKEN TEST: $_broken_msg)"
++			fi
+ 		fi
+ 		[ "$savelogs" == "1" ] &&
+ 			mv -f $targetdir/log $logdir/$_basename.log
+-		[ "$_fail" == "1" -a "$exitonerror" == "1" ] && exit 1
++		[ "$ctrl_c_error" == "1" ] && exit 1
++		[ "$_fail" == "1" -a "$exitonerror" == "1" \
++		  -a "$_broken" == "0" ] && exit 1
+ 	fi
+ }
+ 
+@@ -117,6 +138,8 @@ do_help() {
+ 		--logdir=directory          Directory to save all logfiles in
+ 		--save-logs                 Usually use with --logdir together
+ 		--keep-going | --no-error   Don't stop on error, ie. run all tests
++		--skip-broken               Skip tests that are known to be broken
++		--skip-always-broken        Skip tests that are known to always fail
+ 		--dev=loop|lvm|ram|disk     Use loop devices (default), LVM, RAM or disk
+ 		--disks=                    Provide a bunch of physical devices for test
+ 		--volgroup=name             LVM volume group for LVM test
+@@ -211,6 +234,12 @@ parse_args() {
+ 		--keep-going | --no-error )
+ 			exitonerror=0
+ 			;;
++		--skip-broken )
++			skipbroken=all
++			;;
++		--skip-always-broken )
++			skipbroken=always
++			;;
+ 		--disable-multipath )
+ 			unset MULTIPATH
+ 			;;
+@@ -275,7 +304,11 @@ main() {
+ 			if [ $script == "$testdir/11spare-migration" ];then
+ 				continue
+ 			fi
+-			do_test $script
++			case $script in
++			 *.broken) ;;
++			 *)
++			     do_test $script
++			 esac
+ 		done
+ 	fi
+ 
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
new file mode 100644
index 0000000000..115b23bac5
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
@@ -0,0 +1,454 @@
+From fd1c26ba129b069d9f73afaefdbe53683de3814a Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:19 -0600
+Subject: [PATCH 6/6] tests: Add broken files for all broken tests
+
+Each broken file contains the rough frequency of brokeness as well
+as a brief explanation of what happens when it breaks. Estimates
+of failure rates are not statistically significant and can vary
+run to run.
+
+This is really just a view from my window. Tests were done on a
+small VM with the default loop devices, not real hardware. We've
+seen different kernel configurations can cause bugs to appear as well
+(ie. different block schedulers). It may also be that different race
+conditions will be seen on machines with different performance
+characteristics.
+
+These annotations were done with the kernel currently in md/md-next:
+
+ facef3b96c5b ("md: Notify sysfs sync_completed in md_reap_sync_thread()")
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ tests/01r5integ.broken                     |  7 ++++
+ tests/01raid6integ.broken                  |  7 ++++
+ tests/04r5swap.broken                      |  7 ++++
+ tests/07autoassemble.broken                |  8 ++++
+ tests/07autodetect.broken                  |  5 +++
+ tests/07changelevelintr.broken             |  9 +++++
+ tests/07changelevels.broken                |  9 +++++
+ tests/07reshape5intr.broken                | 45 ++++++++++++++++++++++
+ tests/07revert-grow.broken                 | 31 +++++++++++++++
+ tests/07revert-shrink.broken               |  9 +++++
+ tests/07testreshape5.broken                | 12 ++++++
+ tests/09imsm-assemble.broken               |  6 +++
+ tests/09imsm-create-fail-rebuild.broken    |  5 +++
+ tests/09imsm-overlap.broken                |  7 ++++
+ tests/10ddf-assemble-missing.broken        |  6 +++
+ tests/10ddf-fail-create-race.broken        |  7 ++++
+ tests/10ddf-fail-two-spares.broken         |  5 +++
+ tests/10ddf-incremental-wrong-order.broken |  9 +++++
+ tests/14imsm-r1_2d-grow-r1_3d.broken       |  5 +++
+ tests/14imsm-r1_2d-takeover-r0_2d.broken   |  6 +++
+ tests/18imsm-r10_4d-takeover-r0_2d.broken  |  5 +++
+ tests/18imsm-r1_2d-takeover-r0_1d.broken   |  6 +++
+ tests/19raid6auto-repair.broken            |  5 +++
+ tests/19raid6repair.broken                 |  5 +++
+ 24 files changed, 226 insertions(+)
+ create mode 100644 tests/01r5integ.broken
+ create mode 100644 tests/01raid6integ.broken
+ create mode 100644 tests/04r5swap.broken
+ create mode 100644 tests/07autoassemble.broken
+ create mode 100644 tests/07autodetect.broken
+ create mode 100644 tests/07changelevelintr.broken
+ create mode 100644 tests/07changelevels.broken
+ create mode 100644 tests/07reshape5intr.broken
+ create mode 100644 tests/07revert-grow.broken
+ create mode 100644 tests/07revert-shrink.broken
+ create mode 100644 tests/07testreshape5.broken
+ create mode 100644 tests/09imsm-assemble.broken
+ create mode 100644 tests/09imsm-create-fail-rebuild.broken
+ create mode 100644 tests/09imsm-overlap.broken
+ create mode 100644 tests/10ddf-assemble-missing.broken
+ create mode 100644 tests/10ddf-fail-create-race.broken
+ create mode 100644 tests/10ddf-fail-two-spares.broken
+ create mode 100644 tests/10ddf-incremental-wrong-order.broken
+ create mode 100644 tests/14imsm-r1_2d-grow-r1_3d.broken
+ create mode 100644 tests/14imsm-r1_2d-takeover-r0_2d.broken
+ create mode 100644 tests/18imsm-r10_4d-takeover-r0_2d.broken
+ create mode 100644 tests/18imsm-r1_2d-takeover-r0_1d.broken
+ create mode 100644 tests/19raid6auto-repair.broken
+ create mode 100644 tests/19raid6repair.broken
+
+diff --git a/tests/01r5integ.broken b/tests/01r5integ.broken
+new file mode 100644
+index 0000000..2073763
+--- /dev/null
++++ b/tests/01r5integ.broken
+@@ -0,0 +1,7 @@
++fails rarely
++
++Fails about 1 in every 30 runs with a sha mismatch error:
++
++    c49ab26e1b01def7874af9b8a6d6d0c29fdfafe6 /dev/md0 does not match
++    15dc2f73262f811ada53c65e505ceec9cf025cb9 /dev/md0 with /dev/loop3
++    missing
+diff --git a/tests/01raid6integ.broken b/tests/01raid6integ.broken
+new file mode 100644
+index 0000000..1df735f
+--- /dev/null
++++ b/tests/01raid6integ.broken
+@@ -0,0 +1,7 @@
++fails infrequently
++
++Fails about 1 in 5 with a sha mismatch:
++
++    8286c2bc045ae2cfe9f8b7ae3a898fa25db6926f /dev/md0 does not match
++    a083a0738b58caab37fd568b91b177035ded37df /dev/md0 with /dev/loop2 and
++    /dev/loop3 missing
+diff --git a/tests/04r5swap.broken b/tests/04r5swap.broken
+new file mode 100644
+index 0000000..e38987d
+--- /dev/null
++++ b/tests/04r5swap.broken
+@@ -0,0 +1,7 @@
++always fails
++
++Fails with errors:
++
++  mdadm: /dev/loop0 has no superblock - assembly aborted
++
++   ERROR: no recovery happening
+diff --git a/tests/07autoassemble.broken b/tests/07autoassemble.broken
+new file mode 100644
+index 0000000..8be0940
+--- /dev/null
++++ b/tests/07autoassemble.broken
+@@ -0,0 +1,8 @@
++always fails
++
++Prints lots of messages, but the array doesn't assemble. Error
++possibly related to:
++
++  mdadm: /dev/md/1 is busy - skipping
++  mdadm: no recogniseable superblock on /dev/md/testing:0
++  mdadm: /dev/md/2 is busy - skipping
+diff --git a/tests/07autodetect.broken b/tests/07autodetect.broken
+new file mode 100644
+index 0000000..294954a
+--- /dev/null
++++ b/tests/07autodetect.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    ERROR: no resync happening
+diff --git a/tests/07changelevelintr.broken b/tests/07changelevelintr.broken
+new file mode 100644
+index 0000000..284b490
+--- /dev/null
++++ b/tests/07changelevelintr.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++  mdadm: this change will reduce the size of the array.
++         use --grow --array-size first to truncate array.
++         e.g. mdadm --grow /dev/md0 --array-size 56832
++
++  ERROR: no reshape happening
+diff --git a/tests/07changelevels.broken b/tests/07changelevels.broken
+new file mode 100644
+index 0000000..9b930d9
+--- /dev/null
++++ b/tests/07changelevels.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++    mdadm: /dev/loop0 is smaller than given size. 18976K < 19968K + metadata
++    mdadm: /dev/loop1 is smaller than given size. 18976K < 19968K + metadata
++    mdadm: /dev/loop2 is smaller than given size. 18976K < 19968K + metadata
++
++    ERROR: /dev/md0 isn't a block device.
+diff --git a/tests/07reshape5intr.broken b/tests/07reshape5intr.broken
+new file mode 100644
+index 0000000..efe52a6
+--- /dev/null
++++ b/tests/07reshape5intr.broken
+@@ -0,0 +1,45 @@
++always fails
++
++This patch, recently added to md-next causes the test to always fail:
++
++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex
++held")
++
++The new error is simply:
++
++   ERROR: no reshape happening
++
++Before the patch, the error seen is below.
++
++--
++
++fails infrequently
++
++Fails roughly 1 in 4 runs with errors:
++
++    mdadm: Merging with already-assembled /dev/md/0
++    mdadm: cannot re-read metadata from /dev/loop6 - aborting
++
++    ERROR: no reshape happening
++
++Also have seen a random deadlock:
++
++     INFO: task mdadm:109702 blocked for more than 30 seconds.
++           Not tainted 5.18.0-rc3-eid-vmlocalyes-dbg-00095-g3c2b5427979d #2040
++     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
++     task:mdadm           state:D stack:    0 pid:109702 ppid:     1 flags:0x00004000
++     Call Trace:
++      <TASK>
++      __schedule+0x67e/0x13b0
++      schedule+0x82/0x110
++      mddev_suspend+0x2e1/0x330
++      suspend_lo_store+0xbd/0x140
++      md_attr_store+0xcb/0x130
++      sysfs_kf_write+0x89/0xb0
++      kernfs_fop_write_iter+0x202/0x2c0
++      new_sync_write+0x222/0x330
++      vfs_write+0x3bc/0x4d0
++      ksys_write+0xd9/0x180
++      __x64_sys_write+0x43/0x50
++      do_syscall_64+0x3b/0x90
++      entry_SYSCALL_64_after_hwframe+0x44/0xae
+diff --git a/tests/07revert-grow.broken b/tests/07revert-grow.broken
+new file mode 100644
+index 0000000..9b6db86
+--- /dev/null
++++ b/tests/07revert-grow.broken
+@@ -0,0 +1,31 @@
++always fails
++
++This patch, recently added to md-next causes the test to always fail:
++
++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex held")
++
++The errors are:
++
++    mdadm: No active reshape to revert on /dev/loop0
++    ERROR: active raid5 not found
++
++Before the patch, the error seen is below.
++
++--
++
++fails rarely
++
++Fails about 1 in every 30 runs with errors:
++
++    mdadm: Merging with already-assembled /dev/md/0
++    mdadm: backup file /tmp/md-backup inaccessible: No such file or directory
++    mdadm: failed to add /dev/loop1 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop2 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop3 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop0 to /dev/md/0: Invalid argument
++    mdadm: /dev/md/0 assembled from 1 drive - need all 5 to start it
++            (use --run to insist).
++
++    grep: /sys/block/md*/md/sync_action: No such file or directory
++
++    ERROR: active raid5 not found
+diff --git a/tests/07revert-shrink.broken b/tests/07revert-shrink.broken
+new file mode 100644
+index 0000000..c33c39e
+--- /dev/null
++++ b/tests/07revert-shrink.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++    mdadm: this change will reduce the size of the array.
++           use --grow --array-size first to truncate array.
++           e.g. mdadm --grow /dev/md0 --array-size 53760
++
++    ERROR: active raid5 not found
+diff --git a/tests/07testreshape5.broken b/tests/07testreshape5.broken
+new file mode 100644
+index 0000000..a8ce03e
+--- /dev/null
++++ b/tests/07testreshape5.broken
+@@ -0,0 +1,12 @@
++always fails
++
++Test seems to run 'test_stripe' at $dir directory, but $dir is never
++set. If $dir is adjusted to $PWD, the test still fails with:
++
++    mdadm: /dev/loop2 is not suitable for this array.
++    mdadm: create aborted
++    ++ return 1
++    ++ cmp -s -n 8192 /dev/md0 /tmp/RandFile
++    ++ echo cmp failed
++    cmp failed
++    ++ exit 2
+diff --git a/tests/09imsm-assemble.broken b/tests/09imsm-assemble.broken
+new file mode 100644
+index 0000000..a6d4d5c
+--- /dev/null
++++ b/tests/09imsm-assemble.broken
+@@ -0,0 +1,6 @@
++fails infrequently
++
++Fails roughly 1 in 10 runs with errors:
++
++    mdadm: /dev/loop2 is still in use, cannot remove.
++    /dev/loop2 removal from /dev/md/container should have succeeded
+diff --git a/tests/09imsm-create-fail-rebuild.broken b/tests/09imsm-create-fail-rebuild.broken
+new file mode 100644
+index 0000000..40c4b29
+--- /dev/null
++++ b/tests/09imsm-create-fail-rebuild.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    **Error**: Array size mismatch - expected 3072, actual 16384
+diff --git a/tests/09imsm-overlap.broken b/tests/09imsm-overlap.broken
+new file mode 100644
+index 0000000..e7ccab7
+--- /dev/null
++++ b/tests/09imsm-overlap.broken
+@@ -0,0 +1,7 @@
++always fails
++
++Fails with errors:
++
++    **Error**: Offset mismatch - expected 15360, actual 0
++    **Error**: Offset mismatch - expected 15360, actual 0
++    /dev/md/vol3 failed check
+diff --git a/tests/10ddf-assemble-missing.broken b/tests/10ddf-assemble-missing.broken
+new file mode 100644
+index 0000000..bfd8d10
+--- /dev/null
++++ b/tests/10ddf-assemble-missing.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with errors:
++
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
++    ERROR: unexpected number of online disks on /dev/loop10
+diff --git a/tests/10ddf-fail-create-race.broken b/tests/10ddf-fail-create-race.broken
+new file mode 100644
+index 0000000..6c0df02
+--- /dev/null
++++ b/tests/10ddf-fail-create-race.broken
+@@ -0,0 +1,7 @@
++usually fails
++
++Fails about 9 out of 10 times with many errors:
++
++    mdadm: cannot open MISSING: No such file or directory
++    ERROR: non-degraded array found
++    ERROR: disk 0 not marked as failed in meta data
+diff --git a/tests/10ddf-fail-two-spares.broken b/tests/10ddf-fail-two-spares.broken
+new file mode 100644
+index 0000000..eeea56d
+--- /dev/null
++++ b/tests/10ddf-fail-two-spares.broken
+@@ -0,0 +1,5 @@
++fails infrequently
++
++Fails roughly 1 in 3 with error:
++
++   ERROR: /dev/md/vol1 should be optimal in meta data
+diff --git a/tests/10ddf-incremental-wrong-order.broken b/tests/10ddf-incremental-wrong-order.broken
+new file mode 100644
+index 0000000..a5af3ba
+--- /dev/null
++++ b/tests/10ddf-incremental-wrong-order.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++    ERROR: sha1sum of /dev/md/vol0 has changed
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
++    ERROR: unexpected number of online disks on /dev/loop10
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop8
++    ERROR: unexpected number of online disks on /dev/loop8
++    ERROR: sha1sum of /dev/md/vol0 has changed
+diff --git a/tests/14imsm-r1_2d-grow-r1_3d.broken b/tests/14imsm-r1_2d-grow-r1_3d.broken
+new file mode 100644
+index 0000000..4ef1d40
+--- /dev/null
++++ b/tests/14imsm-r1_2d-grow-r1_3d.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    mdadm/tests/func.sh: line 325: dvsize/chunk: division by 0 (error token is "chunk")
+diff --git a/tests/14imsm-r1_2d-takeover-r0_2d.broken b/tests/14imsm-r1_2d-takeover-r0_2d.broken
+new file mode 100644
+index 0000000..89cd4e5
+--- /dev/null
++++ b/tests/14imsm-r1_2d-takeover-r0_2d.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with error:
++
++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
++		is "chunk")
+diff --git a/tests/18imsm-r10_4d-takeover-r0_2d.broken b/tests/18imsm-r10_4d-takeover-r0_2d.broken
+new file mode 100644
+index 0000000..a27399f
+--- /dev/null
++++ b/tests/18imsm-r10_4d-takeover-r0_2d.broken
+@@ -0,0 +1,5 @@
++fails rarely
++
++Fails about 1 run in 100 with message:
++
++   ERROR:  size is wrong for /dev/md/vol0: 2 * 5120 (chunk=128) = 20480, not 0
+diff --git a/tests/18imsm-r1_2d-takeover-r0_1d.broken b/tests/18imsm-r1_2d-takeover-r0_1d.broken
+new file mode 100644
+index 0000000..aa1982e
+--- /dev/null
++++ b/tests/18imsm-r1_2d-takeover-r0_1d.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with error:
++
++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
++			is "chunk")
+diff --git a/tests/19raid6auto-repair.broken b/tests/19raid6auto-repair.broken
+new file mode 100644
+index 0000000..e91a142
+--- /dev/null
++++ b/tests/19raid6auto-repair.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with:
++
++    "should detect errors"
+diff --git a/tests/19raid6repair.broken b/tests/19raid6repair.broken
+new file mode 100644
+index 0000000..e91a142
+--- /dev/null
++++ b/tests/19raid6repair.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with:
++
++    "should detect errors"
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index fae8071d43..2380c322a9 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -2,6 +2,6 @@
 
 mkdir -p /mdadm-testing-dir
 # make the test continue to execute even one fail
-dir=. ./test --keep-going --disable-integrity
+dir=. ./test --keep-going --disable-integrity --skip-broken
 
 rm -rf /mdadm-testing-dir/*
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 033766dc89..0d0e8f5922 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -36,6 +36,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
            file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
            file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
+           file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
+           file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.39.1


