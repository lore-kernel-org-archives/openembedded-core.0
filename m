Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TFSdh-0001wH-Mi
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 18:33:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TFSRO-000208-Js
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 18:20:26 +0200
Message-ID: <1348330688.4444.217.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:18:08 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Remove special handling for autoconf* and automake*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 16:33:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For reasons that are now shrouded in obscurity, autotools.bbclass
has long contained a special heuristic to avoid attempting to run
autoreconf when building autoconf or automake themselves.  However,
the wildcard test against PN which is used there is problematic when
trying to build another package whose name happens to start with
"autoconf", and in any case it is silly to do this test at runtime
for every package.  The individual recipes for autoconf and automake
can just as easily suppress the behaviour that they don't want by
providing a custom do_configure() method which just runs configure.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/autotools.bbclass                    |  158 ++++++++++-----------
 meta/recipes-devtools/autoconf/autoconf.inc       |    4 +
 meta/recipes-devtools/autoconf/autoconf_2.69.bb   |    2 +-
 meta/recipes-devtools/automake/automake.inc       |    4 +
 meta/recipes-devtools/automake/automake_1.12.3.bb |    2 +-
 5 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a5997c5..e4e034b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -111,91 +111,83 @@ do_configure[prefuncs] += "autotools_preconfigure"
 do_configure[postfuncs] += "autotools_postconfigure"
 
 autotools_do_configure() {
-	case ${PN} in
-	autoconf*)
-	;;
-	automake*)
-	;;
-	*)
-		# WARNING: gross hack follows:
-		# An autotools built package generally needs these scripts, however only
-		# automake or libtoolize actually install the current versions of them.
-		# This is a problem in builds that do not use libtool or automake, in the case
-		# where we -need- the latest version of these scripts.  e.g. running a build
-		# for a package whose autotools are old, on an x86_64 machine, which the old
-		# config.sub does not support.  Work around this by installing them manually
-		# regardless.
-		( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
-			rm -f `dirname $ac`/configure
-			done )
-		if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
-			olddir=`pwd`
-			cd ${S}
-			# Remove any previous copy of the m4 macros
-			rm -rf ${B}/aclocal-copy/
-			if [ x"${acpaths}" = xdefault ]; then
-				acpaths=
-				for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-					grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
-					acpaths="$acpaths -I $i"
-				done
-			else
-				acpaths="${acpaths}"
-			fi
-			AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
-			automake --version
-			echo "AUTOV is $AUTOV"
-			if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
-				acpaths="$acpaths -I${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV"
-			fi
-			# The aclocal directory could get modified by other processes 
-			# uninstalling data from the sysroot. See Yocto #861 for details.
-			# We avoid this by taking a copy here and then files cannot disappear.
-			if [ -d ${STAGING_DATADIR}/aclocal ]; then
-				# for scratch build this directory can be empty
-				# so avoid cp's no files to copy error
-				cp-noerror ${STAGING_DATADIR}/aclocal ${B}/aclocal-copy/
-				acpaths="$acpaths -I ${B}/aclocal-copy/"
-			fi
-			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
-			# like it was auto-generated.  Work around this by blowing it away
-			# by hand, unless the package specifically asked not to run aclocal.
-			if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
-				rm -f aclocal.m4
-			fi
-			if [ -e configure.in ]; then
-			  CONFIGURE_AC=configure.in
-			else
-			  CONFIGURE_AC=configure.ac
-			fi
-			if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
-			  if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			    if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
-			      : do nothing -- we still have an old unmodified configure.ac
-			    else
-			      bbnote Executing glib-gettextize --force --copy
-			      echo "no" | glib-gettextize --force --copy
-			    fi
-			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-                            # We'd call gettextize here if it wasn't so broken...
-			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
-			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
-			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
-                            fi
-			  fi
-			fi
-			fi
-			mkdir -p m4
-			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-			  bbnote Executing intltoolize --copy --force --automake
-			  intltoolize --copy --force --automake
+	# WARNING: gross hack follows:
+	# An autotools built package generally needs these scripts, however only
+	# automake or libtoolize actually install the current versions of them.
+	# This is a problem in builds that do not use libtool or automake, in the case
+	# where we -need- the latest version of these scripts.  e.g. running a build
+	# for a package whose autotools are old, on an x86_64 machine, which the old
+	# config.sub does not support.  Work around this by installing them manually
+	# regardless.
+	( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
+		rm -f `dirname $ac`/configure
+		done )
+	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
+		olddir=`pwd`
+		cd ${S}
+		# Remove any previous copy of the m4 macros
+		rm -rf ${B}/aclocal-copy/
+		if [ x"${acpaths}" = xdefault ]; then
+			acpaths=
+			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
+				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+				acpaths="$acpaths -I $i"
+			done
+		else
+			acpaths="${acpaths}"
+		fi
+		AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
+		automake --version
+		echo "AUTOV is $AUTOV"
+		if [ -d ${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV ]; then
+			acpaths="$acpaths -I${STAGING_DATADIR_NATIVE}/aclocal-$AUTOV"
+		fi
+		# The aclocal directory could get modified by other processes 
+		# uninstalling data from the sysroot. See Yocto #861 for details.
+		# We avoid this by taking a copy here and then files cannot disappear.
+		if [ -d ${STAGING_DATADIR}/aclocal ]; then
+			# for scratch build this directory can be empty
+			# so avoid cp's no files to copy error
+			cp-noerror ${STAGING_DATADIR}/aclocal ${B}/aclocal-copy/
+			acpaths="$acpaths -I ${B}/aclocal-copy/"
+		fi
+		# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
+		# like it was auto-generated.  Work around this by blowing it away
+		# by hand, unless the package specifically asked not to run aclocal.
+		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
+			rm -f aclocal.m4
+		fi
+		if [ -e configure.in ]; then
+			CONFIGURE_AC=configure.in
+		else
+			CONFIGURE_AC=configure.ac
+		fi
+		if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
+			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+				if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+					: do nothing -- we still have an old unmodified configure.ac
+		    		else
+					bbnote Executing glib-gettextize --force --copy
+					echo "no" | glib-gettextize --force --copy
+				fi
+			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+				# We'd call gettextize here if it wasn't so broken...
+					cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
+					if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
+						cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+					fi
+				fi
 			fi
-			bbnote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
-			cd $olddir
 		fi
-	;;
-	esac
+		mkdir -p m4
+		if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+			bbnote Executing intltoolize --copy --force --automake
+			intltoolize --copy --force --automake
+		fi
+		bbnote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+		autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+		cd $olddir
+	fi
 	if [ -e ${S}/configure ]; then
 		oe_runconf
 	else
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index e80a834..315e773 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -17,6 +17,10 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 
 inherit autotools
 
+do_configure() {
+	oe_runconf
+}
+
 do_install_append() {
     rm -rf ${D}${datadir}/emacs
 
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 1ec1cb5..2c4c675 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r8"
+PR = "r9"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 370caca..ae743cc 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -9,6 +9,10 @@ SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
 
 inherit autotools
 
+do_configure() {
+	oe_runconf
+}
+
 export AUTOMAKE = "${@bb.which('automake', d.getVar('PATH', True))}"
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb b/meta/recipes-devtools/automake/automake_1.12.3.bb
index 25069d7..af99dfa 100644
--- a/meta/recipes-devtools/automake/automake_1.12.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
@@ -42,7 +42,7 @@ SRC_URI += "${PATHFIXPATCH} \
 SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
 SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
 
-PR = "r0"
+PR = "r1"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-- 
1.7.9






