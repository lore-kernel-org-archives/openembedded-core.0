Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91264CD11C2
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 02:41:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2327.1712112076085133941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 19:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4823af8d7b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4332QZNe004253
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Apr 2024 02:41:15 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6uwxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 02:41:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4qpjfWAXfFGuNKqka5FJhAfvXCt+RkRkt/suz2cjtAm4k0isbWaxtDWnPJ9GQqVqoPY9rpCt7PycjTrA2rxoltMbwxrFL3DkLwFsd+9iJk6Y6TW8ue+dtHHydden8f12zekNmO+ED+KQRt6O4EvhY4KKiCeqviJamqjsCf7sdQfM2Z5WzNPbeAPni9tKmZRCk2VvCWI95rh+pFCoZZQg5Aoj9sk5K9SBVe/+DGOUPnTZxrjpJCj3v/Y4KmCNyz4th/VJonsUrWg5nie9k8VXZb99mHhuo9SYJv/6DZw2kpN/14R9rBQLZe41Q+ffLhycCQ4kGARRMiRr2lqzmbIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HiuZl+1ZiZswhbSk1Ig/d9+B1EG7NNUE0xiwwf26yc=;
 b=cuNdRhDlX+suoEI2/oxmp4NZjX2Fu/pAlj7MVH3MxCw4pV3IZ3klpxsj6je2nyBJOL18EJM//Cc3sWkdNmB8zhYUWRzIR5O7SNbzlvCC20ON9kPVHh7XdfRMwfPmKd1YdPBEWY50wT2HrQKnSMIVG9sEEpmL5tC26PfYhNUPHtG8+ZwhKkYbvkvPb3m1r/BJQlwaGxv7+SuxW+DLSfzKrykqhwdjJSyPCwU08weMMmQCRBtZbEZNc2mx2N9jsR3yCdwFGOjKnrjErMV+0BES2fEAmFT/qT2qhIqPtyURMNYyKVEYcinMeeZO+JNVEzHtCzCk1U6Ih8ETlEFrQU5siQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 02:41:13 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 02:41:13 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-tools: fix rotation-destroy-flush test fails if no kernel module present
Date: Wed,  3 Apr 2024 11:21:07 +0800
Message-Id: <20240403032107.913947-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH3PR11MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XmnPveveV6b92Yej85JdvZ9rPypiaMYkBidtFGmpKa43SKhrpsL0g82EFQbVzhDBiqngoKldrIxdrnpHNfB7KjFfknlsusyJWf/XJxmujdzVrRfHzlMw62I5LI8EhS7xzAtVfzv/6swv9jmJl1Rvk9A6igS5C94zPCVJUFr1vS35Im8VZZx2HwyDmPdyEbe623P1X09fSffAufA70MhrQp7ZV1ARWG5I9s8pPGjFJHJagLX5yTUuGUtjRLQgNmVzhph1cSgPgOAdQdIRaJ7P0OuHWlmcZJdpi7IK7p9wpkaJjydK1u5i2kgiiKJ4OM2B5VDZX2JXbd8yDO3AFKS4CP4D0PlqmE5HP5iKnmBqADyjs0KzSFFrbrb5Au9BnnpmGhPrbXw93quBDTV/r7PyhohdndrFD+aKwemHJytdKWDDxaclULa96gMrQ6BIrP2LUNkF8p8KS72fGd3W/6A4zJf1855FZMgij8p9oKoxcsVBewlfjG3zolgPIbEmzeB64z67iYR9aSaOdKLWiTWbEWotey6Kzvp2FDdxno3/4+gnC0qWAtBi/Edt5MDt4nbxonlh1MxQv9vp+feE0mWgRiAYmFVC2NhICGdk0JxAyQrris2MLTui9L9Os2nBA+x/+inTYHaWr3gkWUPOp5VgT0HYzTqz3lxWfrZgFZh5u4Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HY66GuGlI5hb65IePTPJC0/G/t42Lu8QdiB3HSjfEt9DZjnUg5/MLfVsPtN/?=
 =?us-ascii?Q?YQn0xHKBOMbQIHxyZLC6TlhoVSTu7qck+0/fjSDKLLunKZ8UEAZ+RKGcAlN+?=
 =?us-ascii?Q?4w9usrH9bUqMXU285TwoMeBxT91f3BqmhdvYWFvZD5KE4mj2x7pBBdj2jCEo?=
 =?us-ascii?Q?HBWQvJ4VILO2y04xCrleBqJ51sGBNHuXv9zQ0DIo0MxXythw/HY6BLHXosuP?=
 =?us-ascii?Q?PflO+3xGYfiMVd1fn8fK5H00PRpdEWTrUM8XZe16a/T2nuSXmdkF6jhWv1tr?=
 =?us-ascii?Q?ZC3C1/P9gyER+umRkU7lbUcyoPCmW22XhXplShCjbFHd6UEbqdO3jgfW9IvS?=
 =?us-ascii?Q?pRGV5a92vXgSPUWSMuiss1yLfyTtBczO6TDQtZazB4V4mGN/oTTlFnUVjahB?=
 =?us-ascii?Q?bDtlrRxDr7BrNjhPgv2Czi4Qg82DRYxIGpRJ609chkelU65t06D5GEqlVSsh?=
 =?us-ascii?Q?GcwIVFEQJ2Grht5jN9uuMKZVJhNUUnI127Pfeh605uqQ10bL/lDzQSN7FUMN?=
 =?us-ascii?Q?dqHpMMlgmfI/rxW0VQkKKPs9l+ibofdYP7NydCVcCd6uiZVfdhBlFJ3a96Hu?=
 =?us-ascii?Q?k4005ldNQdbchUcWG7pIG7xtUVdcv5x0B9fz2J2bN3RrYE/3RGY10YjIbFtv?=
 =?us-ascii?Q?rJmIlB5vvkWLGmXmnEtABeSIYZJkGP8jJOgCCQKZgHfmNjr1goP89xgRC1HN?=
 =?us-ascii?Q?9AqH+BAp8qXlw06/Pk+31KzFZK87ND4Mn6YLIkoQKYCMWclzdoCm6fDSmB7m?=
 =?us-ascii?Q?cK9zrTjBYm2mGab1UNaUx8yso7OoIiKI/4xqekfndv4GrbUFI3p3zKiim/Qb?=
 =?us-ascii?Q?b97QzvLHMO0dAmuW1AKT0d92SHiDqectCPSFt1iSwWHLnNsxQ3SHllSJezh8?=
 =?us-ascii?Q?4S1AhXf9GOdNUHMnhJUgV00/zB3fBlTRsAOUP/nCGzUQrIJWcXNGrGJ+h/PX?=
 =?us-ascii?Q?RzzXH4oF9kRqg91ea275/rtFTKFGuBkYROvKWE/uif3dJSnzkgzk8oOxwjlU?=
 =?us-ascii?Q?qXyY3sgHgvwqZcHrDD0GtOgrQcVtHUII6MOHS/1b053/iFE/ycDa0AN5Kmrq?=
 =?us-ascii?Q?cdTFbs2dU6ex3BOiQNC7ktokR5rNcBkPMAIclftt+8iz16PNd2J7eNKRh216?=
 =?us-ascii?Q?CuYtdNwaZuHY8a2PyXwhp0Ea11QSwghCZeuDawQzmOBL7uLFJafVXRibb8ax?=
 =?us-ascii?Q?Ujds6IQeT6wMDgs/QJqj+VOsthAEhZgf0hlSQnvJ5Kxr7PSgVyqZ9qvM665l?=
 =?us-ascii?Q?5icOYaQ2pQuDErx8oGQw3veOHhMtuLGshnqdUAhuZCLUsjtUaj2ijEjigxDB?=
 =?us-ascii?Q?qklvDN1ouuFrzevyRNS4GZn8xaTRaZysxhh6twMxkVb49KoXfdnq/DTgkfl0?=
 =?us-ascii?Q?KETvwHGxYhhnNwVih7tw/cI5IJSs7qRKjJEhP/QlThKh/1/KM2i+2wVDwyZi?=
 =?us-ascii?Q?8yw9VwlGjYucdMCij4IXREZMzmHnxAQ7RFM24TtKQIIKcFnIMz+t+s/qzk4G?=
 =?us-ascii?Q?hKzVqXEi2FVLJW/eckkUwfNlYRt/t0/C4FY/RyxjgS2T4+hwKtOe+m53ySdD?=
 =?us-ascii?Q?Zs5m1OuFM0j9iYsRFGPs4Rv+KQprS78C/QHbj+ZlAaKizqAKOjVWAI6TtMT1?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de49521-6163-4fbf-ae26-08dc538786f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 02:41:13.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAspWxhiEI7ghke68O5eNr42tcTJh3uGwkzYjtLBmvyZEKRcVxHSFqnB3Nn/q0A5e7KPdH6wWCZHcW7ICKwyYO87cYgUG4nC8I+UzcqR52s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
X-Proofpoint-ORIG-GUID: Xp5ce-RUB9i6C1cHNqJL8AwO-8EIY4Wc
X-Proofpoint-GUID: Xp5ce-RUB9i6C1cHNqJL8AwO-8EIY4Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 02:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197884

From: Xiangyu Chen <xiangyu.chen@windriver.com>

lttng-tools supports testing the userspace application without kernel
module since oe-core commit e0d8494b, this is a fix that testcase
rotation-destroy-flush report LTTNG_ABORT_ON_ERROR when no lttng kernel
module present.

Fixes: e0d8494b (lttng-tools: skip kernel tests if no kernel modules present)

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...troy-flush-fix-session-daemon-abort-.patch | 56 +++++++++++++++++++
 .../lttng/lttng-tools_2.13.11.bb              |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
new file mode 100644
index 0000000000..3286dfb5c1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
@@ -0,0 +1,56 @@
+From 6b45c5f80d20e7bbf3d98c1fa17d2cf8716af3bb Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Mon, 25 Mar 2024 18:20:14 +0800
+Subject: [PATCH] Fix: rotation-destroy-flush: fix session daemon abort if no
+ kernel module present
+
+Testing rotation-destroy-flush when no lttng kernel modules present, it would
+be failed with error message:
+
+  Error: Unable to load required module lttng-ring-buffer-client-discard
+  not ok 1 - Start session daemon
+  Failed test 'Start session daemon'
+  not ok 2 - Create session rotation_destroy_flush in -o /tmp/tmp.test_rot ...
+  ...
+
+This because test script that sets the LTTNG_ABORT_ON_ERROR environment
+variable. It's this environment variable that causes the sessiond to handle the
+kernel module loading failure as an abort rather than a warning.
+
+Using "check_skip_kernel_test" to detect whether the kernel module fails to
+load is expected or not. If the failure is expected, the script won't set that
+environment variable any more.
+
+Fixes: 3a174400
+("tests:add check_skip_kernel_test to check root user and lttng kernel modules")
+
+Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/12155]
+
+Change-Id: I371e9ba717613e2940186f710cf3cccd35baed6c
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ .../ust/rotation-destroy-flush/test_rotation_destroy_flush  | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+index 669bcbc43..64161768f 100755
+--- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
++++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+@@ -23,11 +23,11 @@ SIZE_LIMIT=$PAGE_SIZE
+ NR_ITER=10
+ NUM_TESTS=$((15*$NR_ITER))
+ 
+-# Ensure the daemons invoke abort on error.
+-export LTTNG_ABORT_ON_ERROR=1
+-
+ source $TESTDIR/utils/utils.sh
+ 
++# Ensure the daemons invoke abort on error.
++check_skip_kernel_test || export LTTNG_ABORT_ON_ERROR=1
++
+ # MUST set TESTDIR before calling those functions
+ function run_app()
+ {
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 08144e271c..f6abd9e11a 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            file://0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch \
+           file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
 SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
-- 
2.25.1


