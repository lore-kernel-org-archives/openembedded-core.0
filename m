Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C94C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 02:48:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2663.1645757294993699118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 18:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q48hExzE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9055d911ba=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21P2i8u6010104
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 18:48:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wjkAV5t7TN0pt+Boa1XeEUnTb3dvjqCK5BL9JZYN93s=;
 b=Q48hExzEMrMLXg5JIqZmJIdT/jUVac/X4M6lAsfwgWohEk6HhroTGsiwTr85YItZPrYJ
 P/2n/+z2MUwbpz04WLDgNN0Ydq62fBMLXGdrluc/lXfwWbp1WN1cktFkzc0fzZxy5LX0
 KmuwZ5ZtOUGNP4ryP+8LUw8lUbGOlV5LwyB0sjvRXCzfEQJHF7/2ZwfgJFXZuqhd47MW
 5OSFguNYcqaAtsV4B6ai8PQrY0/qWXoLR0Fxw5lDT21HAgcwL4f1WgjWRqZeYNxN8kIO
 pTDcS8sUnK5na+AhWOuyl+F6Q7WHVvW1id+mKv1gt9irPuOS3y4tgey5XVdtIYtmEBUL 8g==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eej5b065b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 18:48:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeBV2Y0h47Lmon6WrxBKn0AHIduuyaWMq+a9xM+E4bIZuNwIwwVuvM0rVsHW+LEiOMh4s9khpfvCB7vPzJ6rF6JDlBHRQJNnFasj/i2WhJ1CIavISDmGzCU1nDenMmlrTQCTpz5cSdrTMeWuyTNNABfMt9XnvyWhGl9mq2Hhk6Id45phly29kgHmTaOvwV62ZGqVtRtLO02IOQju1nzt+2dKm8taZZY3CRf6ukoIoUQZEF+HA7Rl0Jv6IfRAR0TFzuz3qynBUY/jBUJDfXV6QsxuWOg5/0x84p6RUFKpe3qBEE/lBoKyywvjx1Z5cQWW+IXg9y/h3aAzR++AItoj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjkAV5t7TN0pt+Boa1XeEUnTb3dvjqCK5BL9JZYN93s=;
 b=PWMNtRSLxTxxep9kZeG8rkwxORz8YxM8cWm+/NWE7xhwADanS/SxuY01MyNVtCLVBUbNZBkNZR72WQT2PmqsBm9KsbtL/C7VFSjQelFaYgsc8NdSmXFnhnp4H4KunkQ51VDlwJXGub7T8sRFWzV0zMQcuy9fPOCjrq7vL4AUKD2QYUSCQLRqcAA4KXuzljPw4BURwM/NS7WfFwwVP2ct9385Xn+vdE8ILOKwDfJTYh1KnwNxn38cN7gj15LAZoe5Stj8dIqZwxdKk/z2/GvJqujbtaKzKbdMv1s+BHu8F2OYWEVBdRnUjm2BMN3SK8djIgrr82brT8uQGjZRlXgbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB5662.namprd11.prod.outlook.com (2603:10b6:a03:3af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 02:48:08 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b5ab:c064:2e46:4726%6]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 02:48:08 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] zip: modify when match.S is built
Date: Thu, 24 Feb 2022 18:47:51 -0800
Message-Id: <20220225024751.21765-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ac12e73-b170-45f0-456c-08d9f8094104
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5662:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5662D082DE926433C9FA876F883E9@SJ0PR11MB5662.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NY7lBa3uRG8oKsWkZGSQfxqlSWc3WfIGImWo1IGnJLmdfoEgplDhZ4yNYKCM9Mo+c9TxS2b30Wv2fafSfY9eQqiI4U5YC78YTNfG7ODGyeez/+tmBLynM9fjTzBe4siU/26vfsZqUWdr28/CtJB2BubbUTeZC8l3RTh5VuEbAOnQT9Z3ejSxS5jmVayrtadkzxm39cpBjZ3+Jjsw9A4DZBHXSVHLa1Cj9mPGWeIxh/kLur/pfwMj3R6pOoLVLauHMlrVNZ16JMB2bRzAdDu8S45pFmFmO5UQu106iEelXtT9sbEagQIutFk1kolGYY04DuN4Li58SMpKTBGctGOmBMaG3SeKAuxr5fvZOmml98SuzrxOIDuNeRlPC10jMaYaC4G3NnbkgTgVIwin+stym76xflx9KKUj8kTeXQwWjwKRAFill2lncXgPvsvI1OMIofPv0njmwbmLXC9eGwzdGxMhiYB+5GTLwlSgfFKOEsWpSgQmhcvuP8U4NcELldnTO6qeQU3jhOeUxkFFv0QfKBgiGfk3ecoKv/5DtjgeRPw6Vq/HzmlfGnydGNy+kaqHv2tUnIs/YxfkfsWjbb2WXeciyd8q5rN4aZ6IBYwlwNy0ousOvxdkKKQgKIeAR4PfZzxW0VyVTX7mK3oHbFd5cRzKH5Bc2SKoxbDhA5OG00jLrn2+4qrxa7A4CmvjpBPU/Eita8vFFMfGN3LbNRDSBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(186003)(66476007)(1076003)(8676002)(66556008)(6486002)(26005)(4326008)(8936002)(6666004)(2616005)(52116002)(66946007)(38350700002)(86362001)(5660300002)(38100700002)(316002)(44832011)(107886003)(6512007)(2906002)(508600001)(6506007)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DHUMomqOmVXqbwBuQ1oNDeMAjUqzQImV04izZq4P0heBsF8DSvGPfeadeH2O?=
 =?us-ascii?Q?sGTNO7uXi0+hV0/uk8MNh6Xe1UdUoN1dHHkV0nncX0AVBt/ZgYz2ATyeama2?=
 =?us-ascii?Q?mV0S/VmgGL8yd7DW4mGLvleoWhIX0Z9OaXxSKOlRD8VMw5CdIiDW0lqQzEla?=
 =?us-ascii?Q?n/r6sTE74IGQx68Ozc+J6+/zvYn+EEEWtPknDazhSJQQqP0L/vn9CecBWFoD?=
 =?us-ascii?Q?/fIGqSnHu0qsJsHjRBeaPjHYMhgknqCBg8aWKWiRMzOvbTPvldwmpyYibbGN?=
 =?us-ascii?Q?55WZbfoGTl45HQLA/UCLePZSKkqeefdmzxOoiuGYiTKIFcWa7q4COM9u0Bbu?=
 =?us-ascii?Q?Sa8CkB8rZTDplLEMy6m+0oaZUo/3POQ3lHCVyFU9V9JVD/atEkr18jZkGt44?=
 =?us-ascii?Q?kHe0QIuKJzHuM0cyEpcyhb4By5I7uLQtDE1geDRLJ4nANLfO64DLSCM77gvR?=
 =?us-ascii?Q?BVvOS4gTZIwjg+YIkA7ozoKrWEkeo+oes9Xc3vEtApUdh7pjDZjD2gt67ErQ?=
 =?us-ascii?Q?FutWRTJJ1yfrPatsH1zOTs3ANZXUg51r4Zlk8tImlf5Q0DKCyCQsE7JBTRjg?=
 =?us-ascii?Q?uederrwsD1duWwiRDZb3E1JBVrsOyF/pEgS1YZ8e41i3NE/htgdJeBZlwJcc?=
 =?us-ascii?Q?15bFYVba0TndOjafwCJufUOnhDZvpV6fd39jUy8K/3tTB2osULKyc+28PzU0?=
 =?us-ascii?Q?kQyeSyVva8LofCJ105z0a5v3UIylRahurI28DxQZcUXkNwGU6+bCdr5OwTz8?=
 =?us-ascii?Q?PoTcvRDGLkbfeP/9xw+g3ymz5mRqvbuGHrGje/kRkYTU0opRECr0PB1zs6Q1?=
 =?us-ascii?Q?Xp7kXO/VYuWg7MI67mZ+RotElJI+ChUEMZTnOv58k8dlh18HpJ21Gf8P0SZC?=
 =?us-ascii?Q?RrBVtE+PEjMt5FLJuHrzRL62tEWKstNAQ82kQK/8a7+xwVi85Niegw2AJGel?=
 =?us-ascii?Q?QftayyFJ5WWhZDPiUynMdCsFZ+CQD+xxST4BlkUO7g0ivrfCtZ6LZgsZBBv+?=
 =?us-ascii?Q?3zfmM/LXn2JSx3rVG6r/1q5T9f1EQ1dte+uO1Wwmo36BdPnT5mUbZWOr48vC?=
 =?us-ascii?Q?jJOxBnKMEyBIjVdELLYBleXJsRsPD6flJ+3TUMvYZfcJZE6mj3Q6aCmh+vMH?=
 =?us-ascii?Q?N+YWGcNSlJccwGtWmOoBSbRZ0Wvau7+USnSCL+C3adoWhimxoLQTgjTxgLUL?=
 =?us-ascii?Q?o5Hlxj9t/S/U/6jjZ/zneFeF+FjBXuVi9lkK0dcrTB4tYNlzCelnq+FpU4JC?=
 =?us-ascii?Q?008XSvvcHjHicVy5se6sDTAs8hjLm4d8sg4hnRJX3HxLEvTxlIGDKbBM9UxL?=
 =?us-ascii?Q?yctv/Wl3S6vI882/x/Qy+C2vJwB3haP393hqPLGzK+wmhDVPR5hSTxtOMoUe?=
 =?us-ascii?Q?aKLUFkMBt2ovJEgpRvCmBKVeBItg8w33gMGxiwEltSyR1e09MvFtDBtKLhJi?=
 =?us-ascii?Q?nSePOETxze3+C/whMcLf0pckqke0IBupIiwu681QkvXcVs89d+uZ4wQXGytf?=
 =?us-ascii?Q?fayAf1uxMMppkmU3iQWgw9fH799aGONoxqQH/MBxAsCANrgvnQjOkp4JgzZg?=
 =?us-ascii?Q?+bZCCuOzBxsjWYKYpV+FaCHQ2Y+g1W99JLjguTrcNVJRyuTmSDBH3QmMUcI6?=
 =?us-ascii?Q?3KCVQxJD/dIXGzbP4sY+UYs66PcaiHkGvOkcMub8/lGQxEidQaadbTLm2Gg8?=
 =?us-ascii?Q?AktDum2TN7JdvQBTuDpt4u5wi3k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ac12e73-b170-45f0-456c-08d9f8094104
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:48:08.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jFOXu4P8I0JXyuMJ2Wxq1pnn/qGM/E/glH0O/0ZZm3ZBp39kWackHYhTA/RS1bedj5DfqI5TeKAukYTu+M+qh1afJ3FJ/ixvvztZ1YvpBpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5662
X-Proofpoint-ORIG-GUID: FCbo2UTqy4fhCWjCaMwq-Dr9H_YK1Lhy
X-Proofpoint-GUID: FCbo2UTqy4fhCWjCaMwq-Dr9H_YK1Lhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_01,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=736 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202250012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 02:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162333

Use the correct $CPP to test if match.S is buildable,
and do not build it if QA checks require PIC code.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0001-configure-use-correct-CPP.patch      | 47 +++++++++++++++++++
 ...002-configure-support-PIC-code-build.patch | 34 ++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  3 ++
 3 files changed, 84 insertions(+)
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
index 18b5d8648e..42a17f9450 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
            file://zipnote-crashes-with-segfault.patch \
+           file://0001-configure-use-correct-CPP.patch \
+           ${@bb.utils.contains('ERROR_QA', 'textrel', \
+               'file://0002-configure-support-PIC-code-build.patch', '', d)} \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.24.1


