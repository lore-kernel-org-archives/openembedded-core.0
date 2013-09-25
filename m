Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id ED9D7610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 12:36:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PCa9sd030808 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 13:36:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DsC9ier38Fk5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 13:36:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PCa4Gd030799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 13:36:05 +0100
Message-ID: <1380112560.18603.331.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2013 13:36:00 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc/libtool/perl: Fix various path to sed-native problems
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
X-List-Received-Date: Wed, 25 Sep 2013 12:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If sed-native is built before these programs, hardcoded paths to sed-native
can end up in scripts and other parts of the system which may cause issues
if they are later used from sstate and sed-native is not installed.

To avoid this, this patch changes the global site configuration to
specify that plain "sed" is fine to be used. We need to spell this
out for gcc since it doesn't see the site files since we don't autoreconf
it. We can remove the values from libtool. We tell perl to use "/bin/sed"
since it requires a path and the system sed should be just fine for it.

[YOCTO #4971]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index b87ea625..dc44cc9 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -48,6 +48,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) !=
                 ${@get_gcc_mips_plt_setting(bb, d)} \
                 ${@get_gcc_multiarch_setting(bb, d)}"
 
+export ac_cv_path_SED = 'sed'
 export gcc_cv_collect2_libs = 'none required'
 # We need to set gcc_cv_collect2_libs else there is cross-compilation badness
 # in the config.log files (which might not get generated until do_compile
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 92e4949..5a67eeb9 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -26,9 +26,6 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
 SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
 
-# Don't want paths to sed-native (or anything else) encoded
-CACHED_CONFIGUREVARS += "ac_cv_path_SED=sed"
-
 do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
 	rm -f ${S}/libltdl/config/ltmain.sh
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index 18188ef..df73f08 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -8,7 +8,6 @@ SRC_URI += "file://prefix.patch"
 inherit native
 
 EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
-CACHED_CONFIGUREVARS += "ac_cv_path_SED=/bin/sed"
 
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index 9f0b8a1..c9ec2d2 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -63,6 +63,7 @@ do_configure () {
 		-Di_syslog \
 		-Duseperlio \
 		-Dman3ext=3pm \
+		-Dsed=/bin/sed \
 		-Uafs \
 		-Ud_csh \
 		-Uusesfio \
diff --git a/meta/site/common b/meta/site/common
index 1214a13..5ccc14f 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -17,3 +17,5 @@ shadow_cv_passwd_dir=${bindir}
 
 # python: deactivate a runtime check for ipv6-support in python >=2.7.1 that fails when cross-compiling
 ac_cv_buggy_getaddrinfo=no
+
+ac_cv_path_SED=sed



