Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0905F6E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 09:00:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 31 Mar 2016 02:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="948646123"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2016 02:00:16 -0700
Received: from mbabyjoh-desk.ger.corp.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 519636A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 02:47:57 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 12:00:16 +0300
Message-Id: <1459414816-7175-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] systemd: fix build with gcrypt PACKAGECONFIG disabled
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
X-List-Received-Date: Thu, 31 Mar 2016 09:00:36 -0000

systemd-resolved build fails without gcrypt PACKAGECONFIG. Backport the fix.
Also remove the comment about resolved's dependence on gcrypt.

[YOCTO #9219]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ild-sys-fix-build-with-libgrcypt-disabled.patch | 122 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_229.bb           |   2 +-
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch b/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
new file mode 100644
index 0000000..1ae3d66
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
@@ -0,0 +1,122 @@
+From b68f10bf1f7519e012da5e35fab3a57da7dc46d4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Sun, 27 Mar 2016 17:33:54 -0400
+Subject: [PATCH] build-sys: fix build with libgrcypt disabled
+
+- Move gcrypt.h include inside grcrypt-util.h.
+- Allow gcrypt-util.[ch] to be compiled even without gcrypt.
+This allows the logic in files using gcrypt to be simplified.
+
+- Fix compilation of systemd-resolve without gcrypt.
+systemd-resolved already supported that.
+
+Upstream-Status: Backport [ https://github.com/systemd/systemd/pull/2905 ]
+
+Fixes [YOCTO #9219]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ Makefile.am                |  8 ++++----
+ src/resolve/resolve-tool.c |  3 +--
+ src/shared/gcrypt-util.c   |  4 +++-
+ src/shared/gcrypt-util.h   | 14 ++++++++++++++
+ 4 files changed, 22 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2b72a53..95eaa9a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4262,7 +4262,9 @@ libsystemd_journal_internal_la_SOURCES = \
+ 	src/journal/mmap-cache.h \
+ 	src/journal/compress.c \
+ 	src/journal/audit-type.h \
+-	src/journal/audit-type.c
++	src/journal/audit-type.c \
++	src/shared/gcrypt-util.h \
++	src/shared/gcrypt-util.c
+ 
+ nodist_libsystemd_journal_internal_la_SOURCES = \
+ 	src/journal/audit_type-to-name.h
+@@ -4294,9 +4296,7 @@ libsystemd_journal_internal_la_SOURCES += \
+ 	src/journal/journal-authenticate.c \
+ 	src/journal/journal-authenticate.h \
+ 	src/journal/fsprg.c \
+-	src/journal/fsprg.h \
+-	src/shared/gcrypt-util.c \
+-	src/shared/gcrypt-util.h
++	src/journal/fsprg.h
+ 
+ libsystemd_journal_internal_la_LIBADD += \
+ 	$(GCRYPT_LIBS)
+diff --git a/src/resolve/resolve-tool.c b/src/resolve/resolve-tool.c
+index 009cc73..14ee01c 100644
+--- a/src/resolve/resolve-tool.c
++++ b/src/resolve/resolve-tool.c
+@@ -17,7 +17,6 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
+-#include <gcrypt.h>
+ #include <getopt.h>
+ #include <net/if.h>
+ 
+@@ -863,7 +862,7 @@ static int resolve_openpgp(sd_bus *bus, const char *address) {
+         }
+         domain++;
+ 
+-        r = string_hashsum(address, domain - 1 - address, GCRY_MD_SHA224, &hashed);
++        r = string_hashsum_sha224(address, domain - 1 - address, &hashed);
+         if (r < 0)
+                 return log_error_errno(r, "Hashing failed: %m");
+ 
+diff --git a/src/shared/gcrypt-util.c b/src/shared/gcrypt-util.c
+index 4ff9452..39b544b 100644
+--- a/src/shared/gcrypt-util.c
++++ b/src/shared/gcrypt-util.c
+@@ -19,10 +19,11 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#ifdef HAVE_GCRYPT
+ #include <gcrypt.h>
+ 
+-#include "hexdecoct.h"
+ #include "gcrypt-util.h"
++#include "hexdecoct.h"
+ 
+ void initialize_libgcrypt(bool secmem) {
+         const char *p;
+@@ -67,3 +68,4 @@ int string_hashsum(const char *s, size_t len, int md_algorithm, char **out) {
+         *out = enc;
+         return 0;
+ }
++#endif
+diff --git a/src/shared/gcrypt-util.h b/src/shared/gcrypt-util.h
+index c7652c2..cf33b3c 100644
+--- a/src/shared/gcrypt-util.h
++++ b/src/shared/gcrypt-util.h
+@@ -19,7 +19,21 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#include <errno.h>
+ #include <stdbool.h>
++#include <stddef.h>
++
++#ifdef HAVE_GCRYPT
++#include <gcrypt.h>
+ 
+ void initialize_libgcrypt(bool secmem);
+ int string_hashsum(const char *s, size_t len, int md_algorithm, char **out);
++#endif
++
++static inline int string_hashsum_sha224(const char *s, size_t len, char **out) {
++#ifdef HAVE_GCRYPT
++        return string_hashsum(s, len, GCRY_MD_SHA224, out);
++#else
++        return -EOPNOTSUPP;
++#endif
++}
+-- 
+2.4.0
+
diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index b16cacb..309a4c3 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -53,6 +53,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0020-check-for-uchar.h-in-configure.patch \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+           file://0023-build-sys-fix-build-with-libgrcypt-disabled.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
@@ -101,7 +102,6 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
-# resolved needs gcrypt
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
-- 
2.4.0


