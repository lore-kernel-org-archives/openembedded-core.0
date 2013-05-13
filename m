Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ubp2f-0006oS-HI
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4D99PWL015410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:09:25 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 02:09:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 05:09:19 -0400
Message-ID: <85e2938623fec682acb72bc6288a7528c94adca7.1368425946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368425946.git.liezhi.yang@windriver.com>
References: <cover.1368425946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] insane/package: let package.bbclass inherit insane.bbclass
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
X-List-Received-Date: Mon, 13 May 2013 09:27:41 -0000
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
 meta/classes/insane.bbclass  |    6 ++++--
 meta/classes/package.bbclass |    5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fb18022..c3e4b1e 100644
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
@@ -821,7 +822,8 @@ python do_package_qa () {
     if 'libdir' in d.getVar("ALL_QA", True).split():
         package_qa_check_libdir(d)
 
-    if not walk_sane or not rdepends_sane or not deps_sane:
+    qa_sane = d.getVar("QA_SANE", True)
+    if not walk_sane or not rdepends_sane or not deps_sane or not qa_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 36b3ae5..e9a324e 100644
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
 
@@ -1814,7 +1817,7 @@ PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
                 populate_packages"
 # Functions which process metadata based on split packages
-PACKAGEFUNCS ?= " \
+PACKAGEFUNCS += " \
                 package_fixsymlinks \
                 package_name_hook \
                 package_do_filedeps \
-- 
1.7.10.4



