Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S16QC-0007iQ-Gc
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 02:27:36 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2012 02:19:10 +0100
Message-Id: <1330132750-12469-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] automake: omit compilation of pyc files on install
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
X-List-Received-Date: Sat, 25 Feb 2012 01:27:36 -0000

* On install, automake calls py-compile, which previously
  compiled python source code to pyc and pyo, which both
  got packaged.
* The python interpreter in OE contains patches to enable
  optimization (pyo) by default:
    04-default-is-optimized.patch
    99-ignore-optimization-flag.patch
* automake created pyc files by calling py_compile.compile()
  and adding the c suffix manually, resulting in identical
  byte code for both pyc and pyo files.
* py-compile-compile-only-optimized-byte-code.patch
  applies to automake 1.11 and automake master, but older
  versions require a slightly modified patch. However,
  older versions are only pinned by chinook-compat and
  nylon, so I left them untouched.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

The patch was imported from the OpenEmbedded git server
(git://git.openembedded.org/openembedded) as of commit id
aa4585c5065e05c759f16e1e8623fc7f40640f1b.

Modified to apply to automake version 1.11.2 and to
include a patch header. Also renamed the patch.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 ...-compile-compile-only-optimized-byte-code.patch |   42 ++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.11.2.bb  |    5 +-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch

diff --git a/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch b/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
new file mode 100644
index 0000000..f09bfbc
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+* OE-Core's python creates the same binary output
+  for both pyc and pyo, so disable the creation of
+  pyc files by automake.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ lib/py-compile |   17 -----------------
+ 1 files changed, 0 insertions(+), 17 deletions(-)
+
+diff --git a/lib/py-compile b/lib/py-compile
+index 3f9d05b..101c814 100755
+--- a/lib/py-compile
++++ b/lib/py-compile
+@@ -101,23 +101,6 @@ else
+     filetrans="filepath = os.path.normpath('$destdir' + os.sep + path)"
+ fi
+ 
+-$PYTHON -c "
+-import sys, os, py_compile
+-
+-files = '''$files'''
+-
+-sys.stdout.write('Byte-compiling python modules...\n')
+-for file in files.split():
+-    $pathtrans
+-    $filetrans
+-    if not os.path.exists(filepath) or not (len(filepath) >= 3
+-                                            and filepath[-3:] == '.py'):
+-	    continue
+-    sys.stdout.write(file)
+-    sys.stdout.flush()
+-    py_compile.compile(filepath, filepath + 'c', path)
+-sys.stdout.write('\n')" || exit $?
+-
+ # this will fail for python < 1.5, but that doesn't matter ...
+ $PYTHON -O -c "
+ import sys, os, py_compile
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-devtools/automake/automake_1.11.2.bb b/meta/recipes-devtools/automake/automake_1.11.2.bb
index 4534c39..4271336 100644
--- a/meta/recipes-devtools/automake/automake_1.11.2.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
@@ -37,9 +37,10 @@ PATHFIXPATCH_virtclass-nativesdk = ""
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
 	    file://python-libdir.patch \
-            file://automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch"
+            file://automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch \
+            file://py-compile-compile-only-optimized-byte-code.patch"
 
-PR = "r1"
+PR = "r2"
 SRC_URI[md5sum] = "18194e804d415767bae8f703c963d456"
 SRC_URI[sha256sum] = "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
 
-- 
1.7.5.4



