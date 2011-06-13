Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QW34k-0005cQ-Dy
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:04:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5D91PaW026433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2011 02:01:25 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 13 Jun 2011 02:01:25 -0700
Message-ID: <5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
In-Reply-To: <cover.1307954821.git.kai.kang@windriver.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
Old-Date: Tue, 7 Jun 2011 16:16:43 +0800
Date: Mon, 13 Jun 2011 17:01:37 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Mon, 13 Jun 2011 09:04:50 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Migrate configurability from oe, try to shrink minimal image size

All eglibc configuration options are included in conf/distro/include/default-distrovars.inc.
Define DISTRO_FEATURES_LIBC and DISTRO_FEATURES in local.conf with the same way
in local.conf.sample.extended to enable those options.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/distro/include/default-distrovars.inc |    9 +++-
 meta/recipes-core/eglibc/eglibc-options.inc     |   62 +++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc             |    6 ++
 3 files changed, 76 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 4b68a0a..2cde46c 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,14 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 
-DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
+DISTRO_FEATURES_LIBC ?= "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
+					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
+					libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
+					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
+					libc-posix-wchar-io"
+
+DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
new file mode 100644
index 0000000..119ceef
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -0,0 +1,62 @@
+def eglibc_cfg(feature, features, tokens, cnf):
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + ' = y' for token in tokens])
+	else:
+		for token in tokens:
+			cnf.extend([token + ' = n'])
+			if token == 'OPTION_EGLIBC_NSSWITCH':
+				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
+				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
+
+# Map distro features to eglibc options settings
+def features_to_eglibc_settings(d):
+        cnf = ([])
+        distro_features = (bb.data.getVar('DISTRO_FEATURES', d, True) or '').split()
+        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
+        eglibc_cfg('libc-backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
+        eglibc_cfg('libc-big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
+        eglibc_cfg('libc-bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
+        eglibc_cfg('libc-cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
+        eglibc_cfg('libc-catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
+        eglibc_cfg('libc-charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
+        eglibc_cfg('libc-crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
+        eglibc_cfg('libc-crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
+        eglibc_cfg('libc-db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
+        eglibc_cfg('libc-envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
+        eglibc_cfg('libc-fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
+        eglibc_cfg('libc-fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
+        eglibc_cfg('libc-fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
+        eglibc_cfg('libc-ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
+        eglibc_cfg('libc-getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
+        eglibc_cfg('libc-idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
+        eglibc_cfg('libc-inet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
+        eglibc_cfg('libc-inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
+        eglibc_cfg('libc-libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
+        eglibc_cfg('libc-libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
+        eglibc_cfg('libc-locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
+        eglibc_cfg('libc-locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
+        eglibc_cfg('libc-memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
+        eglibc_cfg('libc-nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
+        eglibc_cfg('libc-nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
+        eglibc_cfg('libc-rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
+        eglibc_cfg('libc-rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
+        eglibc_cfg('libc-spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
+        eglibc_cfg('libc-streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
+        eglibc_cfg('libc-sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
+        eglibc_cfg('libc-utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
+        eglibc_cfg('libc-utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
+        eglibc_cfg('libc-wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
+        eglibc_cfg('libc-posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
+        eglibc_cfg('libc-posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
+        eglibc_cfg('libc-posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
+        eglibc_cfg('libc-posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
+
+        # try to fix disable charsets/locales/locale-code compile fail
+        if 'libc-charsets' in distro_features and 'libc-locales' in distro_features and 'libc-locale-code' in distro_features:
+            bb.data.setVar('PACKAGE_NO_GCONV', '0', d)
+        else:
+            bb.data.setVar('PACKAGE_NO_GCONV', '1', d)
+
+        return "\n".join(cnf)
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 46ffa82..616f1af 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -28,6 +28,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools
+require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
 
@@ -43,3 +44,8 @@ EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
 PARALLEL_MAKE = ""
 
 PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
+
+OE_FEATURES = "${@features_to_eglibc_settings(d)}"
+do_configure_prepend() {
+	echo '${OE_FEATURES}' > ${B}/option-groups.config
+}
-- 
1.7.5.1.300.gc565c



