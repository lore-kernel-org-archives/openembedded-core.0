Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7CF1088E5C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:34 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27165.1773873511001581849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=VvlPuH3g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260318223828883b89edbc00020760-q9tpe_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260318223828883b89edbc00020760
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hhs5T89OYgG8aDf6D1ZGK6SZCRkm2A/2BtvBCbp7djU=;
 b=VvlPuH3g8Nqtp+gR9ZKFFhwvIFGvu3JXi70c0NMkEGHIMB8hEeD+DTnoutL2TU9xf3QfA2
 sR5YUcoPZC70f7tAweLMQNv5hwhiofCCuG2L7m6XyH/7FnAnKYdnRovTunGlq2/TvFdb0ANS
 WpWhd9mnWDislCZv+z6hoRme5iU0E6olVg7Hh+2Osq1lxxb68V69+lthjYPz82if3lIHTHGn
 MKOvzsrNWzjpKwZzE1Bb4aDEL15QPK+H5turjGCpdR+p5L3uikWlMgbd6T8ZuF1R568rLdzD
 mVXigb2lgRnZjj/0BZN4A/FXRNj4WIEkFGGIpSvTCG+72uP7TUlmmGwA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/9] oe-selftest/cpp-example: fix conf file ownership with static UIDs/GIDs
Date: Wed, 18 Mar 2026 23:36:12 +0100
Message-ID: <20260318223736.3414885-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233442

From: Adrian Freihofer <adrian.freihofer@siemens.com>

test_devtool_ide_sdk_none_qemu builds an image containing both
cmake-example and meson-example, starts a QEMU instance, then uses
devtool ide-sdk + devtool deploy-target to rebuild and redeploy each
recipe in turn. The test verifies that /etc/<recipe>.conf is owned by
the matching user both before and after each deploy cycle.

The test was failing with:

  /etc/meson-example.conf not owned by user meson-example: got cmake-example

Root cause: both recipes call

  install -m 0644 -o ${BPN} -g ${BPN} ... ${D}${sysconfdir}/${BPN}.conf

During do_install, pseudo resolves ${BPN} to a UID by looking up
/etc/passwd in the recipe's own isolated RECIPE_SYSROOT. Since the
sysroots are independent, both cmake-example and meson-example each
see themselves as the first --system user and get the same UID (e.g.
100). Both ${D} trees therefore contain files with UID 100. In the
final rootfs cmake-example is allocated UID 100 and meson-example UID
101. Files packaged for meson-example still carry UID 100, so stat
reports them as owned by cmake-example.

A pkg_postinst chown would fix the rootfs, but devtool deploy-target
is a plain tar pipe over SSH with no package-manager involvement - it
never runs pkg_postinst. Whatever UID is embedded in ${D} is what
lands on the target. Not sure how this could be fixed with dynamic UIDs.

A clean solution is to make every recipe sysroot and the final image
agree on the same UIDs from the start, i.e. static IDs.

Fix:
- Enable USERADDEXTENSION = "useradd-staticids" in _write_bb_config so
  the test builds with static IDs for the duration of the test.
- Add cmake-example (UID/GID 533) and meson-example (UID/GID 534) to
  meta-selftest/files/static-passwd and static-group.
- Expand the comment in cpp-example.inc's do_install to document the
  static-ID requirement so future readers understand why the -o/-g
  flags work correctly only under useradd-staticids.
- Fix a copy-paste error in the in-test comment (said
  "meson-example.conf ... cmake-example user" for the cmake block).

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/files/static-group               |  2 ++
 meta-selftest/files/static-passwd              |  2 ++
 meta-selftest/recipes-test/cpp/cpp-example.inc |  6 +++++-
 meta/lib/oeqa/selftest/cases/devtool.py        | 12 +++++++++++-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 3fca4aa5c9..adf436f310 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -28,4 +28,6 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+cmake-example:x:533:
+meson-example:x:534:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index cc6c5acd5c..8d9f149b9f 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -19,3 +19,5 @@ _apt:x:523:523::/:/bin/nologin
 weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
+cmake-example:x:533:533::/var/lib/cmake-example:/bin/false
+meson-example:x:534:534::/var/lib/meson-example:/bin/false
diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 2653f45e90..0671824d1c 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -41,7 +41,11 @@ USERADD_PARAM:${PN} = "--system --home /var/lib/${BPN} --no-create-home --shell
 EX_BINARY_NAME ?= "${BPN}"
 
 do_install:append() {
-    # Install configuration file owned by unprivileged user
+    # Install configuration file owned by the recipe's unprivileged user.
+    # Note: this requires static UIDs/GIDs (USERADDEXTENSION = "useradd-staticids")
+    # so that the UID embedded by pseudo during do_install matches the UID assigned
+    # in the final image. devtool deploy-target is a raw file copy and does not run
+    # pkg_postinst, so the UID in ${D} must already be correct.
     install -d ${D}${sysconfdir}
     install -m 0644 -g ${BPN} -o ${BPN} ${S}/cpp-example.conf ${D}${sysconfdir}/${BPN}.conf
     sed -i -e 's|@BINARY_NAME@|${BPN}|g' ${D}${sysconfdir}/${BPN}.conf
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index dc83d406fd..6c6f22a667 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2598,6 +2598,16 @@ class DevtoolIdeSdkTests(DevtoolBase):
             'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
                 [r + '-ptest' for r in recipe_names]),
             'DISTRO_FEATURES:append = " ptest"'
+            # Static UIDs/GIDs are required so that files installed via
+            # "install -o ${BPN}" in do_install embed the same UID that gets
+            # assigned in the final image. Without this, each recipe's isolated
+            # sysroot allocates UIDs independently (both start at the first free
+            # system UID), so files end up with colliding UIDs in the image.
+            # devtool deploy-target is a raw file copy and does not run
+            # pkg_postinst, so ownership must be correct already in ${D}.
+            'USERADDEXTENSION = "useradd-staticids"',
+            'USERADD_UID_TABLES += "files/static-passwd"',
+            'USERADD_GID_TABLES += "files/static-group"',
         ]
         self.write_config("\n".join(conf_lines))
 
@@ -2985,7 +2995,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self.assertEqual(self._workspace_scripts_dir(
                 recipe_name), self._sources_scripts_dir(tempdir))
 
-            # Verify /etc/meson-example.conf is still owned by the cmake-example user
+            # Verify /etc/cmake-example.conf is still owned by the cmake-example user
             # after the install and deploy scripts updated the file
             self._verify_conf_file(qemu, conf_file, example_exe, example_exe)
 
-- 
2.53.0


