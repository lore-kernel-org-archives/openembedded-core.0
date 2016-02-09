Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 353FC73212
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:31:26 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q029V5j9vz3hjlD;
	Tue,  9 Feb 2016 12:31:26 +0100 (CET)
X-Auth-Info: nig+uG8PQX96E296yUifKGKxq5focxnsqahqj8tVgIc=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q029V3c8kzvdWV;
	Tue,  9 Feb 2016 12:31:26 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 12:31:08 +0100
Message-Id: <1455017471-6682-4-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455017471-6682-1-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 4/7] guile: Fix nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 11:31:26 -0000

Add minor patch to recognize nios2 build target.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...002-Recognize-nios2-as-compilation-target.patch | 36 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch

diff --git a/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch b/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
new file mode 100644
index 0000000..519585b
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
@@ -0,0 +1,36 @@
+From 76155065c70b5ab65c6c805423183b360141db84 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 28 Jan 2016 04:46:23 +0100
+Subject: [PATCH] Recognize nios2 as compilation target
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Submitted [ http://debbugs.gnu.org/cgi/bugreport.cgi?bug=22480 ]
+---
+ module/system/base/target.scm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/module/system/base/target.scm b/module/system/base/target.scm
+index d60a8e0..d1f6cff 100644
+--- a/module/system/base/target.scm
++++ b/module/system/base/target.scm
+@@ -65,7 +65,7 @@
+       (cond ((string-match "^i[0-9]86$" cpu)
+              (endianness little))
+             ((member cpu '("x86_64" "ia64"
+-                           "powerpcle" "powerpc64le" "mipsel" "mips64el"))
++                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2"))
+              (endianness little))
+             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
+                            "mips" "mips64"))
+@@ -100,7 +100,7 @@
+ 
+           ((string-match "64$" cpu) 8)
+           ((string-match "64[lbe][lbe]$" cpu) 8)
+-          ((member cpu '("sparc" "powerpc" "mips" "mipsel")) 4)
++          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2")) 4)
+           ((string-match "^arm.*" cpu) 4)
+           (else (error "unknown CPU word size" cpu)))))
+ 
+-- 
+2.7.0.rc3
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index 6815e25..6cefe66 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch \
            file://remove_strcase_l_funcs.patch \
            file://0001-libguile-Check-for-strtol_l-during-configure.patch \
+           file://0002-Recognize-nios2-as-compilation-target.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
2.1.4


