Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RQmxp-0002bm-VG
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 22:24:14 +0100
Received: by wwp14 with SMTP id 14so1315410wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 13:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8Uj6A+eeQ618K0vDIsx6TVDClbV+Y2ffQsF/VaZy5YE=;
	b=Jg3Utak83m/36dEyW7XFWjJQYnk+5WFs3UZYjg1UMgoSRdquVplX9WHSDHRD38yaSH
	6xkqS28V6lcp+aX3bQYBu16+iX0vni0eCtBOU4L/tJYLPmAcYE/iYEJmfoyecpm0ZQzZ
	5E+jdBcgBNiRtAF1TFeLmQPTBHpFXRzYRQpOk=
Received: by 10.216.15.14 with SMTP id e14mr889068wee.21.1321478268786; Wed,
	16 Nov 2011 13:17:48 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Wed, 16 Nov 2011 13:17:27 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Nov 2011 14:17:27 -0700
X-Google-Sender-Auth: 5aQ9m47FsjJbw4zP1Spo0TxyJpU
Message-ID: <CABcZAN=EfT=jtKRBgfuvMWyipDRxWiac+kSxm8qoBZxjjcej=g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] Add some (mostly packaging) vardeps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2011 21:24:14 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass       |   17 ++++++++++++++++-
 meta/classes/package_deb.bbclass   |    1 +
 meta/classes/package_ipk.bbclass   |    1 +
 meta/classes/package_rpm.bbclass   |    1 +
 meta/classes/sstate.bbclass        |    2 ++
 meta/classes/utility-tasks.bbclass |    1 +
 6 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d01275f..11de0e3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1102,6 +1102,7 @@ python emit_pkgdata() {

 	bb.utils.unlockfile(lf)
 }
+emit_pkgdata[vardeps] += "${@gen_package_filedep_var(d)}"
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"

 ldconfig_postinst_fragment() {
@@ -1182,6 +1183,7 @@ python package_do_filedeps() {
 		bb.data.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files), d)
 		bb.data.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files), d)
 }
+package_do_filedeps[vardeps] += "${@gen_package_filedep_var(d)}"

 SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
 SHLIBSWORKDIR = "${WORKDIR}/shlibs"
@@ -1646,7 +1648,7 @@ python package_depchains() {

 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION
RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm
INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION
RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst
pkg_preinst pkg_postrm pkg_prerm INITSCRIPT_NAME INITSCRIPT_PARAMS
DEBIAN_NOAUTONAME PKGV PKGR"

 def gen_packagevar(d):
     ret = []
@@ -1657,6 +1659,19 @@ def gen_packagevar(d):
             ret.append(v + "_" + p)
     return " ".join(ret)

+def gen_package_filedep_var(d):
+    ret = []
+    pkgs = (d.getVar("PACKAGES", True) or "").split()
+    for pkg in pkgs:
+        ret.append('FILERPROVIDESFLIST_' + pkg)
+        for rpfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or
"").split():
+            ret.append('FILERPROVIDES_%s_%s' % (rpfile, pkg))
+
+        ret.append('FILERDEPENDSFLIST_' + pkg)
+        for rpfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or
"").split():
+            ret.append('FILERDEPENDS_%s_%s' % (rpfile, pkg))
+    return ret
+
 PACKAGE_PREPROCESS_FUNCS ?= ""
 PACKAGEFUNCS ?= "package_get_auto_pr \	
                 perform_packagecopy \
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 71e46a8..4a5c6b6 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -393,6 +393,7 @@ python do_package_deb () {
         bb.utils.prunedir(controldir)
         bb.utils.unlockfile(lf)
 }
+do_package_deb[vardeps] += "${@gen_packagevar(d)}"

 SSTATETASKS += "do_package_write_deb"
 do_package_write_deb[sstate-name] = "deploy-deb"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index df608fc..f9ba229 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -425,6 +425,7 @@ python do_package_ipk () {
 		bb.utils.unlockfile(lf)

 }
+do_package_ipk[vardeps] += "${@gen_packagevar(d)}"

 SSTATETASKS += "do_package_write_ipk"
 do_package_write_ipk[sstate-name] = "deploy-ipk"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2ace053..bcf94b8 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -837,6 +837,7 @@ python write_specfile () {

 	specfile.close()
 }
+write_specfile[vardeps] += "${@gen_packagevar(d)}"

 python do_package_rpm () {
 	import os
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a777c79..0a863cf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -144,6 +144,7 @@ def sstate_install(ss, d):

     for lock in locks:
         bb.utils.unlockfile(lock)
+sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"

 def sstate_installpkg(ss, d):
     import oe.path
@@ -215,6 +216,7 @@ def sstate_clean_cachefiles(d):
     for task in (d.getVar('SSTATETASKS', True) or "").split():
         ss = sstate_state_fromvars(d, task[3:])
         sstate_clean_cachefile(ss, d)
+sstate_clean_cachefiles[vardeps] += "${SSTATETASKS}"

 def sstate_clean_manifest(manifest, d):
     import oe.path
diff --git a/meta/classes/utility-tasks.bbclass
b/meta/classes/utility-tasks.bbclass
index 009ef1f..afd078e 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -27,6 +27,7 @@ python do_clean() {
 	for f in (d.getVar('CLEANFUNCS', 1) or '').split():
 		bb.build.exec_func(f, d)
 }
+do_clean[vardeps] += "${CLEANFUNCS}"

 addtask checkuri
 do_checkuri[nostamp] = "1"
-- 
1.7.7


