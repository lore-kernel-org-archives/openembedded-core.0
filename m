Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.1325.1590517214988658965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 11:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=XxbDK9GO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ8YZQXgTy472sGxvzJmOj67FaCiJlFtg9tDytYGByIgBvK+cBNVA2Qh24W//m3nqMMUfSYfI/ylKJBcX98NUH3OH3x0U2eD+3+/1kRfPEGWRHIftSPnoaenFd4oCaxyrUk6xWygPk9RfUCfmxNY0mMFUFDZ1UbFiwOxHO0svj9N/ueBAF32/TPezTrXueKkH3M3606XLVPmOcJNlssXzJXoz3AT+IdEjFaG2MwUvf+NKMf6/zFlNpYYUEBu4goubhMSFSiXWvJb1sMjyIw9uP+azG2tFJCyVnmoTD4KgcgMeIF+2SqLG1v/3AHIS2zZcYR+eQHBNDbPqxKFjHVogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr+g5SLF3cTE1VG7cHjrVHzINXhYuN/pxyNC8GhX4yA=;
 b=ThmGjYXiiiZip3959dFUjnYunIcJSVgVo68DiEfWrQ7osTHH+0zYhSdNTTZ1gxTg1hjlGGdp99BEZ0sKogKmVQGkL+4YddHbg2geZmD5lp7TBfgbQ62qkkqM1McJ0NJJgNTFVEbTynUV4n0AhY/42h5Rd/MywKEIFEg+UAio4azvFhupFnSl7iFtSCK6ZDkzMYdHS2E90PQN8wGXcs9uVtfagZaTbN7GYG0mRugMCvAI1hZmVJHOFhv95i+MsRhtlF5bl8AXhQ1F1hhZOehBbWbMDfMo/okVEKkwW0VXRlEWNGL2AU6SZd6mM4Cc3gXsUvGk5+DktZ+L3QnSCJecNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr+g5SLF3cTE1VG7cHjrVHzINXhYuN/pxyNC8GhX4yA=;
 b=XxbDK9GO+kvc0h5fy0P5n1Ffk7NOJofI8h0x19k0PzJ0l5lAP417CA5ItYRPoHwD8VOpDLJAs9MBkej3ZFDqM7FacG00KbGdC0rAJItgu05tAeHiZxcmGHSD1GWLNAGJbd9MM3NJYGtWVzBI6ti6iy+2rpeb7bES0iOlPExxz0o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB3403.eurprd06.prod.outlook.com (2603:10a6:7:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 18:20:12 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:20:12 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v6 3/3] selftest: add a unit-test for fit-image bbclass
Date: Tue, 26 May 2020 21:19:56 +0300
Message-ID: <17a8dcb82bcf10819d27747a6dd85f9e20380481.1590517053.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1590517053.git.nandor.han@vaisala.com>
References: <cover.1590517053.git.nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR05CA0160.eurprd05.prod.outlook.com
 (2603:10a6:7:28::47) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR05CA0160.eurprd05.prod.outlook.com (2603:10a6:7:28::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 18:20:11 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4041bc3e-934f-41b8-158e-08d801a16d9e
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3403FECBF5DFEF87C188FAD585B00@HE1PR0602MB3403.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	icBMK6iGO5GO+7vPaXpYsovzvJw3+K+Sy0uN7AL6vGsbD9kTk5lYEOA7my9MRk63GaIxPgumDiC5Fx8Fee27mwB1ZQz+n7qHfeuJ0OKo8J7C4lHfI+wpVgm0L2x9O24oNHebmg0nedVvvMutDVXWwWcoQaGoo/LE4M03Xiuu99OKcqxp1r4Eo6KC1cf1hdeIgpbJkj1lvMMe2eNBXVCHZdpHKRWz8wTJ666W7XLcqV6YStlmSwIGDdxi+ZhXpNW5+b3NxQeHLpHLxYDk65tJXqjfYdkndkJ55TLtxNq8g5H8m4YcRkSUyLnRwofqhPpKH56bkfxytJVAB1xZF7ibnIX1clvtqy7Pp8/saTdpjvVK/EeWyt6QLrV/92dKjsc5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(396003)(39840400004)(376002)(366004)(8676002)(4326008)(2616005)(107886003)(316002)(956004)(36756003)(8936002)(6916009)(26005)(52116002)(7696005)(66946007)(66476007)(478600001)(66556008)(6666004)(16526019)(2906002)(186003)(6486002)(5660300002)(86362001)(44832011)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pftlFiXi4OwL7BSJplI4jRv9CAhTJGTKVN5ShGObpINBxV/oxZ51mHt+Q+V2yjjx4v8GQ0LpUR4A0D76qHS27bN3DVjv83zE4a19BmVWH6GEub8EDabP86QfXKRk00kQmJFbFXZrbeve1ROXTHOtpdxhhNzAB2QGDfBH/V0ggyhas2e1zF5mTYj8rXXWgutxqVI6hYKHcQZLRMTJoIWA0DgZ0RFqpzFAGjOZ0o1SxdHS29sqW0xn7tTnRHRqKF77Izvtbytl3kXLIuPEygnDtmfKcV3Bpt0KdgZKwXnqyDfL/GDkR1vuhSGyPs0pH3peyHDm2yILOvm4jbzmOOwYAvis7LnSWqILPaN1ErTlr0gHpT2yAvAXNaEDLpxondSLj9BIytf8bZCdi984dVBHRHV+bsaY2GSi3PXaumX3fsQSwBYkGyhI/KV6SRk7dFFq2a7Dc8o3CQq6Ot8iHrK2CDlTMOXrYykW4M5g94PlOC4=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4041bc3e-934f-41b8-158e-08d801a16d9e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 18:20:11.5113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhMUN4qMLBcO7Y5lVajq+3vyAp6licIWTg9fklr41tyDTAu6QJoLOivSGvjGxQoy0wZRMcNpFiMjk/vclyDd7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3403
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The unit-test will test the basic functionality of `fit-image.bbclass`.

Signed-off-by: Nandor Han <nandor.han@vaisala.com>
---
 .../fit-image-test/files/dt-fake.dtb          |   3 +
 .../fit-image-test/files/zImage-fake          |   3 +
 .../fit-image-test/fit-image-test.bb          |  17 ++
 meta/lib/oeqa/selftest/cases/fit_image.py     | 212 ++++++++++++++++++
 4 files changed, 235 insertions(+)
 create mode 100644 meta-selftest/recipes-test/fit-image-test/files/dt-fake=
.dtb
 create mode 100644 meta-selftest/recipes-test/fit-image-test/files/zImage-=
fake
 create mode 100644 meta-selftest/recipes-test/fit-image-test/fit-image-tes=
t.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/fit_image.py

diff --git a/meta-selftest/recipes-test/fit-image-test/files/dt-fake.dtb b/=
meta-selftest/recipes-test/fit-image-test/files/dt-fake.dtb
new file mode 100644
index 0000000000..7fa871ff00
--- /dev/null
+++ b/meta-selftest/recipes-test/fit-image-test/files/dt-fake.dtb
@@ -0,0 +1,3 @@
+Z=EF=BF=BD=1A=EE=AC=82P=EF=BF=BDacn=0F=EF=BF=BDZWD1\=EF=BF=BD=0B!=CE=84=EF=
=BF=BDl=EF=BF=BDV=06
+t(=EF=BF=BD=EF=BF=BDH=EF=BF=BD=15=EF=BF=BD=01=EF=BF=BD=EF=BF=BDz=EF=BF=BD=
=EF=BF=BDjb4.=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=81=EF=BF=BD=15W;I=EF=BF=BD=C6=
=B6=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDe=EF=BF=BD=EF=BF=BD=13=EF=
=BF=BD=C3=91=EF=BF=BD5=EF=BF=BD=03x=EF=BF=BD=1D&=16=EF=BF=BD9,=EF=BF=BD=EF=
=BF=BDg
+=EF=BF=BD;=02=EF=BF=BD=EF=BF=BD=EF=BF=BD!c=17V
diff --git a/meta-selftest/recipes-test/fit-image-test/files/zImage-fake b/=
meta-selftest/recipes-test/fit-image-test/files/zImage-fake
new file mode 100644
index 0000000000..7fa871ff00
--- /dev/null
+++ b/meta-selftest/recipes-test/fit-image-test/files/zImage-fake
@@ -0,0 +1,3 @@
+Z=EF=BF=BD=1A=EE=AC=82P=EF=BF=BDacn=0F=EF=BF=BDZWD1\=EF=BF=BD=0B!=CE=84=EF=
=BF=BDl=EF=BF=BDV=06
+t(=EF=BF=BD=EF=BF=BDH=EF=BF=BD=15=EF=BF=BD=01=EF=BF=BD=EF=BF=BDz=EF=BF=BD=
=EF=BF=BDjb4.=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=81=EF=BF=BD=15W;I=EF=BF=BD=C6=
=B6=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDe=EF=BF=BD=EF=BF=BD=13=EF=
=BF=BD=C3=91=EF=BF=BD5=EF=BF=BD=03x=EF=BF=BD=1D&=16=EF=BF=BD9,=EF=BF=BD=EF=
=BF=BDg
+=EF=BF=BD;=02=EF=BF=BD=EF=BF=BD=EF=BF=BD!c=17V
diff --git a/meta-selftest/recipes-test/fit-image-test/fit-image-test.bb b/=
meta-selftest/recipes-test/fit-image-test/fit-image-test.bb
new file mode 100644
index 0000000000..c7f325ec8a
--- /dev/null
+++ b/meta-selftest/recipes-test/fit-image-test/fit-image-test.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Recipe for testing the fit_image bbclass"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+DEPENDS +=3D "\
+    python3-fdt-native \
+"
+
+SRC_URI =3D "\
+    file://zImage-fake \
+    file://dt-fake.dtb \
+"
+
+inherit fit_image
+
+include test_recipe.inc
+
diff --git a/meta/lib/oeqa/selftest/cases/fit_image.py b/meta/lib/oeqa/self=
test/cases/fit_image.py
new file mode 100644
index 0000000000..866e48b20e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/fit_image.py
@@ -0,0 +1,212 @@
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, bitbake, get_bb_vars
+
+class FitImage(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(FitImage, cls).setUpClass()
+        cls.recipe_name =3D 'fit-image-test'
+        cls.build_dir =3D get_bb_var('B', cls.recipe_name)
+        cls.fit_blob_path =3D os.path.join(cls.build_dir, 'image-fit.itb')
+
+        bitbake('python3-fdt-native')
+        fdt_sitepackage=3Dget_bb_var("S", "python3-fdt-native")
+        os.sys.path.append(fdt_sitepackage)
+        import fdt
+
+        bitbake('{recipe_name} -c cleanall'.format(recipe_name=3Dcls.recip=
e_name))
+
+    @classmethod
+    def tearDownClass(cls):
+        bitbake('{recipe_name} -c cleanall'.format(recipe_name=3Dcls.recip=
e_name))
+        super(FitImage, cls).tearDownClass()
+
+    def _get_fit_configuration(self):
+        configuration =3D """
+KERNEL_IMAGE_NODE[name] =3D "kernel"
+KERNEL_IMAGE_NODE[description] =3D "${PF}"
+KERNEL_IMAGE_NODE[data] =3D '/incbin/("${WORKDIR}/zImage-fake")'
+KERNEL_IMAGE_NODE[type] =3D "kernel"
+KERNEL_IMAGE_NODE[arch] =3D "arm"
+KERNEL_IMAGE_NODE[os] =3D "linux"
+KERNEL_IMAGE_NODE[compression] =3D "none"
+KERNEL_IMAGE_NODE[load] =3D "0x84000000"
+KERNEL_IMAGE_NODE[entry] =3D "0x84000000"
+KERNEL_IMAGE_NODE[hash] =3D "sha256"
+
+FDT_IMAGE_NODE[name] =3D "fdt"
+FDT_IMAGE_NODE[description] =3D "FDT blob"
+FDT_IMAGE_NODE[data] =3D '/incbin/("${WORKDIR}/dt-fake.dtb")'
+FDT_IMAGE_NODE[type] =3D "flat_dt"
+FDT_IMAGE_NODE[arch] =3D "arm"
+FDT_IMAGE_NODE[compression] =3D "none"
+FDT_IMAGE_NODE[hash] =3D "sha256"
+
+CONF1_CONF_NODE[name] =3D "conf"
+CONF1_CONF_NODE[description] =3D "Linux kernel and FDT blob"
+CONF1_CONF_NODE[kernel] =3D "kernel"
+CONF1_CONF_NODE[fdt] =3D "fdt"
+
+FIT_IMAGES_NODE =3D "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
+FIT_CONFIGURATIONS_NODE =3D "CONF1_CONF_NODE"
+FIT_CONFIGURATIONS_NODE[default] =3D "${@d.getVarFlag('CONF1_CONF_NODE', '=
name') or ""}"
+"""
+        return configuration
+
+    def setUp(self):
+        super(FitImage, self).setUp()
+        self.write_recipeinc(self.recipe_name, self._get_fit_configuration=
())
+
+    def tearDown(self):
+        self.delete_recipeinc(self.recipe_name)
+        super(FitImage, self).tearDown()
+
+    def test_fit_source_is_generated_correctly(self):
+        ret =3D bitbake("{recipe} -D -f -c generate_fit_image".format(reci=
pe=3Dself.recipe_name)).output
+        self.logger.info('HN {log}'.format(log=3Dret))
+
+    def test_fit_blob_is_generated_successfully(self):
+        """
+        Summary:     Able to apply a single patch to the Linux kernel sour=
ce
+        Expected:    The README file should exist and the patch changes sh=
ould be
+                     displayed at the end of the file.
+        Product:     Kernel Development
+        Author:      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
+        AutomatedBy: Mazliana Mohamad <mazliana.mohamad@intel.com>
+        """
+
+        bitbake("{recipe} -c generate_fit_image".format(recipe=3Dself.reci=
pe_name))
+        self.assertExists(self.fit_blob_path, "FIT Blob not generated")
+
+    def test_that_fit_blob_name_is_configurable(self):
+        """
+        Summary:     Able to apply a single patch to the Linux kernel sour=
ce
+        Expected:    The README file should exist and the patch changes sh=
ould be
+                     displayed at the end of the file.
+        """
+        fit_image_name =3D "custom-fit-blob-name"
+        fit_blob_path =3D os.path.join(self.build_dir, "{name}.itb".format=
(name=3Dfit_image_name))
+
+        self.append_recipeinc(self.recipe_name, 'FIT_IMAGE_FILENAME =3D "{=
name}"'.format(name=3Dfit_image_name))
+        bitbake("{recipe} -c generate_fit_image".format(recipe=3Dself.reci=
pe_name))
+
+        self.assertExists(fit_blob_path, "FIT Blob not generated")
+
+    def _fail_when_property_missing(self, property):
+        self.remove_recipeinc(self.recipe_name, property)
+        with self.assertRaises(AssertionError):
+            ret =3D bitbake("{recipe} -f -c generate_fit_image".format(rec=
ipe=3Dself.recipe_name))
+
+    def test_fail_when_image_node_name_property_missing(self):
+        self._fail_when_property_missing('KERNEL_IMAGE_NODE[name] =3D "ker=
nel"')
+
+    def test_fail_when_image_node_description_property_missing(self):
+        self._fail_when_property_missing('KERNEL_IMAGE_NODE[description] =
=3D "${PF}"')
+
+    def test_fail_when_image_node_data_property_missing(self):
+        self._fail_when_property_missing('KERNEL_IMAGE_NODE[data] =3D \'/i=
ncbin/("${WORKDIR}/zImage-fake")\'')
+
+    def test_fail_when_image_node_compression_property_missing(self):
+        self._fail_when_property_missing('KERNEL_IMAGE_NODE[type] =3D "ker=
nel"')
+
+    def test_fail_when_conf_node_name_property_missing(self):
+        self._fail_when_property_missing('CONF1_CONF_NODE[name] =3D "conf"=
')
+
+    def test_fail_when_conf_node_description_property_missing(self):
+        self._fail_when_property_missing('CONF1_CONF_NODE[description] =3D=
 "Linux kernel and FDT blob"')
+
+    def test_that_number_of_nodes_is_correct(self):
+        pass
+
+    def _extract_fit_source(self, text):
+        import re
+        mylines =3D []
+        copy =3D False
+
+        for myline in text:
+            if re.match('^DEBUG:.+', myline):
+                copy =3D False
+
+            if copy:
+                mylines.append(myline.rstrip('\r\n').strip())
+
+            if re.match('^DEBUG:.+do_generate_fit_image: Generated FIT sou=
rce is:$', myline):
+                copy =3D True
+
+        sf =3D ''.join(mylines)
+        self.logger.info('LOG: {log}\nFIT SOURCE {sf}'.format(log=3Dtext, =
sf=3Dsf))
+
+    def _verify_node(self, var_name, path, properties):
+        import fdt
+
+        # I'm creating variables in the recipe that contain the flags valu=
e.
+        # I wasn't able to find a better way to read a flag of a variable =
in the test.
+        for p in properties:
+            self.append_recipeinc(
+                self.recipe_name, 'FIT_IMAGE_TEST_{pu} =3D "${{@d.getVarFl=
ag(\'{var}\', \'{p}\')}}"'.format(
+                    pu=3Dp.upper(), p=3Dp, var=3Dvar_name))
+
+        ret =3D bitbake("{recipe} -D -c generate_fit_image".format(recipe=
=3Dself.recipe_name))
+        self._extract_fit_source(ret.output)
+
+        with open(self.fit_blob_path, 'rb') as fb:
+            fit_blob =3D fb.read()
+
+        dt =3D fdt.parse_dtb(fit_blob)
+
+        try:
+            node =3D dt.get_node(path)
+        except ValueError:
+            self.assertTrue(False, '{node} node not generated'.format(node=
=3Dpath))
+
+        node_flags =3D get_bb_vars(['FIT_IMAGE_TEST_{p}'.format(p=3Dp.uppe=
r()) for p in properties],
+            self.recipe_name)
+
+        for p in properties:
+            self.assertTrue(
+                node.exist_property(p),
+                'Missing property {p} from node {n}'.format(p=3Dp.upper(),=
 n=3Dpath))
+
+            self.assertTrue(
+                node_flags['FIT_IMAGE_TEST_{p}'.format(p=3Dp.upper())],
+                node.get_property(p))
+
+
+    def _verify_image_node(self, var_name, name, properties):
+        self._verify_node(var_name, 'images/{name}'.format(name=3Dname), p=
roperties)
+
+    def _verify_config_node(self, var_name, name, properties):
+        self._verify_node(var_name, 'configurations/{name}'.format(name=3D=
name), properties)
+
+    def test_that_kernel_node_is_generated_successfully(self):
+        properties =3D [
+            'description',
+            'data',
+            'type',
+            'arch',
+            'os',
+            'compression',
+            'load',
+            'entry'
+        ]
+        self._verify_image_node('KERNEL_IMAGE_NODE', 'kernel', properties)
+
+    def test_that_fdt_node_is_generated_successfully(self):
+        properties =3D [
+            'description',
+            'data',
+            'type',
+            'arch',
+            'compression'
+        ]
+        self._verify_image_node('FDT_IMAGE_NODE', 'fdt', properties)
+
+    def test_that_conf_node_is_generated_successfully(self):
+        properties =3D [
+            'description',
+            'kernel',
+            'fdt'
+        ]
+        self._verify_config_node('CONF1_CONF_NODE', 'conf', properties)
--=20
2.24.1

