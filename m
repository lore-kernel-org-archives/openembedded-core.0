Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlr-0000I0-1z
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321838"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:56 -0700
Message-Id: <2d83b339a4dd23b2f6a268795dfa7e676b47dc55.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/23] python-native: distutils: don't use libdir, remove dead code path
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:51 -0000

From: Andreas Oberritter <obi@opendreambox.org>

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
1.7.7.6



