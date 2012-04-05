Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqO-0005iI-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:48 +0200
Received: by wera1 with SMTP id a1so1110921wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=cm+qV9G/kYYF0XQ/Al4zf+Nzp9FhD3f1JiNmjMDJAPc=;
	b=PwiGSxfHGvdxSejsUYlNRj/muNvxRdQvlfF0JhsuUr6Tp8ttw7zvOPnraxMP63eB0v
	KwDxSmhzzgsPD2ckVQc3/gLD8bjt6YGbciKQlSLsi5+pTjOInFLpmi+LvIhFwEVbVf7e
	dp6sQaGKrTSBw72PuHV6wxZGggYZDKBFWaib3gRmw8IHT+DA37zWnH3iaP2/8AjidAkv
	UAbNPebkfA7nRzC3Q5jCKV431EuwfzRor7NSsNBy9iXOv9EUcLNdWuBoYJM0bGIZ2nHG
	g1hedqC+M+A7lj4vebo1X9Wr4stZuF6dCyjHpXU+NVcHMYoeTttGI7rnqp709V1vYR6e
	PLfA==
Received: by 10.216.29.197 with SMTP id i47mr1437142wea.45.1333659276825;
	Thu, 05 Apr 2012 13:54:36 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:36 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:21 +0300
Message-Id: <39a7d618cd6d40e09cb0ff8a88e6467a14bcf064.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
References: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnoYVAyVJhVI2NZsHJT9GDRkL5GJMzjsIDfZ9lAeM/NDDcdrZ0oXqMDqiiJl08SWBqCpaC7
Subject: [PATCH 2/6] python: Add patch for 64bit platform
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:48 -0000

This patch was added for 64bit host machines. In the compile process python
is checking if platform is a 64bit platform using sys.maxint which is the host's
value. The patch fixes this issue so that python would check if TARGET machine
is 64bit not the HOST machine. In this way will have "dl" and "imageop" modules
built if HOST machine is 64bit but the target machine is 32bit.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch

diff --git a/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
new file mode 100644
index 0000000..2b62db3
--- /dev/null
+++ b/meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
@@ -0,0 +1,57 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Sun Mar 25 02:02:27 2012 +0200
+
+This patch was added for 64bit host machines. In the compile process python
+is checking if platform is a 64bit platform using sys.maxint which is the host's
+value. The patch fixes this issue so that python would check if TARGET machine
+is 64bit not the HOST machine. In this way will have "dl" and "imageop" modules
+built if HOST machine is 64bit but the target machine is 32bit.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Upstream-Status: Pending
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-03-25 01:10:41.540163187 +0200
++++ Python-2.7.2/setup.py	2012-03-25 01:26:06.092539990 +0200
+@@ -23,6 +23,21 @@
+ # This global variable is used to hold the list of modules to be disabled.
+ disabled_module_list = []
+ 
++def target_is_64bit_platform ():
++    """
++    In case of cross-compile, some modules are not build as setup checks if HOST
++    is 64bit and not TARGET.
++    As python was built for TARGET we can check this in pyconfig.h in this way:
++	Sizeof LONG on a 32 bit platform is 4 bytes
++	Sizeof LONG on a 64 bit platform is 8 bytes
++    """
++    pyconf = open("pyconfig.h").read()
++    aux = re.search(r"#s*define\s+SIZEOF_LONG\s+8\s*", pyconf)
++    if aux is not None:
++	return True
++    else:
++	return False
++
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+     1) 'dir' is not already in 'dirlist'
+@@ -628,7 +643,7 @@
+         exts.append( Extension('audioop', ['audioop.c']) )
+ 
+         # Disabled on 64-bit platforms
+-        if sys.maxint != 9223372036854775807L:
++        if not target_is_64bit_platform():
+             # Operations on images
+             exts.append( Extension('imageop', ['imageop.c']) )
+         else:
+@@ -1418,7 +1433,7 @@
+                 missing.append('_codecs_%s' % loc)
+ 
+         # Dynamic loading module
+-        if sys.maxint == 0x7fffffff:
++        if not target_is_64bit_platform():
+             # This requires sizeof(int) == sizeof(long) == sizeof(char*)
+             dl_inc = find_file('dlfcn.h', [], inc_dirs)
+             if (dl_inc is not None) and (platform not in ['atheos']):
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8cf45da..b604db4 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -21,6 +21,7 @@ SRC_URI += "\
   file://host_include_contamination.patch \
   file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
+  file://check-if-target-is-64b-not-host.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



