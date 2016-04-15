Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DE2DD731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 10:20:27 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qmYT65DYDz3hjNk;
	Fri, 15 Apr 2016 12:20:26 +0200 (CEST)
X-Auth-Info: zJ+whTcd+Sa0CSNW2mbCMzr0rFD6Vt1do2UBaWrgfT8=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qmYSy09SKzvdWQ;
	Fri, 15 Apr 2016 12:20:17 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 12:20:15 +0200
Message-Id: <1460715615-4992-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH] rpm: Disable __sync_add_and_fetch_8 on nios2
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
X-List-Received-Date: Fri, 15 Apr 2016 10:20:28 -0000

The NIOS2 softcore does not implement the __sync_add_and_fetch_8,
so disable it accordingly.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 ...1-Disable-__sync_add_and_fetch_8-on-nios2.patch | 30 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  1 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch b/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
new file mode 100644
index 0000000..e9b73b8
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
@@ -0,0 +1,30 @@
+From 06967a50f20095f5ca30b8214f4c98ba0f5262bf Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Sun, 3 Apr 2016 06:55:25 +0200
+Subject: [PATCH] Disable __sync_add_and_fetch_8 on nios2
+
+The NIOS2 softcore does not implement the __sync_add_and_fetch_8,
+so disable it accordingly.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Submitted
+---
+ rpmio/bson.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rpmio/bson.h b/rpmio/bson.h
+index 57023f1..60c7d02 100644
+--- a/rpmio/bson.h
++++ b/rpmio/bson.h
+@@ -880,7 +880,7 @@ BSON_END_DECLS
+ BSON_BEGIN_DECLS
+ 
+ /* Some architectures do not support __sync_add_and_fetch_8 */
+-#if (__mips == 32) || (defined(__PPC__) && !defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
++#if (__mips == 32) || (__nios2__) || (defined(__PPC__) && !defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
+ # define __BSON_NEED_ATOMIC_64 1
+ #endif
+ 
+-- 
+2.8.0.rc3
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index c6c21b8..0991f6d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -110,6 +110,7 @@ SRC_URI += " \
 	   file://rpm-python-tagname.patch \
 	   file://rpm-python-AddErase.patch \
 	   file://rpm-rpmpgp-popt.patch \
+	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
 "
 
 # OE specific changes
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 9e2229a..cbdca88 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -115,6 +115,7 @@ SRC_URI += " \
 	   file://rpm-rpmpgp-popt.patch \
 	   file://rpm-fix-lua-tests-compilation-failure.patch \
 	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
+	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
 "
 
 # OE specific changes
-- 
2.7.0


