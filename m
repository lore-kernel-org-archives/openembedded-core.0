Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F09C4167B
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fouIwGlJ;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734472; x=1680270472;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=F7Y7HBPpy5a/+XafExrh2lWpUDVS5wFy7qElkvunQt0=;
  b=fouIwGlJARHFj2YDJZsxisOnsOGZX+15+ISxNmgTuTpSSME3d7/qrXBu
   eDM0K7QzkxFe1bqrv1QmMAZw3pz33sen0giopN/n0m9TlAazpnHhwm9vG
   IUTrqxe0A2aGpmFFzB6bZxOfrrbjqXq9YWUZbDChAE0iQcW5qTXs4S8q9
   srx7PXjtf9mVcs4FYrDL0Tl8Aic3gMb7sRc1+iX5phlNeBlqA0RiZ4iSS
   a88FUNt1KeAFNgF0Er9PzURfCulfGFWYchYtXtpWJe4n++F1Eq+iOSByX
   rL0gR6wS5ROtwKBzkLGUNMib+DHO66xdC8HbGxi+vsJgCeMkgAwtm6mCd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551789"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551789"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542110"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/20] zip: modify when match.S is built
Date: Thu, 31 Mar 2022 21:47:10 +0800
Message-Id: 
 <0a5d1b1c617a152559c18ada394827de0db6031a.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163817

From: Joe Slater <joe.slater@windriver.com>

Avoid generating non-PIC code.

The patches are taken from master 58b16da805... but we cannot
cherry-pick because zip_3.0.bb context is different.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
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


