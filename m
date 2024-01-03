Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E118C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 04:42:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10329.1704256946750454038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 20:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KuN6B4nr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4034altP013607
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 20:42:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ZnpQ3jvgzggJrtaL4W
	Fup9as0iTozSdOf+mUWIOpf7Q=; b=KuN6B4nr2JLDTpBHVIHrMJf9vzhNgJPpxu
	L6qOki8hW+XCOKftyMFffjYKC7SbTcQzY48kyyM6AeV8G60OFHlbFYKHSqi89QCq
	A3H0DrWvDJWVm2hCNT7A3p9gYPf8ku0gAqmT/aP7Xu2elxTMmApDwGS14VuFQtlA
	FH9QEzYjENuxuB4/bJaudtKlfBBq8J2zgkfkxW0+na2btv+9gvzQVuX2qNUB3KXP
	j7nqw88BXjm9G72PIiEj80fpVvWqSPKrQuhESmgNtH5R++bGWsjmTJtYmc6Ecodf
	gBJsn04mJzac/0YdgTalkIGcLJiAkrkigshThLDmgSMQF6SGzyTA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkkub69-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 20:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhT7qGFA+Aqx5idVZ8fh5ogu6/NXV7V5jDINV/Rc8gYPYnRX2qWbP+c+h2j/Gg/2d+XK35wdzQkfdJUpqzqsiAMf/6DjXDqXOG1RDC5UK+VsIAuJ71n6nFqs6jArMCYlNEtMTkT+Tr8b0HC7zv5mUups5y4DlRBjsUHVPue4C0d1ajCpXEFJ5hzqNxI2zGs8gpzXYJb0CtdcDarBAW5JASNUkjZc8FfiI+RvXUBJDihDdOnjKqd2ZVYHTDuEbOHwSoKpGT7N0iMmF+raszaywAIrsUYwUY6S8EN8t/30aVoydOQibjtWjwSprQYhmF8IzD3sNu1V2pPkH4Xdoy+H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnpQ3jvgzggJrtaL4WFup9as0iTozSdOf+mUWIOpf7Q=;
 b=bLDb8urQW/kc/f4nTPUspWUaa8AYSIXOe/MByzO1jdjry4WYXkC1HVI9lT7V82Z0eI+vvpBOcs18K+IgTsWR012BLtePlbAGrNgJz46xqg/68h9jnN21V3O1jA9UN54jvI0pEf2DezERZo1jHNuj054XISZCdyuDLqc4wmzaxyAvAaqJmtF8ISC/EhldHtt7oVymzxESblbpmwAhcCdMqAkbeHxWzqGQ7zR6oQY0PMls75EXYAX1zsbd4bNFGXrWK8ZDGB3Dwkst2rojS4Ajepp4cMbNsYhKkH08xbwuzNQZjy0clZE+c/Zr+G26hqyvYcKlDlW1epJ7On2Fe88uFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 04:42:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 04:42:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] util-linux/util-linux-libuuid: ugprade from 2.39.2 to 2.39.3
Date: Wed,  3 Jan 2024 12:42:06 +0800
Message-Id: <20240103044208.2304438-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 190bb246-6592-4230-a2c5-08dc0c16603a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6LEkKlJt4ApZrOEeOasgU/ePHcZjkJ28nkrXDM1rVbi8il6D4qxgGkgzQLAU3yOzL8JZJlsQgyPDFmCotKahhLwRqepZo/rZpFYvB2TsD1LnGc1iZ8Bw1AZ6MRfdupwMAZQGMIgu9b73Fgi0DiweeHdLfmNISLd2LHSwzcoMthJMIk5ijBEZzRC7oWVZfUxIcE0bJtZR+YM7sRIyYUn7MSeqcce0vG2ZB2CbVhmnl25oiTmVL7YDTq/lJtjcDdk3pK7Fn6AN6zHT6dnPlMYFVi6jhYigH+gVvXiyyLD1rCGD6Q/+PrHK6y0TXGgeZwgcNS2R3bBNqA2poZKOxWrfBXkhDqaTdliOXmQfn+EvUR/W764TPybuoDw6ynymf2wQ5R+EORO5yAHtjmR6+Q8rdT7O2ETTNp6CqdV+OiBQu7/18E+6DCPBrdKfv8iBKx3XhJGpQM3K0w9ilDKtPNS4Vp5nw0o3jTrAA3CkoBmbG7FRs6B1ba42QKnhGCEdDSvOR943HJincORxfVwIjqrLCu2tdDmR3E2D8dVJMNIK100TU6PMeCBiiDMIiztYsM9rlN9bi+abvkEmuU8JV0mQYd8pAJHNVt4kOh883efD4A0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(8676002)(8936002)(83380400001)(38100700002)(26005)(30864003)(5660300002)(1076003)(38350700005)(2616005)(19627235002)(478600001)(52116002)(6666004)(6506007)(84970400001)(6486002)(9686003)(6512007)(41300700001)(36756003)(66946007)(66476007)(6916009)(86362001)(66556008)(53546011)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BGrgeFFgZ+uWz4IwSAmO1exjIgKo9rMeSC9ycYOI/ape3GSuukdhMYpopf8U?=
 =?us-ascii?Q?AXoFAIvXr+v7VbeeuMcspihdHvfumB3c2LSb9o4moJN69YmSM1nvfXoShQld?=
 =?us-ascii?Q?iyfoaNyIkEgeXIz6PUjRmm0pfE7mjNqsE+zflP6U6qqiczE2OHkFU7ZqnCIz?=
 =?us-ascii?Q?M/AY/D1+dOhAhKzSDnC0CxuBaIYtIOMuOtIU+e5EkdXgzBrbxZU7q8TbEu5w?=
 =?us-ascii?Q?7aZth1r57ph5LMinOLK7M9HEjQPI5sRZGrbeMntlKOeGqSBVoqLD4ClzpEBQ?=
 =?us-ascii?Q?731Ip+cTVmp0fd3ojciYACmJrVdaEpaRvQwoj9oXZ8j8AMzw2UhNfKlzRphm?=
 =?us-ascii?Q?qAALSWfh6swppJuU4jdrLeTrsNMGouBVWsAHTGIgKP4TvV4cA6lMA4nWoeuF?=
 =?us-ascii?Q?+kJrnKdCG40T8YaK3L/8l21k9a2UmI3hMCJqN6afK293muGdyFY9Twd6FFYq?=
 =?us-ascii?Q?2jGoxs05kWaLMaleB2j3YvPhJjxOMpI9g1Lrl6u5LRewwukDFIQO2dH2GVcP?=
 =?us-ascii?Q?nO0tXVGvDuZrdgCFeyjYk9EFHNRmJK4QfiZB+FncAgTC1QUr2jtnkDsdbyW8?=
 =?us-ascii?Q?OyVhXIrcTv3ipL4IDsehIQd2t1fcRwne5owqj5gDltpY2rjZI40X3XhTDeX+?=
 =?us-ascii?Q?knQ1+eDzHPfFghYzVhHz0WICzj0BZApiYP9fWcepNHMjHF302j3MfTGB/ml0?=
 =?us-ascii?Q?F+eGMKlgSLs6Us/VgkVgcYrVjCapyeJwTUfIPW8tTDoijgyTCyippudSIxR+?=
 =?us-ascii?Q?yNm9wZhhoitUqreUi4BX2OOhE3Myob3DbEURiudCMzmHplStT7s0eK1TTKY3?=
 =?us-ascii?Q?F6ZoXhz/+g48gm86oWuz3CzvaWxWF+x5sl9PsjH9ZOFtqcs93xEyD260MHMe?=
 =?us-ascii?Q?2VRW53IEtr/izzvq86v5sZMuwVvSGKIoN2h1G/z0wHnKixHGyfKlRCF6Kn23?=
 =?us-ascii?Q?9+Ei9wzMmt0RAx6J61r5S7HXIL46xm+W0E/pjLmwZ0kl3hjvYhfsj3dp8rab?=
 =?us-ascii?Q?84KcttrSwLhOOR2OxWwreNzNJYo08yfzJNEXh4UAIcagmfGQ8rHtZ5/907H2?=
 =?us-ascii?Q?8mJv8zBeCi5e/68rzGHWsWba4ZQGugvPbWepb/i1kvVL/Q+b/qJbb8XzXP9p?=
 =?us-ascii?Q?/6JkCvya53ksMz2DMO4o+b5G+RdwyHfZQYNQsW1CIOu2AAfIu00FQWuJ1E96?=
 =?us-ascii?Q?y8nCaj26qUf2m+kla6qrajhCc6aJNo3aXYPYTca6jDQ3DZn4DXH9wn+TiPS/?=
 =?us-ascii?Q?1RMRAJ1Jgtl4BQtqjXT87xpOc/sIjLarm7RsHJWiidQwefl8G5vFAKW6q3QS?=
 =?us-ascii?Q?y/Mf9J9dPAArti8MnMbJI3qBetYltgKlW1WRwbzzYioewHvCPPGbfnWBO0Xq?=
 =?us-ascii?Q?bzH17Ks/qv9jYVJxqjq7i8ITsaGySrPGXu2ZyBNMnNq/3TVWlAK9I7vPS/uo?=
 =?us-ascii?Q?TBS84HxCJGKU7JZMIaZYJfCOdj1gmSR/Ao3x822/MgNsCo8+ITqieGDRXb01?=
 =?us-ascii?Q?VE7NIN28l45YkWCochtlaeHgamLnqusoGAHQ0zrKF1hoKwBQB+uwgcz4ZnxZ?=
 =?us-ascii?Q?AmFjQHIb9u25S+E36ZKChMAYEGrrybE1yspGZf5g?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190bb246-6592-4230-a2c5-08dc0c16603a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 04:42:22.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afSaCcf440u3FcbiDMBce2uPVRQqd12ffJDiwxPGdWHao2zUTud8pSrH5wHqPLhG2hOaNbMYw/Z7RDUkqHemlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-Proofpoint-GUID: gib5EnvheFrmZRWll2OzwlT_Irf8z2cY
X-Proofpoint-ORIG-GUID: gib5EnvheFrmZRWll2OzwlT_Irf8z2cY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 04:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193270

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
GPL-1.0-or-later is added. fdisk.c is licensed under it.

0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch is dropped as
it's been in the new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.39.2.bb => util-linux-libuuid_2.39.3.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++--
 ...ls-include-libgen.h-for-basename-API.patch |  9 +++--
 ...Use-4K-buffer-size-instead-of-BUFSIZ.patch | 38 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  4 +-
 .../util-linux/configure-sbindir.patch        | 19 +++++++---
 .../display_testname_for_subtest.patch        | 12 +++---
 .../util-linux/util-linux/ptest.patch         |  4 +-
 ...l-linux_2.39.2.bb => util-linux_2.39.3.bb} |  0
 9 files changed, 34 insertions(+), 60 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.2.bb => util-linux-libuuid_2.39.3.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.2.bb => util-linux_2.39.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e3bef5acfc..4e9d22f269 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,13 +6,14 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
+LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=6b0e0a2320e66e62eef9b8149a6faec4 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -35,8 +36,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch \
            file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            "
 
-SRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"
+SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
index 2b9897ade1..6258710e1e 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 6581cf8ac95b99b5a35fea88c52646558d05b5e7 Mon Sep 17 00:00:00 2001
+From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Dec 2023 19:59:46 -0800
 Subject: [PATCH] login-utils: include libgen.h for basename API
@@ -17,10 +17,13 @@ Fixes
 
 Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- login-utils/su-common.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ login-utils/su-common.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
 
+diff --git a/login-utils/su-common.c b/login-utils/su-common.c
+index b674920..3297c78 100644
 --- a/login-utils/su-common.c
 +++ b/login-utils/su-common.c
 @@ -26,6 +26,7 @@
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch b/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
deleted file mode 100644
index 4d7487c4f7..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lscpu-Use-4K-buffer-size-instead-of-BUFSIZ.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 95b0405338440cf5cd6d4b2b5c66cda8bf381b28 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2023 00:18:18 -0700
-Subject: [PATCH] lscpu: Use 4K buffer size instead of BUFSIZ
-
-Some lines in /proc/cpuinfo can be large e.g. flags and can then
-truncate them in displaying them
-
-BUFSIZ can vary quite a bit  e.g. glibc/linux systems its 8192
-but on musl/linux and OSX its 1024, on mingW it is 256, some tests e.g.
-x86_64-64cpu-linux6.2.tar.gz has added really long line for cpu flags
-line which is greater than 1024 characters and hence this test fails
-on musl because lscpu -s reports truncated string
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2492]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sys-utils/lscpu-cputype.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/sys-utils/lscpu-cputype.c b/sys-utils/lscpu-cputype.c
-index 3fd5f7a3c..c8f72ab8a 100644
---- a/sys-utils/lscpu-cputype.c
-+++ b/sys-utils/lscpu-cputype.c
-@@ -462,7 +462,9 @@ static int cpuinfo_parse_cache(struct lscpu_cxt *cxt, int keynum, char *data)
- int lscpu_read_cpuinfo(struct lscpu_cxt *cxt)
- {
- 	FILE *fp;
--	char buf[BUFSIZ];
-+	/* Used to be BUFSIZ which is small on some platforms e.g, musl,
-+	 * therefore hardcode to 4K */
-+	char buf[4096];
- 	size_t i;
- 	struct lscpu_cputype *ct;
- 	struct cpuinfo_parser _pr = { .cxt = cxt }, *pr = &_pr;
--- 
-2.42.0
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index f1cbdb3beb..85ad7a5575 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5664f9f..075ef27 100644
+index 890212f..870e817 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index e475289f65..75adeca188 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,3 +1,8 @@
+From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
+From: Phil Blundell <pb@pbcl.net>
+Date: Mon, 24 Sep 2012 07:24:51 +0100
+Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
+
 util-linux: take ${sbindir} from the environment if it is set there
 fix the test, the [ ] syntax was getting eaten by autoconf
 
@@ -5,11 +10,15 @@ Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
 
-Index: util-linux-2.31/configure.ac
-===================================================================
---- util-linux-2.31.orig/configure.ac
-+++ util-linux-2.31/configure.ac
-@@ -89,7 +89,10 @@ AC_SUBST([runstatedir])
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 36c24b4..890212f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 417ca1d98f..815ae9c915 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,7 @@
-Display testname for subtest
+From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Thu, 3 Dec 2015 04:08:00 +0100
+Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
@@ -8,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5246605..b24dc15 100644
+index 5a562a3..098145e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -320,7 +320,7 @@ function ts_init_subtest {
+@@ -437,7 +437,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
@@ -20,6 +23,3 @@ index 5246605..b24dc15 100644
  	fi
  }
  
--- 
-2.8.3
-
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ba2bd3f6ac..6221de7182 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 886598d..1cf4346 100644
+index effbb02..7d2bd1e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -57,6 +57,7 @@ systemdsystemunit_DATA =
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.2.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.39.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.3.bb
-- 
2.34.1


