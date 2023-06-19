Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11824EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 04:36:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1165.1687149377842709590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 21:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=at1fYUTx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J4SA2d003726
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hfzQApyivAHoSX3Fulg/QWgu2guKe6NzlcqjL+WUW9g=;
 b=at1fYUTxvwxNNWZC7Z3R4J0KZOigUZDPMYnqJjR5afqfXr9DAGuf/y5gATWw5Yg8/VIh
 BO9KuJh7xpMlvQZeR6FVDeT883CC2EW5m2LDgtiteGrGrPWpqDZ4YMqOEYVq5VKvnV5D
 vjFkInmB+aLmh30jzaQkVu0fcJBXNsERYM6Zi68E7DNZEsh8vSZkuAaCgizjWWWFNboo
 fi3kZoqP7c3/helKUDwcwGdbtx9SfA1WvKVn6EyTAq/X0E8srmMaavvzvOrpP6odAoEV
 et+j6BYUrU0Q6ocAgzfn5Sj/WrTsxmkUQm7Xg1tOVxiT4hlluJuY+9bsUB90/P7um9x+ uQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9842s4f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtJLW+4ogoozqtzEoOff1H4Q6BuG3RrVO3Xv9TtOyShGE4UO2hCGdQ+V/30HBt+YkhC3OZ3ULy0NDGjSFWqpMVh2xB7EroPh9gaWwfJP6zs4cNYFwiAc6y+CLYgwNDybmwKlY0tc5aydVhNSsCy82K5UERVMbM5a0AF+zoMHZCHZQccc1gCXJOUq+USbxFVGXUK8qt7rjdScATrI2roXiX5WTaODGFTwELGeDgev3Oxml/GiOdR4khFVImUDKW3C2J5TDjlQ2NMKhpPq62nAr3pNoZAKXnjaYi8Vh8pqE9jHzYdy2S6MwfLdEZ0StRir/beTPlH/hV4z77UjSPmyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfzQApyivAHoSX3Fulg/QWgu2guKe6NzlcqjL+WUW9g=;
 b=K73cCY6UoXyZApYt3pAR/mbUDAw3JIVytoitZkM25yDwh415uktUr2jVxt80P/fzegQhnK8Xzd49oEzEQcJBbzogbpjUF5j1lDBq7Yn0UBauYvsXLbjDPWnnDGXNT7Q0zMpispA9XFhmiZfKAyMXPrVOqT4GYIFGbXSz6iWGBF+J7+MAltGvnp/jmshyQuJSn0jTtWj1F8oRVM6buEuDnq3M3gdD77Kwjtl/PdfizOKRieT9vgYabB0EqS0FbqGIOi6VB0LwbYn9dp4NorLRCPq7c28+Uu7bfB8hw7RDlvEw0ToW2D3q7KEhzGqMufWvsB+q06z03XOdCxaOV0ktBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 04:36:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 04:36:11 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] zip: fix configure check by using _Static_assert
Date: Mon, 19 Jun 2023 12:35:53 +0800
Message-Id: <20230619043556.3432048-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f390dda-15c0-4c7a-8372-08db707eb51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0AsdP2zMUfuGnl8XCN2toALdNhWVQjJ8RJudN6zTWwZoYfZiFzzrqzZNL4Rb23x7P7k5JiqmdcSQz9bUPZSE26T9rbq7INwmFym6TJEuYxVBWeXxou08tLJCDAOc9IKXwwdYnxr7ll4Ums90SYnPPESre7QbeBW63A3Nk4uiWDXTi0NUL+xMRgD24i1mlxP4r0qyCrehq5RdMOBlP+YG4cDL0tWPBnFfqXofKXoOrUgUXgiRdrj6+Ea/SSjc2VPdsn4Ji+/KgPT2kKgNiniqJiSLGzRvoJyOj6BO045Hoo4FGHgRgAAXynm1LswIfMj8JA/tWKsQvBJLAJQ3uP7VCGx+rT8IfameEKvrfhWvXcfxQ/L3QiqZTWhAFEAZv9JsD1khK8MtT3kqKU+/jvrug4dpAhguN/zau1Pq1wchndtPZ7ECrOIvoK+cTNraeY23QahVZK6DW0cN88bsFjRcThsilBfJD1BIme4GZSEiiduTW30W/1bVSJuoQjN9PBjtVugxGRBzdnDrbqElqb71Xt4aOdpdH1snSHtlhV+HFxqCQW4s6h+sbBUXGES3PhnJzPjtBppwFea2VdRig0sbQJBxGV4u2QHiMhwx5K2s4MkdbpsLFMZwI8c4+bGrSGQX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(366004)(396003)(136003)(376002)(451199021)(186003)(6512007)(26005)(9686003)(1076003)(6506007)(2616005)(83380400001)(38350700002)(38100700002)(478600001)(41300700001)(66556008)(66476007)(6916009)(66946007)(36756003)(8676002)(316002)(8936002)(52116002)(6486002)(86362001)(6666004)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NRGY0esPZwaEbJlW+bYOkXEMphG9UAoWfSYkiGfGAmY6HrndY1Ize+Ikd5iJ?=
 =?us-ascii?Q?R29WyLo/pt47ysF9Wk0rphADdZ2W5Y281oUiOEV8QkrioJZOKVKtOWw1xfiI?=
 =?us-ascii?Q?Km6AFmfB+5uUrhd1ZUkUnQ272Uuey7MnvDObVSrkwDYsy1NmQcj57Sxa3NsM?=
 =?us-ascii?Q?UalTyDnVJ9AfG49Ad1DUxpPPjdrMA3g63Q9Zrg99dvTpLKzUqyBng5He0fYO?=
 =?us-ascii?Q?QuYS3Bo8SBRK5Im8aTAVUSauNM4XlDn56AuRIZSDiaf1oxd59SGfVZ8EgDPP?=
 =?us-ascii?Q?n6jiACpWReXqE+eu9Mo8IaVOkDObaXFThgBcDN4FgNmJpxs4QcH9HvK+mQDp?=
 =?us-ascii?Q?/j7Zedr/8LkKfOQQl7k8cfh7cPrtOBhoki9AHwdBWhxYmkp0G0idYxl6SNQS?=
 =?us-ascii?Q?LQbjjwvnP46tAiXby5PuwT7SwwrYODq8qOOXlJcxWpZmtMIp7egHJduVud3I?=
 =?us-ascii?Q?232iF0L9352MfJrZS/T+yr7dwaacBr1pV2wQlErvKwca8h6POcPVjvUz3zub?=
 =?us-ascii?Q?PkdKlTgxB7YOe/hKv0th5APLq/QCjBoazFLSiV4TGi2ityGBfcc+EN1v3M0y?=
 =?us-ascii?Q?kY0n3azKGN1Ygn7LJtYUtTABeXI4sdZ+KS7Zs4MndZgVKQuz7+7G9mFZLkCF?=
 =?us-ascii?Q?iLhF0lGtzHpIKpTxFmt4dHKuhjrLZ8ewbAuWnpurCsPA1u8SAoCHgTQVNV0q?=
 =?us-ascii?Q?kHXyFyc9x+4zebyLY+4EWf9RMOQNgRcBrl256uSiwj6bCdVfaOsyJB5xfFXF?=
 =?us-ascii?Q?B81HUZHaZLzQJ+79idlDDdP2G8jK3vAvJjQTqA8T5JVxQRFo1CJEg1FByRfn?=
 =?us-ascii?Q?RnYyraFR4Sm2OahXID4pk/JhT22AVI8E2o5ETwfQFzb5dYXBr9E+A2iE+nJd?=
 =?us-ascii?Q?/7yOtuKVswfoWr+YY/UuOnJD/lNBvmdA/kWsioFWjplFbaVXVLlpEUD740QT?=
 =?us-ascii?Q?K5bPP3wgkDHpgScwRn2NFagFrWb9vgSb+JsfEmtPlz0v45/pD+dluKTuPMRn?=
 =?us-ascii?Q?yDeaAbfgfo/nwqIxnvRj776KKUSHPrXoeXm/G0Mi3iQsbNDeizxCMSCUdVoA?=
 =?us-ascii?Q?Gh8W9VpsA1eGBoaC+TuSbsyyCB+ZKLIx6BOH6b4PrWJxawli+UoAGz6sDuly?=
 =?us-ascii?Q?j5VPk4cy8cieR7FpM7ANQBShaNUK/ucbn7U9o4nwAsWBFBuiWcq749aXSS0K?=
 =?us-ascii?Q?0j0+HOCCVRj+02I90A6AQq+Ha5sIAgpzVwYdW3oywETfFyawakaI97bxPItx?=
 =?us-ascii?Q?B1ORkiwgoGAWJYzjnXaEfgdKd2hIK/yozLx2qaDgwGsOLprALhYFUlglDpld?=
 =?us-ascii?Q?jWS2OBkT1HgAniwSbFNABN7g5o7+SPA5EUIlm3Z1EZAo3zvqnukF5xOxR4se?=
 =?us-ascii?Q?dhBg4O4dFP7VLPYed43VNpkeF/ShnTjbeo6+IFUVJ5fuhzI3dproHA5siEQa?=
 =?us-ascii?Q?f0LZCBd3gfjBJuDRApknPS+dAHeeLsi1iPiGSxBhC4mgW+ToviWY7E5Is/dn?=
 =?us-ascii?Q?GvUcMdWL5pwCmhVPvWnieVQ6buxptims4vq6HCDPuvhK++HHdB9tWGCKI5vS?=
 =?us-ascii?Q?nmLvl9k1+Dok4W7ZCx7lqEAcKODBocDxu3DsXRdV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f390dda-15c0-4c7a-8372-08db707eb51d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 04:36:11.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpY+aMAWaluxo1Yud5LxhJj1jBpOi4Nmi0I4KkQ8hEuwBAtkbAC8IcYQi8uidEqs/KD0q2aDOz4S/q9gE6FZEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-Proofpoint-ORIG-GUID: u6jiPtG95AS_FmBK0tqVZNX4uHXb7EHl
X-Proofpoint-GUID: u6jiPtG95AS_FmBK0tqVZNX4uHXb7EHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=813
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 04:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183088

From: Chen Qi <Qi.Chen@windriver.com>

It's incorrect to run a cross-compiled program on build machine
to check if some feature is available or not. As these two checks
in zip are basically just checking the size, we can use _Static_assert
and sizeof to do such check at compile time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...se-_Static_assert-to-do-correct-dete.patch | 96 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch b/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
new file mode 100644
index 0000000000..106f246a7c
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
@@ -0,0 +1,96 @@
+From 9916fc6f1f93f3e092e3c6937c30dc8137c26d34 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 Jun 2023 18:31:26 +0800
+Subject: [PATCH] unix/configure: use _Static_assert to do correct detection
+
+We're doing cross compilation, running a cross-compiled problem
+on host to detemine feature is not correct. Use _Static_assert
+to do the detection correctly.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ unix/configure | 42 ++++++++++++------------------------------
+ 1 file changed, 12 insertions(+), 30 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index f2b3d02..f917086 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -361,6 +361,10 @@ cat > conftest.c << _EOF_
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdio.h>
++
++_Static_assert(sizeof((struct stat){0}.st_uid) == 2, "sizeof st_uid is not 16 bit");
++_Static_assert(sizeof((struct stat){0}.st_gid) == 2, "sizeof st_gid is not 16 bit");
++
+ int main()
+ {
+   struct stat s;
+@@ -385,21 +389,7 @@ if [ $? -ne 0 ]; then
+   echo -- UID/GID test failed on compile - disabling old 16-bit UID/GID support
+   CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+ else
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 1 ]; then
+-    echo -- UID not 2 bytes - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  elif [ $r -eq 2 ]; then
+-    echo -- GID not 2 bytes - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  elif [ $r -eq 3 ]; then
+-    echo -- 16-bit UIDs and GIDs - keeping old 16-bit UID/GID support
+-  else
+-    echo -- test failed - conftest returned $r - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  fi
++  echo -- 16-bit UIDs and GIDs - keeping old 16-bit UID/GID support
+ fi
+ 
+ 
+@@ -417,6 +407,10 @@ cat > conftest.c << _EOF_
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdio.h>
++
++_Static_assert(sizeof(off_t) < 8, "sizeof off_t < 8 failed");
++_Static_assert(sizeof((struct stat){0}.st_size) < 8, "sizeof st_size < 8 failed");
++
+ int main()
+ {
+   off_t offset;
+@@ -436,24 +430,12 @@ _EOF_
+ # compile it
+ $CC -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  echo -- no Large File Support
++  echo -- yes we have Large File Support!
++  CFLAGS="${CFLAGS} -DLARGE_FILE_SUPPORT"
+ else
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 1 ]; then
+-    echo -- no Large File Support - no 64-bit off_t
+-  elif [ $r -eq 2 ]; then
+-    echo -- no Large File Support - no 64-bit stat
+-  elif [ $r -eq 3 ]; then
+-    echo -- yes we have Large File Support!
+-    CFLAGS="${CFLAGS} -DLARGE_FILE_SUPPORT"
+-  else
+-    echo -- no Large File Support - conftest returned $r
+-  fi
++  echo -- no Large File Support
+ fi
+ 
+-
+ # Check for wide char for Unicode support
+ # Added 11/24/2005 EG
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 1930a40140..802877285f 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
            file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
+           file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


