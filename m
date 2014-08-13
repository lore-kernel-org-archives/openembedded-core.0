Return-Path: <aymeric.dumaz@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B68760CFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 00:20:34 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so6644961wib.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 17:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=W10NSM5llDG8mgyKQQwwwYfSVh20mRUFEyAi4xrCI80=;
	b=VEjYeIhWby+TMtKf+S8r0o5qGEdmNVMgWPpBz1k12t40Cc2QmneKOrVW+G00rjV992
	TQF++htUJ/tfIZVNoQI270XoYGjvQ+Niu7aXDaMtRFG7a+Wn8DOQJ1Vd2G6qQGSsp9nZ
	cUjKXsaVqTuzVaHXK93Qz6Vfje7AtMRvtq4FJGHsR0jVGdLIOE4QwKWLkUjN0EryX3b2
	9b51+BaSWtKhsAz+ZI5EujPSczQE5oiuSDMhu5STgGkeVVO46enOnNL9bfSdRMOcgXzO
	nCqE9eCSkbWpGpc0VzxvoPKXTuOmwMeFnMUPMoplLj8HcU4DlhgTfmOWDYKLIs9aLBwq
	Rd6g==
X-Received: by 10.194.103.38 with SMTP id ft6mr1012097wjb.18.1407889235403;
	Tue, 12 Aug 2014 17:20:35 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id q2sm605995wjo.13.2014.08.12.17.20.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Aug 2014 17:20:34 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 02:20:13 +0200
Message-Id: <1407889213-22396-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] package.bbclass: Add ASSUME_SONAME variable
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
X-List-Received-Date: Wed, 13 Aug 2014 00:20:34 -0000

When libraries don't have a SONAME in their section, their name aren't added in
the .list file generated during do_package.
Other recipes are able to build against them but are not able to find them
afterwards, leading to missing dependencies.

For example, with qtbase and proprietary libraries for the OMAP3:
NOTE: Couldn't find shared library provider for libGLESv2.so, used by files:
[...]

This patch add the possibility to manually define a list of librairies that will
be exported in the .list file.
A hack in a lacking-SONAME recipe can be made on package_do_shlibs_append to
copy .list file manually made, but files from others PACKAGES in this recipe
will produce similar warnings during their creation because their name aren't in
the shlib_provider variable.

The darwin_so is not patched because it isn't relying on SONAME.

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a552d9..766e118 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1399,7 +1399,7 @@ python package_do_shlibs() {
                             shlib_provider[s[0]] = {}
                         shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
 
-    def linux_so(file, needed, sonames, renames, pkgver):
+    def linux_so(file, needed, sonames, renames, assumed_sonames, pkgver):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
@@ -1419,8 +1419,15 @@ python package_do_shlibs() {
                 if dep not in needed[pkg]:
                     needed[pkg].append((dep, file, rpath))
             m = re.match("\s+SONAME\s+([^\s]*)", l)
+            this_soname = None
             if m:
                 this_soname = m.group(1)
+            if not this_soname:
+                file_basename = os.path.basename(file)
+                for s in assumed_sonames:
+                    if s in file_basename:
+                        this_soname = s
+            if this_soname:
                 prov = (this_soname, ldir, pkgver)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
@@ -1513,6 +1520,7 @@ python package_do_shlibs() {
         needed[pkg] = []
         sonames = list()
         renames = list()
+        assumed_sonames = (d.getVar('ASSUME_SONAME_' + pkg, True) or "").split()
         for file in pkgfiles[pkg]:
                 soname = None
                 if cpath.islink(file):
@@ -1520,7 +1528,7 @@ python package_do_shlibs() {
                 if targetos == "darwin" or targetos == "darwin8":
                     darwin_so(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file, needed, sonames, renames, pkgver)
+                    ldconfig = linux_so(file, needed, sonames, renames, assumed_sonames, pkgver)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
-- 
1.9.1


