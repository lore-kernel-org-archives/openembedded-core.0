Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 802C16012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 10:22:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tARAMrDx014232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:22:53 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 Nov 2015 02:22:53 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Nov 2015 18:22:51 +0800
Message-ID: <8bdde49168d630f5c65c86db8fadacf1968bd39f.1448619641.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448619641.git.jackie.huang@windriver.com>
References: <cover.1448619641.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python: Fix cross compiling issue
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
X-List-Received-Date: Fri, 27 Nov 2015 10:22:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If the target and host have the same type, the system
may try to execute the instructions from the target
version.  This can lead to illegal instructions
as well as the wrong copy of the code running.

Add CROSSPYTHONPATH for PYTHON_FOR_BUILD and export
the correct path to fix it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch

diff --git a/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
new file mode 100644
index 0000000..5ba5480
--- /dev/null
+++ b/meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -0,0 +1,31 @@
+configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
+
+When building x86->x86 the system will try to execute .so and related items
+from the default PYTHONPATH.  This will fail if the target CPU contains
+instructions that the host CPU does not have, add CROSSPYTHONPATH
+into PYTHONPATH so we can prepend the list to find correct libs.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 87a4f02..f20cc7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
+ 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
+ 	fi
+         AC_MSG_RESULT($interp)
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
+     fi
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index bc20417..f585a53 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
+  file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


