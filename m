Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 796DE7FD82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id ACD229C01D8;
	Fri, 24 Jan 2020 12:07:54 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id P2X9_sFstj8g; Fri, 24 Jan 2020 12:07:53 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3AF419C02B0;
	Fri, 24 Jan 2020 12:07:53 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Evfs3rt8uaEv; Fri, 24 Jan 2020 12:07:53 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B01C19C01D8;
	Fri, 24 Jan 2020 12:07:51 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 18:07:31 +0100
Message-Id: <20200124170743.20463-2-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v6 01/13] classes/npm: refactor the npm class
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
X-List-Received-Date: Fri, 24 Jan 2020 17:07:53 -0000
Content-Transfer-Encoding: quoted-printable

This commit splits the npm build in three steps:

1. With the new npmsw fetcher, the sources and dependencies of the
   package have been fetched and unpacked. As sources can also be
   patched, a local cache must be configured to use these modified
   sources.

2. Next, the installation process is run using the local cache only.
   Some packages may need to be compiled.

3. The final installation filters the previously installed files to
   avoid unnecessary files.

This new version also fixes multiple issues related to npm dependencies
badly handled: package names, scope packages, installation directories

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/classes/npm.bbclass | 349 ++++++++++++++++++++++++++++++---------
 1 file changed, 274 insertions(+), 75 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 4b1f0a39f0..799b2a3829 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,94 +1,293 @@
+# Copyright (C) 2020 Savoir-Faire Linux
+#
+# SPDX-License-Identifier: GPL-2.0-only
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
+#  NPM_ARCH:
+#       Override the auto generated npm architecture.
+#
+#  NPM_INSTALL_DEV:
+#       Set to 1 to also install devDependencies.
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
+NPM_INSTALL_DEV ?=3D "0"
+
+def npm_target_arch_map(target_arch):
+    """Maps arch names to npm arch names"""
+    import re
+    if re.match("p(pc|owerpc)(|64)", target_arch):
+        return "ppc"
+    elif re.match("i.86$", target_arch):
+        return "ia32"
+    elif re.match("x86_64$", target_arch):
+        return "x64"
+    elif re.match("arm64$", target_arch):
+        return "arm"
+    return target_arch
+
+NPM_ARCH ?=3D "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
+
+NPM_PACKAGE =3D "${WORKDIR}/npm-package"
+NPM_CACHE =3D "${WORKDIR}/npm-cache"
+NPM_BUILD =3D "${WORKDIR}/npm-build"
=20
-NPMPN ?=3D "${@node_pkgname(d)}"
+def npm_global_configs(d):
+    """Get the npm global configuration"""
+    configs =3D []
+    # Configure the cache directory
+    configs.append(("cache", d.getVar("NPM_CACHE")))
+    return configs
=20
-NPM_INSTALLDIR =3D "${libdir}/node_modules/${NPMPN}"
+def npm_pack(env, srcdir, workdir):
+    """Run 'npm pack' on a specified directory"""
+    import shlex
+    cmd =3D "npm pack %s" % shlex.quote(srcdir)
+    configs =3D [("ignore-scripts", "true")]
+    tarball =3D env.run(cmd, configs=3Dconfigs, workdir=3Dworkdir).strip=
("\n")
+    return os.path.join(workdir, tarball)
=20
-# function maps arch names to npm arch names
-def npm_oe_arch_map(target_arch, d):
+python npm_do_configure() {
+    """
+    Step one: configure the npm cache and the main npm package
+
+    Every dependencies have been fetched and patched in the source direc=
tory.
+    They have to be packed (this remove unneeded files) and added to the=
 npm
+    cache to be available for the next step.
+
+    The main package and its associated manifest file and shrinkwrap fil=
e have
+    to be configured to take into account these cached dependencies.
+    """
+    import base64
+    import copy
+    import json
     import re
-    if   re.match('p(pc|owerpc)(|64)', target_arch): return 'ppc'
-    elif re.match('i.86$', target_arch): return 'ia32'
-    elif re.match('x86_64$', target_arch): return 'x64'
-    elif re.match('arm64$', target_arch): return 'arm'
-    return target_arch
+    import shlex
+    import tempfile
+    from bb.fetch2.npm import NpmEnvironment
+    from bb.fetch2.npm import npm_unpack
+    from bb.fetch2.npmsw import foreach_dependencies
+    from bb.progress import OutOfProgressHandler
=20
-NPM_ARCH ?=3D "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
-NPM_INSTALL_DEV ?=3D "0"
+    bb.utils.remove(d.getVar("NPM_CACHE"), recurse=3DTrue)
+    bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=3DTrue)
+
+    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
+
+    def _npm_cache_add(tarball):
+        """Run 'npm cache add' for a specified tarball"""
+        cmd =3D "npm cache add %s" % shlex.quote(tarball)
+        env.run(cmd)
+
+    def _npm_integrity(tarball):
+        """Return the npm integrity of a specified tarball"""
+        sha512 =3D bb.utils.sha512_file(tarball)
+        return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decod=
e()
+
+    def _npm_version(tarball):
+        """Return the version of a specified tarball"""
+        regex =3D r"-(\d+\.\d+\.\d+(-.*)?(\+.*)?)\.tgz"
+        return re.search(regex, tarball).group(1)
+
+    def _npmsw_dependency_dict(orig, deptree):
+        """
+        Return the sub dictionary in the 'orig' dictionary corresponding=
 to the
+        'deptree' dependency tree. This function follows the shrinkwrap =
file
+        format.
+        """
+        ptr =3D orig
+        for dep in deptree:
+            if "dependencies" not in ptr:
+                ptr["dependencies"] =3D {}
+            ptr =3D ptr["dependencies"]
+            if dep not in ptr:
+                ptr[dep] =3D {}
+            ptr =3D ptr[dep]
+        return ptr
+
+    # Manage the manifest file and shrinkwrap files
+    orig_manifest_file =3D d.expand("${S}/package.json")
+    orig_shrinkwrap_file =3D d.expand("${S}/npm-shrinkwrap.json")
+    cached_manifest_file =3D d.expand("${NPM_PACKAGE}/package.json")
+    cached_shrinkwrap_file =3D d.expand("${NPM_PACKAGE}/npm-shrinkwrap.j=
son")
+
+    with open(orig_manifest_file, "r") as f:
+        orig_manifest =3D json.load(f)
+
+    cached_manifest =3D copy.deepcopy(orig_manifest)
+    cached_manifest.pop("dependencies", None)
+    cached_manifest.pop("devDependencies", None)
+
+    with open(orig_shrinkwrap_file, "r") as f:
+        orig_shrinkwrap =3D json.load(f)
+
+    cached_shrinkwrap =3D copy.deepcopy(orig_shrinkwrap)
+    cached_shrinkwrap.pop("dependencies", None)
+
+    # Manage the dependencies
+    progress =3D OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
+    progress_total =3D 1 # also count the main package
+    progress_done =3D 0
+
+    def _count_dependency(name, params, deptree):
+        nonlocal progress_total
+        progress_total +=3D 1
+
+    def _cache_dependency(name, params, deptree):
+        destsubdirs =3D [os.path.join("node_modules", dep) for dep in de=
ptree]
+        destsuffix =3D os.path.join(*destsubdirs)
+        with tempfile.TemporaryDirectory() as tmpdir:
+            # Add the dependency to the npm cache
+            destdir =3D os.path.join(d.getVar("S"), destsuffix)
+            tarball =3D npm_pack(env, destdir, tmpdir)
+            _npm_cache_add(tarball)
+            # Add its signature to the cached shrinkwrap
+            dep =3D _npmsw_dependency_dict(cached_shrinkwrap, deptree)
+            dep["version"] =3D _npm_version(tarball)
+            dep["integrity"] =3D _npm_integrity(tarball)
+            if params.get("dev", False):
+                dep["dev"] =3D True
+            # Display progress
+            nonlocal progress_done
+            progress_done +=3D 1
+            progress.write("%d/%d" % (progress_done, progress_total))
+
+    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
+    foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
+    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
+
+    # Configure the main package
+    with tempfile.TemporaryDirectory() as tmpdir:
+        tarball =3D npm_pack(env, d.getVar("S"), tmpdir)
+        npm_unpack(tarball, d.getVar("NPM_PACKAGE"), d)
+
+    # Configure the cached manifest file and cached shrinkwrap file
+    def _update_manifest(depkey):
+        for name in orig_manifest.get(depkey, {}):
+            version =3D cached_shrinkwrap["dependencies"][name]["version=
"]
+            if depkey not in cached_manifest:
+                cached_manifest[depkey] =3D {}
+            cached_manifest[depkey][name] =3D version
=20
-npm_do_compile() {
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
+    _update_manifest("dependencies")
+
+    if dev:
+        _update_manifest("devDependencies")
+
+    with open(cached_manifest_file, "w") as f:
+        json.dump(cached_manifest, f, indent=3D2)
+
+    with open(cached_shrinkwrap_file, "w") as f:
+        json.dump(cached_shrinkwrap, f, indent=3D2)
 }
=20
-npm_do_install() {
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
+python npm_do_compile() {
+    """
+    Step two: install the npm package
+
+    Use the configured main package and the cached dependencies to run t=
he
+    installation process. The installation is done in a directory which =
is
+    not the destination directory yet.
+
+    A combination of 'npm pack' and 'npm install' is used to ensure that=
 the
+    installed files are actual copies instead of symbolic links (which i=
s the
+    default npm behavior).
+    """
+    import shlex
+    import tempfile
+    from bb.fetch2.npm import NpmEnvironment
+
+    bb.utils.remove(d.getVar("NPM_BUILD"), recurse=3DTrue)
+
+    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
+
+    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
+
+    with tempfile.TemporaryDirectory() as tmpdir:
+        configs =3D []
+
+        if dev:
+            configs.append(("also", "development"))
+        else:
+            configs.append(("only", "production"))
+
+        # Report as many logs as possible for debugging purpose
+        configs.append(("loglevel", "silly"))
+
+        # Configure the installation to be done globally in the build di=
rectory
+        configs.append(("global", "true"))
+        configs.append(("prefix", d.getVar("NPM_BUILD")))
+
+        # Add node-gyp configuration
+        configs.append(("arch", d.getVar("NPM_ARCH")))
+        configs.append(("release", "true"))
+
+        # Pack and install the main package
+        tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
+        env.run("npm install %s" % shlex.quote(tarball), configs=3Dconfi=
gs)
 }
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
+npm_do_install() {
+    # Step three: final install
+    #
+    # The previous installation have to be filtered to remove some extra=
 files.
+
+    rm -rf ${D}
+
+    # Copy the entire lib and bin directories
+    install -d ${D}/${nonarch_libdir}
+    cp --no-preserve=3Downership --recursive ${NPM_BUILD}/lib/. ${D}/${n=
onarch_libdir}
+
+    if [ -d "${NPM_BUILD}/bin" ]
+    then
+        install -d ${D}/${bindir}
+        cp --no-preserve=3Downership --recursive ${NPM_BUILD}/bin/. ${D}=
/${bindir}
+    fi
+
+    # If the package (or its dependencies) uses node-gyp to build native=
 addons,
+    # object files, static libraries or other temporary files can be hid=
den in
+    # the lib directory. To reduce the package size and to avoid QA issu=
es
+    # (staticdev with static library files) these files must be removed.
+    local GYP_REGEX=3D".*/build/Release/[^/]*.node"
+
+    # Remove any node-gyp directory in ${D} to remove temporary build fi=
les
+    for GYP_D_FILE in $(find ${D} -regex "${GYP_REGEX}")
+    do
+        local GYP_D_DIR=3D${GYP_D_FILE%/Release/*}
+
+        rm --recursive --force ${GYP_D_DIR}
+    done
+
+    # Copy only the node-gyp release files
+    for GYP_B_FILE in $(find ${NPM_BUILD} -regex "${GYP_REGEX}")
+    do
+        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${NPM_BUILD}}
+
+        install -d ${GYP_D_FILE%/*}
+        install -m 755 ${GYP_B_FILE} ${GYP_D_FILE}
+    done
+
+    # Remove the shrinkwrap file which does not need to be packed
+    rm -f ${D}/${nonarch_libdir}/node_modules/*/npm-shrinkwrap.json
+    rm -f ${D}/${nonarch_libdir}/node_modules/@*/*/npm-shrinkwrap.json
+
+    # node(1) is using /usr/lib/node as default include directory and np=
m(1) is
+    # using /usr/lib/node_modules as install directory. Let's make both =
happy.
+    ln -fs node_modules ${D}/${nonarch_libdir}/node
 }
=20
 FILES_${PN} +=3D " \
     ${bindir} \
-    ${libdir}/node \
-    ${NPM_INSTALLDIR} \
+    ${nonarch_libdir} \
 "
=20
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.20.1


