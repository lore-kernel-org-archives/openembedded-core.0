Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B31BC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649314"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649314"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567024048"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/14] meta/scripts: Manual git url branch
 additions
Date: Tue, 16 Nov 2021 11:24:18 +0800
Message-Id: 
 <87ac0c0a643cca436784dfcd86472adcf2e04130.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158335

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Following the scripted conversion adding branches to git://
SRC_URI entries, add the remaining references, mainly in the selftests
and recipetool.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5340c0d688036c1be6c938f05d8a8c1e3b49ec38)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py         | 4 ++--
 meta/lib/oeqa/selftest/cases/recipetool.py      | 6 +++---
 meta/lib/oeqa/selftest/cases/sstatetests.py     | 2 +-
 scripts/lib/recipetool/create.py                | 3 +++
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..0240589c81 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -47,5 +47,5 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # The CONNECTIVITY_CHECK_URIS are used to test whether we can succesfully
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
-# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
+# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3385546e8e..66e326253e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -340,7 +340,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '0.1+git${SRCPV}'
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
@@ -904,7 +904,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
-        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"']
         srcurilines = src_uri.split()
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
         srcurilines.append('"')
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 9d56e9e1e3..3621492998 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -357,7 +357,7 @@ class RecipetoolTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        srcuri = 'git://git.yoctoproject.org/libmatchbox;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
@@ -447,7 +447,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=master'
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -514,7 +514,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['GPLv2'])
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http;branch=master'
         inherits = ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index c46e8ba489..e2fe38be87 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -39,7 +39,7 @@ class SStateTests(SStateBase):
 
         recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
         os.makedirs(os.path.dirname(recipefile))
-        srcuri = 'git://' + srcdir + ';protocol=file'
+        srcuri = 'git://' + srcdir + ';protocol=file;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 566c75369a..116bdfd697 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,6 +389,9 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
+        # We assume 'master' branch if not set
+        if not 'branch' in parms:
+            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
         return fUrl
-- 
2.33.1


