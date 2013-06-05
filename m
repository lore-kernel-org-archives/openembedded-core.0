Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 951BC6A4A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:15:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r552Fgm3024697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 19:15:42 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 19:15:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 10:14:02 +0800
Message-ID: <ccd485e83dd4a3334d655206c4de02b96f2c2d30.1370398286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1370398286.git.liezhi.yang@windriver.com>
References: <cover.1370398286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] insane/package: let package.bbclass inherit insane.bbclass
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
X-List-Received-Date: Wed, 05 Jun 2013 02:15:41 -0000
Content-Type: text/plain

RP's comment:
"What we're trying to do is move everything to use a standard mechanism
for reporting issues of this type (do_package). With insane.bbclass, you
can elect whether a given type of error is a warning or error and fails
the task."

* The package.bbclass had used package_qa_handle_error() which is from
  insane.bbclass, and we will use it for handling other warnings and
  errors, so let package.bbclass inherit insane.bbclass, this change will
  make the insane as a requirement (always included).

* Change the "PACKAGEFUNCS ?=" to "+=", otherwise there would be an
  error like:
  Exception: variable SUMMARY references itself!

  This is because we let package.bbclass inherit insane.bbclass, and
  PACKAGEFUNCS has been set in insane.bbclass, so the "PACKAGEFUNCS ?="
  will set nothing, then the "emit_pkgdata" doesn't run which will
  cause this error.

* Add a QA_SANE variable in insane.bbclass, once the error type
  is ERROR_QA, it will fail the task and stop the build.

[YOCTO #3190]
[YOCTO #4396]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass  | 6 ++++--
 meta/classes/package.bbclass | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3ed5581..ee57721 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,7 +17,6 @@
 #   files under exec_prefix
 
 
-inherit package
 PACKAGE_DEPENDS += "${QADEPENDS}"
 PACKAGEFUNCS += " do_package_qa "
 
@@ -26,6 +25,7 @@ PACKAGEFUNCS += " do_package_qa "
 QADEPENDS = "prelink-native"
 QADEPENDS_class-native = ""
 QADEPENDS_class-nativesdk = ""
+QA_SANE = "True"
 
 #
 # dictionary for elf headers
@@ -133,6 +133,7 @@ def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_msg, d)
     if error_class in (d.getVar("ERROR_QA", True) or "").split():
         bb.error("QA Issue: %s" % error_msg)
+        d.setVar("QA_SANE", False)
         return False
     else:
         bb.warn("QA Issue: %s" % error_msg)
@@ -820,7 +821,8 @@ python do_package_qa () {
     if 'libdir' in d.getVar("ALL_QA", True).split():
         package_qa_check_libdir(d)
 
-    if not walk_sane or not rdepends_sane or not deps_sane:
+    qa_sane = d.getVar("QA_SANE", True)
+    if not walk_sane or not rdepends_sane or not deps_sane or not qa_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 02a1460..f72c0e2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -42,6 +42,9 @@ inherit packagedata
 inherit prserv
 inherit chrpath
 
+# Need the package_qa_handle_error() in insane.bbclass
+inherit insane
+
 PKGD    = "${WORKDIR}/package"
 PKGDEST = "${WORKDIR}/packages-split"
 
@@ -1813,7 +1816,7 @@ PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
                 populate_packages"
 # Functions which process metadata based on split packages
-PACKAGEFUNCS ?= " \
+PACKAGEFUNCS += " \
                 package_fixsymlinks \
                 package_name_hook \
                 package_do_filedeps \
-- 
1.8.1.2


