Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDCBC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:19:12 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.85])
 by mx.groups.io with SMTP id smtpd.web11.10318.1638958745029393425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 02:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=43OGb/Hk;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1dcqsRQW7F3TWTtEbb/oC3dh93GypFAW8OQ8ewl4lVbGYA4dJS3+eP+XlDR/8Sfv+boZrtKqyEDXQegiANj0QtNrB2eKQB3g94xm16oVCfOkhX6cHEUnIDT0PzKrrLyPA4B9z//pmp5Vgq4bR+iTS1rlQwqFvqi5g0MefkmMNxmtyh89KWrQMNk7QU0WzFqZKwWIJkbYUThhg2+7PdCHRQBmoaujGd9+s+sRsT8ozQDjLqSWbpoBny4k6krcwfY4w7F8b29htfRYkk7VErrCr+Ivamous1uvlttaDYLx5BVDelVmMlKKjVZfBzyu3RoGM9bemaSHp5MQ6Hfji36Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAwNu8WkJqyRP7YvxYzdEXo3cgn2P2SlYxmL3VyE5Ys=;
 b=n+2GmmCESlm+cxrEwU3T15VO6vHH7oPHrRgph1biMVKMmupkCRocm4Zv6/lfb4/eCPms9D09KdqdAKHSBHRelgaM1TxFuGsTytXB2f2cwH7kvep29McomssqZTR8d//JUKuridSw7FdNoR/GsplSP3AzZJjsyTSvAcHkg/gZbYEMOFA8jjDNM/nC1ZfyNhc+8XQP4nd/WnDodbrRT0Yeaj6E2JcOE5ZOlaZ0fq9Q/2rXbXMLIEICwDlC3DTgkTkjR+KtrMd2cJ+okDg087JVyDL8YTxGIVbzNi4q8t4ycJ0IUgAUrNO3AsIIDj9YKhHciNkGiEJw6io1FExNI0kqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAwNu8WkJqyRP7YvxYzdEXo3cgn2P2SlYxmL3VyE5Ys=;
 b=43OGb/HkeylH8RMSLBeu51BXhWbrC1OT1PZnDqrdokEudYhG/i/Fc37esjcy4Sj36spYdNiRKho6L9w1VImQy/NQ+s1/igkmyCktEBmTXp1vGDNYapS1NZEbuwEiLsab05wGxi2NbN/y10hDiIhgMIN/fn4oa5tNNq+7tL8ZFu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6910.eurprd08.prod.outlook.com (2603:10a6:102:132::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 8 Dec
 2021 10:19:02 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 10:19:02 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 5/5] selftest: devtool: Separate common functions and
 devtool sstate setup into two classes
Date: Wed,  8 Dec 2021 11:18:39 +0100
Message-ID: 
 <20211208101839.16224-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.94) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 10:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 421ed6e3-c1a8-4f93-ef14-08d9ba34280d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6910:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB691047E08A69719683A1C585D76F9@PAXPR08MB6910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dE+W4paFyjc5D7+t1v+HSPp4wj78z9JBwwDZMDkCn+7i/EwXliK9/AdSJeVK0eIN2Aa/wAqhWU/S3MI56WdfAXkKuD+smYYfBRAd0wpNbzK4LY5tHEAjC3hTF/SSy2l9R7r5/sUbVG6JSIC6BmoWLMJ5Y8/oA5Y2/e1NAxmVSi60JpcjFVLscnMAJU/weE1VzN+0cEClRmYsDynSllXZr72R9j7DGk9uPZui3arfO6hmna/BcSAPnQNh+pg5U5GLt7gdWnjKsIBI32so1YGwLpX1uJmICSTB70/i2hp0Iz3h9nbyhlFXcVytXhKmuWCT3w+bX+bhJm+Pm8H5gS0tjoYjSskOrtlM4hGrbohRw6nXlP2HIvs7+mdsC9hjBMXTxzKgKJooJBzg3wniowg6cNHIdKMWaQvQnEgc9fO5KKjH794rgs0PMMMyYHR6Iek6pinpliKh//xfengXCSVnTOJ4GD6wHuyojvoYitWvc3BSGP/Q3wWmRlObQ8Tlrmycsh15PDlVIBcIvSxBW5nY1jGmz2OIj09nvUg4imLM7KN2Sa74HCoV7HYc21BExar6ueAxFplN5nsIaPTgesG9NYMw2VHzxRS+3KayVHzza8A0bvSvOd1uxV+fDHFfG71fHoutboU8H4Q3VxYdVOtGrvyffXLGq0vtiEDjeynuOGUXBlUTuG1DdpHPpMpj4BnCxNDey+0h0HWGaPTAHC6CIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66946007)(186003)(316002)(6666004)(8936002)(38100700002)(508600001)(2906002)(8676002)(6916009)(4326008)(107886003)(26005)(36756003)(38350700002)(2616005)(66556008)(956004)(7696005)(66476007)(86362001)(1076003)(52116002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qBvqQNX6F2uqK9Dt50BEeooJde+zUarvgEk9D6InG/8WcNiP22JUT8cWpoL9?=
 =?us-ascii?Q?YTQX6tR+12o4uQkz5BC5wtXCLVB+dzAuMOJI7Jj9a5DaaFZ5B9WKqpjCjAdN?=
 =?us-ascii?Q?Ox3NEQLoaQ9MktlmypZyHg6rwmtnTn0Xf5El61DhS6dXjMU+0VBlBnQWTnTR?=
 =?us-ascii?Q?ZUCx/tw3xo5+SWd6bg/XnoYtH3E9dSYd+GWs+i6welwA9weR/x8iwfbIYOdo?=
 =?us-ascii?Q?hfSYdjz5wlxZv8I97odTqOLOf1UlbzcAfQu+mCB6O1SSqk7910cjWSRflxzq?=
 =?us-ascii?Q?7CTTEfS+4YB+sdy0m/8OwTKB0eN2MSZ+Jxgy42MccYuwHn4Pa6d88oqeQomr?=
 =?us-ascii?Q?I9jzxGdriO+KMvGhfhWrMGunYSEi+RIRD7wWUlfZ67kUjejSpO3x6u0ZihPP?=
 =?us-ascii?Q?OZo3Tn/+a7OLZGoeUDFM4+fUqP5fdpk1+pt6zvLucW7EKdB9ZX+jkoeXcSJf?=
 =?us-ascii?Q?HLnIQXAcdA2SrTgwIsbPhpwYY8dgJJwNSuwCK6VRFhLSguL/zn99NtE0WRvk?=
 =?us-ascii?Q?8q8/OfTeqy3LN2957cbdKyZFGkOoiqXKKVEdEg16g63qigBkdTPsM0zpsyXm?=
 =?us-ascii?Q?2usFz3gX4PMLt96DbQN0CmAp3szVWc06Z36EGvw3puwq+0bDVBjZLZ1wcMxn?=
 =?us-ascii?Q?NYI8m8nsiVPH28o6TmF//PKos1tCiFCg8cwFBygMJQHH0Jtkir2w6w0I78+6?=
 =?us-ascii?Q?XMzKBZcaNGP1w8B9ipmwQUhc8dkJ7H474fMtd9LDrLZqVR85R2v62Ocx47HL?=
 =?us-ascii?Q?4E5biEPdiAFttuGl9HKwBEaG0hyUpK8cqAbiPwDzR8BGCPgndXiLxhnXf+lT?=
 =?us-ascii?Q?uY/yldEFOb5pBTCaVe+4rORvvf/wXkXkzLpNGgccRUOLJZHObe+z/IVyf20P?=
 =?us-ascii?Q?8yyU+hryJVcuyZeApVyBdODadzVQy9nPsp4cKJTPn73iOej9DsG1WgodpYhN?=
 =?us-ascii?Q?wutO3GoM3RpwmBxWfxNJ3CTozdTKm2o+cNZN/QbCaiN9PyNuZjwU98r/9uT/?=
 =?us-ascii?Q?sB8iA+zAUvy+W/scAJzbqozDVPIt8zkKI4s8Zlx7wYO6tC2FltueNFR3QbLI?=
 =?us-ascii?Q?Lkhk198OpLdZmCRyfWuIL8ah2Qavu9gZeRQFS9XT34+wMNE4wquFUb84YpXB?=
 =?us-ascii?Q?li4KHjcs4V+uWnolyxNNExWiY/NNE4Fv0nzcUemRZqhZ474as2rjeXZm/vF3?=
 =?us-ascii?Q?rcImPgCdshxLVhCfERIp4OR8gdMeAfZS59MRHcDYy6FV8K//Tnfu95PseX3G?=
 =?us-ascii?Q?SrftWuZ7rpCBYZIZwXMdIFxVeDtXrBVfvx0ZlqsUblJJXzvviSxvjzftzFUN?=
 =?us-ascii?Q?VKeXialoobMPxsq8vZkTtiIvWfDfAGA+aL+mn8cXm/Mz5HAtnKL8kLGD+OkF?=
 =?us-ascii?Q?oRIdBdNHcsZhFfUj131iW2nSOsuiV0KXgVR215v8iXhgjFLRV9m8SC2MtgA+?=
 =?us-ascii?Q?Q2+Od+oWEGyVE2ipvEkGU1q8ktqR40gEo2hFrxoY2wdE4CjIQpVkSQOctI3P?=
 =?us-ascii?Q?PJSm6FBen9YnUt59yAbYIgmC8eiDtW2DXJZ3PnhVtqMqaxML6eUJzQfm+pKF?=
 =?us-ascii?Q?dZjspQSiCqQdb/w/K+x3HcS0GEsJp9Ieo7XmuPjNFjsuLBhID6RiOiJVZXCK?=
 =?us-ascii?Q?1RWJWJJvWxk6g2HXsNTF58Q=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 421ed6e3-c1a8-4f93-ef14-08d9ba34280d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:19:02.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nd4/Y+bl6lj7mYicjjZABPonXXBW+0Js4GPDDellz1Q2PNoSy9wy9iZIHHbBArcTxBNEGlpMxPjGrHhkt4f/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 10:19:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159357

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

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py    | 45 +++++++++++++---------
 meta/lib/oeqa/selftest/cases/recipetool.py |  4 +-
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index a2b4d7f7d1..23d55903fb 100644
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


