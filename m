Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C72EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 23:38:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1940.1647646706634178396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 16:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lzd6LEuh;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0076eb2641=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22INTjRD013761
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 16:38:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+8H0LdlA1vP3+XdUmayxJYM/nZIanVrnlbHV7s5sQKQ=;
 b=lzd6LEuhcfEXq7Vt3cmQT3v1oEDBUHlKyLmJ1b0G/6DcbM0dhA+AgGi3wUBUHUtD7y0w
 x8vWWjQp8jBTP3J+VIoOc+9QdDHeZPbsfeZKAH9F5L+z3xXxsrnNUC3msR880sLp3mtb
 n5LWs2bAGwCba2I2CEInjNPTM7l2K++1WwqWJ/h6TNLcw/UyuSmn9lfG5osR57ne4JUF
 YYogK90N/M5lNaiNRDcWLaV0+qdbk+yjM/w5qz9syopif341fsyFSf3vFUaixChKAAxv
 CdQqkCviwrIJ1gWYNXBD2vib+0l3Cjs4BJE/dZZZZ462no1q/Mz8AaKyopsmO+vaqUY/ XA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3evgqa8qqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 16:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+wHRJW8PFtDaSsAqOi9ZhJHeEBFx2AiPYyz56pBTRPGwV+JPS7ctByxpoK+NJ0I3fmgMILNReeI7dbW2bFo+xC+2QpYRbbiOEe5ETlzGb3Qpjd5IXF8x1k7OOFkEx9qGGIpbpGGWO2U854Mk3dHfapv4pBmFUJ39MeLy9H3bHh7/DJ8jchGeSMjMigN1jChzBn9Mbit74OdSZvD/RdY4KecZ+wBQwCo9vUymIlsCrX+PviWBjNSNlG+m58jJBasKD/qy5MByJr/IFhY60V1lSwnTOVh+2rk4MAcJ3NLZ/XD4Pen6DWxc9XA7s4Bugxnq2gDFLol6vVWDJWnaFjB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8H0LdlA1vP3+XdUmayxJYM/nZIanVrnlbHV7s5sQKQ=;
 b=XD0CfLu5P1kx3B2Zq+cfwy3dbMUR7nF/IdUzzjof8RBAgReekF5WYlG8pny72EcDo3lWzb8+PLYuVvT7Bnv1I2CsBbM0yeeddr+nQHrEpDgmH3uuf1hdFT5O32y+cqawXFwSH5YTETebrLPwr0zH6DOzS/hjoAZkajpDjxZCMMUWNS99MMR4jAoT8kOjjayn4HQhRt9su6GhITCk+6sBhsrLz/i87G8xOmrl0vixC0QV1l3pMOPzy/dE40cIOGth84ebLS9izWl0qf96SpSxCLdWHLurYHshm3NMpidtHm8Qzvp+3aTrY88fL/GZQ2irH6UzrO0189Yrl34TpM5Ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 23:38:22 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5081.014; Fri, 18 Mar 2022
 23:38:22 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] zip: modify when match.S is built
Date: Fri, 18 Mar 2022 16:38:07 -0700
Message-Id: <20220318233807.36315-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdf17e0b-7b22-4bf2-adc2-08da093863ae
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB469881BDFC8765C5F2802C3D88139@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ub0FJrE4KW5h0o2JRS3/S+sV0/PCdkDUDcwM0LAm7tdx2e7/Swrw1tOtWenKGDj9gkz1pdSfPac7KW2fyeIeo8y8tLITi60uZ0dIx+VKzYjsIlWGmw9j3gBTh2V9ukJlSivvL5U435A4UOUDsJyRzfKckVnQDuqXK+ORvMnwSeuK3pMSwCHHfyuUBkFd+afaKj+SZJGX1gjZfFjFVUUN+5kPi2Nd4Nr+VFdaDDGjlPSTGAIuDWcf6aWIUhjDgziQu1ZLh4PDoNfNAKNmbdH2E4yPJaOzBk6rtSMtHZmES6apC503W5XvtE9lwnX84cRVXT+Pt9UnhdtRrYcRhQvGCQdmTzQ7Jo3X/FNHvWmf1pzCwdYGxScrN2jBqfAcqWOsRl43oH339Zz1n15IWgOUM1n5yzt8u7vJprrMC2e+hT3PD3QtCcB16bkQG+uW5jL8nrqBY+GHCgaesMbu0Ffdxd9pv6D3Ljd/KQa53AkmpvPOCZN4PwWQdeTuTn38fK9ySsaZ0Rtqmj+P+LOdvSAbOOIJIVzRlztnykYTLJfDlcW+zt0TYt9yjZ2DncMUr6xFEh6AavPBS3NtsYnZ1WfsK/PS9srPmR2eu6k8Ep44WGtwJzmxZg7MBxVy0eT8biYg+hyrIo0/AQ1by7mkNGGcKk7IQ8caa352MZIo/ZIvAQpw7bX4c8dEsdF8+NTL+EtDL6xVEVDGU2YD+7pQUhpw+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(2906002)(6506007)(38350700002)(38100700002)(6512007)(83380400001)(8936002)(5660300002)(508600001)(6666004)(6486002)(86362001)(66476007)(66556008)(66946007)(4326008)(8676002)(44832011)(2616005)(316002)(107886003)(36756003)(6916009)(1076003)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oXXxiLommYNXfPrqwQxPFddOwWJtMLG7zCI6Fa1C7++us5w0LbvXiktOBG3V?=
 =?us-ascii?Q?McfQSqamYvoGV0d57N1MOlc2n8YS6atjVMUa2iqMhS/mFAN7Ok+NI17vdVHD?=
 =?us-ascii?Q?bG91zXNZXHrgGsywK/DW+Mxypew41R8J8OkvmR5fmFsdTiLOpbH6QTaCiuuD?=
 =?us-ascii?Q?hX2JtXIDhSh4rNqCY1rwh57W6tyzkp+rZ9DfO54NQGwqChUNhDla/XMUZX4B?=
 =?us-ascii?Q?Y3IBOXYw4PL7/GEnHN0sPsn1eVW77Xx2g8BowMTJh/xs0lhfc1y57jdw1hca?=
 =?us-ascii?Q?JTp+sWnqgoNlMLUYtk1jXdpS9CDCGaHKJE3Sa7o/wSaxklIw6O/+lmvyiAQy?=
 =?us-ascii?Q?gjV3pFiz0vquD0QjBEhGTr8anxDnsar9Dv6KrsGqGvqf60brI8Y2Zyt9hLej?=
 =?us-ascii?Q?ApIDor/v/7lFyZ5r/r+Kh36zBn6AiWzmvMFyxqVoZco8cF/OTyf9o88NU3QR?=
 =?us-ascii?Q?QHTHhFHZZq92ob+f8VDM09UeihgAACJspHkWvQgoOT8b6KTfZDd85cPocjtk?=
 =?us-ascii?Q?WEptuaFcm81cski/bdcep94OqCPIZYIvzTHI8VN+Cd7TIepefDDNef7cI3fR?=
 =?us-ascii?Q?OC69XJNdHJ7/NWSju3LLEdlSdxc124WA0Z1nBXoY9sFIpPzUyqJpZAOls87E?=
 =?us-ascii?Q?b6fHwmQIdbRvGB/Drb3EUaYHwmYXCDino6d/+MUfLYCilpulyjHUlmvUMJkH?=
 =?us-ascii?Q?I+Cf6MNg9aAxG43qgQHW+heaCYem7J3vXOyuzM8rKlrCHG+IqHfcVJaAfZ8Z?=
 =?us-ascii?Q?npzyTbNp/df/Id7+tb6x07MGwb3Dz2xxLzuHJ/UcbyTVlZ3OU658VJrIEJ1s?=
 =?us-ascii?Q?TuAslkyN5fim43Os+eQy2ixKb3xlLKLCwrmTYX+CjXcO2IvciQZU3yvFKhn1?=
 =?us-ascii?Q?mLgN6vkWIaupzEsgSScutQHPGAfBuYw4x793Ebr7To9lXWhHNqvvjLoCfP7/?=
 =?us-ascii?Q?0OOZYROUT759WninoVcWK1UuLhR5GQ4FAS8p3h38nQWoxJgwunmVRocDbNC7?=
 =?us-ascii?Q?MlMNbzW8uulVnqQnX7+CIwO0oGdu7hNgh6yFwt/Am40zBd0Ipq/ZOlpWjJ4O?=
 =?us-ascii?Q?9nFsNSCG3l4G8V6RRogld2QDg1wlXttc2T24BHQDT00LKdfMTihpqkf5exXh?=
 =?us-ascii?Q?byGcE9fdTjqRmn9vmEBlkBsOULN3bh60WzNW0OoBWq+jqNIh3Cu+RpOXjXID?=
 =?us-ascii?Q?Zkdhya8MywVf0X+LytBA33OpyTux1Dovo36J+/ozDa7ltFVOtsmD+x8mrNKU?=
 =?us-ascii?Q?v3YG5zwKjG2Kym0C3WndXq5Q5F7qv2ydrabvEW0UQcAlKr9vn6t3g4nYsO3d?=
 =?us-ascii?Q?yTPawu0OD3zCin3J723MOkh9GYQA4z/1Fh6y2f+dswNFhOpeO3QBIndZeVhx?=
 =?us-ascii?Q?GwAPJH+H6T56yc4x7ORXgYbp0GG8BWEZ0LUzLTNshDtVHPI5yNmpFUhL0fQb?=
 =?us-ascii?Q?NFd7opFqOW3lC9Zy65pvHqdfy4G+u/Cl7LlibSKEqkFoBHhPIbODng=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdf17e0b-7b22-4bf2-adc2-08da093863ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 23:38:22.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t2I9tK72nbx+yOTX5kxbIVuEk9ROtj/6fyyP3EMhl/cx7u2ZAYMDpLTVJCdU2eiqqdq+9MB4MOs1RiYRQeN47b0OqHj4nPUvXOGCR795gwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-ORIG-GUID: y6PLU77DRVXuPI2Fy0U-1ONgRmrm5ZwF
X-Proofpoint-GUID: y6PLU77DRVXuPI2Fy0U-1ONgRmrm5ZwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_14,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=776 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 23:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163453

Avoid generating non-PIC code.

The patches are taken from master 58b16da805... but we cannot
cherry-pick because zip_3.0.bb context is different.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0001-configure-use-correct-CPP.patch      | 47 +++++++++++++++++++
 ...002-configure-support-PIC-code-build.patch | 34 ++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
new file mode 100644
index 0000000000..02253f968c
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
@@ -0,0 +1,47 @@
+From 7a2729ee7f5d9b9d4a0d9b83fe641a2ab03c4ee0 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:36:59 -0800
+Subject: [PATCH 1/2] configure: use correct CPP
+
+configure uses CPP to test that two assembler routines
+can be built. Unfortunately, it will use /usr/bin/cpp
+if it exists, invalidating the tests.  We use the $CC
+passed to configure.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 73ba803..7e21070 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -220,13 +220,16 @@ fi
+ echo Check for the C preprocessor
+ # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
+ CPP="${CC} -E"
++
++# We should not change CPP for yocto builds.
++#
+ # solaris as(1) needs -P, maybe others as well ?
+-[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
+-[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
+-[ -f /lib/cpp ] && CPP=/lib/cpp
+-[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
+-[ -f /xenix ] && CPP="${CC} -E"
+-[ -f /lynx.os ] && CPP="${CC} -E"
++# [ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
++# [ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
++# [ -f /lib/cpp ] && CPP=/lib/cpp
++# [ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
++# [ -f /xenix ] && CPP="${CC} -E"
++# [ -f /lynx.os ] && CPP="${CC} -E"
+ 
+ echo "#include <stdio.h>" > conftest.c
+ $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
new file mode 100644
index 0000000000..6e0879616a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
@@ -0,0 +1,34 @@
+From b0492506d2c28581193906e9d260d4f0451e2c39 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:46:03 -0800
+Subject: [PATCH 2/2] configure: support PIC code build
+
+Disable building match.S. The code requires
+relocation in .text.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 7e21070..1bc698b 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -242,8 +242,9 @@ if eval "$CPP match.S > _match.s 2>/dev/null"; then
+   if test ! -s _match.s || grep error < _match.s > /dev/null; then
+     :
+   elif eval "$CC -c _match.s >/dev/null 2>/dev/null" && [ -f _match.o ]; then
+-    CFLAGS="${CFLAGS} -DASMV"
+-    OBJA="match.o"
++    # disable match.S for PIC code
++    # CFLAGS="${CFLAGS} -DASMV"
++    # OBJA="match.o"
+     echo "int foo() { return 0;}" > conftest.c
+     $CC -c conftest.c >/dev/null 2>/dev/null
+     echo Check if compiler generates underlines
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 18b5d8648e..f8e0b6e259 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
            file://zipnote-crashes-with-segfault.patch \
+           file://0001-configure-use-correct-CPP.patch \
+           file://0002-configure-support-PIC-code-build.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.25.1


