Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02915C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 16:51:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.12465.1633366273427525687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="222944176"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="222944176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208883"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/11] glew: Stop polluting /tmp during builds
Date: Tue,  5 Oct 2021 00:50:51 +0800
Message-Id: 
 <f730707b3e00e5d9d145d55cdf479cd6d11a62f5.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 16:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156615

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the glew code creates a new directory in /tmp for each make
invocation. This is a bit ugly, don't do that. The patch does break the
dist targets but we don't use them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a55194f90e11da5671b24391a4aaf2b86a8e1e6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glew/glew/notempdir.patch                 | 19 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch

diff --git a/meta/recipes-graphics/glew/glew/notempdir.patch b/meta/recipes-graphics/glew/glew/notempdir.patch
new file mode 100644
index 0000000000..8d79ce0cdf
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/notempdir.patch
@@ -0,0 +1,19 @@
+We don't use the dist-* targets and hence DIST_DIR isn't used. The current code
+creates a new temp directory in /tmp/ for every invocation of make. Lets
+not do that.
+
+Upstream-Status: Pending [a revised version would be needed for upstream]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: glew-2.2.0/Makefile
+===================================================================
+--- glew-2.2.0.orig/Makefile
++++ glew-2.2.0/Makefile
+@@ -56,7 +56,6 @@ DIST_SRC_ZIP ?= $(shell pwd)/$(DIST_NAME
+ DIST_SRC_TGZ ?= $(shell pwd)/$(DIST_NAME).tgz
+ DIST_WIN32   ?= $(shell pwd)/$(DIST_NAME)-win32.zip
+ 
+-DIST_DIR := $(shell mktemp -d /tmp/glew.XXXXXX)/$(DIST_NAME)
+ 
+ # To disable stripping of linked binaries either:
+ #   - use STRIP= on gmake command-line
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index 92b6083648..d7a26a3438 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://0001-Fix-build-race-in-Makefile.patch \
+           file://notempdir.patch \
            file://no-strip.patch"
 
 SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
-- 
2.31.1


