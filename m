Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/Na8YI3uhF44ErgdsLu1sSw9CyaYoOxSo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqpZd-0001BH-Iw
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 18:54:38 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79Go72D009213
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 11:50:08 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
Date: Tue, 9 Aug 2011 11:50:06 -0500
Message-Id: <822AACC4-810B-4113-A214-EE283679EA06@kernel.crashing.org>
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
	<1312898286.14274.298.camel@rex>
	<2C6C8741-1012-47BC-BDA9-2A02A08C5027@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: python automake dirs (was meta-toolchain-sdk failure)
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
X-List-Received-Date: Tue, 09 Aug 2011 16:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2011, at 10:32 AM, Kumar Gala wrote:

>=20
> On Aug 9, 2011, at 8:58 AM, Richard Purdie wrote:
>=20
>> On Tue, 2011-08-09 at 08:45 -0500, Kumar Gala wrote:
>>> Seeing the following when trying to do a meta-toolchain-sdk build =
w/latest git.  Guessing we're missing a depend of some sort:
>>>=20
>>> | error: Failed dependencies:
>>> | 	telepathy-python is needed by =
task-core-standalone-gmae-sdk-target-1.0-r13.ppc64e5500
>>>=20
>>> I think the reset of this is noise:
>>=20
>> It is, yes.
>>=20
>> Did telepathy-python build at all (you can check if any stamps are
>> present)? Are there any packages generated (in the deploy/rpm
>> directory)?
>>=20
>> I'm trying to work out if this wasn't present because it didn't =
build,
>> because it did build but didn't package correctly or whether the =
rootfs
>> code just isn't seeing the package...
>=20
> Seems it build but no package:
>=20
> =
build-p5020/tmp/deploy/rpm/ppc64e5500/telepathy-python-dev-0.15.19-r2.ppc6=
4e5500.rpm
> =
build-p5020/tmp/deploy/rpm/ppc64e5500/telepathy-python-dbg-0.15.19-r2.ppc6=
4e5500.rpm
>=20
> Looking at log.do_package
>=20
> WARNING: For recipe telepathy-python, the following files were =
installed but not shipped in any package:
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.pyo
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/utils.py
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/utils.pyc
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/interfaces.py
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/errors.py
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.pyo
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.py
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.py
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/__init__.pyc
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/_version.pyc
> WARNING:   /usr/lib/python2.6/site-packages/telepathy/constants.pyc
> ...
>=20
> Since this build is with 64-bit we should be in /usr/lib64 but are =
not.
>=20
> I believe there are other python packages that aren't respecting =
${libdir}
>=20
> There was a patch to xcb, but that still had issues as for some reason =
aclocal.m4 is getting regnerated and overriding PYTHON_LIB_PREFIX.

So the root of this seems to stem from the following in automake's =
python.m4:

=
am_cv_python_pythondir=3D$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-pac=
kages
=
am_cv_python_pyexecdir=3D$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/sit=
e-packages

So the question at hand is how to fix this?

Do we patch automake to respect libdir setting for these?

something like:

--- python.m4.orig	2011-08-09 11:46:19.511163337 -0500
+++ python.m4	2011-08-09 11:49:43.623022930 -0500
@@ -88,12 +88,13 @@
     [am_cv_python_version=3D`$PYTHON -c "import sys; =
sys.stdout.write(sys.version[[:3]])"`])
   AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
=20
-  dnl Use the values of $prefix and $exec_prefix for the corresponding
-  dnl values of PYTHON_PREFIX and PYTHON_EXEC_PREFIX.  These are made
+  dnl Use the values of $prefix, $libdir and $exec_prefix for the =
corresponding
+  dnl values of PYTHON_PREFIX PYTHON_LIB_PREFIX, and =
PYTHON_EXEC_PREFIX.  These are made
   dnl distinct variables so they can be overridden if need be.  =
However,
   dnl general consensus is that you shouldn't need this ability.
=20
   AC_SUBST([PYTHON_PREFIX], ['${prefix}'])
+  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
   AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
=20
   dnl At times (like when building shared libraries) you may want
@@ -122,7 +123,7 @@
        am_py_prefix=3D$prefix
      fi
      am_cv_python_pythondir=3D`$PYTHON -c "import sys; from distutils =
import sysconfig; =
sys.stdout.write(sysconfig.get_python_lib(0,0,prefix=3D'$am_py_prefix'))" =
2>/dev/null ||
-     echo "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
      case $am_cv_python_pythondir in
      $am_py_prefix*)
        am__strip_prefix=3D`echo "$am_py_prefix" | sed 's|.|.|g'`
@@ -132,7 +133,7 @@
        case $am_py_prefix in
          /usr|/System*) ;;
          *)
-	  =
am_cv_python_pythondir=3D$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-pac=
kages
+	  =
am_cv_python_pythondir=3D$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-pac=
kages
 	  ;;
        esac
        ;;
@@ -160,7 +161,7 @@
        am_py_exec_prefix=3D$exec_prefix
      fi
      am_cv_python_pyexecdir=3D`$PYTHON -c "import sys; from distutils =
import sysconfig; =
sys.stdout.write(sysconfig.get_python_lib(1,0,prefix=3D'$am_py_exec_prefix=
'))" 2>/dev/null ||
-     echo =
"$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
      case $am_cv_python_pyexecdir in
      $am_py_exec_prefix*)
        am__strip_prefix=3D`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
@@ -170,7 +171,7 @@
        case $am_py_exec_prefix in
          /usr|/System*) ;;
          *)
-	   =
am_cv_python_pyexecdir=3D$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/sit=
e-packages
+	   =
am_cv_python_pyexecdir=3D$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-pac=
kages
 	   ;;
        esac
        ;;



- k=


