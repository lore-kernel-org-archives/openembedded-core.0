Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E5C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:45:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.458.1635871511923037907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294769985"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="294769985"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575264"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:56 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 24/24] qemu.inc: Remove empty egg-info directories
 before running meson
Date: Wed,  3 Nov 2021 00:44:12 +0800
Message-Id: 
 <3cbe3e6f932151800793854ad5d3569dc6f36ab1.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157784

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This is the same solution that has been applied to meson.bbclass to
allow building with meson after it has been updated to a new
version. It needs to be applied here as well since qemu uses meson
without inheriting meson.bbclass.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d05227e910d3f374ba7a9763ff2584b9e40db61)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4c94060222..d51a1b0007 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest
+inherit pkgconfig ptest python3-dir
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -122,7 +122,11 @@ do_configure:prepend:class-native() {
 }
 
 do_configure() {
-    ${S}/configure ${EXTRA_OECONF}
+	# This is taken from meson.bbclass to avoid errors when updating to a
+	# new version of meson.
+	rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info 2>/dev/null || :
+
+	${S}/configure ${EXTRA_OECONF}
 }
 do_configure[cleandirs] += "${B}"
 
-- 
2.31.1


