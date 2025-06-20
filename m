Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5C3C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:02:45 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web10.2133.1750402957579518272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 00:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=fSL4bDo1;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=2599e2df9=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750402957; x=1781938957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jouf8RfFq7BpIlLjdK2lN8ehNILnP4F0Ca9XvwqgcLs=;
  b=fSL4bDo1xyuXUfUkbqF+1GDc2/ExFqb7pxRgcdIaecdjo+c4wVv9vLar
   qm1A24+eG+XEdNTbJATM03xucxPzp4PdF3phckJXgr2jeZJmPR0V6EGGw
   VJWZ96Mv/X2hEdN5OBFlUUl6uqb/wA52QNLk3SVjDj2vxM4xIyjwcUqef
   4=;
X-CSE-ConnectionGUID: QZ0In9EgQIeFWucXKThnBQ==
X-CSE-MsgGUID: /7Uptjk/T4iPpiVemN/gkg==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Jun 2025 09:02:35 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 20 Jun 2025 09:02:35 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 20 Jun 2025 09:02:35 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.200) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 20 Jun 2025 09:02:35 +0200
X-CSE-ConnectionGUID: ZxigsieHT5KKmoCIT+ViQA==
X-CSE-MsgGUID: 12+aPfrCSjKoxYjPmppvAQ==
X-CSE-ConnectionGUID: MIYQDD1SRAWgAnPxbTMbqw==
X-CSE-MsgGUID: 56GY6U27TgqM7YCqnFb4VQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, John Drouhard <john@drouhard.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] cmake: Correctly handle cost data of tests with arbitrary chars in name
Date: Fri, 20 Jun 2025 09:02:16 +0200
Message-ID: <20250620070216.3107546-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17b.europe.bmw.corp (2a03:1e80:a15:58f::1:4c) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 07:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219103

ctest automatically optimizes the order of (parallel) test execution based on
historic test case runtime via the COST property (see [0]), which can have a
significant impact on overall test run times. Sadly this feature is broken in
CMake < 4.0.0 for test cases that have spaces in their name (see [1]).

This commit is a backport of f24178f3 (which itself backports the upstream fix).
the patch was adapted slightly to apply cleanly to the older CMake version in
kirkstone. As repeated test runs are expected to mainly take place inside the
SDK, the patch is only applied to 'nativesdk' builds.

[0]: https://cmake.org/cmake/help/latest/prop_test/COST.html
[1]: https://gitlab.kitware.com/cmake/cmake/-/issues/26594

Reported-By: John Drouhard <john@drouhard.dev>
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/cmake-native_3.22.3.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 205 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |   1 +
 3 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
index 45ea78ae00..447554aa2e 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
@@ -49,7 +49,7 @@ do_compile() {
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 
-	# The following codes are here because eSDK needs to provide compatibilty
+	# The following codes are here because eSDK needs to provide compatibility
 	# for SDK. That is, eSDK could also be used like traditional SDK.
 	mkdir -p ${D}${datadir}/cmake
 	install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
diff --git a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
new file mode 100644
index 0000000000..10fc4f545e
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
@@ -0,0 +1,205 @@
+From 4f992e105bf4a85062bb439ca63daefc8a992f94 Mon Sep 17 00:00:00 2001
+From: John Drouhard <john@drouhard.dev>
+Date: Thu, 9 Jan 2025 20:34:42 -0600
+Subject: [PATCH] ctest: Allow arbitrary characters in test names of
+ CTestCostData.txt
+
+This changes the way lines in CTestCostData.txt are parsed to allow for
+spaces in the test name.
+
+It does so by looking for space characters from the end; and once two
+have been found, assumes everything from the beginning up to that
+second-to-last-space is the test name.
+
+Additionally, parsing the file should be much more efficient since there
+is no string or vector heap allocation per line. The std::string used by
+the parse function to convert the int and float should be within most
+standard libraries' small string optimization.
+
+Fixes: #26594
+
+Upstream-Status: Backport [4.0.0, 040da7d83216ace59710407e8ce35d5fd38e1340]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ Source/CTest/cmCTestMultiProcessHandler.cxx | 80 +++++++++++++++------
+ Source/CTest/cmCTestMultiProcessHandler.h   |  3 +-
+ Tests/CTestTestScheduler/CMakeLists.txt     |  4 +-
+ 3 files changed, 64 insertions(+), 23 deletions(-)
+
+diff --git a/Source/CTest/cmCTestMultiProcessHandler.cxx b/Source/CTest/cmCTestMultiProcessHandler.cxx
+index d90c4a64651e4d53cc219abe76cb10a342e8aa35..311d2368bcc99abfb4b61c77032b26a440bc5bde 100644
+--- a/Source/CTest/cmCTestMultiProcessHandler.cxx
++++ b/Source/CTest/cmCTestMultiProcessHandler.cxx
+@@ -19,6 +19,7 @@
+ #include <vector>
+ 
+ #include <cm/memory>
++#include <cm/string_view>
+ #include <cmext/algorithm>
+ 
+ #include <cm3p/json/value.h>
+@@ -41,6 +42,51 @@
+ #include "cmUVSignalHackRAII.h" // IWYU pragma: keep
+ #include "cmWorkingDirectory.h"
+ 
++namespace {
++
++struct CostEntry
++{
++  cm::string_view name;
++  int prevRuns;
++  float cost;
++};
++
++cm::optional<CostEntry> splitCostLine(cm::string_view line)
++{
++  std::string part;
++  cm::string_view::size_type pos1 = line.size();
++  cm::string_view::size_type pos2 = line.find_last_of(' ', pos1);
++  auto findNext = [line, &part, &pos1, &pos2]() -> bool {
++    if (pos2 != cm::string_view::npos) {
++      cm::string_view sub = line.substr(pos2 + 1, pos1 - pos2 - 1);
++      part.assign(sub.begin(), sub.end());
++      pos1 = pos2;
++      if (pos1 > 0) {
++        pos2 = line.find_last_of(' ', pos1 - 1);
++      }
++      return true;
++    }
++    return false;
++  };
++
++  // parse the cost
++  if (!findNext()) {
++    return cm::nullopt;
++  }
++  float cost = static_cast<float>(atof(part.c_str()));
++
++  // parse the previous runs
++  if (!findNext()) {
++    return cm::nullopt;
++  }
++  int prev = atoi(part.c_str());
++
++  // from start to the last found space is the name
++  return CostEntry{ line.substr(0, pos1), prev, cost };
++}
++
++}
++
+ namespace cmsys {
+ class RegularExpression;
+ }
+@@ -691,24 +737,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()
+       if (line == "---") {
+         break;
+       }
+-      std::vector<std::string> parts = cmSystemTools::SplitString(line, ' ');
+       // Format: <name> <previous_runs> <avg_cost>
+-      if (parts.size() < 3) {
++      cm::optional<CostEntry> entry = splitCostLine(line);
++      if (!entry) {
+         break;
+       }
+ 
+-      std::string name = parts[0];
+-      int prev = atoi(parts[1].c_str());
+-      float cost = static_cast<float>(atof(parts[2].c_str()));
+-
+-      int index = this->SearchByName(name);
++      int index = this->SearchByName(entry->name);
+       if (index == -1) {
+         // This test is not in memory. We just rewrite the entry
+-        fout << name << " " << prev << " " << cost << "\n";
++        fout << entry->name << " " << entry->prevRuns << " " << entry->cost
++             << "\n";
+       } else {
+         // Update with our new average cost
+-        fout << name << " " << this->Properties[index]->PreviousRuns << " "
+-             << this->Properties[index]->Cost << "\n";
++        fout << entry->name << " " << this->Properties[index]->PreviousRuns
++             << " " << this->Properties[index]->Cost << "\n";
+         temp.erase(index);
+       }
+     }
+@@ -744,28 +787,25 @@ void cmCTestMultiProcessHandler::ReadCostData()
+         break;
+       }
+ 
+-      std::vector<std::string> parts = cmSystemTools::SplitString(line, ' ');
++      // Format: <name> <previous_runs> <avg_cost>
++      cm::optional<CostEntry> entry = splitCostLine(line);
+ 
+       // Probably an older version of the file, will be fixed next run
+-      if (parts.size() < 3) {
++      if (!entry) {
+         fin.close();
+         return;
+       }
+ 
+-      std::string name = parts[0];
+-      int prev = atoi(parts[1].c_str());
+-      float cost = static_cast<float>(atof(parts[2].c_str()));
+-
+-      int index = this->SearchByName(name);
++      int index = this->SearchByName(entry->name);
+       if (index == -1) {
+         continue;
+       }
+ 
+-      this->Properties[index]->PreviousRuns = prev;
++      this->Properties[index]->PreviousRuns = entry->prevRuns;
+       // When not running in parallel mode, don't use cost data
+       if (this->ParallelLevel > 1 && this->Properties[index] &&
+           this->Properties[index]->Cost == 0) {
+-        this->Properties[index]->Cost = cost;
++        this->Properties[index]->Cost = entry->cost;
+       }
+     }
+     // Next part of the file is the failed tests
+@@ -778,7 +818,7 @@ void cmCTestMultiProcessHandler::ReadCostData()
+   }
+ }
+ 
+-int cmCTestMultiProcessHandler::SearchByName(std::string const& name)
++int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)
+ {
+   int index = -1;
+ 
+diff --git a/Source/CTest/cmCTestMultiProcessHandler.h b/Source/CTest/cmCTestMultiProcessHandler.h
+index 5de42f9e3209f4b7f0e856afc458e8b4a35d87b7..11e995d9e06ba9fdb0e086dc3e5e4175f8158cd0 100644
+--- a/Source/CTest/cmCTestMultiProcessHandler.h
++++ b/Source/CTest/cmCTestMultiProcessHandler.h
+@@ -10,6 +10,7 @@
+ #include <string>
+ #include <vector>
+ 
++#include <cm/string_view>
+ #include <cm3p/uv.h>
+ #include <stddef.h>
+ 
+@@ -111,7 +112,7 @@ protected:
+   void UpdateCostData();
+   void ReadCostData();
+   // Return index of a test based on its name
+-  int SearchByName(std::string const& name);
++  int SearchByName(cm::string_view name);
+ 
+   void CreateTestCostList();
+ 
+diff --git a/Tests/CTestTestScheduler/CMakeLists.txt b/Tests/CTestTestScheduler/CMakeLists.txt
+index a3f0f27cdcb901bb309bb6cb6cd9307ce1ba20a2..daf6ce2b23d8c048334ae1047759130b246dccef 100644
+--- a/Tests/CTestTestScheduler/CMakeLists.txt
++++ b/Tests/CTestTestScheduler/CMakeLists.txt
+@@ -1,9 +1,9 @@
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.19)
+ project (CTestTestScheduler)
+ include (CTest)
+ 
+ add_executable (Sleep sleep.c)
+ 
+ foreach (time RANGE 1 4)
+-  add_test (TestSleep${time} Sleep ${time})
++  add_test ("TestSleep ${time}" Sleep ${time})
+ endforeach ()
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
index 752c37ba7d..04a0f0e793 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
@@ -10,6 +10,7 @@ SRC_URI:append:class-nativesdk = " \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+    file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
 "
 
 LICENSE:append = " & BSD-1-Clause & MIT"

