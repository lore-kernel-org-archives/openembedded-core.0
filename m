Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F059C728B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 19:02:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBIJ2GHF008066
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 11:02:17 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 11:02:16 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 14:02:15 -0500
Message-ID: <1418929335-4796-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] socat: fix compile erorr against 3.17+ kernel headers
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
X-List-Received-Date: Thu, 18 Dec 2014 19:02:23 -0000
Content-Type: text/plain

With the linux 3.17 kernel socat's configure detects the wrong include
for errqueue.h which results in a compilation error.

By backporting the gentoo patch from:

  http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-misc/socat/files/socat-1.7.2.4-linux-3.17.patch

Fixes the build issue

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../socat/socat/socat-1.7.2.4-linux-3.17.patch     | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch

diff --git a/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch b/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
new file mode 100644
index 000000000000..9152df533f45
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
@@ -0,0 +1,29 @@
+socat: fix compile erorr against 3.17+ kernel headers
+
+With the linux 3.17 kernel socat's configure detects the wrong include for errqueue.h
+which results in a compilation error.
+
+By backporting the gentoo patch from:
+
+  http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-misc/socat/files/socat-1.7.2.4-linux-3.17.patch
+
+Fixes the build issue
+
+Upstream-status: backport
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+
+--- a/configure.in
++++ b/configure.in
+@@ -80,7 +80,10 @@
+ AC_CHECK_HEADERS(termios.h linux/if_tun.h)
+ AC_CHECK_HEADERS(net/if_dl.h)
+ AC_CHECK_HEADERS(linux/types.h)
+-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
++AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [AC_INCLUDES_DEFAULT
++	#if HAVE_LINUX_TYPES_H
++	#include <linux/types.h>
++	#endif])
+ AC_CHECK_HEADERS(sys/utsname.h sys/select.h sys/file.h)
+ AC_CHECK_HEADERS(util.h bsd/libutil.h libutil.h sys/stropts.h regex.h)
+ AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index efa3b91c16a3..f4461de49e26 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://fix-cross-compiling-failed.patch \
+           file://socat-1.7.2.4-linux-3.17.patch \
 "
 
 SRC_URI[md5sum] = "69b8155dd442a6f24e28ef5407d868eb"
-- 
2.1.0


