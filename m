Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQ0l7-0003Re-GT for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:55:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEHnWPY014597
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:49:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14397-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:49:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEHnNK0014591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:49:24 GMT
Message-ID: <1321292967.26881.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 17:49:27 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] dpkg/update-alternatives: Fix dpkg version of update-alternatives to be usable
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
X-List-Received-Date: Mon, 14 Nov 2011 17:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The version of dpkg the updates-alternatives-dpkg recipe pointed
at no longer used a perl script but a compiled binary. This meant
the "all" architecture field was invalid, as as the sed operation
during do_patch. All things considered the separate recipe was
pretty pointless.

This patch moves update-alternatives back to being built as part
of the dpkg recipe. It also moves various functionalty to the .inc
file which it belongs and fixes building and packaging of the dpkg
perl modules.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 8c2511d..a8486d9 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPL"
 SECTION = "base"
 
-INC_PR = "r5"
+INC_PR = "r10"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
@@ -18,8 +18,24 @@ PARALLEL_MAKE = ""
 
 inherit autotools gettext perlnative
 
-DPKG_INIT_POSITION = "98"
+export PERL_LIBDIR = "${libdir}/perl"
 
+EXTRA_OECONF = "--without-static-progs \
+		--without-dselect \
+		--with-start-stop-daemon \
+		--with-zlib \
+		--with-bz2lib \
+		--without-selinux \
+		--without-sgml-doc"
+
+do_configure () {
+    echo >> m4/compiler.m4
+    sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
+    autotools_do_configure
+}
+
+
+DPKG_INIT_POSITION ?= "98"
 do_install_prepend () {
 	install -d ${D}/${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
@@ -30,7 +46,19 @@ rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
 	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
 }
 
-do_configure () {
-    echo >> m4/compiler.m4
-    autotools_do_configure
+do_install_append () {
+	mv ${D}${bindir}/update-alternatives ${D}${sbindir}
 }
+
+PROVIDES += "virtual/update-alternatives"
+
+PACKAGES =+ "update-alternatives-dpkg"
+FILES_update-alternatives-dpkg = "${sbindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
+RPROVIDES_update-alternatives-dpkg += "update-alternatives"
+
+PACKAGES += "${PN}-perl"
+FILES_${PN}-perl = "${libdir}/perl"
+
+BBCLASSEXTEND = "native"
+
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch b/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
new file mode 100644
index 0000000..45973f0
--- a/dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
@@ -0,0 +1,22 @@
+We want to be able to set PERL_LIBDIR from the environment. This
+hardcoded assignment prevents us from doing so and obtains an 
+incorrect value.
+
+Upstream-Status: Inappropriate [in this form at least]
+
+RP 14/11/2011
+
+Index: dpkg-1.15.8.7/m4/dpkg-progs.m4
+===================================================================
+--- dpkg-1.15.8.7.orig/m4/dpkg-progs.m4	2011-11-14 17:32:21.252053239 +0000
++++ dpkg-1.15.8.7/m4/dpkg-progs.m4	2011-11-14 17:32:55.180052455 +0000
+@@ -9,9 +9,6 @@
+ [AC_ARG_VAR([PERL], [Perl interpreter])dnl
+ AC_PATH_PROG([PERL], [perl], [/usr/bin/perl])dnl
+ AC_ARG_VAR([PERL_LIBDIR], [Perl library directory])dnl
+-PERL_LIBDIR=$($PERL -MConfig -e 'my $r = $Config{vendorlibexp};
+-                                 $r =~ s/$Config{vendorprefixexp}/\$(prefix)/;
+-                                 print $r')dnl
+ ])# DPKG_PROG_PERL
+ 
+ # DPKG_PROG_PO4A
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index 99197c0..8b45a00 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -3,23 +3,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
-            file://check_version.patch"
+            file://check_version.patch \
+            file://perllibdir.patch"
 
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
 PR = "${INC_PR}.0"
 
-EXTRA_OECONF = "--without-static-progs \
-		--without-dselect \
-		--with-start-stop-daemon \
-		--with-zlib \
-		--with-bz2lib \
-		--without-selinux \
-		--without-sgml-doc"
-
-BBCLASSEXTEND = "native"
-
-do_install_append () {
-	rm ${D}${bindir}/update-alternatives
-}
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
deleted file mode 100644
index c881ae0..0000000
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
+++ b/dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Manage alternatives"
-DESCRIPTION = "update-alternatives creates, removes, maintains and displays information about the symbolic links \
-comprising the Debian alternatives system. The Debian alternatives system attempts solve the problem of several \
-programs fulfilling the same or similar functions and how they can be installed onto a single system at the same \
-time."
-LICENSE = "GPL"
-SECTION = "base"
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
-S = "${WORKDIR}/dpkg-${PV}"
-PACKAGE_ARCH = "all"
-INC_PR = "r3"
-
-inherit gettext
-
-do_patch () {
-    cat ${S}/scripts/update-alternatives.pl | \
-        sed -n -e '
-    /^\$admindir=.*staging/{
-        x
-        s/^.*$/$D=$ENV{"D"} || ""\;/;
-        p;
-        x;
-        s,^\$admindir=.*staging.*$,$admindir="$D${localstatedir}/lib/dpkg"\;,;
-    };
-    s,^\$altdir=.*$,$altdir="$D${sysconfdir}/alternatives"\;,;
-    p;' > ${S}/scripts/update-alternatives
-}
-
-do_install () {
-    install -d ${D}${sbindir} \
-               ${D}${localstatedir}/lib/dpkg/alternatives \
-               ${D}${sysconfdir}/alternatives
-
-    install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
-}
-
-PROVIDES += "virtual/update-alternatives"
-RPROVIDES_${PN} += "update-alternatives"
-EXTRA_RDEPENDS = "perl dpkg"
-EXTRA_RDEPENDS_virtclass-native = ""
-RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb
deleted file mode 100644
index f293177..0000000
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb
+++ b/dev/null
@@ -1,8 +0,0 @@
-require update-alternatives-dpkg.inc
-
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI[md5sum] = "0266b06ef9da8278cea008d21e17e5f6"
-SRC_URI[sha256sum] = "69669720020e67629d70aa5325e3c20c05cae7a9fc2d8abd442672c7b29e31d3"




