Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4C96093A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:11:31 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1ehEeM-0005sF-BV
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Feb 2018 14:11:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+YFfP8HYEeagbclgl97SxS7L7yjhnroKOeTD8ANA+6k=;
	b=nB4beoOde/Lj5L2ktemv9TjUKf
	z5044RsIB7Neq0buNBq5ncmGantqj552CJuQM8Bq+7zIiWngWs2L7b9quWSCOe/lVisFtJJaSe644
	ep6mhOgr4rWZFRkpsEBoZBAwEpsrHnFluI86DmA59SIzpjpDd9oul5VV3P90VZoSKCPY00C918DNL
	h60HkX6v4FTSpBjJVkE/bzw8HjNx1nJC0NVnSPddzZ9qSHGQSEHoVhYu+XYbobIb1Rh3uZ9EGK5+S
	9DkyyKEEIO9h5uR6FOqJfd5QlleR+Dz4rQxlEcKSCJ4ZtPR+9PWAHqcaJN1m19QOz0CHJUWG4EF7v
	6zjaZ8Xg==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ehEeG-0006LA-CA; Thu, 01 Feb 2018 14:11:30 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:10:55 +0100
Message-Id: <20180201131055.4855-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Scan-Signature: 95b4cc0dcd527d9223de7ebc14f45880
X-Spam-Tracer: backend.mail.pr.hu -0.4 20180201131130Z
Subject: [PATCH] package: Record PE and PR values for shlib dependencies
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
X-List-Received-Date: Thu, 01 Feb 2018 13:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When downgrading a package or using a substitute with lower version,
the way to do it is adding or increasing PE and there may be other
reasons to set PE.

But it doesn't directly help dependant packages because the shlib
records only contain PV.

Let's add the PE value into the shlib records for packages where
it's set.

The in-memory variables storing the versions now use the PE:PV
notation but the on-disk files must use something else because
the : character is already used as field delimiter in the package.list
files storing the shlib records. Use # instead in the files,
so the file format doesn't change. Conversion occurs on reading
and writing the package.list files.

v2:

Also store PR in a new 4th field in the shlib records. If it's set,
i.e. it's different from "r0" then it will also be used in the
packages for shared library dependencies.

v3:

Store PE and PR in the 4th and 5th fields in the shlib records
and use variable STRICT_PE_PR_DEPS to activate the new behavior
to preserve compatibility with the old ways.
The presence of STRICT_PE_PR_DEPS is used both for storing PE and
PR in the shlib records and for setting it in the binary packages.
This way, it can be used as a distro-wide or per-recipe setting.

Signed-off-by: Zoltán Böszörményi <zboszor@pr.hu>
---
 meta/classes/package.bbclass | 60 +++++++++++++++++++++++++++++++++-----------
 meta/lib/oe/package.py       |  4 ++-
 2 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a7f35a3e7..8207acd540 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1580,7 +1580,7 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
-    def linux_so(file, needed, sonames, renames, pkgver):
+    def linux_so(file, needed, sonames, renames, pkgver, pkgpe, pkgpr):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
@@ -1602,7 +1602,7 @@ python package_do_shlibs() {
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
-                prov = (this_soname, ldir, pkgver)
+                prov = (this_soname, ldir, pkgver, pkgpe, pkgpr)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or this_soname not in private_libs:
@@ -1613,7 +1613,7 @@ python package_do_shlibs() {
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return needs_ldconfig
 
-    def darwin_so(file, needed, sonames, renames, pkgver):
+    def darwin_so(file, needed, sonames, renames, pkgver, pkgpe, pkgpr):
         if not os.path.exists(file):
             return
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
@@ -1638,7 +1638,7 @@ python package_do_shlibs() {
             combos = get_combinations(name)
             for combo in combos:
                 if not combo in sonames:
-                    prov = (combo, ldir, pkgver)
+                    prov = (combo, ldir, pkgver, pkgpe, pkgpr)
                     sonames.append(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
@@ -1665,13 +1665,13 @@ python package_do_shlibs() {
                 if name and name not in needed[pkg]:
                      needed[pkg].append((name, file, []))
 
-    def mingw_dll(file, needed, sonames, renames, pkgver):
+    def mingw_dll(file, needed, sonames, renames, pkgver, pkgpe, pkgpr):
         if not os.path.exists(file):
             return
 
         if file.endswith(".dll"):
             # assume all dlls are shared objects provided by the package
-            sonames.append((os.path.basename(file), os.path.dirname(file).replace(pkgdest + "/" + pkg, ''), pkgver))
+            sonames.append((os.path.basename(file), os.path.dirname(file).replace(pkgdest + "/" + pkg, ''), pkgver, pkgpe, pkgpr))
 
         if (file.endswith(".dll") or file.endswith(".exe")):
             # use objdump to search for "DLL Name: .*\.dll"
@@ -1706,6 +1706,24 @@ python package_do_shlibs() {
         if not pkgver:
             pkgver = ver
 
+        pkgpe = d.getVar('PE')
+        pkgpr = d.getVar('PR')
+        if pkgpr == 'r0':
+           pkgpr = ''
+
+        strict_deps = d.getVar('STRICT_PE_PR_DEPS')
+
+        if strict_deps:
+            dep_pe = pkgpe
+            if dep_pe:
+                dep_pe = dep_pe + ':'
+            dep_pr = pkgpr
+            if dep_pr:
+               dep_pr = '-' + dep_pr
+        else:
+            dep_pe = ''
+            dep_pr = ''
+
         needed[pkg] = []
         sonames = list()
         renames = list()
@@ -1714,11 +1732,11 @@ python package_do_shlibs() {
                 if cpath.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-                    darwin_so(file, needed, sonames, renames, pkgver)
+                    darwin_so(file, needed, sonames, renames, pkgver, pkgpe, pkgpr)
                 elif targetos.startswith("mingw"):
-                    mingw_dll(file, needed, sonames, renames, pkgver)
+                    mingw_dll(file, needed, sonames, renames, pkgver, pkgpe, pkgpr)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file, needed, sonames, renames, pkgver)
+                    ldconfig = linux_so(file, needed, sonames, renames, pkgver, pkgpe, pkgpr)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
@@ -1730,14 +1748,14 @@ python package_do_shlibs() {
             fd = open(shlibs_file, 'w')
             for s in sonames:
                 if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
-                    (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
+                    (old_pkg, old_pkgver, old_pkgpe, old_pkgpr) = shlib_provider[s[0]][s[1]]
                     if old_pkg != pkg:
-                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
+                        bb.warn('%s-%s%s%s was registered as shlib provider for %s, changing it to %s-%s%s%s because it was built later' % (old_pkg, ((old_pkgpe + ':') if old_pkgpe else ''), old_pkgver, (('-' + old_pkgpr) if old_pkgpr else '' ), s[0], pkg, ((pkgpe + ':') if pkgpe else ''), pkgver, (('-' + pkgpr) if pkgpr else '')))
                 bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
-                fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
+                fd.write(s[0] + ':' + s[1] + ':' + s[2] + ':' + s[3] + ':' + s[4] + '\n')
                 if s[0] not in shlib_provider:
                     shlib_provider[s[0]] = {}
-                shlib_provider[s[0]][s[1]] = (pkg, pkgver)
+                shlib_provider[s[0]][s[1]] = (pkg, pkgver, pkgpe, pkgpr)
             fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
@@ -1769,6 +1787,8 @@ python package_do_shlibs() {
     for pkg in packages.split():
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
+        strict_deps = d.getVar('STRICT_PE_PR_DEPS')
+
         deps = list()
         for n in needed[pkg]:
             # if n is in private libraries, don't try to search provider for it
@@ -1789,15 +1809,25 @@ python package_do_shlibs() {
                         match = p
                         break
                 if match:
-                    (dep_pkg, ver_needed) = shlib_provider[n[0]][match]
+                    (dep_pkg, ver_needed, pe_needed, pr_needed) = shlib_provider[n[0]][match]
 
                     bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n[0], dep_pkg, n[1]))
 
                     if dep_pkg == pkg:
                         continue
 
+                    if strict_deps and pe_needed:
+                        pe_needed = pe_needed + ':'
+                    else:
+                        pe_needed = ''
+
+                    if strict_deps and pr_needed and pr_needed != 'r0':
+                        pr_needed = '-' + pr_needed
+                    else:
+                        pr_needed = ''
+
                     if ver_needed:
-                        dep = "%s (>= %s)" % (dep_pkg, ver_needed)
+                        dep = "%s (>= %s%s%s)" % (dep_pkg, pe_needed, ver_needed, pr_needed)
                     else:
                         dep = dep_pkg
                     if not dep in deps:
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa8e1..fa6de34d78 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -256,9 +256,11 @@ def read_shlib_providers(d):
                 fd.close()
                 for l in lines:
                     s = l.strip().split(":")
+                    while len(s) < 5:
+                        s.append('')
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
-                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
+                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2], s[3], s[4])
     return shlib_provider
 
 
-- 
2.14.3


