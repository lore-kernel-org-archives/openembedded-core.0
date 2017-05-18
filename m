Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3361160616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:34:37 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s62so4582807pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 22:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qMYUpjNCUfQ4p/IC5iayFK4p6cQnmaLu5MxBp8ieVuw=;
	b=qfFxJgfCIA+eWX8AHotCRffqqcLv2HABhvesW31puwOO89fnX5HSalaOuOvsZAPKGh
	UvUOJTn8PqrdWDwH9JBsYCrYBeBZlQOKXPF9jKD2H0Kc6/lZinRTWEJpnSqKFl89Tk1T
	ab+dtSw4pmujgfogIjuZNKDLTcqWfrvQ9yrwvu8jm/yYQjSvqgZLQlYds5S3b/aCQtpB
	M+56CvxQ7yf++ArMhyXJXadViI0YH4Dd8w+ZACcGc0Mo12LyG5gcM/d0O2NqBx4Ex4rP
	WWBkdlN50+Gmh7tgn1lGn2s1LEDZ0gqm/9P/+bdqOXavnmag5sFGr5uJvnjWDskNJvyJ
	KRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qMYUpjNCUfQ4p/IC5iayFK4p6cQnmaLu5MxBp8ieVuw=;
	b=WSenGKkDmzMkfsVynLhpMc/FtNxCVfa84QdjNZ1qnNjG+FDUJ45cwh7TmuqAMVjrIY
	k+tqi2RQYGtpLpLX1btY5Fwjc+bVQp+1vbgOp15AFbtC22a7wFqgZ9//wrJebAgHG3RQ
	be9BR43KfVy8T5WVZyJ/AvEkjUccEK+Z85Z6MrFkiL0IJYsL92N86dOLueCqESP+9RTD
	tFOBxccrnRCGO2DkBWID2RCvIlhJaDcccnXV6VE3vOpAbCsOFroqI/YotiiwnfPLCkrk
	8sR4tnEvNVleM4ZYgUSJV+8T1z4253AMrlVXxMk6hw5j13SsH31bFROOnzn9Tc2R61/O
	YUdQ==
X-Gm-Message-State: AODbwcActOSiiLuXE6YwIQlEUwgSqcm1PSfH/no+nQLn8bJYnAXzU3uX
	lzziPyZYGXal3Q==
X-Received: by 10.98.35.142 with SMTP id q14mr2501792pfj.220.1495085678990;
	Wed, 17 May 2017 22:34:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	d83sm6802286pfe.40.2017.05.17.22.34.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 22:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 22:34:24 -0700
Message-Id: <20170518053425.37319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/2] webkitgtk: Fix build for armv5
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
X-List-Received-Date: Thu, 18 May 2017 05:34:38 -0000

Detect atomics during configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../detect-atomics-during-configure.patch          | 34 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.16.1.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
new file mode 100644
index 0000000000..12836f28f2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
@@ -0,0 +1,34 @@
+Taken from
+https://bugs.webkit.org/show_bug.cgi?id=161900
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.1.orig/Source/WTF/wtf/CMakeLists.txt
++++ webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
+@@ -182,7 +182,6 @@ set(WTF_HEADERS
+ 
+ set(WTF_SOURCES
+     Assertions.cpp
+-    Atomics.cpp
+     AutomaticThread.cpp
+     BitVector.cpp
+     ClockType.cpp
+@@ -301,6 +300,15 @@ if (NOT USE_SYSTEM_MALLOC)
+     list(APPEND WTF_LIBRARIES bmalloc)
+ endif ()
+ 
++file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
++     "int main(void)\n"
++     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
++try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++if (NOT ATOMICS_BUILD_SUCCEEDED)
++    list(APPEND WTF_SOURCES Atomics.cpp)
++endif ()
++file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++
+ list(APPEND WTF_SOURCES
+     unicode/icu/CollatorICU.cpp
+ )
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
index 0931a50636..a52d93cfbe 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://x32_support.patch \
            file://cross-compile.patch \
            file://gcc7.patch \
+           file://detect-atomics-during-configure.patch \
            "
 SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
 SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
-- 
2.13.0


