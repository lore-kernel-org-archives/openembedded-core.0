Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A40BD78664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G8VcnZ025058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 01:31:38 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:20 -0400
Message-ID: <10402a7b38658b70df9d5f54d3cd28684ab8fb55.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] gnupg: 2.1.20 -> 2.1.23
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:37 -0000
Content-Type: text/plain

COPYING.LIB: Rename to COPYING.LGPL3.
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=3419a339d9c4e800bf30e9021e05982d8c1021c1

Rebase patches:
- pkgconfig.patch -> 0001
- use-pkgconfig-instead-of-npth-config.patch -> 0002
- dirmngr-uses-libgpg-error.patch -> 0003
- autogen.sh-fix-find-version-for-beta-checking.patch -> 0004

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...config-to-find-pth-instead-of-pth-config.patch} | 29 +++++++++++++++-----
 ...002-use-pkgconfig-instead-of-npth-config.patch} | 21 +++++++++++---
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch     | 32 ++++++++++++++++++++++
 ...en.sh-fix-find-version-for-beta-checking.patch} | 17 +++++++-----
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    | 16 -----------
 .../gnupg/{gnupg_2.1.20.bb => gnupg_2.1.23.bb}     | 14 +++++-----
 6 files changed, 88 insertions(+), 41 deletions(-)
 rename meta/recipes-support/gnupg/gnupg/{pkgconfig.patch => 0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch} (81%)
 rename meta/recipes-support/gnupg/gnupg/{use-pkgconfig-instead-of-npth-config.patch => 0002-use-pkgconfig-instead-of-npth-config.patch} (81%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/gnupg/{autogen.sh-fix-find-version-for-beta-checking.patch => 0004-autogen.sh-fix-find-version-for-beta-checking.patch} (58%)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/{gnupg_2.1.20.bb => gnupg_2.1.23.bb} (69%)

diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
similarity index 81%
rename from meta/recipes-support/gnupg/gnupg/pkgconfig.patch
rename to meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
index f958603..5c9c022 100644
--- a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
@@ -1,15 +1,27 @@
-Use pkg-config to find pth instead of pth-config.
+From 59a3c76d4016ffc615f1c45184f4c6820061d69c Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 16 Aug 2017 11:14:12 +0800
+Subject: [PATCH 1/4] Use pkg-config to find pth instead of pth-config.
 
 Upstream-Status: Denied
-[not submitted but they've been clear they don't want a pkg-config dependency]
+[not submitted but they've been clear they don't want a pkg-config
+dependency]
 
 RP 2014/5/22
 
-Index: gnupg-2.1.0/m4/gnupg-pth.m4
-===================================================================
---- gnupg-2.1.0.orig/m4/gnupg-pth.m4
-+++ gnupg-2.1.0/m4/gnupg-pth.m4
-@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/gnupg-pth.m4 | 53 ++++++++---------------------------------------------
+ 1 file changed, 8 insertions(+), 45 deletions(-)
+
+diff --git a/m4/gnupg-pth.m4 b/m4/gnupg-pth.m4
+index 6dc9e0e..5892531 100644
+--- a/m4/gnupg-pth.m4
++++ b/m4/gnupg-pth.m4
+@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  # Taken and modified from the m4 macros which come with Pth.
  AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
    [
@@ -88,3 +100,6 @@ Index: gnupg-2.1.0/m4/gnupg-pth.m4
    AC_SUBST(PTH_LIBS)
  ])
 -
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
similarity index 81%
rename from meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
rename to meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index c6dbf1b..6d86e5c 100644
--- a/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,12 +1,22 @@
+From 53c2aec2e13f4e2d09be7148869c862f07dfdd4d Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Wed, 16 Aug 2017 11:16:30 +0800
+Subject: [PATCH 2/4] use pkgconfig instead of npth config
+
 Upstream-Status: Inappropriate [openembedded specific]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/npth.m4 | 34 ++++++++--------------------------
+ 1 file changed, 8 insertions(+), 26 deletions(-)
 
-Index: gnupg-2.1.0/m4/npth.m4
-===================================================================
---- gnupg-2.1.0.orig/m4/npth.m4
-+++ gnupg-2.1.0/m4/npth.m4
+diff --git a/m4/npth.m4 b/m4/npth.m4
+index 17c2644..15a931b 100644
+--- a/m4/npth.m4
++++ b/m4/npth.m4
 @@ -17,10 +17,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
    if test "x$npth_config_prefix" != x ; then
        NPTH_CONFIG="$npth_config_prefix/bin/npth-config"
@@ -70,3 +80,6 @@ Index: gnupg-2.1.0/m4/npth.m4
      NPTH_CFLAGS=""
      NPTH_LIBS=""
      ifelse([$3], , :, [$3])
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
new file mode 100644
index 0000000..3e798ef
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
@@ -0,0 +1,32 @@
+From 9c3858ffda6246bf9e1e6aeeb920532a56b19408 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Wed, 16 Aug 2017 11:18:01 +0800
+Subject: [PATCH 3/4] dirmngr uses libgpg error
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Rebase to 2.1.23
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ dirmngr/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
+index b404165..d3f916e 100644
+--- a/dirmngr/Makefile.am
++++ b/dirmngr/Makefile.am
+@@ -82,7 +82,8 @@ endif
+ dirmngr_LDADD = $(libcommonpth) \
+         $(DNSLIBS) $(LIBASSUAN_LIBS) \
+ 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
+-	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
++	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
++	$(GPG_ERROR_LIBS)
+ if USE_LDAP
+ dirmngr_LDADD += $(ldaplibs)
+ endif
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
similarity index 58%
rename from meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
rename to meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 4241bc3..dcd8582 100644
--- a/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,7 +1,7 @@
-From 717f994be2466d378e6611a4739c606db6d0dc46 Mon Sep 17 00:00:00 2001
+From 914ae4a3f7529fb069467bf0ded57dd24ee2e763 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Sun, 25 Oct 2015 22:44:47 -0400
-Subject: [PATCH] autogen.sh: fix find-version for beta checking
+Date: Wed, 16 Aug 2017 11:23:22 +0800
+Subject: [PATCH 4/4] autogen.sh: fix find-version for beta checking
 
 find-version always assumes that gnupg is beta if autogen.sh is run
 out of git-repo. This doesn't work for users whom just take release
@@ -10,16 +10,19 @@ tarball and re-run autoconf in their local build dir.
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+Rebase to 2.1.23
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 7effd56..d673432 100755
+index e5ba5bf..05e0e11 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -228,7 +228,6 @@ if [ "$myhost" = "find-version" ]; then
-       rvd=$((0x$(echo ${rev} | head -c 4)))
+@@ -245,7 +245,6 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
 -      beta=yes
@@ -27,5 +30,5 @@ index 7effd56..d673432 100755
        rev="0000000"
        rvd="0"
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
deleted file mode 100644
index 7af1955..0000000
--- a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: gnupg-2.1.0/dirmngr/Makefile.am
-===================================================================
---- gnupg-2.1.0.orig/dirmngr/Makefile.am
-+++ gnupg-2.1.0/dirmngr/Makefile.am
-@@ -78,7 +78,8 @@ endif
- dirmngr_LDADD = $(libcommontlsnpth) $(libcommonpth) \
-         $(DNSLIBS) $(LIBASSUAN_LIBS) \
- 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
-+	$(GPG_ERROR_LIBS)
- if USE_LDAP
- dirmngr_LDADD += $(ldaplibs)
- endif
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.20.bb b/meta/recipes-support/gnupg/gnupg_2.1.23.bb
similarity index 69%
rename from meta/recipes-support/gnupg/gnupg_2.1.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.23.bb
index e56421f..0fb170d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.23.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
 HOMEPAGE = "http://www.gnupg.org/"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
-                    file://COPYING.LIB;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
+                    file://COPYING.LGPL3;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
 
 DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
@@ -10,14 +10,14 @@ inherit autotools gettext texinfo pkgconfig
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://pkgconfig.patch \
-           file://use-pkgconfig-instead-of-npth-config.patch \
-           file://dirmngr-uses-libgpg-error.patch \
-           file://autogen.sh-fix-find-version-for-beta-checking.patch \
+           file://0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch \
+           file://0002-use-pkgconfig-instead-of-npth-config.patch \
+           file://0003-dirmngr-uses-libgpg-error.patch \
+           file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "f6bc7e0b82893dfafe09109d86ff6e9b"
-SRC_URI[sha256sum] = "24cf9a69369be64a9f6f8cc11a1be33ab7780ad77a6a1b93719438f49f69960d"
+SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
+SRC_URI[sha256sum] = "a94476391595e9351f219188767a9d6ea128e83be5ed3226a7890f49aa2d0d77"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


