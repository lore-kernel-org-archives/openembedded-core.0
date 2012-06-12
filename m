Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeR3J-0007Qz-1W for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:22:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDBvwT010616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:11:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08346-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:11:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDBm4T010610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:11:49 +0100
Message-ID: <1339506707.8065.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 14:11:47 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] openjade-native: Ensure we reautoconf the package
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
X-List-Received-Date: Tue, 12 Jun 2012 13:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently since configure.in in is in a subdirectory, we don't reautoconf the
recipe. We really need to do this, to update things like the libtool script used
and fix various issues such as those that could creep in if a reautoconf is
triggered for some reason. Since this source only calls AM_INIT_AUTOMAKE to gain the
PACKAGE and VERSION definitions and that macro now errors if Makefile.am doesn't
exist, we need to add these definitions manually.

These changes avoid failures like:

----
| ...
| DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope
| DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope
| make[2]: *** [DssslApp.lo] Error 1
----

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
new file mode 100644
index 0000000..5102c6a
--- a/dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
@@ -0,0 +1,83 @@
+Ensure we reautoconf the packag
+
+Currently since configure.in in is in a subdirectory, we don't reautoconf the 
+ecipe. We really need to do this, to update things like the libtool script used
+ and fix various issues such as those that could creep in if a reautoconf is 
+triggered for some reason. Since this source only calls AM_INIT_AUTOMAKE to 
+gain the PACKAGE and VERSION definitions and that macro now errors if Makefile.am 
+doesn't exist, we need to add these definitions manually. 
+
+These changes avoid failures like: 
+---- 
+| ... 
+| DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope 
+| DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope 
+| make[2]: *** [DssslApp.lo] Error 1 ----
+
+Upstream-Status: Pending
+
+RP 2012/6/12
+
+Index: openjade-1.3.2/acinclude.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ openjade-1.3.2/acinclude.m4	2012-06-12 12:48:54.871365344 +0000
+@@ -0,0 +1,39 @@
++dnl Configure-time switch with default
++dnl
++dnl Each switch defines an --enable-FOO and --disable-FOO option in
++dnl the resulting configure script.
++dnl
++dnl Usage:
++dnl smr_SWITCH(name, description, default, pos-def, neg-def)
++dnl
++dnl where:
++dnl
++dnl name        name of switch; generates --enable-name & --disable-name
++dnl             options
++dnl description help string is set to this prefixed by "enable" or
++dnl             "disable", whichever is the non-default value
++dnl default     either "on" or "off"; specifies default if neither
++dnl             --enable-name nor --disable-name is specified
++dnl pos-def     a symbol to AC_DEFINE if switch is on (optional)
++dnl neg-def     a symbol to AC_DEFINE if switch is off (optional)
++dnl
++AC_DEFUN(smr_SWITCH, [
++    AC_MSG_CHECKING(whether to enable $2)
++    AC_ARG_ENABLE(
++        $1,
++        ifelse($3, on,
++            [  --disable-[$1]    disable [$2]],
++            [  --enable-[$1]     enable [$2]]),
++        [ if test "$enableval" = yes; then
++            AC_MSG_RESULT(yes)
++            ifelse($4, , , AC_DEFINE($4))
++        else
++            AC_MSG_RESULT(no)
++            ifelse($5, , , AC_DEFINE($5))
++        fi ],
++        ifelse($3, on,
++           [ AC_MSG_RESULT(yes)
++             ifelse($4, , , AC_DEFINE($4)) ],
++           [ AC_MSG_RESULT(no)
++            ifelse($5, , , AC_DEFINE($5))]))])
++
+Index: openjade-1.3.2/config/configure.in
+===================================================================
+--- openjade-1.3.2.orig/config/configure.in	2012-06-12 12:47:20.735365445 +0000
++++ openjade-1.3.2/config/configure.in	2012-06-12 12:48:17.507364080 +0000
+@@ -12,9 +12,12 @@
+ dnl  Credits: this autoconf script was largely "inspired" <g> by the
+ dnl  autoconf script around SP made by Henry Thompson.
+ dnl
+-AC_INIT(dsssl)
++AC_INIT([openjade], [1.3.2])
+ AC_CONFIG_AUX_DIR(config)
+-AM_INIT_AUTOMAKE( openjade, 1.3.2)
++AC_SUBST([PACKAGE], [openjade])
++AC_SUBST([VERSION], [1.3.2])
++AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE")
++AC_DEFINE_UNQUOTED(VERSION, "$VERSION")
+ TOP=`pwd`
+ AC_SUBST(TOP)
+ dnl
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 18d311e..4bcc9f9 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -14,6 +14,7 @@ RDEPENDS_${PN} = "sgml-common-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
+           file://reautoconf.patch \
 	   file://user-declared-default-constructor.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
@@ -38,6 +39,9 @@ CFLAGS =+ "-I${S}/include"
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
 
+do_configure_prepend () {
+	cp ${S}/config/configure.in ${S}/
+}
 
 # We need to do this else the source interdependencies aren't generated and
 # build failures can result (e.g. zero size style/Makefile.dep file)




