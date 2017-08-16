Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C84C478664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G8Ve8w008788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Aug 2017 01:31:40 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:21 -0400
Message-ID: <81560385801247ea5c615b7c21dbf9ed199e6492.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] gpgme: 1.8.0 -> 1.9.0
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:39 -0000
Content-Type: text/plain

Rebase patches:
- pkgconfig.patch -> 0001
- python-lang-config.patch -> 0002
- 0001-Correctly-install-python-modules.patch -> 0003
- python-import.patch -> 0004
- 0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch -> 0005

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{pkgconfig.patch => 0001-pkgconfig.patch}      | 16 ++++++++++----
 ...ython-gpg-error-config-should-not-be-use.patch} | 25 ++++++++++++++++------
 ...=> 0003-Correctly-install-python-modules.patch} | 22 +++++++++++--------
 ...ython-import.patch => 0004-python-import.patch} | 15 +++++++++++++
 ...-skip-all-lib-or-usr-lib-directories-in-.patch} |  6 +++---
 .../gpgme/{gpgme_1.8.0.bb => gpgme_1.9.0.bb}       | 16 +++++++-------
 6 files changed, 70 insertions(+), 30 deletions(-)
 rename meta/recipes-support/gpgme/gpgme/{pkgconfig.patch => 0001-pkgconfig.patch} (96%)
 rename meta/recipes-support/gpgme/gpgme/{python-lang-config.patch => 0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch} (72%)
 rename meta/recipes-support/gpgme/gpgme/{0001-Correctly-install-python-modules.patch => 0003-Correctly-install-python-modules.patch} (52%)
 rename meta/recipes-support/gpgme/gpgme/{python-import.patch => 0004-python-import.patch} (66%)
 rename meta/recipes-support/gpgme/gpgme/{0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch => 0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch} (85%)
 rename meta/recipes-support/gpgme/{gpgme_1.8.0.bb => gpgme_1.9.0.bb} (84%)

diff --git a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme/pkgconfig.patch
rename to meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 341cabf..14a43ee 100644
--- a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,10 +1,18 @@
+From 8ae149035c97d27cd2c624704d1651806c53577e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 16 Aug 2017 02:00:08 -0400
+Subject: [PATCH 1/5] pkgconfig
+
 Update gpgme to use pkgconfig instead of -config files since its
 simpler and less error prone when cross compiling.
 
 Upstream-Status: Denied [Upstream not interested in pkg-config support]
 RP 2015/4/17
 
-Rebase to 1.8.0
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Rebase to 1.9.0
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac            |   1 +
@@ -17,10 +25,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 0a67b48..e402dd3 100644
+index 0dac6ce..6a9e507 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -875,6 +875,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -866,6 +866,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -50,7 +58,7 @@ index ce6f1d4..5f38fee 100644
  
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
-index 0000000..980a48e
+index 0000000..074bbf6
 --- /dev/null
 +++ b/src/gpgme-pthread.pc.in
 @@ -0,0 +1,15 @@
diff --git a/meta/recipes-support/gpgme/gpgme/python-lang-config.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
similarity index 72%
rename from meta/recipes-support/gpgme/gpgme/python-lang-config.patch
rename to meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 132e426..f1f8c91 100644
--- a/meta/recipes-support/gpgme/gpgme/python-lang-config.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,4 +1,7 @@
-gpgme/lang/python: gpg-error-config should not be used.
+From fb165c9bd96aca8c9ee3e4509c9b6e35d238ad2e Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@windriver.com>
+Date: Wed, 16 Aug 2017 02:02:47 -0400
+Subject: [PATCH 2/5] gpgme/lang/python: gpg-error-config should not be used.
 
 gpg-error-config was modified by OE to always return an error.  So we want
 to find an alternative way to retrieve whatever it is we need.  It turns
@@ -9,10 +12,17 @@ Upstream-Status: Inappropriate [changes are specific to OE]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: gpgme-1.8.0/lang/python/setup.py.in
-===================================================================
---- gpgme-1.8.0.orig/lang/python/setup.py.in
-+++ gpgme-1.8.0/lang/python/setup.py.in
+Rebase to 1.9.0
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lang/python/setup.py.in | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
+index bf4efa3..7c34487 100755
+--- a/lang/python/setup.py.in
++++ b/lang/python/setup.py.in
 @@ -24,7 +24,6 @@ import glob
  import subprocess
  
@@ -35,7 +45,7 @@ Index: gpgme-1.8.0/lang/python/setup.py.in
      subprocess.check_call(gpgme_config + ['--version'],
                            stdout=devnull)
  except:
-@@ -81,12 +73,9 @@ if not (major > 1 or (major == 1 and min
+@@ -81,12 +73,9 @@ if not (major > 1 or (major == 1 and minor >= 7)):
  if not gpgme_h:
      gpgme_h = os.path.join(getconfig("prefix")[0], "include", "gpgme.h")
  
@@ -50,3 +60,6 @@ Index: gpgme-1.8.0/lang/python/setup.py.in
  
  print("Building python gpg module using {} and {}.".format(gpgme_h, gpg_error_h))
  
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
similarity index 52%
rename from meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch
rename to meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index 42655fb..d383311 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,26 +1,30 @@
-From 4d714c097e497b63d2e8b22a834c671045e215e9 Mon Sep 17 00:00:00 2001
+From 62332eec752dd790f4dd071dfb0dbe86be377203 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 9 Mar 2017 21:34:55 +0200
-Subject: [PATCH] Correctly install python modules
+Date: Wed, 16 Aug 2017 02:05:34 -0400
+Subject: [PATCH 3/5] Correctly install python modules
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebase to 1.9.0
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  lang/python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index e32fd12..5ecf6fb 100644
+index d91ead9..67f7cdc 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -102,6 +102,7 @@ install-exec-local:
- 	for PYTHON in $(PYTHONS); do \
+@@ -106,6 +106,7 @@ install-exec-local:
+ 	  cd python$${VERSION}-gpg ; \
  	  $$PYTHON setup.py install \
  	  --prefix $(DESTDIR)$(prefix) \
-+          --install-lib=$(DESTDIR)${pythondir} \
++	  --install-lib=$(DESTDIR)${pythondir} \
  	  --record files.txt \
  	  --verbose ; \
- 	  cat files.txt >> install_files.txt ; \
+ 	  cat files.txt >> ../install_files.txt ; \
 -- 
-2.11.0
+2.8.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
similarity index 66%
rename from meta/recipes-support/gpgme/gpgme/python-import.patch
rename to meta/recipes-support/gpgme/gpgme/0004-python-import.patch
index 61b77a1..9307103 100644
--- a/meta/recipes-support/gpgme/gpgme/python-import.patch
+++ b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
@@ -1,9 +1,21 @@
+From ccbf028eea8815d3b16d6c34b527253a6b108ec3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 16 Aug 2017 02:06:45 -0400
+Subject: [PATCH 4/5] python import
+
 Don't check for output on stderr to know if an import worked, host inputrc and
 sysroot readline can cause warnings on stderr.
 
 Upstream-Status: Backport (from autoconf-archive 883a2abd)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Rebase to 1.9.0
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/ax_python_devel.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
 index b990d5b..318b089 100644
 --- a/m4/ax_python_devel.m4
@@ -17,3 +29,6 @@ index b990d5b..318b089 100644
  		AC_MSG_RESULT([yes])
  	else
  		AC_MSG_RESULT([no])
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
similarity index 85%
rename from meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
rename to meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 84d55b9..7a6cc7b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,7 +1,7 @@
-From 8c317f6186bd3a9a1c80b4d1e872b3db95934bb6 Mon Sep 17 00:00:00 2001
+From 064ae4441e2c11329748a18157988f9e953f9752 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
-Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
+Subject: [PATCH 5/5] gpgme-config: skip all /lib* or /usr/lib* directories in
  output
 
 The logic was not working in multilib setups which use other
@@ -27,5 +27,5 @@ index a4d152e..8342865 100644
                        ;;
                    -L*|-l*)
 -- 
-2.11.0
+2.8.1
 
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.9.0.bb
similarity index 84%
rename from meta/recipes-support/gpgme/gpgme_1.8.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.9.0.bb
index 4ddf6ed..2518147 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.9.0.bb
@@ -6,20 +6,20 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=0f7059665c4b7897f4f4d0cb93aa9f98 \
+                    file://src/gpgme.h.in;endline=23;md5=9d157d08a69059344e6f82abd2d25781 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
-           file://pkgconfig.patch \
-           file://python-lang-config.patch \
-           file://0001-Correctly-install-python-modules.patch \
-           file://python-import.patch \
-           file://0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
+           file://0001-pkgconfig.patch \
+           file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch \
+           file://0003-Correctly-install-python-modules.patch \
+           file://0004-python-import.patch \
+           file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
           "
 
-SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
-SRC_URI[sha256sum] = "596097257c2ce22e747741f8ff3d7e24f6e26231fa198a41b2a072e62d1e5d33"
+SRC_URI[md5sum] = "1e00bb8ef04d1d05d5a0f19e143854c3"
+SRC_URI[sha256sum] = "1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.8.1


