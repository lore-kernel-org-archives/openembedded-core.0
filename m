Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D501AC4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:39:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.12796.1636468740845062503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229916003"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229916003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956950"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 23/26] meta/scripts: Manual git url branch additions
Date: Tue,  9 Nov 2021 22:37:58 +0800
Message-Id: 
 <467aa56b8773e8dd2e8e29936684606d5e291888.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:39:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158043

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
index f91df632d5..fb0f1097da 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -53,5 +53,5 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # The CONNECTIVITY_CHECK_URIS are used to test whether we can succesfully
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
-# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
+# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f495e84c79..d2b31af80e 100644
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
index c2a53815d0..8dc00ac10e 100644
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
index 874f439282..7e0ed0dac1 100644
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
index 5cd72ea0a7..a6607b97c6 100644
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
2.31.1


