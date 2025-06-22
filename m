Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96293C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:38:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.26161.1750599472377670175
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qfNlgzh2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-749248d06faso871615b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750599472; x=1751204272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5mjYqUhRSpyPi/KRrNzmGOxPT6RbNpErRKAkQ+ReyI=;
        b=qfNlgzh2oIa4b/V9FY8Kmpy11Z226Um4dabmLeO8sv7HLSKvStHK+y8Z7STYrVgmtW
         w6jPpKs5pFj4E/pe1m78JHhIVp29w6CMzbkhPALYtGJi2tl6u+4S0QxGrwiVcSRGG927
         RKV6HElIeNFXMVwS0tJlELb+f1YJ34ORc/5tI0fDAizEsqRsw70tIua8RwdIwEsxkfsk
         yECqeCpWn9Nnq1rnlccDGVDj/sa1N2Z+NgpYzs6lUDLTeLr9eSHufD8ZPTiFWBxVpvXc
         3FtY8zK/Ij+0g/F4lS0qK1U923mmt7GYDiOhfK+lmqVZNhjo05gza4j+MD7be9UQxO4i
         8aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599472; x=1751204272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5mjYqUhRSpyPi/KRrNzmGOxPT6RbNpErRKAkQ+ReyI=;
        b=UOn/AfQnzcKoc1GSu9HFRzgfHlPC7uyIOt0VJWv3XO9uFcdxJl9Kf1B+nmXhiT/6O4
         5lxuIettInL2KJNf9jjKEK76agUNicvv4dbknSZiBJnPAJioCfFowGxnpbCUTFfq/RXC
         Kqvnkr1hWj63lpoxvaFZFhc7ysLF77pWjwDi+Enop252f3G/Y6lao0WMID5kY6KWquZI
         m2rRkknVmdh9phgWbjGbbwi5/nPEyGz6leuTBoKwPxHotiT7b+sJYdDv0ljDC5pqBWvU
         3Gke/k94UsPxHIz4605hkRlRdGWBHSK01q1OAq/GX3/FRBUrJ5b7FasYQhyhcwN4PP4+
         alOw==
X-Gm-Message-State: AOJu0YwoPzzuRKDh6XL2iVN36uQ3mXPKFZSol1Vzf40Jf+ZPH8xQq7ui
	y/3cUZ1CYcDASwJTYYnXszXP+9mR3+zRx8fV6Jp7nAygjPbwzQ5V8h/Khd/p4ptTEprA6NDl9gq
	Q+pwfKjI=
X-Gm-Gg: ASbGnct44Oo+bWNP5XPUsomRxOMZw9JHfCFNDyw8ZS3wan8ORfncvD+cxR75yeeYgjS
	j9efJqmD4UthhuCx04qABbxf7lgIFK+FLJJw+/KOAk3qF1DhVZYcPiBDUfwb0WMOl42TzKlvi1x
	T0vx8OfP1azmzptGy5ib5tq6qiPIsu+sGk5DvUhH0Qqtk6sy8ja7bcwSvwhRY3nYh7cBKTl3Zrb
	rV7h6LuVbmlTLBFoTg4NzkRgDT4dgmxwoy3ux2zS0pRNWKoRBIB15RxkYgsguVSGlNx4VfbDLeT
	lQRQMtSQ9j4EDSXb6E0wTSGYheVGWP5gxeBRldYEAETNCmMZhYVaLA==
X-Google-Smtp-Source: AGHT+IGmuM3QyiRCJNhgikagaUPs0JbICGiWcFt4YyKDBah6/MZKJBbq0cNAIaG/e2j46i56V4JGsg==
X-Received: by 2002:a05:6a00:2d1b:b0:736:4644:86ee with SMTP id d2e1a72fcca58-7490d60849bmr13438118b3a.14.1750599471402;
        Sun, 22 Jun 2025 06:37:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm5960189b3a.163.2025.06.22.06.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:37:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/4] cmake: Correctly handle cost data of tests with arbitrary chars in name
Date: Sun, 22 Jun 2025 06:37:32 -0700
Message-ID: <cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe.1750599311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750599311.git.steve@sakoman.com>
References: <cover.1750599311.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 13:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219178

From: Moritz Haase <Moritz.Haase@bmw.de>

ctest automatically optimizes the order of (parallel) test execution based on
historic test case runtime via the COST property (see [0]), which can have a
significant impact on overall test run times. Sadly this feature is broken in
CMake < 4.0.0 for test cases that have spaces in their name (see [1]).

This commit is a backport of f24178f3 (which itself backports the upstream fix).
The patch was adapted slightly to apply cleanly to the older CMake version in
scarthgap. As repeated test runs are expected to mainly take place inside the
SDK, the patch is only applied to 'nativesdk' builds.

[0]: https://cmake.org/cmake/help/latest/prop_test/COST.html
[1]: https://gitlab.kitware.com/cmake/cmake/-/issues/26594

Reported-By: John Drouhard <john@drouhard.dev>
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/cmake-native_3.28.3.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 205 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |   1 +
 3 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
index 546d117156..376da3254b 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -51,7 +51,7 @@ do_compile() {
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 
-	# The following codes are here because eSDK needs to provide compatibilty
+	# The following codes are here because eSDK needs to provide compatibility
 	# for SDK. That is, eSDK could also be used like traditional SDK.
 	mkdir -p ${D}${datadir}/cmake
 	install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
diff --git a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
new file mode 100644
index 0000000000..77c1d6378d
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
@@ -0,0 +1,205 @@
+From 49576cf1df618609be4aa1000749ad087c143df0 Mon Sep 17 00:00:00 2001
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
+index ca07a081eafced40697d82b08c0e2a504939fc4d..59a101454b84367d219e79a01ff72702df0dfa7f 100644
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
+@@ -43,6 +44,51 @@
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
+@@ -697,24 +743,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()
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
+@@ -750,28 +793,25 @@ void cmCTestMultiProcessHandler::ReadCostData()
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
+@@ -784,7 +824,7 @@ void cmCTestMultiProcessHandler::ReadCostData()
+   }
+ }
+ 
+-int cmCTestMultiProcessHandler::SearchByName(std::string const& name)
++int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)
+ {
+   int index = -1;
+ 
+diff --git a/Source/CTest/cmCTestMultiProcessHandler.h b/Source/CTest/cmCTestMultiProcessHandler.h
+index 3b4e9c59ad1871168d8528be0586831e2416ae36..8d33dabcf0d9fc6e11459105c65eadaa1de33e42 100644
+--- a/Source/CTest/cmCTestMultiProcessHandler.h
++++ b/Source/CTest/cmCTestMultiProcessHandler.h
+@@ -12,6 +12,7 @@
+ #include <vector>
+ 
+ #include <cm/optional>
++#include <cm/string_view>
+ 
+ #include <cm3p/uv.h>
+ 
+@@ -113,7 +114,7 @@ protected:
+   void UpdateCostData();
+   void ReadCostData();
+   // Return index of a test based on its name
+-  int SearchByName(std::string const& name);
++  int SearchByName(cm::string_view name);
+ 
+   void CreateTestCostList();
+ 
+diff --git a/Tests/CTestTestScheduler/CMakeLists.txt b/Tests/CTestTestScheduler/CMakeLists.txt
+index 91d565d4020aafda6d49462cd8616d168d5844b6..daf6ce2b23d8c048334ae1047759130b246dccef 100644
+--- a/Tests/CTestTestScheduler/CMakeLists.txt
++++ b/Tests/CTestTestScheduler/CMakeLists.txt
+@@ -1,9 +1,9 @@
+-cmake_minimum_required (VERSION 3.5)
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
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 6a9a3266df..63d483801a 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -5,6 +5,7 @@ inherit cmake bash-completion
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
+    file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
     file://OEToolchainConfig.cmake \
     file://SDKToolchainConfig.cmake.template \
     file://cmake-setup.py \
-- 
2.43.0


