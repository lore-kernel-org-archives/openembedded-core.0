Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SLyCk-0007y1-8E for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 16:55:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3MEkQNb009591
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:46:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07382-09 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:46:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3MEkHRl009585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:46:19 +0100
Message-ID: <1335105977.12692.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Apr 2012 15:46:17 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] pseudo: Drop nativesdk wrapper and link against old memcpy symbol
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
X-List-Received-Date: Sun, 22 Apr 2012 14:55:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The -nativesdk pseudo wrapper setting LD_LIBRARY_PATH turned out to be a
bad idea since it can mix up different libc and lib-dl verisons which
may or may not work depending on the phase of the moon.

As an alternative to solving the original problem, this patch drops the
symbol version requirement on memcpy which allows pseudo to work with
libc's back to 2.7 which should be sufficient for our supported targets
using nativesdk.

[YOCTO #2299]
[YOCTO #2351]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pseudo/files/symver.patch b/meta/recipes-devtools/pseudo/files/symver.patch
new file mode 100644
index 0000000..8d1b377
--- a/dev/null
+++ b/meta/recipes-devtools/pseudo/files/symver.patch
@@ -0,0 +1,26 @@
+When running as pseudo-nativesdk, we might need to run host binaries 
+linked against the host libc. Having a 2.14 libc dependency from memcpy is
+problematic so instruct the linker to use older symbols.
+
+Upstream-Status: Pending
+
+RP 2012/4/22
+
+Index: pseudo-1.3/pseudo.h
+===================================================================
+--- pseudo-1.3.orig/pseudo.h	2012-04-22 12:17:59.078909060 +0000
++++ pseudo-1.3/pseudo.h	2012-04-22 12:32:42.954888587 +0000
+@@ -29,6 +29,13 @@
+ int pseudo_set_value(const char *key, const char *value);
+ char *pseudo_get_value(const char *key);
+ 
++#ifdef __amd64__   
++#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.2.5")
++#else   
++#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.0")
++#endif
++GLIBC_COMPAT_SYMBOL(memcpy);
++
+ #include "pseudo_tables.h"
+ 
+ extern void pseudo_debug_verbose(void);
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 3a37c69..8798018 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -9,6 +9,8 @@ SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
+SRC_URI_append_virtclass-nativesdk = " file://symver.patch"
+
 FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
@@ -75,8 +77,6 @@ do_install_append_virtclass-nativesdk () {
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
-
-	create_wrapper ${D}${bindir}/pseudo LD_LIBRARY_PATH=${base_libdir}:${libdir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
--
cgit 0.9.0.1




