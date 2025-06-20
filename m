Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C216C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 16:20:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.792.1750436441387950044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 09:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FC/shBQw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so21366905e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750436439; x=1751041239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LxmM0/XZrZRue0KFtIwCyUCQEHFzru40ypJpmOT/SxA=;
        b=FC/shBQwoN4jju2pYCPAUmLC0DMgreQky68ow6hQO27GYzz0wPIKMUZzQs0EjMNTV+
         b66yd1QpAaZSSMCMLqr861s1jc6tPOeIEkN77PLjuWsaMTjPjPQJ7ZF+5iIItbFudfL6
         gkr2dTFc9br91Obo1y5eHUw9zbcKWCowcqXQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750436439; x=1751041239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxmM0/XZrZRue0KFtIwCyUCQEHFzru40ypJpmOT/SxA=;
        b=E2AdifqZ6BYnPbj0Mbr1wxw5agHHRZopOmV6o+f18zyN2IQnQHIrOH4KtZtGItVe5R
         9eHBJcsPfjmQshODjXP/vsxbCKCBu8tOIJkMKltaY9LE6qNO8+Vd7rISn6Xp8vedEQ+b
         Dnp0vWcEXs1CPB9z6aQvSjY+VopeadxvfPmnBhpf6wCEjQr9UK0GdRPOJHMKiZaIlq7b
         4LLJckpNBmfo2iU0t3iUuktzzar6Wh/oG9myl4IIxHxB5krloP5KJrzQ4M+x6FBqRb9v
         n7DIHKOpJBi7DrmhXya5x63sgRkTXlM4x1FsllBCvWwyN4hQkWZbZXJIrXE+9btrSn8d
         F2ZA==
X-Gm-Message-State: AOJu0YztWW8ySPgxCQE0kGZgN0OaPUjHIve79iNTV+59ZYcORvxue/K3
	UDXzSgiCrKIzmQ+IijXVbJTV1436ulD+Hm4ryzNb8rL8/WkMF8pu9L3OtDIh+HdDQjGjZP0iK/x
	IVY4X9qc=
X-Gm-Gg: ASbGnctyqva1T0Si82OkeZQBrGKwYsi5jO+RAemZ/+fXM4//9h1znMiSsMqpVwHHGa6
	wavuD4eG9HS5N4EK70Rv22nRFH55kwunh9RfzS/+U/jL/picf7VzGXKNWnTIokc3kTgtSvHyhq9
	Tsk7uj8WfQb9CmMe2g5+y0u+PF+fZtc130ilUwfMe3wMfEKgaLf+niI5CEUDiQ96huLp0dZyLiV
	PvmhcjEQUe+9L630UFm1bFmXAKgXz8FHXM+4KYU+Yi9S+cqgeyp3yuo3g3GrElzg3UvEVkcf8vV
	43O2KDCCPdm+Uz8lhPTZ5ZvdnUWpzDtsbMiziMFwnL7A9pboTcNgWo/X/NGBO+l4eDaD6uzFUSA
	DSbsj/2JvplVP9vE=
X-Google-Smtp-Source: AGHT+IFDg1CVLqOey7nXYPoi8K5m3m4HF+HgXrXpKDZE57UyedXWa0RfsPz/UvgWcAjo+x2FapclfQ==
X-Received: by 2002:a05:600c:37c5:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-453657bf2abmr34416875e9.14.1750436438854;
        Fri, 20 Jun 2025 09:20:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97adf3sm63097595e9.8.2025.06.20.09.20.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:20:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory: Drop BUILDHISTORY_RESET due to reliability issues
Date: Fri, 20 Jun 2025 17:20:37 +0100
Message-ID: <20250620162037.2529555-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 16:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219141

The implementation of BUILDHISTORY_RESET is problematic, particlarly given that
people are trying to create an API with it alongside BUILDHISTORY_PRESERVE
which simply doesn't exist and can't work reliably. Worse, the code paths with
this bolted on implementation are convoluted and near impossible to follow.

BUILDHISTORY_PRESERVE is effectively internal API, used to stop buildhistory
removing some files which are needed for data, or are created at different
parts of the build. Add a comment to explain what it is doing and why these files
are listed.

Commit 9f68a45aa238ae5fcdfaca71ba0e7015e9cb720e tried to "fix" preserve support
with the reset functionality but it didn't fully work and has just exposed futher
issues. There is a further fix however I can brely follow the code and in reviewing
it, I've concluded we shouldn't be doing this at all.

Due to the way BUILDHISTORY_RESET was implemented, horrible races were introduced
making it unclear what happens to the data if builds fail for example, or how sstate
interacts with the build since things get reset but stamps do not and tasks may not
rerun. It also interacts badly with any additions to the preserve list, due to
misunderstandings on what that variable does.

Having stared long and hard at the code, and really struggled to understand it, I',
of the view that "reset" for CI purposes should be done by the CI itself. The CI can
choose to remove some files or all files and decide how to handle failures. It has
to handle the buildhistory directory anyway.

Therefore drop BUILDHISTORY_RESET support, allowing the "old" codepaths to be dropped.
BUILDHISTORY_PRESERVE is better documented to hint that it is internal API and to
show what it is really for.

If we really do want some functionality list this, it needs to be implemented in a
way you can follow the code, and have tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 73 +++----------------------------
 1 file changed, 6 insertions(+), 67 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ed8d5b98c20..4a380c10c6d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -16,28 +16,6 @@ BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 
-# Setting this to non-empty will remove the old content of the buildhistory as part of
-# the current bitbake invocation and replace it with information about what was built
-# during the build.
-#
-# This is meant to be used in continuous integration (CI) systems when invoking bitbake
-# for full world builds. The effect in that case is that information about packages
-# that no longer get build also gets removed from the buildhistory, which is not
-# the case otherwise.
-#
-# The advantage over manually cleaning the buildhistory outside of bitbake is that
-# the "version-going-backwards" check still works. When relying on that, be careful
-# about failed world builds: they will lead to incomplete information in the
-# buildhistory because information about packages that could not be built will
-# also get removed. A CI system should handle that by discarding the buildhistory
-# of failed builds.
-#
-# The expected usage is via auto.conf, but passing via the command line also works
-# with: BB_ENV_PASSTHROUGH_ADDITIONS=BUILDHISTORY_RESET BUILDHISTORY_RESET=1
-BUILDHISTORY_RESET ?= ""
-
-BUILDHISTORY_OLD_DIR = "${BUILDHISTORY_DIR}/${@ "old" if "${BUILDHISTORY_RESET}" else ""}"
-BUILDHISTORY_OLD_DIR_PACKAGE = "${BUILDHISTORY_OLD_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}${SDK_EXT}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf conf/locked-sigs.inc conf/devtool.conf"
@@ -70,9 +48,10 @@ SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
 # necessary because some of these items (package directories, files that
 # we no longer emit) might be obsolete.
 #
-# When extending build history, derive your class from buildhistory.bbclass
-# and extend this list here with the additional files created by the derived
-# class.
+# The files listed here are either written by tasks that aren't do_package (e.g.
+# latest_srcrev from do_fetch) so do_package must not remove them, or, they're
+# used to read values in do_package before always being overwritten, e.g. latest,
+# for version backwards checks.
 BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
@@ -108,7 +87,6 @@ python buildhistory_emit_pkghistory() {
         return 0
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
-    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
 
     class RecipeInfo:
         def __init__(self, name):
@@ -203,7 +181,7 @@ python buildhistory_emit_pkghistory() {
 
     def getlastpkgversion(pkg):
         try:
-            histfile = os.path.join(oldpkghistdir, pkg, "latest")
+            histfile = os.path.join(pkghistdir, pkg, "latest")
             return readPackageInfo(pkg, histfile)
         except EnvironmentError:
             return None
@@ -219,20 +197,6 @@ python buildhistory_emit_pkghistory() {
         items.sort()
         return ' '.join(items)
 
-    def preservebuildhistoryfiles(pkg, preserve):
-        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
-            listofobjs = os.listdir(os.path.join(oldpkghistdir, pkg))
-            for obj in listofobjs:
-                if obj not in preserve:
-                    continue
-                try:
-                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
-                    shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj), os.path.join(pkghistdir, pkg, obj))
-                except IOError as e:
-                    bb.note("Unable to copy file. %s" % e)
-                except EnvironmentError as e:
-                    bb.note("Unable to copy file. %s" % e)
-
     pn = d.getVar('PN')
     pe = d.getVar('PE') or "0"
     pv = d.getVar('PV')
@@ -272,13 +236,6 @@ python buildhistory_emit_pkghistory() {
                     else:
                         os.unlink(itempath)
 
-    if os.path.exists(oldpkghistdir):
-        # We need to make sure that all files in preserve
-        # are restored from buildhistory/old successfully
-        if d.getVar("BUILDHISTORY_RESET"):
-            for pkg in packagelist:
-                preservebuildhistoryfiles(pkg, preserve)
-
     rcpinfo = RecipeInfo(pn)
     rcpinfo.pe = pe
     rcpinfo.pv = pv
@@ -886,25 +843,7 @@ END
 
 python buildhistory_eventhandler() {
     if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
-        reset = e.data.getVar("BUILDHISTORY_RESET")
-        olddir = e.data.getVar("BUILDHISTORY_OLD_DIR")
-        if isinstance(e, bb.event.BuildStarted):
-            if reset:
-                import shutil
-                # Clean up after potentially interrupted build.
-                if os.path.isdir(olddir):
-                    shutil.rmtree(olddir)
-                rootdir = e.data.getVar("BUILDHISTORY_DIR")
-                bb.utils.mkdirhier(rootdir)
-                entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
-                bb.utils.mkdirhier(olddir)
-                for entry in entries:
-                    bb.utils.rename(os.path.join(rootdir, entry),
-                              os.path.join(olddir, entry))
-        elif isinstance(e, bb.event.BuildCompleted):
-            if reset:
-                import shutil
-                shutil.rmtree(olddir)
+        if isinstance(e, bb.event.BuildCompleted):
             if e.data.getVar("BUILDHISTORY_COMMIT") == "1":
                 bb.note("Writing buildhistory")
                 bb.build.exec_func("buildhistory_write_sigs", d)

