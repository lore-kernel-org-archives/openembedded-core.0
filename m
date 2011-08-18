Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i2-0006pi-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980374"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:46 -0700
Message-Id: <1c8661426f85c782b2ada72874b3dd126a581a07.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/32] eglibc: check dependencies among eglibc options
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:04 -0000

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1212]

'libc-inet' and 'ipv4' are the same thing, so remove 'libc-inet'
from the default DISTRO_FEATURES_LIBC in file default-distrovars.inc.

Check the dependencies among eglibc configurable options, make sure
that eglibc could be compile successfully only with part of the options.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 meta/recipes-core/eglibc/eglibc-options.inc     |   75 ++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 45b03d5..79c6e14 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -12,7 +12,7 @@ LOCALE_UTF8_ONLY ?= "0"
 
 DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-					libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
+					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
 					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
 					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 					libc-posix-wchar-io"
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index 119ceef..112029d 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -10,10 +10,83 @@ def eglibc_cfg(feature, features, tokens, cnf):
 				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
 				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
 
+# arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
+def distro_features_check_deps(distro_features):
+    new_dep = True
+    while new_dep:
+        new_dep = False
+
+        if 'ipv6' in distro_features and 'ipv4' not in distro_features:
+            new_dep = True
+            distro_features.extend(['ipv4'])
+
+        if 'ipv4' in distro_features and 'libc-nsswitch' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-nsswitch'])
+
+        if 'libc-cxx-tests' in distro_features:
+            if 'libc-posix-wchar-io' not in distro_features:
+                new_dep = True
+                distro_features.extend(['libc-posix-wchar-io'])
+            if 'libc-libm' not in distro_features:
+                new_dep = True
+                distro_features.extend(['libc-libm'])
+
+        if 'libc-catgets' in distro_features and 'libc-locale-code' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-locale-code'])
+
+        if 'libc-crypt-ufc' in distro_features and 'libc-crypt' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-crypt'])
+
+        if 'libc-getlogin' in distro_features and 'libc-utmp' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-utmp'])
+
+        if 'libc-inet-anl' in distro_features and 'ipv4' not in distro_features:
+            new_dep = True
+            distro_features.extend(['ipv4'])
+
+        if 'libc-locale-code' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-posix-clang-wchar'])
+
+        if 'libc-nis' in distro_features:
+            if 'ipv4' not in distro_features:
+                new_dep = True
+                distro_features.extend(['ipv4'])
+            if 'libc-sunrpc' not in distro_features:
+                new_dep = True
+                distro_features.extend(['libc-sunrpc'])
+
+        if 'libc-rcmd' in distro_features and 'ipv4' not in distro_features:
+            new_dep = True
+            distro_features.extend(['ipv4'])
+
+        if 'libc-sunrpc' in distro_features and 'ipv4' not in distro_features:
+            new_dep = True
+            distro_features.extend(['ipv4'])
+
+        if 'libc-utmpx' in distro_features and 'libc-utmp' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-utmp'])
+
+        if 'libc-posix-regexp-glibc' in distro_features and 'libc-posix-regexp' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-posix-regexp'])
+
+        if 'libc-posix-wchar-io' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
+            new_dep = True
+            distro_features.extend(['libc-posix-clang-wchar'])
+
 # Map distro features to eglibc options settings
 def features_to_eglibc_settings(d):
         cnf = ([])
         distro_features = (bb.data.getVar('DISTRO_FEATURES', d, True) or '').split()
+
+        distro_features_check_deps(distro_features)
+
         eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
         eglibc_cfg('libc-backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
         eglibc_cfg('libc-big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
@@ -31,7 +104,7 @@ def features_to_eglibc_settings(d):
         eglibc_cfg('libc-ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
         eglibc_cfg('libc-getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
         eglibc_cfg('libc-idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
-        eglibc_cfg('libc-inet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
+        eglibc_cfg('ipv4',      distro_features, 'OPTION_EGLIBC_INET', cnf)
         eglibc_cfg('libc-inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
         eglibc_cfg('libc-libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
         eglibc_cfg('libc-libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
-- 
1.7.6



