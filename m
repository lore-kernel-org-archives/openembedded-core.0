Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECDC6AF67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:10:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2013 10:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="336772853"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.176])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2013 10:09:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:09:02 +0100
Message-Id: <f53241258ebeb8b9a24b075c49586c4fec0566c2.1374772012.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] python-smartpm: fix sometimes reporting no provider instead of conflict
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
X-List-Received-Date: Thu, 25 Jul 2013 17:10:02 -0000

If a requirement of a package is conflicted, depending on how the
solution is reached, Smart's transaction code may eliminate all
providers of the requirement and then error out because nothing provides
them without saying why. To work around this, store a reason and report
that back if we need to, so for example instead of:

  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: no package provides dropbear

we will now get:

  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: unable to install provider for dropbear:
  error:     dropbear-2013.58-r1.0@armv5te is conflicted by openssh-sshd-6.2p2-r0@armv5te

Fixes [YOCTO #4305].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python-smartpm/smart-conflict-provider.patch   | 196 +++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch b/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
new file mode 100644
index 0000000..10a7447
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
@@ -0,0 +1,196 @@
+Report a reason when a dependency could not be installed because it is locked
+
+If a requirement of a package is conflicted, depending on how the
+solution is reached, the transaction code may eliminate all providers
+of the requirement and then error out because nothing provides them. To
+work around this, store a reason in the locked dict and report that back
+if we need to, so for example instead of:
+
+  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: no package provides dropbear
+
+we now get:
+
+  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: unable to install provider for dropbear:
+  error:     dropbear-2013.58-r1.0@armv5te is conflicted by openssh-sshd-6.2p2-r0@armv5te
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ smart/const.py       |  7 +++++++
+ smart/transaction.py | 58 +++++++++++++++++++++++++++++++++++++++++-----------
+ 2 files changed, 53 insertions(+), 12 deletions(-)
+
+diff --git a/smart/const.py b/smart/const.py
+index 4d8e5cb..67c1ac5 100644
+--- a/smart/const.py
++++ b/smart/const.py
+@@ -70,4 +70,11 @@ DATADIR     = "/var/lib/smart/"
+ USERDATADIR = "~/.smart/"
+ CONFFILE    = "config"
+ 
++LOCKED_INSTALL     = Enum('LOCKED_INSTALL')
++LOCKED_REMOVE      = Enum('LOCKED_REMOVE')
++LOCKED_CONFLICT    = Enum('LOCKED_CONFLICT')
++LOCKED_CONFLICT_BY = Enum('LOCKED_CONFLICT_BY')
++LOCKED_NO_COEXIST  = Enum('LOCKED_NO_COEXIST')
++LOCKED_SYSCONF     = Enum('LOCKED_SYSCONF')
++
+ # vim:ts=4:sw=4:et
+diff --git a/smart/transaction.py b/smart/transaction.py
+index 300b9cc..dd9aa38 100644
+--- a/smart/transaction.py
++++ b/smart/transaction.py
+@@ -19,10 +19,31 @@
+ # along with Smart Package Manager; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ #
+-from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP
++from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
+ from smart.cache import PreRequires, Package
+ from smart import *
+ 
++def lock_reason(pkg, lockvalue):
++    try:
++        (reason, otherpkg) = lockvalue
++    except TypeError:
++        reason = None
++        lockvalue = None
++    if reason == LOCKED_INSTALL:
++        return _("%s is to be installed") % pkg
++    elif reason == LOCKED_CONFLICT:
++        return _("%s conflicts with %s") % (pkg, otherpkg)
++    elif reason ==  LOCKED_CONFLICT_BY:
++        return _("%s is conflicted by %s") % (pkg, otherpkg)
++    elif reason ==  LOCKED_NO_COEXIST:
++        return _("%s cannot coexist with %s") % (pkg, otherpkg)
++    elif reason ==  LOCKED_SYSCONF:
++        return _("%s is locked in system configuration") % pkg
++    elif reason ==  LOCKED_REMOVE:
++        return _("%s is to be removed") % pkg
++    else:
++        return _("%s is locked (unknown reason)") % pkg
++
+ class ChangeSet(dict):
+ 
+     def __init__(self, cache, state=None, requested=None):
+@@ -187,7 +208,7 @@ class Policy(object):
+         for pkg in pkgconf.filterByFlag("lock", cache.getPackages()):
+             if pkg not in self._locked:
+                 self._sysconflocked.append(pkg)
+-                self._locked[pkg] = True
++                self._locked[pkg] = (LOCKED_SYSCONF, None)
+ 
+     def runFinished(self):
+         self._priorities.clear()
+@@ -524,7 +545,7 @@ class Transaction(object):
+         if ownpending:
+             pending = []
+ 
+-        locked[pkg] = True
++        locked[pkg] = (LOCKED_INSTALL, None)
+         changeset.set(pkg, INSTALL)
+         isinst = changeset.installed
+ 
+@@ -535,7 +556,7 @@ class Transaction(object):
+                     if prvpkg is pkg:
+                         continue
+                     if not isinst(prvpkg):
+-                        locked[prvpkg] = True
++                        locked[prvpkg] = (LOCKED_CONFLICT_BY, pkg)
+                         continue
+                     if prvpkg in locked:
+                         raise Failed, _("Can't install %s: conflicted package "
+@@ -550,7 +571,7 @@ class Transaction(object):
+                     if cnfpkg is pkg:
+                         continue
+                     if not isinst(cnfpkg):
+-                        locked[cnfpkg] = True
++                        locked[cnfpkg] = (LOCKED_CONFLICT, pkg)
+                         continue
+                     if cnfpkg in locked:
+                         raise Failed, _("Can't install %s: it's conflicted by "
+@@ -565,7 +586,7 @@ class Transaction(object):
+         for namepkg in namepkgs:
+             if namepkg is not pkg and not pkg.coexists(namepkg):
+                 if not isinst(namepkg):
+-                    locked[namepkg] = True
++                    locked[namepkg] = (LOCKED_NO_COEXIST, pkg)
+                     continue
+                 if namepkg in locked:
+                     raise Failed, _("Can't install %s: it can't coexist "
+@@ -577,6 +598,7 @@ class Transaction(object):
+ 
+             # Check if someone is already providing it.
+             prvpkgs = {}
++            lockedpkgs = {}
+             found = False
+             for prv in req.providedby:
+                 for prvpkg in prv.packages:
+@@ -585,6 +607,8 @@ class Transaction(object):
+                         break
+                     if prvpkg not in locked:
+                         prvpkgs[prvpkg] = True
++                    else:
++                        lockedpkgs[prvpkg] = locked[prvpkg]
+                 else:
+                     continue
+                 break
+@@ -597,7 +621,17 @@ class Transaction(object):
+             if not prvpkgs:
+                 # No packages provide it at all. Give up.
+                 if req in pkg.requires:
+-                    raise Failed, _("Can't install %s: no package provides %s") % \
++                    reasons = []
++                    for prv in req.providedby:
++                        for prvpkg in prv.packages:
++                            lockedres = lockedpkgs.get(prvpkg, None)
++                            if lockedres:
++                                reasons.append(lock_reason(prvpkg, lockedres))
++                    if reasons:
++                        raise Failed, _("Can't install %s: unable to install provider for %s:\n    %s") % \
++                                (pkg, req, '\n    '.join(reasons))
++                    else:
++                        raise Failed, _("Can't install %s: no package provides %s") % \
+                                 (pkg, req)
+                 else:
+                     # It's only a recommend, skip
+@@ -627,7 +661,7 @@ class Transaction(object):
+         if ownpending:
+             pending = []
+ 
+-        locked[pkg] = True
++        locked[pkg] = (LOCKED_REMOVE, None)
+         changeset.set(pkg, REMOVE)
+         isinst = changeset.installed
+ 
+@@ -1140,22 +1174,22 @@ class Transaction(object):
+                 if op is KEEP:
+                     if pkg in changeset:
+                         del changeset[pkg]
+-                    locked[pkg] = True
++                    locked[pkg] = (LOCKED_KEEP, None)
+                 elif op is INSTALL:
+                     if not isinst(pkg) and pkg in locked:
+                         raise Failed, _("Can't install %s: it's locked") % pkg
+                     changeset.set(pkg, INSTALL)
+-                    locked[pkg] = True
++                    locked[pkg] = (LOCKED_INSTALL, None)
+                 elif op is REMOVE:
+                     if isinst(pkg) and pkg in locked:
+                         raise Failed, _("Can't remove %s: it's locked") % pkg
+                     changeset.set(pkg, REMOVE)
+-                    locked[pkg] = True
++                    locked[pkg] = (LOCKED_REMOVE, None)
+                 elif op is REINSTALL:
+                     if pkg in locked:
+                         raise Failed, _("Can't reinstall %s: it's locked")%pkg
+                     changeset.set(pkg, INSTALL, force=True)
+-                    locked[pkg] = True
++                    locked[pkg] = (LOCKED_INSTALL, None)
+                 elif op is UPGRADE:
+                     pass
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 0cf3847..3e39231 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
           file://smart-multilib-fixes.patch \
           file://smart-yaml-error.patch \
           file://smart-channelsdir.patch \
+          file://smart-conflict-provider.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.8.1.2


