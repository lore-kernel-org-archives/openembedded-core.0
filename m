Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7CrT-0006Vt-Ou
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:32:59 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 22:24:11 +0100
Message-Id: <1331587452-27755-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
References: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/5] python-native: distutils: don't use libdir, remove dead code path
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
X-List-Received-Date: Mon, 12 Mar 2012 21:32:59 -0000

* Coming from OE-classic it was surprising that python-native now
  requires 'libdir' to be exported. Otherwise autoconf would fail
  to detect python libraries. This happend using a customized
  environment setup script to use OE's compiler and libs without
  bitbake.
* Use STAGING_LIBDIR instead of libdir.
* While at it, remove redundant 'and' statments.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 ...2-distutils-prefix-is-inside-staging-area.patch |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
index b46caf6..f89aaff 100644
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
@@ -30,13 +30,13 @@ Upstream-Status: Inappropriate [embedded specific]
      If 'prefix' is supplied, use it instead of sys.prefix or
      sys.exec_prefix -- i.e., ignore 'plat_specific'.
      """
-+    lib_basename = os.getenv("libdir").split('/')[-1]
++    lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
      if prefix is None:
 -        prefix = plat_specific and EXEC_PREFIX or PREFIX
 +        if plat_specific:
-+            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++            prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
 +        else:
-+            prefix = plat_specific and EXEC_PREFIX or PREFIX
++            prefix = PREFIX
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
-- 
1.7.5.4



