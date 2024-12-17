Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DB3E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.77339.1734425901590967827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mcGI2D6J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425902; x=1765961902;
  h=from:to:cc:subject:date:message-id;
  bh=XQpt94D3tWssABBGu7QHhO9UPD0Xx98pU1ah6kOnYh8=;
  b=mcGI2D6JLYc+yAnsyJ/U3GhlC1rJ4KItRzqQ9yDNYFsgPL/pjIuSZCJO
   fleZYYvfvHfuycd3MM2lJh7xMJRjRX+WYCwCf4yws5OWXBcO+p3+TzSIL
   POdGowJFDTqt9hhxiNT/RaNNNUkNUnWYOonVTKPsgA5vCfGdUCXes5eE/
   PRZ66euj0C64mMwSR+1Z6tSLgJ+iazokcp2g8ZEGyWC5k3/uoewKzEO4S
   7cAc+I8n/oznp8oJ9yhfa7zxm9kdXK/8ddIFpfMZIuH6aCYKrvrkcWImK
   Z7bBrGIUK6qyAtRTfbs7C7mgDKZ0rxFfsoVr+Wq59+q3XRLtEbu7I49we
   w==;
X-CSE-ConnectionGUID: C2qTpU1XTU6eflN2M3V0nA==
X-CSE-MsgGUID: 6NRafEohSXqu1F7Y9P+OuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184047844"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184047844"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:20 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F403FD4C36
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C6DD0D9004
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 566A76B9B4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFB1D1A000B;
	Tue, 17 Dec 2024 16:58:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 01/21] appstream: upgrade 1.0.3 -> 1.0.4
Date: Tue, 17 Dec 2024 16:57:47 +0800
Message-Id: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--7.641100-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yRIRh9wkXSlFe8hLMDfeeZ5XGTbsQqHbkviP
	J2xaM62R+BtDYmoqPpZZCpXjPNlq+B5rjfCe1gk2Yrc32n84WHqOVGny5q72hiWxD2S0xfx/B62
	LwhkqRsXdGrWq1bnu45YOG2yMM8UYAT50DdFZRK/wlvzzUUaf2YlmiVXQNUKc0YwZgVrGvUQ/sz
	hjnEtJOdN23itRglmPamUJU1gWJBj+SlsNiFQeMyeaCBMY8cEn2+EDPw+8xrc6FHRWx2FGsFYMJ
	R3dIrh2sd3S4BC9iD4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl37eSx3aBKhlgCoL
	/+EwnE4gRR2pqoQBmRva04rFI5uqvxG9aQOyePlZNYSHk3Zr0UPeRdiIlVJExhd4pAveWGyjxYy
	RBa/qJcFwgTvxipFa9xS3mVzWUuA4wHSyGpeEegLk6+a57VXv08TGQQp7CIjs9nb6afX/+p7kHm
	1Cew4lzxQaw5gTmkA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208805

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-remove-hardcoded-path.patch
0002-Do-not-build-qt-tests.patch
refreshed for 1.0.4

Changelog:
===========
Features:
 * bundle: Add AS_BUNDLE_KIND_SYSUPDATE
 * desktop-style-ids: Add dark support for Plasma
 * desktop-style-ids: add pantheon:dark
 * qt: Expose branding color
 * sysinfo: Add memory size detection support for Illumos and Solaris
 * sysinfo: Add memory size detection support for GNU/Hurd
 * validator: Don't fail validation if a snapshot release is missing a time

Specification:
 * docs: Note that support for some legacy path was dropped in 1.0
 * docs: Update fd.o spec URLs
 * docs: Better explain desktop applications
 * Update ESRA website URL

Bugfixes:
 * validator: Make sure we read an initialised variable
 * qt: Specify utc as the dates' timezone
 * tests: Ignore some tests on Windows
 * sysinfo: make uname() usage POSIX compliant
 * Only emit legacy compat tag developer_name for catalog data
 * compose: Allow file discovery even in symlinked directories
 * Avoid a race condition when loading GResource data
 * validator: Mention length limit in summary length warning message
 * utils: Explicitly set permissions on installed metadata files
 * as-vercmp: Fix gtkdoc to not start with '>'

Miscellaneous:
 * desktop-style-ids: Remove Endless
 * ci: Fix FreeBSD build (update 'py-gi-docgen')
 * ci: Update to Ubuntu 24.04 for Debian Testing builds
 * utils: Assume 64px as size when installing an icon tarball of unknown size

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 .../appstream/{appstream_1.0.3.bb => appstream_1.0.4.bb}    | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.3.bb => appstream_1.0.4.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index d4d5517ab1..03ac5eb05b 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 03f00252c2fc948c0bce1fc0a6ee87adef71d1bb Mon Sep 17 00:00:00 2001
+From 7372848f22d7edc01e40b0533047b34f41f6cf71 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 5f2eaa22..4a2483a1 100644
+index 7e89ab0..c34ea74 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -191,10 +191,10 @@ endif
+@@ -194,10 +194,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 9a725ab8e4..71c9aadbc9 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From a7721cf4f412fbe18fe15127bea7b1457b99f684 Mon Sep 17 00:00:00 2001
+From 43afdff090c4cbb2d3b4025a38b25a718c8f16b5 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 1909bcf7..c3ca20fb 100644
+index 7d9ed7d..e319425 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -148,5 +148,3 @@ install_data (
+@@ -150,5 +150,3 @@ install_data (
  
  # end of Qt version loop
  endforeach
diff --git a/meta/recipes-support/appstream/appstream_1.0.3.bb b/meta/recipes-support/appstream/appstream_1.0.4.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.3.bb
rename to meta/recipes-support/appstream/appstream_1.0.4.bb
index 092d85d1a0..a9c87f7589 100644
--- a/meta/recipes-support/appstream/appstream_1.0.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.4.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
+SRC_URI[sha256sum] = "2d218348067f98c4f34a3ffe2d8219ad9f504b1b2481f1872dec66c77bf37509"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.43.0


