Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B3C3E6E64A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7ISEI7021402 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:28:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3_05b4W6DkxY
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:28:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7IS5bw021397
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:28:16 GMT
Message-ID: <1449512885.19730.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Dec 2015 18:28:05 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] automake: Remove delays in configure scripts using automake
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
X-List-Received-Date: Mon, 07 Dec 2015 18:28:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

By default automake puts "sleep 1" into the start of configure scripts
which adds pointless delays to them. Rather than do this, lets just assume
our systems are sane.

Since this means our patches touch m4 files, we need to stop automake running
autoreconf so we tweak the do_configure to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index a1debd8..b14c847 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -11,6 +11,9 @@ inherit autotools texinfo
 
 do_configure() {
 	oe_runconf
+	# We can end up patching macros, which would then mean autoreconf
+	# Cheat by saying everything is up to date.
+	touch ${S}/aclocal.m4 ${S}/Makefile.in
 }
 
 export AUTOMAKE = "${@bb.utils.which('automake', d.getVar('PATH', True))}"
diff --git a/meta/recipes-devtools/automake/automake/performance.patch b/meta/recipes-devtools/automake/automake/performance.patch
new file mode 100644
index 0000000..691eec1
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/performance.patch
@@ -0,0 +1,73 @@
+By default automake puts "sleep 1" into the start of configure scripts
+which adds pointless delays to them. Rather than do this, lets just assume 
+our systems are sane.
+
+RP
+2015/12/7
+
+
+Index: automake-1.15/m4/sanity.m4
+===================================================================
+--- automake-1.15.orig/m4/sanity.m4
++++ automake-1.15/m4/sanity.m4
+@@ -23,60 +23,5 @@ case $srcdir in
+     AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
+ esac
+ 
+-# Do 'set' in a subshell so we don't clobber the current shell's
+-# arguments.  Must try -L first in case configure is actually a
+-# symlink; some systems play weird games with the mod time of symlinks
+-# (eg FreeBSD returns the mod time of the symlink's containing
+-# directory).
+-if (
+-   am_has_slept=no
+-   for am_try in 1 2; do
+-     echo "timestamp, slept: $am_has_slept" > conftest.file
+-     set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
+-     if test "$[*]" = "X"; then
+-	# -L didn't work.
+-	set X `ls -t "$srcdir/configure" conftest.file`
+-     fi
+-     if test "$[*]" != "X $srcdir/configure conftest.file" \
+-	&& test "$[*]" != "X conftest.file $srcdir/configure"; then
+-
+-	# If neither matched, then we have a broken ls.  This can happen
+-	# if, for instance, CONFIG_SHELL is bash and it inherits a
+-	# broken ls alias from the environment.  This has actually
+-	# happened.  Such a system could not be considered "sane".
+-	AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
+-  alias in your environment])
+-     fi
+-     if test "$[2]" = conftest.file || test $am_try -eq 2; then
+-       break
+-     fi
+-     # Just in case.
+-     sleep 1
+-     am_has_slept=yes
+-   done
+-   test "$[2]" = conftest.file
+-   )
+-then
+-   # Ok.
+-   :
+-else
+-   AC_MSG_ERROR([newly created file is older than distributed files!
+-Check your system clock])
+-fi
+ AC_MSG_RESULT([yes])
+-# If we didn't sleep, we still need to ensure time stamps of config.status and
+-# generated files are strictly newer.
+-am_sleep_pid=
+-if grep 'slept: no' conftest.file >/dev/null 2>&1; then
+-  ( sleep 1 ) &
+-  am_sleep_pid=$!
+-fi
+-AC_CONFIG_COMMANDS_PRE(
+-  [AC_MSG_CHECKING([that generated files are newer than configure])
+-   if test -n "$am_sleep_pid"; then
+-     # Hide warnings about reused PIDs.
+-     wait $am_sleep_pid 2>/dev/null
+-   fi
+-   AC_MSG_RESULT([done])])
+-rm -f conftest.file
+ ])
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index c33dc22..4f280ba 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -20,7 +20,8 @@ RDEPENDS_${PN}_class-native = "autoconf-native perl-native-runtime"
 
 SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
-            file://buildtest.patch"
+            file://buildtest.patch \
+            file://performance.patch"
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
 SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"



