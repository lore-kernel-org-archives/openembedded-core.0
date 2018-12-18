Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 533CE7BFF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:00:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI70iIB005937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:00:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:00:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:01 +0800
Message-ID: <602265994c0187b420c69a83c4b2073d8098f0bb.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 01/11] ccache-native: Remove dependencies
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
X-List-Received-Date: Tue, 18 Dec 2018 07:00:43 -0000
Content-Type: text/plain

Remove ccache-native's dependencies so that all native recipes can depend on
ccache-native and use it except ccache-native itself.

It has the following 4 dependencies:
- xz-native: It is intruduced by ccache-3.4.2.tar.xz, use ccache-3.4.2.tar.gz
             to replace of it can fix the problem.

- zlib-native: Use --with-bundled-zlib to fix it.

- autotools-native: Set INHIBIT_AUTOTOOLS_DEPS and add a do_configure() to fix
                    the problem.

- quilt-native: Set PATCHTOOL = "patch" to fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache.inc      | 13 ++++++++++++-
 meta/recipes-devtools/ccache/ccache_3.4.2.bb |  4 ++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 6566328..7f80065 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,8 +9,19 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.xz"
+SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz"
 
 inherit autotools
 
+# Remove ccache-native's dependencies, so that it can be used widely by
+# other native recipes.
+DEPENDS_class-native = ""
+EXTRA_OECONF_class-native = "--with-bundled-zlib"
+INHIBIT_AUTOTOOLS_DEPS_class-native = "1"
+PATCHTOOL = "patch"
+
 BBCLASSEXTEND = "native"
+
+do_configure_class-native() {
+    oe_runconf
+}
diff --git a/meta/recipes-devtools/ccache/ccache_3.4.2.bb b/meta/recipes-devtools/ccache/ccache_3.4.2.bb
index 7230934..921dc3b 100644
--- a/meta/recipes-devtools/ccache/ccache_3.4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.4.2.bb
@@ -3,8 +3,8 @@ require ccache.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=2722abeaf1750dbf175b9491112374e1"
 
-SRC_URI[md5sum] = "9e048f88f3897125864f9a5e1abfb72d"
-SRC_URI[sha256sum] = "18a8b14367d63d3d37fb6c33cba60e1b7fcd7a63d608df97c9771ae0d234fee2"
+SRC_URI[md5sum] = "07d4324efbb3c216bbd1c512f4553480"
+SRC_URI[sha256sum] = "b2264923c63e2b90a17cf56acb1df3f4229c416fb88e476e5ec7e02919d319c3"
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
-- 
2.7.4


