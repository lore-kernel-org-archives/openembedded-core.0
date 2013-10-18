Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B6C536CD55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 10:27:38 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id x18so1449589lbi.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4uFZmrMtiYFsPSXrUK7pZI2fKGkgOzfau5wDvbuOJI0=;
	b=mGYADvgYC3qrX57SouCjaS6VMSLM/dszMDILRprXE3Xf7vYM7WqJbj6hgBpO4TwfIw
	US37uOvkj71FQj8gOj97MRyzeOy5o1yTxwX7+2H/VaJD/6JpVvmfkdRFal3BoxcxiKVV
	zC60NiPiv/WELKc90DMbcoA/Z1XBU8+eBi2iw1UU9szFi2xEDjv3khqTXTLbKfUOYnSw
	tq4s1OGDji44JPz8eHlH3OBE3EYd8CoN3H82xZEA8J+dGC4wBodbpyGs5eyfzR7O8m1h
	OY/QNcEfL4HEO5uSuLEL28YBTwPX2Oe9gZ5QSWKiXywYHGBHOTSSgyePbxI59oBA8LYb
	w3yQ==
X-Received: by 10.112.14.3 with SMTP id l3mr1173865lbc.27.1382092059703;
	Fri, 18 Oct 2013 03:27:39 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id kx1sm936393lac.7.2013.10.18.03.27.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 03:27:39 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id A8FBE401123; Fri, 18 Oct 2013 12:27:27 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Oct 2013 12:27:26 +0200
Message-Id: <1382092046-25109-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-12-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-12-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2] rpm: Add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 18 Oct 2013 10:27:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modified FILES-paths since nativesdk can't handle hardcoded paths,
Also added *.real binaries to packaging since this is not done when built
as native.

As far as /var having to be hardcoded, I have a hard time seeing someone
modifying bitbake.conf to place localstatedir somewhere else than /var.

If there exists a target/nativesdk portable way of hardcoding FILES,
please let me know, and we'll do it that way.

Cleanup of FEATURES, since it was the same for native & target.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3c7e03b..9699639 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -105,12 +105,12 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG_class-native ??= "db bzip2 zlib beecrypt openssl libelf python"
 PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
@@ -224,8 +224,16 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/rpmrepo \
 		${libdir}/rpm/bin/rpmspecdump \
 		${libdir}/rpm/bin/wget \
-		/var/lib/rpm \
-		/var/cache/rpm \
+		${libdir}/rpm \
+		${localstatedir}/cache \
+		${localstatedir}/cache/rpm \
+		${localstatedir}/cache/wdj \
+		${localstatedir}/lib \
+		${localstatedir}/lib/rpm \
+		${localstatedir}/lib/wdj \
+		${bindir}/rpm.real \
+		${bindir}/rpmconstant.real \
+		${bindir}/rpm2cpio.real \
 		"
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
@@ -235,7 +243,7 @@ FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/gendiff \
 		${sysconfdir}/rpm \
-		/var/spool/repackage \
+		${localstatedir}/spool/repackage \
 		"
 
 FILES_${PN}-libs = "${libdir}/librpm-*.so \
@@ -250,6 +258,7 @@ RDEPENDS_${PN}-build += "bash"
 
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
+		${bindir}/rpmbuild.real \
 		${libdir}/rpm/brp-* \
 		${libdir}/rpm/check-files \
 		${libdir}/rpm/cross-build \
@@ -313,6 +322,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		"
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-build = "file"
 
 RDEPENDS_python-rpm = "${PN}"
@@ -452,7 +462,7 @@ do_install_append() {
 
 }
 
-do_install_append_class-native() {
+add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
 		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
@@ -481,4 +491,12 @@ do_install_append_class-native() {
 	done
 }
 
-BBCLASSEXTEND = "native"
+do_install_append_class-native() {
+	add_native_wrapper
+}
+
+do_install_append_class-nativesdk() {
+	add_native_wrapper
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


