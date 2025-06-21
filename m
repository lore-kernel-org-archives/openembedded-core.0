Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A575C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:44 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.8205.1750515816847764435
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VFGsTCdP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31fc7c27abso1233593a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515816; x=1751120616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qb2FH7y91RURJq62dvOSBqveVc9AhHS9mFRpKKLNKHw=;
        b=VFGsTCdPEquFzk04CzpXrto3QvpuB0SrCh4NbeZJEsU4fHTyAbCZdrST1KxoZpW6fL
         klXgPwyUyAxwe5I7Hp/AFJt0LAjZ9mcNb5NG2mKslGSCEQ92yM7T+I/Y3X/cWAABG8u8
         otUoPlE2hVaWvKei0ORkSBH4UBtO+ybASPE++VM8tQkJxhlsEDMM+4EF5fck8V2Q1YIc
         vRuTLnwQxw7Bg6AwL8WOhcXyJORvqTqUdpJQ4UhkaTN5+3fYlcUi+5tn4Qg4ogapj94k
         0rgEMA10O0AizafV4opHDn+KqS3ME/4z5We67PMjvdgWHObqDdNvFzSdqs7RaWRg7+fy
         v1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515816; x=1751120616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb2FH7y91RURJq62dvOSBqveVc9AhHS9mFRpKKLNKHw=;
        b=bu/zuVozftpSYYaaNWymOZ8vUUIcoMXr6kBcXkQAm0YfIT8FU3GiLnII9Z+d43acSo
         TDq/gYccTUSw4b8vKVCA2dGcz+tilAdCIZpTLvbypp1ssnuM5tZjx9AAH3D/WHmv22MG
         uLn4TNJoQ/lnKgZ5ZAD2ioLiLgi1ajg2G0DOEvfPb8M8yn6Qfk+VDtEf+Ibryz54weN9
         FK/jbcI4TCQbQKn7xxBL5ha5OW5UQSv4HViRmqoji1TR5gLwGaoe/lBReRmbRQDX2YE8
         hHC3bnv1MAwJwGHe8UFtzrTBUCHo8GPrQ+7F8JJTC5IYykLh1qYbDUtsqWyCVhmc2isH
         RPbg==
X-Gm-Message-State: AOJu0YyJoTeVqnY8crEvjr4GreWr0WhvmI5kuZbv9wFLTf/Ytk69sC3m
	hqekg5z8cwoo+E/55O34v42tsjlFcKBai4ERK1MWbw/bITKGInPbQ5KtiHSn/eFV6SP7rabfWc4
	+veE/
X-Gm-Gg: ASbGnctvyEFK8gKHPEvjURSzX28jI07bCBjMxhD0f0914N9t3B7UmCfp85BJBdwCeIs
	86EdZc6cDUw/4Dk+Yz5z4OFch9QkzkScgxbirQ70oppThAK7DElN8V6/GG9Tn9U4eoXc1yx8tVi
	kbn+hOu5NLsBHwLL5TLuHeHeMTRx3yxjQeQIybHx8np3HshELJg4LltJD1OSjom4jlwT9F9nMYQ
	I3SrYUqt2LecFLYufphDAbmK0io6U7u9QrO19vncIW0OSqqsHzKSo7iKcJcPqFnN9nNuXr+4O01
	ZAEB+nyIOepu2wk/moxA87TOVBpMIEaWK5AFVHOt93JqtsarAG3XTw==
X-Google-Smtp-Source: AGHT+IGZGIsSENdfTKwYP44SL0P+GaMsf2eZkccK3En5XofL+WdqnsYTZPAlfOOzG0aEixIUUyCxZg==
X-Received: by 2002:a17:90b:1cc3:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-3159d6408cbmr10110850a91.8.1750515815845;
        Sat, 21 Jun 2025 07:23:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 7/7] cmake: Correctly handle cost data of tests with arbitrary chars in name
Date: Sat, 21 Jun 2025 07:23:17 -0700
Message-ID: <ead0d06d6335fb74c1ae0dc7bdcf414c66b3e4ab.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219165

From: Moritz Haase <Moritz.Haase@bmw.de>

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dcbaf42dd74cc0bda7254856589613718ed3f057)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


