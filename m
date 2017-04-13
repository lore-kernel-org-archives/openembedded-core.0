Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C4DF377D90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:50:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 06:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="955724383"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2017 06:50:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 16:50:11 +0300
Message-Id: <20170413135012.2511-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] gpgme: correctly avoid host contamination
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
X-List-Received-Date: Thu, 13 Apr 2017 13:50:50 -0000

Existing patch was actually doing the wrong thing and
sometimes removing a linking flag (-lgpgme) that should be present.

Instead, gpgme-config actually has internal logic to remove /usr/lib from the output,
which works only in non-multilib setups, so it is adjusted to include all possible
/usr/lib* and /lib* directories.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-Avoid-host-contamination-from-gpg-config.patch | 30 ---------------------
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          |  2 +-
 3 files changed, 32 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch b/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
deleted file mode 100644
index 6ce58ba3f65..00000000000
--- a/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 96cfc76def123141d0cecaab857da3880396d5ef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 9 Mar 2017 22:11:00 +0200
-Subject: [PATCH] Avoid host contamination from gpg-config
-
-getconfig is calling gpgme-config (from the source tree) and it
-gives -L{libdir} (i.e. -L/usr/lib) as the first item for linking.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lang/python/setup.py.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 213fe33..22629e2 100755
---- a/lang/python/setup.py.in
-+++ b/lang/python/setup.py.in
-@@ -86,7 +86,7 @@ subprocess.check_call([sys.executable, "gpgme-h-clean.py", gpg_error_h],
-                       stdout=open("errors.i", "w"))
- 
- define_macros = []
--libs = getconfig('libs')
-+libs = getconfig('libs')[1:]
- 
- # Define extra_macros for both the SWIG and C code
- for k, v in extra_macros.items():
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
new file mode 100644
index 00000000000..84d55b96859
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -0,0 +1,31 @@
+From 8c317f6186bd3a9a1c80b4d1e872b3db95934bb6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 13 Apr 2017 16:40:27 +0300
+Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
+ output
+
+The logic was not working in multilib setups which use other
+directory names than plain /lib or /usr/lib.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/gpgme-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gpgme-config.in b/src/gpgme-config.in
+index a4d152e..8342865 100644
+--- a/src/gpgme-config.in
++++ b/src/gpgme-config.in
+@@ -154,7 +154,7 @@ while test $# -gt 0; do
+             for i in $libs $tmp_l $assuan_libs $gpg_error_libs $tmp_x; do
+               skip=no
+               case $i in
+-                  -L/usr/lib|-L/lib)
++                  -L/usr/lib*|-L/lib*)
+                       skip=yes
+                       ;;
+                   -L*|-l*)
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index eddf3a0399e..cb9143aded8 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://pkgconfig.patch \
            file://python-lang-config.patch \
            file://0001-Correctly-install-python-modules.patch \
-           file://0001-Avoid-host-contamination-from-gpg-config.patch \
            file://python-import.patch \
+           file://0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
           "
 
 SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
-- 
2.11.0


