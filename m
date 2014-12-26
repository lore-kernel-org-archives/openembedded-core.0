Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69F0372791
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9ZZqF000429
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:27 +0800
Message-ID: <5afc3384d6e1fbf8a20c71f625fb7e5c44a12d4e.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] kmod: upgrade to 19
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch is dropped
as it's in the new version.

Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch is modified
to match the new version.

License chesum is changed but it is confirmed that the license information
is not chagned.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |  7 +++---
 ...missing-O_CLOEXEC-in-kmod_module_get_size.patch | 27 ----------------------
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 21 +++++++++--------
 3 files changed, 14 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index dda74c8..c26ea23 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -11,14 +11,14 @@ SECTION = "base"
 
 DEPENDS += "pkgconfig-native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc ptest
 
-SRCREV = "ae58de0fcb4a6528dd365e23d383bbe2eaf2d566"
+SRCREV = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
 # Lookout for PV bump too when SRCREV is changed
-PV = "18+git${SRCPV}"
+PV = "19+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://ptest.patch \
            file://avoid_parallel_tests.patch \
            file://fix-O_CLOEXEC.patch \
-           file://0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch b/meta/recipes-kernel/kmod/kmod/0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch
deleted file mode 100644
index 77624ce..0000000
--- a/meta/recipes-kernel/kmod/kmod/0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 74c26943f1228870022d116a1fda25be3a55a38e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
-Date: Wed, 18 Jun 2014 20:51:00 -0400
-Subject: [PATCH] Add missing O_CLOEXEC in kmod_module_get_size()
-
-Upstream-Status: Backport 
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- libkmod/libkmod-module.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
-index e3cc5a7..b81b451 100644
---- a/libkmod/libkmod-module.c
-+++ b/libkmod/libkmod-module.c
-@@ -1783,7 +1783,7 @@ KMOD_EXPORT long kmod_module_get_size(const struct kmod_module *mod)
- 	 * loaded.
- 	 */
- 	snprintf(line, sizeof(line), "/sys/module/%s", mod->name);
--	dfd = open(line, O_RDONLY);
-+	dfd = open(line, O_RDONLY|O_CLOEXEC);
- 	if (dfd < 0)
- 		return -errno;
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
index 2320b92..7c0a275 100644
--- a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
+++ b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
@@ -1,6 +1,6 @@
-From 0c4dbadc9db3cda1cfca64e44ea08c6e89919ea7 Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Tue, 10 Sep 2013 13:44:18 +0800
+From 4b68940b1ed46c54a5a0bdf6bb9d4599bc64e6f4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 24 Dec 2014 10:12:40 +0800
 Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
 
 We can't use htobe* and be*toh functions because they are not
@@ -11,12 +11,13 @@ Change to directly calling bswap_* as defined in+byteswap.h.
 Upstream-Status: Inappropriate
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- libkmod/libkmod-signature.c |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
+ libkmod/libkmod-signature.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
-index 6b80caa..3544a36 100644
+index 2b976a5..ffe58c2 100644
 --- a/libkmod/libkmod-signature.c
 +++ b/libkmod/libkmod-signature.c
 @@ -19,6 +19,7 @@
@@ -24,10 +25,10 @@ index 6b80caa..3544a36 100644
  
  #include <endian.h>
 +#include <byteswap.h>
- #include <stdint.h>
+ #include <inttypes.h>
+ #include <stdio.h>
  #include <stdlib.h>
- #include <string.h>
-@@ -121,7 +122,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
+@@ -124,7 +125,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
  			modsig->hash >= PKEY_HASH__LAST ||
  			modsig->id_type >= PKEY_ID_TYPE__LAST)
  		return false;
@@ -37,5 +38,5 @@ index 6b80caa..3544a36 100644
  		return false;
  
 -- 
-1.7.5.4
+1.9.1
 
-- 
1.9.1


