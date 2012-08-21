Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1T3jIv-0007By-Gp
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 09:55:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7L7hA9H019597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 00:43:10 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 21 Aug 2012 00:43:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 15:43:00 +0800
Message-ID: <8bacbba8fff967e7792b91f69fecd4efea47e530.1345534679.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1345534679.git.jackie.huang@windriver.com>
References: <cover.1345534679.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] coreutils: fix to build with acl support
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
X-List-Received-Date: Tue, 21 Aug 2012 07:55:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the issue that coreutils was built without acl support:

configure: WARNING: libacl development library was not found or not usable.
configure: WARNING: GNU coreutils will be built without ACL support.

which will cause ls and cp commands don't have the ACL related behaviors:
ls -l: no plus sign(+) after the permission string for files that have ACL
cp -p: can not preserves the ACLs.

[YOCTO #2959]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../coreutils-6.9/coreutils-build-with-acl.patch   |   28 ++++++++++++++++++++
 .../coreutils-8.14/coreutils-build-with-acl.patch  |   28 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    1 +
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    1 +
 4 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
new file mode 100644
index 0000000..8273d78
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Fix the following issue so that coreutils can build with ACL:
+
+configure: WARNING: libacl development library was not found or not usable.
+configure: WARNING: GNU coreutils will be built without ACL support.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ m4/acl.m4 |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/m4/acl.m4 b/m4/acl.m4
+index d6a448a..a9d4836 100644
+--- a/m4/acl.m4
++++ b/m4/acl.m4
+@@ -159,7 +159,7 @@ AC_DEFUN([gl_ACL_GET_FILE],
+           ]])],
+        [gl_cv_func_working_acl_get_file=yes],
+        [gl_cv_func_working_acl_get_file=no],
+-       [gl_cv_func_working_acl_get_file=cross-compiling])])
++       [gl_cv_func_working_acl_get_file=yes])])
+ 
+   AS_IF([test $gl_cv_func_working_acl_get_file = yes], [$1], [$2])
+ ])
+-- 
+1.7.7
+
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
new file mode 100644
index 0000000..8273d78
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Fix the following issue so that coreutils can build with ACL:
+
+configure: WARNING: libacl development library was not found or not usable.
+configure: WARNING: GNU coreutils will be built without ACL support.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ m4/acl.m4 |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/m4/acl.m4 b/m4/acl.m4
+index d6a448a..a9d4836 100644
+--- a/m4/acl.m4
++++ b/m4/acl.m4
+@@ -159,7 +159,7 @@ AC_DEFUN([gl_ACL_GET_FILE],
+           ]])],
+        [gl_cv_func_working_acl_get_file=yes],
+        [gl_cv_func_working_acl_get_file=no],
+-       [gl_cv_func_working_acl_get_file=cross-compiling])])
++       [gl_cv_func_working_acl_get_file=yes])])
+ 
+   AS_IF([test $gl_cv_func_working_acl_get_file = yes], [$1], [$2])
+ ])
+-- 
+1.7.7
+
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 5bfab16..20d8120 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -24,6 +24,7 @@ SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://coreutils-fix-install.patch \
            file://man-touch.patch \
            file://coreutils_fix_for_automake-1.12.patch \
+           file://coreutils-build-with-acl.patch \
            "
 
 SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 9a714a9..178bd67 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -16,6 +16,7 @@ inherit autotools gettext
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://remove-gets.patch \
+           file://coreutils-build-with-acl.patch \
           "
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
-- 
1.7.4



