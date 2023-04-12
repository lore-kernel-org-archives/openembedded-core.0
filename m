Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFF3C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 09:58:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39038.1681293495147539772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 02:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LtIfG1wC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34669220a8=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33C8A6ZW008416
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 02:58:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Ltw9SZ0K/I6wSHz3tdqzMAEo7uRn4Q32PTB4aCjW+io=;
 b=LtIfG1wCjlFuwToNngQN0zxD3++X8sSH4EVQDYtUuRuMbTUQtFqukXX4ROeDC6Dvkra6
 sj9E3l3zdHyXGiwXZpUDyMt0cP48owd+biO+HK5dGkyiZ+S0MMis46cL+yiBUyIzO5MX
 2I67jHHC3Lzcqzyh+/ASDJ1kJxS+Ox8jCzG7waAdfCMQIHgAPW11RwCOAX6WU9QZPwya
 aLWkmm6/eJoMoSjt1lpVUFQsg5fWWZNMFTnedoI4Nga/uf94YZCnFJuXu3w/+OM7wT78
 ST33MrHJZK3iFf6Y0MWI2FxTNEMENNu6/b36EvZIDpgbjb6jRxj+mxsj/u4fIQtxTROY bw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu3j5m3q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 02:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2TFT0BT2qEPFgS7DZIKxWpkYsQGyA4zt8JgOXGPEak08vyI3fhUnfoTsp37EIsVFjr++L8FxSAmq8WtyLtWXKxcFS+fIdzxq3thAY3hLglePxRvHyD2UpQiMaacBCGQ1QVdx7BxkFYsXq1hcGRHqNDsNqzsepdmB9j4ExgV2u6znC/XqOeItSmyGz/Es7+GSnzj2ioRcngWUHuMPGCQqYBCEe9qp5Q74frxxQcAl3h9IH0yBiae2AjMLnjaBULnhI/LHbhQ8KTiRglfU4REi75hyq9m9GXyGfJVuseBAfUlTLSn4QwivRATFdyxx2vT45me3EZ1fhrEwzUEGGjfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ltw9SZ0K/I6wSHz3tdqzMAEo7uRn4Q32PTB4aCjW+io=;
 b=j9RCXjiE7gUGkkyqElyp9lq0XUEnKRskqmWKT28Fhwj37KHWRPXS1Iq+laNwQ0mQJle7WM5r6SpBB+v/m0hyLkpaDF8Cyw2mNTEARLEycIeqssWVqAmUBhiSnrXrahG38ylCjBax/J3/suEo4+8y+yNQpAGA8WG74vJbUPhQv2NTuj8wCkly1YCMnDONqqGkLF+1kGKoGIGzCXHm8bJA/1QsefPPuR0N/SqCSQki+BkiiOM+Y6rPpfvrZO9zOiK0ymK/kDgO033zkrkPibQbPuyya5Om69KIaj4/yqgEuRzCK69nmKydrpy5nuzevpfYnuxI0c1j1ZEdDJoV4SY8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 09:58:11 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::d944:1a15:2e9a:8b29]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::d944:1a15:2e9a:8b29%4]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 09:58:11 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libpam: Fix the xtests/tst-pam_motd[1|3] failures
Date: Wed, 12 Apr 2023 02:58:05 -0700
Message-Id: <20230412095805.1635590-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To MW5PR11MB5857.namprd11.prod.outlook.com
 (2603:10b6:303:19d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5857:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8524a6-ebb2-4053-5c33-08db3b3c6cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L9/eI7w/aVgy//UKnl3oqzh6/LTSyyi1F4YTy404PgVND3x6OCbOj0/241yM6JyfhcvPpe1Ujx7inJuwn9aDZg+CdPX/1Wj6CKkGjcodZhjKLLPWWbWhqkLUtzxpC2WYLPe3ePbelQ0tfG8Gq1Ob1lvn95dlcDd3rH7osu5hvv3lNDWDDveXwjZTg7v8bOzjEjz38moK+N87MLLzUw3s6jASFS5rMUqYfnCEbuN6w6jxi0VnAipdWNw2HMie/Nl1mKRRNKofN8o/n9qf/ji2C8MeMIqGBAMfaJ8IAWBKj+mJupVO1yM4HfE/UQooBhGld1ojEDqv+krXiU6ZOu59uSZM8MF3aBkMIqK59Jkxo+CtHzeskjrih/Ui1gcIjr+aaKZ0yX8W7WnLZC2Vg3we2soOchNlDsrjGQ1zrM4cgOoEKWMSRK+VIINgmaxSKPKEJH09amliWCBwPbfLfy79D3U3PkzqRWXoDU6UQ0WAu6bBLeskcjyeHx7KQWOGKlg0pnPRgoQDyxgJJx47MQXn3VjVRcT3iMurcVSA0A6yAkPKtZ1dl40H6FLDjPmrYnM5Pbg2oqVhrjTmzAJEgnJeB6N7jCx8+A39500xHqg/4YkuEoXpbevEMtxX/ovHwMfpzupauB6S0buechJIBfI94Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5857.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39850400004)(136003)(366004)(451199021)(6666004)(52116002)(8936002)(44832011)(6486002)(966005)(5660300002)(86362001)(6916009)(66476007)(66946007)(8676002)(66556008)(478600001)(38100700002)(38350700002)(2906002)(83380400001)(1076003)(6506007)(6512007)(186003)(2616005)(41300700001)(316002)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OVLmciwHqIiG4mqYOM0ZYpgKSkGtHOzPuOXiQpuGQv1A3Ua9UXnzAm835Nki?=
 =?us-ascii?Q?zYll92azyDodd9Jzt3qXdgeqtzKEXaPd2pUFvkngJXftgjyFAhZ5VyXJBMaT?=
 =?us-ascii?Q?IwoajzudyF10ntFdmzyt61M/5AtTeaAhm0+E4PKMaiLdm9t0p+15AJMdDh9l?=
 =?us-ascii?Q?+Uhsc8cgydTnoZCESJ8BkGwgfXsiFeN9euCkzysUAuy/Ubogew1CemUs+0XX?=
 =?us-ascii?Q?OKy4spzfa4BKEHVcqRHMisyd0I9q7Zb3hbbGILMRk02poAbQDyU20R/AJSDB?=
 =?us-ascii?Q?JAbFuY+H/NpXL4Fc4YO6FgSTDLTruwFoYInuqBjJcu204NYai7zkcjh6+qt4?=
 =?us-ascii?Q?MDHq7vfoSUBJwY+BIIyTwjGIMo+/u21VUHT1PQydf71ynLsnVLtraGOayvGp?=
 =?us-ascii?Q?3AjoEB5nS0KyxzfAMKOHroXn8HHUI6H8SUMJAzE4r+IIVCDVjYqUywK36/hE?=
 =?us-ascii?Q?xSxlbwDhBv46UD0dDcECzF0QoeQTUu1qYNWkdXvJQ8eJUqWhm5+gIJJWJQni?=
 =?us-ascii?Q?PZfP40tob5+/lSC3bVNuPL5F1OAg5ywdnCCnJ2RSS6wZE+2kAjzQT+kP/uF1?=
 =?us-ascii?Q?WO1CnY/Bl4dFw1K5X0n/5F036ONyOiwOt8+kj7cZhwVavuAJbg/dfZpRNnC5?=
 =?us-ascii?Q?eZs2FZVGWb/T6NQJyn9bwF4LlfjHOAyCgXL/3sj3A7+DeqrZ63PpFiKKtsK7?=
 =?us-ascii?Q?rkDDlB2LJ6Qm5RScuidcmI33eVHaBlgk4wtkNkaRYDNrF/6zgLJgXiZviGaJ?=
 =?us-ascii?Q?z2D3N5yq0pmhBEYXhHSE3okif9BVVhjeZIJ1sG5+O9wQjL6r9RtDpumhg4tu?=
 =?us-ascii?Q?SswKHAS83gMpTbo5xTrfSAZz181xM1uVN/tVsGaY5n23uxrpLrJN8BGbuMpx?=
 =?us-ascii?Q?FZe/90bzeFoskiUK4ozfKcomfIXZuCrjNSYA0TQ/UJbd7csvocv925UMlIPG?=
 =?us-ascii?Q?YtnkgbnyY2r6KCA7OJhxqN/PH9tBeVy7XY7KQLrLpPYBJkEtYTnAg9vh+rkY?=
 =?us-ascii?Q?483mOI6fTzIy3KccUH2IGNJ/8mepf7I32k2i1QNtgfVkgpwBeFdu/BXG3Vdw?=
 =?us-ascii?Q?n/Afvaatuzvk22ShUYdkD9V/JIXibsgH1TooyZ27rKh5j0hrpJeM1ciAMxbC?=
 =?us-ascii?Q?OVyq6Ovw5iYOzTZCU5kM/9HHBw8y51Hit7TOBLrg2HTrDTvJQHRTlitKee3m?=
 =?us-ascii?Q?L+YXlwW2AYT+5Cb8GT/tjOdqWcHjdTTywCeqtmxHjzoS5QF8qtRM8ch5Zc3m?=
 =?us-ascii?Q?HePANOlhFCLaINaH6AXUMUu7R1fGrCiMqGqIqIH1bCgjT/Hjt0SvOQ0vT9Ql?=
 =?us-ascii?Q?xTQRimMrzkgqe+0B/GeDOXkbZgdSIE6GMYKu5vEgKSLfK2ovSiFUu5U/B+cf?=
 =?us-ascii?Q?tHngPJh7baof/QzPXTH8EyjtQY81SG7gNUaYf81SavaNdoMcw7H3S/s+5wKq?=
 =?us-ascii?Q?FFxPLl3W3BHK/5oP4MrMvX/t+Y17JVEDAfJnZRViZ2nbGG45XEUo+loiR8kk?=
 =?us-ascii?Q?Ay139EUQwt6yXWu816mNEV2N8d8gCPE9r6TSuT02f0A54DxUljHLKUq39JYY?=
 =?us-ascii?Q?qlmKmDDOuzzVR18p1TSJKUZuMWfjp95FZgVuRwDMFBiJKo7pNIP0fIRbXoMN?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8524a6-ebb2-4053-5c33-08db3b3c6cd9
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 09:58:11.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIxb5afDEOiCfyRKwUvVXBGo8sEuslreQL3VNwhJIK2J95rgeiTmMPT5w5kammYKEVtHAPXQX5gxMXTqavF4ktgvc7bGr4usiS3lZwlgRsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
X-Proofpoint-GUID: X9rut3xnv0apiAxbSE0bT9A9OoRis9UY
X-Proofpoint-ORIG-GUID: X9rut3xnv0apiAxbSE0bT9A9OoRis9UY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_02,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=865 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 09:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179944

Reproducer:
1.Enable the ptest of libpam and build the image.
2.Boot the rootfs with nfs, then run the following tests as root:
 cd /usr/share/Linux-PAM/xtests
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd1
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd3

After applying this patch, the ptest doesn't be failed.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...rely-on-all-filesystems-providing-a-.patch | 108 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch b/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
new file mode 100644
index 0000000000..94dcb04f0a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
@@ -0,0 +1,108 @@
+From 42404548721c653317c911c83d885e2fc7fbca70 Mon Sep 17 00:00:00 2001
+From: Per Jessen <per@jessen.ch>
+Date: Fri, 22 Apr 2022 18:15:36 +0200
+Subject: [PATCH] pam_motd: do not rely on all filesystems providing a filetype
+
+When using scandir() to look for MOTD files to display, we wrongly
+relied on all filesystems providing a filetype.  This is a fix to divert
+to lstat() when we have no filetype.  To maintain MT safety, it isn't
+possible to use lstat() in the scandir() filter function, so all of the
+filtering has been moved to an additional loop after scanning all the
+motd dirs.
+Also, remove superfluous alphasort from scandir(), we are doing
+a qsort() later.
+
+Resolves: https://github.com/linux-pam/linux-pam/issues/455
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/42404548721c653317c911c83d885e2fc7fbca70]
+
+Signed-off-by: Per Jessen <per@jessen.ch>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ modules/pam_motd/pam_motd.c | 49 ++++++++++++++++++++++++++++++-------
+ 1 file changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/modules/pam_motd/pam_motd.c b/modules/pam_motd/pam_motd.c
+index 6ac8cba2..5ca486e4 100644
+--- a/modules/pam_motd/pam_motd.c
++++ b/modules/pam_motd/pam_motd.c
+@@ -166,11 +166,6 @@ static int compare_strings(const void *a, const void *b)
+     }
+ }
+ 
+-static int filter_dirents(const struct dirent *d)
+-{
+-    return (d->d_type == DT_REG || d->d_type == DT_LNK);
+-}
+-
+ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 	char **motd_dir_path_split, unsigned int num_motd_dirs, int report_missing)
+ {
+@@ -199,8 +194,7 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 
+     for (i = 0; i < num_motd_dirs; i++) {
+ 	int rv;
+-	rv = scandir(motd_dir_path_split[i], &(dirscans[i]),
+-		filter_dirents, alphasort);
++	rv = scandir(motd_dir_path_split[i], &(dirscans[i]), NULL, NULL);
+ 	if (rv < 0) {
+ 	    if (errno != ENOENT || report_missing) {
+ 		pam_syslog(pamh, LOG_ERR, "error scanning directory %s: %m",
+@@ -215,6 +209,41 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+     if (dirscans_size_total == 0)
+         goto out;
+ 
++    /* filter out unwanted names, directories, and complement data with lstat() */
++    for (i = 0; i < num_motd_dirs; i++) {
++	struct dirent **d = dirscans[i];
++	for (unsigned int j = 0; j < dirscans_sizes[i]; j++) {
++	    int rc;
++	    char *fullpath;
++	    struct stat s;
++
++	    switch(d[j]->d_type) {    /* the filetype determines how to proceed */
++	    case DT_REG:              /* regular files and     */
++	    case DT_LNK:              /* symlinks              */
++		continue;             /* are good.             */
++	    case DT_UNKNOWN:   /* for file systems that do not provide */
++			       /* a filetype, we use lstat()           */
++		if (join_dir_strings(&fullpath, motd_dir_path_split[i],
++				     d[j]->d_name) <= 0)
++		    break;
++		rc = lstat(fullpath, &s);
++		_pam_drop(fullpath);  /* free the memory alloc'ed by join_dir_strings */
++		if (rc != 0)          /* if the lstat() somehow failed */
++		    break;
++
++		if (S_ISREG(s.st_mode) ||          /* regular files and  */
++		    S_ISLNK(s.st_mode)) continue;  /* symlinks are good  */
++		break;
++	    case DT_DIR:          /* We don't want directories     */
++	    default:              /* nor anything else             */
++		break;
++	    }
++	    _pam_drop(d[j]);  /* free memory                   */
++	    d[j] = NULL;      /* indicate this one was dropped */
++	    dirscans_size_total--;
++	}
++    }
++
+     /* Allocate space for all file names found in the directories, including duplicates. */
+     if ((dirnames_all = calloc(dirscans_size_total, sizeof(*dirnames_all))) == NULL) {
+ 	pam_syslog(pamh, LOG_CRIT, "failed to allocate dirname array");
+@@ -225,8 +254,10 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 	unsigned int j;
+ 
+ 	for (j = 0; j < dirscans_sizes[i]; j++) {
+-	    dirnames_all[i_dirnames] = dirscans[i][j]->d_name;
+-	    i_dirnames++;
++	    if (NULL != dirscans[i][j]) {
++	        dirnames_all[i_dirnames] = dirscans[i][j]->d_name;
++	        i_dirnames++;
++	    }
+ 	}
+     }
+ 
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 5197f18132..bec47ab836 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://run-ptest \
            file://pam-volatiles.conf \
            file://CVE-2022-28321-0002.patch \
+           file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.39.0


