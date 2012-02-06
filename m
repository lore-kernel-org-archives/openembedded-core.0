Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOy-0004YI-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:12 +0100
Received: by pbbb4 with SMTP id b4so4117785pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7QTwb1Ekc6I5xgek9lz+0cW55dW6RBTcW1QomW3Mty8=;
	b=w3VM+3jhrEA3TZ5mKbXw/8eDhjI22CQboNVMkGCBRTa9R40Rfb1LpR2k0V6lIcn8JQ
	P592AmBs/YIEwNxUSDiLa5vMWzMpItqwruZX2WRBN+S/RVAhvz4ZE0YG+E0x/VVPOeKZ
	mp75YAz1A9UNZpl8oJgMLbOLsH3GSA1pKBDMw=
Received: by 10.68.136.231 with SMTP id qd7mr21682527pbb.10.1328510530715;
	Sun, 05 Feb 2012 22:42:10 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:41 -0800
Message-Id: <5501fb9d345f18862a35c403d827f582c3f91abf.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 15/20] python: Fix build failure of python-elementtree on x86_64
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:12 -0000

The problem is due to mixing of headers from host system
thusly corrected in setup.py by checkinng if we are cross
compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python/host_include_contamination.patch |   27 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/host_include_contamination.patch

diff --git a/meta/recipes-devtools/python/python/host_include_contamination.patch b/meta/recipes-devtools/python/python/host_include_contamination.patch
new file mode 100644
index 0000000..62cb8b1
--- /dev/null
+++ b/meta/recipes-devtools/python/python/host_include_contamination.patch
@@ -0,0 +1,27 @@
+when building python for qemux86-64 on ubuntu 11.10/64bit
+it gropes into host includes and then mixes them with cross
+includes and as a result some modules fail to compile and link
+one of the modules is python-elementtree which is then not
+found during image creation
+
+Proble is that setup.py tries to add native includes that newer
+ubuntu has introduced for multiarch support. But that should
+only happen for native builds and not cross building python
+so we add a check here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-02-03 12:10:42.307057756 -0800
++++ Python-2.7.2/setup.py	2012-02-03 12:11:12.363059210 -0800
+@@ -360,6 +360,8 @@
+         # https://wiki.ubuntu.com/MultiarchSpec
+         if not find_executable('dpkg-architecture'):
+             return
++	if os.environ.get('CROSS_COMPILE') is not None:
++	    return
+         tmpfile = os.path.join(self.build_temp, 'multiarch')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 654c850..fb5e860 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -20,6 +20,7 @@ SRC_URI += "\
   file://remove_sqlite_rpath.patch \
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
+  file://host_include_contamination.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



