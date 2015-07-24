Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 08E1376239
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 16:17:47 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BBFB7F811DE; Fri, 24 Jul 2015 10:17:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3A0B9F811D8;
	Fri, 24 Jul 2015 10:17:46 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 10:17:48 -0600
Message-Id: <1437754668-23055-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] libepoxy: Don't try to use python3 during configuration
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
X-List-Received-Date: Fri, 24 Jul 2015 16:17:48 -0000

No need to try for python3 as python2.7+ will do fine.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../libepoxy/libepoxy/no-need-for-python3.patch      | 20 ++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_git.bb       |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
new file mode 100644
index 0000000..dc5ef28
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
@@ -0,0 +1,20 @@
+There is no need to use python3 by this package (the python scripts
+that are using during configuration only need python2.7+)
+
+Upstream-Status: innapropriate [configuration]
+
+Signed-off-by: Gary Thomas <gary@mlbassoc.com>
+--
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -40,7 +40,7 @@ m4_ifndef([XORG_MACROS_VERSION],
+ XORG_MACROS_VERSION(1.8)
+ XORG_DEFAULT_OPTIONS
+ 
+-AC_CHECK_PROGS([PYTHON], [python3 python2 python])
++AC_CHECK_PROGS([PYTHON], [python2 python])
+ 
+ # Initialize libtool
+ AC_DISABLE_STATIC
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index 9816257..535af5d 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     git://github.com/anholt/libepoxy.git \
     file://0001-select-platforms-based-on-configuration-results.patch \
     file://0002-add-an-option-to-disable-glx-support.patch \
+    file://no-need-for-python3.patch \
 "
 SRCREV="20062c25e7612cab023cdef44d3277ba1bd0b2de"
 PV = "1.2+git${SRCPV}"
-- 
1.9.1


