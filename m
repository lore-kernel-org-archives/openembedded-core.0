Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371B0C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 04:33:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21413.1699590789904973516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 20:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=967886f530=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AA4L3i5026304
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Nov 2023 20:33:09 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t2p5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 20:33:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1/YvPazvjsrAmE6Ni60HkvtWp9B7QI7sGExwkXtqgbCR8yhMOAYVV7vxJcSD2oX9O8UQCh+zatM4Z3lHrmLdAtfgd+QsUqClelW5L+qVGUo8GsRxUBag2LJUaZmpyAvE3l2o6glVSAi2koqiMgALv2CrKlaKb7VMf1YIU84N1YRJyiLxKtPxAVNOSKp62MnN7kcEW4VxzQ/w5JwonHRcGmrQEUBdsyKoakfmWo694mIimnCYBikAUwjY5h4bx1tb3xanwqW9kw4uwQ9/PRoCi8P/LHgtwnL1fbfeeYSW/i0lbOYeWkYR2xPu0tF6B+eC5lNK+c76dWvYNcn7aqMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBu518ENpX6Tz5TLvTCItk6HPx5anTnVf1I5EBlce50=;
 b=WF/A0bnGX/NPXpmVMIMCGWGXzTkdoAMELInXoBiMrI6xWdacgCY+nUoyaDHpztmJm6FReftOKxB4WeV1/R8FR51qLLbQlVj8/5yQH3AizvRfKhc/tXiYr/Gr/+iJV9oiZOZJsNuoAYRQnL8Lnx2LrAnj7i3rmhMA/O4HjANva5w0HgWcCL/026/7iS7gXhI+/fzVSGWUJ0ZkCrTMzEY4EstUsVoTD+8ci+3Cg+fbVI1+tJrljqV3IKdsGmhF08x+BXBxajgqPamgmoIl4HUVn15pjgAcHt3UEqt9TBfNEqzQP4Bb4/Ui7C4wBS++7sHkdTssQ3d4w8M0+wJjrBEqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Fri, 10 Nov 2023 04:33:06 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6954.028; Fri, 10 Nov 2023
 04:33:06 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] sudo: upgrade 1.9.13p3 -> 1.9.15p2
Date: Fri, 10 Nov 2023 13:07:21 +0800
Message-Id: <20231110050721.3815203-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f61e079-ea58-4dc2-a6cb-08dbe1a6229c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UjpYhp2TwNKcKju2J1nLyCmkHKVh0nLRFBMreNIZeA6VGZVzS7EWDo4KcnvoSn+LaF6g5GpIbDwTBAnUZIgZUuDPS78u6KYanTWmj1rDlaAun4mRK7blRjTHVc0L92vt6TddJgFU1IkAyFgZVdI/7pVbKgLN6ydSjTha58Agogc373Asf+0mqNuvobsiQAudMqfHFDauTXDGekxd8x1mc+/fB06oQ0pRS4GJ2WAJWut99wjXhD0RwvoptSaFe2sAniuloQeMyYW2BT3UVhrzpq91kq4FjMHN3yOpunydQZ2VraVgura78VUw1M32s/hXkovV2cIlZrQnZsoH2JfgeJ2BIUvJreTvm6GL/7zTeY7KRN5cmXbcpPKkAj8mIbEFGrlhAjO7AKK0gGGvfDj6V2oYfV5c2wbkdOKXZeK2y9W0EHHC3Ip9L/IE/tyXG1KQA/LbRbz9hnxc+H7Dccj7OzCCXnIWgm0nQqnVcNQzVnCnMaa75mnsbw4RSJV+h7d8ZtHvYYWQvtrXntYABzHcRx79crv17IbxEAGqS6vn5S2CJ9Vsu0X+qKbe9SCotFujEyHKt1JUuJ8VVRqhwsvlgzqCYCRWoclRjaKEMNAg5Tg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(316002)(6486002)(8676002)(478600001)(966005)(8936002)(6666004)(41300700001)(1076003)(6506007)(83380400001)(6916009)(66556008)(66946007)(66476007)(44832011)(2906002)(2616005)(26005)(83170400001)(38100700002)(52116002)(38350700005)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RIJtn5fiB+kZlH9hzCn2zaXl/b3Vb2NxVcf9lNTYxzTITtQ+BkeEdHZMYaoD?=
 =?us-ascii?Q?g1HtdLBMoUsGKtXN9UTbAMi5UX3UGfH9yp4a+ggnLOnET8W6laa66gG3CDm5?=
 =?us-ascii?Q?CnGuIbRMpGoSC9LqDa1be6b0fNj+rzXbaQ9bokxsVZjyVojduKIemewyA8z3?=
 =?us-ascii?Q?c95FgWm/hSI7q8mJ2nqZcT1VJCzK6TF82c6fjaL3QWZFE9SaW/6/2e4xBMxG?=
 =?us-ascii?Q?TvyxfahohK4P0n8iRb+YOt6OcyR9xbjnSlIKnR5L8XfBxXh7re//6mSSmrsO?=
 =?us-ascii?Q?4N0qTS45X8s/Ozq45tKvkeynIprrwt1DX9uJ97KYl77IpvavlkLslkLSa6PU?=
 =?us-ascii?Q?0O5t8nCIlPVCVGqaitVp7Em2kL0jPaCQZwQzpmqaI295DLO1ijfk3xCkUHmY?=
 =?us-ascii?Q?BvqHt+CSJIVgUlR42nzesL+wBuSrmW65zAAwt4XxOkdW7H1IuY4ul0eIY878?=
 =?us-ascii?Q?6TzBgqUaqrUTr+fW/K/JA6FZVdONSKsa714i4Wdl39Nk3z6Is5BDg5h4zEzk?=
 =?us-ascii?Q?r28lP5AVRxDbOD1yTTpTf2BXvLIcvjGZPW5vbofMFn8kHrlL3JiNY1RsHZE+?=
 =?us-ascii?Q?IXlrXyAbqaUoNsLuvlAg4r/ZX96UVoW0Uc6nukJx1uLIKiD8sQunc8WdHxxP?=
 =?us-ascii?Q?3Zwx7sLixtpNn4PKW6o5DWLvdx5LTKXfXVLhjWiqq6apNasmea29MKXAqqld?=
 =?us-ascii?Q?G9PkmkAHq2nWYiMIoNO7Ae/nMnvU+/L+86yGV69+oGENXoLFiQIb+XXminLQ?=
 =?us-ascii?Q?dPg7icpTkIsOM2hqiG37o3USJ+GSrqfjLgZSJOfzTq0V63tm6DVRwP+4rXH+?=
 =?us-ascii?Q?FDya3/KQaNL+Wcsrhp4Pdm2oFZl+Yrb/61Xp8tsqXbjNdbeQUAouaBR5ZPmc?=
 =?us-ascii?Q?mVUeRlfBINH6nyeXZSWiU5vn7V4yILPYqp0exOCu1mxeDoA7689jyelDtFcc?=
 =?us-ascii?Q?IMdws8mp0R+cZ9nGtk37wge6YM1wpqDw4USaIQjGxOE7K5wEkYHFruBCV0Nh?=
 =?us-ascii?Q?9jdEygb19IGUlC0ZVJyHJFDq5a5Nbx/wTTsWXdUj6RKu9eq0/Qu6oPDoZuSy?=
 =?us-ascii?Q?xjExPkWJIyXBbOSka8JGBugezB8cwVz6FO6S7CIdmdfIeg/whve+DRUg8oW0?=
 =?us-ascii?Q?JvIMTOwFL6k19/dLXUJkMEmaESwdSvYxZaG0KiGs4uDqi0FgR0uvDzeA2KvF?=
 =?us-ascii?Q?DwCkqfy3Zuumr3aS7xTGo5useghvXkxL4gF1IS7yUpe+2CzYDbYyxzFXRrtN?=
 =?us-ascii?Q?3IH/3PmeeAOFER20C474HuEkUplnv9Nfe2EHyPfiEikio4Vl6OaowHam9DN5?=
 =?us-ascii?Q?dbs4VJtguQevhYbh0Pz3/nZJBsjISx5Qc+gYsWrpyNmR8PIdDTZp6Mbh5pIF?=
 =?us-ascii?Q?UOBqeJMeoYJ7wCthOB0gDvwqEGjDBgzV3bbMY/Q4YIiSRHOTdZlYpeNYqsIo?=
 =?us-ascii?Q?GWuALUCHBOEwD6Ok8F0Sn/oM+N3sqXKXxJLx9WzpeHFZvX5Bfzm3oOVfMjDS?=
 =?us-ascii?Q?zXC/RT/aiYQrVCDcZaSyUoo2TPWUPCZYoy/sYocuQYKMVIjxlcMmQO8/qG6x?=
 =?us-ascii?Q?EYJjYQgbKvUkHAxMCCygbjVkqTIA8s5THoHwvWbWHjWAoe+KkIDb+8JVqShD?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f61e079-ea58-4dc2-a6cb-08dbe1a6229c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 04:33:06.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mwpwu+0tleU59FrrKrcGo5GgbNQiAgLVLaC8HvPamEJ17WKxlYUowohFJNWlFl9ek8CfRlEs0hMCIo5lyqPGK3eK60PzwTFdCHcdwzuDeCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
X-Proofpoint-GUID: Ki7dDq3FZ1yhZyfJ3ZGJUHBJrgogFo0Q
X-Proofpoint-ORIG-GUID: Ki7dDq3FZ1yhZyfJ3ZGJUHBJrgogFo0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 04:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190397

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Upgrade 1.9.13p3 to 1.9.15p2 to fix bugs and CVEs

License-update: file removed upstream
Drop patch as issue fixed upstream.

Changelogs:
1.9.15p2: https://www.sudo.ws/releases/stable/#1.9.15p2
1.9.15p1: https://www.sudo.ws/releases/stable/#1.9.15p1
1.9.15:   https://www.sudo.ws/releases/stable/#1.9.15
1.9.14p3: https://www.sudo.ws/releases/stable/#1.9.14p3
1.9.14p2: https://www.sudo.ws/releases/stable/#1.9.14p2
1.9.14p1: https://www.sudo.ws/releases/stable/#1.9.14p1
1.9.14:   https://www.sudo.ws/releases/stable/#1.9.14

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...me.c-correctly-include-header-for-ou.patch | 25 -------------------
 meta/recipes-extended/sudo/sudo.inc           |  5 ++--
 .../{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb}    |  3 +--
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb} (92%)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
deleted file mode 100644
index f63ed553be..0000000000
--- a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f993c5c88faacc43971899aae2168ffb3e34dc80 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 24 Sep 2021 13:36:24 +0200
-Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
- tree builds
-
-Upstream-Status: Submitted [https://github.com/sudo-project/sudo/pull/123]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/util/mksigname.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/util/mksigname.c b/lib/util/mksigname.c
-index de8b1ad..0a69e7e 100644
---- a/lib/util/mksigname.c
-+++ b/lib/util/mksigname.c
-@@ -36,7 +36,7 @@ main(int argc, char *argv[])
- {
-     unsigned int i;
- 
--#include "mksigname.h"
-+#include "lib/util/mksigname.h"
- 
-     printf("const char *const sudo_sys_signame[] = {\n");
-     for (i = 0; i < nitems(sudo_sys_signame); i++) {
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index bedf713d2c..feb1cf35a7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
-                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=50f8d9667750e18dea4e84a935c12009 \
                     file://lib/util/glob.c;beginline=2;endline=31;md5=2852f68687544e3eb8a0a61665506f0e \
                     file://lib/util/snprintf.c;beginline=3;endline=33;md5=b70df6179969e38fcf68da91b53b8029 \
                     file://include/sudo_queue.h;beginline=2;endline=27;md5=ad578e9664d17a010b63e4bc0576ee8d \
@@ -31,12 +30,12 @@ EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
 
 do_compile:prepend () {
-       # Remove build host references from sudo_usage.h
+       # Remove build host references from config.h
        sed -i  \
            -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,--build=${BUILD_SYS},,g' \
            -e 's,--host=${HOST_SYS},,g' \
-           ${B}/src/sudo_usage.h
+           ${B}/config.h
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.9.13p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index 2e11739470..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -3,12 +3,11 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
-           file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.35.5


