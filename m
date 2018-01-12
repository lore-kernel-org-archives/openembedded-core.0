Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07AC778870
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:11:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0C8BVqM022598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 12 Jan 2018 00:11:31 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 12 Jan 2018 00:11:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jan 2018 03:11:22 -0500
Message-ID: <9107140fdfb54e5ad4b72d4632cad3d62aa25093.1515744181.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1515744181.git.hongxu.jia@windriver.com>
References: <cover.1515744181.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] wget: improve reproducibility
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
X-List-Received-Date: Fri, 12 Jan 2018 08:11:31 -0000
Content-Type: text/plain

Remove build host references from the internally
generated file version.c. The references get compiled into
executables, which leads to non-reproducible builds.
The removed references (--sysroot, -fdebug-prefix-map) were
only used as part of the `wget --version' which do not have
side effect.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/wget/wget.inc                |  3 ++
 .../wget/wget/0002-improve-reproducibility.patch   | 61 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.2.bb          |  1 +
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 1299edb..e374e6d 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -10,6 +10,9 @@ inherit autotools gettext texinfo update-alternatives pkgconfig
 EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
                 --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
 
+EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
+                 DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
+
 ALTERNATIVE_${PN} = "wget"
 ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
new file mode 100644
index 0000000..8781df2
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -0,0 +1,61 @@
+From 7f1357529d23b356b45fbb0dd7388588162e4cb8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 10 Jan 2018 14:43:20 +0800
+Subject: [PATCH] src/Makefile.am: improve reproducibility
+
+Remove build host references from the internally
+generated file version.c. The references get compiled into
+executables, which leads to non-reproducible builds.
+The removed references (--sysroot, -fdebug-prefix-map) were
+only used as part of the `wget --version' which do not have
+side effect.
+
+...
+$ wget --version
+GNU Wget 1.14 built on linux-gnu.
+
++digest +https +ipv6 +iri +large-file +nls +ntlm +opie +ssl/openssl
+
+Wgetrc:
+    /etc/wgetrc (system)
+Locale: /usr/share/locale
+Compile: gcc -DHAVE_CONFIG_H -DSYSTEM_WGETRC="/etc/wgetrc"
+    -DLOCALEDIR="/usr/share/locale" -I. -I../lib -I../lib -O2 -g -pipe
+    -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong
+    --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic
+Link: gcc -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
+    -fstack-protector-strong --param=ssp-buffer-size=4
+    -grecord-gcc-switches -m64 -mtune=generic -lssl -lcrypto
+    /usr/lib64/libssl.so /usr/lib64/libcrypto.so /usr/lib64/libz.so
+    -ldl -lz -lz -lidn -luuid -lpcre ftp-opie.o openssl.o http-ntlm.o
+    ../lib/libgnu.a
+...
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 28c0be2..44084a3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -87,9 +87,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
+ 	echo '#include "version.h"' >> $@
+ 	echo 'const char *version_string = "@VERSION@";' >> $@
+ 	echo 'const char *compilation_string = "'$(COMPILE)'";' \
++	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
++	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
+ 	    | $(ESCAPEQUOTE) >> $@
+ 	echo 'const char *link_string = "'$(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+ 	$(AM_LDFLAGS) $(LDFLAGS) $(LIBS) $(wget_LDADD)'";' \
++	    | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" \
++	          -e "s,$(DEBUG_PREFIX_MAP),,g" \
+ 	    | $(ESCAPEQUOTE) >> $@
+ 
+ css.c: $(srcdir)/css.l
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/wget/wget_1.19.2.bb b/meta/recipes-extended/wget/wget_1.19.2.bb
index bdafa70..c216ea8 100644
--- a/meta/recipes-extended/wget/wget_1.19.2.bb
+++ b/meta/recipes-extended/wget/wget_1.19.2.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0002-improve-reproducibility.patch \
           "
 
 SRC_URI[md5sum] = "caabf9727fa429626316619a6369fffa"
-- 
2.8.1


