Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD5A70200
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 20:43:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s67Kh4nG016388 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 21:43:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jbR9e0xKv6Mm
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 21:43:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s67Kgxta016383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 21:43:01 +0100
Message-ID: <1404765774.1458.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Jul 2014 21:42:54 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 2/4] package.bbclass: Rewrite sonames data structure to include library path
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
X-List-Received-Date: Mon, 07 Jul 2014 20:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


In order to do more advanced processing of the shared libraries, we need
to know where a given library is located on disk so we can know whether
its a system path or a private directory for example.

This patch adds this information into the 'sonames' data structure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1ef0c66..bc91e9f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1384,7 +1384,7 @@ python package_do_shlibs() {
 
     def linux_so(file, needed, sonames, renames):
         needs_ldconfig = False
-        ldir = os.path.dirname(file).replace(pkgdest, '')
+        ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
@@ -1404,10 +1404,11 @@ python package_do_shlibs() {
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
-                if not this_soname in sonames:
+                prov = (this_soname, ldir)
+                if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or this_soname not in private_libs:
-                        sonames.append(this_soname)
+                        sonames.append(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
@@ -1417,6 +1418,7 @@ python package_do_shlibs() {
     def darwin_so(file, needed, sonames, renames):
         if not os.path.exists(file):
             return
+        ldir = os.path.dirname(file).replace(pkgdest, '')
 
         def get_combinations(base):
             #
@@ -1438,7 +1440,8 @@ python package_do_shlibs() {
             combos = get_combinations(name)
             for combo in combos:
                 if not combo in sonames:
-                    sonames.append(combo)
+                    prov = (combo, ldir)
+                    sonames.append(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             lafile = file.replace(os.path.join(pkgdest, pkg), d.getVar('PKGD', True))
             # Drop suffix
@@ -1521,13 +1524,13 @@ python package_do_shlibs() {
         if len(sonames):
             fd = open(shlibs_file, 'w')
             for s in sonames:
-                if s in shlib_provider:
-                    (old_pkg, old_pkgver) = shlib_provider[s]
+                if s[0] in shlib_provider:
+                    (old_pkg, old_pkgver) = shlib_provider[s[0]]
                     if old_pkg != pkg:
-                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s, pkg, pkgver))
-                bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s))
-                fd.write(s + '\n')
-                shlib_provider[s] = (pkg, pkgver)
+                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
+                bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
+                fd.write(s[0] + '\n')
+                shlib_provider[s[0]] = (pkg, pkgver)
             fd.close()
             fd = open(shver_file, 'w')
             fd.write(pkgver + '\n')




