Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70DE5745C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:25:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3B8PCTv005811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 01:25:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 11 Apr 2018 01:25:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 16:26:18 +0800
Message-ID: <359aaea1da3d63a46efbe6ded457738ddd95a3a6.1523433347.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1523433347.git.Qi.Chen@windriver.com>
References: <cover.1523433347.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] valgrind: fix the shared object issue while prelink ptest
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
X-List-Received-Date: Wed, 11 Apr 2018 08:25:11 -0000
Content-Type: text/plain

From: Zhixiong Chi <zhixiong.chi@windriver.com>

If valgrind-ptest is installed, we will get the some prelink error
like below at do_image:

  .../usr/sbin/prelink: /usr/lib64/valgrind/ptest/memcheck/tests/wrap7:\
  Could not find one of the dependencies: \
  .../usr/sbin//prelink-rtld: error   \
  while loading shared libraries: wrap7so.so: cannot open shared  \
  object file: No such file or directory

The wrap7 needs to link the shared object in the path
/usr/lib64/valgrind/ptest/memcheck/tests, but it fails.
So we correct the path for ptest.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../valgrind/valgrind/0002-remove-rpath.patch      | 35 ----------------------
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb  |  3 +-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch b/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
deleted file mode 100644
index e9112da..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f96cf1f4eaa72860ab8b5e18ad10fdc704d78c5f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 15 Dec 2015 15:01:34 +0200
-Subject: [PATCH 2/5] remove rpath
-
-Upstream-Status: Inappropriate [embedded config]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- none/tests/Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/none/tests/Makefile.am b/none/tests/Makefile.am
-index 54f2a7e..25b0f49 100644
---- a/none/tests/Makefile.am
-+++ b/none/tests/Makefile.am
-@@ -326,7 +326,6 @@ threadederrno_CFLAGS	+= --std=c99
- endif
- tls_SOURCES		= tls.c tls2.c
- tls_DEPENDENCIES	= tls.so tls2.so
--tls_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests
- tls_LDADD		= tls.so tls2.so -lpthread
- tls_so_SOURCES		= tls_so.c
- tls_so_DEPENDENCIES	= tls2.so
-@@ -334,7 +333,7 @@ if VGCONF_OS_IS_DARWIN
-  tls_so_LDFLAGS		= -dynamic -dynamiclib -all_load -fpic
-  tls_so_LDADD		= `pwd`/tls2.so
- else
-- tls_so_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests -shared -fPIC
-+ tls_so_LDFLAGS		= -shared -fPIC
-  tls_so_LDADD		= tls2.so
- endif
- tls_so_CFLAGS		= $(AM_CFLAGS) -fPIC
--- 
-2.6.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index 9390d30..d3af35e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
-           file://0002-remove-rpath.patch \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -87,6 +86,8 @@ def get_mcpu(d):
 
 do_configure_prepend () {
     rm -rf ${S}/config.h
+    sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
+    sed -i -e 's:$(top_builddir):$(pkglibdir)/ptest:g' ${S}/memcheck/tests/Makefile.am
 }
 
 do_install_append () {
-- 
1.9.1


