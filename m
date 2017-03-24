Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DB01377BCA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:09:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id u132so16830823wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qqvlluG7mAuEmyzK5siUwZCwLq7KOrV7SE9DaRfjpJ4=;
	b=Q5lC+7LWe9YysSLiBqImGjt2XPxytn+K/XoL9D2RCeQZhchHIGFqz7bxIJZ/RDO7LO
	GX/FL7Ib/zQlOLiGmuFb7jLmCMJSAg6bY5no9wT/dkn/C7RmAoQ1hJKOuyLE9Z6NfV7m
	iy71D5+y8TPUsnqT2dfLLoHKUTCFUzVZnaOXfQYb1FhzJvQ26BMvPGpDWkIldB8QmF8N
	pn5WAVBmSq/++ul1vKL2gil1j+q5yivAXrFm2VNIqtt+kSBFyPcLq4V2dfGTobftjlcT
	PCe1Yomxz1XbxWAPOpuQhCTc1s+p/Pa9ljs67pm1n+Nb1btq32XZ9A15FgvPdjSHHFBt
	yoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qqvlluG7mAuEmyzK5siUwZCwLq7KOrV7SE9DaRfjpJ4=;
	b=Jjel/7aTFHGaQ55Svu5j9TtLtMXZgaborsexf4nMEli/s731bh53ShcNbJp1O5IaYO
	sTkQoCSuGDkDBQvhZ2zbo6BCUuLbluu+wv8x33GDV5cq6mRBY6dSp1YKJOOuRUXsUaoi
	Tis8qRjBfT8fR2B6f8FwD9Z3/JDEnWw/nNFuVhkryIa3iaXbBo0WtGpXQx/oUAim0n8n
	GMK7PlnIOYn3m0jNNw3UissJakYhgbX5DDbtlL0LZJRLhEwqH859MqLaniFfroVn6YXv
	fFlu/3JK6iDYrSNkQ2eyeChxE3AJFSmy4cY+7zh78hwmEHyWkl4m+zbrAFwPK3p5O/Kx
	BIoA==
X-Gm-Message-State: AFeK/H1TS9egqjbufQjn+Lylr61+bPOja6gXgR6ZHc1QICVYG1+vkI1hxTX8w0uXXtmutoa3
X-Received: by 10.28.215.74 with SMTP id o71mr3706205wmg.23.1490371764708;
	Fri, 24 Mar 2017 09:09:24 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r124sm3002959wmf.11.2017.03.24.09.09.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:09:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:09:19 +0000
Message-Id: <1490371759-30513-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] boost: port boost-python to Python 3
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
X-List-Received-Date: Fri, 24 Mar 2017 16:09:26 -0000

As Python 3 is the default Python version, change Boost to build against Python
3 instead of Python 2 if enabled.  It's not simple to support both, so this
means that support for building boost-python against Python 2 has been removed.

This involves backporting a number of patches upstream to fix Python 3 support,
and telling Boost precisely where to find the Python headers and libraries so
that it doesn't try to invoke the host Python to determine these values.

[ YOCTO #11104 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc       |  36 ++--
 meta/recipes-support/boost/boost/py3.patch | 269 +++++++++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.63.0.bb |   1 +
 3 files changed, 287 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-support/boost/boost/py3.patch

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 87b6b88..dcadcbc 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -42,16 +42,15 @@ PACKAGECONFIG ??= "locale"
 PACKAGECONFIG[locale] = ",,icu"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
-PACKAGECONFIG[python] = ",,python python3"
+PACKAGECONFIG[python] = ",,python3"
 
 BOOST_LIBS += "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'locale', d)} \
+    ${@bb.utils.filter('PACKAGECONFIG', 'locale python', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel', 'graph_parallel mpi', \
                          bb.utils.filter('PACKAGECONFIG', 'mpi', d), d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)} \
 "
 
-inherit python-dir
+inherit python3-dir
 PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
 # Make a package for each library, plus -dev
@@ -59,19 +58,12 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
     packages = []
     extras = []
-    for lib in d.getVar('BOOST_LIBS').split( ):
-        # BJAM does not know '--with-python3' (only --with-python)
-        if lib != "python3":
-            extras.append("--with-%s" % lib)
+    for lib in d.getVar('BOOST_LIBS').split():
+        extras.append("--with-%s" % lib)
         pkg = "boost-%s" % lib.replace("_", "-")
         packages.append(pkg)
-        if lib == "python":
-            # special: python*.so matches python3.so !!
-            if not d.getVar("FILES_%s" % pkg):
-                    d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so.*" % lib)
-        else:
-            if not d.getVar("FILES_%s" % pkg):
-                    d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
+        if not d.getVar("FILES_%s" % pkg):
+                d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))
 }
@@ -186,15 +178,21 @@ do_configure() {
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
 	rm -f ${WORKDIR}/user-config.jam
 	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
-	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${WORKDIR}/user-config.jam
-	echo "using python : 3.5 : : ${STAGING_INCDIR}/python3.5m ;" >> ${WORKDIR}/user-config.jam
+
+	# If we want Python then we need to tell Boost *exactly* where to find it
+	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
+		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
 		echo "using mpi : : <find-shared-library>mpi ;" >> ${WORKDIR}/user-config.jam
 	fi
 
-	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
-	sed -i '/^using python/d' ${S}/project-config.jam
+	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc
+
+	# Boost can't be trusted to find Python on it's own, so remove any mention
+	# of it from the boost configuration
+	sed -i '/using python/d' ${S}/project-config.jam
 }
 
 do_compile() {
diff --git a/meta/recipes-support/boost/boost/py3.patch b/meta/recipes-support/boost/boost/py3.patch
new file mode 100644
index 0000000..2b1ff18
--- /dev/null
+++ b/meta/recipes-support/boost/boost/py3.patch
@@ -0,0 +1,269 @@
+Backport fixes from upstream (as of boost super-module commit 0d52b9) to improve
+the building of the Boost Python module with Python 3.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/build/Jamfile b/build/Jamfile
+index 313fdab..f14dc11 100644
+--- a/libs/python/build/Jamfile
++++ b/libs/python/build/Jamfile
+@@ -6,6 +6,7 @@ import os ;
+ import indirect ;
+ import modules ;
+ import feature ;
++import property ;
+ 
+ import python ;
+ 
+@@ -30,21 +31,8 @@ else
+         ;
+ }
+ 
+-rule find-py3-version
+-{
+-    local versions = [ feature.values python ] ;
+-    local py3ver ;
+-    for local v in $(versions)
+-    {
+-        if $(v) >= 3.0
+-        {
+-            py3ver = $(v) ;
+-        }
+-    }
+-    return $(py3ver) ;
+-}
+-
+-py3-version = [ find-py3-version ] ;
++py2-version = [ py-version 2 ] ;
++py3-version = [ py-version 3 ] ;
+ 
+ project boost/python
+   : source-location ../src
+@@ -52,11 +40,17 @@ project boost/python
+ 
+ rule cond ( test ? : yes * : no * ) { if $(test) { return $(yes) ; } else { return $(no) ; } }
+ rule unless ( test ? : yes * : no * ) { if ! $(test) { return $(yes) ; } else { return $(no) ; } }
++local rule eq ( a : b ) { if $(a) = $(b) { return 1 ; } }
+ 
+-rule lib_boost_python ( is-py3 ? )
+-{
++lib_boost_python(2) = boost_python ;
++lib_boost_python(3) = boost_python3 ;
+ 
+-    lib [ cond $(is-py3) : boost_python3 : boost_python ]
++lib_boost_python($(py2-version)) = $(lib_boost_python(2)) ;
++lib_boost_python($(py3-version)) = $(lib_boost_python(3)) ;
++
++rule lib_boost_python ( version )
++{
++    lib $(lib_boost_python($(version)))
+         : # sources
+         numeric.cpp
+         list.cpp
+@@ -112,11 +106,13 @@ rule lib_boost_python ( is-py3 ? )
+             <dependency>config-warning
+ 
+             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
+-            [ cond $(is-py3) : <python>$(py3-version) ]
++            <python>$(version)
+ 
+             -<tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).tag
+             <tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).python-tag
+ 
++            <conditional>@python.require-py
++
+         :   # default build
+             <link>shared
+         :   # usage requirements
+@@ -125,51 +121,68 @@ rule lib_boost_python ( is-py3 ? )
+         ;
+ }
+ 
+-rule lib_boost_numpy ( is-py3 ? )
++lib_boost_numpy(2) = boost_numpy ;
++lib_boost_numpy(3) = boost_numpy3 ;
++
++lib_boost_numpy($(py2-version)) = $(lib_boost_python(2)) ;
++lib_boost_numpy($(py3-version)) = $(lib_boost_python(3)) ;
++
++rule lib_boost_numpy ( version )
+ {
+     numpy-include = [ python.numpy-include ] ;
+-    lib [ cond $(is-py3) : boost_numpy3 : boost_numpy ]
++    lib $(lib_boost_numpy($(version)))
+         : # sources
+         numpy/dtype.cpp
+         numpy/matrix.cpp
+         numpy/ndarray.cpp
+-	numpy/numpy.cpp
+-	numpy/scalars.cpp
+-	numpy/ufunc.cpp
++        numpy/numpy.cpp
++        numpy/scalars.cpp
++        numpy/ufunc.cpp
+         :   # requirements
++            <link>static:<define>BOOST_NUMPY_STATIC_LIB 
++            <define>BOOST_NUMPY_SOURCE
+             [ cond [ python.numpy ] : <library>/python//python_for_extensions ]
+             [ unless [ python.numpy ] : <build>no ]
+-	    <include>$(numpy-include)
+-	    <library>boost_python
++            <include>$(numpy-include)
++            <library>$(lib_boost_python($(version)))
+             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
+-            [ cond $(is-py3) : <python>$(py3-version) ]
++            <python>$(version)
+ 
+             -<tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).tag
+             <tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).python-tag
+ 
++            <conditional>@python.require-py
++
+         :   # default build
+             <link>shared
+         :   # usage requirements
++			<link>static:<define>BOOST_NUMPY_STATIC_LIB
+             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
+         ;
+ }
+ 
+-libraries = boost_python ;
+-libraries3 = boost_python3 ;
+-if [ python.numpy ]
+-{
+-    libraries += boost_numpy ;
+-    libraries3 += boost_numpy3 ;
+-}
+-
+-lib_boost_python ;
+-lib_boost_numpy ;
++libraries = ;
+ 
+-if $(py3-version)
++for local N in 2 3
+ {
+-    lib_boost_python yes ;
+-    lib_boost_numpy yes ;
+-    libraries += $(libraries3) ;
++    if $(py$(N)-version)
++    {
++        lib_boost_python $(py$(N)-version) ;
++        libraries += $(lib_boost_python($(py$(N)-version))) ;
++    }
++    else
++    {
++        alias $(lib_boost_python($(N))) ;
++    }
++    if $(py$(N)-version) && [ python.numpy ]
++    {
++        lib_boost_numpy $(py$(N)-version) ;
++        libraries += $(lib_boost_numpy($(py$(N)-version))) ;
++    }
++    else
++    {
++        alias $(lib_boost_numpy($(N))) ;
++    }
+ }
+ 
+ boost-install $(libraries) ;
+diff --git a/src/tools/python.jam b/src/tools/python.jam
+index cc13385..bf300b8 100644
+--- a/tools/build/src/tools/python.jam
++++ b/tools/build/src/tools/python.jam
+@@ -34,6 +34,7 @@ import path ;
+ import feature ;
+ import set ;
+ import builtin ;
++import property-set ;
+ 
+ 
+ # Make this module a project.
+@@ -60,6 +61,10 @@ lib rt ;
+ # installed in the development system's default paths.
+ feature.feature pythonpath : : free optional path ;
+ 
++# The best configured version of Python 2 and 3.
++py2-version = ;
++py3-version = ;
++
+ # Initializes the Python toolset. Note that all parameters are optional.
+ #
+ # - version -- the version of Python to use. Should be in Major.Minor format,
+@@ -861,6 +866,11 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
+         if ! $(version) in [ feature.values python ]
+         {
+             feature.extend python : $(version) ;
++            py$(major-minor[1])-version ?= $(version) ;
++            if $(py$(major-minor[1])-version) < $(version)
++            {
++                py$(major-minor[1])-version = $(version) ;
++            }
+         }
+         target-requirements += <python>$(version:E=default) ;
+     }
+@@ -916,6 +926,9 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
+         }
+     }
+ 
++    # In case we added duplicate requirements from what the user specified.
++    target-requirements = [ sequence.unique $(target-requirements) ] ;
++
+     # Global, but conditional, requirements to give access to the interpreter
+     # for general utilities, like other toolsets, that run Python scripts.
+     toolset.add-requirements
+@@ -934,19 +947,6 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
+         toolset.add-requirements <target-os>$(target-os):<python>$(version:E=default) ;
+     }
+ 
+-    # We also set a default requirement that assigns the first python configured
+-    # for a particular target OS as the default. This makes it so that we can
+-    # select a python interpreter with only knowledge of the target OS. And hence
+-    # can configure different Pythons based on the target OS only.
+-    local toolset-requirements = [ toolset.requirements ] ;
+-    local toolset-target-os-requirements
+-        = [ property.evaluate-conditionals-in-context
+-            [ $(toolset-requirements).raw ] : <target-os>$(target-os) ] ;
+-    if ! <python> in $(toolset-target-os-requirements:G)
+-    {
+-        toolset.add-requirements <target-os>$(target-os):<python>$(version:E=default) ;
+-    }
+-
+     # Register the right suffix for extensions.
+     register-extension-suffix $(extension-suffix) : $(target-requirements) ;
+ 
+@@ -1038,6 +1038,22 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
+             : $(usage-requirements)
+             ;
+     }
++    
++}
++
++# Conditional rule specification that will prevent building of a target
++# if there is no matching python configuration available with the given
++# required properties.
++rule require-py ( properties * )
++{
++    local py-ext-target = [ $(.project).find python_for_extensions ] ;
++    local property-set = [ property-set.create $(properties) ] ;
++    property-set = [ $(property-set).expand ] ;
++    local py-ext-alternative = [ $(py-ext-target).select-alternatives $(property-set) ] ;
++    if ! $(py-ext-alternative)
++    {
++        return <build>no ;
++    }
+ }
+ 
+ 
+@@ -1298,5 +1314,11 @@ rule numpy-test ( name : sources * : requirements * )
+         : $(name) ] ;
+ }
+ 
++rule py-version ( n )
++{
++    return $(py$(n)-version) ;
++}
++
+ IMPORT $(__name__) : bpl-test : : bpl-test ;
+ IMPORT $(__name__) : numpy-test : : numpy-test ;
++IMPORT $(__name__) : py-version : : py-version ;
diff --git a/meta/recipes-support/boost/boost_1.63.0.bb b/meta/recipes-support/boost/boost_1.63.0.bb
index dd30934..1107686 100644
--- a/meta/recipes-support/boost/boost_1.63.0.bb
+++ b/meta/recipes-support/boost/boost_1.63.0.bb
@@ -11,4 +11,5 @@ SRC_URI += "\
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
     file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
+    file://py3.patch \
 "
-- 
2.8.1


