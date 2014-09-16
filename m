Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03E8A6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G9e6e0012404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:40:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Sep 2014 02:40:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 02:40:02 -0700
Message-ID: <31f9d49e25b93d0b6ec98453caae7c2e87491468.1410860317.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410860317.git.liezhi.yang@windriver.com>
References: <cover.1410860317.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: selinux/flask.h should respect to with_selinux
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
X-List-Received-Date: Tue, 16 Sep 2014 09:40:12 -0000
Content-Type: text/plain

Fixed when build with meta-selinux even with --without-selinux:
runcon.c:49:28: fatal error: selinux/flask.h: No such file or directory
 # include <selinux/flask.h>
                            ^
compilation terminated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../coreutils-8.22/fix-selinux-flask.patch         |   39 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch
new file mode 100644
index 0000000..9d1ae55
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch
@@ -0,0 +1,39 @@
+From a1d360509fa3a4aff57eedcd528cc0347a87531d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 16 Sep 2014 01:59:08 -0700
+Subject: [PATCH] gnulib-comp.m4: selinux/flask.h should respect to
+ with_selinux
+
+Fixed when build with meta-selinux even when --without-selinux:
+runcon.c:49:28: fatal error: selinux/flask.h: No such file or directory
+ # include <selinux/flask.h>
+                            ^
+compilation terminated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ m4/gnulib-comp.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
+index 472d3a0..5f09734 100644
+--- a/m4/gnulib-comp.m4
++++ b/m4/gnulib-comp.m4
+@@ -1730,11 +1730,11 @@ AC_DEFUN([gl_INIT],
+     AC_LIBOBJ([select])
+   fi
+   gl_SYS_SELECT_MODULE_INDICATOR([select])
+-  AC_CHECK_HEADERS([selinux/flask.h])
+   AC_LIBOBJ([selinux-at])
+   gl_HEADERS_SELINUX_SELINUX_H
+   gl_HEADERS_SELINUX_CONTEXT_H
+   if test "$with_selinux" != no && test "$ac_cv_header_selinux_selinux_h" = yes; then
++    AC_CHECK_HEADERS([selinux/flask.h])
+     AC_LIBOBJ([getfilecon])
+   fi
+   gl_SERVENT
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index 83f7861..6239600 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://dummy_help2man.patch \
            file://fix-for-dummy-man-usage.patch \
+           file://fix-selinux-flask.patch \
           "
 
 SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
-- 
1.7.9.5


