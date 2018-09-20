Return-Path: <max+openembedded@blarg.de>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Sep 2018 13:26:02 UTC
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id F3AC17982A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 13:26:02 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 06446220511;
	Thu, 20 Sep 2018 15:16:27 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 15:16:23 +0200
Message-Id: <20180920131623.22048-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180920131623.22048-1-max+openembedded@blarg.de>
References: <20180920131623.22048-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] libsolv: make rpm optional
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
X-List-Received-Date: Thu, 20 Sep 2018 13:26:03 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.35.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
index 0956453022..12dfc5d3a2 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
-DEPENDS = "expat zlib rpm"
+DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git"
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
@@ -19,7 +19,10 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPLEX_DEPS=ON"
+PACKAGECONFIG ??= "rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+
+EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 
-- 
2.18.0


