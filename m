Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261EC433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 06:55:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41570.1636354529307743294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 22:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OZlJwkZO;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=694669c51c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A86q17Z004679
	for <openembedded-core@lists.openembedded.org>;
 Sun, 7 Nov 2021 22:55:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YE1X9MCjyIkq1Aad7/gNSIEXkHq+/WaU1WdFtOMtPXA=;
 b=OZlJwkZOAgcgxtXMV3hi+wWaSWxIqKFeML35NfqjQPsUspDNvTqU0nxmu3B1kMdKde7o
 UwG3Z6RjIWsHMPT7XtwcC0D0KL7ionDxBOD4ERZ+lo5ZTMleK1kjIcYjV8YiS1ZuX0aZ
 Gz38v/11lawXKS0asW7J9uF6xlD11iQPsN3XTfCWP9bUtRt39gXatTxeFLfo1ZsgTQSM
 WUkXTxsiTNRKbA4tiyctCmvVYjxTACjZW1UsyiRsUMCaEFnpjii4+btWPUkUUrp5Zuqt
 xmmkRtmx2TTSgTPz3Gy6W0rfCAj7CKAaMK/EdLhXAsp1wz6oEMUWmqTssKSKd5V00/Uj Iw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6xq7r0c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 22:55:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6s8dvbFpV8yjL86CIgrgCAaIDT8qPqUKLX7mhk13teVbPFbiuFB+HsSOCciZcRePjlhAWxxD+3PUEnx8KA3CllEXwiA5AhO1+4/ayy6gInXbGrAJ06CFXn1M9Q3TK/3dCb2QX9T74k94ZmBUBRyQNv5Y9Mnxn6yZEXWA16vQTMeCv6deXNG8IGWUp9UIMDfjdooWUipW9bH3O0ZAumlTje2UCnUguxwFl0nJo0xiLYvuPdkk5NCgCQONWLzxc4xY1aYJnU/k1E2nzHIEOAyGvaAomx/GLxlH0q2/Or4vIDwVUes64RRvTW8IrI/KJAjWBeanl/6fONNSs67xL34yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE1X9MCjyIkq1Aad7/gNSIEXkHq+/WaU1WdFtOMtPXA=;
 b=Twh81KRkOp8Bkieo1fYcVKyfCWsd9au9uyMgo7XcyNoOXspAI1u/0gBWRMFuYJc7rxK8j7FZHFVQ+Ocd3LzyPj9pVjQiVmXhhTBZ6vSZK4LBfXrZYnV6wlBPiaw1zPPFWzBxjh/5POCs9+WGMx0U/C6jyODTh34SoZhxP0GyhccHrO/NRUtmlLNbTs410oUPCgPZR1PxXd44DoGYDEZDEQnGeGNWAMpJJJCSKrsEkDxVn6dJx+zOyyj9d6zNUaRtP7f9+go1wB8roNSsBCUNoJj7t2YEqqZqOaCpXciyn2KBJsIdiT+h7FBtt6iMEFbt63B/S4/9X/TfzWmPHAlfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 06:55:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 06:55:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-nose: translate to python3 code before build
Date: Mon,  8 Nov 2021 14:55:10 +0800
Message-Id: <20211108065510.25048-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 BYAPR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:74::40) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Mon, 8 Nov 2021 06:55:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d505c756-6ee0-4760-bf92-08d9a284beb7
X-MS-TrafficTypeDiagnostic: CO1PR11MB4993:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB499369D0FF6B9F87B81E4B01F9919@CO1PR11MB4993.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ysEj5ycllB0rgPsOYtBkj16PfkF/HDG/8jmitpqVa3EVI+qOzIyhE/4OehnOpXRD0/mmRHOff8Fp0fMBOUtTAK2mhkEW6mo3jQydMvtQbaDrOqHY84T7Uwjc3Tn1dIZkd6WO8M0kHagk0n78aCKbXyBrhbgpEiTYwRmWtSM8xG+CrHWJyXu4Om/IcrXThbrdkVDZ++JXcFi66jzgtDzcI0EqBXaUx5RBBiWob4c02cxjNKX83hwFrk6Aw0XQxWc9nOVA57DW8l66o2OyHm1wTgwkZvOvtZdx+T7PJATkB8WJVVPOfL/iS/o/GhSmtsZ4wAynXmkk+AZDCH+Df8NtPMoZ+QENP32XELyllzhptWOtvq5J8YTE2bHW5NrFU1i6u2DB70V4x32n88BquHQ9+V3SoBmwQY9SpSaAuLBMKX2CAxTcFA781fXQ8pzkEtYwnZPFU++48PAq0gHkEkeVGgbWx1YmGIS76hZkXebOvyBfTaQw68Gv2vMHJ9tStfLI5oBO2NqOpjoLSo3ECSyIYoaVc0XCv9o4jetVa2KEGByqwXpkqCTeRFMm/lS7Yx5oozszQEp1BYxV/wJGFXkI9I+0Ir/MoUIFeR0iMlzf2Wi6wDigvocwyL/+1MuGURDl77DI7f6KENjzqUt1OYzFBcKBYOTzyUSCUNcUIV8beh8e7fLnpHoKbznZh4ki8rDAwnWV04ywjkF8ejljerG6rF8q3g5ZbwB8k0zj0Z5uvbFCk7rN4Z4iPIX/sARYrDHXd1IRboDEYDSrysXUZ2/4+aiAhN7rU6XYp25Y8SDLqF0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(52116002)(6486002)(316002)(66476007)(966005)(44832011)(66946007)(8676002)(1076003)(508600001)(38350700002)(38100700002)(8936002)(66556008)(6506007)(2906002)(83380400001)(36756003)(86362001)(956004)(2616005)(26005)(5660300002)(6666004)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VsIEBvnyL0fyotzW/60Rd/yS05mHJCqm30BFkBJxFF3Rciw5cJexPZwxgtoz?=
 =?us-ascii?Q?B1KGi8MEcq6f085Be5OmuVM9+w8NOgsQnExMPSgMt8bX2m2LCs/LIvkO9S+Z?=
 =?us-ascii?Q?8oOefGR7ypb6mnZqsCqZj2H1n/hVhL94fjINDYCgnbKFGlDz5QCsXxajWAul?=
 =?us-ascii?Q?djwtK3A4LSmqNzEjLXSosF+XwFmffJEeULtYuxxAtsQKa/bGb4ZlrIPBcudA?=
 =?us-ascii?Q?ReDWgHGLBI89Hm+x7cmhW6upG2Qlo69l9wPMHuaqnpCWTM8WWwGoExbxhQA/?=
 =?us-ascii?Q?sRl4HonrzOSp+aE2INThjDI2qJO/agXOVrzZNamJ2EjXMn4d4VVrKgmcQlNt?=
 =?us-ascii?Q?yOkcwkwSKsq+YtbaBaQJWASDeUxhXsQ70miVfDtsN30pR/dtbK/OYYecLsc9?=
 =?us-ascii?Q?jLxlw/U3rWktJGwgjn1uBrV1JyCdjT8g5fmboqPb8Xh98gX0Tz2BeNrTt3Dw?=
 =?us-ascii?Q?03b5uJ2cIqP7u4VKzIcq2UkDPLwmkat1UruNv30LGCgBI/Y5GxChXX9wI22l?=
 =?us-ascii?Q?Nf+QV3khsVbg/NyHxrZmz/DRyAWDaF9Ug0xT0e1/evPRYNNMX5jJXQ6SiCiV?=
 =?us-ascii?Q?cWnfrVrZxWRPWIvrqkjvfbSdPvDsPt85Ht042WQprnNLu2HisotCAP/Q7rnO?=
 =?us-ascii?Q?H1sHwxDpPvGTskIiywH9DM8SEjpdUA/rd/gbKbUKE5OSGoWKwOTlGewZ4eaN?=
 =?us-ascii?Q?yiFl+Lypg2K104oSYUy+rZpSmXfGKNdpt4YPso+MYO+BnQxJv5UK1ipDwnTp?=
 =?us-ascii?Q?vF6UGb9LekY3IWeVKDeqa+rDGcibf7uRCJPOuyhDOVEWZYsQRprFrTAbOoTC?=
 =?us-ascii?Q?yptn56A06N9z+tjkA1GDefEBMXXqU30LVyxAVpBjQtgyayRUaDXfmLQGdio3?=
 =?us-ascii?Q?3COSLZ6njszS1wKMpxLF03uLxouIz2a8BzYweFwfgj3gCqF5rHQoOY09mP5O?=
 =?us-ascii?Q?5cA7os9APl27CgZ4Lp20C7taTwCEkrlAOMd1QmUua76N2PglC2a6r1CbJ3E5?=
 =?us-ascii?Q?VH0hdCiU31Fcpe1A8BuDeF2VldalBr/oTjyLYM8Ne9glpyrgJ13YgSc3i7s8?=
 =?us-ascii?Q?+PiBJ3GW+sz0X4/ubQEZiOFKTUuvK+Z2ax6+1MAmkZLeVQ80KlgJAf8LY+s8?=
 =?us-ascii?Q?6rLmbcbZP9q+WnN6wvvmHzz6k972ZbrGeGuqLPtta6xbai2IYxfxj+2/SaHr?=
 =?us-ascii?Q?pQsaWoNV8UVdO/Hmddan3/fdYnaLGYRvRcvDHiaRVqjYzrBBn0jGXRBWDI4o?=
 =?us-ascii?Q?v3GXb/nSlysEJ4Qmoxbdnrr1Bc92hawhJ4ihKHFtA0zyeNiaZJ5MTQ3/c5by?=
 =?us-ascii?Q?5UX1KrWqrI9IBinA/Uico/9iRQTtDTKy4hRxr0JWh8dJMt5WKaJQxKogQp5k?=
 =?us-ascii?Q?Cho3kBYlODkq870DAzm6Yzt/vIZ+WJ5mFlzKup++YLmCdQecIkgY9iR3Yjp6?=
 =?us-ascii?Q?10n27ok70ObSEvV1LMmLA1VJg97mpSkH3KUZukZRSPvHIL38iCoCpLOnmZDh?=
 =?us-ascii?Q?M7Cu9U6BfG081g1PXkLpBN04cl5lkz547ZcRjnCYANWoZJ3kajPMUCp914tE?=
 =?us-ascii?Q?/DW/+THJ38RBXNLN3t0q7107Hy7vUG0kbMqoGORlofETptp8YWfjrlGZCl5b?=
 =?us-ascii?Q?JKruOVH0OaYuTR+BvZY9+0w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d505c756-6ee0-4760-bf92-08d9a284beb7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 06:55:27.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TJ/op1V0UJMeQ0+mfUbCRW4DUilW+I8aM66fyNhElFwDMi6ccf9sNF6IAgCMO8t5+aE50ZEozy2IjMcgUdHNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-Proofpoint-ORIG-GUID: 4Uln7XqGgcpmPjgCWWULL9feV9wxOVx4
X-Proofpoint-GUID: 4Uln7XqGgcpmPjgCWWULL9feV9wxOVx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=783 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 06:55:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157965

Setuptools has removed support for 2to3 during builds since version
58[1]. But the nose's setup.py relies on use_2to3 option in setuptools,
it is failing an import and building without running 2to3 and generating
valid python3 code. As a workaround, we use command line 2to3 tool to
translate to Python3 code before build it.

Fixes:
$ python3
>>> import nose
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib/python3.10/site-packages/nose/_init_.py", line 1, in <module>
from nose.core import collector, main, run, run_exit, runmodule
File "/usr/lib/python3.10/site-packages/nose/core.py", line 153
print "%s version %s" % (os.path.basename(sys.argv[0]), _version_)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SyntaxError: Missing parentheses in call to 'print'. Did you mean print(...)?
>>>

[1] https://github.com/pypa/setuptools/issues/2086

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python-nose.inc  |  6 ++
 .../python3-nose/0001-Remove-use_2to3.patch   | 71 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch

diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
index dfae202299..1a19cb96cf 100644
--- a/meta/recipes-devtools/python/python-nose.inc
+++ b/meta/recipes-devtools/python/python-nose.inc
@@ -6,6 +6,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+SRC_URI += "file://0001-Remove-use_2to3.patch"
+
 SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
 SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
 
@@ -15,4 +17,8 @@ RDEPENDS:${PN} = "\
   ${PYTHON_PN}-unittest \
   "
 
+do_compile:prepend() {
+    2to3 --write --nobackups --no-diffs ${S}
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch b/meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch
new file mode 100644
index 0000000000..1a0aabef75
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch
@@ -0,0 +1,71 @@
+From 4307868e31065c56456ddbf03325fc03643cd33f Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 5 Nov 2021 10:12:16 +0800
+Subject: [PATCH] Remove use_2to3
+
+Since version 58, setuptools removed support for 2to3 during builds.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ setup.py     | 3 +--
+ setup3lib.py | 7 +------
+ 2 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a2091c0..7e01bba 100644
+--- a/setup.py
++++ b/setup.py
+@@ -13,8 +13,7 @@ if sys.version_info >= (3,):
+         from distribute_setup import use_setuptools
+         use_setuptools()
+ 
+-    extra = {'use_2to3': True,
+-             'test_dirs': test_dirs,
++    extra = {'test_dirs': test_dirs,
+              'test_build_dir': 'build/tests',
+              'pyversion_patching': True,
+              }
+diff --git a/setup3lib.py b/setup3lib.py
+index 27bdb93..761b74f 100644
+--- a/setup3lib.py
++++ b/setup3lib.py
+@@ -18,7 +18,6 @@ else:
+     import logging
+     from setuptools import Distribution as _Distribution
+     from distutils.core import Command
+-    from setuptools.command.build_py import Mixin2to3
+     from distutils import dir_util, file_util, log
+     import setuptools.command.test
+     from pkg_resources import normalize_path
+@@ -68,7 +67,7 @@ else:
+             self.pyversion_patching = False
+             _Distribution.__init__(self, attrs)
+ 
+-    class BuildTestsCommand (Command, Mixin2to3):
++    class BuildTestsCommand (Command):
+         # Create mirror copy of tests, convert all .py files using 2to3
+         user_options = []
+ 
+@@ -83,7 +82,6 @@ else:
+             self.test_base = test_base
+ 
+         def run(self):
+-            use_2to3 = getattr(self.distribution, 'use_2to3', False)
+             test_dirs = getattr(self.distribution, 'test_dirs', [])
+             test_base = self.test_base
+             bpy_cmd = self.get_finalized_command("build_py")
+@@ -112,9 +110,6 @@ else:
+                             if fn.endswith(ext):
+                                 doc_modified.append(dstfile)
+                                 break
+-            if use_2to3:
+-                self.run_2to3(py_modified)
+-                self.run_2to3(doc_modified, True)
+             if self.distribution.pyversion_patching:
+                 if patch is not None:
+                     for file in modified:
+-- 
+2.17.1
+
-- 
2.25.1


