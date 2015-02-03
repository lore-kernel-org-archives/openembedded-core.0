Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEBAA6E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CT0f022794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:29 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:14 -0800
Message-ID: <d42507af6b4878fc5b0f5485d02d0da72dadfe14.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/21] bison 2.3: disable native
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:28 -0000
Content-Type: text/plain

The following packages will fail to build once we build bion-native 2.3:
libnl
iproute2
libxkbcommon
lttng-tools
gstreamer1.0
babeltrace

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/bison/bison_2.3.bb |   15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 174916b..182e880 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -11,17 +11,12 @@ DEPENDS = "bison-native flex-native"
 
 PR = "r1"
 
-BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
          file://bison-2.3_m4.patch"
 
-SRC_URI = "${BASE_SRC_URI}"
-
 SRC_URI[md5sum] = "22327efdd5080e2b1acb6e560a04b43a"
 SRC_URI[sha256sum] = "52f78aa4761a74ceb7fdf770f3554dd84308c3b93c4255e3a5c17558ecda293e"
 
-DEPENDS_class-native = "gettext-native"
-SRC_URI_class-native = "${BASE_SRC_URI}"
-
 inherit autotools gettext texinfo
 acpaths = "-I ${S}/m4"
 
@@ -29,11 +24,3 @@ do_configure_prepend () {
 	rm -f ${S}/m4/*gl.m4
 	cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/runtime-po/
 }
-
-do_install_append_class-native() {
-	create_wrapper ${D}/${bindir}/bison \
-		M4=${STAGING_BINDIR_NATIVE}/m4 \
-		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
-}
-#bison-native encodes the staging M4 path
-BBCLASSEXTEND = "native"
-- 
1.7.9.5


