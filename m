Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A94EC83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 12:30:44 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web10.22398.1751459440154146090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 05:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=E0L8hk4C;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751459441; x=1782995441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+5oT9IodIjf3QToJelnP674iN/V7e1kGxvLDDRjahiY=;
  b=E0L8hk4C95IPewSh7dt9YyEHfCscKSNnSze89pbExFlFeztPx6WQ/KrI
   oRR32jE8LlFX1OGKRiE2ENXeTBA9JCBvEPzUZRvf4+xE1S61vYeqDIY/O
   plW3P3+wCTJCITSZSPtZj93F8Zuop+6qDjWA/RYrCuVdVlLovBTgCv4b4
   w=;
X-CSE-ConnectionGUID: QxW41lwkSMO0+o8GlBuwzQ==
X-CSE-MsgGUID: qKGv5EspSrisC1HQ6hoa/w==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 14:30:38 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw1.muc with
 ESMTP/TLS; 02 Jul 2025 14:30:38 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 02 Jul 2025 14:30:38 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.203) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 14:30:37 +0200
X-CSE-ConnectionGUID: IpCRXD2nSYa8O7DUQmoEjw==
X-CSE-MsgGUID: 5eL4CkGHSyGxr6bH1Bm81Q==
X-CSE-ConnectionGUID: 6epQ5Bf+RYOnCYdgqcQ1YA==
X-CSE-MsgGUID: WHOjRmf5SuGosCSC3vCCqQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v4 3/7] apt: Backport patch to support builds with CMake 4+
Date: Wed, 2 Jul 2025 14:30:01 +0200
Message-ID: <20250702123005.1233743-4-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702123005.1233743-1-Moritz.Haase@bmw.de>
References: <20250702123005.1233743-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12B.europe.bmw.corp (2a03:1e80:a15:58f::1:28) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 12:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219824

There have been a number of upstream releases that ship this patch already, but
given that the most recent ones are considered experimental, I opted to backport
instead.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
changes in v4:
- Fix patch formatting

changes in v3:
- Commit added to series
---

 ...mum_required-to-3.13-to-avoid-warnin.patch | 47 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch b/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
new file mode 100644
index 0000000000..c3a5ded494
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
@@ -0,0 +1,47 @@
+From dc7a8b3050a2a43f49515a03ae19713dfced75dc Mon Sep 17 00:00:00 2001
+From: David Kalnischkies <david@kalnischkies.de>
+Date: Sat, 18 Nov 2023 13:10:05 +0000
+Subject: [PATCH] Raise cmake_minimum_required to 3.13 to avoid warnings
+
+CMake Deprecation Warning at CMakeLists.txt:6 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 will be removed from a future version of
+  CMake.
+
+  Update the VERSION argument <min> value or use a ...<max> suffix to tell
+  CMake that the project does not need compatibility with older versions.
+
+Picking 3.13 here is a semi-random choice to avoid raising the requirement
+too much needlessly while also hopefully avoiding needing to raise it
+soon again based on the referenced mail.
+
+While we are at it, lets also fix the other spewed warning:
+
+CMake Warning (dev) at CMakeLists.txt:5 (project):
+  cmake_minimum_required() should be called prior to this top-level project()
+  call.  Please see the cmake-commands(7) manual for usage documentation of
+  both commands.
+
+References: https://lists.debian.org/msgid-search/20230617162957.6pklb6632zf4nijc@mail.gaussglocke.de
+
+Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/dc7a8b3050a2a43f49515a03ae19713dfced75dc]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 62182cddf..dae12e7c3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,8 +2,8 @@
+ # Licensed under the same terms as APT; i.e. GPL 2 or later.
+
+ # set minimum version
++cmake_minimum_required(VERSION 3.13)
+ project(apt)
+-cmake_minimum_required(VERSION 3.4.0)
+ # Generic header locations
+ include_directories(${PROJECT_BINARY_DIR}/include)
+
+--
+GitLab
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index d605d950dd..50ac2ea812 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
            file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
+           file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch \
            "
 
 SRC_URI:append:class-native = " \

