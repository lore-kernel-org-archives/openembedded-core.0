Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18996.1621830940814223046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 21:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FbXVX8hO;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077818ef51=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O4YBOs004023
	for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 21:35:40 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qt9c08mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 21:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC3P4VQittoGopENMy136XG3YP6OffuMNuksHb8HXlIpej4mIQVFp0xubw/0hFKjxJz/l1xk7s9pjE+MkWpH7J1d9Z86mlKeBzU/fw76sINRMwJkK8bh8D6oj/vdGIouc//QTlKNgO3IM3WJfAAM/nz0p2RzLpkwXLBQV3gifIW370gbwjs7LtveKMIeFsVRvAZHlzSLD0FT7GlsKktgfgX9facjeKvZw2Ns71obLk9HaOgJNKz4J9/3lGXP0tks/t38jXXmolgsk433EiSpmofycLr6N+zl6wFEdbK0DDGfqcv1i0vwK+yqthKs4YVbtMq2ppt7tuM5Ev/VW6uKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E6snRV2gwg2aU7mcu3y0Uf8T+rgIpWfl/WC6YXe+ug=;
 b=StiItoigDW2HH0rzdW9juotC08gQqtmoXvYI8TVD251g5iE45QDv0jLlzB6BivOIFY80RX5Hc6K65k3Nje1BOBUkX2YKhULEMpZsW8LFK6XUkUyQva1Ez01KcwgLJuVDJx4tuVqyHCnV6Zxz+zYS2XJMQEMxRUWMbhiebhMvWrQCt4NOrGf1XG3xKn+1m/opF4c91/L1rbQBvauPfWvbjtBJFieuYYl0ysJwzZBq83NMGE670oNICCaC6ZH0l0bmX+7xS3h9y/rhPWvKGALZTyLgRDe8R3tE4UDM3CmaviaCsZka0oobGKvbBZ2HyVeGjzngAv1bmAuOp70hiuxsgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E6snRV2gwg2aU7mcu3y0Uf8T+rgIpWfl/WC6YXe+ug=;
 b=FbXVX8hOX6CItTuTbOcuXZ1oni6cvCc1HD+o9CQcz8DvAs6VfLaQUkoNJarVZNs8yVUXEE2kqIfvdMBgWvFWwu8XiaeNn9lmNoCdWapfePci9uSr2CRw9esVFaZhJxe6WAOAT3TArQ8JOsht0Oc+inGJYcaSW/34AsUjQ9Y4+rc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3351.namprd11.prod.outlook.com (2603:10b6:a03:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 04:35:38 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 04:35:38 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] xxhash: backport patch to fix special char problem
Date: Mon, 24 May 2021 12:35:19 +0800
Message-Id: <20210524043519.20311-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:202:16::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend Transport; Mon, 24 May 2021 04:35:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76d5bbfc-f786-4586-8d83-08d91e6d616c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3351:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33519A1B82557D37C8B561D6ED269@BYAPR11MB3351.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5kU/QcuLVVtdKugxVGBd9gPSwt+zcU3/XBDUOfo8mbCV7T4/9HxOjhyq82QR2Kd4y1+CZtGaKGCVLjsl037mlHtCSEw9o1VFQPufMDk6nQ7Ii3W5dJbahA8Sm6gfKPLTCtIqS1e+EKNbPzyv8JfeY2cSwxw1hmRbdxanpmvVUGI3g4yZyaZCECS8Yww/8yFruTjt4cQdSCvpLWGDQTc63lf4ssFD7KbjnPTZIHjsf2qThY86Ry4sX0eS0OO5aP6P3AE+4qT57Y0o9Av65SMfpyZH+iOoSsnHqtUFrlSLbw0BSRZOhQaNriNuPI+yfOZEe83D6B//aamqDzmjIOQ5DA8l0wYlMMLzJsLbNHYKsIlQkRlfCaxn0UEYn9POgUXQ97onUBrOGgoXZZEEnilPlPzJkXd6q573Xj3yg5Erj/uvcENtsADMJae+xBvJHWyg8fK9qTwDtoeTmkqzLxM9LOFmA9IF7xd+j/WW7RgIe0MIQBVUfcrn55ClIZGWQzESn5hDwlUpskTyliBQL98pqS54jiEM4rPFCG6K/z70E1Ti/Zm2o8vEUYl73MuCOj7Kcl68ov4PMwAyYlN9l0p8/Umumb16g6Vs3mPNH0q7OpnKkD759udRKPJspbTw+75AxSfreDJ/hPZ0hTzcb0pQ50uWYLybeFQ5wTvMgy6ZyttZDhiI0iQ4ojW3PDopxSPZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(396003)(366004)(346002)(8676002)(956004)(2616005)(86362001)(8936002)(5660300002)(52116002)(16526019)(316002)(66556008)(66476007)(6506007)(6512007)(6666004)(2906002)(36756003)(66946007)(6916009)(26005)(83380400001)(1076003)(478600001)(186003)(38350700002)(38100700002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?924LSUsIb0CaTv/wJ2hqz3gsCKv5pslQhiU3Nn7d99902x7zzvUOOOKhKnsW?=
 =?us-ascii?Q?2c1imADDmJw0L42FnbvIefNYLJF8Ebwo2jAegpuU5hu81nhJPo+XxUiWu0gN?=
 =?us-ascii?Q?iz/WBvzaLJ512LeB1aMzMziXaADkTLXh1JMI/vIimSlbFBCFBoHBoPUDegxg?=
 =?us-ascii?Q?QxF0YwPhIJwM9xzUHDp94LGBL8ymFjFr/uTOCABckVW4AwC9NUUZ5dUOs/Hy?=
 =?us-ascii?Q?+PGTThBiTiOG3IQtm59wl6aaQxAGidd0pxNI1Z93SCb/8z//MV5X48/dewvk?=
 =?us-ascii?Q?XAyO2czTSa8qoe04VI8d4WPt0Ku+96W+BJEFwHuyJRuFRDmBNWYKpNPaK1hC?=
 =?us-ascii?Q?uFGyt8AKdK27Qw4DPozDDN3ocYasDEJnypJDv1iCNk2rziT1Zba9aUrqYsNi?=
 =?us-ascii?Q?JNPMgIGhFc1x/IW/iDp9a/5ds1Vx/xETB2lnRJfdaTYqqrg0kGCzLJdvmqfe?=
 =?us-ascii?Q?I4ylFssZ8S+wkNdodOGyKotIVak19Q0pxJbSXaMCy5AseUv1Lz7FxrYA0eOl?=
 =?us-ascii?Q?RL1C0OP3P6sMytOqE1aXr5N1zXi5XfKaLhF1VvEch0BkVNM6oWHxLQLbc+65?=
 =?us-ascii?Q?zAVRyOQTxV90bHvHY/BL4efgawovl3UanOeVxdKWdtJcIa2ssy6piXQaBBIF?=
 =?us-ascii?Q?an3Y2T2DY3wva4qhk4PF4ps5obr4N8DLQmqEx/IdcsfhlWpYQPGIUvcuO0MP?=
 =?us-ascii?Q?yulBkYnC2d/iAoNJelfKTGHHpRDONnEcLhhg/+3yIllAg9PlKFGzEUA1g9Tb?=
 =?us-ascii?Q?rVXmcSZ3e86bhJzUdum/Mb0tnrJvrJ1egF1L8KMA8mGRq/PfjE7zxvUnDWa6?=
 =?us-ascii?Q?oDy4L537Cty0iZnpvJb9PK8PfiaEvD24PwwO8i0IGJRaeJK6RJJe5jMHL0Jc?=
 =?us-ascii?Q?2m4Yv5o1Jgbq76PIBkCoSPBwxDci7j9w4tfkUb4w7fabHAGjfIpG4Ak/uueT?=
 =?us-ascii?Q?UuavikIPRok/Vu8mTBWCYioY/yDXKNI4nd2mz8OaHy4iKqZgpaYJveGYfvjk?=
 =?us-ascii?Q?VZMA2rP9h9VsXrkiA9aYjV2jkdWYLMCIkqgcuqZ2k40BmZV/f6gHWqxejAn2?=
 =?us-ascii?Q?mjaY957C7dIewfw9oB5rlHSK6GYX3OAUhD+gUiOXjvKrsAXeBbIekf7PnjnW?=
 =?us-ascii?Q?Nei1RfadJJet06DfZxyIMu5EaL2imiGbrX/AJYlPGJUgsM7fdFWM5KLv/41u?=
 =?us-ascii?Q?vU3Q+HiUbUCSUzo/bOxJUT5a4Pklh93vS3WbRqdtes+Pj8GfzOIiAadQY3bD?=
 =?us-ascii?Q?nOuPVwrw+og8VmybYZoU2bJ1F5TFf6ay3Uuh7Bi+ZgCF1oBoByCIMnBJLxVw?=
 =?us-ascii?Q?EDdISW0Vr/kFmxGZ5s65GmqM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d5bbfc-f786-4586-8d83-08d91e6d616c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 04:35:38.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7hwEL7fXiB1xXXDmyUlS43+FEaf7EChn2LhNMOLp0xG/pEe4feMmtLC7hW2/+CNmQ68LH8WYQpd8IivKMAkQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3351
X-Proofpoint-GUID: TO48R5knPNJj_02q_dmBkeBGRmTVoSW-
X-Proofpoint-ORIG-GUID: TO48R5knPNJj_02q_dmBkeBGRmTVoSW-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_02:2021-05-20,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240032
Content-Type: text/plain

When building nativesdk-xxhash, we get error like below.

   Makefile:422: *** configured libdir (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib) is outside of
   exec_prefix (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr), can't generate pkg-config file.  Stop.

This is because we have '+' in the path.

Backport a patch to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...pe-special-regex-characters-in-paths.patch | 55 +++++++++++++++++++
 meta/recipes-support/xxhash/xxhash_0.8.0.bb   |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch

diff --git a/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch b/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch
new file mode 100644
index 0000000000..6d3da147f2
--- /dev/null
+++ b/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch
@@ -0,0 +1,55 @@
+From 9ab56f841b1986cd5cdff66cb5ef222794b9ed39 Mon Sep 17 00:00:00 2001
+From: Dmitry Kalinkin <dmitry.kalinkin@gmail.com>
+Date: Mon, 22 Feb 2021 14:07:58 -0500
+Subject: [PATCH] Makefile: escape special regex characters in paths
+
+Fixes a problem with certain valid install paths:
+
+make prefix=/tmp/a+b/
+Makefile:434: *** configured libdir (/tmp/a+b//lib) is outside of exec_prefix (/tmp/a+b/), can't generate pkg-config file.  Stop.
+
+Upstream-Status: Backport [f79cd22a806993b4a62d8a4f1ba529a29a9d9ff5]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ef24e94..baa1533 100644
+--- a/Makefile
++++ b/Makefile
+@@ -411,14 +411,18 @@ INSTALL_PROGRAM ?= $(INSTALL)
+ INSTALL_DATA    ?= $(INSTALL) -m 644
+ 
+ 
+-PCLIBDIR ?= $(shell echo "$(LIBDIR)"     | $(SED) -n $(SED_ERE_OPT) -e "s@^$(EXEC_PREFIX)(/|$$)@@p")
+-PCINCDIR ?= $(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "s@^$(PREFIX)(/|$$)@@p")
++# Escape special symbols by putting each character into its separate class
++EXEC_PREFIX_REGEX ?= $(shell echo "$(EXEC_PREFIX)" | $(SED) $(SED_ERE_OPT) -e "s/([^^])/[\1]/g" -e "s/\\^/\\\\^/g")
++PREFIX_REGEX ?= $(shell echo "$(PREFIX)" | $(SED) $(SED_ERE_OPT) -e "s/([^^])/[\1]/g" -e "s/\\^/\\\\^/g")
++
++PCLIBDIR ?= $(shell echo "$(LIBDIR)"     | $(SED) -n $(SED_ERE_OPT) -e "s@^$(EXEC_PREFIX_REGEX)(/|$$)@@p")
++PCINCDIR ?= $(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "s@^$(PREFIX_REGEX)(/|$$)@@p")
+ PCEXECDIR?= $(if $(filter $(PREFIX),$(EXEC_PREFIX)),$$\{prefix\},$(EXEC_PREFIX))
+ 
+ ifeq (,$(PCLIBDIR))
+ # Additional prefix check is required, since the empty string is technically a
+ # valid PCLIBDIR
+-ifeq (,$(shell echo "$(LIBDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(EXEC_PREFIX)(/|$$)@ p"))
++ifeq (,$(shell echo "$(LIBDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(EXEC_PREFIX_REGEX)(/|$$)@ p"))
+ $(error configured libdir ($(LIBDIR)) is outside of exec_prefix ($(EXEC_PREFIX)), can't generate pkg-config file)
+ endif
+ endif
+@@ -426,7 +430,7 @@ endif
+ ifeq (,$(PCINCDIR))
+ # Additional prefix check is required, since the empty string is technically a
+ # valid PCINCDIR
+-ifeq (,$(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(PREFIX)(/|$$)@ p"))
++ifeq (,$(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(PREFIX_REGEX)(/|$$)@ p"))
+ $(error configured includedir ($(INCLUDEDIR)) is outside of prefix ($(PREFIX)), can't generate pkg-config file)
+ endif
+ endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.0.bb b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
index 9e38872361..4e48365a71 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.0.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
 
-SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git"
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git \
+           file://0001-Makefile-escape-special-regex-characters-in-paths.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
-- 
2.17.1

