Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F28156AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:10:03 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2013 10:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="336772874"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.176])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2013 10:09:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:09:03 +0100
Message-Id: <abf56388f39ef451e0d4cc490a6193d74b0b8989.1374772012.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] python-smartpm: add ignore-recommends package flag
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
X-List-Received-Date: Thu, 25 Jul 2013 17:10:04 -0000

Adds support for a flag that is saved into Smart's configuration against
a package that says it should not be installed if it is only recommended
by a package being installed rather than required. This will enable us
to add BAD_RECOMMENDATIONS support for RPM.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../smart-flag-ignore-recommends.patch             | 60 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch b/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
new file mode 100644
index 0000000..5d5c6f4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
@@ -0,0 +1,60 @@
+Add ignore-recommends flag support
+
+Allow configuring recommends on specific packages to be ignored.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ smart/commands/flag.py | 3 +++
+ smart/transaction.py   | 7 ++++++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/smart/commands/flag.py b/smart/commands/flag.py
+index 8b90496..191bb11 100644
+--- a/smart/commands/flag.py
++++ b/smart/commands/flag.py
+@@ -47,6 +47,9 @@ Currently known flags are:
+   multi-version - Flagged packages may have more than one version
+                   installed in the system at the same time
+                   (backend dependent).
++  ignore-recommends - Flagged packages will not be installed, if
++                  they are only recommended by a package to be
++                  installed rather than required.
+ 
+   security      - Flagged packages are updates for security errata.
+   bugfix        - Flagged packages are updates for bugfix errata.
+diff --git a/smart/transaction.py b/smart/transaction.py
+index dd9aa38..38eabae 100644
+--- a/smart/transaction.py
++++ b/smart/transaction.py
+@@ -596,12 +596,17 @@ class Transaction(object):
+         # Install packages required by this one.
+         for req in pkg.requires + pkg.recommends:
+ 
++            reqrequired = req in pkg.requires
++
+             # Check if someone is already providing it.
+             prvpkgs = {}
+             lockedpkgs = {}
+             found = False
+             for prv in req.providedby:
+                 for prvpkg in prv.packages:
++                    if not reqrequired:
++                        if pkgconf.testFlag("ignore-recommends", prvpkg):
++                            continue
+                     if isinst(prvpkg):
+                         found = True
+                         break
+@@ -620,7 +625,7 @@ class Transaction(object):
+ 
+             if not prvpkgs:
+                 # No packages provide it at all. Give up.
+-                if req in pkg.requires:
++                if reqrequired:
+                     reasons = []
+                     for prv in req.providedby:
+                         for prvpkg in prv.packages:
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 3e39231..70ac8bf 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "\
           file://smart-yaml-error.patch \
           file://smart-channelsdir.patch \
           file://smart-conflict-provider.patch \
+          file://smart-flag-ignore-recommends.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.8.1.2


