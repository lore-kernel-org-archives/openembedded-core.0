Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C65EC41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 18:56:02 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.1221.1702752955424022735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 10:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ci1iIjRU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202312161855511042bbaaed0cc360fc-zivr8t@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202312161855511042bbaaed0cc360fc
        for <openembedded-core@lists.openembedded.org>;
        Sat, 16 Dec 2023 19:55:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5JsV1hQ8iu7W2PcmT0PGO8lPo86j1eLUyKM3YFpv/D8=;
 b=Ci1iIjRU6eCCYn/cE/tYWHlUl3D93zp88I6NJmom4sLJPucBDf89mzHoZ+9lqZ4x55gj2l
 Iq35wIrX1XOGhrhyNcdKZM80TR1Bi2qOekTaFTu/sZeQVepe7j5erRrM00VH9tCD57qRB6tv
 hnMg+6mt5CCyS2VK+6xDJJhH9vPfw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] dtc: preserve version also from shallow git clones
Date: Sat, 16 Dec 2023 19:55:04 +0100
Message-Id: <20231216185504.25947-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 18:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192567

From: Peter Marko <peter.marko@siemens.com>

Since switch from Makefile to meson based build,
the version is no longer hardcoded but queried from git tag.

This works only if git history is available.
When shallow tarballs are used, tag is not available.

Example error for trusted-firmware-a from meta-arm:
dtc version too old (039a994), you need at least version 1.4.4

Backport also patch to fix version in meson file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...01-meson.build-bump-version-to-1.7.0.patch | 29 ++++++++++++++
 ...n-allow-building-from-shallow-clones.patch | 38 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  6 ++-
 3 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
new file mode 100644
index 0000000000..79a3b92b44
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
@@ -0,0 +1,29 @@
+From 9153522103bd4ed7e3299c4d073f66bb37cb2d42 Mon Sep 17 00:00:00 2001
+From: Nikolay Letov <letov.nikolay@gmail.com>
+Date: Wed, 22 Feb 2023 13:36:07 +0300
+Subject: [PATCH 1/2] meson.build: bump version to 1.7.0
+
+[This was botched in the actual 1.7.0 release :( - David Gibson]
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=64a907f08b9bedd89833c1eee674148cff2343c6]
+
+Signed-off-by: Nikolay Letov <letov.nikolay@gmail.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 78251eb..d88cd9f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project('dtc', 'c',
+-  version: '1.6.0',
++  version: '1.7.0',
+   license: ['GPL2+', 'BSD-2'],
+   default_options: 'werror=true',
+ )
+-- 
+2.30.2
+
diff --git a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
new file mode 100644
index 0000000000..0284905913
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
@@ -0,0 +1,38 @@
+From 4415b0baece3c4351a6d3637c2754abbefd4795d Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sat, 16 Dec 2023 18:58:31 +0100
+Subject: [PATCH 2/2] meson: allow building from shallow clones
+
+When building from shallow clone, tag is not available
+and version defaults to git hash.
+Problem is that some builds check DTC version and fail the comparison.
+Example is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
+Which fails to build with following error:
+dtc version too old (039a994), you need at least version 1.4.4
+
+Drop --always from git describe command, see
+https://github.com/mesonbuild/meson/blob/1.3.0/mesonbuild/utils/universal.py#L773
+This will make it more closer to build via Makefile.
+
+Upstream-Status: Submitted [https://github.com/dgibson/dtc/pull/122]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 78251eb..fc0c92a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -56,6 +56,7 @@ py = py.find_installation(required: get_option('python'))
+ swig = find_program('swig', required: get_option('python'))
+ 
+ version_gen_h = vcs_tag(
++  command: ['git', 'describe', '--dirty=+'],
+   input: 'version_gen.h.in',
+   output: 'version_gen.h',
+ )
+-- 
+2.30.2
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 1a78a0c079..0702fc16df 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -8,7 +8,11 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
                     file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https" 
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-meson.build-bump-version-to-1.7.0.patch \
+    file://0002-meson-allow-building-from-shallow-clones.patch \
+"
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


