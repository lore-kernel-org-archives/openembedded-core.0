Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52F177080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 14:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9RE5v6w020334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 07:05:57 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 07:05:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2015 07:05:55 -0700
Message-ID: <6aacdcc20175b509fa9adca8a7bfa861e443ee09.1445954460.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1445954460.git.liezhi.yang@windriver.com>
References: <cover.1445954460.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-smartpm-native: prefer same arch when install
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
X-List-Received-Date: Tue, 27 Oct 2015 14:05:58 -0000
Content-Type: text/plain

We had made smart install multilib RDEPENDS correctly from
package_manager.py, but it couldn't handle RRECOMMANDS, this patch fix
the issue from python-smartpm-native, and make it work well.

The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use
pkg_A's arch when possible.

This patch fixed:
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
RPM_PREFER_ELF_ARCH = "1"
IMAGE_INSTALL_append = " lib32-connman-gnome"
MACHINE = "qemux86-64"

$ bitbake core-image-sato

Only 64bit loaders like libgdk-pixbuf-2.0-loader-jpeg and
libgdk-pixbuf-2.0-loader-png were installed before this patch since they
are in RRECOMMANDS, now both 32bit and 64bit are installed.

This patch is for native only to minimize the impact for this release,
the main problem is the "if attempt:", otherwise, more packages like
lib32-libc6-dev will be installed when populate_sdk, but only libc6-dev
were installed before. We need reconstruct the way that we install the
complentary packages in future release, the "if attempt:" make they work
together atm.

[YOCTO #8570]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python-smartpm/smart-prefer-same-arch.patch    |  119 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |    2 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-prefer-same-arch.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-prefer-same-arch.patch b/meta/recipes-devtools/python/python-smartpm/smart-prefer-same-arch.patch
new file mode 100644
index 0000000..b1305b5
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-prefer-same-arch.patch
@@ -0,0 +1,119 @@
+From 1749592a76425449c1f3119fb14db3f5e14226ed Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 27 Oct 2015 06:20:45 -0700
+Subject: [PATCH] smart/transaction.py: prefer same arch when install
+
+We had made smart install multilib RDEPENDS correctly from
+package_manager.py, but it couldn't handle RRECOMMANDS, this patch fix
+the issue from python-smartpm-native, and make it work well.
+
+The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use
+pkg_A's arch when possible.
+
+This patch fixed:
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+RPM_PREFER_ELF_ARCH = "1"
+IMAGE_INSTALL_append = " lib32-connman-gnome"
+MACHINE = "qemux86-64"
+
+$ bitbake core-image-sato
+
+Only 64bit loaders like libgdk-pixbuf-2.0-loader-jpeg and
+libgdk-pixbuf-2.0-loader-png were installed before this patch since they
+are in RRECOMMANDS, now both 32bit and 64bit are installed.
+
+This patch is for native only to minimize the impact for this release,
+the main problem is the "if attempt:", otherwise, more packages like
+lib32-libc6-dev will be installed when populate_sdk, but only libc6-dev
+were installed before. We need reconstruct the way that we install the
+complentary packages in future release, the "if attempt:" make they work
+together atm.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ smart/transaction.py |   28 +++++++++++++++++++++++++---
+ 1 file changed, 25 insertions(+), 3 deletions(-)
+
+diff --git a/smart/transaction.py b/smart/transaction.py
+index f022aae..63a837c 100644
+--- a/smart/transaction.py
++++ b/smart/transaction.py
+@@ -22,6 +22,7 @@
+ from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_EXCLUDE, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
+ from smart.cache import PreRequires, Package
+ from smart import *
++from smart.backends.rpm.rpmver import splitarch
+ 
+ def lock_reason(pkg, lockvalue):
+     try:
+@@ -618,6 +619,7 @@ class Transaction(object):
+                     self._remove(namepkg, changeset, locked, pending, depth)
+ 
+         # Install packages required by this one.
++        pkgarch = splitarch(pkg.version)[1]
+         for req in pkg.requires + pkg.recommends:
+ 
+             reqrequired = req in pkg.requires
+@@ -626,6 +628,8 @@ class Transaction(object):
+             prvpkgs = {}
+             lockedpkgs = {}
+             found = False
++            found_same_arch = False
++            same_arch_in_provides = False
+             for prv in req.providedby:
+                 for prvpkg in prv.packages:
+                     if not reqrequired:
+@@ -633,9 +637,19 @@ class Transaction(object):
+                             continue
+                         elif pkgconf.testFlag("ignore-recommends", prvpkg):
+                             continue
++                    prvpkgarch = splitarch(prvpkg.version)[1]
++                    if pkgarch == prvpkgarch:
++                        # Found a same arch in provides
++                        same_arch_in_provides = True
+                     if isinst(prvpkg):
+                         found = True
+-                        break
++                        if attempt:
++                            break
++                        if pkgarch == prvpkgarch:
++                            # Found the best match
++                            found_same_arch = True
++                            break
++                        continue
+                     if prvpkg not in locked:
+                         prvpkgs[prvpkg] = True
+                     else:
+@@ -643,7 +657,7 @@ class Transaction(object):
+                 else:
+                     continue
+                 break
+-            if found:
++            if found_same_arch or (found and attempt) or (found and not same_arch_in_provides):
+                 # Someone is already providing it. Good.
+                 continue
+ 
+@@ -672,7 +686,15 @@ class Transaction(object):
+ 
+                     # It's only a recommend, skip
+                     continue
+-
++            if len(prvpkgs) > 1 and not attempt:
++                prvarchs = set()
++                for prv in prvpkgs:
++                    prvarchs.add(splitarch(prv.version)[1])
++                if pkgarch in prvarchs:
++                    # Prefer the one which has the same arch
++                    for prv in prvpkgs.copy():
++                        if splitarch(prv.version)[1] != pkgarch:
++                                del prvpkgs[prv]
+             if len(prvpkgs) == 1:
+                 # Don't check locked here. prvpkgs was
+                 # already filtered above.
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index d6c378b..1ebf590 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -26,6 +26,8 @@ SRC_URI = "\
           file://smart-cache.py-getPackages-matches-name-version.patch \
          "
 
+SRC_URI_append_class-native = "file://smart-prefer-same-arch.patch"
+
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
 PV = "1.5+git${SRCPV}"
 
-- 
1.7.9.5


