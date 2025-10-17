Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D3CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3209.1760733578260055029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uNqfW6qJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2053086b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733577; x=1761338377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOKds5m9MT6qqX4fkFPPgMrXpG0Jy83Lf34+PfG0lIU=;
        b=uNqfW6qJ8nC4eCpDalOxwMaRVGvGoc0SpmfTcVnrccKyPO1iYUwgE7WY/uaBeGO59q
         oFS8c3ZTy8OPi9a9dlND95vz4KFZqY4z18haCi8HD42DxCd415V8VimYBzMg/GFxGVF9
         JFnUeMAFEDgmqg/xx/WDcdu90SY31dQeiBqoWJdSoe6vDkURAu+81/NTmnhmHc/sdgHM
         fZG0NW9/693CPo4+cmf3L/NzJdi4fjfVsNErmH3QxK6hG546tE5yq2fAd+iZ43NZUHdU
         pRvU/byF8SbDkbBY6t8ZR4a+NaRO4Fh3unOUfO5wyRUL61rVA6fQ/hgTVbi50KWwY3d8
         of1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733577; x=1761338377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOKds5m9MT6qqX4fkFPPgMrXpG0Jy83Lf34+PfG0lIU=;
        b=ouYzbENm74y60VXCbo3Dvd5n+Fkn9JZqkrTROhx3mblHIS1+WRvCAM1jIvmY6KEmU2
         ITGUMxGmJwE5ljVBQA3NiXAzHLW04hCkZ3gTg5kddXMHHrWil0IUW5TvsMuL+b2vxru/
         lWuuQN27QqBmMrEEV9BJlU0IE+I6/79I2g83uS35FxpZ3EqKHjHyzUiMX/bJbfTd9R9d
         OsUypPf94ArqHGJW1hFTYYhjZppDjWLO0WnDWHgSj97r7r27D+bKQrXu+Go+oq/wp7CD
         L+G1c6P4Qt9vOTnzHHUG6gAvX0Mb3aHyYWPnQcts+hEJhOXRvfdXWuW0OiwtGxQF+KcA
         T+iw==
X-Gm-Message-State: AOJu0YxxmbwRIQC74y3tNeezoRZUBqm1Z4AhPtXBsxdPYE75btGmQ9o+
	Q1GwuULiNAem9IEya/ado76Diy6Ud+or8sMvdVQa2OCvYA81B5n8vfhCasc4M/pM/gj3ddGSARG
	EfV7160U=
X-Gm-Gg: ASbGncuuyfyGa6LBVXfZLfaQpdvUE4fQKiYvdgPmvbXZSPgh2YAB8yo39EmH/gYkNFk
	saq8iQsVmmSvwT05hKOPOsYeQhwAKw3piQN4d+XKAdR5fVdIE6cMBGqEiBr0lQ2Gcr44p1pCc7o
	Vl00mNHVH4YYK9gPtVlT02A5wIrPDJMcERm5q7HoPw1CpFtvbdk7fhW40bwvIL/a3yDi+RSsdbK
	bg8f91Eys60a/inU/2gvEgKykN38D65vMM2/2DCQE6ETNIh46RaXOBjlIeAfs7jsAny9i2QzA/p
	HNiuRfXikTHnAARLxtg0EjPlgZcSZYsUeMNCuSrA3F9NauL6EEjrMd+Eug/82scL7EgMOf5NyiA
	wrJwnpWcgjlWoZh5J+a8xuKOSMAcPy7725JBmxOAvrlpOZlwjV4/tSjnlLH9BlDHuIn1P8Hm8O/
	zr
X-Google-Smtp-Source: AGHT+IEethqWfdNAshzYDy/fLX7emEBMXDdiMrykebSP8Ve45fnXYT7VAt5TX2ME9zc9eIbadvvm6w==
X-Received: by 2002:aa7:888e:0:b0:781:17ee:602 with SMTP id d2e1a72fcca58-7a220b23bfdmr6295820b3a.28.1760733577477;
        Fri, 17 Oct 2025 13:39:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/26] cmake: fix CVE-2025-9301
Date: Fri, 17 Oct 2025 13:38:52 -0700
Message-ID: <5d8a6fb52ca4a7641236712ba51cb322cb1f9f9d.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225043

From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9301
https://gitlab.kitware.com/cmake/cmake/-/issues/27135

Upstream-patch:
https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/cmake/CVE-2025-9301.patch           | 71 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch

diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
new file mode 100644
index 0000000000..2d8974e394
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
@@ -0,0 +1,71 @@
+From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
+From: Tyler Yankee <tyler.yankee@kitware.com>
+Date: Wed, 13 Aug 2025 15:22:28 -0400
+Subject: [PATCH] foreach: Explicitly skip replay without iterations
+
+As written, foreach loops with a trailing `IN` (i.e., no loop
+variable(s) given) lead to an assertion error. Handle this case by
+exiting early when we know the loop won't execute anything.
+
+Fixes: #27135
+
+CVE: CVE-2025-9301
+
+Upstream-Status: Backport
+https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
+
+Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Source/cmForEachCommand.cxx                  | 3 +++
+ Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
+ Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
+ Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
+
+diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
+index 21a140d0..23f953a5 100644
+--- a/Source/cmForEachCommand.cxx
++++ b/Source/cmForEachCommand.cxx
+@@ -101,6 +101,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
+ bool cmForEachFunctionBlocker::Replay(
+   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
+ {
++  if (this->Args.size() == this->IterationVarsCount) {
++    return true;
++  }
+   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
+                         : this->ReplayItems(functions, inStatus);
+ }
+diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+index 15ca4770..acfc742e 100644
+--- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
++++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
+ run_cmake(foreach-RANGE-out-of-range-test)
+ run_cmake(foreach-var-scope-CMP0124-OLD)
+ run_cmake(foreach-var-scope-CMP0124-NEW)
++run_cmake(TrailingIn)
+diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
+new file mode 100644
+index 00000000..573541ac
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
+@@ -0,0 +1 @@
++0
+diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
+new file mode 100644
+index 00000000..e2b5b2f2
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn.cmake
+@@ -0,0 +1,5 @@
++foreach(v IN)
++endforeach()
++
++foreach(v1 v2 IN)
++endforeach()
+-- 
+2.44.3
+
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 2d47b4c027..1841bfd1cf 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-nativesdk = " \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
 "
+SRC_URI += "file://CVE-2025-9301.patch"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
-- 
2.43.0


