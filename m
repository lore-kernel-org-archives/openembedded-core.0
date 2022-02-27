Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4398C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:21:53 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.11277.1645986109595854669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 10:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=eOBKJdkP;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986110;
  x=1677522110;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kgP3lPjKo1hYoRFg+tmvmSl3W0eyGMcxuz0b4fBbfFY=;
  b=eOBKJdkPFRSCZ/f2S4KTAE//wJnQFAHSRPY9HS3AXkF7zYZJxpA1AHq3
   wpeSPJSjlJnwv/uufywVEoOZB+tRg6cGnGvPqBa1XvFbYepzrrFYMRX0b
   vO//O8VZgAuEooCSzNIYFNseiXxhtfXvsTWOXe+sKPQ8I93SeXTb+rVi1
   DDrrSSiVdH3u96H8kufaUwnKpz9Ptwu8BAVR62YBYiGA3VesoKPe6bHGz
   FZV+UWnkMAO3by0AYCQa5Jr/gOsc4C19nlobOw7xcD6mok0LFWvKTiaLJ
   CTZ6voD4bky7A4sapmvPl+bRLMczApzQkH8DdKTbeCmsSuXI/gBGpBRSG
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/6] recipetool: Use SPDX license identifiers
Date: Sun, 27 Feb 2022 19:21:35 +0100
Message-ID: <20220227182138.5364-4-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
References: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 18:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162443

There are still a couple of cases where the license may be set as, e.g.,
"GPL" or "GPL-2.0" since there is not enough information to decide the
actual SPDX license. It is then assumed that the developer will have to
correct the information.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py       |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |  8 +--
 scripts/lib/recipetool/create.py              | 12 ++--
 .../lib/recipetool/create_buildsys_python.py  | 22 +++----
 scripts/lib/recipetool/licenses.csv           | 66 +++++++++----------
 6 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 35ad9f3cd6..cfac7afcf4 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -224,7 +224,7 @@ INHERIT:remove = \"report-error\"
         self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
     def test_non_gplv3(self):
-        self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
+        self.write_config('INCOMPATIBLE_LICENSE = "GPL-3.0-or-later"')
         result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 23d55903fb..e910672c31 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -343,7 +343,7 @@ class DevtoolAddTests(DevtoolBase):
         self.assertIn(srcdir, result.output)
         self.assertIn(recipefile, result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'GPLv2'
+        checkvars['LICENSE'] = 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '0.1+git${SRCPV}'
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index a5fe4084b4..ca3cf8942d 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -343,7 +343,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = 'GPLv2'
+        checkvars['LICENSE'] = 'GPL-2.0'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/releases/download/${PV}/logrotate-${PV}.tar.xz'
         checkvars['SRC_URI[md5sum]'] = 'a560c57fac87c45b2fc17406cdf79288'
@@ -363,7 +363,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'LGPLv2.1'
+        checkvars['LICENSE'] = 'LGPL-2.1'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.11+git${SRCPV}'
@@ -386,7 +386,7 @@ class RecipetoolCreateTests(RecipetoolBase):
             self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
         self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPLv2'])
+        checkvars['LICENSE'] = set(['Unknown', 'GPL-2.0'])
         checkvars['LIC_FILES_CHKSUM'] = set(['file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'])
         # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
         checkvars['S'] = None
@@ -402,7 +402,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['LGPLv2.1', 'MPL-1.1'])
+        checkvars['LICENSE'] = set(['LGPL-2.1', 'MPL-1.1'])
         checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
         checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4cf6a5a95c..0b5d5466ba 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1080,7 +1080,7 @@ def crunch_license(licfile):
 
     # common licenses
     crunched_md5sums['89f3bf322f30a1dcfe952e09945842f0'] = 'Apache-2.0'
-    crunched_md5sums['13b6fe3075f8f42f2270a748965bf3a1'] = 'BSD-0-Clause'
+    crunched_md5sums['13b6fe3075f8f42f2270a748965bf3a1'] = '0BSD'
     crunched_md5sums['ba87a7d7c20719c8df4b8beed9b78c43'] = 'BSD-2-Clause'
     crunched_md5sums['7f8892c03b72de419c27be4ebfa253f8'] = 'BSD-3-Clause'
     crunched_md5sums['21128c0790b23a8a9f9e260d5f6b3619'] = 'BSL-1.0'
@@ -1108,15 +1108,15 @@ def crunch_license(licfile):
     # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
     crunched_md5sums['50fab24ce589d69af8964fdbfe414c60'] = 'BSD-2-Clause'
     # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
-    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] = 'GPLv2'
+    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] = 'GPL-2.0'
     # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
-    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] = 'GPLv2'
+    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] = 'GPL-2.0'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
-    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] = 'LGPLv2.1'
+    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] = 'LGPL-2.1'
     # unixODBC-2.3.4 COPYING
-    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] = 'LGPLv2.1'
+    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] = 'LGPL-2.1'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
-    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] = 'LGPLv3'
+    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] = 'LGPL-3.0'
     # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v10
     crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] = 'EPL-1.0'
 
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 2a2c6ab6b6..f4f51c88b4 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -112,18 +112,18 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: European Union Public Licence 1.0 (EUPL 1.0)': 'EUPL-1.0',
         'License :: OSI Approved :: European Union Public Licence 1.1 (EUPL 1.1)': 'EUPL-1.1',
         'License :: OSI Approved :: European Union Public Licence 1.2 (EUPL 1.2)': 'EUPL-1.2',
-        'License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)': 'AGPL-3.0+',
-        'License :: OSI Approved :: GNU Affero General Public License v3': 'AGPL-3.0',
+        'License :: OSI Approved :: GNU Affero General Public License v3': 'AGPL-3.0-only',
+        'License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)': 'AGPL-3.0-or-later',
         'License :: OSI Approved :: GNU Free Documentation License (FDL)': 'GFDL',
         'License :: OSI Approved :: GNU General Public License (GPL)': 'GPL',
-        'License :: OSI Approved :: GNU General Public License v2 (GPLv2)': 'GPL-2.0',
-        'License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)': 'GPL-2.0+',
-        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)': 'GPL-3.0',
-        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)': 'GPL-3.0+',
-        'License :: OSI Approved :: GNU Lesser General Public License v2 (LGPLv2)': 'LGPL-2.0',
-        'License :: OSI Approved :: GNU Lesser General Public License v2 or later (LGPLv2+)': 'LGPL-2.0+',
-        'License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)': 'LGPL-3.0',
-        'License :: OSI Approved :: GNU Lesser General Public License v3 or later (LGPLv3+)': 'LGPL-3.0+',
+        'License :: OSI Approved :: GNU General Public License v2 (GPLv2)': 'GPL-2.0-only',
+        'License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)': 'GPL-2.0-or-later',
+        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)': 'GPL-3.0-only',
+        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)': 'GPL-3.0-or-later',
+        'License :: OSI Approved :: GNU Lesser General Public License v2 (LGPLv2)': 'LGPL-2.0-only',
+        'License :: OSI Approved :: GNU Lesser General Public License v2 or later (LGPLv2+)': 'LGPL-2.0-or-later',
+        'License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)': 'LGPL-3.0-only',
+        'License :: OSI Approved :: GNU Lesser General Public License v3 or later (LGPLv3+)': 'LGPL-3.0-or-later',
         'License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)': 'LGPL',
         'License :: OSI Approved :: Historical Permission Notice and Disclaimer (HPND)': 'HPND',
         'License :: OSI Approved :: IBM Public License': 'IPL',
@@ -144,7 +144,7 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: Open Software License 3.0 (OSL-3.0)': 'OSL-3.0',
         'License :: OSI Approved :: PostgreSQL License': 'PostgreSQL',
         'License :: OSI Approved :: Python License (CNRI Python License)': 'CNRI-Python',
-        'License :: OSI Approved :: Python Software Foundation License': 'PSF',
+        'License :: OSI Approved :: Python Software Foundation License': 'PSF-2.0',
         'License :: OSI Approved :: Qt Public License (QPL)': 'QPL',
         'License :: OSI Approved :: Ricoh Source Code Public License': 'RSCPL',
         'License :: OSI Approved :: SIL Open Font License 1.1 (OFL-1.1)': 'OFL-1.1',
diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool/licenses.csv
index 0d3fb0607b..2a8fdfac05 100644
--- a/scripts/lib/recipetool/licenses.csv
+++ b/scripts/lib/recipetool/licenses.csv
@@ -1,37 +1,37 @@
-0636e73ff0215e8d672dc4c32c317bb3,GPLv2
-12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPLv2
-18810669f13b87348459e611d31ab760,GPLv2
-252890d9eee26aab7b432e8b8a616475,LGPLv2
-2d5025d4aa3495befef8f17206a5b0a1,LGPLv2.1
-3214f080875748938ba060314b4f727d,LGPLv2
+0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0
+12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0
+18810669f13b87348459e611d31ab760,GPL-2.0
+252890d9eee26aab7b432e8b8a616475,LGPL-2.0
+2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1
+3214f080875748938ba060314b4f727d,LGPL-2.0
 385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0
-393a5ca445f6965873eca0259a17f833,GPLv2
+393a5ca445f6965873eca0259a17f833,GPL-2.0
 3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
-3bf50002aefd002f49e7bb854063f7e7,LGPLv2
-4325afd396febcb659c36b49533135d4,GPLv2
-4fbd65380cdd255951079008b364516c,LGPLv2.1
+3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0
+4325afd396febcb659c36b49533135d4,GPL-2.0
+4fbd65380cdd255951079008b364516c,LGPL-2.1
 54c7042be62e169199200bc6477f04d1,BSD-3-Clause
-55ca817ccb7d5b5b66355690e9abc605,LGPLv2
-59530bdf33659b29e73d4adb9f9f6552,GPLv2
-5f30f0716dfdd0d91eb439ebec522ec2,LGPLv2
-6a6a8e020838b23406c81b19c1d46df6,LGPLv3
-751419260aa954499f7abaabaa882bbe,GPLv2
-7fbc338309ac38fefcd64b04bb903e34,LGPLv2.1
-8ca43cbc842c2336e835926c2166c28b,GPLv2
-94d55d512a9ba36caa9b7df079bae19f,GPLv2
-9ac2e7cff1ddaf48b6eab6028f23ef88,GPLv2
-9f604d8a4f8e74f4f5140845a21b6674,LGPLv2
-a6f89e2100d9b6cdffcea4f398e37343,LGPLv2.1
-b234ee4d69f5fce4486a80fdaf4a4263,GPLv2
-bbb461211a33b134d42ed5ee802b37ff,LGPLv2.1
+55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0
+59530bdf33659b29e73d4adb9f9f6552,GPL-2.0
+5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0
+6a6a8e020838b23406c81b19c1d46df6,LGPL-3
+751419260aa954499f7abaabaa882bbe,GPL-2.0
+7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1
+8ca43cbc842c2336e835926c2166c28b,GPL-2.0
+94d55d512a9ba36caa9b7df079bae19f,GPL-2.0
+9ac2e7cff1ddaf48b6eab6028f23ef88,GPL-2.0
+9f604d8a4f8e74f4f5140845a21b6674,LGPL-2.0
+a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1
+b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0
+bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1
 bfe1f75d606912a4111c90743d6c7325,MPL-1.1
-c93c0550bd3173f4504b2cbd8991e50b,GPLv2
-d32239bcb673463ab874e80d47fae504,GPLv3
-d7810fab7487fb0aad327b76f1be7cd7,GPLv2
-d8045f3b8f929c1cb29a1e3fd737b499,LGPLv2.1
-db979804f025cf55aabec7129cb671ed,LGPLv2
-eb723b61539feef013de476e68b5c50a,GPLv2
-ebb5c50ab7cab4baeffba14977030c07,GPLv2
-f27defe1e96c2e1ecd4e0c9be8967949,GPLv3
-fad9b3332be894bab9bc501572864b29,LGPLv2.1
-fbc093901857fcd118f065f900982c24,LGPLv2.1
+c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0
+d32239bcb673463ab874e80d47fae504,GPL-3.0
+d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0
+d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1
+db979804f025cf55aabec7129cb671ed,LGPL-2.0
+eb723b61539feef013de476e68b5c50a,GPL-2.0
+ebb5c50ab7cab4baeffba14977030c07,GPL-2.0
+f27defe1e96c2e1ecd4e0c9be8967949,GPL-3.0
+fad9b3332be894bab9bc501572864b29,LGPL-2.1
+fbc093901857fcd118f065f900982c24,LGPL-2.1

