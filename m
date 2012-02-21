Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rzs0e-0001PU-V4
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 16:52:09 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 16:43:43 +0100
Message-Id: <1329839023-17307-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] python-native: distutils: don't use libdir, remove dead code path
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
X-List-Received-Date: Tue, 21 Feb 2012 15:52:09 -0000

* Use sys.lib instead of libdir's suffix.
* While at it, simplify redundant if/and-statments.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
Coming from OE-classic it was surprising that python-native suddenly
required 'libdir' to be exported. Otherwise autoconf would fail to
detect python libraries. This happend using a customized environment
setup script to use OE's compiler and libs without bitbake.

NOTE: I'm unsure whether os.getenv("libdir").split('/')[-1] and sys.lib
actually return the same values in every case. I'm not using multilib.
Can anybody please confirm oder disprove this?

This doesn't show up as a problem when bitbake is used. I don't know
whether this would show up in an SDK setup. I'm using a script to set
up some commands to simplify working with OE's compilers and libraries,
i.e. by providing the required environment variables and parameters for
make and autotools. Having to export libdir seems odd, as it's the only
required lower case variable and is typically used by autotools in
conjunction with many other lower case variables, which already get
passed to configure as command line parameters.

 ...2-distutils-prefix-is-inside-staging-area.patch |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
index b46caf6..7b743e5 100644
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
@@ -26,26 +26,21 @@ Upstream-Status: Inappropriate [embedded specific]
  
      if os.name == "posix":
          if python_build:
-@@ -115,12 +115,16 @@
-     If 'prefix' is supplied, use it instead of sys.prefix or
+@@ -116,11 +116,11 @@
      sys.exec_prefix -- i.e., ignore 'plat_specific'.
      """
-+    lib_basename = os.getenv("libdir").split('/')[-1]
      if prefix is None:
 -        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
-+        else:
-+            prefix = plat_specific and EXEC_PREFIX or PREFIX
++        prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(sys.lib) or PREFIX
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
 -                                 "lib", "python" + get_python_version())
-+                                 lib_basename, "python" + get_python_version())
++                                 sys.lib, "python" + get_python_version())
          if standard_lib:
              return libpython
          else:
-@@ -216,7 +220,7 @@
+@@ -216,7 +216,7 @@
      else:
          # The name of the config.h file changed in 2.2
          config_h = 'pyconfig.h'
@@ -54,7 +49,7 @@ Upstream-Status: Inappropriate [embedded specific]
  
  
  def get_makefile_filename():
-@@ -225,7 +229,7 @@
+@@ -225,7 +225,7 @@
          return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
                              "Makefile")
      lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
-- 
1.7.5.4



