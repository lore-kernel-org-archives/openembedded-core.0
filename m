Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C557D6B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 05:25:16 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so1442538pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jUVxeQD6ogzwfwNUnz72Wp8rPu6y6ByoAqHrRyjnI4U=;
	b=R4cSHa8BjWrcKeLdvjI/y01rSRQzjUAoCDdQ6f73c6o2o8Gx5uJBKhtTvA0B0mU0QV
	y6jpOgYFaoyrRrLVCm3HgXV2rSenbvb21KMe61/NbQwdPCSl3n7Nu1NlgaS2XG0g+XZV
	281uO0vi61X1GP+2sVKlJyMmmTGpN3h+4gx6dqFrHfdZdU0js/fALkEy2qS1a6pL1qzJ
	MCsoh/Qovg8Ke9Kk+P+MsYLAoafwX1al1b/1WR2v7eSjj5YHBYWDujzR1SogSXef3XlN
	FIXA2B4D1f+TSVgF5BTVcPZuy1oLnyJUiqR729tYpSDiwX1uqrjI/I+ZeH3Z1M64Rb4Y
	/6GQ==
X-Received: by 10.66.141.4 with SMTP id rk4mr5990793pab.127.1374038717585;
	Tue, 16 Jul 2013 22:25:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id br1sm5657688pbb.4.2013.07.16.22.25.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 22:25:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 15:40:34 +1000
Message-Id: <1374039634-32218-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] cmake.bbclass: allow searching host paths for non-target builds
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
X-List-Received-Date: Wed, 17 Jul 2013 05:25:16 -0000

This allows /usr/bin/{ld,ar,objcopy,objdump,ranlib,strip} to be found
and the CMAKE_{LINKER,AR,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
to be properly set for native cmake recipes.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/cmake.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 310242e..7084bed 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -46,12 +46,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
 set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
-# only search in the paths provided so cmake doesnt pick
-# up libraries and tools from the native build machine
 set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
 
 # Use qt.conf settings
 set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
@@ -69,6 +64,16 @@ set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 EOF
 }
 
+cmake_do_generate_toolchain_file_class-target() {
+	cat >> ${WORKDIR}/toolchain.cmake <<EOF
+# only search in the paths provided so cmake doesnt pick
+# up libraries and tools from the native build machine
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+EOF
+}
+
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-- 
1.8.3.2


