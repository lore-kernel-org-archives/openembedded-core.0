Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 506AA6ABC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:12:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5L8D0eo010728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jun 2013 01:13:00 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 21 Jun 2013 01:12:58 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Jun 2013 16:12:21 +0800
Message-ID: <7a0305f34aa1f986856e699b69242e353986b6dc.1371802236.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371802236.git.kai.kang@windriver.com>
References: <cover.1371802236.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] strace: add configure options libaio and acl
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
X-List-Received-Date: Fri, 21 Jun 2013 08:12:59 -0000
Content-Type: text/plain

Add strace configure options libaio and acl to enable or disable build
with them. Then PACKAGECONFIG can be used to handle dependency.

Set "libaio" as a default feature of PACKAGECONFIG.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../strace-4.8/strace-add-configure-options.patch  |   60 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.8.bb         |    9 +++-
 2 files changed, 68 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch

diff --git a/meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch
new file mode 100644
index 0000000..27266d9
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch
@@ -0,0 +1,60 @@
+Add options "aio" and "acl" to enable/disable libaio and acl support.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+--- strace-4.8/configure.ac.orig	2013-06-21 15:37:52.145892182 +0800
++++ strace-4.8/configure.ac	2013-06-21 15:45:49.029909004 +0800
+@@ -219,7 +219,6 @@ AC_CHECK_HEADERS(m4_normalize([
+ 	netinet/sctp.h
+ 	poll.h
+ 	stropts.h
+-	sys/acl.h
+ 	sys/asynch.h
+ 	sys/conf.h
+ 	sys/epoll.h
+@@ -231,6 +230,19 @@ AC_CHECK_HEADERS(m4_normalize([
+ 	sys/uio.h
+ 	sys/vfs.h
+ ]))
++
++AC_ARG_ENABLE([acl],
++	[AS_HELP_STRING([--enable-acl], [turn on acl support])],
++	[case $enableval in
++	yes) 
++		AC_CHECK_HEADERS([sys/acl.h])
++		;;
++	no)  ;;
++	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
++	esac]
++	
++)
++
+ AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
+                  [], [], [#include <stddef.h>
+ #include <sys/socket.h>
+@@ -301,10 +313,19 @@ AC_CHECK_SIZEOF([long])
+ AC_CHECK_SIZEOF([long long])
+ AC_CHECK_SIZEOF([rlim_t],,[#include <sys/resource.h>])
+ 
+-AC_CHECK_HEADERS([libaio.h], [
+-	AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
+-	AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
+-])
++AC_ARG_ENABLE([aio],
++	[AS_HELP_STRING([--enable-aio], [turn on libaio support])],
++	[case $enableval in
++	yes) 
++	AC_CHECK_HEADERS([libaio.h], [
++		AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
++		AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
++	])
++	;;
++	no)  ;;
++	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
++	esac]
++)
+ 
+ AC_PATH_PROG([PERL], [perl])
+ 
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index c1ffdd1..0f4d2f0 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -6,12 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
-           file://git-version-gen"
+           file://git-version-gen \
+           file://strace-add-configure-options.patch"
 
 SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
 SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
 inherit autotools
 
+PACKAGECONFIG_class-target ?= "libaio"
+PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+
+PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+
 export INCLUDES = "-I. -I./linux"
 
 do_configure_prepend() {
-- 
1.7.5.4


