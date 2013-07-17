Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 63B2F605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 06:11:19 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so1533521pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VXzmWFfAzMXuvVKChhtFWY/IWgeP/WbIxLi0lzVkmFg=;
	b=SjYgHiRwvqqdkCrF7RzKf/xJWctclMwI03MQzjvfkXISjlUcXEN5jJpnMIxZQO9rGl
	8JUhApWJOy7QELeJJ4gLxeootKbCGT9xwEIn7aVKGEDBUrGe/npGON3OA7wFOupAXq+/
	Gcnv9v7O9MoR9U772NmKqEx1vJyE+MYXepMXfQa1gMAaxxeHEqOQtDQHuPlQ7n1SNxmZ
	P1ntsCw6ysSA/acggW6cRdXhy0DvIIoBKLDhDs90w2vS7e0U+z/pRSpVmNzOkfKX2AKx
	LzTg+4lulAC/2GcrHJoL9MaV4mB6Jp1QzDaA+PIIjFYndQF8XJ41CV4XywF6JAS5G3k0
	POEw==
X-Received: by 10.66.144.104 with SMTP id sl8mr6358421pab.9.1374041479996;
	Tue, 16 Jul 2013 23:11:19 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id kc8sm5859460pbc.18.2013.07.16.23.11.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 23:11:19 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 16:26:51 +1000
Message-Id: <1374042411-1193-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] cmake.bbclass: allow searching host paths for non-target builds
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
X-List-Received-Date: Wed, 17 Jul 2013 06:11:20 -0000

This allows /usr/bin/{ld,ar,objcopy,objdump,ranlib,strip} to be found
and the CMAKE_{LINKER,AR,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
to be properly set for native cmake recipes.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/cmake.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 310242e..2040147 100644
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
 
+cmake_do_generate_toolchain_file_append_class-target() {
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


