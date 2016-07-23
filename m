Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60537601D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jul 2016 21:52:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 23 Jul 2016 14:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,411,1464678000"; d="scan'208";a="852018351"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga003.jf.intel.com with ESMTP; 23 Jul 2016 14:52:12 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 14:53:00 -0700
Message-Id: <1469310780-17075-1-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH] grub: Fix build with gcc-6
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
X-List-Received-Date: Sat, 23 Jul 2016 21:52:12 -0000

From: Khem Raj <raj.khem@gmail.com>

[YOCTO #9897] (Fedora-24 host is gcc-6)

Backport patch which silences following

'../../grub-2.00/grub-core/'`gfxmenu/model.c
../../grub-2.00/grub-core/gettext/gettext.c:37:36: error: storage size of 'main_context' isn't known
 static struct grub_gettext_context main_context, secondary_context;
                                    ^~~~~~~~~~~~
make[3]: *** [gettext/gettext_module-gettext.o] Error 1

(From OE-Core rev: 4efac9861ab59d696bdc81ea59497febfa2d0dc8)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...ettext-gettext.c-main_context-secondary_c.patch | 39 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch

diff --git a/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch b/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
new file mode 100644
index 0000000..6ec2363
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
@@ -0,0 +1,39 @@
+From f30c692c1f9ef0e93bee2b408a24baa017f1ca9d Mon Sep 17 00:00:00 2001
+From: Vladimir Serbinenko <phcoder@gmail.com>
+Date: Thu, 7 Nov 2013 01:01:47 +0100
+Subject: [PATCH] 	* grub-core/gettext/gettext.c (main_context),
+ (secondary_context): 	Define after defining type and not before.
+
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ ChangeLog                   | 5 +++++
+ grub-core/gettext/gettext.c | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index df73570..4880cef 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -34,8 +34,6 @@ GRUB_MOD_LICENSE ("GPLv3+");
+    http://www.gnu.org/software/autoconf/manual/gettext/MO-Files.html .
+ */
+ 
+-static struct grub_gettext_context main_context, secondary_context;
+-
+ static const char *(*grub_gettext_original) (const char *s);
+ 
+ struct grub_gettext_msg
+@@ -69,6 +67,8 @@ struct grub_gettext_context
+   struct grub_gettext_msg *grub_gettext_msg_list;
+ };
+ 
++static struct grub_gettext_context main_context, secondary_context;
++
+ #define MO_MAGIC_NUMBER 		0x950412de
+ 
+ static grub_err_t
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 146dde6..aca6e9b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
            file://fix-texinfo.patch \
+           file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
             "
 
 DEPENDS = "flex-native bison-native"
-- 
2.7.4


