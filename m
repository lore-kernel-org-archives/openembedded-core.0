Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7B46B8B0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 06:34:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s026YnjR029789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jan 2014 22:34:49 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 1 Jan 2014 22:34:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2014 14:34:58 +0800
Message-ID: <8f4b451bea8d61acb2802338b930a4657b958a3b.1388644435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1388644435.git.Qi.Chen@windriver.com>
References: <cover.1388644435.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: upgrade to 8.22
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
X-List-Received-Date: Thu, 02 Jan 2014 06:34:49 -0000
Content-Type: text/plain

Upgrade coreutils to 8.22.

Changes since 8.21:
1) Remove the acl patch as it's not needed now.
2) Add a new patch to fix the following compile error.
   "dummy-man: too many non-option arguments"

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils-8.21/coreutils-build-with-acl.patch  |   28 ------------------
 .../dummy_help2man.patch                           |    0
 .../coreutils-8.22/fix-for-dummy-man-usage.patch   |   31 ++++++++++++++++++++
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.21.bb => coreutils_8.22.bb}       |    6 ++--
 5 files changed, 34 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with-acl.patch
 rename meta/recipes-core/coreutils/{coreutils-8.21 => coreutils-8.22}/dummy_help2man.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
 rename meta/recipes-core/coreutils/{coreutils-8.21 => coreutils-8.22}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.21.bb => coreutils_8.22.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with-acl.patch
deleted file mode 100644
index 8273d78..0000000
--- a/meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with-acl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Fix the following issue so that coreutils can build with ACL:
-
-configure: WARNING: libacl development library was not found or not usable.
-configure: WARNING: GNU coreutils will be built without ACL support.
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- m4/acl.m4 |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/m4/acl.m4 b/m4/acl.m4
-index d6a448a..a9d4836 100644
---- a/m4/acl.m4
-+++ b/m4/acl.m4
-@@ -159,7 +159,7 @@ AC_DEFUN([gl_ACL_GET_FILE],
-           ]])],
-        [gl_cv_func_working_acl_get_file=yes],
-        [gl_cv_func_working_acl_get_file=no],
--       [gl_cv_func_working_acl_get_file=cross-compiling])])
-+       [gl_cv_func_working_acl_get_file=yes])])
- 
-   AS_IF([test $gl_cv_func_working_acl_get_file = yes], [$1], [$2])
- ])
--- 
-1.7.7
-
diff --git a/meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.patch b/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.patch
rename to meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch b/meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
new file mode 100644
index 0000000..b7e8260
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+coreutils: fix for dummy-man usage
+
+The options should be before the final argument, otherwise, the following error
+would appear when compiling.
+
+"dummy-man: too many non-option arguments"
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ man/local.mk |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/local.mk b/man/local.mk
+index 7cef5e3..dc0865f 100644
+--- a/man/local.mk
++++ b/man/local.mk
+@@ -189,8 +189,8 @@ man/yes.1:       src/yes
+ 	  && $(run_help2man)						\
+ 		     --source='$(PACKAGE_STRING)'			\
+ 		     --include=$(srcdir)/man/$$name.x			\
+-		     --output=$$t/$$name.1 $$t/$$name			\
+ 		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
++		     --output=$$t/$$name.1 $$t/$$name			\
+ 	  && sed \
+ 	       -e 's|$*\.td/||g' \
+ 	       -e '/For complete documentation/d' \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/coreutils/coreutils-8.21/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.22/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.21/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.22/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.21.bb
rename to meta/recipes-core/coreutils/coreutils_8.22.bb
index abeaf1a..6b222b5 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -14,12 +14,12 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://coreutils-build-with-acl.patch \
            file://dummy_help2man.patch \
+           file://fix-for-dummy-man-usage.patch \
           "
 
-SRC_URI[md5sum] = "065ba41828644eca5dd8163446de5d64"
-SRC_URI[sha256sum] = "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444288e18"
+SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
+SRC_URI[sha256sum] = "5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642cb9141f6ff1212"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch"
-- 
1.7.9.5


