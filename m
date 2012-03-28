Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCiy6-0005vj-8Q
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 04:50:38 +0200
Received: by pbcum15 with SMTP id um15so1015354pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 19:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=z8RrOTs2tzWEYXmlMkWz5o/SSTj7KcKVRCAOZYnjht4=;
	b=eGpxclz4Sy/yTF42bOFfNbWWcME5uixBFbM/sFoeQ33i1zI8S8hliMgt34aFyRSyXv
	4jjIse69ITCpNg4Y7C3TCkYHk+g7wia/Vy3wwrDMuJ2dYDgYRvvKXUd4su3mF0v44EdQ
	O31pEJKnzFRIdeHwBd/B+rJVafBT36qN00IbvO2sE83lzB7K1lTztW6/jSD2sdS04HGA
	qU2PHcsVh9u7ryBbjMtuJmuhwvnH5nevaletJRCpasdFpnEVt4Q7XGBwm6BbnmRY+iL/
	CQRKTztnOPmmiCb5XRHsGKNOeeTkXUmvUX1wvqxghYl5jv40kx06NICD8sbWWG9Veswr
	wpgA==
Received: by 10.68.136.65 with SMTP id py1mr67219772pbb.64.1332902495980;
	Tue, 27 Mar 2012 19:41:35 -0700 (PDT)
Received: from localhost.localdomain (garnet.openembedded.org.
	[140.211.169.180])
	by mx.google.com with ESMTPS id z7sm1614537pbk.63.2012.03.27.19.41.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 19:41:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 19:41:05 -0700
Message-Id: <1332902465-14472-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] zypper: Fix build with gcc 4.7
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
X-List-Received-Date: Wed, 28 Mar 2012 02:50:38 -0000

More details in patch header

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/zypper/zypper/gcc-scope.patch |   20 ++++++++++++++++++++
 meta/recipes-extended/zypper/zypper_git.bb         |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/zypper/zypper/gcc-scope.patch

diff --git a/meta/recipes-extended/zypper/zypper/gcc-scope.patch b/meta/recipes-extended/zypper/zypper/gcc-scope.patch
new file mode 100644
index 0000000..a35c0d9
--- /dev/null
+++ b/meta/recipes-extended/zypper/zypper/gcc-scope.patch
@@ -0,0 +1,20 @@
+Fix errors like below
+
+| /home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemumips-oe-linux/zypper-1.5.3-git1+2c5bb6ceb99ecd950ef993e43d77bf0569ea0582-r1/git/src/utils/console.cc:55:8: error: '::isatty' has not been declared                                                                                                                                                  
+| /home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemumips-oe-linux/zypper-1.5.3-git1+2c5bb6ceb99ecd950ef993e43d77bf0569ea0582-r1/git/src/utils/console.cc:55:17: error: 'STDOUT_FILENO' was not declared in this scope                                                                                                                                   
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/src/utils/console.cc
+===================================================================
+--- git.orig/src/utils/console.cc	2012-03-27 19:12:06.171036356 -0700
++++ git/src/utils/console.cc	2012-03-27 19:12:52.887038622 -0700
+@@ -15,6 +15,7 @@
+ #include <readline/readline.h>
+ #include <readline/history.h>
+ #include <cstdlib>
++#include <unistd.h>
+ 
+ using namespace std;
+ 
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index e5963be..56ccc86 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-PR = "r1"
+PR = "r2"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://cmake_libxml2.patch \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
+           file://gcc-scope.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
1.7.5.4



