Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4023F6BBBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:28 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so5139138pdj.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=UjnbKI/AA1sWFIWBwYFfbX9yVNkHTCTKvckTyv10PuA=;
	b=NRXba8Sx+BTGyw43C+7HV2KkzdVlvuTTSj2mSjM6izMh52uXl0BvVwCMyOPp4nYUfW
	lj7gjwTVyFTaEPgZJc9rOn3RmOcFf5dHnoLVRH0MolNwY8536OZPYb9DbT4LfMqS7DLx
	ZAd8DNUunJkoFuafTKN11IeWVn3PmHWEKRwkzX/fyDTJl3RbIF4h1PegpULr4/iUbE4E
	03dehUU8GRBlekNjOn+KouE/NWmxwFs5/0XR48YUQkZM1LnvmxIhyIX1u2q35yFtyJNP
	2lTALC4vGnATS2sGUCF9YWx5rq0teW94HAuCWBP6t/zJY3sS3QzyF/Z9qqTr8eZ9Z7Zx
	hqRA==
X-Received: by 10.67.1.41 with SMTP id bd9mr21931355pad.116.1377623789217;
	Tue, 27 Aug 2013 10:16:29 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:17 -0700
Message-Id: <92051b6afbe83aa017bb54ffcc414aaea4152a98.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 18/20] python3: Fix the compiler invocation and linker flags when cross compiling
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:28 -0000

The details are in patch header. This should fix the QA errors about
host contamination

Add virtual/libintl to dep list

There is use of libintl.h but we dont
express the dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.2.bb                 |  1 +
 .../python/python3/unixccompiler.patch             | 33 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.2.bb      |  3 +-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.2.bb b/meta/recipes-devtools/python/python3-native_3.3.2.bb
index da8dc87..d11ec51 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.2.bb
@@ -21,6 +21,7 @@ file://06-ctypes-libffi-fix-configure.patch \
 file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
+file://unixccompiler.patch \
 ${DISTRO_SRC_URI} \
 "
 SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/meta/recipes-devtools/python/python3/unixccompiler.patch
new file mode 100644
index 0000000..b2229b4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
+This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
+
+Secondly add -L=<path> this way linker will be able to resolve /usr/lib w.r.t sysroot and not
+use hardcoded /usr/lib to look for libs which is wrong in cross compile environment and this will work
+ok on native systems too since sysroot for native compilers is /
+
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Python-3.3.2/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-3.3.2.orig/Lib/distutils/unixccompiler.py	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Lib/distutils/unixccompiler.py	2013-08-01 00:58:18.629056286 -0700
+@@ -202,7 +202,7 @@
+     # ccompiler.py.
+ 
+     def library_dir_option(self, dir):
+-        return "-L" + dir
++        return "-L=" + dir
+ 
+     def _is_gcc(self, compiler_name):
+         return "gcc" in compiler_name or "g++" in compiler_name
+@@ -221,7 +221,7 @@
+         # this time, there's no way to determine this information from
+         # the configuration data stored in the Python installation, so
+         # we use this hack.
+-        compiler = os.path.basename(sysconfig.get_config_var("CC"))
++        compiler = sysconfig.get_config_var("CC")
+         if sys.platform[:6] == "darwin":
+             # MacOSX's linker doesn't understand the -R flag at all
+             return "-L" + dir
diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
index fe423d3..6ff32d8 100644
--- a/meta/recipes-devtools/python/python3_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -1,6 +1,6 @@
 require recipes-devtools/python/python.inc
 
-DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl"
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.3"
 PYTHON_BINABI= "${PYTHON_MAJMIN}m"
@@ -31,6 +31,7 @@ SRC_URI += "\
             file://python-3.3-multilib.patch \
             file://shutil-follow-symlink-fix.patch \
             file://sysroot-include-headers.patch \
+            file://unixccompiler.patch \
            "
 SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
 SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
-- 
1.8.3.4


