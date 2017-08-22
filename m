Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA5078294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:19:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2017 10:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,413,1498546800"; d="scan'208";a="127046066"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2017 10:19:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 12:20:39 -0500
Message-Id: <20170822172039.16682-2-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170822172039.16682-1-anibal.limon@linux.intel.com>
References: <20170822172039.16682-1-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: jagadeesh.krishnanjanappa@caviumnetworks.com
Subject: [PATCHv2 2/2] apt: Upgrade to 1.2.24
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
X-List-Received-Date: Tue, 22 Aug 2017 17:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new patches for enable builds on hosts that has GCC version
minor than 5 because doesn't support std::array and std::put_time,
those patches could be removed after get rid of Debian8 and Centos7
support.

  - gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
  - gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
  - gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch

The LIC_FILES_CHKSUM changed because the license file now has
style changes in the text remains GPLv2+.

The patch Revert-always-run-dpkg-configure-a-at-the-end-of-our
was updated because now the precision fields use floating
point numbers.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/apt/apt-native_1.2.12.bb     |  4 --
 meta/recipes-devtools/apt/apt-native_1.2.24.bb     |  7 ++
 meta/recipes-devtools/apt/apt.inc                  |  8 +--
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 24 +++----
 ...d-changing-the-global-LC_TIME-for-Release.patch | 80 ++++++++++++++++++++++
 ...de-localed-std-put_time-instead-rolling-o.patch | 46 +++++++++++++
 ...kg-contrib-strutl.cc-Include-array-header.patch | 33 +++++++++
 .../apt/{apt_1.2.12.bb => apt_1.2.24.bb}           |  0
 8 files changed, 182 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.2.12.bb
 create mode 100644 meta/recipes-devtools/apt/apt-native_1.2.24.bb
 create mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
 create mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
 create mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
 rename meta/recipes-devtools/apt/{apt_1.2.12.bb => apt_1.2.24.bb} (100%)

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
deleted file mode 100644
index 1e660da74b9..00000000000
--- a/meta/recipes-devtools/apt/apt-native_1.2.12.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require apt-native.inc
-
-SRC_URI += "file://noconfigure.patch \
-            file://no-curl.patch"
diff --git a/meta/recipes-devtools/apt/apt-native_1.2.24.bb b/meta/recipes-devtools/apt/apt-native_1.2.24.bb
new file mode 100644
index 00000000000..5b16b503d5d
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-native_1.2.24.bb
@@ -0,0 +1,7 @@
+require apt-native.inc
+
+SRC_URI += "file://noconfigure.patch \
+            file://no-curl.patch \
+            file://gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch \
+            file://gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch \
+            file://gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 30263708444..f1cde3068da 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
@@ -14,9 +14,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
            "
-SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
-SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
+SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index b3a883bae88..734ba00d4f2 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -22,10 +22,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  3 files changed, 11 insertions(+), 18 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 834cb0e..84ded3a 100644
+index 533d9b367..6ce81bbd9 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1037,12 +1037,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1041,12 +1041,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 PackagesTotal++;
        }
     }
@@ -38,7 +38,7 @@ index 834cb0e..84ded3a 100644
  }
                                                                          /*}}}*/
  bool pkgDPkgPM::Go(int StatusFd)
-@@ -1250,8 +1244,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1268,8 +1262,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
     // support subpressing of triggers processing for special
     // cases like d-i that runs the triggers handling manually
@@ -50,7 +50,7 @@ index 834cb0e..84ded3a 100644
  
     // for the progress
 diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
-index 58fd732..3359762 100755
+index a8d59608d..0c6a9bbbf 100755
 --- a/test/integration/test-apt-progress-fd-deb822
 +++ b/test/integration/test-apt-progress-fd-deb822
 @@ -27,36 +27,36 @@ Message: Installing testing (amd64)
@@ -69,19 +69,19 @@ index 58fd732..3359762 100755
  
  Status: progress
  Package: testing:amd64
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Preparing to configure testing (amd64)
  
  Status: progress
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Running dpkg
  
  Status: progress
  Package: testing:amd64
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Configuring testing (amd64)
  
  Status: progress
@@ -98,7 +98,7 @@ index 58fd732..3359762 100755
  
  Status: progress
 diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-index d86e638..ef6d23b 100755
+index d86e638cd..ef6d23be2 100755
 --- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
 +++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
 @@ -59,8 +59,7 @@ startup packages configure
@@ -122,5 +122,5 @@ index d86e638..ef6d23b 100755
  checkpurge
  
 -- 
-2.1.4
+2.11.0
 
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
new file mode 100644
index 00000000000..438de209a2f
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
@@ -0,0 +1,80 @@
+From 7ef2b2dba0e0bee450da3c8450ea782a3e7d6429 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Tue, 22 Aug 2017 11:49:01 -0500
+Subject: [PATCH 3/3] Revert "avoid changing the global LC_TIME for Release
+ writing"
+
+This reverts commit 78e7b683c645e907db12658405a4b201a6243ea8.
+
+After we drop debian8 and centos7 that has gcc < 5 (std::put_time not available) 
+versions this patch can be remove.
+
+Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ ftparchive/writer.cc | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/ftparchive/writer.cc b/ftparchive/writer.cc
+index 2596382..e43a643 100644
+--- a/ftparchive/writer.cc
++++ b/ftparchive/writer.cc
+@@ -37,7 +37,6 @@
+ #include <unistd.h>
+ #include <ctime>
+ #include <iostream>
+-#include <iomanip>
+ #include <sstream>
+ #include <memory>
+ #include <utility>
+@@ -984,29 +983,35 @@ ReleaseWriter::ReleaseWriter(FileFd * const GivenOutput, string const &/*DB*/) :
+    AddPatterns(_config->FindVector("APT::FTPArchive::Release::Patterns"));
+ 
+    time_t const now = time(NULL);
+-   auto const posix = std::locale("C.UTF-8");
+ 
+-   // FIXME: use TimeRFC1123 here? But that uses GMT to satisfy HTTP/1.1
+-   std::ostringstream datestr;
+-   datestr.imbue(posix);
+-   datestr << std::put_time(gmtime(&now), "%a, %d %b %Y %H:%M:%S UTC");
++   setlocale(LC_TIME, "C");
++
++   char datestr[128];
++   if (strftime(datestr, sizeof(datestr), "%a, %d %b %Y %H:%M:%S UTC",
++                gmtime(&now)) == 0)
++   {
++      datestr[0] = '\0';
++   }
+ 
+    time_t const validuntil = now + _config->FindI("APT::FTPArchive::Release::ValidTime", 0);
+-   std::ostringstream validstr;
+-   if (validuntil != now)
++   char validstr[128];
++   if (now == validuntil ||
++       strftime(validstr, sizeof(validstr), "%a, %d %b %Y %H:%M:%S UTC",
++                gmtime(&validuntil)) == 0)
+    {
+-      datestr.imbue(posix);
+-      validstr << std::put_time(gmtime(&validuntil), "%a, %d %b %Y %H:%M:%S UTC");
++      validstr[0] = '\0';
+    }
+ 
++   setlocale(LC_TIME, "");
++
+    map<string,string> Fields;
+    Fields["Origin"] = "";
+    Fields["Label"] = "";
+    Fields["Suite"] = "";
+    Fields["Version"] = "";
+    Fields["Codename"] = "";
+-   Fields["Date"] = datestr.str();
+-   Fields["Valid-Until"] = validstr.str();
++   Fields["Date"] = datestr;
++   Fields["Valid-Until"] = validstr;
+    Fields["Architectures"] = "";
+    Fields["Components"] = "";
+    Fields["Description"] = "";
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
new file mode 100644
index 00000000000..088a66a3c83
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
@@ -0,0 +1,46 @@
+From c72ef9b6ae83a0a2fbbefd5c050335f65f0d2bc9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Tue, 22 Aug 2017 11:48:46 -0500
+Subject: [PATCH 2/3] Revert "use de-localed std::put_time instead rolling our
+ own"
+
+This reverts commit 4ed2a17ab4334f019c00512aa54a162f0bf083c4.
+
+After we drop debian8 and centos7 that has gcc < 5 (std::put_time not available) 
+versions this patch can be remove.
+
+Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ apt-pkg/contrib/strutl.cc | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index c2ff01d..e9ef2be 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -760,11 +760,15 @@ string TimeRFC1123(time_t Date)
+    if (gmtime_r(&Date, &Conv) == NULL)
+       return "";
+ 
+-   auto const posix = std::locale::classic();
+-   std::ostringstream datestr;
+-   datestr.imbue(posix);
+-   datestr << std::put_time(&Conv, "%a, %d %b %Y %H:%M:%S GMT");
+-   return datestr.str();
++   char Buf[300];
++   const char *Day[] = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
++   const char *Month[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul",
++                          "Aug","Sep","Oct","Nov","Dec"};
++
++   snprintf(Buf, sizeof(Buf), "%s, %02i %s %i %02i:%02i:%02i GMT",Day[Conv.tm_wday],
++	   Conv.tm_mday,Month[Conv.tm_mon],Conv.tm_year+1900,Conv.tm_hour,
++	   Conv.tm_min,Conv.tm_sec);
++   return Buf;
+ }
+ 									/*}}}*/
+ // ReadMessages - Read messages from the FD				/*{{{*/
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
new file mode 100644
index 00000000000..cb325918764
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
@@ -0,0 +1,33 @@
+From ff8562f7724c4db4b83635af9e627f3495222327 Mon Sep 17 00:00:00 2001
+From: Anibal Limon <limon.anibal@gmail.com>
+Date: Tue, 22 Aug 2017 04:41:31 -0500
+Subject: [PATCH 1/3] apt-pkg/contrib/strutl.cc: Include array header
+
+If GCC version is less than 5 the array header needs to be included
+to support std::array.
+
+After we drop debian8 and centos7 that has gcc < 5 versions this patch
+can be remove.
+
+Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ apt-pkg/contrib/strutl.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 60d0ca8..c2ff01d 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -27,6 +27,7 @@
+ #include <sstream>
+ #include <string>
+ #include <vector>
++#include <array>
+ 
+ #include <stddef.h>
+ #include <stdlib.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.24.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt_1.2.12.bb
rename to meta/recipes-devtools/apt/apt_1.2.24.bb
-- 
2.11.0


