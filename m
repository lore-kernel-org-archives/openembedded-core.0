Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6077FA8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A9B5E9C0325;
	Fri, 25 Oct 2019 04:40:01 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 8F1ioDVvqMVt; Fri, 25 Oct 2019 04:40:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 545549C039F;
	Fri, 25 Oct 2019 04:40:00 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id BxoRZ59qUETs; Fri, 25 Oct 2019 04:40:00 -0400 (EDT)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 4B1539C0332;
	Fri, 25 Oct 2019 04:39:59 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 10:39:46 +0200
Message-Id: <20191025083952.14591-2-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [RFC][PATCH v2 1/7] npm.bbclass: refactor the npm class
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
X-List-Received-Date: Fri, 25 Oct 2019 08:40:00 -0000
Content-Transfer-Encoding: quoted-printable

Many issues were related to npm dependencies badly handled: package
names, installation directories, ... In fact npm is using an install
algorithm [1] which is hard to reproduce / anticipate. Moreover some
npm packages use scopes [2] which adds more complexity.

The simplest solution is to let npm do its job. Assuming the fetcher
only get the sources of the package, the class will now run
'npm install' to create a build directory. The build directory is then
copied wisely to the destination.

1: https://docs.npmjs.com/cli/install#algorithm
2: https://docs.npmjs.com/about-scopes

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 255 +++++++++++++++++++++++++++++----------
 1 file changed, 188 insertions(+), 67 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 4b1f0a39f0..1abb0f710a 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,19 +1,44 @@
+# Copyright (C) 2019 Savoir-Faire Linux
+#
+# This bbclass builds and installs an npm package to the target. The pac=
kage
+# sources files should be fetched in the calling recipe by using the SRC=
_URI
+# variable. The ${S} variable should be updated depending of your fetche=
r.
+#
+# Usage:
+#  SRC_URI =3D "..."
+#  inherit npm
+#
+# Optional variables:
+#  NPM_SHRINKWRAP:
+#       Provide a shrinkwrap file [1]. If available a shrinkwrap file in=
 the
+#       sources has priority over the one provided. A shrinkwrap file is
+#       mandatory in order to ensure build reproducibility.
+#       1: https://docs.npmjs.com/files/shrinkwrap.json
+#
+#  NPM_INSTALL_DEV:
+#       Set to 1 to also install devDependencies.
+#
+#  NPM_REGISTRY:
+#       Use the specified registry.
+#
+#  NPM_ARCH:
+#       Override the auto generated npm architecture.
+#
+#  NPM_INSTALL_EXTRA_ARGS:
+#       Add extra arguments to the 'npm install' execution.
+#       Use it at your own risk.
+
 DEPENDS_prepend =3D "nodejs-native "
 RDEPENDS_${PN}_prepend =3D "nodejs "
-S =3D "${WORKDIR}/npmpkg"
=20
-def node_pkgname(d):
-    bpn =3D d.getVar('BPN')
-    if bpn.startswith("node-"):
-        return bpn[5:]
-    return bpn
+NPM_SHRINKWRAP ?=3D "${THISDIR}/${BPN}/npm-shrinkwrap.json"
=20
-NPMPN ?=3D "${@node_pkgname(d)}"
+NPM_INSTALL_DEV ?=3D "0"
=20
-NPM_INSTALLDIR =3D "${libdir}/node_modules/${NPMPN}"
+NPM_REGISTRY ?=3D "http://registry.npmjs.org"
=20
 # function maps arch names to npm arch names
-def npm_oe_arch_map(target_arch, d):
+def npm_oe_arch_map(target_arch):
     import re
     if   re.match('p(pc|owerpc)(|64)', target_arch): return 'ppc'
     elif re.match('i.86$', target_arch): return 'ia32'
@@ -21,74 +46,170 @@ def npm_oe_arch_map(target_arch, d):
     elif re.match('arm64$', target_arch): return 'arm'
     return target_arch
=20
-NPM_ARCH ?=3D "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
-NPM_INSTALL_DEV ?=3D "0"
+NPM_ARCH ?=3D "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'))}"
+
+NPM_INSTALL_EXTRA_ARGS ?=3D ""
+
+NPM_CACHE ?=3D "${DL_DIR}/npm_cache"
+
+B =3D "${WORKDIR}/build"
+
+python do_fetch_append() {
+    import json
+    from bb.fetch2 import check_network_access
+    from bb.fetch2 import runfetchcmd
+
+    basecmd =3D "npm cache"
+    basecmd +=3D d.expand(" --cache=3D${NPM_CACHE}")
+    basecmd +=3D d.expand(" --registry=3D${NPM_REGISTRY}")
+
+    # Parse the shrinkwrap file
+    def get_shrinkwrap():
+        src_shrinkwrap =3D d.expand("${S}/npm-shrinkwrap.json")
+        src_package_lock =3D d.expand("${S}/package-lock.json")
+        npm_shrinkwrap =3D d.getVar("NPM_SHRINKWRAP")
+
+        if os.path.exists(src_shrinkwrap):
+            return src_shrinkwrap
+        elif os.path.exists(src_package_lock):
+            return src_package_lock
+        elif os.path.exists(npm_shrinkwrap):
+            return npm_shrinkwrap
+        else:
+            bb.fatal("No mandatory NPM_SHRINKWRAP file found")
+
+    with open(get_shrinkwrap(), "r") as f:
+        shrinkwrap =3D json.load(f)
+
+    # Cache dependencies
+    def cache_npm_dependencies(dependencies):
+        for name in dependencies:
+            version =3D dependencies[name]["version"]
+            cmd =3D basecmd + " add '{}@{}'".format(name, version)
+            check_network_access(d, cmd, d.getVar("NPM_REGISTRY"))
+            runfetchcmd(cmd, d)
+            cache_npm_dependencies(dependencies[name].get("dependencies"=
, {}))
+
+    cache_npm_dependencies(shrinkwrap.get("dependencies", {}))
+
+    # Verify the cache
+    runfetchcmd(basecmd + " verify", d)
+}
+
+do_fetch[depends] =3D "nodejs-native:do_populate_sysroot"
+
+npm_install_shrinkwrap() {
+    # This function ensures that there is a shrinkwrap file in the speci=
fied
+    # directory. A shrinkwrap file is mandatory to have reproducible bui=
lds.
+    # If the shrinkwrap file is not already included in the sources,
+    # the recipe can provide one by using the NPM_SHRINKWRAP option.
+    # This function returns the filename of the installed file (if any).
+    if [ -f ${S}/npm-shrinkwrap.json ]
+    then
+        bbnote "Using the npm-shrinkwrap.json provided in the sources"
+    elif [ -f ${S}/package-lock.json ]
+    then
+        bbnote "Using the package-lock.json provided in the sources"
+    elif [ -f ${NPM_SHRINKWRAP} ]
+    then
+        install -m 644 ${NPM_SHRINKWRAP} ${S}/npm-shrinkwrap.json
+        echo ${S}/npm-shrinkwrap.json
+    else
+        bbfatal "No mandatory NPM_SHRINKWRAP file found"
+    fi
+}
=20
 npm_do_compile() {
-	# Copy in any additionally fetched modules
-	if [ -d ${WORKDIR}/node_modules ] ; then
-		cp -a ${WORKDIR}/node_modules ${S}/
-	fi
-	# changing the home directory to the working directory, the .npmrc will
-	# be created in this directory
-	export HOME=3D${WORKDIR}
-	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
-		npm config set dev true
-	else
-		npm config set dev false
-	fi
-	npm set cache ${WORKDIR}/npm_cache
-	# clear cache before every build
-	npm cache clear --force
-	# Install pkg into ${S} without going to the registry
-	if [  "${NPM_INSTALL_DEV}" =3D "1" ]; then
-		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --no-registry ins=
tall
-	else
-		npm --arch=3D${NPM_ARCH} --target_arch=3D${NPM_ARCH} --production --no=
-registry install
-	fi
+    # This function executes the 'npm install' command which builds and
+    # installs every dependencies needed for the package. All the files =
are
+    # installed in a build directory ${B} without filtering anything. To=
 do so,
+    # a combination of 'npm pack' and 'npm install' is used to ensure th=
at the
+    # files in ${B} are actual copies instead of symbolic links (which i=
s the
+    # default npm behavior).
+
+    # First ensure that there is a shrinkwrap file in the sources.
+    local NPM_SHRINKWRAP_INSTALLED=3D$(npm_install_shrinkwrap)
+
+    # Then create a tarball from a npm package whose sources must be in =
${S}.
+    local NPM_PACK_FILE=3D$(cd ${WORKDIR} && npm pack --offline ${S}/)
+
+    # Clean source tree.
+    rm -f ${NPM_SHRINKWRAP_INSTALLED}
+
+    # Remove the build directory.
+    rm -rf ${B}
+
+    # Finally install and build the tarball package in ${B}.
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --cache=3D${NPM_CACHE}=
"
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --offline"
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --loglevel silly"
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --prefix=3D${B}"
+    local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --global"
+
+    if [ "${NPM_INSTALL_DEV}" !=3D 1 ]
+    then
+        local NPM_INSTALL_ARGS=3D"${NPM_INSTALL_ARGS} --production"
+    fi
+
+    local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --arch=3D${NPM=
_ARCH}"
+    local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --target_arch=3D=
${NPM_ARCH}"
+    local NPM_INSTALL_GYP_ARGS=3D"${NPM_INSTALL_GYP_ARGS} --release"
+
+    cd ${WORKDIR} && npm install \
+        ${NPM_INSTALL_EXTRA_ARGS} \
+        ${NPM_INSTALL_GYP_ARGS} \
+        ${NPM_INSTALL_ARGS} \
+        ${NPM_PACK_FILE}
 }
=20
 npm_do_install() {
-	# changing the home directory to the working directory, the .npmrc will
-	# be created in this directory
-	export HOME=3D${WORKDIR}
-	mkdir -p ${D}${libdir}/node_modules
-	local NPM_PACKFILE=3D$(npm pack .)
-	npm install --prefix ${D}${prefix} -g --arch=3D${NPM_ARCH} --target_arc=
h=3D${NPM_ARCH} --production --no-registry ${NPM_PACKFILE}
-	ln -fs node_modules ${D}${libdir}/node
-	find ${D}${NPM_INSTALLDIR} -type f \( -name "*.a" -o -name "*.d" -o -na=
me "*.o" \) -delete
-	if [ -d ${D}${prefix}/etc ] ; then
-		# This will be empty
-		rmdir ${D}${prefix}/etc
-	fi
-}
+    # This function creates the destination directory from the pre insta=
lled
+    # files in the ${B} directory.
+
+    # Copy the entire lib and bin directories from ${B} to ${D}.
+    install -d ${D}/${libdir}
+    cp --no-preserve=3Downership --recursive ${B}/lib/. ${D}/${libdir}
+
+    if [ -d "${B}/bin" ]
+    then
+        install -d ${D}/${bindir}
+        cp --no-preserve=3Downership --recursive ${B}/bin/. ${D}/${bindi=
r}
+    fi
+
+    # If the package (or its dependencies) uses node-gyp to build native=
 addons,
+    # object files, static libraries or other temporary files can be hid=
den in
+    # the lib directory. To reduce the package size and to avoid QA issu=
es
+    # (staticdev with static library files) these files must be removed.
+
+    # Remove any node-gyp directory in ${D} to remove temporary build fi=
les.
+    for GYP_D_FILE in $(find ${D} -regex ".*/build/Release/[^/]*.node")
+    do
+        local GYP_D_DIR=3D${GYP_D_FILE%/Release/*}
+
+        rm --recursive --force ${GYP_D_DIR}
+    done
+
+    # Copy only the node-gyp release files from ${B} to ${D}.
+    for GYP_B_FILE in $(find ${B} -regex ".*/build/Release/[^/]*.node")
+    do
+        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${B}}
+
+        install -d ${GYP_D_FILE%/*}
+        install -m 755 ${GYP_B_FILE} ${GYP_D_FILE}
+    done
+
+    # Remove the shrinkwrap file which does not need to be packed.
+    rm -f ${D}/${libdir}/node_modules/*/npm-shrinkwrap.json
+    rm -f ${D}/${libdir}/node_modules/@*/*/npm-shrinkwrap.json
=20
-python populate_packages_prepend () {
-    instdir =3D d.expand('${D}${NPM_INSTALLDIR}')
-    extrapackages =3D oe.package.npm_split_package_dirs(instdir)
-    pkgnames =3D extrapackages.keys()
-    d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
-    for pkgname in pkgnames:
-        pkgrelpath, pdata =3D extrapackages[pkgname]
-        pkgpath =3D '${NPM_INSTALLDIR}/' + pkgrelpath
-        # package names can't have underscores but npm packages sometime=
s use them
-        oe_pkg_name =3D pkgname.replace('_', '-')
-        expanded_pkgname =3D d.expand(oe_pkg_name)
-        d.setVar('FILES_%s' % expanded_pkgname, pkgpath)
-        if pdata:
-            version =3D pdata.get('version', None)
-            if version:
-                d.setVar('PKGV_%s' % expanded_pkgname, version)
-            description =3D pdata.get('description', None)
-            if description:
-                d.setVar('SUMMARY_%s' % expanded_pkgname, description.re=
place(u"\u2018", "'").replace(u"\u2019", "'"))
-    d.appendVar('RDEPENDS_%s' % d.getVar('PN'), ' %s' % ' '.join(pkgname=
s).replace('_', '-'))
+    # node(1) is using /usr/lib/node as default include directory and np=
m(1) is
+    # using /usr/lib/node_modules as install directory. Let's make both =
happy.
+    ln -fs node_modules ${D}/${libdir}/node
 }
=20
 FILES_${PN} +=3D " \
     ${bindir} \
-    ${libdir}/node \
-    ${NPM_INSTALLDIR} \
+    ${libdir} \
 "
=20
 EXPORT_FUNCTIONS do_compile do_install
--=20
2.20.1


