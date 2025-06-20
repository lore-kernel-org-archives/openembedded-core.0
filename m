Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768D8C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 16:21:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.813.1750436505815871213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 09:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JhYQZGp0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a589d99963so2021939f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750436503; x=1751041303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HK6ofu2MRs6AGkTP5nQRotrByzJeEtgFuUtRvX55I6E=;
        b=JhYQZGp04l8plqApeor3y6zxIR49NYkTiU+L0eIWybg1L1xQG6f3ft2QZnyrUkRvUl
         dnWhvls0745Z3tP1ajZK7HRq9xbxFfYq2jpp8io/I+edoGO8n4qAuOq8iEtFZN5qE2xe
         5/CQCvC2FOX0a1AY72oTE/NLwkTA511biarOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750436503; x=1751041303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HK6ofu2MRs6AGkTP5nQRotrByzJeEtgFuUtRvX55I6E=;
        b=nza9OOI24J9PNKklkALmYuEWZFwNxcgttB5DF58xZW9XpZeGa2Kfk72YAMU5SpGhWz
         ABAYvxF2Om6uhcAgGhptiyoOOfDSmO1vS2tYn+AIHmKQspu7Udqqg/BMiTDsS+egtUBy
         gIkDCFw6wmEoVKCi6oRZFxgiwG9ugYfwIdPUweNxEH77TXGWRB6RabG4P9hdbebyRTzQ
         r5AK+3+2n0yUuEqfN3bXpqYAj10ouzLl1e++7+IaaGcvNzj18EMeCjUiasF3HFxqQdH6
         sj0cdUUP5Ccs4sk7lGW8QId4iZxG/5+41rkAfxQkiCw5hSyx4Rzn1s6UWieuZ09G67ot
         SiJg==
X-Gm-Message-State: AOJu0Yxv0L0S9v2WzV0r+iHamGRZaGwI15POoXdmrWDEc2tgXUJjC4FN
	J7i9++ocEfgjDKMLC88UaDioDG/VSmuy6Mb43xejcVtW1WylYGnVRb8Zy3B0NOhQVniYw1mdr20
	oUF87KKU=
X-Gm-Gg: ASbGncs+C6U1VaVtSs7hxC3EFzMcxDuVjbyRfMm6s+LJnt/DPf4QvyvtlJpe79ugtKp
	+sj0DMoFC1brV64U3P8jZ2yQE9tSUcOcJH+D9Don/mMXrtax64eNvA0w7L9V+Umn3G5clxCN5/m
	BOYgy88UgiKco8Gdr6+frm40O/xKtBes1azelG07MjN+Q6EoUtIV0Fb4mj7hAGjhNROL5StrNJA
	Phv6e9ST3PA5oSVFj4DUYQ+wUcOxAXUsKpF23P8BE9eilE6WWmSS6PIr8LaBXYxhMgWdJRocTLf
	9/1JDaTJ6oZ7V46otH2cqUq/J85v3GJIK+7axiSNK6s0K5eKZ7sUuVMJR89OrXKhAkKRYm6fPot
	Kv3tGOhBa6tzmGHE=
X-Google-Smtp-Source: AGHT+IHECWqatEJrKdbuwsoFUIho9DOz1bWSDQoIw/DTIPYYtd2iKr7a2mL37zvpyIepG7ZJ78pxrQ==
X-Received: by 2002:a05:6000:2002:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3a6d12fc180mr3197550f8f.59.1750436502992;
        Fri, 20 Jun 2025 09:21:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1815dsm2417501f8f.28.2025.06.20.09.21.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:21:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] buildhistory: Drop BUILDHISTORY_RESET due to reliability issues
Date: Fri, 20 Jun 2025 17:21:41 +0100
Message-ID: <20250620162141.2529718-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 16:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219142

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
 meta/classes/buildhistory.bbclass | 74 +++----------------------------
 1 file changed, 6 insertions(+), 68 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e9701826205..4a380c10c6d 100644
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
@@ -260,14 +224,6 @@ python buildhistory_emit_pkghistory() {
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
-        # We need to make sure that all files kept in
-        # buildhistory/old are restored successfully
-        # otherwise next block of code wont have files to
-        # check and purge
-        if d.getVar("BUILDHISTORY_RESET"):
-            for pkg in packagelist:
-                preservebuildhistoryfiles(pkg, preserve)
-
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
             if item not in preserve:
@@ -887,25 +843,7 @@ END
 
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

