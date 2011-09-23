Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnF-0006Ry-GF
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:17 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179694bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vPz5QHOp7v7NrvfhsDZOT5yEhQkN9wLBuAzpNH6cRG8=;
	b=SjTDVvAhOlTtGMC+EUEK52o6TMN3rEhTDxHMm223MODAXNCiLEMCgXmVm0hL+totbW
	d/D0Em7HMV4acRCEN4U5G6Gn9oWV9V2uVmP2yNm93fJLfzCHudmRtytEiG11LHqbU6Rh
	GYQmGNSdZzBFX1WyE/oMqSGTgmgep8s2fu4AI=
Received: by 10.204.146.19 with SMTP id f19mr2874059bkv.84.1316807218685;
	Fri, 23 Sep 2011 12:46:58 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:57 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:36 +0400
Message-Id: <1316807201-22623-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 05/10] eglibc: fix packaging of some of nativesdk packages, V2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2011 19:52:17 -0000

eglibc.inc contains packaging rules that depend on PKGSUFFIX expansion.
However that variable wasn't expanded properly in some case. E.g.

PACKAGES = " ... nscd${PKGSUFFIX} ..."
FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"

would be expanded to

PACKAGES = " ... nscd-nativesdk ..."
FILES_nscd = "${sbindir}/nscd*"

Thus leading to empty -nativesdk packages and missing files. To overcome
that use python code blob to properly define PKGSUFFIX variable.

As a change from V1, fix the glibc-thread-db related problem by using
${PN} instead of eglibc-XXX-nativesdk for extra-nss and thread-db
packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc  |   13 +++++++++----
 meta/recipes-core/eglibc/eglibc-package.inc |   13 +++++++++----
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index d9720e4..ef3699c 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,10 +26,15 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r18"
-
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+PR = "r19"
+
+python __anonymous () {
+    import bb
+    if bb.data.inherits_class("nativesdk", d):
+        bb.data.setVar("PKGSUFFIX", "-nativesdk", d)
+    else:
+        bb.data.setVar("PKGSUFFIX", "", d)
+}
 
 PROVIDES = "virtual/libc-locale${PKGSUFFIX}"
 
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 519a49c..8e9582c 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,8 +17,13 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+python __anonymous () {
+    import bb
+    if bb.data.inherits_class("nativesdk", d):
+        bb.data.setVar("PKGSUFFIX", "-nativesdk", d)
+    else:
+        bb.data.setVar("PKGSUFFIX", "", d)
+}
 
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
@@ -28,8 +33,8 @@ RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
 RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
 RPROVIDES_${PN}-doc = "glibc${PKGSUFFIX}-doc"
-RPROVIDES_eglibc-extra-nss${PKGSUFFIX} = "glibc-extra-nss${PKGSUFFIX}"
-RPROVIDES_eglibc-thread-db${PKGSUFFIX} = "glibc-thread-db${PKGSUFFIX}"
+RPROVIDES_${PN}-extra-nss = "glibc${PKGSUFFIX}-extra-nss"
+RPROVIDES_${PN}-thread-db = "glibc${PKGSUFFIX}-thread-db"
 RPROVIDES_${PN}-pcprofile = "glibc${PKGSUFFIX}-pcprofile"
 RPROVIDES_${PN}-dbg = "glibc-dbg${PKGSUFFIX}"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 4220219..e4305a8 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r27"
+PR = "r28"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index fc8ac64..c549d9d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r17"
+PR = "r18"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.2.5



