Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BB716620C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 14:24:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57ETlhl023757 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 15:29:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vB7Ekdir9DP2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 15:29:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57ETheD023753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 15:29:45 +0100
Message-ID: <1370615069.6864.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 15:24:29 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] git/tar/findutils: Add nativesdk versions
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
X-List-Received-Date: Fri, 07 Jun 2013 14:24:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to be able to generate a standalone tarball containing tar/git so
add nativesdk versions of the appropriate recipes to allow this to be possible.

Tweak the git perl paths to avoid warnings when building the nativesdk version,
ensure the binaries are wrapped correctly and avoid update-alternatives in
nativesdk-tar.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9829eec..183a93c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -31,8 +31,8 @@ do_install () {
 
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
-	rm -rf ${D}/usr/lib/perl-native
-	rmdir ${D}/usr/lib || true
+	rm -rf ${D}${exec_prefix}/lib/perl-native
+	rmdir ${D}${exec_prefix}/lib || true
 }
 
 do_install_append_class-native() {
@@ -41,6 +41,12 @@ do_install_append_class-native() {
 		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
 }
 
+do_install_append_class-nativesdk() {
+	create_wrapper ${D}/${bindir}/git \
+		GIT_EXEC_PATH=${libexecdir}/git-core \
+		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
+}
+
 FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
@@ -78,4 +84,4 @@ PACKAGES =+ "gitweb"
 FILES_gitweb = "${datadir}/gitweb/"
 
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 9306786..81e6785 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -21,4 +21,4 @@ ALTERNATIVE_PRIORITY = "100"
 # see diffutils.mk in buildroot)
 EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index f49c7de..abeb8c1 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -33,6 +33,10 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "tar"
 ALTERNATIVE_${PN}-rmt = "rmt"
+ALTERNATIVE_${PN}_class-nativesdk = ""
+ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
 
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
 ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+
+BBCLASSEXTEND = "nativesdk"



