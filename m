Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC9F26BE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 09:24:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8A9OGAW026608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:24:17 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 10 Sep 2013 02:24:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2013 17:24:14 +0800
Message-ID: <1378805054-18410-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] btrfs-tools: fix a parallel build issue
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
X-List-Received-Date: Tue, 10 Sep 2013 09:24:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../btrfs-progs-fix-parallel-build.patch           |   30 ++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build.patch
new file mode 100644
index 0000000..e461cdf
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/btrfs-progs-fix-parallel-build.patch
@@ -0,0 +1,30 @@
+btrfs-progs: fix parallel build
+
+Upstream-Status: Submitted [http://permalink.gmane.org/gmane.comp.file-systems.btrfs/28197]
+
+Parallel execution of "make install" may fail due to late creation of
+version.h, fix it by adding the dependence on version.h.
+
+The fix is similare to 7aaf00fc[btrfs-progs: fix parallel build]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c43cb68..40ef205 100644
+--- a/Makefile
++++ b/Makefile
+@@ -190,7 +190,7 @@ clean :
+ 	      $(libs) $(lib_links)
+ 	$(Q)$(MAKE) $(MAKEOPTS) -C man $@
+ 
+-install: $(libs) $(progs) install-man
++install: version.h $(libs) $(progs) install-man
+ 	$(INSTALL) -m755 -d $(DESTDIR)$(bindir)
+ 	$(INSTALL) $(progs) $(DESTDIR)$(bindir)
+ 	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 1c7f34f..650c164 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 PV = "0.20+git${SRCPV}"
 
 SRC_URI += "file://weak-defaults.patch"
+SRC_URI += "file://btrfs-progs-fix-parallel-build.patch"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.7.10.4


