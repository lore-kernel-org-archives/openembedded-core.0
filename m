Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC5DC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:26:10 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.14645.1750152364160163485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Mdo5PiKd;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=256d9e307=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750152364; x=1781688364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RNOOvDkpI4hOGsiy//qq7oONH0Tvt/4d/ijufgA0wcA=;
  b=Mdo5PiKd8lns7zDC+9FYrwGra3nQNOtyRhNPTQYUNb4lPBra3CKM9HVJ
   ouksWcP2+lUUbkYGPOBMpNpfD7CnbLRGnt8nQaP2ymW/NHaExVknSE6ch
   Raowi3EjR34vVjHGx4DG5i2CbwZNO+ha0FkiSlVGFKfLocjuvNFm1K0aN
   4=;
X-CSE-ConnectionGUID: AuMY453wRjuMBMzQ6Kd9DQ==
X-CSE-MsgGUID: InrvA/QbQPaJfO8Xh99mjQ==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 17 Jun 2025 11:25:47 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 17 Jun 2025 11:25:46 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 17 Jun 2025 11:25:46 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.213) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Tue, 17 Jun 2025 11:25:45 +0200
X-CSE-ConnectionGUID: tU7bL3KKQeCQxSdkfbyRUw==
X-CSE-MsgGUID: hYIN7xIJT5aQ5P0KIssYug==
X-CSE-ConnectionGUID: rwskzEHRSr6E8PfunFD+aw==
X-CSE-MsgGUID: NY856Uv2RoqBpwRYC1L8/w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, John Drouhard <john@drouhard.dev>
Subject: [PATCH] cmake: Correctly handle cost data of tests with arbitrary chars in name
Date: Tue, 17 Jun 2025 11:24:56 +0200
Message-ID: <20250617092456.1601525-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP08A.europe.bmw.corp (2a03:1e80:a15:58f::212c) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218867

ctest automatically optimizes the order of (parallel) test execution based on
historic test case runtime via the COST property (see [0]), which can have a
significant impact on overall test run times. Sadly this feature is broken in
CMake < 4.0.0 for test cases that have spaces in their name (see [1]).

This commit backports the upstream fix. As repeated test runs are expected to
mainly take place inside the SDK, the patch is only applied to 'nativesdk'
builds.

[0]: https://cmake.org/cmake/help/latest/prop_test/COST.html
[1]: https://gitlab.kitware.com/cmake/cmake/-/issues/26594

Reported-By: John Drouhard <john@drouhard.dev>
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/cmake-native_3.31.6.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 202 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.31.6.bb   |   1 +
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
index e285a17681..b940abb3fd 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
@@ -51,7 +51,7 @@ do_compile() {
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 
-	# The following codes are here because eSDK needs to provide compatibilty
+	# The following codes are here because eSDK needs to provide compatibility
 	# for SDK. That is, eSDK could also be used like traditional SDK.
 	mkdir -p ${D}${datadir}/cmake
 	install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
diff --git a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
new file mode 100644
index 0000000000..31f6148cac
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
@@ -0,0 +1,202 @@
+From c7e8b03324883760a2d6fab86ae034beb82af651 Mon Sep 17 00:00:00 2001
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
+ Source/CTest/cmCTestMultiProcessHandler.cxx | 77 +++++++++++++++------
+ Source/CTest/cmCTestMultiProcessHandler.h   |  3 +-
+ Tests/CTestTestScheduler/CMakeLists.txt     |  4 +-
+ 3 files changed, 61 insertions(+), 23 deletions(-)
+
+diff --git a/Source/CTest/cmCTestMultiProcessHandler.cxx b/Source/CTest/cmCTestMultiProcessHandler.cxx
+index 84ea32b84d40025ec333a90d30c42eeaf7adc9ef..231e7b5f39b1d8aa75f4e59a890a099b53fcdaac 100644
+--- a/Source/CTest/cmCTestMultiProcessHandler.cxx
++++ b/Source/CTest/cmCTestMultiProcessHandler.cxx
+@@ -20,6 +20,7 @@
+ 
+ #include <cm/memory>
+ #include <cm/optional>
++#include <cm/string_view>
+ #include <cmext/algorithm>
+ 
+ #include <cm3p/json/value.h>
+@@ -52,6 +53,48 @@ constexpr unsigned long kParallelLevelMinimum = 2u;
+ // Under a job server, parallelism is effectively limited
+ // only by available job server tokens.
+ constexpr unsigned long kParallelLevelUnbounded = 0x10000u;
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
+ }
+ 
+ namespace cmsys {
+@@ -797,24 +840,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()
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
+@@ -850,28 +890,25 @@ void cmCTestMultiProcessHandler::ReadCostData()
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
+       if (this->GetParallelLevel() > 1 && this->Properties[index] &&
+           this->Properties[index]->Cost == 0) {
+-        this->Properties[index]->Cost = cost;
++        this->Properties[index]->Cost = entry->cost;
+       }
+     }
+     // Next part of the file is the failed tests
+@@ -884,7 +921,7 @@ void cmCTestMultiProcessHandler::ReadCostData()
+   }
+ }
+ 
+-int cmCTestMultiProcessHandler::SearchByName(std::string const& name)
++int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)
+ {
+   int index = -1;
+ 
+diff --git a/Source/CTest/cmCTestMultiProcessHandler.h b/Source/CTest/cmCTestMultiProcessHandler.h
+index fd6c17f2fac06949c20f3792dd3eae442b15850b..811be613c3387240c0181f8372b24cf09219621f 100644
+--- a/Source/CTest/cmCTestMultiProcessHandler.h
++++ b/Source/CTest/cmCTestMultiProcessHandler.h
+@@ -13,6 +13,7 @@
+ #include <vector>
+ 
+ #include <cm/optional>
++#include <cm/string_view>
+ 
+ #include "cmCTest.h"
+ #include "cmCTestResourceAllocator.h"
+@@ -110,7 +111,7 @@ protected:
+   void UpdateCostData();
+   void ReadCostData();
+   // Return index of a test based on its name
+-  int SearchByName(std::string const& name);
++  int SearchByName(cm::string_view name);
+ 
+   void CreateTestCostList();
+ 
+diff --git a/Tests/CTestTestScheduler/CMakeLists.txt b/Tests/CTestTestScheduler/CMakeLists.txt
+index 6f8cb4dbc0de35984540e1868788e0a02124e819..daf6ce2b23d8c048334ae1047759130b246dccef 100644
+--- a/Tests/CTestTestScheduler/CMakeLists.txt
++++ b/Tests/CTestTestScheduler/CMakeLists.txt
+@@ -1,9 +1,9 @@
+-cmake_minimum_required(VERSION 3.10)
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
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
index 7d8b8cac65..2d343d6f52 100644
--- a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
@@ -5,6 +5,7 @@ inherit cmake bash-completion
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
+    file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
     file://OEToolchainConfig.cmake \
     file://SDKToolchainConfig.cmake.template \
     file://cmake-setup.py \

