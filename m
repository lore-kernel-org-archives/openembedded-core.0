Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SBAIV-0003NO-6U
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 20:37:15 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id B6730F8126E; Fri, 23 Mar 2012 13:28:19 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:28:16 -0600
Message-Id: <1332530896-27466-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1332530896-27466-1-git-send-email-gary@mlbassoc.com>
References: <1332530896-27466-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH 2/2 v2] python: fix packaging dependencies on minimal systems
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
X-List-Received-Date: Fri, 23 Mar 2012 19:37:15 -0000

If you install the top-level python package only on a minimal
system which has no other python packages installed then python
is not functional at all.  Without any extra packages installed
this error is seen:
  # python
  Traceback (most recent call last):
    File "/usr/lib/python2.7/site.py", line 64, in <module>
      import traceback
  ImportError: No module named traceback

Installing python-lang only partly fixes the problem as this
error still exists:
  # python
  Traceback (most recent call last):
    File "/usr/lib/python2.7/site.py", line 569, in <module>
      main()
    File "/usr/lib/python2.7/site.py", line 551, in main
      known_paths = addusersitepackages(known_paths)
    File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
      user_site = getusersitepackages()
    File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
      user_base = getuserbase() # this will also set USER_BASE
    File "/usr/lib/python2.7/site.py", line 243, in getuserbase
      USER_BASE = get_config_var('userbase')
    File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
      return get_config_vars().get(name)
    File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
      import re
  ImportError: No module named re

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 3193565..ca01553 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -38,7 +38,7 @@ RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
 FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
 
 DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
-RDEPENDS_${PN}-core=""
+RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
 FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so \
 ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8111b31..8cf45da 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 85ca353..267d678 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -160,7 +160,7 @@ if __name__ == "__main__":
     # Parameters: revision, name, description, dependencies, filenames
     #
 
-    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "",
+    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "${PN}-lang ${PN}-re",
     "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
-- 
1.7.7.6



