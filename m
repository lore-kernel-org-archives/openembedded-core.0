Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BA0C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:07:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.584.1702501663461501729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UZUGLbxX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20231213210740fe59ae7a40b634c357-oahxxi@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20231213210740fe59ae7a40b634c357
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 Dec 2023 22:07:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9PbhlvWg1EBy3WxAHGgpBk/TGw9VhER1UlbboMyFbbI=;
 b=UZUGLbxXqRMCPhRQQJF04Er14FOaB61x3jyaIaXjBnZpYM+pSXy7CzXxXg5S5z3fKdXRVw
 zdlkI+JhbeQS5wIIccopFdeEdJRRAb3HDN8B6WDsg00ukPiiOVLTdhvP6miQz1HIonzptZK8
 g4kANJf+WmBL4nuUKuWDeADBhWfyw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] dtc: pass version as parameter instead of querying git
Date: Wed, 13 Dec 2023 22:07:03 +0100
Message-Id: <20231213210703.667740-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192325

From: Peter Marko <peter.marko@siemens.com>

Since switch from Makefile to meson based build,
the version is no longer hardcoded but queried from git tag.

This works only if git history is available.
When shallow tarballs are used, tag is not available.

Example error for trusted-firmware-a from meta-arm:
dtc version too old (039a994), you need at least version 1.4.4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...n-as-parameter-instead-of-querying-g.patch | 49 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  7 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-instead-of-querying-g.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-instead-of-querying-g.patch b/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-instead-of-querying-g.patch
new file mode 100644
index 0000000000..d7906bd6f9
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-instead-of-querying-g.patch
@@ -0,0 +1,49 @@
+From f32056f825b926b5820d43478d11e92eee1ec91f Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 13 Dec 2023 21:18:14 +0100
+Subject: [PATCH] meson: get version as parameter instead of querying git
+
+When using shallow tarballs, git tag is not available.
+This causes version to be git hash.
+This prevents application from checking minimal required version.
+
+Example error for trusted-firmware-a from meta-arm:
+dtc version too old (039a994), you need at least version 1.4.4
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ meson.build       | 3 ++-
+ meson_options.txt | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 78251eb..8a25163 100644
+--- a/meson.build
++++ b/meson.build
+@@ -55,9 +55,10 @@ py = import('python')
+ py = py.find_installation(required: get_option('python'))
+ swig = find_program('swig', required: get_option('python'))
+ 
+-version_gen_h = vcs_tag(
++version_gen_h = configure_file(
+   input: 'version_gen.h.in',
+   output: 'version_gen.h',
++  configuration: { 'VCS_TAG': get_option('PV')},
+ )
+ 
+ subdir('libfdt')
+diff --git a/meson_options.txt b/meson_options.txt
+index 82621c3..c313d32 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -10,3 +10,5 @@ option('python', type: 'feature', value: 'auto',
+        description: 'Build pylibfdt Python library')
+ option('static-build', type: 'boolean', value: false,
+        description: 'Build static binaries')
++option('PV', type: 'string', value: 'undefined',
++       description: 'version string to be used instead of getting it from git')
+-- 
+2.30.2
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 1a78a0c079..586a5f91bd 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
                     file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https" 
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-meson-get-version-as-parameter-instead-of-querying-g.patch \
+"
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -17,7 +20,7 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
+EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled -DPV=v${PV}"
 
 PACKAGECONFIG ??= "tools"
 PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native bison-native"
-- 
2.30.2


