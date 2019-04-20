Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id C16D77C4DB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2019 01:27:45 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 10so3209021pfo.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 18:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8AVFEtu8GWrp6ymA5ErnADQ4JOPRyG2/GBIk+1HiE+Q=;
	b=sSPhmwW81Omk7pmVC3wutUdTYtTG37FZ7/7bk4a1Id6ySiedhF9oIiL0PeyeHm0bYX
	lKkZYWPR7NYMmkFK9v+5uhQ9DN6bimHOGOA8jPCcfhHJLasENKbpDyxUBepx7t6BULtm
	yIbVRbiwTFBbfrrDmN+vB+qRYELFdpWmo8V9QD49mZ1QrX1STEIge4krP2hw9SqdX43R
	DDGJ/ob/vemEHodjRBYMPzIVVaG6o+3e4x7szavKPtYHkDKdcTQz2OWSTkyaSfqAx6jw
	i7Q86+Rxu36aWaIc7vjgWOzNXbBRYsBFm7q9zypIMVJGdax+B6whVcciyDX5EzPCuq36
	DjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8AVFEtu8GWrp6ymA5ErnADQ4JOPRyG2/GBIk+1HiE+Q=;
	b=lqTxLeaeO8KP8ASZW/1CHE2pTV05DI2L6k5DVzTR6xM2GBKcg6FrF7Ym092mySc1al
	Aif/LEeDuYgU/8GozJcbdQe6GHHe8FH+e5oEyXEhSqzNNQ3FUnLbGAARzwmRyz1mqGQ+
	gxEViP5oD3cAhkXSEi4RPbZlVrsMLMRY/S7FzKxcNjZKfRUFV0TjV1eKqo/t1h293Uz6
	yBhGZSBnXqAKHsZOH4Pe9fJhpIy8bAdt47KkVZGNxR3Vxv34JOP7qfW4T+ztI6vVtoHu
	CUNdkFn/PEckmK087EgO7NtaQnWtTL5gpK5vk6hXGY2S3SbJ5qP+ix62RGyk72kTNDPp
	wXBA==
X-Gm-Message-State: APjAAAUaSmkjfHH0RSL3fxsWsNpafmYZGTNQLhFQ4S+XU60R8M3xObNa
	58NSbMA45VffWu1+jjTOT52A8rlcnbM=
X-Google-Smtp-Source: APXvYqx85F5FZFdumBFpOW4NnlnD51WDSqjWFmFU40Jd9bMXRfN0w+6/EUZC0kc2/JKVFT4E8Ei1ow==
X-Received: by 2002:a65:424d:: with SMTP id d13mr6876841pgq.318.1555723666158; 
	Fri, 19 Apr 2019 18:27:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5d43])
	by smtp.gmail.com with ESMTPSA id
	d20sm7940602pfo.77.2019.04.19.18.27.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Apr 2019 18:27:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Apr 2019 18:27:38 -0700
Message-Id: <20190420012738.21553-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Fix build with clang
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
X-List-Received-Date: Sat, 20 Apr 2019 01:27:45 -0000
Content-Transfer-Encoding: 8bit

Newer version of webkitgtk has some compile failures with clang/libc++
combination.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/include_array.patch      | 15 +++++++++
 .../webkit/webkitgtk/narrowing.patch          | 31 +++++++++++++++++++
 .../webkit/webkitgtk/snprintf.patch           | 15 +++++++++
 meta/recipes-sato/webkit/webkitgtk_2.24.0.bb  |  3 ++
 4 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/include_array.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/narrowing.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/snprintf.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/include_array.patch b/meta/recipes-sato/webkit/webkitgtk/include_array.patch
new file mode 100644
index 0000000000..7268b04bf4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/include_array.patch
@@ -0,0 +1,15 @@
+Added missing include for std::array
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197085]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- webkitgtk-2.24.0/Source/JavaScriptCore/assembler/PerfLog.cpp.org	2019-04-18 18:03:50.226231691 -0700
++++ webkitgtk-2.24.0/Source/JavaScriptCore/assembler/PerfLog.cpp	2019-04-18 18:07:28.569153989 -0700
+@@ -31,6 +31,7 @@
+ #include <elf.h>
+ #include <fcntl.h>
+ #include <mutex>
++#include <array>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
+ #include <sys/syscall.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk/narrowing.patch b/meta/recipes-sato/webkit/webkitgtk/narrowing.patch
new file mode 100644
index 0000000000..598b6b5df5
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/narrowing.patch
@@ -0,0 +1,31 @@
+Fix build with clang on arm where char is unsigned
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197087]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WebCore/contentextensions/DFACombiner.cpp
++++ b/Source/WebCore/contentextensions/DFACombiner.cpp
+@@ -37,7 +37,7 @@ namespace WebCore {
+ namespace ContentExtensions {
+ 
+ class DFAMerger {
+-    typedef MutableRangeList<char, uint64_t, 128> CombinedTransitionsMutableRangeList;
++    typedef MutableRangeList<signed char, uint64_t, 128> CombinedTransitionsMutableRangeList;
+ 
+     enum class WhichDFA {
+         A,
+--- a/Source/WebCore/contentextensions/NFAToDFA.cpp
++++ b/Source/WebCore/contentextensions/NFAToDFA.cpp
+@@ -41,9 +41,9 @@ namespace WebCore {
+ 
+ namespace ContentExtensions {
+ 
+-typedef MutableRange<char, NFANodeIndexSet> NFANodeRange;
+-typedef MutableRangeList<char, NFANodeIndexSet> NFANodeRangeList;
+-typedef MutableRangeList<char, NFANodeIndexSet, 128> PreallocatedNFANodeRangeList;
++typedef MutableRange<signed char, NFANodeIndexSet> NFANodeRange;
++typedef MutableRangeList<signed char, NFANodeIndexSet> NFANodeRangeList;
++typedef MutableRangeList<signed char, NFANodeIndexSet, 128> PreallocatedNFANodeRangeList;
+ typedef Vector<uint32_t, 0, ContentExtensionsOverflowHandler> UniqueNodeList;
+ typedef Vector<UniqueNodeList, 0, ContentExtensionsOverflowHandler> NFANodeClosures;
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk/snprintf.patch b/meta/recipes-sato/webkit/webkitgtk/snprintf.patch
new file mode 100644
index 0000000000..b1481d78e8
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/snprintf.patch
@@ -0,0 +1,15 @@
+include missing header for snprintf definition
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197088]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WebCore/platform/text/TextCodec.cpp
++++ b/Source/WebCore/platform/text/TextCodec.cpp
+@@ -28,6 +28,7 @@
+ #include "TextCodec.h"
+ 
+ #include <array>
++#include <cstdio>
+ 
+ namespace WebCore {
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
index 4a82dae9ef..a023a369f7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
@@ -20,6 +20,9 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
+           file://include_array.patch \
+           file://narrowing.patch \
+           file://snprintf.patch \
            "
 
 SRC_URI[md5sum] = "576d69c598b3e36c73441052d02466de"
-- 
2.21.0


