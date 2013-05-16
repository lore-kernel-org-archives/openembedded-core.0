Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xiao.zhang@windriver.com>) id 1UcwKC-0004Sj-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 13:26:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4G7Qg66029471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 00:26:42 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 16 May 2013 00:26:42 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <xiao.zhang@windriver.com>
Date: Thu, 16 May 2013 15:26:26 +0800
Message-ID: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.21]
Subject: [PATCH] util-linux: replace package files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 11:26:21 -0000
Content-Type: text/plain

Move libuuid.so, libmount.so and libblkid.so from util-linux's dev RPM
package to related library's dev RPM packages.

[YOCTO #4500]
[CQID: WIND00412705]

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../util-linux-replace-package-files.patch         |   56 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.22.2.bb  |    1 +
 2 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-replace-package-files.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-replace-package-files.patch b/meta/recipes-core/util-linux/util-linux/util-linux-replace-package-files.patch
new file mode 100644
index 0000000..32868cc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-replace-package-files.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Pending
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com> 
+
+Move libuuid.so, libmount.so and libblkid.so from util-linux's dev RPM
+package to related library's dev RPM packages.
+---
+ libblkid/src/Makemodule.am |    6 +-----
+ libmount/src/Makemodule.am |    6 +-----
+ libuuid/src/Makemodule.am  |    6 +-----
+ 3 files changed, 3 insertions(+), 15 deletions(-)
+
+--- util-linux-2.22.2/libuuid/src/Makemodule.am.orig
++++ util-linux-2.22.2/libuuid/src/Makemodule.am
+@@ -42,11 +42,7 @@ install-exec-hook-libuuid:
+ 	if test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so.* $(DESTDIR)$(libdir); \
+-		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libuuid.so); \
+-		so_img_rel_target=$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
+-		(cd $(DESTDIR)$(usrlib_execdir) && \
+-			rm -f libuuid.so && \
+-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libuuid.so); \
++		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so $(DESTDIR)$(libdir); \
+ 	fi
+ 
+ uninstall-hook-libuuid:
+--- util-linux-2.22.2/libmount/src/Makemodule.am.orig
++++ util-linux-2.22.2/libmount/src/Makemodule.am
+@@ -123,11 +123,7 @@ install-exec-hook-libmount:
+ 	if test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libmount.so.* $(DESTDIR)$(libdir); \
+-		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libmount.so); \
+-		so_img_rel_target=$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
+-		(cd $(DESTDIR)$(usrlib_execdir) && \
+-			rm -f libmount.so && \
+-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libmount.so); \
++		mv $(DESTDIR)$(usrlib_execdir)/libmount.so $(DESTDIR)$(libdir); \
+ 	fi
+ 
+ uninstall-hook-libmount:
+--- util-linux-2.22.2/libblkid/src/Makemodule.am.orig
++++ util-linux-2.22.2/libblkid/src/Makemodule.am
+@@ -219,11 +219,7 @@ install-exec-hook-libblkid:
+ 	if test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so.* $(DESTDIR)$(libdir); \
+-		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libblkid.so); \
+-		so_img_rel_target=$$(echo $(usrlib_execdir) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
+-		(cd $(DESTDIR)$(usrlib_execdir) && \
+-			rm -f libblkid.so && \
+-			$(LN_S) $$so_img_rel_target$(libdir)/$$so_img_name libblkid.so); \
++		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so $(DESTDIR)$(libdir); \
+ 	fi
+ 
+ uninstall-hook-libblkid:
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index 43a55a6..526308d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://configure-sbindir.patch \
             file://fix-configure.patch \
             file://mbsalign-license.patch \
+            file://util-linux-replace-package-files.patch \
 "
 
 SRC_URI[md5sum] = "3e379b4d8b9693948d751c154614c73e"
-- 
1.7.1



