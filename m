Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BF7F677D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 14:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2VE9MZN008719; 
	Fri, 31 Mar 2017 15:09:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Mrx5VltY7TG2; Fri, 31 Mar 2017 15:09:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2VE9KYv008712
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Mar 2017 15:09:21 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ctxEu-0005Y4-QM; Fri, 31 Mar 2017 15:09:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 15:09:18 +0100
Message-Id: <1490969358-21290-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] dpkg: Add PACKAGECONFIG for liblzma and enable it
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
X-List-Received-Date: Fri, 31 Mar 2017 14:09:24 -0000

liblzma is part of xz and we already build it but configure it out. This makes
no sense. Enabling it means we gain multithreaded compression and it speeds
dpkg-deb up massively. It also removes the fork overhead of separate xz processes.

Turning the existing config into a PACKAGECONFIG and turning it on by default
therefore makes best use of what we have available.

The manual RDEPENDS are no longer needed since it uses liblzma which is picked
up by the shlibs code magically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 6abe3ae..870117a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,8 +4,8 @@ SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz perl"
-RDEPENDS_${PN}_class-native = "xz-native"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
+RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
@@ -28,10 +28,12 @@ EXTRA_OECONF = "\
 		--enable-start-stop-daemon \
 		--with-libz \
 		--with-libbz2 \
-		--without-liblzma \
 		--without-libselinux \
 		"
 
+PACKAGECONFIG = "liblzma"
+PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
+
 EXTRA_OECONF += "TAR=tar"
 EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
 
-- 
2.7.4


