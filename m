Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A73B72267
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8leAi003228
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:40 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:16 -0800
Message-ID: <cffae71caacdba974d36e857b589ede7b5848caf.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/27] cmake: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:46 -0000
Content-Type: text/plain

And bump PR to avoid:
| Error when bootstrapping CMake:
| Found directory "/path/to/cmake-2.8.12.2/Bootstrap.cmk".
| Looks like somebody did bootstrap CMake in the source tree, but now you are
| trying to do bootstrap in the binary tree. Please remove Bootstrap.cmk
| directory from the source tree.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/cmake/cmake.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fb451fd..28b7f2d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,7 +17,9 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://cmake-2.8.11.2-FindFreetype.patch \
            "
 
-inherit autotools-brokensep
+PR = "r1"
+
+inherit autotools
 
 # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
 # and possibly missing qmake binary (qtbase-native can be removed from sysroot
@@ -45,5 +47,5 @@ do_configure_prepend() {
 CMAKE_EXTRACONF = ""
 
 do_configure () {
-	./configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
+	${S}/configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
 }
-- 
1.7.9.5


