Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 579716D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:07:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4D7Y64027551 for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 13:07:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4MasrmYjmeEq
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:07:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4D7UaK027529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 13:07:31 GMT
Message-ID: <1386162445.4463.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Dec 2013 13:07:25 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: eglibc-options: Rewrite so it benefits from bitbake's contains handling
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
X-List-Received-Date: Wed, 04 Dec 2013 13:07:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having eglibc rebuild every time DISTRO_FEATURES changes is suboptimal.
This rewrite takes advantage of bitbake's understanding of the contains
function so this doesn't happen. The code is marginally uglier but is
worth the benefit in fewer libc rebuilds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index c55d05d..04327584 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -1,7 +1,7 @@
-def eglibc_cfg(feature, features, tokens, cnf):
+def eglibc_cfg(feature, tokens, cnf):
     if type(tokens) == type(""):
         tokens = [tokens]
-    if type(features) == type([]) and feature in features:
+    if feature:
         cnf.extend([token + '=y' for token in tokens])
     else:
         for token in tokens:
@@ -10,119 +10,153 @@ def eglibc_cfg(feature, features, tokens, cnf):
                 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG=\"${S}/nss/nsswitch.conf\""])
                 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS=\"${S}/nss/fixed-nsswitch.functions\""])
 
-# arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
-def distro_features_check_deps(distro_features):
+# Map distro features to eglibc options settings
+def features_to_eglibc_settings(d):
+    cnf = ([])
+
+    ipv4 = base_contains('DISTRO_FEATURES', 'ipv4', True, False, d)
+    ipv6 = base_contains('DISTRO_FEATURES', 'ipv6', True, False, d)
+    libc_backtrace = base_contains('DISTRO_FEATURES', 'libc-backtrace', True, False, d) 
+    libc_big_macros = base_contains('DISTRO_FEATURES', 'libc-big-macros', True, False, d)
+    libc_bsd = base_contains('DISTRO_FEATURES', 'libc-bsd', True, False, d)
+    libc_cxx_tests = base_contains('DISTRO_FEATURES', 'libc-cxx-tests', True, False, d)
+    libc_catgets = base_contains('DISTRO_FEATURES', 'libc-catgets', True, False, d)
+    libc_charsets = base_contains('DISTRO_FEATURES', 'libc-charsets', True, False, d)
+    libc_crypt = base_contains('DISTRO_FEATURES', 'libc-crypt', True, False, d)
+    libc_crypt_ufc = base_contains('DISTRO_FEATURES', 'libc-crypt-ufc', True, False, d)
+    libc_db_aliases = base_contains('DISTRO_FEATURES', 'libc-db-aliases', True, False, d)
+    libc_envz = base_contains('DISTRO_FEATURES', 'libc-envz', True, False, d)
+    libc_fcvt = base_contains('DISTRO_FEATURES', 'libc-fcvt', True, False, d)
+    libc_fmtmsg = base_contains('DISTRO_FEATURES', 'libc-fmtmsg', True, False, d)
+    libc_fstab = base_contains('DISTRO_FEATURES', 'libc-fstab', True, False, d)
+    libc_ftraverse = base_contains('DISTRO_FEATURES', 'libc-ftraverse', True, False, d)
+    libc_getlogin = base_contains('DISTRO_FEATURES', 'libc-getlogin', True, False, d)
+    libc_idn = base_contains('DISTRO_FEATURES', 'libc-idn', True, False, d)
+    libc_inet_anl = base_contains('DISTRO_FEATURES', 'libc-inet-anl', True, False, d)
+    libc_libm = base_contains('DISTRO_FEATURES', 'libc-libm', True, False, d)
+    libc_locales = base_contains('DISTRO_FEATURES', 'libc-locales', True, False, d)
+    libc_locale_code = base_contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d)
+    libc_memusage = base_contains('DISTRO_FEATURES', 'libc-memusage', True, False, d)
+    libc_nis = base_contains('DISTRO_FEATURES', 'libc-nis', True, False, d)
+    libc_nsswitch = base_contains('DISTRO_FEATURES', 'libc-nsswitch', True, False, d)
+    libc_rcmd = base_contains('DISTRO_FEATURES', 'libc-rcmd', True, False, d)
+    libc_rtld_debug = base_contains('DISTRO_FEATURES', 'libc-rtld-debug', True, False, d)
+    libc_spawn = base_contains('DISTRO_FEATURES', 'libc-spawn', True, False, d)
+    libc_streams = base_contains('DISTRO_FEATURES', 'libc-streams', True, False, d)
+    libc_sunrpc = base_contains('DISTRO_FEATURES', 'libc-sunrpc', True, False, d)
+    libc_utmp = base_contains('DISTRO_FEATURES', 'libc-utmp', True, False, d)
+    libc_utmpx = base_contains('DISTRO_FEATURES', 'libc-utmpx', True, False, d)
+    libc_wordexp = base_contains('DISTRO_FEATURES', 'libc-wordexp', True, False, d)
+    libc_posix_clang_wchar = base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', True, False, d)
+    libc_posix_regexp = base_contains('DISTRO_FEATURES', 'libc-posix-regexp', True, False, d)
+    libc_posix_regexp_glibc = base_contains('DISTRO_FEATURES', 'libc-posix-regexp-glibc', True, False, d)
+    libc_posix_wchar_io = base_contains('DISTRO_FEATURES', 'libc-posix-wchar-io', True, False, d)
+
+    # arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
     new_dep = True
     while new_dep:
         new_dep = False
 
-        if 'ipv6' in distro_features and 'ipv4' not in distro_features:
+        if ipv6 and not ipv4:
             new_dep = True
-            distro_features.extend(['ipv4'])
+            ipv4 = True
 
-        if 'ipv4' in distro_features and 'libc-nsswitch' not in distro_features:
+        if ipv4 and not libc_nsswitch:
             new_dep = True
-            distro_features.extend(['libc-nsswitch'])
+            libc_nsswitch = True
 
-        if 'libc-cxx-tests' in distro_features:
-            if 'libc-posix-wchar-io' not in distro_features:
+        if libc_cxx_tests:
+            if not libc_posix_wchar_io:
                 new_dep = True
-                distro_features.extend(['libc-posix-wchar-io'])
-            if 'libc-libm' not in distro_features:
+                libc_posix_wchar_io = True
+            if not libc_libm:
                 new_dep = True
-                distro_features.extend(['libc-libm'])
+                libc_libm = True
 
-        if 'libc-catgets' in distro_features and 'libc-locale-code' not in distro_features:
+        if libc_catgets and not libc_locale_code:
             new_dep = True
-            distro_features.extend(['libc-locale-code'])
+            libc_locale_code = True
 
-        if 'libc-crypt-ufc' in distro_features and 'libc-crypt' not in distro_features:
+        if libc_crypt_ufc and not libc_crypt:
             new_dep = True
-            distro_features.extend(['libc-crypt'])
+            libc_crypt = True
 
-        if 'libc-getlogin' in distro_features and 'libc-utmp' not in distro_features:
+        if libc_getlogin and not libc_utmp:
             new_dep = True
-            distro_features.extend(['libc-utmp'])
+            libc_utmp = True
 
-        if 'libc-inet-anl' in distro_features and 'ipv4' not in distro_features:
+        if libc_inet_anl and not ipv4:
             new_dep = True
-            distro_features.extend(['ipv4'])
+            ipv4 = True
 
-        if 'libc-locale-code' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
+        if libc_locale_code and not libc_posix_clang_wchar:
             new_dep = True
-            distro_features.extend(['libc-posix-clang-wchar'])
+            libc_posix_clang_wchar = True
 
-        if 'libc-nis' in distro_features:
-            if 'ipv4' not in distro_features:
+        if libc_nis:
+            if not ipv4:
                 new_dep = True
-                distro_features.extend(['ipv4'])
-            if 'libc-sunrpc' not in distro_features:
+                ipv4 = True
+            if not libc_sunrpc:
                 new_dep = True
-                distro_features.extend(['libc-sunrpc'])
+                libc_sunrpc = True
 
-        if 'libc-rcmd' in distro_features and 'ipv4' not in distro_features:
+        if libc_rcmd and not ipv4:
             new_dep = True
-            distro_features.extend(['ipv4'])
+            ipv4 = True
 
-        if 'libc-sunrpc' in distro_features and 'ipv4' not in distro_features:
+        if libc_sunrpc and not ipv4:
             new_dep = True
-            distro_features.extend(['ipv4'])
+            ipv4 = True
 
-        if 'libc-utmpx' in distro_features and 'libc-utmp' not in distro_features:
+        if libc_utmpx and not libc_utmp:
             new_dep = True
-            distro_features.extend(['libc-utmp'])
+            libc_utmp = True
 
-        if 'libc-posix-regexp-glibc' in distro_features and 'libc-posix-regexp' not in distro_features:
+        if libc_posix_regexp_glibc and not libc_posix_regexp:
             new_dep = True
-            distro_features.extend(['libc-posix-regexp'])
+            libc_posix_regexp = True
 
-        if 'libc-posix-wchar-io' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
+        if libc_posix_wchar_io and not libc_posix_clang_wchar:
             new_dep = True
-            distro_features.extend(['libc-posix-clang-wchar'])
-
-# Map distro features to eglibc options settings
-def features_to_eglibc_settings(d):
-        cnf = ([])
-        distro_features = (d.getVar('DISTRO_FEATURES', True) or '').split()
-
-        distro_features_check_deps(distro_features)
-
-        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
-        eglibc_cfg('libc-backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
-        eglibc_cfg('libc-big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
-        eglibc_cfg('libc-bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
-        eglibc_cfg('libc-cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
-        eglibc_cfg('libc-catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
-        eglibc_cfg('libc-charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
-        eglibc_cfg('libc-crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
-        eglibc_cfg('libc-crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
-        eglibc_cfg('libc-db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
-        eglibc_cfg('libc-envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
-        eglibc_cfg('libc-fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
-        eglibc_cfg('libc-fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
-        eglibc_cfg('libc-fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
-        eglibc_cfg('libc-ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
-        eglibc_cfg('libc-getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
-        eglibc_cfg('libc-idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
-        eglibc_cfg('ipv4',      distro_features, 'OPTION_EGLIBC_INET', cnf)
-        eglibc_cfg('libc-inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
-        eglibc_cfg('libc-libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
-        eglibc_cfg('libc-locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
-        eglibc_cfg('libc-locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
-        eglibc_cfg('libc-memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
-        eglibc_cfg('libc-nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
-        eglibc_cfg('libc-nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
-        eglibc_cfg('libc-rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
-        eglibc_cfg('libc-rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
-        eglibc_cfg('libc-spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
-        eglibc_cfg('libc-streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
-        eglibc_cfg('libc-sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
-        eglibc_cfg('libc-utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
-        eglibc_cfg('libc-utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
-        eglibc_cfg('libc-wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
-        eglibc_cfg('libc-posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
-        eglibc_cfg('libc-posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
-        eglibc_cfg('libc-posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
-        eglibc_cfg('libc-posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
-
-        return "\n".join(cnf)
+            libc_posix_clang_wchar = True
+
+    eglibc_cfg(ipv6, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
+    eglibc_cfg(libc_backtrace, 'OPTION_EGLIBC_BACKTRACE', cnf)
+    eglibc_cfg(libc_big_macros, 'OPTION_EGLIBC_BIG_MACROS', cnf)
+    eglibc_cfg(libc_bsd, 'OPTION_EGLIBC_BSD', cnf)
+    eglibc_cfg(libc_cxx_tests, 'OPTION_EGLIBC_CXX_TESTS', cnf)
+    eglibc_cfg(libc_catgets, 'OPTION_EGLIBC_CATGETS', cnf)
+    eglibc_cfg(libc_charsets, 'OPTION_EGLIBC_CHARSETS', cnf)
+    eglibc_cfg(libc_crypt, 'OPTION_EGLIBC_CRYPT', cnf)
+    eglibc_cfg(libc_crypt_ufc, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
+    eglibc_cfg(libc_db_aliases, 'OPTION_EGLIBC_DB_ALIASES', cnf)
+    eglibc_cfg(libc_envz, 'OPTION_EGLIBC_ENVZ', cnf)
+    eglibc_cfg(libc_fcvt, 'OPTION_EGLIBC_FCVT', cnf)
+    eglibc_cfg(libc_fmtmsg, 'OPTION_EGLIBC_FMTMSG', cnf)
+    eglibc_cfg(libc_fstab, 'OPTION_EGLIBC_FSTAB', cnf)
+    eglibc_cfg(libc_ftraverse, 'OPTION_EGLIBC_FTRAVERSE', cnf)
+    eglibc_cfg(libc_getlogin, 'OPTION_EGLIBC_GETLOGIN', cnf)
+    eglibc_cfg(libc_idn, 'OPTION_EGLIBC_IDN', cnf)
+    eglibc_cfg(ipv4, 'OPTION_EGLIBC_INET', cnf)
+    eglibc_cfg(libc_inet_anl, 'OPTION_EGLIBC_INET_ANL', cnf)
+    eglibc_cfg(libc_libm, 'OPTION_EGLIBC_LIBM', cnf)
+    eglibc_cfg(libc_locales, 'OPTION_EGLIBC_LOCALES', cnf)
+    eglibc_cfg(libc_locale_code, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
+    eglibc_cfg(libc_memusage, 'OPTION_EGLIBC_MEMUSAGE', cnf)
+    eglibc_cfg(libc_nis, 'OPTION_EGLIBC_NIS', cnf)
+    eglibc_cfg(libc_nsswitch, 'OPTION_EGLIBC_NSSWITCH', cnf)
+    eglibc_cfg(libc_rcmd, 'OPTION_EGLIBC_RCMD', cnf)
+    eglibc_cfg(libc_rtld_debug, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
+    eglibc_cfg(libc_spawn, 'OPTION_EGLIBC_SPAWN', cnf)
+    eglibc_cfg(libc_streams, 'OPTION_EGLIBC_STREAMS', cnf)
+    eglibc_cfg(libc_sunrpc, 'OPTION_EGLIBC_SUNRPC', cnf)
+    eglibc_cfg(libc_utmp, 'OPTION_EGLIBC_UTMP', cnf)
+    eglibc_cfg(libc_utmpx, 'OPTION_EGLIBC_UTMPX', cnf)
+    eglibc_cfg(libc_wordexp, 'OPTION_EGLIBC_WORDEXP', cnf)
+    eglibc_cfg(libc_posix_clang_wchar, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
+    eglibc_cfg(libc_posix_regexp, 'OPTION_POSIX_REGEXP', cnf)
+    eglibc_cfg(libc_posix_regexp_glibc, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
+    eglibc_cfg(libc_posix_wchar_io, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
+
+    return "\n".join(cnf)



