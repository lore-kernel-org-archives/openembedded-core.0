Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B7EC7EE2A
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:25:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25412.1683613517450175849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 23:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L3T9X7Pg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4493d7a438=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34960Xnn028286
	for <openembedded-core@lists.openembedded.org>; Mon, 8 May 2023 23:25:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4nAjZJu3hrMFNe0551rl5hHFOc4PUEhSudzUPpzCqsk=;
 b=L3T9X7PgwYl54RAWKvnsBBUZ38JQMgSoSHB7YcKacOw1Xffw98Fk+nrYr00VUPwC9gpg
 +o56FgXjTUYcAKefhYLPuGpw28YaAAwWpexnVSvPIpeaqMfdmWahD3EAeenp0gIiz2Bj
 MecyjPyoN6ABoaWHpaEjLQgYDnrBebMW798PyZBNTANFPCZ0AMjBBycomIcj1yar4LUN
 eFPV6e5w+G/vNdf1pu41ujjMUvUgfp3vz54huz+v6PvLELerFkFN7I9liBs46O0AcRIu
 IbPQWkyswgS1PmfhWd5uDkkluUnjzYAsK1n5VO5fOVzy8+xF/cdlGEqvhBDwXxrZfxl+ fQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7ucrbph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 23:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UONF8Ryw0lqm1HjKNpe6KhAbEBdBpcMpbH9xP4xI+FhQYKmsBoGwBNi7gyC9Ak8Igq1d3NBvor/qexxP+OleFFpq55+yj+kX4QCEuSCpBJ1X6StX2L2dsw9ioO7/cRjGVFFXqyzl7y9fPZZgj9n5zq5d844Yr5yImbZUfORUMNhBIrv7wGRRiqFGoW9Ry7fJW55LgM/KTM+cPaiDZpfgd2LEIutm8wAq7hNID4f4LdLV7kbOgZPbQCn8rCJ10rcu1qoIG/0OZNo8/rnkk9YAiCnk9CG5NUY4L0qj+UvBHANFY5yyi9scJUUGB+U2SweZ7bMMJOwThq33sJ35ry9OFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nAjZJu3hrMFNe0551rl5hHFOc4PUEhSudzUPpzCqsk=;
 b=eyeYS/fFh2NSwM1L2sNhmSr1k2suJRJELfsEw0IFbBxQb1V/8v/KXLWSfsoUukM0DEGowFmuFcChedEFwCyD8liA8rNibpvsaHR9bgudJBaTMg+XAO8zyq2O9OSek9jncOOM7mmSEEq/fWDvaCxAI/Hr0ry0rd0GHTVmOUpH9eL1zwIujXReuMzn2hyEQi3Jmthd1JaQSEyS3KROX7RrmJ2VYY9KotUQybwhilvabRExl7AaAkWrgcwNLgH00TD1EBnAZTJkV1FJ2zu2CCFQLO/hibHnvSq2v/Zoz2J8uXB5bNuzajgHPW+4NuvBCY6CoL110W6foRZDmI17eKvmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Tue, 9 May 2023 06:25:12 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::5722:fe56:8362:1a4b]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::5722:fe56:8362:1a4b%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 06:25:12 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] libpam: Fix the xtests/tst-pam_motd[1|3] failures
Date: Mon,  8 May 2023 23:25:05 -0700
Message-Id: <20230509062505.3469540-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To MW5PR11MB5857.namprd11.prod.outlook.com
 (2603:10b6:303:19d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5857:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d67efa-659e-408f-7f4e-08db505624e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FBM8/jRFgtSx+iniaeATyLkRrbk07cqEeuqBaULn+EeACwVkwiwe41rNGE1rlZvVOGPJTaQlDAMmxp5Jwxe1bZuKU++2vnEGREMghTdx6OjpXOdO131CInl//WAcHzGqHYx71Hl3Bbx+HACrpv9aD1Rs3YrWhXX9tbCBfhJ1BxZoNbmgBMumxdSAPsL+F9LZA98qebmM+LmXuFUS8bDDFOXYy7MOoihjijqvkUF/P1nJPxJz3/stVMrqz/96X667PfSaRYBDjdD2ZeOHkrSzijAhrGU2jB57xTt66U0EXDdNBKpNbUC3lGS7/DWmknv8RjHcSw3WArdG2kmN3M02ZOqizhHV2JQYxBJVV9l5RpPNwTz4GxXi4v0ATMFPLmwlHdvy8SV5J1NUdRYkNfH9FU+1HcPnxmP0m7eTjNYYFPYc08u7L7GqoHz4Hmp3FecnzEOGCTRQX9KxBMUH3Wnrlk2026ML9V8KtDsfa+YyEGr9BZ6RQjJzcjgoFJ0zyvHVimytq8d51SBeh1XGpJFDlyv3q3BSi4yNXyw+jqRbFeImJOSJZtJf0hEcDmpJHA7TnfthAKdXfrNjCobAASckZ5Jz796AyhGQi1M3bvPXnXWcnAzWfXBSQ/mSW8nwMdnGbiV8Q27Y84K0jrlR4OAMPQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5857.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(451199021)(36756003)(66556008)(38100700002)(38350700002)(2906002)(44832011)(316002)(86362001)(8676002)(66946007)(5660300002)(66476007)(8936002)(6916009)(41300700001)(966005)(83380400001)(186003)(6506007)(26005)(6512007)(1076003)(478600001)(6666004)(2616005)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6IdvlnMdNqbgNLUaj7+hTaA0uMbEoS02HSqWfn0TirqyVno3/mCG1JwE51dB?=
 =?us-ascii?Q?dc48UapancgWFor7ImNQBLQr3VJIZKkZU9NU+pEru1QYrnzJubt1TaVjmIuD?=
 =?us-ascii?Q?MziFm1Gb/pWS3/+scr5isz7V5bNLIkGm7ZEHClOx2hfAAeQWlC/Te5Gan2Kd?=
 =?us-ascii?Q?0Zt642Z3fPlKxXyYAa5YVWg72Xk1wz+0puZEk6pneLj0Er43y7zc+0jW4Rlv?=
 =?us-ascii?Q?ukl22lMbRnQP9A43AwltOrufe+KQkB/lzR4P8fva8yTPfrfn9ijWmOD4bCK0?=
 =?us-ascii?Q?zgPkJI72wNn1n9Xb055ljI1A4Lt8DNPd3f4aT5z9z0I+yH1boCx3Al1nG2Yb?=
 =?us-ascii?Q?EZDRpKTkphrg+5zg9DoHwgix+nBkKIiRHTOQ/B2F9IkPa2hQ6NaDXmn/CqWq?=
 =?us-ascii?Q?6EWBH0pBvUSdrkj+OA7VmkR3ts+wsKVwylx3Sl5o4pQenAnDiEkad/C3UET0?=
 =?us-ascii?Q?qEZbECa+VJQbAU6xejDXW/v3PcDinAeJopKVqrzhTsd1FhY5PiOpeqlaMkaR?=
 =?us-ascii?Q?gkCU8eoNwilWYS6BOUf4bdYR+FqE04gOe6PoS2ao8x/5kbKhUxcddUShpHZT?=
 =?us-ascii?Q?wlyZ33BpzNxcLm7fxJKsnV5zd4PbaI5KvNZDMnxrgQodW2/p8AvLwvXO1iwB?=
 =?us-ascii?Q?z9ckUlJ1niNbTW3a7Txmz14Ikg2J70aCWELZ9Xlr+lZlcWO7kyytWjDjO85M?=
 =?us-ascii?Q?LCfC+dAmq8eC4H/vunObl3ltI0cxujQOESLXh15L4l2kbmWIZBvZFV3FMf8z?=
 =?us-ascii?Q?Vp+0aV1MScpZ1Ryw9A/bPeFAQQo3yB7vR0hyzE6tSi8c+HDw7czXIWzik3ym?=
 =?us-ascii?Q?m68hiryxSxjMwg2RGYkVaGv7PkIBPNvVdNIsV+RQiRJPlIVWxUods7I88WXK?=
 =?us-ascii?Q?ySrBWzYM8rBbeQyNAQOq2w2To0RMPMK5QJEUHAN4cWvdoThSWLOl4bII4VJm?=
 =?us-ascii?Q?F3RJ3pLTK+MKhXiGGacQAMG5bdWEw6p71+cQtSe6lC8F0pDZEu4rmy7CPHi9?=
 =?us-ascii?Q?OovzQ+V82zIc+FD9gfbuWQ+bqEo1ShBD4StJxa+S8/u87wzT2REzZxGRT9Kq?=
 =?us-ascii?Q?8rRzY64HiEATMFv6lg2iIostp5hZ7hC5JA/CA/MLCkQb4xwAoX5rITImW+O6?=
 =?us-ascii?Q?tN5bZl83EFrdSdXkPxj7oQY+d/YU0BohcmCYBCbMEE8SQcGyqAjiOQRYnlh/?=
 =?us-ascii?Q?JIifn7tBV7SD/srbLRHujYziU+qu+Q5Ew9UcCIYOhRbqPf+NkFGQXSdWKXWg?=
 =?us-ascii?Q?zbVqwZpaZ6f04Xc9P6vh6w/KbPnI0y3g2eQSU570Yk1SpuIfzetJFEkgSm8M?=
 =?us-ascii?Q?YaiNLT6FJ6ZF6Ccjtu7sMlutWhr4PfoCZfGyzU5YmcbEAizZ8RIaDD81ZrYh?=
 =?us-ascii?Q?vlTHFvozTjHyz4bfw7AHYRwBqloNdfTecpMuaodpZYhQHR6Gle2bWn06XlSd?=
 =?us-ascii?Q?mIemUmEkluAihnom4d3PBHej5ZFIxUFiMAjRHjHTJQMla+jFFL9/BsWnGnit?=
 =?us-ascii?Q?4EQcqW2z54uueMePmrqyyXunL794+TVE4AL3Etqz11OpGY9kMWj0cx/6Gm+c?=
 =?us-ascii?Q?msqwNDUtRwyWzALpt4qM/sogrwcfjhtIu7pRMZU+HzarWuUquXQGuiMrWnQM?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d67efa-659e-408f-7f4e-08db505624e3
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:25:12.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ayCyCpT5q6cb/V1FILRk60aDHCnOAIoLYDpKYSXF3wMhs48Er0ISK/HZbay0XqG12aMAmQwL3YxLLIvKnIGTseALv7DoJKXQULMCWvxNcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
X-Proofpoint-GUID: Fk2Rhc2bwdxC_vamQQPr1bPi8_JkUb8l
X-Proofpoint-ORIG-GUID: Fk2Rhc2bwdxC_vamQQPr1bPi8_JkUb8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=917 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 06:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181033

Reproducer:
1.Enable the ptest of libpam and build the image.
2.Boot the rootfs with nfs, then run the following tests as root:
 cd /usr/share/Linux-PAM/xtests
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd1
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd3

After applying this patch, the ptest doesn't be failed.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 549e54ad6a175359b0a57987ccdab8989df9d3a9)
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


