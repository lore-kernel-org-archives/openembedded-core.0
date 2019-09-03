Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFF77F29F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:29:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r17so307857wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vST/td2s0tpC2d5Ie9hGM3nrKztrvbd1awq1dSWFGhs=;
	b=XNbF/8XQhuqirlvMJzvFlUywYHIPIy3xXZjeTilHa66g43cO20b1C73nBtnGlafRVI
	DmCtpizLSciBaaUa8H4bYBJaIBMZBtZ50ssYvrwPkAlVzs0yX2dT+Y53CxReeJvJ9t1C
	m4zeusijNkBjBCRf/4JfYvqqIGN1mjWEJK1Nl5XeMiFrZdZIzhU6AXZB3d10sEBtZVzt
	UmddWCyi0tlw7s7K1ddalyX0TMWjzToJt1KNRffV1pilOtW1pnrzipO/zWvs4goNpf2u
	y2sEkOFKYQ5BCITjRFI2EQ7xnesY7Q8RyzW0FYuvWE3EVchi8M+KPgpxPaz8XYdm24X8
	7p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vST/td2s0tpC2d5Ie9hGM3nrKztrvbd1awq1dSWFGhs=;
	b=I8nhI7mS1lhYDd2bTmwvuO3d0h+dKPvtKAUVHoBk4Vlnj/FCBhskUnCB7Bsjuse6bi
	Z/s+xO4YUk4kTxJHugGmSL/OdMLLYKORMOigKSFdUJ8A9gUC4xTBqbtriicza+xZhqlp
	b2H4xe/VIue+o7DSaT4LXZyDd2o2f+qHpIOeMGjrEAzgZcSdR4xwDS/O2NF655rCIiro
	NrFOslvKt0mXZkVCYL1GNkbbLf+TGqxjunNOEsYSabLm4ejquKiuk4RgJiidnHvrb1te
	y8m/08O7OyfTk0rQ7XXnRo/nJ++WW1Gx4PlCUnopx1y/aZ9JjxQAQdvAuY69X4iYWlab
	98Ww==
X-Gm-Message-State: APjAAAW+/rYhq42DSjbyAA6SbeTY6/VVRXgcRaPtU9LNs+Q3YDK7RSIn
	EFORKttJeTm1/FjSgWYoftHKpIvD
X-Google-Smtp-Source: APXvYqy1ur6jejkkghsrIEURlA24ttKvDqiANPRxXY95procGUqYqgt7MzD39j/evRHFCJ/zD68elQ==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr773121wmf.1.1567524588707;
	Tue, 03 Sep 2019 08:29:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c132sm24419726wme.27.2019.09.03.08.29.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 08:29:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 17:29:42 +0200
Message-Id: <20190903152942.69625-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package.bbclass: add PRIVATE_LIBS_ALL
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
X-List-Received-Date: Tue, 03 Sep 2019 15:29:48 -0000

PRIVATE_LIBS is used to exclude 'private' libraries from getting added to
automatic runtime dependency resolution. That variable has to list
all libraries by name which becomes a maintenance issue if the list
of such libraries frequently changes, or is very large.

PRIVATE_LIBS_ALL allows declaring all libraries private, either
for a specific target package (e.g. -ptest), or for all packages
produced by a recipe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/package.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 114d6559f5e..f6ccd908b4a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1646,7 +1646,7 @@ python package_do_shlibs() {
                 prov = (this_soname, ldir, pkgver)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or this_soname not in private_libs:
+                    if (not private_libs or this_soname not in private_libs) and not private_libs_all:
                         sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
@@ -1739,6 +1739,7 @@ python package_do_shlibs() {
     for pkg in shlib_pkgs:
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
         private_libs = private_libs.split()
+        private_libs_all = d.getVar('PRIVATE_LIBS_ALL_' + pkg) or d.getVar('PRIVATE_LIBS_ALL')
         needs_ldconfig = False
         bb.debug(2, "calculating shlib provides for %s" % pkg)
 
@@ -1821,6 +1822,7 @@ python package_do_shlibs() {
 
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
         private_libs = private_libs.split()
+        private_libs_all = d.getVar('PRIVATE_LIBS_ALL_' + pkg) or d.getVar('PRIVATE_LIBS_ALL')
 
         deps = list()
         for n in needed[pkg]:
@@ -1829,8 +1831,8 @@ python package_do_shlibs() {
             # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
             # but skipping it is still better alternative than providing own
             # version and then adding runtime dependency for the same system library
-            if private_libs and n[0] in private_libs:
-                bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
+            if (private_libs and n[0] in private_libs) or private_libs_all:
+                bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS or PRIVATE_LIBS_ALL' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
                 shlib_provider_path = []
@@ -2113,7 +2115,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS PRIVATE_LIBS_ALL"
 
 def gen_packagevar(d):
     ret = []
-- 
2.17.1


