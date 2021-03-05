Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: H//u7AU6qIAYm5oOiQlIjqpRqJ/hmLL/+APCRi4VQy0qMCLJ6Eml3uZ1+HP9kzACWAqGFPzOAt
 pGXywFyJud4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671110"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671110"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:41 -0800
IronPort-SDR: 8DoTF7ih21vQ0OKSUx9a0LSz3meJ+18zz8lTxPPAgqd4FL3z+afHPpGXghDN2HRb9DVsg/oMuv
 WZUaznPF61ZQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128979"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 32/52] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Date: Fri,  5 Mar 2021 12:21:08 +0800
Message-Id: <69ab66643691891fccd89b5719094197cb5c82ab.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* not sure if there are some valid use-cases for missing manifest, but
  recently I'm seeing increasing number of build failures where something
  from native recipe is missing (seen it with pseudo, autoconf, nodejs
  recently) and the only indication that something is wrong (before showing
  sometimes misleading error like:
  recipe-sysroot-native/usr/bin/node: No such file or directory
  is this warning:
  NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
  NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Started
  WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
  NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_unpack)
  NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
  WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
  NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Succeeded

  if I rebuild that native dependency, then it gets fixed and I don't
  see these failures in clean builds (as without sstate and with empty
  TMPDIR), only in incremental builds

* but if there isn't valid reason for missing manifest file, then I think
  it would be better to error early (or even bb.fatal())

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95607a26854d873399d2b9d7e5fcbffc0cbdba4c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 31a6140984..0d53132866 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -458,7 +458,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.29.2

