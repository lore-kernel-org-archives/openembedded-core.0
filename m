Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF6C56FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UGnGTF009309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 30 Aug 2016 09:49:17 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:03 -0400
Message-ID: <89463ec6e33f6ba793867711eb18d82ee58bc85b.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] libc-headers: update to v4.8
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:17 -0000
Content-Type: text/plain

Updating the libc-headers to use the 4.8 kernel as the default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                 |  2 +-
 .../linux-libc-headers/linux-libc-headers_4.8.bb            | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7c73411de0a2..79855963282b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.11%"
 GLIBCVERSION ?= "2.24"
 UCLIBCVERSION ?= "1.0%"
-LINUXLIBCVERSION ?= "4.4"
+LINUXLIBCVERSION ?= "4.8%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
new file mode 100644
index 000000000000..f80f02cb1896
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -0,0 +1,13 @@
+require linux-libc-headers.inc
+
+SRC_URI_forcevariable = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/testing/linux-4.8-rc4.tar.${KORG_ARCHIVE_COMPRESSION}"
+PV = "4.8-rc4"
+
+SRC_URI_append_libc-musl = "\
+    file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
+    file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
+    file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
+   "
+
+SRC_URI[md5sum] = "269067213995c7742730ce53b8140c90"
+SRC_URI[sha256sum] = "8f07a0d76a7d1a30490582ba9642b7f28370102bc4acc4bb4b2586c8eabf4447"
-- 
2.5.0


