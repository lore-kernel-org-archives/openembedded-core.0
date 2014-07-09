Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E29B770488
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:18:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KID6T019183 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:18:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QipFwCBgtZsk
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 21:18:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69KIArw019176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:18:11 +0100
Message-ID: <1404937084.15985.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Jul 2014 21:18:04 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 2/3] package.bbclass: Generate runtime-rprovides data
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
X-List-Received-Date: Wed, 09 Jul 2014 20:18:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, given a list of rdepends its near impossible to figure out
which ones are potentially invalid and which might be an RPROVIDES of a
package. 

This problem is simple to solve, we can write lookup data into the
pkgdata. This patch does that, accounting for the fact that multiple
packages can RPROVIDE the same thing (particularly with locales). Its
done with symlinks so the performance overhead is minimal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 988e148..7358376 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1134,11 +1134,11 @@ python emit_pkgdata() {
         val = d.getVar('%s_%s' % (var, pkg), True)
         if val:
             f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
-            return
+            return val
         val = d.getVar('%s' % (var), True)
         if val:
             f.write('%s: %s\n' % (var, encode(val)))
-        return
+        return val
 
     def write_extra_pkgs(variants, pn, packages, pkgdatadir):
         for variant in variants:
@@ -1207,7 +1207,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'DESCRIPTION')
         write_if_exists(sf, pkg, 'SUMMARY')
         write_if_exists(sf, pkg, 'RDEPENDS')
-        write_if_exists(sf, pkg, 'RPROVIDES')
+        rprov = write_if_exists(sf, pkg, 'RPROVIDES')
         write_if_exists(sf, pkg, 'RRECOMMENDS')
         write_if_exists(sf, pkg, 'RSUGGESTS')
         write_if_exists(sf, pkg, 'RREPLACES')
@@ -1235,6 +1235,13 @@ python emit_pkgdata() {
         # Symlinks needed for reverse lookups (from the final package name)
         subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
         oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
+        
+        # Symlinks needed for rprovides lookup
+        if rprov:
+            for p in rprov.strip().split():
+                subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
+                bb.utils.mkdirhier(os.path.dirname(subdata_sym))
+                oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
 
         allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
         if not allow_empty:
@@ -1254,7 +1261,7 @@ python emit_pkgdata() {
 
     bb.utils.unlockfile(lf)
 }
-emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse"
+emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then



