Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2030.1614135755958616958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O32Okc009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:09 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:08 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/8] Add libgit2, libssh2 from meta-oe for rust
Date: Tue, 23 Feb 2021 22:01:54 -0500
Message-ID: <20210224030201.349588-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-support/libgit2/libgit2_0.27.8.bb | 25 +++++++++++++++++
 meta/recipes-support/libssh2/libssh2_1.8.2.bb | 27 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/libgit2/libgit2_0.27.8.bb
 create mode 100644 meta/recipes-support/libssh2/libssh2_1.8.2.bb

diff --git a/meta/recipes-support/libgit2/libgit2_0.27.8.bb b/meta/recipes-support/libgit2/libgit2_0.27.8.bb
new file mode 100644
index 0000000000..a43408908c
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2_0.27.8.bb
@@ -0,0 +1,25 @@
+SUMMARY = "the Git linkable library"
+HOMEPAGE = "http://libgit2.github.com/"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
+
+DEPENDS = "curl openssl zlib libssh2 libgcrypt"
+
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
+#v0.27.8
+SRCREV = "2882803ca2b2cdedd069746422155a23fdd002b2"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "\
+    -DTHREADSAFE=ON \
+    -DBUILD_CLAR=OFF \
+    -DSHA1_TYPE="builtin" \
+    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DBUILD_EXAMPLES=OFF \
+    -DLIB_INSTALL_DIR=${libdir} \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libssh2/libssh2_1.8.2.bb b/meta/recipes-support/libssh2/libssh2_1.8.2.bb
new file mode 100644
index 0000000000..fe853cde4f
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2_1.8.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A client-side C library implementing the SSH2 protocol"
+HOMEPAGE = "http://www.libssh2.org/"
+SECTION = "libs"
+
+DEPENDS = "zlib"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
+
+SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "616efd99af3d9ef731a26bed6cee9593"
+SRC_URI[sha256sum] = "088307d9f6b6c4b8c13f34602e8ff65d21c2dc4d55284dfe15d502c4ee190d67"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "\
+                 --with-libz \
+                 --with-libz-prefix=${STAGING_LIBDIR} \
+                "
+
+# only one of openssl and gcrypt could be set
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
+PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
+
+BBCLASSEXTEND = "native"
-- 
2.27.0

