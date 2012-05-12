Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ST1tg-0005aH-Tb
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 04:17:29 +0200
Received: by lbol5 with SMTP id l5so2341350lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 19:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6MKfLP+2jwg27Y7eAzDyEk4D4nOqmrZIatqZX0d1oNs=;
	b=DL9AVwDRPf9j88oB/N+J/gl+ps9+mmB5h0OV37Iz2M32ri1JzjenCaVf7sIO58wv0j
	A/lU9ppS/XK7GGuFBuGJuzPMC+euWgrwS4QKLo6yDDJBuvW0OLpZ69nSXxmXNz5o20V/
	liClIH2rSk0+nQ8+iIwfWfcLc9fy7M+RRcOaETdjYDLMi84h7Q9HjrIEN2gAkCkKhkBN
	NDusjQBzhfb/K7xwkFPxNXBdXGZ4auoy5H3tjeZ3UkMebTQmlMBWoFP65mGrwKHyENA2
	AyXl9q8GlG9fKl8SGVVzGMYtFeahuPQAILIxwKjamca6gDkLRlV8wwFoowY0cS3QRfy8
	NmcA==
Received: by 10.152.103.109 with SMTP id fv13mr254199lab.33.1336788452701;
	Fri, 11 May 2012 19:07:32 -0700 (PDT)
Received: from alpha.cazfi.net (a91-153-5-101.elisa-laajakaista.fi.
	[91.153.5.101])
	by mx.google.com with ESMTPS id o2sm13970060lbd.7.2012.05.11.19.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 19:07:31 -0700 (PDT)
Received: from cazfi by alpha.cazfi.net with local (Exim 4.77)
	(envelope-from <cazfi74@gmail.com>)
	id 1ST1k1-0002f8-Pp; Sat, 12 May 2012 05:07:29 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 May 2012 05:07:23 +0300
Message-Id: <1336788443-10207-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] apt: update to upstream version 0.9.2
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
X-List-Received-Date: Sat, 12 May 2012 02:17:29 -0000

Update apt recipes to get latest upstream version (0.9.2) as
0.7.14 is no longer available.

* includes-fix.patch : removed as already part of upstream
* localefixes.patch : removed as already part of upstream
* no-ko-translation.patch : removed as there's no apparent reason to disable ko translation
* noconfigure.patch : updated to apply cleanly
* nodoc.patch : updated to apply cleanly. Used by apt-native only, as...
* disable-doxygen.patch : ...new patch applied to target apt. As more of the documentation
                          is generated instead of being static, we can no longer disable
                          all documentation generation with nodoc.patch but this patch
                          disables just doxygen documentation generation
* remove-redeclaration.patch : removed as already part of upstream
* no-nls-dpkg.patch : new patch to fix compilation when NLS disabled
* override-i18n-inc.patch : new patch to fix compilation problems caused by apti18n.h
                            defining and undefining stuff in a way that broke system
                            headers
* use-host.patch : updated to apply cleanly
* no-curl.patch : updated to apply cleanly

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../apt/apt-0.7.14/includes-fix.patch              |   44 ----------
 .../apt/apt-0.7.14/localefixes.patch               |   91 --------------------
 .../apt/apt-0.7.14/no-ko-translation.patch         |   11 ---
 .../apt/apt-0.7.14/noconfigure.patch               |   37 --------
 meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch   |   21 -----
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   57 ------------
 meta/recipes-devtools/apt/apt-native.inc           |   11 +--
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |   13 ---
 meta/recipes-devtools/apt/apt-native_0.9.2.bb      |   12 +++
 meta/recipes-devtools/apt/apt-package.inc          |   36 +-------
 meta/recipes-devtools/apt/apt.inc                  |    7 +-
 .../recipes-devtools/apt/apt/disable-doxygen.patch |   30 +++++++
 .../apt/{apt-0.7.14 => apt}/makerace.patch         |    0
 meta/recipes-devtools/apt/apt/no-nls-dpkg.patch    |   33 +++++++
 meta/recipes-devtools/apt/apt/noconfigure.patch    |   40 +++++++++
 meta/recipes-devtools/apt/apt/nodoc.patch          |   18 ++++
 .../apt/apt/override-i18n-inc.patch                |   25 ++++++
 .../apt/{apt-0.7.14 => apt}/use-host.patch         |   34 +++-----
 meta/recipes-devtools/apt/apt_0.7.14.bb            |   20 -----
 meta/recipes-devtools/apt/apt_0.9.2.bb             |   18 ++++
 meta/recipes-devtools/apt/files/no-curl.patch      |   38 ++++----
 21 files changed, 217 insertions(+), 379 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-native_0.7.14.bb
 create mode 100644 meta/recipes-devtools/apt/apt-native_0.9.2.bb
 create mode 100644 meta/recipes-devtools/apt/apt/disable-doxygen.patch
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt}/makerace.patch (100%)
 create mode 100644 meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
 create mode 100644 meta/recipes-devtools/apt/apt/noconfigure.patch
 create mode 100644 meta/recipes-devtools/apt/apt/nodoc.patch
 create mode 100644 meta/recipes-devtools/apt/apt/override-i18n-inc.patch
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt}/use-host.patch (50%)
 delete mode 100644 meta/recipes-devtools/apt/apt_0.7.14.bb
 create mode 100644 meta/recipes-devtools/apt/apt_0.9.2.bb

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch b/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
deleted file mode 100644
index c85c388..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-
-Add missing includes required when building with modern toolchain, based on
-patch from Debian bugzilla:
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=505954
-
-Should no longer be required once upgraded to 0.7.22 or later.
-
-Index: apt-0.7.14/apt-pkg/acquire.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/acquire.cc	2008-05-28 14:22:13.000000000 +0100
-+++ apt-0.7.14/apt-pkg/acquire.cc	2010-07-23 17:30:11.494883936 +0100
-@@ -22,6 +22,7 @@
- 
- #include <apti18n.h>
- 
-+#include <cstdio>
- #include <iostream>
- #include <sstream>
-     
-Index: apt-0.7.14/apt-pkg/contrib/sha256.h
-===================================================================
---- apt-0.7.14.orig/apt-pkg/contrib/sha256.h	2008-05-28 14:22:14.000000000 +0100
-+++ apt-0.7.14/apt-pkg/contrib/sha256.h	2010-07-23 17:30:11.494883936 +0100
-@@ -14,6 +14,7 @@
- #ifndef APTPKG_SHA256_H
- #define APTPKG_SHA256_H
- 
-+#include <stdint.h>
- #include <string>
- #include <cstring>
- #include <algorithm>
-Index: apt-0.7.14/apt-pkg/deb/dpkgpm.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/deb/dpkgpm.cc	2008-05-28 14:22:14.000000000 +0100
-+++ apt-0.7.14/apt-pkg/deb/dpkgpm.cc	2010-07-23 17:30:36.960856870 +0100
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <fcntl.h>
- #include <sys/select.h>
-+#include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <signal.h>
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch b/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
deleted file mode 100644
index 8025273..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Add in missing header includes to resolve compile failures with recent 
-compiler/glibc combinations.
-
-Upstream-Status: Inappropriate [Resolved upstream]
-
-RP 2011/11/23
-
-Index: apt-0.7.14/apt-pkg/init.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/init.cc	2011-11-23 22:48:53.544637868 +0000
-+++ apt-0.7.14/apt-pkg/init.cc	2011-11-23 22:48:59.456638260 +0000
-@@ -16,6 +16,7 @@
- #include <config.h>
- #include <cstdlib>
- #include <sys/stat.h>
-+#include <locale>
- 									/*}}}*/
- 
- #define Stringfy_(x) # x
-Index: apt-0.7.14/cmdline/apt-cache.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-cache.cc	2011-11-23 22:53:29.048631067 +0000
-+++ apt-0.7.14/cmdline/apt-cache.cc	2011-11-23 22:54:15.784616212 +0000
-@@ -32,6 +32,7 @@
- #include <apti18n.h>
- 
- #include <locale.h>
-+#include <locale>
- #include <iostream>
- #include <unistd.h>
- #include <errno.h>
-Index: apt-0.7.14/cmdline/apt-cdrom.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-cdrom.cc	2011-11-23 22:53:29.064631096 +0000
-+++ apt-0.7.14/cmdline/apt-cdrom.cc	2011-11-23 22:53:57.616630261 +0000
-@@ -27,6 +27,7 @@
- //#include "indexcopy.h"
- 
- #include <locale.h>
-+#include <locale>
- #include <iostream>
- #include <fstream>
- #include <vector>
-Index: apt-0.7.14/cmdline/apt-config.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-config.cc	2011-11-23 22:50:16.796635352 +0000
-+++ apt-0.7.14/cmdline/apt-config.cc	2011-11-23 22:50:25.640633906 +0000
-@@ -27,6 +27,7 @@
- #include <locale.h>
- #include <iostream>
- #include <string>
-+#include <locale>
- 									/*}}}*/
- using namespace std;
- 
-Index: apt-0.7.14/cmdline/apt-extracttemplates.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:29.080631084 +0000
-+++ apt-0.7.14/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:38.304630439 +0000
-@@ -39,6 +39,7 @@
- #include <config.h>
- #include <apti18n.h>
- #include "apt-extracttemplates.h"
-+#include <locale>
- 									/*}}}*/
- 
- using namespace std;
-Index: apt-0.7.14/cmdline/apt-get.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-get.cc	2011-11-23 22:53:29.096631090 +0000
-+++ apt-0.7.14/cmdline/apt-get.cc	2011-11-23 22:53:49.368629452 +0000
-@@ -48,6 +48,7 @@
- 
- #include <set>
- #include <locale.h>
-+#include <locale>
- #include <langinfo.h>
- #include <fstream>
- #include <termios.h>
-Index: apt-0.7.14/cmdline/apt-sortpkgs.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:03.872640247 +0000
-+++ apt-0.7.14/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:10.880638611 +0000
-@@ -27,6 +27,7 @@
- 
- #include <locale.h>
- #include <unistd.h>
-+#include <locale>
- 									/*}}}*/
- 
- using namespace std;
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
deleted file mode 100644
index 7fd1db8..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- po/LINGUAS |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- apt-0.7.14.orig/po/LINGUAS
-+++ apt-0.7.14/po/LINGUAS
-@@ -1 +1 @@
--ar bg bs ca cs cy da de dz el en_GB es eu fi fr gl he hu it ja km ko ku mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
-+ar bg bs ca cs cy da de dz el en_GB es eu fi fr gl he hu it ja km ku mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
deleted file mode 100644
index 04e721d..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- apt-pkg/packagemanager.cc |    4 ++++
- 1 file changed, 4 insertions(+)
-
---- apt-0.6.45exp2.orig/apt-pkg/packagemanager.cc
-+++ apt-0.6.45exp2/apt-pkg/packagemanager.cc
-@@ -534,10 +534,12 @@ bool pkgPackageManager::SmartUnPack(PkgI
-    
-    List->Flag(Pkg,pkgOrderList::UnPacked,pkgOrderList::States);
-    
-+#if 0
-    // Perform immedate configuration of the package.
-    if (List->IsFlag(Pkg,pkgOrderList::Immediate) == true)
-       if (SmartConfigure(Pkg) == false)
- 	 return _error->Error("Internal Error, Could not perform immediate configuration (2) on %s",Pkg.Name());
-+#endif
-    
-    return true;
- }
-@@ -609,6 +611,7 @@ pkgPackageManager::OrderResult pkgPackag
-       DoneSomething = true;
-    }
-    
-+#if 0
-    // Final run through the configure phase
-    if (ConfigureAll() == false)
-       return Failed;
-@@ -623,6 +626,7 @@ pkgPackageManager::OrderResult pkgPackag
- 	 return Failed;
-       }
-    }   
-+#endif
- 	 
-    return Completed;
- }
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch b/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
deleted file mode 100644
index 216c091..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- apt-0.7.14.orig/Makefile
-+++ apt-0.7.14/Makefile
-@@ -15,11 +15,11 @@ all headers library clean veryclean bina
- 	$(MAKE) -C apt-inst $@
- 	$(MAKE) -C methods $@
- 	$(MAKE) -C cmdline $@
- 	$(MAKE) -C ftparchive $@
- 	$(MAKE) -C dselect $@
--	$(MAKE) -C doc $@
-+#	$(MAKE) -C doc $@
- 	$(MAKE) -C po $@
- 
- # Some very common aliases
- .PHONY: maintainer-clean dist-clean distclean pristine sanity 
- maintainer-clean dist-clean distclean pristine sanity: veryclean
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
deleted file mode 100644
index 68cb0b0..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Fix build errors
-
-deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
-deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
-deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: apt-0.7.14/apt-pkg/deb/deblistparser.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/deb/deblistparser.cc	2012-03-30 11:17:09.112456632 -0700
-+++ apt-0.7.14/apt-pkg/deb/deblistparser.cc	2012-03-30 11:25:40.484481643 -0700
-@@ -209,18 +209,18 @@
-       /* Strip out any spaces from the text, this undoes dpkgs reformatting
-          of certain fields. dpkg also has the rather interesting notion of
-          reformatting depends operators < -> <= */
--      char *I = S;
-+      char *J = S;
-       for (; Start != End; Start++)
-       {
- 	 if (isspace(*Start) == 0)
--	    *I++ = tolower(*Start);
-+	    *J++ = tolower(*Start);
- 	 if (*Start == '<' && Start[1] != '<' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
- 	 if (*Start == '>' && Start[1] != '>' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
-       }
- 
--      Result = AddCRC16(Result,S,I - S);
-+      Result = AddCRC16(Result,S,J - S);
-    }
-    
-    return Result;
-Index: apt-0.7.14/cmdline/apt-get.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-get.cc	2012-03-30 11:28:56.048490824 -0700
-+++ apt-0.7.14/cmdline/apt-get.cc	2012-03-30 11:32:00.248499740 -0700
-@@ -1752,12 +1752,12 @@
- 	 if ((*Cache)[I].Install() == false)
- 	    continue;
- 
--	 const char **J;
--	 for (J = CmdL.FileList + 1; *J != 0; J++)
--	    if (strcmp(*J,I.Name()) == 0)
-+	 const char **K;
-+	 for (K = CmdL.FileList + 1; *K != 0; J++)
-+	    if (strcmp(*K,I.Name()) == 0)
- 		break;
- 	 
--	 if (*J == 0) {
-+	 if (*K == 0) {
- 	    List += string(I.Name()) + " ";
- 	    VersionsList += string(Cache[I].CandVersion) + "\n";
- 	 }
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 51e1e3b..7e5f7d9 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -39,12 +39,8 @@ do_install_base () {
 	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
+	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}/
+	oe_libinstall -so -C bin libapt-inst ${D}${libdir}/
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
@@ -56,7 +52,8 @@ do_install_base () {
 	install -m 0755 dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
 	install -m 0755 dselect/update ${D}${libdir}/dpkg/methods/apt/ 
 
-	install -d ${D}${sysconfdir}/apt
+	install -d ${D}${sysconfdir}/apt/apt.conf.d
+	install -d ${D}${sysconfdir}/apt/preferences.d
 	install -d ${D}${localstatedir}/lib/apt/lists/partial
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
deleted file mode 100644
index ec3fd20..0000000
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require apt-native.inc
-
-PR = "r7"
-
-SRC_URI += "file://nodoc.patch \
-            file://noconfigure.patch \
-	    file://no-curl.patch \
-	    file://includes-fix.patch"
-
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
-
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt-native_0.9.2.bb b/meta/recipes-devtools/apt/apt-native_0.9.2.bb
new file mode 100644
index 0000000..1aea1d2
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-native_0.9.2.bb
@@ -0,0 +1,12 @@
+require apt-native.inc
+
+PR = "r0"
+
+SRC_URI += "file://nodoc.patch \
+            file://noconfigure.patch \
+	    file://no-curl.patch"
+
+SRC_URI[md5sum] = "8a7bbab661fdde926d96a3833c1c6399"
+SRC_URI[sha256sum] = "8ef1e68165dc7c670838e84d4d230aaf5d93b42eeb1865114e7ef7fb703dfb6c"
+
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 736672c..a04a3da 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -5,33 +5,9 @@ apt-manpages="doc/apt-cache.8 \
 	      doc/apt.8 \
 	      doc/apt.conf.5 \
 	      doc/apt_preferences.5 \
-	      doc/fr/apt-cache.fr.8 \
-	      doc/fr/apt-cdrom.fr.8 \
-	      doc/fr/apt-config.fr.8 \
-	      doc/fr/apt-get.fr.8 \
-	      doc/fr/apt.conf.fr.5 \
-	      doc/fr/apt_preferences.fr.5 \
-	      doc/fr/sources.list.fr.5 \
-	      doc/es/apt.es.8 \
-	      doc/es/apt-cache.es.8 \
-	      doc/es/apt-cdrom.es.8 \
-	      doc/es/apt-config.es.8 \
-	      doc/es/apt-get.es.8 \
-	      doc/es/apt.conf.es.5 \
-	      doc/es/apt_preferences.es.5 \
-	      doc/es/sources.list.es.5 \
-	      doc/pt_BR/apt_preferences.pt_BR.5 \
-	      doc/ja/apt-cache.ja.8 \
-	      doc/ja/apt-cdrom.ja.8 \
-	      doc/ja/apt-get.ja.8 \
-	      doc/ja/apt.conf.ja.5 \
 	      doc/sources.list.5"
 apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1 \
-		    doc/fr/apt-extracttemplates.fr.1 \
-		    doc/fr/apt-sortpkgs.fr.1"
-#		    doc/fr/apt-ftparchive.fr.1
-#		    doc/apt-ftparchive.1
+		    doc/apt-sortpkgs.1"
 
 def get_files_apt_doc(d, bb, manpages):
 	import re
@@ -77,12 +53,8 @@ do_install () {
 	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
+	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}/
+	oe_libinstall -so -C bin libapt-inst ${D}${libdir}/
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
@@ -94,7 +66,7 @@ do_install () {
 	install -m 0755 dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
 	install -m 0755 dselect/update ${D}${libdir}/dpkg/methods/apt/ 
 
-	install -d ${D}${sysconfdir}/apt
+	install -d ${D}${sysconfdir}/apt/apt.conf.d
 	install -d ${D}${localstatedir}/lib/apt/lists/partial
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 	install -d ${D}${docdir}/apt/examples
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 9d32ddb..bf00644 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -3,11 +3,10 @@ LICENSE = "GPLv2.0+"
 SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
-           file://no-ko-translation.patch \
            file://use-host.patch \
-           file://localefixes.patch \
            file://makerace.patch \
-           "
+           file://no-nls-dpkg.patch \
+           file://override-i18n-inc.patch"
 
 inherit autotools gettext
 
@@ -15,7 +14,7 @@ EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
 
 # Apt wants to know the glibc version by running a binary file, which will
 # fail, so we have to tell configure which version to use Since I don't know
-# the impliations of setting a wrong value I only provide one for angstrom,
+# the implications of setting a wrong value I only provide one for angstrom,
 # which uses glibc 2.5 (which claims to be 2.4) 
 # Koen - 20070327
 EXTRA_OECONF_append_angstrom = " ac_cv_glibc_ver=libc6.4"
diff --git a/meta/recipes-devtools/apt/apt/disable-doxygen.patch b/meta/recipes-devtools/apt/apt/disable-doxygen.patch
new file mode 100644
index 0000000..e0a0dc8
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/disable-doxygen.patch
@@ -0,0 +1,30 @@
+Do not try, and fail, to generate doxygen documentation
+
+Upstream-Status: Inappropriate [configuration]
+
+signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/doc/makefile apt-0.9.2/doc/makefile
+--- apt-0.9.2/doc/makefile	2012-04-16 20:23:05.000000000 +0300
++++ apt-0.9.2/doc/makefile	2012-05-05 02:27:21.000000000 +0300
+@@ -82,20 +82,3 @@
+ stats:
+ 	for i in po/*.po; do echo -n "$$i: "; msgfmt --statistics $$i; done
+ 
+-ifdef DOXYGEN
+-DOXYGEN_SOURCES = $(shell find $(BASE)/apt-pkg -not -name .\\\#* -and \( -name \*.cc -or -name \*.h \) )
+-
+-clean: doxygen-clean
+-
+-doxygen-clean:
+-	rm -fr $(BUILD)/doc/doxygen
+-	rm -f $(BUILD)/doc/doxygen-stamp
+-
+-$(BUILD)/doc/doxygen-stamp: $(DOXYGEN_SOURCES) $(BUILD)/doc/Doxyfile
+-	rm -fr $(BUILD)/doc/doxygen
+-	mkdir $(BUILD)/doc/doxygen  # some versions seem to not create this directory #628799
+-	$(DOXYGEN) $(BUILD)/doc/Doxyfile
+-	touch $(BUILD)/doc/doxygen-stamp
+-
+-doc: $(BUILD)/doc/doxygen-stamp
+-endif
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch b/meta/recipes-devtools/apt/apt/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
rename to meta/recipes-devtools/apt/apt/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
new file mode 100644
index 0000000..144a43b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
@@ -0,0 +1,33 @@
+Fixed compilation when NLS is not enabled
+
+Upstream-Status: Submitted [http://bugs.debian.org/cgi-bin/bugreport.cgi?archive=no&bug=671587]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/apt-pkg/deb/dpkgpm.cc apt-0.9.2/apt-pkg/deb/dpkgpm.cc
+--- apt-0.9.2/apt-pkg/deb/dpkgpm.cc	2012-04-20 12:20:12.000000000 +0300
++++ apt-0.9.2/apt-pkg/deb/dpkgpm.cc	2012-05-05 04:50:43.000000000 +0300
+@@ -46,6 +46,12 @@
+ #include <apti18n.h>
+ 									/*}}}*/
+ 
++#ifdef USE_NLS
++#define _dpkg(x) dgettext("dpkg", x)
++#else
++#define _dpkg(x) x
++#endif
++
+ using namespace std;
+ 
+ class pkgDPkgPMPrivate 
+@@ -1474,8 +1480,8 @@
+       return;
+    }
+ 
+-   // check if its not a follow up error 
+-   const char *needle = dgettext("dpkg", "dependency problems - leaving unconfigured");
++   // check if its not a follow up error
++   const char *needle = _dpkg("dependency problems - leaving unconfigured");
+    if(strstr(errormsg, needle) != NULL) {
+       std::clog << _("No apport report written because the error message indicates its a followup error from a previous failure.") << std::endl;
+       return;
diff --git a/meta/recipes-devtools/apt/apt/noconfigure.patch b/meta/recipes-devtools/apt/apt/noconfigure.patch
new file mode 100644
index 0000000..21e3107
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/noconfigure.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Inappropriate [configuration]
+
+Updated to apply over apt-0.9.2
+
+signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/apt-pkg/packagemanager.cc apt-0.9.2/apt-pkg/packagemanager.cc
+--- apt-0.9.2/apt-pkg/packagemanager.cc	2012-04-20 12:20:12.000000000 +0300
++++ apt-0.9.2/apt-pkg/packagemanager.cc	2012-05-05 01:31:03.000000000 +0300
+@@ -884,12 +884,14 @@
+    else if (Pkg.State() != pkgCache::PkgIterator::NeedsConfigure && Install(Pkg,FileNames[Pkg->ID]) == false)
+       return false;
+ 
++#if 0
+    if (Immediate == true) {
+       // Perform immedate configuration of the package. 
+          if (SmartConfigure(Pkg, Depth + 1) == false)
+             _error->Warning(_("Could not perform immediate configuration on '%s'. "
+                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
+    }
++#endif
+    
+    return true;
+ }
+@@ -978,6 +980,7 @@
+       }
+    }
+ 
++#if 0
+    // Final run through the configure phase
+    if (ConfigureAll() == false)
+       return Failed;
+@@ -992,6 +995,7 @@
+ 	 return Failed;
+       }
+    }
++#endif
+ 	 
+    return Completed;
+ }
diff --git a/meta/recipes-devtools/apt/apt/nodoc.patch b/meta/recipes-devtools/apt/apt/nodoc.patch
new file mode 100644
index 0000000..2915a1e
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/nodoc.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [configuration]
+
+Updated to apply over apt-0.9.2
+
+signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/Makefile apt-0.9.2/Makefile
+--- apt-0.9.2/Makefile	2012-04-16 20:23:05.000000000 +0300
++++ apt-0.9.2/Makefile	2012-05-05 01:24:22.000000000 +0300
+@@ -17,7 +17,7 @@
+ 	$(MAKE) -C cmdline $@
+ 	$(MAKE) -C ftparchive $@
+ 	$(MAKE) -C dselect $@
+-	$(MAKE) -C doc $@
++#	$(MAKE) -C doc $@
+ 	$(MAKE) -C po $@
+ 	$(MAKE) -C test $@
+ 
diff --git a/meta/recipes-devtools/apt/apt/override-i18n-inc.patch b/meta/recipes-devtools/apt/apt/override-i18n-inc.patch
new file mode 100644
index 0000000..7816d05
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/override-i18n-inc.patch
@@ -0,0 +1,25 @@
+Avoid definitions from apti18n.h from breaking standard headers.
+
+Upstream-Status: Submitted [Accepted, will be in apt-0.9.3]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/ftparchive/override.cc apt-0.9.2/ftparchive/override.cc
+--- apt-0.9.2/ftparchive/override.cc	2012-04-16 20:23:05.000000000 +0300
++++ apt-0.9.2/ftparchive/override.cc	2012-05-05 14:51:44.000000000 +0300
+@@ -12,13 +12,14 @@
+ // Include Files							/*{{{*/
+ #include <config.h>
+ 
+-#include <apti18n.h>
+ #include <apt-pkg/strutl.h>
+ #include <apt-pkg/error.h>
+ 
+ #include <stdio.h>
+ 
+ #include "override.h"
++
++#include <apti18n.h>
+ 									/*}}}*/
+ 
+ // Override::ReadOverride - Read the override file			/*{{{*/
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch b/meta/recipes-devtools/apt/apt/use-host.patch
similarity index 50%
rename from meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
rename to meta/recipes-devtools/apt/apt/use-host.patch
index 485ad7b..8a2aa56 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
+++ b/meta/recipes-devtools/apt/apt/use-host.patch
@@ -1,14 +1,12 @@
 Upstream-Status: Inappropriate [configuration]
 
----
- buildlib/sizetable |    4 +++-
- configure.in       |    2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
+Updated to apply over apt-0.9.2
 
-Index: apt-0.7.14/buildlib/sizetable
-===================================================================
---- apt-0.7.14.orig/buildlib/sizetable
-+++ apt-0.7.14/buildlib/sizetable
+signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/buildlib/sizetable apt-0.9.2/buildlib/sizetable
+--- apt-0.9.2/buildlib/sizetable	2011-06-17 13:10:20.000000000 +0300
++++ apt-0.9.2/buildlib/sizetable	2012-05-05 01:17:53.000000000 +0300
 @@ -11,6 +11,9 @@
  # The format is:-
  # CPU endian sizeof: char, int, short, long
@@ -16,22 +14,18 @@ Index: apt-0.7.14/buildlib/sizetable
 +i486    little  1 4 2 4
 +i586    little  1 4 2 4
 +i686    little  1 4 2 4
+ amd64   little  1 4 2 8
  armeb   big     1 4 2 4
  arm     little  1 4 2 4
- alpha   little  1 4 2 8
-@@ -21,4 +24,5 @@ m68k    big     1 4 2 4
- powerpc big     1 4 2 4
+@@ -23,3 +26,4 @@
  mips    big     1 4 2 4
  hppa    big     1 4 2 4
--m32r	big	1 4 2 4
-\ No newline at end of file
-+m32r	big	1 4 2 4
-+x86_64	little	1 4 2 8
-Index: apt-0.7.14/configure.in
-===================================================================
---- apt-0.7.14.orig/configure.in
-+++ apt-0.7.14/configure.in
-@@ -88,7 +88,7 @@ dnl This is often the dpkg architecture 
+ m32r	big	1 4 2 4
++x86_64  little  1 4 2 8
+diff -Nurd apt-0.9.2/configure.in apt-0.9.2/configure.in
+--- apt-0.9.2/configure.in	2012-04-20 15:20:31.000000000 +0300
++++ apt-0.9.2/configure.in	2012-05-05 01:15:29.000000000 +0300
+@@ -109,7 +109,7 @@
  dnl First check against the full canonical canoncial-system-type in $target
  dnl and if that fails, just look for the cpu
  AC_MSG_CHECKING(debian architecture)
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
deleted file mode 100644
index 6354f8e..0000000
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DEPENDS = "curl db"
-RDEPENDS_${PN} = "dpkg"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-require apt.inc
-
-PR = "r11"
-
-SRC_URI += "file://nodoc.patch \
-            file://includes-fix.patch \
-            file://remove-redeclaration.patch \
-           "
-
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
-
-require apt-package.inc
-
-FILES_${PN} += "${bindir}/apt-key"
-apt-manpages += "doc/apt-key.8"
-
diff --git a/meta/recipes-devtools/apt/apt_0.9.2.bb b/meta/recipes-devtools/apt/apt_0.9.2.bb
new file mode 100644
index 0000000..deeafff
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt_0.9.2.bb
@@ -0,0 +1,18 @@
+DEPENDS = "curl db"
+RDEPENDS_${PN} = "dpkg"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+require apt.inc
+
+PR = "r0"
+
+# SRC_URI += "file://nodoc.patch"
+SRC_URI += "file://disable-doxygen.patch"
+
+SRC_URI[md5sum] = "8a7bbab661fdde926d96a3833c1c6399"
+SRC_URI[sha256sum] = "8ef1e68165dc7c670838e84d4d230aaf5d93b42eeb1865114e7ef7fb703dfb6c"
+
+require apt-package.inc
+
+FILES_${PN} += "${bindir}/apt-key"
+apt-manpages += "doc/apt-key.8"
+
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
index eb2f100..e4a7017 100644
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ b/meta/recipes-devtools/apt/files/no-curl.patch
@@ -1,15 +1,13 @@
 Upstream-Status: Inappropriate [configuration]
 
----
- configure.in     |    6 ------
- methods/makefile |    7 -------
- 2 files changed, 13 deletions(-)
+Updated to apply over apt-0.9.2
 
---- apt-0.7.14.orig/configure.in
-+++ apt-0.7.14/configure.in
-@@ -84,16 +84,10 @@ AC_CHECK_HEADER(db.h,
-     )]
- )
+signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd apt-0.9.2/configure.in apt-0.9.2/configure.in
+--- apt-0.9.2/configure.in	2012-04-20 15:20:31.000000000 +0300
++++ apt-0.9.2/configure.in	2012-05-05 01:35:31.000000000 +0300
+@@ -79,13 +79,6 @@
  
  LIBS="$saveLIBS"
  
@@ -19,28 +17,24 @@ Upstream-Status: Inappropriate [configuration]
 -        curl_ok=no)],
 -     AC_MSG_ERROR([failed: I need CURL due https support]),
 -)
- 
+-
  AC_SUBST(BDBLIB)
  
- dnl Converts the ARCH to be something singular for this general CPU family
- dnl This is often the dpkg architecture string.
---- apt-0.7.14.orig/methods/makefile
-+++ apt-0.7.14/methods/makefile
-@@ -50,17 +50,10 @@ PROGRAM=http
- SLIBS = -lapt-pkg $(SOCKETLIBS)
- LIB_MAKES = apt-pkg/makefile
- SOURCE = http.cc rfc2553emu.cc connect.cc
+ HAVE_ZLIB=no
+diff -Nurd apt-0.9.2/methods/makefile apt-0.9.2/methods/makefile
+--- apt-0.9.2/methods/makefile	2012-04-16 20:23:05.000000000 +0300
++++ apt-0.9.2/methods/makefile	2012-05-05 01:35:53.000000000 +0300
+@@ -51,13 +51,6 @@
+ SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc
  include $(PROGRAM_H)
  
 -# The https method
 -PROGRAM=https
--SLIBS = -lapt-pkg -lcurl
+-SLIBS = -lapt-pkg -lcurl $(INTLLIBS)
 -LIB_MAKES = apt-pkg/makefile
 -SOURCE = https.cc
 -include $(PROGRAM_H)
 -
  # The ftp method
  PROGRAM=ftp
- SLIBS = -lapt-pkg $(SOCKETLIBS)
- LIB_MAKES = apt-pkg/makefile
- SOURCE = ftp.cc rfc2553emu.cc connect.cc
+ SLIBS = -lapt-pkg $(SOCKETLIBS) $(INTLLIBS)
-- 
1.7.10



