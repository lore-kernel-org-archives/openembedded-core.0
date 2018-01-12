Return-Path: <zboszor@pr.hu>
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id 93C0378843
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 13:47:14 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1eZzfw-0004eJ-2V
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Jan 2018 14:47:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jjLPC8vcAesIcWMHHbLEqOTIpqT2yGxDOufjGcnwXwU=;
	b=UycheDvOKOsoVS28vgNAIrsW27
	9mhOy7QRg6ALpXiYRkCGBH+zU3KrrPHsF4QtCTWk61pMJfkNn12IL6+wsCfPLq7Wl6Y/iF1/Nmv6Y
	6+qAxZITgqbDCaq6OYw1LCAEOnQJxOMX2t5JMBnPi8DSmFAxsC/0DDvC5u2bmO4uiQMqsHfkIHzLz
	LErxTUUul1OMzwzAOH3IAU+u0jGFweMVolFm/1qanc1Iu+Y2h5FXgnFR0lMQ530xpHjC9Zxvy1y7M
	sWVRKJVHQZQyF2EswlNVbTS+qmVkKUlBsVLIpIwd97eHiDcF7WVRs/lEuBH4ShlqGczLlcxlTXj/q
	btIko9kw==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1eZzfs-0005pv-6o; Fri, 12 Jan 2018 14:47:13 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 14:46:59 +0100
Message-Id: <20180112134659.5793-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.2 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: When downgrading a package or using a substitute with lower
	version,
	the way to do it is adding or increasing PE and there may be other
	reasons to set PE. But it doesn't directly help dependant packages
	because the shlib records only contain PV. [...]
X-Scan-Signature: f5cb7a90ddeec5a6d5116dfd0ac1247e
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180112134713Z
Subject: [PATCH v2] package: Record PE and PR values for shlib dependencies
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
X-List-Received-Date: Fri, 12 Jan 2018 13:47:15 -0000
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

Signed-off-by: Zoltán Böszörményi <zboszor@pr.hu>
---
 meta/classes/package.bbclass | 41 ++++++++++++++++++++++++++---------------
 meta/lib/oe/package.py       |  4 +++-
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dc759699f..95a3be774f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1560,7 +1560,7 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
-    def linux_so(file, needed, sonames, renames, pkgver):
+    def linux_so(file, needed, sonames, renames, pkgver, pkgpr):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
@@ -1582,7 +1582,7 @@ python package_do_shlibs() {
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
-                prov = (this_soname, ldir, pkgver)
+                prov = (this_soname, ldir, pkgver, pkgpr)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or this_soname not in private_libs:
@@ -1593,7 +1593,7 @@ python package_do_shlibs() {
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return needs_ldconfig
 
-    def darwin_so(file, needed, sonames, renames, pkgver):
+    def darwin_so(file, needed, sonames, renames, pkgver, pkgpr):
         if not os.path.exists(file):
             return
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
@@ -1618,7 +1618,7 @@ python package_do_shlibs() {
             combos = get_combinations(name)
             for combo in combos:
                 if not combo in sonames:
-                    prov = (combo, ldir, pkgver)
+                    prov = (combo, ldir, pkgver, pkgpr)
                     sonames.append(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
@@ -1645,13 +1645,13 @@ python package_do_shlibs() {
                 if name and name not in needed[pkg]:
                      needed[pkg].append((name, file, []))
 
-    def mingw_dll(file, needed, sonames, renames, pkgver):
+    def mingw_dll(file, needed, sonames, renames, pkgver, pkgpr):
         if not os.path.exists(file):
             return
 
         if file.endswith(".dll"):
             # assume all dlls are shared objects provided by the package
-            sonames.append((os.path.basename(file), os.path.dirname(file).replace(pkgdest + "/" + pkg, ''), pkgver))
+            sonames.append((os.path.basename(file), os.path.dirname(file).replace(pkgdest + "/" + pkg, ''), pkgver, pkgpr))
 
         if (file.endswith(".dll") or file.endswith(".exe")):
             # use objdump to search for "DLL Name: .*\.dll"
@@ -1686,6 +1686,12 @@ python package_do_shlibs() {
         if not pkgver:
             pkgver = ver
 
+        pkgpe = d.getVar('PE')
+        if pkgpe:
+            pkgver = pkgpe + ':' + pkgver
+
+        pkgpr = d.getVar('PR')
+
         needed[pkg] = []
         sonames = list()
         renames = list()
@@ -1694,11 +1700,11 @@ python package_do_shlibs() {
                 if cpath.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-                    darwin_so(file, needed, sonames, renames, pkgver)
+                    darwin_so(file, needed, sonames, renames, pkgver, pkgpr)
                 elif targetos.startswith("mingw"):
-                    mingw_dll(file, needed, sonames, renames, pkgver)
+                    mingw_dll(file, needed, sonames, renames, pkgver, pkgpr)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file, needed, sonames, renames, pkgver)
+                    ldconfig = linux_so(file, needed, sonames, renames, pkgver, pkgpr)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
@@ -1710,14 +1716,14 @@ python package_do_shlibs() {
             fd = open(shlibs_file, 'w')
             for s in sonames:
                 if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
-                    (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
+                    (old_pkg, old_pkgver, old_pkgpr) = shlib_provider[s[0]][s[1]]
                     if old_pkg != pkg:
-                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
+                        bb.warn('%s-%s-%s was registered as shlib provider for %s, changing it to %s-%s-%s because it was built later' % (old_pkg, old_pkgver, old_pkgpr, s[0], pkg, pkgver, pkgpr))
                 bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
-                fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
+                fd.write(s[0] + ':' + s[1] + ':' + s[2].replace(':', '#', 1) + ':' + s[3] + '\n')
                 if s[0] not in shlib_provider:
                     shlib_provider[s[0]] = {}
-                shlib_provider[s[0]][s[1]] = (pkg, pkgver)
+                shlib_provider[s[0]][s[1]] = (pkg, pkgver, pkgpr)
             fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
@@ -1769,15 +1775,20 @@ python package_do_shlibs() {
                         match = p
                         break
                 if match:
-                    (dep_pkg, ver_needed) = shlib_provider[n[0]][match]
+                    (dep_pkg, ver_needed, pr_needed) = shlib_provider[n[0]][match]
 
                     bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n[0], dep_pkg, n[1]))
 
                     if dep_pkg == pkg:
                         continue
 
+                    if pr_needed and pr_needed != 'r0':
+                        pr_needed = '-' + pr_needed
+                    else:
+                        pr_needed = ''
+
                     if ver_needed:
-                        dep = "%s (>= %s)" % (dep_pkg, ver_needed)
+                        dep = "%s (>= %s%s)" % (dep_pkg, ver_needed, pr_needed)
                     else:
                         dep = dep_pkg
                     if not dep in deps:
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa8e1..32d7d24317 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -256,9 +256,11 @@ def read_shlib_providers(d):
                 fd.close()
                 for l in lines:
                     s = l.strip().split(":")
+                    while len(s) < 4:
+                        s.append('')
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
-                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
+                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2].replace('#', ':', 1), s[3])
     return shlib_provider
 
 
-- 
2.14.3


