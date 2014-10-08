Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13C767139A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 03:00:19 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id fp1so6027216pdb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 20:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VDXWsMr4HWWKeezD1mv3g82R6QYoPC0CkGYhszMIHB0=;
	b=ePQAS4bS6LlP82gVyPcPwPpxXb7RWtvwoC/nl2glKUfwL4JO3aXdTEQN+v0bOruQ98
	FkCrVQvdrHYckfhhdCgz3hK2XQz708b+vajHFMBrZQEMxzLDxhrfR8AO0Q6kYYqRxj9/
	wbgza1KJlJ6M3jNOXnFKQC+FfNwj/fj2D978ylmjgIhQp561m8I9l6vXAbEs+kaVR6hc
	4zGJnKVC9TFUwIovdFk/l+N0GPjPK7PMxJIrXGFOfuBVgL0W9P3SOJmhT3V2eYaQEouh
	dORVQ7f+Xt2Tn6ll4nC4k+mWCMIterSnyleA/MBvushqkws0W///sxylA5RNwiMbCyeZ
	Hn7w==
X-Received: by 10.68.171.33 with SMTP id ar1mr1249775pbc.148.1412737219684;
	Tue, 07 Oct 2014 20:00:19 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ge5sm17088167pbc.81.2014.10.07.20.00.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 20:00:18 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 20:00:13 -0700
Message-Id: <1412737213-4248-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
References: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
Subject: [PATCH 2/2] clutter-1.0: add ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Oct 2014 03:00:20 -0000

Upstream has reworked installed-tests, use them for ptest.
Default output format for tests is not TAP, add patch to generate TAP output.
Run tests with gnome-desktop-testing-runner, which understands TAP output.

Tested on nuc with core-image-clutter and core-image-weston.

Reminder that for "pure" wayland (e.g. core-image-weston) you need to "export CLUTTER_BACKEND = wayland" to get past setting the DISPLAY variable expected for X11 backend.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc        |  4 +++-
 .../run-installed-tests-with-tap-output.patch        | 20 ++++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-1.0/run-ptest  |  3 +++
 meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb  |  4 +++-
 4 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0/run-ptest

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 77035d7..3929765 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter
+inherit clutter ptest-gnome
 
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGE_BEFORE_PN += "${PN}-examples"
@@ -39,6 +39,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
 FILES_${PN}-dbg += "${libdir}/clutter/examples/.debug"
 FILES_${PN}-examples = "${libdir}/clutter/examples"
 
+FILES_${PN}-dbg += "${libexecdir}/installed-tests/.debug"
+
 do_configure_prepend() {
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
 	touch -t 200001010000 ${S}/po/clutter-1.0.pot
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
new file mode 100644
index 0000000..80acab8
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
@@ -0,0 +1,20 @@
+Configure output from installed-tests to be TAP compliant, such that gnome-desktop-testing-runner properly interprets the results.
+
+Upstream-status: Pending
+
+Signed-off-by: Tim Orling <TicoTimo@gmail.com>
+
+Index: clutter-1.20.0/build/autotools/glib-tap.mk
+===================================================================
+--- clutter-1.20.0.orig/build/autotools/glib-tap.mk
++++ clutter-1.20.0/build/autotools/glib-tap.mk
+@@ -128,7 +128,8 @@ installed_test_meta_DATA = $(installed_t
+ 	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
+ 	echo 'Type=session' >> $@.tmp; \
+ 	echo 'TestEnvironment=G_ENABLE_DIAGNOSTIC=0;CLUTTER_ENABLE_DIAGNOSTIC=0;' >> $@.tmp; \
+-	echo 'Exec=$(installed_testdir)/$<' >> $@.tmp; \
++	echo 'Exec=$(installed_testdir)/$< --tap' >> $@.tmp; \
++	echo 'Output=TAP' >> $@.tmp; \
+ 	mv $@.tmp $@)
+ 
+ CLEANFILES += $(installed_test_meta_DATA)
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-ptest b/meta/recipes-graphics/clutter/clutter-1.0/run-ptest
new file mode 100644
index 0000000..98877e5
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner clutter
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
index 7898810..5f39a3a 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI[archive.md5sum] = "a8a33a57a944c6d7c7c013ce9aa3222b"
 SRC_URI[archive.sha256sum] = "cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293"
 
-SRC_URI += "file://install-examples.patch"
+SRC_URI += "file://install-examples.patch \
+            file://run-installed-tests-with-tap-output.patch \
+            file://run-ptest"
-- 
1.9.3


