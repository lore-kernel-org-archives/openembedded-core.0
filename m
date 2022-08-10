Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C615FC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6272.1660140749587824190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eW/Vunz8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACdJdI006366
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=eBD0FIPq6LiAXXsu7IkaTvs3vDY/aPYw+HUIkDhEKa4=;
 b=eW/Vunz8cQ2uii5CWSw+pEo8Ozi3EX8NloQLWxZ8XslCn2KL28CZ9aZzBrP8CWofnmpw
 66Xhf9Nq9IK4xnUMs5NBEdwIMjA5jfCMWOsQc2wsTO7Bz/2hfc7BVOqMf00mdNzbIVGp
 MQaXzJ+Wq7jvl+ARmOuBBonn6u2KWjJRjvkBurGAUwSTJIapDlWhpmChnqQFG2YpFzh0
 8LxFMpO5qxdUdN+u+g/e7/PxrcJP049x4iy2z3Vh/B+SgHvvLS4qPF6fPgGV1TlEAFUY
 RkrqjF/wczNBgdTJVbsKsrAVEKmQ7Btc7aUtfdhVpLIpGxJh4cj+8N0FGqPaNMyW06uP tQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7rkp5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8zub0n/8NqXck6kBxjYmBL90okXS5lA/BoJKX/0CSk87ZuZe8/vNBEM7MxHtNRe+6mRiXp615mQBmUKwa4ATeqva2SAmzCGcF5MATNl9pGDctljXu3MoOceX7JhJNo2wBCZIbHAt4vFDdJ46yNlVcrAw5lr/UyNCiv7ZlqgJDXXevgmvhK8kAYW2jrrhq9ROyeALz89J/whI+COnrINzmRq27g5KSurO5EclY7QpXi4Whd3PhKcNrvOEKTV9JQ/ke/q5q6VWjweHU58DETEcb9+Zn3AZk15N5yKP9gJ6S27LzQP56pUG4cRGdpEpgJGpw0IdXEw4pET9aXFT4K0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBD0FIPq6LiAXXsu7IkaTvs3vDY/aPYw+HUIkDhEKa4=;
 b=imFYuj4hgJAMlhZokTh+U0+gbYQlfOTlcqc55HW27TVD6/rSej9b+sOJV8BaW70LnzyueoPS7aclJMzQ0UaMjTCGoSRV1AkB/jKh0pW2OskzJqpi3uQR+8FUgVEqBUTdqqbKfuAh47AtewGbYton76NkudyXNBOoxqNLNH441UlU1tV8m/KDclZaNSCL1Yxlvnri6IPNMsLN+Ty7qc+C8RCod+eoX34eZSgHz0gVpkCrL5W5d6NsBdLvubFWN35igx/hEB9ZY9ZipQs0FfeGJDVkdLemWDr0ELVbQ6oDxkDGlgkYpcVV0GiGEN07h/dJl++j7tfZYgj2sXwHfZnmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 10 Aug 2022 14:12:25 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:12:25 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 4/5] qemu: fix CVE-2022-0358
Date: Wed, 10 Aug 2022 10:11:58 -0400
Message-Id: <20220810141159.21182-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220810141159.21182-1-sakib.sajal@windriver.com>
References: <20220810141159.21182-1-sakib.sajal@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626863bf-3579-43c7-d7ce-08da7ada5944
X-MS-TrafficTypeDiagnostic: MN2PR11MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0To+T+xtaXCgIHwaYTXCxsWudtllKZNh5xjnO/zJolxOLIjdLBWtwMCGAHdEPL4vBtEQ/xBckf07+Kb+NST3yu8OjeIQU159Rfrlg6Lt5ESUztdHlMcRF/wDAmdNDLayEt0hTOYxVG8swOZTyOWvDMe1OzQCBXIlZBVxk3hEyCiR/U7Zm5ZX6Pk7fJiH7OVb4V2v5tN2qcg+QdZYBaZLFhwaCLA4sfrs7PV+J3aZHRr2KPW+y9oUSDx9u9TzyIVQueLdwLVNEmPR1U2grVmJWcZZjUEJItZEP1hQzdmWoh8+qItUUSMzChMjLO3xbYxkxITRWBEgvmJIIR1zxOFJScE7OwkAAKKijuphp173YtmvBPPACq3+e71ju1SJcz68zeJrC3w2/z0/4zdXIQQ4AFwaNzS09qvut08bRuv26My6npPuz/2O+jeUHmIRQenxzrUE8dRZMlJN9foBHTK1SJD7WRisyme09v1mU8xY7Yhm377lTOsPbyoNoSBcy1BfY5aRmVa8wYZB/o25G08yrX63l910divGas9IMRSTPS3Lot0HEygU60d/wM4HBPf832m7qXaU1RmciP86dAM3HgzLVPlIf2hfslu2cPoeHKwNUf4DxYAeuznC9zxbdltl+gvqAqTeZCy5py0/T41l7qOai+0QPWECLM7L2ktU97Cnnoxj9y6EYdQZlF9GubwgfN/OBI0wvIy73AK1raj3VFlmBaJlsfchz4CObSQZhhk2t8UDv6JykCDPdJV13NrGdnwiXmX/Ln3YPXppi3uyqa0viA8jMPqbqtbkTaPiFuJ63uYhcQIeyhT+InQcwF3/9KAtPrWrGfHCpZXCAbRbTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(478600001)(6486002)(41300700001)(86362001)(966005)(6666004)(36756003)(6512007)(26005)(6506007)(186003)(2616005)(52116002)(83380400001)(316002)(6916009)(1076003)(8676002)(66946007)(44832011)(8936002)(66556008)(66476007)(38100700002)(38350700002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v2XZjdjuFTHJ78GLmv7lH+79aIkc4SzAZU7QOZLLl51AfEYWQwCx7YuZmKK+?=
 =?us-ascii?Q?B36SfrIaYk7ShnZFIeI3XZ1FGrFYs2Gz/PUI7dyWgsfsDTrj1fZrsKo3R2Wt?=
 =?us-ascii?Q?yp4A+sny4cFyC5f7QtIFm5bH33sKNSkXz4jyncn4FCq6ufjKhI328DdVA00i?=
 =?us-ascii?Q?WI2MZTbiWRlytOUKnmNd3AkTwJa2aJC1zr3sVcEqv5UljgG0x1NdjVNZh+R3?=
 =?us-ascii?Q?1p2kKoZExFECHAjFfOau/NyQYjHHTyfF4FhrV2XEuYuwGr2LUMOghDV57Yqr?=
 =?us-ascii?Q?sm1cdEUJgt0qxRwSIA9VURcRhYILS1ew7LPRV0u6Gk5UQo7NEmzUdrF6OIKI?=
 =?us-ascii?Q?DtLSWWU46mlJDNAXgTIpwmjnCGZxiLTlxL4uA6glnEQq4oy1UgjzAKQrdr3g?=
 =?us-ascii?Q?OXAFG58oByAmATIE9McZhlIcmiFhItIZvC9/n3I+KtyHcLKS/j4rusJqbPng?=
 =?us-ascii?Q?PpScbyCGmfHy62iPO0LRQ/sg0RQEO7E5YlK+fuVQLmMpnYHVkPz94H5PqVXb?=
 =?us-ascii?Q?K7e3/l6KH3rkupuA2TsXFyQwr1Lu03I9J1ggkirBiPrnedqjeiaO4M5ShniW?=
 =?us-ascii?Q?uniESfGI1l0E+v8SlT6aC9SO5A4SKsrCxa4i9yI0FacG2CwQ4wkULx+Xd0Wk?=
 =?us-ascii?Q?wFF1+TLZuXUMIaJJ2dxAODG8a8LVupwP10cV5o/AJViJ7u/jUsuv64SG9DxX?=
 =?us-ascii?Q?mQYS1ixHHMLjRRJC8D66AcIvOm3w6hHA0kSj8cLK0tqBPMWiNYalRy3RRaUG?=
 =?us-ascii?Q?6PFLhNRy+qBm0nMXwG+IlUDc9wHrSNHbDNQod7vIBlmGFoBJMAlAf4gcXw+C?=
 =?us-ascii?Q?1Hy4HhN5qbmCLAtkd6Pk3K1qWi273ePrD9dpAXgFy6Lh8O2+2FcCfh4FzTt9?=
 =?us-ascii?Q?m/qzbe3DpMUaedekoyAWsnO7aEDxHZpiNfEORXU/rtfm0s0w2coRKdEJlEZ2?=
 =?us-ascii?Q?ywOqwaWHjIcMjvqE7sYIfXuPhuvgjrINa+mg2t6lQIJVyiYzUqHQOJ7B7VUW?=
 =?us-ascii?Q?6EqDtswz6Ic8IhX56RaAjMtxSPetZ/mmFJTjdvYGa5kcmB1wEEp8BO0dvCCX?=
 =?us-ascii?Q?se/haN6zoEU2TSeOXMVxExQ3VLB1yorPaOiMWWqIZ1S7FbyN006PRvyKOunT?=
 =?us-ascii?Q?4IF8nwA/YX0pGgMnP+rs+s4Gb7cKDpo5Pzdsx6G5CN8M5HQjVPfxHetYtPs6?=
 =?us-ascii?Q?bHwRPsD4Nq3yzDFoJjG38g5ZSX3O978NV6WoWDVEbQ9qlTxAWwh/gXHQjvtI?=
 =?us-ascii?Q?gIonlrALZRBvGc7BLGK6EebCUvXEVHezFDJizshXV9G+4zY6VZfGvpR1U/mp?=
 =?us-ascii?Q?aJuDj++JVDclu/7h+YAl9Gd/lNrSC+NMWgmE4uHwgkW6+Jxw4+Mymv50MmGn?=
 =?us-ascii?Q?DLVHCTBXf+pRMoFFQT4pMwPm96Lm5pQhIjVCXb+HshTTTkFM+dijx4IWURze?=
 =?us-ascii?Q?iECe79/TKJ2jxpQrGaq44WhXCfVorcJvp2eCNhbGpf6Iv2Lkrr/5r6uHI1lg?=
 =?us-ascii?Q?R7dKeWmE+OLlQ0oB3QOq0fJL70adtGlDylV1F7G7l06iUfegg1r7yv9LSYjl?=
 =?us-ascii?Q?gwezOJObRux8CFbTsG4kKf5B3w5E7kcOkse2Re/biqf1FNw4Nq/UVhaGRyN5?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 626863bf-3579-43c7-d7ce-08da7ada5944
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:12:24.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h0hv01h7bIcHuOadgCY4WD66WKQnf+XBQSAwFQWEWIN8rFZ1cF8fVQKvb9b3CoXHsvMqOavK6/p+nTAT2VEEzwEH5eWTdlxIYL4VrjQjQfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-Proofpoint-GUID: wCPGSMlpv7ToG98fuRFLR-P852Ugf2Ct
X-Proofpoint-ORIG-GUID: wCPGSMlpv7ToG98fuRFLR-P852Ugf2Ct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=871
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 14:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169195

Backport patch to fix CVE-2022-0358.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-0358.patch             | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1d04ad3c67..44d4c9ca2f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3507_2.patch \
            file://CVE-2021-3929.patch \
            file://CVE-2021-4158.patch \
+           file://CVE-2022-0358.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
new file mode 100644
index 0000000000..8eb1475638
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
@@ -0,0 +1,106 @@
+From 4d2558ec9336d3614a43f7437c9cf74793ae3a87 Mon Sep 17 00:00:00 2001
+From: Vivek Goyal <vgoyal@redhat.com>
+Date: Tue, 25 Jan 2022 13:51:14 -0500
+Subject: [PATCH] virtiofsd: Drop membership of all supplementary groups
+ (CVE-2022-0358)
+
+At the start, drop membership of all supplementary groups. This is
+not required.
+
+If we have membership of "root" supplementary group and when we switch
+uid/gid using setresuid/setsgid, we still retain membership of existing
+supplemntary groups. And that can allow some operations which are not
+normally allowed.
+
+For example, if root in guest creates a dir as follows.
+
+$ mkdir -m 03777 test_dir
+
+This sets SGID on dir as well as allows unprivileged users to write into
+this dir.
+
+And now as unprivileged user open file as follows.
+
+$ su test
+$ fd = open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);
+
+This will create SGID set executable in test_dir/.
+
+And that's a problem because now an unpriviliged user can execute it,
+get egid=0 and get access to resources owned by "root" group. This is
+privilege escalation.
+
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2044863
+Fixes: CVE-2022-0358
+Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
+Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
+Message-Id: <YfBGoriS38eBQrAb@redhat.com>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+  dgilbert: Fixed missing {}'s style nit
+
+Upstream-Status: Backport [449e8171f96a6a944d1f3b7d3627ae059eae21ca]
+CVE: CVE-2022-0358
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ tools/virtiofsd/passthrough_ll.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index 64b5b4fbb..b3d0674f6 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -54,6 +54,7 @@
+ #include <sys/wait.h>
+ #include <sys/xattr.h>
+ #include <syslog.h>
++#include <grp.h>
+ 
+ #include "qemu/cutils.h"
+ #include "passthrough_helpers.h"
+@@ -1161,6 +1162,30 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+ #define OURSYS_setresuid SYS_setresuid
+ #endif
+ 
++static void drop_supplementary_groups(void)
++{
++    int ret;
++
++    ret = getgroups(0, NULL);
++    if (ret == -1) {
++        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=%d:%s\n",
++                 errno, strerror(errno));
++        exit(1);
++    }
++
++    if (!ret) {
++        return;
++    }
++
++    /* Drop all supplementary groups. We should not need it */
++    ret = setgroups(0, NULL);
++    if (ret == -1) {
++        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=%d:%s\n",
++                 errno, strerror(errno));
++        exit(1);
++    }
++}
++
+ /*
+  * Change to uid/gid of caller so that file is created with
+  * ownership of caller.
+@@ -3926,6 +3951,8 @@ int main(int argc, char *argv[])
+ 
+     qemu_init_exec_dir(argv[0]);
+ 
++    drop_supplementary_groups();
++
+     pthread_mutex_init(&lo.mutex, NULL);
+     lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
+     lo.root.fd = -1;
+-- 
+2.33.0
+
-- 
2.33.0


