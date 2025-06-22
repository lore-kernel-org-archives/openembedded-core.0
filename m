Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1CEC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.27636.1750604565907703632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VEGfmZNt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747ef5996edso2491911b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604565; x=1751209365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e+jR2aBt/wpoawReuYUr0L/yMMRrqUxhs6PBk90U5Q=;
        b=VEGfmZNtUFfEltWpD4AVISolJBtqfs4N/5flEMHru+v3M1E6ROvXSeejyflR/GVjga
         JLR70Hcc49HdVBcoTFkIosvOah+S4Ufvu/49OZksfCQvmVKR5dV5nx2JmXFmeGmGMslk
         sq3C7CyS+f3Pa3UgqhTAO/hm7e4uqp42HXITSODSBMNZVXOCjCzliuEMYtzxjt2/rxdq
         0CmuYgTYoTcajB4KID80fwt0Iheg+GY7kDMflsUaJCzAP5mj/XPWZO/g4i11D8R2Xb/4
         /DAycUHdqTmfluO/cw3q8B1HzIhttt6poSjf31tsNIsd0jK+RIqpUTVBw0ne0BwPpbg+
         XcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604565; x=1751209365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9e+jR2aBt/wpoawReuYUr0L/yMMRrqUxhs6PBk90U5Q=;
        b=dSwE8XZuDTgUsmSs6fOd/wnhcvwDWSQr8myLJ3warC84wRkAV5ah+m9mP3X3oUrR8D
         Si974XkMcgJGi0KqIHLyX756Cj5yE5AdkoXOgKHAdUpH/7YyBSYl3LeVnIoW6u05M8A2
         6IilSiuw7EYr2KrpLyOE/rcxPHbV/ur6+/6RwFiXkypnCHA5Bs4Ft9rPLHDQuZ4lPQVU
         IrjpfCNUry7+pwy5Jlu5+J/Qk1nFreIqyzYLs+IQUSmnMJNaC0G/1LYSQK3M3QIeqq+V
         OuZrUqC+Y8Fx0nwYDu1mxNYHe4E4vxVlsMgnexoPl36gjtThMgkY0OsygrpvZbi9r4AL
         bYzw==
X-Gm-Message-State: AOJu0YxENeB4uN/B06135wEN+Kz8mY9mxONUMBJuiMQqwHn3S4dKnCs8
	sG3SMyXu3+wSyGm/CtLWvOtIA0zBrUKHM/r/GH2ZU02PrryBENH+yrfj3Y1ZDEBkGsgqdNNpfex
	01mhCV0w=
X-Gm-Gg: ASbGncue4EIpIS80fkem1SODn/Fgh0hCm0jLvch0JiuXZ6j5VL10bRA9jUi+kwx/idX
	C24JVGetE6APWL7g+zc+ZT2Re2zbhV2Ix1GmDopwj0M4uXQe6MTy55ZW8gQN9L1vRYPyDBT94Ry
	MwP9/KIee1OyKKVTxYS2FLWAH6D+fqwZWzTF7Ig8zQzkDsd4mm9qOHaNaLHqwntb+8x45lgHgRe
	2UyR1ImOMtx90tA1vP0KUox6xLDMjoCIEGvfn5sjB7Af1/+7Ty9IdzKRlNhTiO+iTtjpx/C4My+
	vkjpoED3r111Zh8yiOV8fNGXlkGfDkjKkvaA8nbL1SUHxrnF3ueEAg==
X-Google-Smtp-Source: AGHT+IFOWfFarHSxzS4/IG5Gi7i+SsOqXHWKh0Wf3TIuomaT7hymChvxB5O/eGyefs3i6M/b4A/Eiw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr14816570b3a.4.1750604564847;
        Sun, 22 Jun 2025 08:02:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] cmake: Correctly handle cost data of tests with arbitrary chars in name
Date: Sun, 22 Jun 2025 08:00:09 -0700
Message-ID: <f6a160f7ea57af6dfeca003e6c05aa42419fb755.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219193

From: Moritz Haase <Moritz.Haase@bmw.de>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


