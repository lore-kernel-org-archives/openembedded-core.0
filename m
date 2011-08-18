Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyoh-0000gV-Oo
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9IVtk021031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:31 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:31 -0700
Message-ID: <f61712e4960a318f5383db7421533d67d4c1bd2c.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:04:57 +0800
Date: Thu, 18 Aug 2011 17:18:27 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] eglibc: check dependencies among eglibc options
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
X-List-Received-Date: Thu, 18 Aug 2011 09:23:12 -0000
Content-Type: text/plain

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
1.7.5.1.300.gc565c



