Return-Path: <max+openembedded@blarg.de>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 13:11:14 UTC
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 611E97CEBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:11:14 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F187E00529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f18:7e00:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 194152201C3;
	Thu,  7 Mar 2019 14:04:05 +0100 (CET)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 14:03:59 +0100
Message-Id: <20190307130401.15700-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/3] libsndfile1: make sqlite and FLAC/Vorbis optional
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
X-List-Received-Date: Thu, 07 Mar 2019 13:11:14 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index eb2c719d8d..bbd01e7c8b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Audio format Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
-DEPENDS = "flac libogg libvorbis sqlite3"
+DEPENDS = ""
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
 
@@ -27,8 +27,10 @@ CVE_PRODUCT = "libsndfile"
 
 S = "${WORKDIR}/libsndfile-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} sqlite external-libs"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[sqlite] = ",--disable-sqlite,sqlite3"
+PACKAGECONFIG[external-libs] = ",--disable-external-libs,flac libogg libvorbis"
 
 inherit autotools lib_package pkgconfig
 
-- 
2.20.1


