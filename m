Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52B537E21C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:47:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8O2jTm8031731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2019 19:45:39 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 19:45:18 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2019 22:45:06 -0400
Message-ID: <20190924024508.9175-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
References: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com, bunk@stusta.de
Subject: [RFC][Patch 1/3] Add libgit2, libssh2 from meta-oe for rust
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
X-List-Received-Date: Tue, 24 Sep 2019 02:47:09 -0000
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
2.22.0


