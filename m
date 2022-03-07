Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E88C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.26743.1646662439326190152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=el1YBB3t;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662440; x=1678198440;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hfsTfGnM64S6cTzO0YYIIgOR3GarUs6p1eW9xIAzRM4=;
  b=el1YBB3tYNOJXFMwK73TtljcIw4/JD0/YGHe+fGl9IFtfMaUpjVWLvH+
   UF4/qJofJuodls1g8q8BxmzUJFgygzTYXehnwxRlRxzTyPXjznefKVFt3
   R0gW3IyV7EBGL9qqydhHGBHXU2Qm+4I74yaXHPlfo3HT/8YpNLJICYyq8
   WZybeHC4K/YldWsRpSIxwxhPd65vpjbDC2NeADMrCqgqYP2+luYVsqjag
   XB5vIBQ3L1uetCyZB1XzO9A+vUOBxA21lR3nFk9LqjcOOwCJHD8vwL/kt
   X8rRpBkBRZt/K+sVxSFIkV/enerrFr3FvoPJ5X21g8U3C4pIaujMnCwEh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112558"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112558"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070863"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:29 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/25] zip: modify when match.S is built
Date: Mon,  7 Mar 2022 22:09:51 +0800
Message-Id: 
 <1c80e0bf1cd8ed171b6ec029d41bc923f1104a7b.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162836

From: Joe Slater <joe.slater@windriver.com>

Use the correct $CPP to test if *.S are buildable,
but do not build match.S because it is not PIC code.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58b16da805b774465f15c8bee59f8361a47ccd4e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-configure-use-correct-CPP.patch      | 47 +++++++++++++++++++
 ...002-configure-support-PIC-code-build.patch | 34 ++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
new file mode 100644
index 0000000000..02253f968c
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
@@ -0,0 +1,47 @@
+From 7a2729ee7f5d9b9d4a0d9b83fe641a2ab03c4ee0 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:36:59 -0800
+Subject: [PATCH 1/2] configure: use correct CPP
+
+configure uses CPP to test that two assembler routines
+can be built. Unfortunately, it will use /usr/bin/cpp
+if it exists, invalidating the tests.  We use the $CC
+passed to configure.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 73ba803..7e21070 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -220,13 +220,16 @@ fi
+ echo Check for the C preprocessor
+ # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
+ CPP="${CC} -E"
++
++# We should not change CPP for yocto builds.
++#
+ # solaris as(1) needs -P, maybe others as well ?
+-[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
+-[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
+-[ -f /lib/cpp ] && CPP=/lib/cpp
+-[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
+-[ -f /xenix ] && CPP="${CC} -E"
+-[ -f /lynx.os ] && CPP="${CC} -E"
++# [ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
++# [ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
++# [ -f /lib/cpp ] && CPP=/lib/cpp
++# [ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
++# [ -f /xenix ] && CPP="${CC} -E"
++# [ -f /lynx.os ] && CPP="${CC} -E"
+ 
+ echo "#include <stdio.h>" > conftest.c
+ $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
new file mode 100644
index 0000000000..6e0879616a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
@@ -0,0 +1,34 @@
+From b0492506d2c28581193906e9d260d4f0451e2c39 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 24 Feb 2022 17:46:03 -0800
+Subject: [PATCH 2/2] configure: support PIC code build
+
+Disable building match.S. The code requires
+relocation in .text.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ unix/configure | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 7e21070..1bc698b 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -242,8 +242,9 @@ if eval "$CPP match.S > _match.s 2>/dev/null"; then
+   if test ! -s _match.s || grep error < _match.s > /dev/null; then
+     :
+   elif eval "$CC -c _match.s >/dev/null 2>/dev/null" && [ -f _match.o ]; then
+-    CFLAGS="${CFLAGS} -DASMV"
+-    OBJA="match.o"
++    # disable match.S for PIC code
++    # CFLAGS="${CFLAGS} -DASMV"
++    # OBJA="match.o"
+     echo "int foo() { return 0;}" > conftest.c
+     $CC -c conftest.c >/dev/null 2>/dev/null
+     echo Check if compiler generates underlines
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 18b5d8648e..f8e0b6e259 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
            file://zipnote-crashes-with-segfault.patch \
+           file://0001-configure-use-correct-CPP.patch \
+           file://0002-configure-support-PIC-code-build.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.35.1


