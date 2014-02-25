Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5145A6F361
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:40:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1P9eo3v028985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:40:50 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 01:40:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2014 17:44:05 +0800
Message-ID: <df347f4fd57689fa8810efe6faf4ee366b9e26c2.1393321369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393321369.git.liezhi.yang@windriver.com>
References: <cover.1393321369.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] dpkg-compiler.m4: remove -Wvla (fix build on CentOS 5.8)
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
X-List-Received-Date: Tue, 25 Feb 2014 09:40:49 -0000
Content-Type: text/plain

Remove the -Wvla flag from the set of compiler warning flags, since gcc
on old host systems such as CentOS 5.8 doesn't support it, and it
causes a build error for dpkg-native.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../dpkg/dpkg/no-vla-warning.patch                 | 32 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
new file mode 100644
index 0000000..0e57dbc
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
@@ -0,0 +1,32 @@
+From e94474d805377d67c8b09664a602f20969e12b8a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 23 Jan 2014 04:17:23 -0500
+Subject: [PATCH] dpkg-compiler.m4: remove -Wvla
+
+Remove the -Wvla flag from the set of compiler warning flags, since gcc
+on old host systems such as CentOS 5.8 doesn't support it, and it
+causes a build error for dpkg-native.
+
+Upstream-Status: Pending
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ m4/dpkg-compiler.m4 |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
+index f1c760b..500b5ad 100644
+--- a/m4/dpkg-compiler.m4
++++ b/m4/dpkg-compiler.m4
+@@ -72,7 +72,6 @@ if test "x$enable_compiler_warnings" = "xyes"; then
+   DPKG_WARNING_ALL([-Wformat-security])
+   DPKG_WARNING_ALL([-Wpointer-arith])
+   DPKG_WARNING_ALL([-Wlogical-op])
+-  DPKG_WARNING_ALL([-Wvla])
+   DPKG_WARNING_ALL([-Winit-self])
+   DPKG_WARNING_ALL([-Wwrite-strings])
+   DPKG_WARNING_ALL([-Wcast-align])
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index 5e407ba..5507352 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://noman.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
             file://glibc2.5-sync_file_range.patch \
+            file://no-vla-warning.patch \
            "
 
 SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
-- 
1.8.3.1


