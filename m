Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mv-0001mj-K7
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0Dr9j020471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:12 -0500
Message-ID: <2a67012e76a5a81529f9a829ff6fe15e1c2d72a3.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 06/12] libxcb: Update DEPENDS to avoid duplicate entries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2012 00:26:50 -0000
Content-Type: text/plain

Some items were listed multiple times in DEPENDS, avoid this situation.

Note, PR was not incremented as no change to the build process occurs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-graphics/xcb/libxcb.inc       |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb |    2 --
 meta/recipes-graphics/xcb/libxcb_1.8.1.bb  |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb    |    2 --
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 1517f8a..5f4df69 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -11,7 +11,7 @@ SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
 PARALLEL_MAKE = ""
-DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native"
+DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native libpthread-stubs"
 # DEPENDS += "xsltproc-native gperf-native"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2"
diff --git a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
index 7ea7451..b74243e 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
@@ -1,6 +1,4 @@
 include libxcb.inc
 PR = "r2"
 
-DEPENDS += "libpthread-stubs xcb-proto-native"
-
 PACKAGES =+ "libxcb-xinerama"
diff --git a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
index 1f39ca0..52ff0b0 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 PR = "r0"
 
-DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
+DEPENDS += "libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xcb/libxcb_git.bb
index f8cf2a5..66934b4 100644
--- a/meta/recipes-graphics/xcb/libxcb_git.bb
+++ b/meta/recipes-graphics/xcb/libxcb_git.bb
@@ -6,8 +6,6 @@ SRCREV = "625ed596cae6dd8175aeb6cb6f26784928042f22"
 PV = "1.1.90.1+gitr${SRCPV}"
 PR = "r1"
 
-DEPENDS += "libpthread-stubs xcb-proto-native"
-
 SRC_URI = "git://anongit.freedesktop.org/git/xcb/libxcb;protocol=git"
 S = "${WORKDIR}/git"
 
-- 
1.7.3.4



