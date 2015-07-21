Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B82375972
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:21:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6LFLBrJ000796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jul 2015 08:21:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 21 Jul 2015 08:21:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jul 2015 11:21:06 -0400
Message-ID: <058c061e9566533aa23ca7559af37088a022b811.1437491325.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437491325.git.bruce.ashfield@windriver.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-libc-headers: update to 4.1
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
X-List-Received-Date: Tue, 21 Jul 2015 15:21:12 -0000
Content-Type: text/plain

Updating the libc-headers to match the 4.1 LTSI kernel version.

We also tweak the logic in linux-libc-headers.inc to look in the
4.x subdirectory if a 4.x kernel is specified as the header source.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                       | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc     | 2 ++
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb | 7 -------
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb  | 7 +++++++
 4 files changed, 10 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 096bec9fd623..84ecd7248021 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.25"
 GDBVERSION ?= "7.9%"
 GLIBCVERSION ?= "2.21"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.19"
+LINUXLIBCVERSION ?= "4.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index b18d09fd6c3e..566bc1e6154b 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -35,6 +35,8 @@ python __anonymous () {
     major = d.getVar("PV",True).split('.')[0]
     if major == "3":
         d.setVar("HEADER_FETCH_VER", "3.0")
+    elif major == "4":
+        d.setVar("HEADER_FETCH_VER", "4.x")
     else:
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
deleted file mode 100644
index 078df4512ba1..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "d3fc8316d4d4d04b65cbc2d70799e763"
-SRC_URI[sha256sum] = "be42511fe5321012bb4a2009167ce56a9e5fe362b4af43e8c371b3666859806c"
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
new file mode 100644
index 000000000000..d816e5e7845e
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
+SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+
-- 
2.1.0


