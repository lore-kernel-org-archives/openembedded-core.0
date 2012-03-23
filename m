Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB6hm-0006hG-BA
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:47:06 +0100
Received: by pbcum15 with SMTP id um15so2382587pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4SVDckiFooCb50tfvhXAFYpYKrlxgeLpXrPKZWi6R6U=;
	b=NHRJz08M5ycWEP+OBsYuNW+DD1zaea6pK1Xs+3LNTdTK8ljSb3IH6/VXBjEaupn70x
	O3hDgqxcvBnvBlbWkXzrH1s0te9fzO2yY5hGYD0d1uDihisy4jF9lPbd4iy4Nlorh/q5
	GayoxEJqmOOVSSNLu0M4lRgeFODgFVSfgU7p7BbYfyl+mqzcTu4g9d7wmCOLxTMGhcJx
	sRysLqRSPBST+ky22zsZ81TCrNqx0kPpCVV2fC444JhTa8zmmgBoO7WWsijW+7iI4MlK
	fa0ay29djpyO46O3ImsEYhXmYktmDph4BJ6aMU4D6uW1iXWFZ7fhvY/bLOa1Hu7z+gjn
	GbPw==
Received: by 10.68.132.9 with SMTP id oq9mr29913462pbb.130.1332517089152;
	Fri, 23 Mar 2012 08:38:09 -0700 (PDT)
Received: from localhost.localdomain (garnet.openembedded.org.
	[140.211.169.180])
	by mx.google.com with ESMTPS id m7sm6056730pba.30.2012.03.23.08.38.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:38:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 08:37:50 -0700
Message-Id: <1332517070-31174-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libzypp: Fix buiild with gcc 4.7
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
X-List-Received-Date: Fri, 23 Mar 2012 15:47:06 -0000

it needs protype of close() before using it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libzypp/libzypp/close.patch |   32 +++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb      |    3 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/close.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/close.patch b/meta/recipes-extended/libzypp/libzypp/close.patch
new file mode 100644
index 0000000..0ff1825
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/close.patch
@@ -0,0 +1,32 @@
+close() is used without a protype therefore we include unistd.h
+Fixes compile errors like below
+
+/home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemuppc-oe-linux/libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/zypp/ExternalProgram.h:239:47: error: '::close' has not been declared
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/zypp/ExternalProgram.h
+===================================================================
+--- git.orig/zypp/ExternalProgram.h	2012-03-23 08:27:31.716438539 -0700
++++ git/zypp/ExternalProgram.h	2012-03-23 08:27:54.520439367 -0700
+@@ -16,6 +16,7 @@
+ #include <map>
+ #include <string>
+ #include <vector>
++#include <unistd.h>
+ 
+ #include "zypp/base/ExternalDataSource.h"
+ #include "zypp/Pathname.h"
+Index: git/zypp/base/Random.cc
+===================================================================
+--- git.orig/zypp/base/Random.cc	2012-03-23 08:31:09.732449118 -0700
++++ git/zypp/base/Random.cc	2012-03-23 08:31:36.240450324 -0700
+@@ -3,6 +3,7 @@
+ #include <cstdio>
+ #include <iostream>
+ #include <fcntl.h>
++#include <unistd.h>
+ #include "zypp/base/Random.h"
+ 
+ using namespace std;
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 368cc06..78c7a6a 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r18"
+PR = "r19"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
 	   file://libzypp-compatargs.patch \
 	   file://fix_for_compile_wth_gcc-4.6.0.patch \
 	   file://hardcode-lib-fix.patch \
+	   file://close.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
-- 
1.7.5.4



