Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16CA775771
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 05:41:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t515f9A2024320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 May 2015 22:41:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 22:41:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 May 2015 22:41:08 -0700
Message-ID: <da6567b5a4f3e8de65f1c21dfc1ac9a8a52da84b.1433137188.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433137188.git.liezhi.yang@windriver.com>
References: <cover.1433137188.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Mon, 01 Jun 2015 05:41:09 -0000
Content-Type: text/plain

* Updated fix-parallel.patch
* The 4.0.1 switched to autotools, but inherit autotools doesn't work:
  | make: *** No rule to make target `ctree.o', needed by `btrfs'.  Stop.

  so inherit autotools-brokensep

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   16 ++++++++--------
 .../btrfs-tools/btrfs-tools_git.bb                 |   16 +++++++++-------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
index 65c31a4..bbc53c6 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
@@ -11,20 +11,20 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- Makefile |    2 +-
+ Makefile.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 9c69ada..30c6f06 100644
---- a/Makefile
-+++ b/Makefile
-@@ -118,7 +118,7 @@ else
- 	AM_CFLAGS += -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
+diff --git a/Makefile.in b/Makefile.in
+index 860a390..8a6fbd7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -142,7 +142,7 @@ else
+ 	check_echo = true
  endif
  
 -%.o.d: %.c
 +%.o.d: %.c version.h
- 	$(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o) -MT $@ $(AM_CFLAGS) $(CFLAGS) $<
+ 	$(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o) -MT $@ $(CFLAGS) $<
  
  .c.o:
 -- 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index d86075c..82403aa 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,19 +12,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
-SRCREV = "344599a7aefe23c7169ccdde3ad1b921bb60024c"
+SRCREV = "c061b303c08af7a58373908d0d77ef0f1161fd36"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
 "
 
-S = "${WORKDIR}/git"
-
-PV = "3.18.2+git${SRCPV}"
+inherit autotools-brokensep pkgconfig
 
-EXTRA_OEMAKE += "DISABLE_DOCUMENTATION=1"
+EXTRA_OECONF += "--disable-documentation"
 
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
+do_configure_prepend() {
+      sh autogen.sh
 }
 
+S = "${WORKDIR}/git"
+
+PV = "4.0.1+git${SRCPV}"
+
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


