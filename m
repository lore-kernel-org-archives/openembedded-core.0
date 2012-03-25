Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBbgv-0007W6-Bn
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 01:52:17 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so3454911wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=SZLykB3+qMpKRSD5kKoVYW/NfUMMikAd+RNPgfMLGnI=;
	b=jOR2CqcvdxXIQjiYz9xFONehGoetqWLLudNV1EGGUD0+veuKNvzjjCWuZWqqSqW3Cj
	3j6gEJooDlrElD3sHno89PlK/n4jyjViL8kHAid+KAiELRFJbjD8HBbtLQjxhDSNPIOb
	GE2Kd6f3NsRO71EKttID4Svgzw8GtT9aVctGs6ZUGUj/9UjefPrSjcSmV42oMtgfppky
	RukbuzXC7Awtf0jLiFZVjMS2c2gtf0ZghhJBTvlSTz8e+9ertXL4A7plRIacdtp/iLyW
	My4AuzssxaABA4CFqmKait7UrNIdXDHT7AUMkuEfQLd5JVNBEc/7SVPTkkYZ4DP+EaQm
	nGiw==
MIME-Version: 1.0
Received: by 10.180.107.162 with SMTP id hd2mr7847054wib.8.1332636201806;
	Sat, 24 Mar 2012 17:43:21 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id l5sm27303664wia.11.2012.03.24.17.43.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 17:43:21 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 02:43:10 +0200
Message-Id: <7f28488dce56a575dd086d4469c8eb9badd00e78.1332635505.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d6bc9ce28547772a079773078e6440568f1dd26c.1332635505.git.andrei@gherzan.ro>
References: <d6bc9ce28547772a079773078e6440568f1dd26c.1332635505.git.andrei@gherzan.ro>
In-Reply-To: <cover.1332635505.git.andrei@gherzan.ro>
References: <cover.1332635505.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnLSFVy9+kALYKodBwWPvG2gb7vsmUxFCu94eoxDhZg583o4bngxRQ/bxqWIwYeBZyKGOIs
Subject: [PATCH 3/3] python: Add tk and tcl to DEPENDS conditionally and add patch for 64bit platform
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
X-List-Received-Date: Sun, 25 Mar 2012 00:52:17 -0000

tk depends on virtual/x11 which is needed to build _tkinter python module.
tk and tcl was added in DEPENDS conditionally. If we have x11 in DISTRO_FEATURES
tk and tcl will be in DEPENDS and _tkinter will be built.

check-if-target-is-64b-not-host.patch
This patch was added for 64bit host machines. In the compile process python
is checking if platform is a 64bit platform using sys.maxint which is the host's
value. The patch fixes this issue so that python would check if TARGET machine
is 64bit not the HOST machine. In this way will have "dl" and "imageop" modules
built if HOST machine is 64bit but the target machine is 32bit.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++-
 2 files changed, 63 insertions(+), 1 deletions(-)
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
index cb0a1d5..4b27b4d 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,11 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
+
+# For _tkinter module we need tcl and tk.
+# Tk needs X.h and Xlib.h so it depends on virtual/libx11.
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'tk tcl', '', d)}"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -22,6 +26,7 @@ SRC_URI += "\
   file://host_include_contamination.patch \
   file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
+  file://check-if-target-is-64b-not-host.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



