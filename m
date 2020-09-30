Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7742.1601438734457087875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 21:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,320,1596470400"; 
   d="scan'208";a="99767411"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Sep 2020 12:05:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E40C448990E8
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 12:05:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Sep 2020 12:05:23 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] harfbuzz: Refresh patch
Date: Wed, 30 Sep 2020 12:05:15 +0800
Message-ID: <1601438715-10650-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E40C448990E8.A0713
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because two modifications conflict in the patch, do_patch will make an error when using patch as a patchtool.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../harfbuzz/harfbuzz/version-race.patch      | 76 +++++++------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
index 2d692f36b5..934bfb8737 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
@@ -1,24 +1,35 @@
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/5aff83104e03d6d2617987d24a51e490ab7a5cd1]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From bc1c93fbe04459a4b12c76c713ba1b750d2d9108 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 7 Sep 2020 17:11:17 +0100
-Subject: [PATCH 1/2] [build] No need to pass source directory to
- gen-hb-version
+From 6ccadec1fae6a73749b7dfe2311f71d0e610e812 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 30 Sep 2020 10:30:08 +0900
+Subject: [PATCH] No need to pass source directory to gen-hb-version
 
 The input file is by definition in the source directory, so dirname()
 that instead of needing the directory to be passed.
 
 Needed because a follow-up commit will change when this is called, and the
 source directory isn't trivially available at that point.
+
+generate hb-version.h once at configure time with Meson
+
+Currently with Meson hb-version.h is generated during the build without
+any explicit dependencies which can result in build failures due races
+over the file.
+
+Change this to be generated at configure time, so that the file is always
+generated once before the build itself.
+
+Closes #2667
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/5aff83104e03d6d2617987d24a51e490ab7a5cd1]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
- src/gen-hb-version.py | 6 +++---
- src/meson.build       | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
+ src/gen-hb-version.py |  6 +++---
+ src/meson.build       | 17 ++++++++---------
+ 2 files changed, 11 insertions(+), 12 deletions(-)
 
 diff --git a/src/gen-hb-version.py b/src/gen-hb-version.py
-index 15e56b93..bf16f88a 100755
+index 15e56b9..bf16f88 100755
 --- a/src/gen-hb-version.py
 +++ b/src/gen-hb-version.py
 @@ -4,15 +4,15 @@
@@ -41,42 +52,7 @@ index 15e56b93..bf16f88a 100755
  with open (INPUT, "r", encoding='utf-8') as template:
  	with open (OUTPUT, "wb") as output:
 diff --git a/src/meson.build b/src/meson.build
-index 5d7cd578..2d78c992 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -286,7 +286,7 @@ custom_target('hb-version.h',
-   input: 'hb-version.h.in',
-   output: 'hb-version.h',
-   command: [find_program('gen-hb-version.py'), meson.project_version(),
--            '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
-+            '@OUTPUT@', '@INPUT@'],
- )
- 
- ragel = find_program('ragel', required: false)
--- 
-2.28.0
-
-
-From 5aff83104e03d6d2617987d24a51e490ab7a5cd1 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 7 Sep 2020 10:55:33 +0100
-Subject: [PATCH 2/2] [build] generate hb-version.h once at configure time with
- Meson
-
-Currently with Meson hb-version.h is generated during the build without
-any explicit dependencies which can result in build failures due races
-over the file.
-
-Change this to be generated at configure time, so that the file is always
-generated once before the build itself.
-
-Closes #2667
----
- src/meson.build | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 2d78c992..19290245 100644
+index 5e1787c..56d8ae2 100644
 --- a/src/meson.build
 +++ b/src/meson.build
 @@ -1,3 +1,10 @@
@@ -110,12 +86,12 @@ index 2d78c992..19290245 100644
 -  input: 'hb-version.h.in',
 -  output: 'hb-version.h',
 -  command: [find_program('gen-hb-version.py'), meson.project_version(),
--            '@OUTPUT@', '@INPUT@'],
+-            '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
 -)
 -
  ragel = find_program('ragel', required: false)
  if not ragel.found()
    warning('You have to install ragel if you are going to develop HarfBuzz itself')
 -- 
-2.28.0
+2.25.1
 
-- 
2.25.1



