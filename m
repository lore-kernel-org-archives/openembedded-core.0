Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.715.1589315873803947400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=gj5Qenfv;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M8kk441Yz5R
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 22:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589315870;
	bh=SBHd25G84GKjGQPqtN0SNOpx8FtsPURJqWknrVUdUic=;
	h=From:To:Subject:Date:From;
	b=gj5QenfvJpkTIUQIP2+i8P/KnFBadceuJybRVNx5ME9FmEt9B8sU7S/MKi+qGRkA+
	 XQ7VpxNUvNSYmNEFpaQinBQCx21zLFLRmuMZP15VT3DePtQ3ezFRaw2lX8PyVa4LNi
	 E23PkqwjmmRkEjFxdkhzttGvhIuITxQYDoY9DSmx3wQu8m0gbOYeFh7IqKU14r+lyw
	 JgxXzplSPDvlKB8X7+PBWC8yJNRoI1gs1/aVZcrq4f8sTK3Rfsti0I97t6x3NOPhJ3
	 WMmlCuPSu7CPWlqBFR/9ChzuoCCPhMfzB0SS1qBIWlwgE2OJX108+4OQSh7ZvG5Wq0
	 9e66lYr6TuLp3MPSXapLvDS26SX2jaMq6azbRbu9fWkmrTg82sLZAJ08Omc3HpMIew
	 6etb/3/Bjs7TuiWlWjiGDdtXIoh42eVbGcICESvLTAa+B7V4QVDx56iCwDCfZrOxIH
	 eW4v6vYH9WmgU3AB7WVDABpBXEC87/fzlyj9LFLMpeqTXhr7ZsQt3NW13F9X7Z8A1D
	 S7Wu5tNXmsVY0qfeFlUZTDj3vLP1oQGT0Q+FlhFWyiDujfk1inTLKAODtYBC4IIPrc
	 DUUX1VzqVAT79Ui089isPqqMF68XIpRQUr5fxEhlTyb5xSa9YwrKoh0amy82hTfB9e
	 VwY+cSXaOf0Jeis3Rxpd/xFc=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] apt: Remove workarounds for host gcc < 5
Date: Tue, 12 May 2020 23:37:45 +0300
Message-Id: <20200512203748.8779-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-devtools/apt/apt-native_1.2.31.bb |  4 +-
 ...nging-the-global-LC_TIME-for-Release.patch | 80 -------------------
 ...caled-std-put_time-instead-rolling-o.patch | 46 -----------
 ...ntrib-strutl.cc-Include-array-header.patch | 33 --------
 4 files changed, 1 insertion(+), 162 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.31.bb b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
index 5b16b503d5..2952c21017 100644
--- a/meta/recipes-devtools/apt/apt-native_1.2.31.bb
+++ b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
@@ -2,6 +2,4 @@ require apt-native.inc
 
 SRC_URI += "file://noconfigure.patch \
             file://no-curl.patch \
-            file://gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch \
-            file://gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch \
-            file://gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch"
+"
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
deleted file mode 100644
index 438de209a2..0000000000
--- a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 7ef2b2dba0e0bee450da3c8450ea782a3e7d6429 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Tue, 22 Aug 2017 11:49:01 -0500
-Subject: [PATCH 3/3] Revert "avoid changing the global LC_TIME for Release
- writing"
-
-This reverts commit 78e7b683c645e907db12658405a4b201a6243ea8.
-
-After we drop debian8 and centos7 that has gcc < 5 (std::put_time not available) 
-versions this patch can be remove.
-
-Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- ftparchive/writer.cc | 29 +++++++++++++++++------------
- 1 file changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/ftparchive/writer.cc b/ftparchive/writer.cc
-index 2596382..e43a643 100644
---- a/ftparchive/writer.cc
-+++ b/ftparchive/writer.cc
-@@ -37,7 +37,6 @@
- #include <unistd.h>
- #include <ctime>
- #include <iostream>
--#include <iomanip>
- #include <sstream>
- #include <memory>
- #include <utility>
-@@ -984,29 +983,35 @@ ReleaseWriter::ReleaseWriter(FileFd * const GivenOutput, string const &/*DB*/) :
-    AddPatterns(_config->FindVector("APT::FTPArchive::Release::Patterns"));
- 
-    time_t const now = time(NULL);
--   auto const posix = std::locale("C.UTF-8");
- 
--   // FIXME: use TimeRFC1123 here? But that uses GMT to satisfy HTTP/1.1
--   std::ostringstream datestr;
--   datestr.imbue(posix);
--   datestr << std::put_time(gmtime(&now), "%a, %d %b %Y %H:%M:%S UTC");
-+   setlocale(LC_TIME, "C");
-+
-+   char datestr[128];
-+   if (strftime(datestr, sizeof(datestr), "%a, %d %b %Y %H:%M:%S UTC",
-+                gmtime(&now)) == 0)
-+   {
-+      datestr[0] = '\0';
-+   }
- 
-    time_t const validuntil = now + _config->FindI("APT::FTPArchive::Release::ValidTime", 0);
--   std::ostringstream validstr;
--   if (validuntil != now)
-+   char validstr[128];
-+   if (now == validuntil ||
-+       strftime(validstr, sizeof(validstr), "%a, %d %b %Y %H:%M:%S UTC",
-+                gmtime(&validuntil)) == 0)
-    {
--      datestr.imbue(posix);
--      validstr << std::put_time(gmtime(&validuntil), "%a, %d %b %Y %H:%M:%S UTC");
-+      validstr[0] = '\0';
-    }
- 
-+   setlocale(LC_TIME, "");
-+
-    map<string,string> Fields;
-    Fields["Origin"] = "";
-    Fields["Label"] = "";
-    Fields["Suite"] = "";
-    Fields["Version"] = "";
-    Fields["Codename"] = "";
--   Fields["Date"] = datestr.str();
--   Fields["Valid-Until"] = validstr.str();
-+   Fields["Date"] = datestr;
-+   Fields["Valid-Until"] = validstr;
-    Fields["Architectures"] = "";
-    Fields["Components"] = "";
-    Fields["Description"] = "";
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
deleted file mode 100644
index 088a66a3c8..0000000000
--- a/meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c72ef9b6ae83a0a2fbbefd5c050335f65f0d2bc9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Tue, 22 Aug 2017 11:48:46 -0500
-Subject: [PATCH 2/3] Revert "use de-localed std::put_time instead rolling our
- own"
-
-This reverts commit 4ed2a17ab4334f019c00512aa54a162f0bf083c4.
-
-After we drop debian8 and centos7 that has gcc < 5 (std::put_time not available) 
-versions this patch can be remove.
-
-Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- apt-pkg/contrib/strutl.cc | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
-index c2ff01d..e9ef2be 100644
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -760,11 +760,15 @@ string TimeRFC1123(time_t Date)
-    if (gmtime_r(&Date, &Conv) == NULL)
-       return "";
- 
--   auto const posix = std::locale::classic();
--   std::ostringstream datestr;
--   datestr.imbue(posix);
--   datestr << std::put_time(&Conv, "%a, %d %b %Y %H:%M:%S GMT");
--   return datestr.str();
-+   char Buf[300];
-+   const char *Day[] = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
-+   const char *Month[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul",
-+                          "Aug","Sep","Oct","Nov","Dec"};
-+
-+   snprintf(Buf, sizeof(Buf), "%s, %02i %s %i %02i:%02i:%02i GMT",Day[Conv.tm_wday],
-+	   Conv.tm_mday,Month[Conv.tm_mon],Conv.tm_year+1900,Conv.tm_hour,
-+	   Conv.tm_min,Conv.tm_sec);
-+   return Buf;
- }
- 									/*}}}*/
- // ReadMessages - Read messages from the FD				/*{{{*/
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch b/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
deleted file mode 100644
index cb32591876..0000000000
--- a/meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ff8562f7724c4db4b83635af9e627f3495222327 Mon Sep 17 00:00:00 2001
-From: Anibal Limon <limon.anibal@gmail.com>
-Date: Tue, 22 Aug 2017 04:41:31 -0500
-Subject: [PATCH 1/3] apt-pkg/contrib/strutl.cc: Include array header
-
-If GCC version is less than 5 the array header needs to be included
-to support std::array.
-
-After we drop debian8 and centos7 that has gcc < 5 versions this patch
-can be remove.
-
-Signed-off-by: Anibal Limon <limon.anibal@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- apt-pkg/contrib/strutl.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
-index 60d0ca8..c2ff01d 100644
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -27,6 +27,7 @@
- #include <sstream>
- #include <string>
- #include <vector>
-+#include <array>
- 
- #include <stddef.h>
- #include <stdlib.h>
--- 
-2.1.4
-
-- 
2.17.1

