Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8e-0001En-0u
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787072"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:52:59 -0700
Message-Id: <52cc2c20005f22d87c0e8a2325ba6df99efc56e3.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/20] python: add patch to fix cross compilation on host with linux-3.0
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:46 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python/07-linux3-regen-fix.patch        |   18 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    1 +
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch

diff --git a/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch b/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
new file mode 100644
index 0000000..d7fb313
--- /dev/null
+++ b/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Without this patch it calls cross-compiled python if host is running linux-3.0
+python$EXE ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
+| ./regen: line 3: /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.6.6-nk2.8/Python-2.6.6/python: cannot execute binary file
+
+diff -uNr Python-2.6.6.orig//Lib/plat-linux3/regen Python-2.6.6/Lib/plat-linux3/regen
+--- Python-2.6.6.orig//Lib/plat-linux3/regen	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.6.6/Lib/plat-linux3/regen	2001-08-09 14:48:17.000000000 +0200
+@@ -0,0 +1,8 @@
++#! /bin/sh
++case `uname` in
++Linux*)	;;
++*)	echo Probably not on a Linux system 1>&2
++	exit 1;;
++esac
++set -v
++h2py -i '(u_long)' /usr/include/sys/types.h /usr/include/netinet/in.h /usr/include/dlfcn.h
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 76f32f2..598fea8 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "\
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
+  file://07-linux3-regen-fix.patch \
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
-- 
1.7.3.4



