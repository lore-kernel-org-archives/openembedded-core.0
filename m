Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4EBC79FAC
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:03:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21342.1788728596220245324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DGZTPYNd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260906210314ed93242e4400020788-jzs8lb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260906210314ed93242e4400020788
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Sep 2026 23:03:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=y4/o320ZnJGz8ndz7TqwxLbxosK772fsbOZ/LTHTpQ4=;
 b=DGZTPYNdY+VzgeaAT08KV7hG3vBwHjkuHdUdSigJcw615/DIzjJH+AQ8LjEB2VCb3mvrRm
 TG2/TcZTXORLhMyJn0SfcLpObxq1XF0RRQ+TQQpgpsqKoZcPJ6BXlZDXkGZJl0U2GnZoKVAS
 VWYY+Sf7m21l7OgN4EtWBQ4Rebj3R+O1Tf1tR4F82jahsLVw033QzroILAi0yL2VA7YXyXU9
 /CG8wIGJsrV0SZrWOz+XfIfNjXQihWHKsuO1EOSc7YPy+/bSpyL+r3QKpAgVhXiF9G5kuYVc
 ls+xTxGs9CK8DCHbm7/0ELkLe4RTnwCGRRC4PLnNi2Wowr++NzpZKO0w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 8/9] devtool: deploy: make pseudo calls independent of bitbake.conf
Date: Sun,  6 Sep 2026 23:02:06 +0200
Message-ID: <20260906210307.2793974-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
References: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 21:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245211

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Relying on bitbake.conf's global PSEUDO_INCLUDE_PATHS to cover the
stripped-copy directory is fragile, and will only get more fragile as
devtool deploy learns to deploy to more kinds of places. Add an
env_overrides parameter to exec_fakeroot_no_d() and use it to state
PSEUDO_INCLUDE_PATHS explicitly for each pseudo call in the --strip
path, so bitbake.conf no longer needs a devtool-specific entry.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf          |  2 +-
 scripts/lib/devtool/__init__.py | 11 ++++++++++-
 scripts/lib/devtool/deploy.py   | 11 +++++++----
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 63d84cf37b..a21223e216 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -752,7 +752,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 58b02eb460..32a7bc0098 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -77,7 +77,14 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
-def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, **kwargs):
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, env_overrides=None, **kwargs):
+    """Run cmd under pseudo using a recipe's own FAKEROOTCMD/FAKEROOTENV.
+
+    env_overrides, if given, is applied after fakerootenv so callers can point
+    pseudo at a different database/allow-list, e.g. a target rootfs's own
+    PSEUDO_LOCALSTATEDIR/PSEUDO_INCLUDE_PATHS instead of the ambient ones from
+    FAKEROOTENV.
+    """
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
@@ -88,6 +95,8 @@ def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, **kwargs):
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
             newenv[splitval[0]] = splitval[1]
+    if env_overrides:
+        newenv.update(env_overrides)
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
 def setup_tinfoil(config_only=False, basepath=None, tracking=False):
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d11b04aea2..7a83d4a23a 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -277,8 +277,10 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         srcdir = recipe_outdir
         recipe_outdir = os.path.join(workdir, 'devtool-deploy-target-stripped')
         if os.path.isdir(recipe_outdir):
-            exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
-        exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+            exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir,
+                                env_overrides={'PSEUDO_INCLUDE_PATHS': recipe_outdir}, shell=True)
+        exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir),
+                            env_overrides={'PSEUDO_INCLUDE_PATHS': '%s,%s' % (srcdir, recipe_outdir)}, shell=True)
 
         # Strip under pseudo so that it records any inode replacements made by
         # the strip tool before the deployment tar reads this directory.
@@ -292,7 +294,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         ret = exec_fakeroot_no_d(
             fakerootcmd, fakerootenv, path,
             '%s -c %s' % (shlex.quote(sys.executable), shlex.quote(strip_script)),
-            shell=True)
+            env_overrides={'PSEUDO_INCLUDE_PATHS': recipe_outdir}, shell=True)
         if ret != 0:
             raise DevtoolError('Failed to strip files for deployment')
 
@@ -418,7 +420,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         remote_cmd = '%s | %s  %s %s %s \'sh %s %s %s %s\'' % (
             tar_cmd, ssh_sshexec, ssh_port, extraoptions, args.target,
             tmpscript, args.recipename, destdir, tmpfilelist)
-        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, remote_cmd, cwd=recipe_outdir, shell=True)
+        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, remote_cmd, cwd=recipe_outdir,
+                                env_overrides={'PSEUDO_INCLUDE_PATHS': recipe_outdir}, shell=True)
     finally:
         if tar_filelist_path:
             os.remove(tar_filelist_path)
-- 
2.55.0


