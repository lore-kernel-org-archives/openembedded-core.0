Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCAA6A4DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 10:59:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r54AxiEm028830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 03:59:45 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 03:59:44 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jun 2013 06:59:40 -0400
Message-ID: <3c7774bfa3d8f94f3af8cb69cd916aa4de4d89d0.1370343476.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370343476.git.jackie.huang@windriver.com>
References: <cover.1370343476.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-0.97: fix the objcopy error in configure
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
X-List-Received-Date: Tue, 04 Jun 2013 10:59:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Get patch from ubuntu to fix this:
error: GRUB requires a working absolute objcopy; upgrade your binutils

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../grub/grub-0.97/objcopy-absolute.patch          |   40 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch

diff --git a/meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch b/meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch
new file mode 100644
index 0000000..bd8e0a8
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch
@@ -0,0 +1,40 @@
+
+This patch is from ubuntu:
+  * objcopy-absolute.diff (update): Remove .note, .comment, and
+    .note.gnu.build-id sections from images (LP: #444703).
+
+Upstream-Status: Inappropriate [no longer maintained]
+
+Index: b/acinclude.m4
+===================================================================
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -61,7 +61,7 @@
+   else
+     AC_MSG_ERROR([${CC-cc} cannot link at address $link_addr])
+   fi
+-  if AC_TRY_COMMAND([${OBJCOPY-objcopy} -O binary conftest.exec conftest]); then :
++  if AC_TRY_COMMAND([${OBJCOPY-objcopy} --only-section=.text -O binary conftest.exec conftest]); then :
+   else
+     AC_MSG_ERROR([${OBJCOPY-objcopy} cannot create binary files])
+   fi
+Index: b/stage1/Makefile.am
+===================================================================
+--- a/stage1/Makefile.am
++++ b/stage1/Makefile.am
+@@ -12,4 +12,4 @@
+
+ SUFFIXES = .exec
+ .exec:
+-	$(OBJCOPY) -O binary $< $@
++	$(OBJCOPY) -O binary -R .note -R .comment -R .note.gnu.build-id $< $@
+Index: b/stage2/Makefile.am
+===================================================================
+--- a/stage2/Makefile.am
++++ b/stage2/Makefile.am
+@@ -293,4 +293,4 @@
+ # General rule for making a raw binary.
+ SUFFIXES = .exec
+ .exec:
+-	$(OBJCOPY) -O binary $< $@
++	$(OBJCOPY) -O binary -R .note -R .comment -R .note.gnu.build-id $< $@
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 5ba1a08..6971193 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -16,6 +16,7 @@ SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
             file://no-reorder-functions.patch \
             file://autohell.patch \
             file://grub_fix_for_automake-1.12.patch \
+            file://objcopy-absolute.patch \
             "
 
 SRC_URI[md5sum] = "cd3f3eb54446be6003156158d51f4884"
-- 
1.7.9.5


