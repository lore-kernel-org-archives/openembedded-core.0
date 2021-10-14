Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595CEC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8578.1634213430753844200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OjR2kr6s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r10so18669424wra.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yBQhwriCVU2xaTSEbDstb1jsp8ccWAUws0GBNCIVaUw=;
        b=OjR2kr6soG84Bt+750hX34Kl3pC+PicSibYiNobkNSr9CLCPTclAkDifE7XlJd4ewD
         yr8MCN/LnxWij/bJZRbmzaSkRsSMUtkXc0H9UbokyqylqfWieDouyRYaXspDDY3iPPK+
         wmn9PWuRvsNzpa7q8F6CZj4U3d6y5gLzfbF1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBQhwriCVU2xaTSEbDstb1jsp8ccWAUws0GBNCIVaUw=;
        b=xN5wFvzuTTnceg+hJ98hyjAdMn8X59MJWind3rGLZHRLxEH5extgsZIwFkMTtC3QoB
         YsoRzdvRlHBuSSyadP8pV65jWicsNGmvU6DV58V202H3YiJOmVCJkD5WyOG6HTHeywmF
         MbQhX1o8irEWAEdbqyUcfXoRtbujP8f8RmOb3YtD5maLthg84sTcwILM417zFaJNl+KD
         GelPW4MO0bVDNZyBGTJfOHV/xBjXZfQIR5hUL9iXD1bL332bImUcdzc8A0oRTtm0X5su
         yY16v9BBVXwcHJG/w3FcqOey83g3HGAd0+bwflPLq0ORnofQw6yl+39Dko9VfA0dezo6
         Y0Jg==
X-Gm-Message-State: AOAM532GBG6wYhFQr1KdWVZxYclg/XoTVJzG5QxHvyXgFwIhtv+1VrZS
	xBcVudInNGPIMSkTNh6+dCPXD3zpqRoJdw==
X-Google-Smtp-Source: 
 ABdhPJwMGjmOUIQK8rhwLslk6Y2/ddS1vDhaexlH/HLHAQNtFg6um3DsGyv7FvzBc9zWobfzleP1Tw==
X-Received: by 2002:adf:bb12:: with SMTP id r18mr6168931wrg.313.1634213428848;
        Thu, 14 Oct 2021 05:10:28 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] reproducible: Merge code into base.bbclass
Date: Thu, 14 Oct 2021 13:10:23 +0100
Message-Id: <20211014121025.2913401-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156940

Reproducibility is here to stay and needs to be part of our default workflow.
Move the remaining code to base.bbclass so it is always a first class citizen
and it is clear people need to be mindful of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                    | 38 ++++++++
 meta/classes/externalsrc.bbclass             |  4 +-
 meta/classes/image-artifact-names.bbclass    |  2 +-
 meta/classes/package_deb.bbclass             |  3 +-
 meta/classes/package_ipk.bbclass             |  3 +-
 meta/classes/package_rpm.bbclass             |  3 +-
 meta/classes/reproducible_build.bbclass      | 96 --------------------
 meta/lib/oe/reproducible.py                  | 51 +++++++++++
 meta/lib/oeqa/selftest/cases/reproducible.py |  1 -
 9 files changed, 95 insertions(+), 106 deletions(-)
 delete mode 100644 meta/classes/reproducible_build.bbclass

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bca3944ae70..a65fcc6c1db 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -180,6 +180,44 @@ python base_do_unpack() {
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
 
+SSTATETASKS += "do_deploy_source_date_epoch"
+
+do_deploy_source_date_epoch () {
+    mkdir -p ${SDE_DEPLOYDIR}
+    if [ -e ${SDE_FILE} ]; then
+        echo "Deploying SDE from ${SDE_FILE} -> ${SDE_DEPLOYDIR}."
+        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+    else
+        echo "${SDE_FILE} not found!"
+    fi
+}
+
+python do_deploy_source_date_epoch_setscene () {
+    sstate_setscene(d)
+    bb.utils.mkdirhier(d.getVar('SDE_DIR'))
+    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
+    if os.path.exists(sde_file):
+        target = d.getVar('SDE_FILE')
+        bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, target))
+        bb.utils.rename(sde_file, target)
+    else:
+        bb.debug(1, "%s not found!" % sde_file)
+}
+
+do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
+do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
+addtask do_deploy_source_date_epoch_setscene
+addtask do_deploy_source_date_epoch before do_configure after do_patch
+
+python create_source_date_epoch_stamp() {
+    source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
+    oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
+}
+do_unpack[postfuncs] += "create_source_date_epoch_stamp"
+
+def get_source_date_epoch_value(d):
+    return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
+
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ad93b2d2abf..abfe24bacec 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -109,8 +109,8 @@ python () {
             if local_srcuri and task in fetch_tasks:
                 continue
             bb.build.deltask(task, d)
-            if bb.data.inherits_class('reproducible_build', d) and task == 'do_unpack':
-                # The reproducible_build's create_source_date_epoch_stamp function must
+            if task == 'do_unpack':
+                # The reproducible build create_source_date_epoch_stamp function must
                 # be run after the source is available and before the
                 # do_deploy_source_date_epoch task.  In the normal case, it's attached
                 # to do_unpack as a postfuncs, but since we removed do_unpack (above)
diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index 67f04e81658..f5769e520f5 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -15,7 +15,7 @@ IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 IMAGE_NAME_SUFFIX ??= ".rootfs"
 
 python () {
-    if bb.data.inherits_class('reproducible_build', d) and bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUFFIX") == "-${DATETIME}":
+    if bb.data.inherits_class('deploy', d) and d.getVar("IMAGE_VERSION_SUFFIX") == "-${DATETIME}":
         import datetime
         d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimestamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%Y%m%d%H%M%S'))
         d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 65dbe6c3923..1ae6393d37d 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -315,8 +315,7 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-EPOCHTASK ??= ""
-addtask package_write_deb after do_packagedata do_package ${EPOCHTASK} before do_build
+addtask package_write_deb after do_packagedata do_package do_deploy_source_date_epoch before do_build
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 776fe8ed23b..902b7f94c84 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -274,8 +274,7 @@ python do_package_write_ipk () {
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-EPOCHTASK ??= ""
-addtask package_write_ipk after do_packagedata do_package ${EPOCHTASK} before do_build
+addtask package_write_ipk after do_packagedata do_package do_deploy_source_date_epoch before do_build
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e738806fd72..b0754421a33 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -748,8 +748,7 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-EPOCHTASK ??= ""
-addtask package_write_rpm after do_packagedata do_package ${EPOCHTASK} before do_build
+addtask package_write_rpm after do_packagedata do_package do_deploy_source_date_epoch before do_build
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
deleted file mode 100644
index f38be1a7654..00000000000
--- a/meta/classes/reproducible_build.bbclass
+++ /dev/null
@@ -1,96 +0,0 @@
-# reproducible_build.bbclass
-#
-# Sets the default SOURCE_DATE_EPOCH in each component's build environment.
-# The format is number of seconds since the system epoch.
-#
-# Upstream components (generally) respect this environment variable,
-# using it in place of the "current" date and time.
-# See https://reproducible-builds.org/specs/source-date-epoch/
-#
-# The default value of SOURCE_DATE_EPOCH comes from the function
-# get_source_date_epoch_value which reads from the SDE_FILE, or if the file
-# is not available (or set to 0) will use the fallback of
-# SOURCE_DATE_EPOCH_FALLBACK.
-#
-# The SDE_FILE is normally constructed from the function
-# create_source_date_epoch_stamp which is typically added as a postfuncs to
-# the do_unpack task.  If a recipe does NOT have do_unpack, it should be added
-# to a task that runs after the source is available and before the
-# do_deploy_source_date_epoch task is executed.
-#
-# If a recipe wishes to override the default behavior it should set it's own
-# SOURCE_DATE_EPOCH or override the do_deploy_source_date_epoch_stamp task
-# with recipe-specific functionality to write the appropriate
-# SOURCE_DATE_EPOCH into the SDE_FILE.
-#
-# SOURCE_DATE_EPOCH is intended to be a reproducible value.  This value should
-# be reproducible for anyone who builds the same revision from the same
-# sources.
-#
-# There are 4 ways the create_source_date_epoch_stamp function determines what
-# becomes SOURCE_DATE_EPOCH:
-#
-# 1. Use the value from __source_date_epoch.txt file if this file exists.
-#    This file was most likely created in the previous build by one of the
-#    following methods 2,3,4.
-#    Alternatively, it can be provided by a recipe via SRC_URI.
-#
-# If the file does not exist:
-#
-# 2. If there is a git checkout, use the last git commit timestamp.
-#    Git does not preserve file timestamps on checkout.
-#
-# 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
-#    This works for well-kept repositories distributed via tarball.
-#
-# 4. Use the modification time of the youngest file in the source tree, if
-#    there is one.
-#    This will be the newest file from the distribution tarball, if any.
-#
-# 5. Fall back to a fixed timestamp (SOURCE_DATE_EPOCH_FALLBACK).
-#
-# Once the value is determined, it is stored in the recipe's SDE_FILE.
-
-
-SSTATETASKS += "do_deploy_source_date_epoch"
-
-do_deploy_source_date_epoch () {
-    mkdir -p ${SDE_DEPLOYDIR}
-    if [ -e ${SDE_FILE} ]; then
-        echo "Deploying SDE from ${SDE_FILE} -> ${SDE_DEPLOYDIR}."
-        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
-    else
-        echo "${SDE_FILE} not found!"
-    fi
-}
-
-python do_deploy_source_date_epoch_setscene () {
-    sstate_setscene(d)
-    bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
-    if os.path.exists(sde_file):
-        target = d.getVar('SDE_FILE')
-        bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, target))
-        bb.utils.rename(sde_file, target)
-    else:
-        bb.debug(1, "%s not found!" % sde_file)
-}
-
-do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
-do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
-addtask do_deploy_source_date_epoch_setscene
-addtask do_deploy_source_date_epoch before do_configure after do_patch
-
-python create_source_date_epoch_stamp() {
-    source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
-    oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
-}
-
-EPOCHTASK = "do_deploy_source_date_epoch"
-
-# Generate the stamp after do_unpack runs
-do_unpack[postfuncs] += "create_source_date_epoch_stamp"
-
-def get_source_date_epoch_value(d):
-    return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
-
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index a5000574cfa..4fb99d963ce 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -5,6 +5,57 @@ import os
 import subprocess
 import bb
 
+# For reproducible builds, this code sets the default SOURCE_DATE_EPOCH in each
+# component's build environment. The format is number of seconds since the
+# system epoch.
+#
+# Upstream components (generally) respect this environment variable,
+# using it in place of the "current" date and time.
+# See https://reproducible-builds.org/specs/source-date-epoch/
+#
+# The default value of SOURCE_DATE_EPOCH comes from the function
+# get_source_date_epoch_value which reads from the SDE_FILE, or if the file
+# is not available will use the fallback of SOURCE_DATE_EPOCH_FALLBACK.
+#
+# The SDE_FILE is normally constructed from the function
+# create_source_date_epoch_stamp which is typically added as a postfuncs to
+# the do_unpack task.  If a recipe does NOT have do_unpack, it should be added
+# to a task that runs after the source is available and before the
+# do_deploy_source_date_epoch task is executed.
+#
+# If a recipe wishes to override the default behavior it should set it's own
+# SOURCE_DATE_EPOCH or override the do_deploy_source_date_epoch_stamp task
+# with recipe-specific functionality to write the appropriate
+# SOURCE_DATE_EPOCH into the SDE_FILE.
+#
+# SOURCE_DATE_EPOCH is intended to be a reproducible value.  This value should
+# be reproducible for anyone who builds the same revision from the same
+# sources.
+#
+# There are 4 ways the create_source_date_epoch_stamp function determines what
+# becomes SOURCE_DATE_EPOCH:
+#
+# 1. Use the value from __source_date_epoch.txt file if this file exists.
+#    This file was most likely created in the previous build by one of the
+#    following methods 2,3,4.
+#    Alternatively, it can be provided by a recipe via SRC_URI.
+#
+# If the file does not exist:
+#
+# 2. If there is a git checkout, use the last git commit timestamp.
+#    Git does not preserve file timestamps on checkout.
+#
+# 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
+#    This works for well-kept repositories distributed via tarball.
+#
+# 4. Use the modification time of the youngest file in the source tree, if
+#    there is one.
+#    This will be the newest file from the distribution tarball, if any.
+#
+# 5. Fall back to a fixed timestamp (SOURCE_DATE_EPOCH_FALLBACK).
+#
+# Once the value is determined, it is stored in the recipe's SDE_FILE.
+
 def get_source_date_epoch_from_known_files(d, sourcedir):
     source_date_epoch = None
     newest_file = None
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e4582cb82a6..2e983d2f175 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -219,7 +219,6 @@ class ReproducibleTests(OESelftestTestCase):
             bb.utils.remove(tmpdir, recurse=True)
 
         config = textwrap.dedent('''\
-            INHERIT += "reproducible_build"
             PACKAGE_CLASSES = "{package_classes}"
             INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
-- 
2.32.0


