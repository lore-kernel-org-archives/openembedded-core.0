Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id CB4397F2FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 19:34:47 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id u17so40244606pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=S6c1d6DWn46FmbkAxlZ+lRCEwOHO1LtFJ6r3Suve7TI=;
	b=YuYVl3sdJuHow9IbOUo9gD/hORp0vdsLjI/8zmQNES25nGWWuk0xhnNsxJH/kPk2cQ
	/nFSJo6PzwVyhMfQiKCkWm+cY1o8Y9bxhIakcKpXBDtfYWZ4I31lqffVx92V6DOlNqjD
	BKsQIGlXj/+C1lxRSNJA3xlTb4I9SORZ02Q+dADIQcarkA0stdWsAuF8dr8BtqnEY0f6
	qfttkNEsOS38EJ1Jkj6UwefKDDpqrJXQvseMtnVsStbVUasR6zKZFYqunY20wDjyxLLE
	lSluUkV15mVLsd0gUhIwb1Tqy/8DIy8VSHqidh17nSsSMWzmMa4GMWEJke1f8yCd/kCh
	1V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S6c1d6DWn46FmbkAxlZ+lRCEwOHO1LtFJ6r3Suve7TI=;
	b=uehFq0yE5qo8W2wE4vZ2+zBuMJY1IsTTDkD4+6mo6BhZCV6Bpatl6xN7lRaQi7yirS
	bOFox29P2rhCInEa6yJvNuAcUJYs29QCPVcKHY7pUmHJ9k9v8GBNMfJVfNHcrqIaoo+1
	npVkA0KA/RcbgOF8yK2sZNu7o++6/Od2n1uml5nydWdYlzBee85SHmUckFBFdGuJomwg
	xgPWxGSK7paJOb5tIzqylA6ZQbfHUXUtQ3d0ih0MS7sBKSi7AvyB1L9TitLhP9KSR33z
	uYmGFOafpQ0y3seC15yp57JACoStyn4SrUv4Tdqpr1mUtJZ3BZGW9K/hxc/Foi0rFe52
	8m9Q==
X-Gm-Message-State: APjAAAUsOXExoqQgI3bRkpevuv8VpCgpwg8f7OlAaOKDCNNIjd1Iv358
	S/tTbC5CR1Kmrj+yA9IJYEmuq6Jszmw=
X-Google-Smtp-Source: APXvYqxpurM0idv3FhTeISujkiSWSLX4WGJuXQHBtUwe1TrFCeB5DOGqrZLBDtBkI6N1Xrzh4cJA5w==
X-Received: by 2002:a62:78c2:: with SMTP id
	t185mr76433684pfc.142.1565033688463; 
	Mon, 05 Aug 2019 12:34:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j10sm51904961pfn.188.2019.08.05.12.34.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 12:34:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 12:34:31 -0700
Message-Id: <20190805193431.32053-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805193431.32053-1-raj.khem@gmail.com>
References: <20190805193431.32053-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] webkitgtk: Fix compile failures with clang
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
X-List-Received-Date: Mon, 05 Aug 2019 19:34:48 -0000
Content-Transfer-Encoding: 8bit

Backport upstream patch to address build regression with clang

Fixes
webkitgtk-2.24.3/Source/bmalloc/bmalloc/AvailableMemory.cpp:120:31: error: implicit instantiation of undefined template 'std::__1::array<char, 256>'
        std::array<char, 256> statmBuffer;
                              ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...uild-failure-https-bugs.webkit.org-s.patch | 33 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.24.3.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
new file mode 100644
index 0000000000..e550a0d457
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
@@ -0,0 +1,33 @@
+From 4bc241539246f7a17d07357257ab47cb96bc4b69 Mon Sep 17 00:00:00 2001
+From: "ysuzuki@apple.com" <ysuzuki@apple.com>
+Date: Thu, 18 Apr 2019 07:30:18 +0000
+Subject: [PATCH] Unreviewed, fix build failure
+ https://bugs.webkit.org/show_bug.cgi?id=195938
+
+Including <array>.
+
+* bmalloc/AvailableMemory.cpp:
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@244422 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/84c111dc0d83b5acf60706ef49bc2f5e91112471]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/bmalloc/bmalloc/AvailableMemory.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/bmalloc/bmalloc/AvailableMemory.cpp b/Source/bmalloc/bmalloc/AvailableMemory.cpp
+index 595889fe..b72000d5 100644
+--- a/Source/bmalloc/bmalloc/AvailableMemory.cpp
++++ b/Source/bmalloc/bmalloc/AvailableMemory.cpp
+@@ -32,6 +32,7 @@
+ #include "PerProcess.h"
+ #include "Scavenger.h"
+ #include "Sizes.h"
++#include <array>
+ #include <mutex>
+ #if BOS(DARWIN)
+ #if BPLATFORM(IOS_FAMILY)
+-- 
+2.22.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
index 81cbf34198..c42c3de69f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://0001-gstreamer-add-a-missing-format-string.patch \
+           file://0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch \
            "
 
 SRC_URI[md5sum] = "e2a5bbd09a217eba096a2d1562143e35"
-- 
2.22.0


