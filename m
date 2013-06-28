Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFD16AF6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:44 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so2736762pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UBVtFLYJLpoFTQUOwX5hQfUyIGNcM3HcXvs8I3bqWSk=;
	b=TViIHSC3UK6Qb34T5EadO5UyvZWmJ5Cj+dApgXbygroG/O3DlJ6lumu9KjfZeJd6c/
	DG0BPbHVcp+y5ODDrPjmP8nbSd5vRHgJprfay3/tdg6E3dfplf/3vh94rAxWI3K+pqby
	r73uNroS4cBiDPhuhcR61sjgiUgETHKgJcC8MjH1Vp20LLMl1UnlgbIQlsMI9aa6nuS1
	1nuW0i9ooYp7KcqrHXxnQXM+lOxrTnwkZiU5romyNuFUNTkeWoWeKJIRis+T4Hu4k37k
	aL8eF0hTPCXIri/Og9EfSedRMeaJN3+2VobHxACA0lCrEyPbQYfjXYQm140+xsj6lz8C
	kARQ==
X-Received: by 10.66.231.7 with SMTP id tc7mr13211635pac.143.1372457085210;
	Fri, 28 Jun 2013 15:04:45 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.44 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:03 -0700
Message-Id: <a0ec061e19feab02d8ca7203c7a68acacf7ead3e.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 18/24] pyzmq: Add recipes using python3
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fixed-just-zmq-detection.patch            |   56 ++++++++++++++++++++
 .../python/python3-pyzmq_13.0.0.bb                 |   46 ++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch b/meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch
new file mode 100644
index 0000000..edbfd74
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch
@@ -0,0 +1,56 @@
+From a249b31be7e3e66b81feacfc7537f11c0c1dabda Mon Sep 17 00:00:00 2001
+From: xantares <xantares@fujitsu-l64.(none)>
+Date: Sun, 24 Feb 2013 15:49:36 +0100
+Subject: [PATCH] Fixed just zmq detection
+
+---
+ buildutils/detect.py |    6 ++++++
+ setup.py             |    8 ++++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/buildutils/detect.py b/buildutils/detect.py
+index f95cba3..6b6ccb9 100644
+--- a/buildutils/detect.py
++++ b/buildutils/detect.py
+@@ -110,6 +110,12 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+     cfile = pjoin(basedir, 'vers.c')
+     shutil.copy(pjoin(os.path.dirname(__file__), 'vers.c'), cfile)
+     
++    # check if we need to link against Realtime Extensions library
++    if sys.platform.startswith('linux'):
++        cc = ccompiler.new_compiler(compiler=compiler)
++        if not cc.has_function('timer_create'):
++            compiler_attrs['libraries'].append('rt')
++            
+     efile = test_compilation(cfile, compiler=compiler, **compiler_attrs)
+     
+     result = Popen(efile, stdout=PIPE, stderr=PIPE)
+diff --git a/setup.py b/setup.py
+index b646673..005757e 100755
+--- a/setup.py
++++ b/setup.py
+@@ -41,6 +41,7 @@ if sys.version_info < (2,6):
+ import distutils
+ from distutils.core import setup, Command
+ from distutils.ccompiler import get_default_compiler
++from distutils.ccompiler import new_compiler
+ from distutils.extension import Extension
+ from distutils.errors import CompileError, LinkError
+ from distutils.command.build import build
+@@ -408,8 +409,11 @@ class Configure(build_ext):
+             ext.libraries.extend(['rpcrt4', 'ws2_32', 'advapi32'])
+         elif not sys.platform.startswith(('darwin', 'freebsd')):
+             ext.include_dirs.append(bundledir)
+-
+-            ext.libraries.append('rt')
++            
++            # check if we need to link against Realtime Extensions library
++            cc = new_compiler(compiler=self.compiler_type)
++            if not cc.has_function('timer_create'):
++                ext.libraries.append('rt')
+         
+         # insert the extension:
+         self.distribution.ext_modules.insert(0, ext)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb b/meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb
new file mode 100644
index 0000000..8ca5440
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "Python Bindings for ZeroMQ."
+HOMEPAGE = " http://github.com/zeromq/pyzmq/"
+SECTION = "devel/python"
+LICENSE = "BSD LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
+                    file://COPYING.LESSER;md5=a9339599829a9d0eb1b314ef43365ab5 \
+                   "
+
+DEPENDS = "python3 zeromq"
+RDEPENDS_${PN} = " \
+                   python3-codecs \
+                   python3-core \
+                   python3-ctypes \
+                   python3-datetime \
+                   python3-fcntl \
+                   python3-io \
+                   python3-logging \
+                   python3-math \
+                   python3-netclient \
+                   python3-threading \
+                   zeromq \
+                 "
+SRCNAME = "pyzmq"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+  file://0001-Fixed-just-zmq-detection.patch \
+"
+SRC_URI[md5sum] = "1325ab6819f7a087eee84aaa951b6f0c"
+SRC_URI[sha256sum] = "31d8ededdb707f97ffe22963d3f9a721c2330e50904a647cb8d97ec38db43476"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3
+# using linux-${TARGET_ARCH} is wrong here since TARGET_ARCH does not tranlate to
+# whatever setup.py expects but we only need to differentiate here between cross and
+# native case, and its correct linux-x86_64 for native case so all failed matches will mean
+# cross compile which is fine in our case
+DISTUTILS_BUILD_ARGS += "--zmq=${STAGING_EXECPREFIXDIR}"
+
+do_compile_prepend () {
+        echo "[bdist_egg]" > ${S}/setup.cfg
+        echo "plat-name = linux-${TARGET_ARCH}" >> ${S}/setup.cfg
+        echo "[global]" >> ${S}/setup.cfg
+        echo "skip_check_zmq = True" >> ${S}/setup.cfg
+}
-- 
1.7.9.5


