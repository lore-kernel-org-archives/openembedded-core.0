Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUqPI-0003S2-Mg
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 02:53:20 +0100
Received: by mail-iy0-f175.google.com with SMTP id k25so8117917iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 17:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/A8mk/P1och2BWIU9FfHyat02QDwqil3H1jmzhgcc3s=;
	b=qivIQl/0pZYwttNIs7D5Qiywh6e299qU6LdxYlmGvOtBefX0dSEquj+UtJsQolYTNy
	uD/X3QAQ6gQZRsZL2DXz0Z8nl2xapz4Rq06fvonUI0ZjhBW9zI9BIzZDe5gLENne0DRf
	pynqcRVhtPG74Y8wYDjzIgpFT5AitbF4tmado=
Received: by 10.50.237.5 with SMTP id uy5mr493964igc.50.1322444805356;
	Sun, 27 Nov 2011 17:46:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm39080026ibb.5.2011.11.27.17.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 17:46:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Nov 2011 17:46:36 -0800
Message-Id: <581e4c647f135c52a2d6b9224cb94c128870ea3f.1322444142.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1b53350820cd64520aac5ad6d09f387001cd8716.1322444142.git.raj.khem@gmail.com>
References: <1b53350820cd64520aac5ad6d09f387001cd8716.1322444142.git.raj.khem@gmail.com>
In-Reply-To: <cover.1322444142.git.raj.khem@gmail.com>
References: <cover.1322444142.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] python-native: Fix gcc compiler detecting logic
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
X-List-Received-Date: Mon, 28 Nov 2011 01:53:20 -0000

We have a patch unixccompiler.patch where we try to throw away
everything except first element of CC string but this does not
work if gcc is prepended with something e.g. CC="ccache gcc"
then the logic fails and it ends up in some modules failing on
you silently (_sqlite3) in my case.
The fix here is to drop basename so we keep the whole
string as it is and then the detection function searches
for gcc string in the whole CC. This works in both cases
one the original intent of the patch and the second described
above. One place where it will fail is if someone has non-gcc
compiler installed in some subdir which has gcc in it e.g.
/usr/gcc/fakecc but for OE this should never happen. Ideally
the the detection logic should have tried to execute gcc
and then parsed --version output or something.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-native/unixccompiler.patch       |   22 ++++++++++----------
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/unixccompiler.patch b/meta/recipes-devtools/python/python-native/unixccompiler.patch
index 10a9baf..4502829 100644
--- a/meta/recipes-devtools/python/python-native/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python-native/unixccompiler.patch
@@ -1,20 +1,20 @@
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Pending
 
-# The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
-# This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
+The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
+This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
 
-#Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-diff --git Python-2.6.6/Lib/distutils/unixccompiler.py Python-2.6.6/Lib/distutils/unixccompiler.py
-index 6d0b84d..aaf49cb 100644
---- Python-2.6.6/Lib/distutils/unixccompiler.py
-+++ Python-2.6.6/Lib/distutils/unixccompiler.py
-@@ -282,7 +282,7 @@ class UnixCCompiler(CCompiler):
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Python-2.7.2/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-2.7.2.orig/Lib/distutils/unixccompiler.py	2011-11-24 13:51:10.539998722 -0800
++++ Python-2.7.2/Lib/distutils/unixccompiler.py	2011-11-24 15:54:36.872137766 -0800
+@@ -282,7 +282,7 @@
          # this time, there's no way to determine this information from
          # the configuration data stored in the Python installation, so
          # we use this hack.
 -        compiler = os.path.basename(sysconfig.get_config_var("CC"))
-+        compiler = os.path.basename(sysconfig.get_config_var("CC").split()[0])
++        compiler = sysconfig.get_config_var("CC")
          if sys.platform[:6] == "darwin":
              # MacOSX's linker doesn't understand the -R flag at all
              return "-L" + dir
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index 6b90d5b..d036eca 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
-- 
1.7.5.4



