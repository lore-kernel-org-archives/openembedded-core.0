Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51B7C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 08:04:45 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web12.48792.1638777876910521006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:04:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=LVxllEpI;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWlhUi/++ILmJKyZbXiYX7BQxniHLC4wZkmJUmYsEd79FYkdmJvou77j9PtBztuwjAvbDw5zI7ZdORVStteX4rA12ynSLIgEfXIBtOq9k1DGJ7QNL/G8RpHvP1Hfvv6zMYKvN1WVm1xZ1nyIXHd8IoKM+TTIQ5RW4xc8hLnA8PGlKtit+5owEh6AVnO1TmofEXWMdsoaJgV89QpElAbbwJA8WOTIWqoy1VkNNL6KaYOfGX5p9Kq+vE2GFif71oUyRZZwipLXdWuoCCvkfBM2yVtJ70HMIjQf1UsxkAWr5PWB+keaTq0qZr8oU9aCjE1V/8ujm4SUp16uX9rfXg9MNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkhZfUPSdG7r4hrR29evpgvuhixkX+0jZjIsSwt46Zw=;
 b=JO/fr40xakI9AEJik0Luz9wPC3ABAwG3WPWDacfChVg5K1HQXqzKDBMq//XX6TYnsmXXkVrwnTV+XdW8N2U/07idaDMbbzoaZj/qsxsVh12di37doEyq6LV4GbGmv4t98Z+2WO3POZkD817Gft9Ndd0mbGC2Lz+7vK7JuhdfGFs9pzcFvY6BE416QH5Ax6/QTrTC5AWyYin3pstCQDzcNIpcedYkRS+8buGUXthHXW6BEXbcD2kOyY0Zj4vsrEQIntJrfg3PUWGvRhUHzfVCpQc2WFoSyn3uKx+Vp8gEweQup6nDJ1KCtpUqVzojbM1nTG552ftnlzeRKEZSdVIeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkhZfUPSdG7r4hrR29evpgvuhixkX+0jZjIsSwt46Zw=;
 b=LVxllEpIMrpO/1skpITHbBkdcDbbT8n4ffQWeQRipg7ZOsYn/aaJp1W3/37EtvG3obQepg/HekZIoldpZcHEUP49lYIbPAU+P4Rrad+LfCgqaTr4JOad/w2vbgctvEQO9HyD8kT3XWn4nRUlE5ZBp+hffUBV0Bu/Ec+Gysznow0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4729.eurprd08.prod.outlook.com (2603:10a6:101:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 08:04:35 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Mon, 6 Dec 2021
 08:04:35 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 4/4] selftest: devtool: Separate common functions and devtool
 sstate setup into two classes
Date: Mon,  6 Dec 2021 09:04:05 +0100
Message-ID: <20211206080406.3249-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR07CA0040.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.244) by
 AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 08:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f81416c-5d5a-495d-9c62-08d9b88f0b10
X-MS-TrafficTypeDiagnostic: PR2PR08MB4729:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB472950E1E73F42F7B8E07BF0D76D9@PR2PR08MB4729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ifjQy67QlO2VZ7B4UQO61KBFDjOONTx+xIxhcOQDvr8x748N9hT8ysYGrklceasJ3mcomtOHBIBdFet9PpRVM/IhRqRoJ8ZSr01A6EGWjRy4AVf4WVmSgAW93cdsUoaTeA0qoKz8A1747VAhOgQh7qwi8c+4LH6csDwN4J18XYX8rXxFfsydg3RxAVSfztpWt5gAXBRDvq/jzvTwASaAZ1sAg75pE810J78QKUqttouh2s7Y7XVQa7eEMmeejjWWVVwTQX7TSlDyaJKyZJhyoCl97NDaHIrqdNNTJTxzwa0GKkY2MIwDgDTFwlnitWnR4ob0lEix/1DvVXasUq/Zfrkcf8XsJyraaTWJnPJxiGD1MdhA5B9YkDLAdnXmoNW+1EH8gC6QyfQylJ2PgjLn4CkTG+HcEa68GlwCjIzFO50Tp1j8KK0BoO7gUmrKQy/bS4x9o79dLkNrALlqMAucGbt6F1tVJywYoB2OwVcVlF5cWpo6Em+lYLeWVIxI8BoX7ZTunDaszgtPhmXJaT1E29j+G3iIDA52woyRqBzzcwFcsgY6XwQgbOuMs9si6whXG2+JCsp9ELl7sxb5mbyoOrZocHavsY+HVn1ZlF4+WfMZOG7dcRIJLMy8P9NY8YmVBmvsTZQnbAjy26eH1EIQ+aoagrLymyDdIu9w2FfUk7Wrm/NMtfpIgMqW68myQsyhaYna4I6+tOXTmKdwMu1pXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(83380400001)(508600001)(316002)(6916009)(956004)(4326008)(66556008)(2906002)(36756003)(186003)(38350700002)(7696005)(8936002)(86362001)(107886003)(26005)(8676002)(52116002)(2616005)(66946007)(66476007)(1076003)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0lE2GqCjoeQAZpHi7BxFY3ngC4/UDvRWp/XXrgp8aHWSIIkDMGaReD9jzxkS?=
 =?us-ascii?Q?b227DBEmHEheVwdjGeg4xvh6SX52gqy1bC2pwqGkX+4I5N3KWR6taYI30cU2?=
 =?us-ascii?Q?QMHnFpLvq8XXVDtlvekbrmqVTjOp0asQMo+1zxWsRUa4YZMQldi6zwpM1Q8k?=
 =?us-ascii?Q?tBYONNFwUCX/EP5ZRbweaPdXaojl3JDWDIRXiFOirYtGR0Rvjcauv+zdYdVH?=
 =?us-ascii?Q?K8GrqG2PxwaLkIz2lFHBSo0o/AVCMDVNUkjZHaRGRGbPT0jnWkfqPPANpKAL?=
 =?us-ascii?Q?QxX5azZoz4cIHU4dsfzPWM+WUejS3dUmwMiIFOsJD45aeeiE/9lRxVpftgnb?=
 =?us-ascii?Q?E0lXD3d0T/vhUrHSi9oUwQ8NkaeE2y55mR8BO0/L+DEayic9uITf411vk1Kj?=
 =?us-ascii?Q?0z4gH9XbLGDur1ticbggHZpIpUNkvrzT0Ap3trWWQcoaY2oJj7LNDaQfJH7e?=
 =?us-ascii?Q?DUk6g09eA2m0DGSNod4D5/yzJLnO17y0Q/K/DpOdWqtBhMai5xQbbFddu3tJ?=
 =?us-ascii?Q?O0HkVgi8KOpX5PW2Z272uFLG3PDRJ0kjBz1KdMmdjsM++5FEY5utHSuJbsq/?=
 =?us-ascii?Q?3lynclneBirdIry5Ssuc7WyL4gr+Vv41zvWn+4bwuYenKqHGKGW8gsPU2OCQ?=
 =?us-ascii?Q?c+ynj/dcyDO8yYJctVV0VqxtrNJT3yyA1u/Y6JPdheLvV181sakD2rpmrplf?=
 =?us-ascii?Q?CgssZp4VaRZo1M9djFQIrufNIqZZtJGpdqjZh3YJG48u2CohKzdqqnY3MIev?=
 =?us-ascii?Q?MqfaxFG4q2F5NYBHBioXinAi8+xoQYnvWi1QYDS+ehpebSBKuaQBhCpB8sQ5?=
 =?us-ascii?Q?5R7nUPinUx2X5fsxYChZgTo+WH9aoRdxdcV7sIdm7MAFdW/ALdBlDWHNCp/j?=
 =?us-ascii?Q?TecOBIHNOKL2MQJfQCbrXzLhBQ9yBsR3lF+0O2boUCr8qseD/AWjAinChtzC?=
 =?us-ascii?Q?RG4m7zCX1kKUfSYvCODcYWyCEUHFPML5NgeTMIY050rP5vn54/927S28Zki/?=
 =?us-ascii?Q?5J3oiSAz4IAhtg7mmjfyrM8IpG98rKQKwWE8HVZeSbtK7LOgICgC6RxsOu4t?=
 =?us-ascii?Q?unbPR8dbBfIS2jwJzyh6fd0tAgejsl21wUuUcOU4XwjsQ2qnBB6c6Y4AIamS?=
 =?us-ascii?Q?KjPf6td07KYoV9HmtKRqFfExl1UoO+st1J62oyg4vxY7ZFWxLYOT07WrBgkH?=
 =?us-ascii?Q?Vz4LYWcDELbA9ORk3o29xkYu0plTujhddOdk/7YPMB1kw6se1jvLlQBs41o8?=
 =?us-ascii?Q?usyxFVz8t8M7n0LWxZUOdT1Nzgb/eGphRGiBLmyNupfbV/5gxAeU6DqQhjkf?=
 =?us-ascii?Q?e+O5o415qPQHoVIrGS9HrRsuTTjaXsIMgdq3Y63rg0/irv/oUMzl22mzIycP?=
 =?us-ascii?Q?GjLDy4LDvVIKFXJIAiPhS9HulW4FBkaI91ZPBP9Mv5bpJjfL3xjEd5M9JvZg?=
 =?us-ascii?Q?V0umKQNq8xRvDkgxLpabWrG22DS4qjk/dxdvgzAT+75dzuBUHLQ8p6wpN1dq?=
 =?us-ascii?Q?SSfR1y6A3MWGDbHlNhwub6Ly1+hcVrwYy5e0v9O3pqsaianiSb/8NEpjipXo?=
 =?us-ascii?Q?8AyJFcichMmMVFGtgurJ2Z4JgP+XjRwjJT9RM5scf7ZHFrdVWq//9Ss20EiI?=
 =?us-ascii?Q?n8Z5SDGmsoy60to62HLErVg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f81416c-5d5a-495d-9c62-08d9b88f0b10
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:04:35.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a5KMh69op2WrK0w10rbsg2poCrUMMc6EqdLD8Np3kiinEGEoXlJ/81EVedRbapIM78wzTR18++00ijFl6UrHdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 08:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159211

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The selftest recipetool base class reuse the selftest devtool base
class. Thereby the selftest devtool base class setup its own devtool
sstate and the selftest recipetool classes trigger the build of recipes.
This leads to the problem that the build artifacts doesn't reach the
persistent sstate cache and rebuild on every selftest run.

Move the common selftest devtool functions into its own class and use
the sstate cache in the recipetool tests.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/lib/oeqa/selftest/cases/devtool.py    | 45 +++++++++++++---------
 meta/lib/oeqa/selftest/cases/recipetool.py |  4 +-
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index d2b31af80e..96f40ac9a0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -80,32 +80,15 @@ def tearDownModule():
         bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_ed=
it_cb)
     shutil.rmtree(templayerdir)
=20
-class DevtoolBase(OESelftestTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        super(DevtoolBase, cls).setUpClass()
-        bb_vars =3D get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
-        cls.original_sstate =3D bb_vars['SSTATE_DIR']
-        cls.devtool_sstate =3D os.path.join(bb_vars['TOPDIR'], 'sstate_dev=
tool')
-        cls.sstate_conf  =3D 'SSTATE_DIR =3D "%s"\n' % cls.devtool_sstate
-        cls.sstate_conf +=3D ('SSTATE_MIRRORS +=3D "file://.* file:///%s/P=
ATH"\n'
-                            % cls.original_sstate)
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devto=
ol_sstate)
-        runCmd('rm -rf %s' % cls.devtool_sstate)
-        super(DevtoolBase, cls).tearDownClass()
+class DevtoolTestCase(OESelftestTestCase):
=20
     def setUp(self):
         """Test case setup function"""
-        super(DevtoolBase, self).setUp()
+        super(DevtoolTestCase, self).setUp()
         self.workspacedir =3D os.path.join(self.builddir, 'workspace')
         self.assertTrue(not os.path.exists(self.workspacedir),
                         'This test cannot be run with a workspace director=
y '
                         'under the build directory')
-        self.append_config(self.sstate_conf)
=20
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
@@ -236,6 +219,30 @@ class DevtoolBase(OESelftestTestCase):
         return filelist
=20
=20
+class DevtoolBase(DevtoolTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(DevtoolBase, cls).setUpClass()
+        bb_vars =3D get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
+        cls.original_sstate =3D bb_vars['SSTATE_DIR']
+        cls.devtool_sstate =3D os.path.join(bb_vars['TOPDIR'], 'sstate_dev=
tool')
+        cls.sstate_conf  =3D 'SSTATE_DIR =3D "%s"\n' % cls.devtool_sstate
+        cls.sstate_conf +=3D ('SSTATE_MIRRORS +=3D "file://.* file:///%s/P=
ATH"\n'
+                            % cls.original_sstate)
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devto=
ol_sstate)
+        runCmd('rm -rf %s' % cls.devtool_sstate)
+        super(DevtoolBase, cls).tearDownClass()
+
+    def setUp(self):
+        """Test case setup function"""
+        super(DevtoolBase, self).setUp()
+        self.append_config(self.sstate_conf)
+
+
 class DevtoolTests(DevtoolBase):
=20
     def test_create_workspace(self):
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index b77a2712f5..439e41597c 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -25,7 +25,7 @@ def tearDownModule():
     runCmd('rm -rf %s' % templayerdir)
=20
=20
-class RecipetoolBase(devtool.DevtoolBase):
+class RecipetoolBase(devtool.DevtoolTestCase):
=20
     def setUpLocal(self):
         super(RecipetoolBase, self).setUpLocal()
@@ -72,7 +72,7 @@ class RecipetoolAppendTests(RecipetoolBase):
=20
     @classmethod
     def setUpClass(cls):
-        super(RecipetoolTests, cls).setUpClass()
+        super(RecipetoolAppendTests, cls).setUpClass()
         # Ensure we have the right data in shlibs/pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-reci=
petool-appendfile')
--=20
2.20.1


