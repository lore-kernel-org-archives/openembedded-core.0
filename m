Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1REjuM-0000jE-KU
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:42:50 +0200
Received: by vwe42 with SMTP id 42so155105vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=L6w76uBUXUdHqUsgO9hiafkhh79RzDSPjJnWlcmC2O4=;
	b=b3GjnpclSX6eZCRQTg5uXqb/iucG00/wV0e/tcImbbNexBH6xttdrttlL6/GXJHPhz
	+QRoPF+z8Zk/cn3bqatl8DoCcrLOUJJcQII8iEefLx5AcRWSleAyWRi27w5JkhKM0MNL
	KhvejktTMGyqNWR82LqPtz14LmxqrYuEvKg68=
Received: by 10.52.240.131 with SMTP id wa3mr6924568vdc.95.1318606625070;
	Fri, 14 Oct 2011 08:37:05 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-183-10.ronkva.east.verizon.net. [96.240.183.10])
	by mx.google.com with ESMTPS id ie2sm8026078vdb.1.2011.10.14.08.37.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 08:37:04 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2011 11:35:40 -0400
Message-Id: <1318606540-14130-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [v2 1/1] cmake : Disable building ccmake.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2011 15:42:50 -0000

ccmake fails to build due to an as-needed type error with -ltinfo. Disable
it for now since the build fails and cmake is what we need for target
sdk.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-devtools/cmake/cmake_2.8.5.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 4fa9562..8e04072 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -4,7 +4,7 @@ inherit cmake
 
 DEPENDS += "curl expat zlib libarchive ncurses"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
@@ -30,6 +30,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
     ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
-- 
1.7.3.4



