Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA26607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMsPwC022241 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:54:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sqgh0lZaHXmm
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:54:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GMsBiU022233
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:54:22 +0100
Message-ID: <1437087251.22526.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 23:54:11 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] python-smartpm: Improve warnings/errors consistency
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
X-List-Received-Date: Thu, 16 Jul 2015 22:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sadly, smart is not deterministic so the same build can go down multiple different
pathways. We'd expect to see the same warnings however depending on the pathway
taken, it may or may not warn, particularly with Recommends since they're optional.

For example, where a Recommended package is available but has Conflicts, we'd expect
to see an warning that we couldn't install it. Some code paths silently hide this
(its a LOCKED_CONFLICT). We add printing of warnings for this case.

Also, if there are two compatible feeds available (e.g. i586 and core2_32), this 
changes the code path from direct _install() to _pending() since there are multiple
providers. This patch adds warning handling to _pending() so we don't hit hard 
failures there. This is as seen with the mysterious libspeexdsp failures for x86-lsb
on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt-fix.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt-fix.patch
new file mode 100644
index 0000000..51a057b
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt-fix.patch
@@ -0,0 +1,158 @@
+Sadly, smart is not deterministic so the same build can go down multiple different
+pathways. We'd expect to see the same warnings however depending on the pathway
+taken, it may or may not warn, particularly with Recommends since they're optional.
+
+For example, where a Recommended package is available but has Conflicts, we'd expect
+to see an warning that we couldn't install it. Some code paths silently hide this
+(its a LOCKED_CONFLICT). We add printing of warnings for this case.
+
+Also, if there are two compatible feeds available (e.g. i586 and core2_32), this 
+changes the code path from direct _install() to _pending() since there are multiple
+providers. This patch adds warning handling to _pending() so we don't hit hard 
+failures there. This is as seen with the mysterious libspeexdsp failures for x86-lsb
+on the autobuilder.
+
+Upstream-Status: Pending
+RP
+2015/7/16
+
+Index: git/smart/transaction.py
+===================================================================
+--- git.orig/smart/transaction.py
++++ git/smart/transaction.py
+@@ -651,13 +651,14 @@ class Transaction(object):
+ 
+             if not prvpkgs:
+                 # No packages provide it at all. Give up.
++
++                reasons = []
++                for prv in req.providedby:
++                    for prvpkg in prv.packages:
++                        lockedres = lockedpkgs.get(prvpkg, None)
++                        if lockedres:
++                            reasons.append(lock_reason(prvpkg, lockedres))
+                 if reqrequired:
+-                    reasons = []
+-                    for prv in req.providedby:
+-                        for prvpkg in prv.packages:
+-                            lockedres = lockedpkgs.get(prvpkg, None)
+-                            if lockedres:
+-                                reasons.append(lock_reason(prvpkg, lockedres))
+                     if reasons:
+                         raise Failed, _("Can't install %s: unable to install provider for %s:\n    %s") % \
+                                 (pkg, req, '\n    '.join(reasons))
+@@ -665,7 +666,11 @@ class Transaction(object):
+                         raise Failed, _("Can't install %s: no package provides %s") % \
+                                 (pkg, req)
+                 else:
++                    if reasons:
++                        iface.warning(_("Can't install %s: unable to install provider for %s:\n    %s") % \
++                                (pkg, req, '\n    '.join(reasons)))
++
+                     # It's only a recommend, skip
+                     continue
+ 
+             if len(prvpkgs) == 1:
+@@ -846,6 +852,14 @@ class Transaction(object):
+         isinst = changeset.installed
+         getweight = self._policy.getWeight
+ 
++        attempt = sysconf.has("attempt-install", soft=True)
++
++        def handle_failure(msg):
++            if attempt:
++                iface.warning(msg)
++            else:
++                raise Failed, msg
++
+         updown = []
+         while pending:
+             item = pending.pop(0)
+@@ -870,8 +884,9 @@ class Transaction(object):
+ 
+                 if not prvpkgs:
+                     # No packages provide it at all. Give up.
+-                    raise Failed, _("Can't install %s: no package "
+-                                    "provides %s") % (pkg, req)
++                    handle_failure(_("Can't install %s: no package "
++                                    "provides %s") % (pkg, req))
++                    continue
+ 
+                 if len(prvpkgs) > 1:
+                     # More than one package provide it. We use _pending here,
+@@ -894,9 +909,10 @@ class Transaction(object):
+                                                  keeporder, cs, lk))
+                             keeporder += 0.000001
+                     if not alternatives:
+-                        raise Failed, _("Can't install %s: all packages "
++                        handle_failure(_("Can't install %s: all packages "
+                                         "providing %s failed to install:\n%s")\
+-                                      % (pkg, req,  "\n".join(failures))
++                                      % (pkg, req,  "\n".join(failures)))
++                        continue
+                     alternatives.sort()
+                     changeset.setState(alternatives[0][1])
+                     if len(alternatives) == 1:
+@@ -954,18 +970,20 @@ class Transaction(object):
+ 
+                     for reqpkg in reqpkgs:
+                         if reqpkg in locked and isinst(reqpkg):
+-                            raise Failed, _("Can't remove %s: requiring "
++                            handle_failure(_("Can't remove %s: requiring "
+                                             "package %s is locked") % \
+-                                          (pkg, reqpkg)
++                                          (pkg, reqpkg))
++                            continue
+                     for reqpkg in reqpkgs:
+                         # We check again, since other actions may have
+                         # changed their state.
+                         if not isinst(reqpkg):
+                             continue
+                         if reqpkg in locked:
+-                            raise Failed, _("Can't remove %s: requiring "
++                            handle_failure(_("Can't remove %s: requiring "
+                                             "package %s is locked") % \
+-                                          (pkg, reqpkg)
++                                          (pkg, reqpkg))
++                            continue
+                         self._remove(reqpkg, changeset, locked,
+                                      pending, depth)
+                     continue
+@@ -978,12 +996,14 @@ class Transaction(object):
+                 try:
+                     for reqpkg in reqpkgs:
+                         if reqpkg in locked and isinst(reqpkg):
+-                            raise Failed, _("%s is locked") % reqpkg
++                            handle_failure(_("%s is locked") % reqpkg)
++                            continue
+                     for reqpkg in reqpkgs:
+                         if not cs.installed(reqpkg):
+                             continue
+                         if reqpkg in lk:
+-                            raise Failed, _("%s is locked") % reqpkg
++                            handle_failure(_("%s is locked") % reqpkg)
++                            continue
+                         self._remove(reqpkg, cs, lk, None, depth)
+                 except Failed, e:
+                     failures.append(unicode(e))
+@@ -991,9 +1011,10 @@ class Transaction(object):
+                     alternatives.append((getweight(cs), cs, lk))
+ 
+                 if not alternatives:
+-                    raise Failed, _("Can't install %s: all packages providing "
++                    handle_failure(_("Can't install %s: all packages providing "
+                                     "%s failed to install:\n%s") \
+-                                  % (pkg, prv,  "\n".join(failures))
++                                  % (pkg, prv,  "\n".join(failures)))
++                    continue
+ 
+                 alternatives.sort()
+                 changeset.setState(alternatives[0][1])
+@@ -1246,6 +1267,7 @@ class Transaction(object):
+                             changeset.setRequested(pkg, True)
+                     except Failed, e:
+                         if sysconf.has("attempt-install", soft=True):
++                            iface.warning(_("Can't install %s: %s") % (pkg, str(e)))
+                             if pkg in changeset:
+                                 del changeset[pkg]
+                             continue
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 18df892..163461e 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "\
           file://smart-improve-error-reporting.patch \
           file://smart-channelsdir.patch \
           file://smart-attempt.patch \
+          file://smart-attempt-fix.patch \
           file://smart-rpm4-fixes.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
           file://smart-already-installed-message.patch \



