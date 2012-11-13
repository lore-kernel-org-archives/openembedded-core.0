Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYKVU-0007Kx-EM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:42:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="217197561"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.166])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 09:28:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 17:27:59 +0000
Message-Id: <c6cca731e4843b4d3be9c17773a8fb57ca876ba2.1352827498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/4] python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 17:42:40 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Currently smart does not support recommend dependencies.  Add the first set
of 'support' for RPMSENSE_MISSINGOK (the flag that makes something a
recommend).  This initial support ends up ignoring the recommendation, but is
written in a way that it will be the basis of eventual support.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-smartpm/smart-missingok.patch    |   43 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch b/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
new file mode 100644
index 0000000..7e13869
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
@@ -0,0 +1,43 @@
+backends/rpm: Identify recommended packages
+
+We identify and store recommended packages (and later throw that data away.)
+
+This is indended to be the starting work to add support for recommended
+packages to smart.
+
+Upstream-status: Inappropriate [ Code isn't finished! ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: smart-1.4.1/smart/backends/rpm/header.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/header.py
++++ smart-1.4.1/smart/backends/rpm/header.py
+@@ -292,6 +292,7 @@ class RPMHeaderLoader(Loader):
+                     f = [0]
+                 elif type(f) != list:
+                     f = [f]
++                recdict = {}
+                 reqdict = {}
+                 for i in range(len(n)):
+                     ni = n[i]
+@@ -308,10 +309,17 @@ class RPMHeaderLoader(Loader):
+                             # RPMSENSE_SCRIPT_PREUN |
+                             # RPMSENSE_SCRIPT_POST |
+                             # RPMSENSE_SCRIPT_POSTUN == 7744
+-                            reqdict[(f[i]&7744 and PreReq or Req,
+-                                     intern(ni), r, vi)] = True
++                            if (f[i]&rpm.RPMSENSE_MISSINGOK):
++                                print "Ignoring Recommend Dependency: %s" % (ni)
++                                recdict[(f[i]&7744 and PreReq or Req,
++                                         intern(ni), r, vi)] = True
++                            else:
++                                reqdict[(f[i]&7744 and PreReq or Req,
++                                         intern(ni), r, vi)] = True
++                recargs = collapse_libc_requires(recdict.keys())
+                 reqargs = collapse_libc_requires(reqdict.keys())
+             else:
++                recargs = None
+                 reqargs = None
+ 
+             n = h[1054] # RPMTAG_CONFLICTNAME
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index bc0c1f9..4314564 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,13 +11,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r0"
+PR = "r1"
 SRCNAME = "smart"
 
 SRC_URI = "\
           http://launchpad.net/smart/trunk/${PV}/+download/${SRCNAME}-${PV}.tar.bz2 \
           file://smartpm-rpm5-nodig.patch \
           file://smart-rpm-root.patch \
+          file://smart-missingok.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.9.5



