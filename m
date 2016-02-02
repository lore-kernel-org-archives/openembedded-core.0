Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC2BE731DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12Dorp5003412 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 13:50:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QE7fMapBqdqh
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:50:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12DoldV003404
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 13:50:48 GMT
Message-ID: <1454421047.27087.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Feb 2016 13:50:47 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] busybox/gtk/perl/base-passwd: Ensure data is correctly expanded
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
X-List-Received-Date: Tue, 02 Feb 2016 13:50:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Where variables are used in python, we need to ensure they are expanded.
This happens to work at the moment but likely will not happen in future
and isn't good code practise.

Its mostly an issue around key values, since bitbake has already
performed key expansion when these functions are executed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index a770168..10457b2 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -89,7 +89,7 @@ if [ ! -e $D${sysconfdir}/group ]; then
 """ + group + """EOF
 fi
 """
-    d.setVar('pkg_preinst_${PN}', preinst)
+    d.setVar(d.expand('pkg_preinst_${PN}'), preinst)
 }
 
 addtask do_package after do_populate_sysroot
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e5710f0..f74d1a4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -346,6 +346,8 @@ python do_package_prepend () {
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
     def set_alternative_vars(links, target):
+        links = d.expand(links)
+        target = d.expand(target)
         f = open('%s%s' % (dvar, links), 'r')
         for alt_link_name in f:
             alt_link_name = alt_link_name.strip()
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 705852c..54594b1 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -349,7 +349,7 @@ python populate_packages_prepend () {
     # modules. Don't attempt to use the result of do_split_packages() as some
     # modules are manually split (eg. perl-module-unicore).
     packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES', True).split())
-    d.setVar("RRECOMMENDS_${PN}-modules", ' '.join(packages))
+    d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
 }
 
 PACKAGES_DYNAMIC += "^perl-module-.*"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 36f7b0c..353c521 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -106,6 +106,6 @@ python populate_packages_prepend () {
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', 1)):
-        d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-3.0')
+        d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-3.0')
 }
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
index 675ef6d..cf55d20 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
@@ -30,5 +30,5 @@ python populate_packages_prepend () {
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', True)):
-        d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
+        d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
 }



