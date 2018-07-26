Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4762578AD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 08:32:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q8W036027811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 01:32:00 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 01:31:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 26 Jul 2018 16:42:14 +0800
Message-ID: <1532594534-24320-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] automake: fix race in parallel builds
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
X-List-Received-Date: Thu, 26 Jul 2018 08:32:01 -0000
Content-Type: text/plain

While native building, there is a parallel failure
[snip]
|: && mkdir -p doc && ./pre-inst-env /usr/bin/env perl
../automake-1.16.1/doc/help2man --output=doc/aclocal-1.16.1
aclocal-1.16
|help2man: can't get `--help' info from aclocal-1.16
|Try `--no-discard-stderr' if option outputs to stderr
Makefile:3693: recipe for target 'doc/aclocal-1.16.1' failed
[snip]

Correct Makefile rule to fix the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-build-fix-race-in-parallel-builds.patch   | 65 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.16.1.bb  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch b/meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch
new file mode 100644
index 0000000..591fce1
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch
@@ -0,0 +1,65 @@
+From 592eb55b248a765abfc796fccb68baa3d53745ac Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 26 Jul 2018 00:58:12 -0700
+Subject: [PATCH] build: fix race in parallel builds
+
+The automake-$(APIVERSION) is a hardlink of automake, if it is
+created later than update_mans executing, there is a failure
+[snip]
+|: && mkdir -p doc && ./pre-inst-env /usr/bin/env perl
+../automake-1.16.1/doc/help2man --output=doc/aclocal-1.16.1
+aclocal-1.16
+|help2man: can't get `--help' info from aclocal-1.16
+|Try `--no-discard-stderr' if option outputs to stderr
+Makefile:3693: recipe for target 'doc/aclocal-1.16.1' failed
+[snip]
+
+The automake_script is required by update_mans and update_mans
+invokes automake-$(APIVERSION) rather than automake to generate
+doc, so we should assign `automake-$(APIVERSION)' to automake_script.
+
+The same reason to tweak aclocal_script.
+
+* bin/local.mk: correct automake_script/aclocal_script
+
+Upstream-Status: Submitted [automake-patches@gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in  | 4 ++--
+ bin/local.mk | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c3e934c..7cddb8d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -691,8 +691,8 @@ bin_SCRIPTS = bin/automake bin/aclocal
+ # Used by maintainer checks and such.
+ automake_in = $(srcdir)/bin/automake.in
+ aclocal_in = $(srcdir)/bin/aclocal.in
+-automake_script = bin/automake
+-aclocal_script = bin/aclocal
++automake_script = bin/automake-$(APIVERSION)
++aclocal_script  = bin/aclocal-$(APIVERSION)
+ AUTOMAKESOURCES = $(automake_in) $(aclocal_in)
+ info_TEXINFOS = doc/automake.texi doc/automake-history.texi
+ doc_automake_TEXINFOS = doc/fdl.texi
+diff --git a/bin/local.mk b/bin/local.mk
+index 97b38db..058ca99 100644
+--- a/bin/local.mk
++++ b/bin/local.mk
+@@ -31,8 +31,8 @@ CLEANFILES += \
+ # Used by maintainer checks and such.
+ automake_in = $(srcdir)/%D%/automake.in
+ aclocal_in  = $(srcdir)/%D%/aclocal.in
+-automake_script = %D%/automake
+-aclocal_script  = %D%/aclocal
++automake_script = %D%/automake-$(APIVERSION)
++aclocal_script  = %D%/aclocal-$(APIVERSION)
+ 
+ AUTOMAKESOURCES = $(automake_in) $(aclocal_in)
+ TAGS_FILES += $(AUTOMAKESOURCES)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/automake/automake_1.16.1.bb b/meta/recipes-devtools/automake/automake_1.16.1.bb
index c64ee44..d82eed3 100644
--- a/meta/recipes-devtools/automake/automake_1.16.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.1.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://python-libdir.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
             file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
+            file://0001-build-fix-race-in-parallel-builds.patch \
             "
 
 SRC_URI[md5sum] = "83cc2463a4080efd46a72ba2c9f6b8f5"
-- 
2.7.4


