Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rx5OY-0006t9-3y
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 00:33:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1695113eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 15:25:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.17.144 with SMTP id s16mr12759eba.38.1329175510372;
	Mon, 13 Feb 2012 15:25:10 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id a58sm66210352eeb.8.2012.02.13.15.25.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 15:25:09 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 01:24:58 +0200
Message-Id: <d423b57b7f2e86c2d8dfe7ae2e193b8eefd660cf.1329175337.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329175337.git.andrei@gherzan.ro>
References: <cover.1329175337.git.andrei@gherzan.ro>
In-Reply-To: <cover.1329175337.git.andrei@gherzan.ro>
References: <cover.1329175337.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmllLLyPrWKgwaKvs2BVUkE/cuzy9HsJ0n5IgAf3pM3XK0RmCB89Jtee3li/1xIORUhJmLO
Subject: [PATCH v2 2/2] nspr: Add patch in order to remove rpath from binaries
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
X-List-Received-Date: Mon, 13 Feb 2012 23:33:18 -0000

This patch was created in order to avoid QA warnings.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../nspr/files/remove-rpath-from-tests.patch       |   26 ++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch

diff --git a/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
new file mode 100644
index 0000000..a7e7853
--- /dev/null
+++ b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
@@ -0,0 +1,26 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Thu Feb 9 00:03:38 2012 +0200
+
+Avoid QA warnings by removing hardcoded rpath from binaries.
+
+[...]
+WARNING: QA Issue: package nspr contains bad RPATH {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/nspr-4.8.9/mozilla/nsprpub/pr/tests/../../dist/lib
+in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-split/nspr/usr/lib/nspr/tests/multiwait
+[...]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: nspr-4.8.9/mozilla/nsprpub/pr/tests/Makefile.in
+===================================================================
+--- nsprpub.orig/pr/tests/Makefile.in	2012-02-11 00:01:10.476220505 +0200
++++ nsprpub/pr/tests/Makefile.in	2012-02-10 23:57:40.000000000 +0200
+@@ -379,7 +379,7 @@
+ endif
+ 
+ ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
+-    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
++    LDOPTS += -Xlinker
+     ifeq ($(USE_PTHREADS),1)
+         EXTRA_LIBS = -lpthread
+     endif
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index 74bfe6b..0607c32 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,9 +5,10 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+           file://remove-rpath-from-tests.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
1.7.5.4



