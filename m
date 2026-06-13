Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2B5CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:56:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90502.1781355352849117165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b0YvBuZV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso21237925e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781355351; x=1781960151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wL//3dZcX+DE3IZhNHBLm/vhey8MMaL8CKsIfzavp8E=;
        b=b0YvBuZVqdf9kuPbgZ6z2NiC3brF7Pm81JvyijtgnBHbll/CU4omOmAPXNn5mg6ocl
         0O/d3bZVHSlcKoG65mVVic/4O1vY0+T7ayllBrVbuRy8MdAdWi+Ei/n3pm8AQlXBI5up
         tXIi04bh1btMotZXxNKwaGnEmHjaBKaA6E2J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781355351; x=1781960151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wL//3dZcX+DE3IZhNHBLm/vhey8MMaL8CKsIfzavp8E=;
        b=n+H+7vOpwmjh4yoOu9NH3CHzkEzgM8fmQYoawmSCXkECkiz9UX+7+wTxcSCKq0Mf/p
         w88ffw1AULpeU1zScwnMlz6rYknGBqYdXp92d7q8DWSLtPy3r4G8nIvhbhoXfvngw+Wt
         aHMVPRDobU3eTVPCN0I3mmkZwXuZBeRGx+5BwUO1QCezZWyQZMvLujnJTqTxHNWsYpWc
         9SFSH7G/K9isYm13TJMG1OnkshIRN+f6xFyDIC8MSM6XKSWze6P6+Xzg5MtHfM+ru2FZ
         qSeFjLVL+ShRhGIK6qHklIp/MRWyBun81PVfwiD651K2vZB1/QVOjBKX7PiYwYi5T1IY
         rY/g==
X-Gm-Message-State: AOJu0YwgcXV/zixvVLD2Q0+e7GCUXS/S1f+z+QtHhH0Umc6Gt2W8mOBe
	wS2kX30wLbxTwZv1JSL79P55zkq+jOIsGcLwXgABpOsaM/htSwNpu262cNacJWNE898A9i2Usoa
	4hxba
X-Gm-Gg: Acq92OGG8iqNLjrpBPPQITS/KMiSK4lTSsang3oakeQP5GDeRY7C6qci0zKlR5Y/k2x
	PSyDf/eRd+TKIKksnWThi0XYiifueyrPS9nI/CpnDhvqLxYw145UakmHkqnKH3tKZFT70MhWEU3
	BP+NngsHkrY8IQOS2+O9FkeIndHOmm8y74z9bSEYqaaIM5+EVyDC92JhQYXE8eSfSJ+UDFe/t0q
	RCaMQZzpqEjzbQrFTOZZ/+NA3hKccSaTEDr0xm3sLMTh5e03QfvS151nyvGmn3Gv0oovDGpYFKH
	jUrZk/KVXqtOrMXcoILzxaExIjaR+fcEwySIwoPAEIYa4PMtLxudJReV9GXNpgOCjTW8UQ6E9uJ
	tu6fIrgjlidzm6TXh9TRZkZjr1nh/0h82H+rw5y049nQTekcf/qVJqTZZ3IJbMNpBqP9txToDqf
	nujtH5CiruZJ4Nu9P5NthtXeGiYgxBekhg9IAyGSQV7oQi8WL5AyF+
X-Received: by 2002:a05:6000:4024:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4606dbdf9bcmr10104121f8f.22.1781355349846;
        Sat, 13 Jun 2026 05:55:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4437:5798:e78b:2888])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm15571002f8f.20.2026.06.13.05.55.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:55:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/lib: Start to covert strings to lists of command parameters
Date: Sat, 13 Jun 2026 13:55:47 +0100
Message-ID: <20260613125547.3358714-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260613125547.3358714-1-richard.purdie@linuxfoundation.org>
References: <20260613125547.3358714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 12:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238680

To follow best practises and avoid shell=True subprocess usage, start to
convert subprocess commands to use lists instead of strings. This improves
variable quoting and models modern coding standards.

In some cases we need to add different exception handling after the removal
of the shell indirection.

Convert some Popen calls to use more modern subprocess wrappers and tweak
the encoding handling to match modern parameters. Environment variables
can be passed through env and current directory via cwd.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass              |  2 +-
 meta/classes-global/patch.bbclass             |  6 +-
 meta/classes-global/sstate.bbclass            |  6 +-
 meta/classes-global/staging.bbclass           |  4 +-
 meta/classes-recipe/barebox.bbclass           |  2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes/archiver.bbclass                 |  9 ++-
 meta/classes/devtool-source.bbclass           | 24 ++++----
 meta/classes/toaster.bbclass                  |  5 +-
 meta/lib/oe/buildcfg.py                       | 21 ++++---
 meta/lib/oe/package_manager/common_deb_ipk.py |  2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |  2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   | 57 +++++++++----------
 meta/lib/oe/path.py                           |  4 +-
 meta/lib/oeqa/runtime/case.py                 |  2 +-
 meta/lib/oeqa/runtime/cases/login.py          | 12 ++--
 meta/lib/oeqa/runtime/cases/multilib.py       |  2 +-
 meta/lib/oeqa/sdkext/testsdk.py               |  2 +-
 meta/lib/oeqa/utils/buildproject.py           |  6 +-
 meta/lib/oeqa/utils/targetbuild.py            | 14 ++---
 .../clang/llvm-project-source.inc             | 25 ++++----
 meta/recipes-devtools/gcc/gcc-source.inc      | 12 ++--
 scripts/lib/devtool/sdk.py                    | 13 +++--
 scripts/lib/recipetool/create.py              |  2 +-
 scripts/lib/recipetool/create_buildsys.py     |  6 +-
 scripts/oe-setup-layers                       | 33 ++++++-----
 scripts/tiny/ksum.py                          |  4 +-
 27 files changed, 141 insertions(+), 138 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0030cdb2ba8..4684dbd60c8 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -117,7 +117,7 @@ def get_lic_checksum_file_list(d):
 def write_ld_wrapper(srctool, desttool):
     wrapper = "#!/bin/sh\n{} --no-rosegment $@".format(srctool)
 
-    stdout, _ = bb.process.run("{} --help".format(srctool))
+    stdout, _ = bb.process.run([srctool, "--help"])
     if "--no-rosegment" in stdout:
         with open(desttool, 'w') as f:
             f.write(wrapper)
diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.bbclass
index 2d9b39c9a55..cefb7e34b47 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -74,10 +74,10 @@ python patch_task_postfunc() {
             if os.path.exists(patchdir):
                 shutil.rmtree(patchdir)
                 if haspatches:
-                    stdout, _ = bb.process.run('git status --porcelain patches', cwd=srcsubdir)
+                    stdout, _ = bb.process.run(['git', 'status', '--porcelain', 'patches'], cwd=srcsubdir)
                     if stdout:
-                        bb.process.run('git checkout patches', cwd=srcsubdir)
-        stdout, _ = bb.process.run('git status --porcelain .', cwd=srcsubdir)
+                        bb.process.run(['git', 'checkout', 'patches'], cwd=srcsubdir)
+        stdout, _ = bb.process.run(['git', 'status', '--porcelain', '.'], cwd=srcsubdir)
         if stdout:
             oe.patch.GitApplyTree.commitIgnored("Add changes from %s" % func, dir=srcsubdir, files=['.'], d=d)
 }
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 90d80b6f282..50dd0e51c43 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -498,7 +498,7 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     if os.path.exists(manifest + ".postrm"):
         import subprocess
         os.chmod(postrm, 0o755)
-        subprocess.check_call(postrm, shell=True)
+        subprocess.check_call([postrm])
         oe.path.remove(postrm)
 
     oe.path.remove(manifest)
@@ -603,7 +603,7 @@ python sstate_hardcode_path () {
     sstate_filelist_cmd = "tee %s" % (fixmefn)
 
     # fixmepath file needs relative paths, drop sstate_builddir prefix
-    sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %s" % (sstate_builddir, fixmefn)
+    sstate_filelist_relative_cmd = ['sed', '-i', '-e', 's:^%s::g' % sstate_builddir, fixmefn]
 
     xargs_no_empty_run_cmd = '--no-run-if-empty'
     if platform.system() == 'Darwin':
@@ -621,7 +621,7 @@ python sstate_hardcode_path () {
         os.remove(fixmefn)
     else:
         bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
-        subprocess.check_output(sstate_filelist_relative_cmd, shell=True)
+        subprocess.check_output(sstate_filelist_relative_cmd)
 }
 
 def sstate_package(ss, d):
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 1bf60cb5cbc..15ed3d002f1 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -246,7 +246,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in sorted(postinsts):
-        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
+        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output([p], stderr=subprocess.STDOUT)))
 
 staging_populate_sysroot_dir[vardepsexclude] += "PACKAGE_EXTRA_ARCHS"
 
@@ -632,7 +632,7 @@ python extend_recipe_sysroot() {
         staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
     for p in sorted(postinsts):
-        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
+        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output([p], stderr=subprocess.STDOUT)))
 
     for dep in manifests:
         c = setscenedeps[dep][0]
diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 73615999aa6..2411fb5caa1 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -37,7 +37,7 @@ export HOST_EXTRACFLAGS
 
 def get_layer_rev(path):
     try:
-        rev, _ = bb.process.run("git describe --match='' --always --dirty --broken", cwd=path)
+        rev, _ = bb.process.run(['git', 'describe', "--match=''", '--always', '--dirty', '--broken'], cwd=path)
     except bb.process.ExecutionError:
         rev = ""
     return rev.strip()
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 422169aa796..c57b60c3961 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -635,7 +635,7 @@ def get_sdk_required_utilities(buildtools_fn, d):
     sanity_required_utilities.append(d.expand('${BUILD_PREFIX}g++'))
     if buildtools_fn:
         buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY'), buildtools_fn)
-        filelist, _ = bb.process.run('%s -l' % buildtools_installer)
+        filelist, _ = bb.process.run([buildtools_installer, '-l'])
     else:
         buildtools_installer = None
         filelist = ""
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 035d0dce0fd..fede565573d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -443,8 +443,8 @@ python do_ar_mirror() {
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
-        cmd = 'cp --force --preserve=timestamps --no-dereference --recursive -H %s %s' % (localpath, destdir)
-        subprocess.check_call(cmd, shell=True)
+        cmd = ['cp', '--force', '--preserve=timestamps', '--no-dereference', '--recursive', '-H', localpath, destdir]
+        subprocess.check_call(cmd)
 }
 
 def create_tarball(d, srcdir, suffix, ar_outdir):
@@ -483,9 +483,8 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     bb.note('Creating %s' % tarname)
     dirname = os.path.dirname(srcdir)
     basename = os.path.basename(srcdir)
-    exclude = "--exclude=temp --exclude=patches --exclude='.pc'"
-    tar_cmd = "tar %s -cf - %s | %s > %s" % (exclude, basename, compression_cmd, tarname)
-    subprocess.check_call(tar_cmd, cwd=dirname, shell=True)
+    tar_cmd = ["tar", "--exclude=temp", "--exclude=patches", "--exclude='.pc'", '-cf', tarname, basename, '-I', compression_cmd]
+    subprocess.check_call(tar_cmd, cwd=dirname)
 
 # creating .diff.gz between source.orig and source
 def create_diff_gz(d, src_orig, src, ar_outdir):
diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index fcc05312034..f29f40588f9 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -107,7 +107,7 @@ python devtool_post_unpack() {
     devbranch = d.getVar('DEVTOOL_DEVBRANCH')
     setup_git_repo(srcsubdir, d.getVar('PV'), devbranch, d=d)
 
-    (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
+    (stdout, _) = bb.process.run(['git', 'rev-parse', 'HEAD'], cwd=srcsubdir)
     initial_rev = stdout.rstrip()
     with open(os.path.join(tempdir, 'initial_rev'), 'w') as f:
         f.write(initial_rev)
@@ -130,7 +130,7 @@ python devtool_post_patch() {
             shutil.rmtree(patches_dir)
         # Restore any "patches" directory that was actually part of the source tree
         try:
-            bb.process.run('git checkout -- patches', cwd=srcsubdir)
+            bb.process.run(['git', 'checkout', '--', 'patches'], cwd=srcsubdir)
         except bb.process.ExecutionError:
             pass
 
@@ -148,7 +148,7 @@ python devtool_post_patch() {
         if default_overrides != no_overrides:
             # Some overrides are active in the current configuration, so
             # we need to create a branch where none of the overrides are active
-            bb.process.run('git checkout %s -b devtool-no-overrides' % initial_rev, cwd=srcsubdir)
+            bb.process.run(['git', 'checkout', initial_rev, '-b', 'devtool-no-overrides'], cwd=srcsubdir)
             # Run do_patch function with the override applied
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
@@ -157,18 +157,18 @@ python devtool_post_patch() {
             rm_patches()
             # Now we need to reconcile the dev branch with the no-overrides one
             # (otherwise we'd likely be left with identical commits that have different hashes)
-            bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
-            bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
+            bb.process.run(['git', 'checkout', devbranch], cwd=srcsubdir)
+            bb.process.run(['git', 'rebase', 'devtool-no-overrides'], cwd=srcsubdir)
         else:
-            bb.process.run('git checkout %s -b devtool-no-overrides' % devbranch, cwd=srcsubdir)
+            bb.process.run(['git', 'checkout', devbranch, '-b', 'devtool-no-overrides'], cwd=srcsubdir)
 
         for override in extra_overrides:
             localdata = bb.data.createCopy(d)
             if override in default_overrides:
-                bb.process.run('git branch devtool-override-%s %s' % (override, devbranch), cwd=srcsubdir)
+                bb.process.run(['git', 'branch', 'devtool-override-' + override, devbranch], cwd=srcsubdir)
             else:
                 # Reset back to the initial commit on a new branch
-                bb.process.run('git checkout %s -b devtool-override-%s' % (initial_rev, override), cwd=srcsubdir)
+                bb.process.run(['git', 'checkout', initial_rev, '-b', 'devtool-override-' + override], cwd=srcsubdir)
                 # Run do_patch function with the override applied
                 localdata.setVar('OVERRIDES', ':'.join(no_overrides + [override]))
                 localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides + [override]))
@@ -176,11 +176,11 @@ python devtool_post_patch() {
                 rm_patches()
                 # Now we need to reconcile the new branch with the no-overrides one
                 # (otherwise we'd likely be left with identical commits that have different hashes)
-                bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
-        bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
-    bb.process.run('git tag -f --no-sign devtool-patched', cwd=srcsubdir)
+                bb.process.run(['git', 'rebase', 'devtool-no-overrides'], cwd=srcsubdir)
+        bb.process.run(['git', 'checkout', devbranch], cwd=srcsubdir)
+    bb.process.run(['git', 'tag', '-f', '--no-sign', 'devtool-patched'], cwd=srcsubdir)
     if os.path.exists(os.path.join(srcsubdir, '.gitmodules')):
-        bb.process.run('git submodule foreach --recursive  "git tag -f --no-sign devtool-patched"', cwd=srcsubdir)
+        bb.process.run(['git', 'submodule', 'foreach', '--recursive', 'git tag -f --no-sign devtool-patched'], cwd=srcsubdir)
 
 }
 
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 10c728885ae..5878230062c 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -32,13 +32,12 @@ python toaster_layerinfo_dumpdata() {
     import subprocess
 
     def _get_git_branch(layer_path):
-        branch = subprocess.Popen("git symbolic-ref HEAD 2>/dev/null ", cwd=layer_path, shell=True, stdout=subprocess.PIPE).communicate()[0]
-        branch = branch.decode('utf-8')
+        branch = subprocess.check_output(['git', 'symbolic-ref', 'HEAD'], cwd=layer_path, text=True).strip()
         branch = branch.replace('refs/heads/', '').rstrip()
         return branch
 
     def _get_git_revision(layer_path):
-        revision = subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=layer_path, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+        revision = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=layer_path, text=True).strip()
         return revision
 
     def _get_url_map_name(layer_name):
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 85b903fab05..bb7eed14f3d 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -16,28 +16,28 @@ def get_scmbasepath(d):
 
 def get_metadata_git_branch(path):
     try:
-        rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
+        rev, _ = bb.process.run(['git', 'rev-parse', '--abbrev-ref', 'HEAD'], cwd=path)
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         rev = '<unknown>'
     return rev.strip()
 
 def get_metadata_git_revision(path):
     try:
-        rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
+        rev, _ = bb.process.run(['git', 'rev-parse', 'HEAD'], cwd=path)
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         rev = '<unknown>'
     return rev.strip()
 
 def get_metadata_git_toplevel(path):
     try:
-        toplevel, _ = bb.process.run('git rev-parse --show-toplevel', cwd=path)
+        toplevel, _ = bb.process.run(['git', 'rev-parse', '--show-toplevel'], cwd=path)
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return toplevel.strip()
 
 def get_metadata_git_remotes(path):
     try:
-        remotes_list, _ = bb.process.run('git remote', cwd=path)
+        remotes_list, _ = bb.process.run(['git', 'remote'], cwd=path)
         remotes = remotes_list.split()
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         remotes = []
@@ -45,25 +45,24 @@ def get_metadata_git_remotes(path):
 
 def get_metadata_git_remote_url(path, remote):
     try:
-        uri, _ = bb.process.run('git remote get-url {remote}'.format(remote=remote), cwd=path)
+        uri, _ = bb.process.run(['git', 'remote', 'get-url', remote], cwd=path)
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return uri.strip()
 
 def get_metadata_git_describe(path):
     try:
-        describe, _ = bb.process.run('git describe --tags --dirty', cwd=path)
+        describe, _ = bb.process.run(['git', 'describe', '--tags', '--dirty'], cwd=path)
     except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return describe.strip()
 
 def is_layer_modified(path):
+    env = os.environ.copy()
+    env['PSEUDO_UNLOAD'] = '1'
     try:
-        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
-                                git diff --quiet --no-ext-diff
-                                git diff --quiet --no-ext-diff --cached""" % path,
-                                shell=True,
-                                stderr=subprocess.STDOUT)
+        subprocess.check_output(['git', 'diff', '--quiet', '--no-ext-diff'], stderr=subprocess.STDOUT, cwd=path, env=env)
+        subprocess.check_output(['git', 'diff', '--quiet', '--no-ext-diff', '--cached'], stderr=subprocess.STDOUT, cwd=path, env=env)
         return ""
     except subprocess.CalledProcessError as ex:
         # Silently treat errors as "modified", without checking for the
diff --git a/meta/lib/oe/package_manager/common_deb_ipk.py b/meta/lib/oe/package_manager/common_deb_ipk.py
index 6a1e28ee6f9..b93089e523a 100644
--- a/meta/lib/oe/package_manager/common_deb_ipk.py
+++ b/meta/lib/oe/package_manager/common_deb_ipk.py
@@ -33,7 +33,7 @@ class OpkgDpkgPM(PackageManager):
         This method extracts the common parts for Opkg and Dpkg
         """
 
-        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8")
         if proc.returncode:
             bb.fatal("Unable to list available packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index cdb58bee101..e878401468b 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -444,7 +444,7 @@ class DpkgPM(OpkgDpkgPM):
         """
         Returns a dictionary with the package info.
         """
-        cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
+        cmd = [self.apt_cache_cmd, 'show', pkg]
         pkg_info = self._common_package_info(cmd)
 
         pkg_arch = pkg_info[pkg]["pkgarch"]
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4794f31f88d..25d4e3ff2ed 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -5,6 +5,7 @@
 #
 
 import re
+import shlex
 import shutil
 import subprocess
 from oe.package_manager import *
@@ -69,18 +70,18 @@ class PMPkgsList(PkgsList):
         config_file = d.getVar("IPKGCONF_TARGET")
 
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
+        self.opkg_args = ['-f', config_file, '-o', rootfs_dir]
+        self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
 
     def list_pkgs(self, format=None):
-        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
+        cmd = [self.opkg_cmd] + self.opkg_args + ['status']
 
         # opkg returns success even when it printed some
         # "Collected errors:" report to stderr. Mixing stderr into
         # stdout then leads to random failures later on when
         # parsing the output. To avoid this we need to collect both
         # output streams separately and check for empty stderr.
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
         cmd_output, cmd_stderr = p.communicate()
         cmd_output = cmd_output.decode("utf-8")
         cmd_stderr = cmd_stderr.decode("utf-8")
@@ -102,8 +103,8 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
+        self.opkg_args = ['--volatile-cache', '-f', config_file, '-t', self.d.expand('${T}/ipktemp/'), '-o', target_rootfs]
+        self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
 
         if prepare_index:
             create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
@@ -262,10 +263,10 @@ class OpkgPM(OpkgDpkgPM):
     def update(self):
         self.deploy_dir_lock()
 
-        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
+        cmd = [self.opkg_cmd] + self.opkg_args + ['update']
 
         try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             self.deploy_dir_unlock()
             bb.fatal("Unable to update the package index files. Command '%s' "
@@ -277,15 +278,17 @@ class OpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
-        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
+        cmd = [self.opkg_cmd] + self.opkg_args
         for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
-            cmd += " --add-exclude %s" % exclude
+            cmd.append('--add-exclude')
+            cmd.append(exclude)
         for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
-            cmd += " --add-ignore-recommends %s" % bad_recommendation
+            cmd.append('--add-ignore-recommends')
+            cmd.append(bad_recommendation)
         if hard_depends_only:
-            cmd += " --no-install-recommends"
-        cmd += " install "
-        cmd += " ".join(pkgs)
+            cmd.append('--no-install-recommends')
+        cmd.append('install')
+        cmd.extend(pkgs)
 
         os.environ['D'] = self.target_rootfs
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
@@ -296,8 +299,8 @@ class OpkgPM(OpkgDpkgPM):
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(str(cmd))
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
             failed_pkgs = []
             for line in output.split('\n'):
@@ -328,15 +331,13 @@ class OpkgPM(OpkgDpkgPM):
             return
 
         if with_dependencies:
-            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+            cmd = [self.opkg_cmd] + self.opkg_args + ['--force-remove', '--force-removal-of-dependent-packages', 'remove'] + pkgs
         else:
-            cmd = "%s %s --force-depends remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+            cmd = [self.opkg_cmd] + self.opkg_args + ['--force-depends', 'remove'] + pkgs
 
         try:
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(str(cmd))
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
@@ -379,8 +380,8 @@ class OpkgPM(OpkgDpkgPM):
         temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
         bb.utils.mkdirhier(temp_opkg_dir)
 
-        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
-        opkg_args += self.d.getVar("OPKG_ARGS")
+        opkg_args = ['-f', config_file, '-o', temp_rootfs]
+        opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
 
         cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
         try:
@@ -390,10 +391,8 @@ class OpkgPM(OpkgDpkgPM):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         # Dummy installation
-        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
-                                                opkg_args,
-                                                ' '.join(pkgs))
-        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        cmd = [self.opkg_cmd] + self.opkg_args + ['--noaction', 'install'] + pkgs
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8")
         if proc.returncode:
             bb.fatal("Unable to dummy install packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
@@ -427,7 +426,7 @@ class OpkgPM(OpkgDpkgPM):
         """
         Returns a dictionary with the package info.
         """
-        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
+        cmd = [self.opkg_cmd] + self.opkg_args + ['info', pkg]
         pkg_info = self._common_package_info(cmd)
 
         pkg_arch = pkg_info[pkg]["arch"]
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index a1efe97d881..c4588ad0e65 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -122,8 +122,8 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
-        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        cmd = "find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, dst)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, cwd=src)
         source = ''
         if os.path.isdir(src):
             if len(glob.glob('%s/.??*' % src)) > 0:
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 23796c0cdfb..af1e3ca4ab3 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -37,5 +37,5 @@ def run_network_serialdebug(target):
         subprocess.call(["/usr/bin/netstat", "-ei"])
     except (OSError, subprocess.SubprocessError) as e:
         print("netstat failed: %s" % e)
-    subprocess.call(["ps", "-awx"], shell=True)
+    subprocess.call(["ps", "-awx"])
     print("PID: %s %s" % (str(os.getpid()), time.time()))
diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
index e1bc60d49bb..e777b5ef24a 100644
--- a/meta/lib/oeqa/runtime/cases/login.py
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -85,15 +85,15 @@ class LoginTest(OERuntimeTestCase):
                 if self.td.get('MACHINE') == "qemuarm" or self.td.get('MACHINE') == "qemuppc":
                     width = "640"
                 else:
-                    cmd = "identify.im7 -ping -format '%w' {0}".format(t.name)
-                    width = subprocess.check_output(cmd, shell=True, env=ourenv).decode()
+                    cmd = ['identify.im7', '-ping', '-format', '%w', t.name]
+                    width = subprocess.check_output(cmd, env=ourenv).decode()
 
                 rblank = int(float(width))
                 lblank = rblank-80
 
                 # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
-                cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},4 {2},28' {3}".format(t.name, str(rblank), str(lblank), t.name)
-                convert_out=subprocess.check_output(cmd, shell=True, env=ourenv).decode()
+                cmd = ['convert.im7', t.name, '-fill', 'white', '-draw', 'rectangle %s,4 %s,28' % (str(rblank), str(lblank)), t.name]
+                convert_out=subprocess.check_output(cmd, env=ourenv).decode()
 
                 bb.utils.mkdirhier(saved_screenshots_dir)
                 savedfile = "{0}/saved-{1}-{2}-{3}.png".format(saved_screenshots_dir, \
@@ -106,8 +106,8 @@ class LoginTest(OERuntimeTestCase):
                 if not os.path.exists(refimage):
                     self.skipTest("No reference image for comparision (%s)" % refimage)
 
-                cmd = "compare.im7 -metric MSE {0} {1} /dev/null".format(t.name, refimage)
-                compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True, env=ourenv)
+                cmd = ['compare.im7', '-metric', 'MSE',  t.name, refimage, "/dev/null"]
+                compare_out = subprocess.run(cmd, capture_output=True, text=True, env=ourenv)
                 diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
             if diff > 0:
                 # Keep a copy of the failed screenshot so we can see what happened.
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 68556e45c5a..85e6788d282 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -20,7 +20,7 @@ class MultilibTest(OERuntimeTestCase):
 
         dest = "{}/test_binary".format(self.td.get('T', ''))
         self.target.copyFrom(binary, dest)
-        output = subprocess.check_output("readelf -h {}".format(dest), shell=True).decode()
+        output = subprocess.check_output(['readelf', '-h', dest], text=True)
         os.remove(dest)
 
         l = [l.split()[1] for l in output.split('\n') if "Class:" in l]
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 4d626f3e0c2..8e262a10a06 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -47,7 +47,7 @@ class TestSDKExt(TestSDKBase):
         bb.utils.remove(sdk_dir, True)
         bb.utils.mkdirhier(sdk_dir)
         try:
-            subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
+            subprocess.check_output([tcname, '-y', '-d', sdk_dir])
         except subprocess.CalledProcessError as e:
             msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
             logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index dfb96618680..45363ccaf33 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -38,8 +38,8 @@ class BuildProject(metaclass=ABCMeta):
             shutil.copyfile(os.path.join(self.dl_dir, self.archive), self.localarchive)
             return
 
-        cmd = "wget -O %s %s" % (self.localarchive, self.uri)
-        subprocess.check_output(cmd, shell=True)
+        cmd = ['wget', '-O', self.localarchive, self.uri]
+        subprocess.check_output(cmd)
 
     # This method should provide a way to run a command in the desired environment.
     @abstractmethod
@@ -63,4 +63,4 @@ class BuildProject(metaclass=ABCMeta):
         if not self.needclean:
              return
         self._run('rm -rf %s' % self.targetdir)
-        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
+        subprocess.check_call(['rm', '-f', self.localarchive])
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 09738add1d9..677f125a4f6 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -46,14 +46,14 @@ class BuildProject(metaclass=ABCMeta):
                       'ALL_PROXY', 'all_proxy',
                       'SOCKS5_USER', 'SOCKS5_PASSWD']
 
-        cmd = ''
+        env = os.environ.copy()
         for var in exportvars:
             val = self.d.getVar(var)
             if val:
-                cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
+                env[var] = val
 
-        cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
-        subprocess.check_output(cmd, shell=True)
+        cmd = ['wget', '-O', self.localarchive, self.uri]
+        subprocess.check_output(cmd, env=env)
 
     # This method should provide a way to run a command in the desired environment.
     @abstractmethod
@@ -75,7 +75,7 @@ class BuildProject(metaclass=ABCMeta):
         if self.tempdirobj:
             self.tempdirobj.cleanup()
         self._run('rm -rf %s' % self.targetdir)
-        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
+        subprocess.check_call(['rm', '-f', self.localarchive])
 
 class TargetBuildProject(BuildProject):
 
@@ -122,8 +122,8 @@ class SDKBuildProject(BuildProject):
 
         self._download_archive()
 
-        cmd = 'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir)
-        subprocess.check_output(cmd, shell=True)
+        cmd = ['tar', 'xf', self.targetdir + self.archive, '-C', self.targetdir]
+        subprocess.check_output(cmd)
 
         #Change targetdir to project folder
         self.targetdir = os.path.join(self.targetdir, self.fname)
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 6bb595b7bc8..ba6cbf9a8de 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -55,10 +55,11 @@ python do_preconfigure() {
     bb.note("Adding support following TARGET_VENDOR values")
     bb.note(str(vendors_to_add))
     bb.note("in llvm/lib/TargetParser/Triple.cpp and ${S}/clang/lib/Driver/ToolChains/Gnu.cpp")
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Gnu.cpp" % (triple))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' -i ${S}/llvm/lib/TargetParser/Triple.cpp" % (case))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    source = d.getVar("S")
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' % triple, source + '/clang/lib/Driver/ToolChains/Gnu.cpp']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' % case, source + '/llvm/lib/TargetParser/Triple.cpp']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
 
     case = ""
     triple = ""
@@ -77,14 +78,14 @@ python do_preconfigure() {
 
     check += '\\nbool IsOpenEmbedded() const { return DistroVal == ' + oe_names[0:-3] + '; }'
 
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (name))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (check))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Linux.cpp" % (triple))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' -i ${S}/clang/lib/Driver/Distro.cpp" % (case))
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % name, source + '/clang/include/clang/Driver/Distro.h']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' % check, source + '/clang/include/clang/Driver/Distro.h']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' % triple, source + '/clang/lib/Driver/ToolChains/Linux.cpp']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+    cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' % case, source + '/clang/lib/Driver/Distro.cpp']
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
 }
 
 do_patch[vardepsexclude] += "MULTILIBS MULTILIB_VARIANTS"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 3ac679b1a68..d760171661c 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -24,15 +24,15 @@ B = "${WORKDIR}/build"
 # This needs to be Python to avoid lots of shell variables becoming dependencies.
 python do_preconfigure () {
     import subprocess
-    cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    source = d.getVar("S")
+    subprocess.check_output(['gnu-configize'], stderr=subprocess.STDOUT, cwd=source)
+    cmd = ['sed', '-i', '-e', 's/BUILD_INFO=info/BUILD_INFO=/', source + '/gcc/configure']
+    subprocess.check_output(cmd)
 
     # Easiest way to stop bad RPATHs getting into the library since we have a
     # broken libtool here (breaks cross-canadian and target at least)
-    cmd = d.expand("sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure")
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = ['sed', '-i', '-e', 's/hardcode_into_libs=yes/hardcode_into_libs=no/', source + '/libcc1/configure']
+    subprocess.check_output(cmd)
 }
 addtask do_preconfigure after do_patch
 do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 9aefd7e354e..7adb3de806b 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -134,7 +134,7 @@ def sdk_update(args, config, basepath, workspace):
         new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
         # Fetch manifest from server
         tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
-        ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
+        ret = subprocess.call(['wget', '-q', '-O', tmpmanifest, '%s/conf/sdk-conf-manifest' % updateserver])
         if ret != 0:
             logger.error("Cannot dowload files from %s" % updateserver)
             return ret
@@ -146,9 +146,10 @@ def sdk_update(args, config, basepath, workspace):
         logger.debug("Updating metadata via git ...")
         #Check for the status before doing a fetch and reset
         if os.path.exists(os.path.join(basepath, 'layers/.git')):
-            out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
+            out = subprocess.check_output(['git', 'status', '--porcelain'], cwd=layers_dir)
             if not out:
-                ret = subprocess.call("git fetch --all; git reset --hard @{u}", shell=True, cwd=layers_dir)
+                subprocess.call(['git', 'fetch', '--all'], cwd=layers_dir)
+                ret = subprocess.call(['git', 'reset', '--hard', '@{u}'], cwd=layers_dir)
             else:
                 logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
                 logger.error("Changed files:\n%s" % out);
@@ -156,13 +157,13 @@ def sdk_update(args, config, basepath, workspace):
         else:
             ret = -1
         if ret != 0:
-            ret = subprocess.call("git clone %s/layers/.git" % updateserver, shell=True, cwd=tmpsdk_dir)
+            ret = subprocess.call(['git', 'clone', '%s/layers/.git' % updateserver], cwd=tmpsdk_dir)
             if ret != 0:
                 logger.error("Updating metadata via git failed")
                 return ret
         logger.debug("Updating conf files ...")
         for changedfile in changedfiles:
-            ret = subprocess.call("wget -q -O %s %s/%s" % (changedfile, updateserver, changedfile), shell=True, cwd=tmpsdk_dir)
+            ret = subprocess.call(['wget', '-q', '-O', changedfile, '%s/%s' % (updateserver, changedfile)], cwd=tmpsdk_dir)
             if ret != 0:
                 logger.error("Updating %s failed" % changedfile)
                 return ret
@@ -187,7 +188,7 @@ def sdk_update(args, config, basepath, workspace):
                 for buildarch, chksum in newsums:
                     uninative_file = os.path.join('downloads', 'uninative', chksum, '%s-nativesdk-libc.tar.bz2' % buildarch)
                     mkdir(os.path.join(tmpsdk_dir, os.path.dirname(uninative_file)))
-                    ret = subprocess.call("wget -q -O %s %s/%s" % (uninative_file, updateserver, uninative_file), shell=True, cwd=tmpsdk_dir)
+                    ret = subprocess.call(['wget', '-q', '-O', uninative_file, '%s/%s' % (updateserver, uninative_file)], cwd=tmpsdk_dir)
 
         # Ok, all is well at this point - move everything over
         tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index adafaba47e5..5126a4824e6 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -630,7 +630,7 @@ def create_recipe(args):
         if os.path.exists(os.path.join(srctree, '.git')):
             # Try to get upstream repo location from origin remote
             try:
-                stdout, _ = bb.process.run('git remote -v', cwd=srctree, shell=True)
+                stdout, _ = bb.process.run(['git', 'remote', '-v'], cwd=srctree)
             except bb.process.ExecutionError as e:
                 stdout = None
             if stdout:
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index ec9d510e233..31f32ad9953 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -746,8 +746,8 @@ class MakefileRecipeHandler(RecipeHandler):
             scanfile = os.path.join(srctree, 'configure.scan')
             skipscan = False
             try:
-                stdout, stderr = bb.process.run('autoscan', cwd=srctree, shell=True)
-            except bb.process.ExecutionError as e:
+                stdout, stderr = bb.process.run(['autoscan'], cwd=srctree)
+            except (bb.process.ExecutionError, bb.process.NotFoundError) as e:
                 skipscan = True
             if scanfile and os.path.exists(scanfile):
                 values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree, acfile=scanfile)
@@ -771,7 +771,7 @@ class MakefileRecipeHandler(RecipeHandler):
 
             installtarget = True
             try:
-                stdout, stderr = bb.process.run('make -n install', cwd=srctree, shell=True)
+                stdout, stderr = bb.process.run(['make', '-n', 'install'], cwd=srctree)
             except bb.process.ExecutionError as e:
                 if e.exitcode != 1:
                     installtarget = False
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 4813d6f9dc9..2948ee2b481 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -21,7 +21,7 @@ import subprocess
 
 def _is_repo_git_repo(repodir):
     try:
-        curr_toplevel = subprocess.check_output("git -C %s rev-parse --show-toplevel" % repodir, shell=True, stderr=subprocess.DEVNULL)
+        curr_toplevel = subprocess.check_output(['git', '-C', repodir, 'rev-parse', '--show-toplevel'], stderr=subprocess.DEVNULL)
         if curr_toplevel.strip().decode("utf-8") == repodir:
             return True
     except subprocess.CalledProcessError:
@@ -30,7 +30,7 @@ def _is_repo_git_repo(repodir):
 
 def _is_repo_at_rev(repodir, rev):
     try:
-        curr_rev = subprocess.check_output("git -C %s rev-parse HEAD" % repodir, shell=True, stderr=subprocess.DEVNULL)
+        curr_rev = subprocess.check_output(['git', '-C', repodir, 'rev-parse', 'HEAD'], stderr=subprocess.DEVNULL)
         if curr_rev.strip().decode("utf-8") == rev:
             return True
     except subprocess.CalledProcessError:
@@ -39,7 +39,7 @@ def _is_repo_at_rev(repodir, rev):
 
 def _is_repo_at_remote_uri(repodir, remote, uri):
     try:
-        curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (repodir, remote), shell=True, stderr=subprocess.DEVNULL)
+        curr_uri = subprocess.check_output(['git', '-C', repodir, 'remote', 'get-url', remote], stderr=subprocess.DEVNULL)
         if curr_uri.strip().decode("utf-8") == uri:
             return True
     except subprocess.CalledProcessError:
@@ -113,28 +113,33 @@ def _do_checkout(args, json):
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
         if not _is_repo_git_repo(repodir):
-            cmd = 'git init -q {}'.format(repodir)
+            cmd = ['git', 'init', '-q', repodir]
             print("Running '{}'".format(cmd))
-            subprocess.check_output(cmd, shell=True)
+            subprocess.check_output(cmd)
 
         for remote in remotes:
             if not _is_repo_at_remote_uri(repodir, remote, remotes[remote]['uri']):
-                cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
+                cmd = ['git', 'remote', 'remove', remote]
+                # Ignore errors
+                subprocess.run(cmd, cwd=repodir)
+                cmd = ['git', 'remote', 'add', remote, remotes[remote]['uri']]
                 print("Running '{}' in {}".format(cmd, repodir))
-                subprocess.check_output(cmd, shell=True, cwd=repodir)
+                subprocess.check_output(cmd, cwd=repodir)
 
-                cmd = "git fetch -q {} || true".format(remote)
+                cmd = ['git', 'fetch', '-q', remote]
                 print("Running '{}' in {}".format(cmd, repodir))
-                subprocess.check_output(cmd, shell=True, cwd=repodir)
+                # Ignore errors
+                subprocess.run(cmd, cwd=repodir)
 
         if not _is_repo_at_rev(repodir, rev):
-            cmd = "git fetch -q --all || true"
+            cmd = ['git', 'fetch', '-q', '--all']
             print("Running '{}' in {}".format(cmd, repodir))
-            subprocess.check_output(cmd, shell=True, cwd=repodir)
+            # Ignore errors
+            subprocess.run(cmd, cwd=repodir)
 
-            cmd = 'git checkout -q {}'.format(rev)
+            cmd = ['git', 'checkout', '-q', rev]
             print("Running '{}' in {}".format(cmd, repodir))
-            subprocess.check_output(cmd, shell=True, cwd=repodir)
+            subprocess.check_output(cmd, cwd=repodir)
 
             if _contains_submodules(repodir):
                 print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
@@ -156,7 +161,7 @@ parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
         help='Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).')
 
 try:
-    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', universal_newlines=True, shell=True, cwd=os.path.dirname(__file__)))
+    defaultdest = os.path.dirname(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], universal_newlines=True, cwd=os.path.dirname(__file__)))
 except subprocess.CalledProcessError as e:
     defaultdest = os.path.abspath(".")
 
diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
index 8f0e4c05171..2026fde52dc 100755
--- a/scripts/tiny/ksum.py
+++ b/scripts/tiny/ksum.py
@@ -73,7 +73,7 @@ def collect_object_files():
     print("Collecting object files [DONE]")
 
 def add_ko_file(filename):
-        p = Popen("size -t " + filename, shell=True, stdout=PIPE, stderr=PIPE)
+        p = Popen(['size', '-t', filename], stdout=PIPE, stderr=PIPE, text=True)
         output = p.communicate()[0].splitlines()
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
@@ -89,7 +89,7 @@ def add_ko_file(filename):
             n_ko_files += 1
 
 def get_vmlinux_totals():
-        p = Popen("size -t " + vmlinux_file, shell=True, stdout=PIPE, stderr=PIPE)
+        p = Popen(['size', '-t', vmlinux_file], stdout=PIPE, stderr=PIPE, text=True)
         output = p.communicate()[0].splitlines()
         if len(output) > 2:
             sizes = output[-1].split()[0:4]

