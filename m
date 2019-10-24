Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 464 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Oct 2019 11:30:14 UTC
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 710DB7F7A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:30:14 +0000 (UTC)
Received: from [192.168.178.37] (unknown [94.134.94.146])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 8392011A03F3;
	Thu, 24 Oct 2019 13:22:30 +0200 (CEST)
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	openembedded-core@lists.openembedded.org
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <bde8a8cd-fdf5-aa20-55e7-db9586f3f5a3@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 13:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
Cc: brendan.le.foll@intel.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com
Subject: Re: [RFC][PATCH 1/6] npm.bbclass: refactor the npm class
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
X-List-Received-Date: Thu, 24 Oct 2019 11:30:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jean-Marie,

Am 22.10.19 um 11:03 schrieb Jean-Marie LEMETAYER:
> Many issues were related to npm dependencies badly handled: package
> names, installation directories, ... In fact npm is using an install
> algorithm [1] which is hard to reproduce / anticipate.

Why do you think it is hard to reproduce?

> Moreover some
> npm packages use scopes [2] which adds more complexity.

The addition complexity is limited.

> 
> The simplest solution is to let npm do its job. Assuming the fetcher
> only get the sources of the package, the class will now run
> 'npm install' to create a build directory. The build directory is then
> copied wisely to the destination.

You use an full-blown package manager which total different design goals 
and no understanding for embedded / restricted systems.

> 
> 1: https://docs.npmjs.com/cli/install#algorithm
> 2: https://docs.npmjs.com/about-scopes
> 
> Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
> ---
>   meta/classes/npm.bbclass | 210 ++++++++++++++++++++++++++-------------
>   1 file changed, 143 insertions(+), 67 deletions(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 4b1f0a39f0..fc671e7223 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -1,19 +1,44 @@
> +# Copyright (C) 2019 Savoir-Faire Linux
> +#
> +# This bbclass builds and installs an npm package to the target. The package
> +# sources files should be fetched in the calling recipe by using the SRC_URI
> +# variable. The ${S} variable should be updated depending of your fetcher.
> +#
> +# Usage:
> +#  SRC_URI = "..."
> +#  inherit npm
> +#
> +# Optional variables:
> +#  NPM_SHRINKWRAP:
> +#       Provide a shrinkwrap file [1]. If available a shrinkwrap file in the
> +#       sources has priority over the one provided. A shrinkwrap file is
> +#       mandatory in order to ensure build reproducibility.
> +#       1: https://docs.npmjs.com/files/shrinkwrap.json
> +#
> +#  NPM_INSTALL_DEV:
> +#       Set to 1 to also install devDependencies.
> +#
> +#  NPM_REGISTRY:
> +#       Use the specified registry.
> +#
> +#  NPM_ARCH:
> +#       Override the auto generated npm architecture.
> +#
> +#  NPM_INSTALL_EXTRA_ARGS:
> +#       Add extra arguments to the 'npm install' execution.
> +#       Use it at your own risk.
> +
>   DEPENDS_prepend = "nodejs-native "
>   RDEPENDS_${PN}_prepend = "nodejs "
> -S = "${WORKDIR}/npmpkg"
>   
> -def node_pkgname(d):
> -    bpn = d.getVar('BPN')
> -    if bpn.startswith("node-"):
> -        return bpn[5:]
> -    return bpn
> +NPM_SHRINKWRAP ?= "${THISDIR}/${BPN}/npm-shrinkwrap.json"
>   
> -NPMPN ?= "${@node_pkgname(d)}"
> +NPM_INSTALL_DEV ?= "0"
>   
> -NPM_INSTALLDIR = "${libdir}/node_modules/${NPMPN}"
> +NPM_REGISTRY ?= "https://registry.npmjs.org"
>   
>   # function maps arch names to npm arch names
> -def npm_oe_arch_map(target_arch, d):
> +def npm_oe_arch_map(target_arch):
>       import re
>       if   re.match('p(pc|owerpc)(|64)', target_arch): return 'ppc'
>       elif re.match('i.86$', target_arch): return 'ia32'
> @@ -21,74 +46,125 @@ def npm_oe_arch_map(target_arch, d):
>       elif re.match('arm64$', target_arch): return 'arm'
>       return target_arch
>   
> -NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
> -NPM_INSTALL_DEV ?= "0"
> +NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'))}"
> +
> +NPM_INSTALL_EXTRA_ARGS ?= ""
> +
> +B = "${WORKDIR}/build"
> +
> +npm_install_shrinkwrap() {
> +    # This function ensures that there is a shrinkwrap file in the specified
> +    # directory. A shrinkwrap file is mandatory to have reproducible builds.
> +    # If the shrinkwrap file is not already included in the sources,
> +    # the recipe can provide one by using the NPM_SHRINKWRAP option.
> +    # This function returns the filename of the installed file (if any).
> +    if [ -f ${1}/npm-shrinkwrap.json ]
> +    then
> +        bbnote "Using the npm-shrinkwrap.json provided in the sources"
> +    elif [ -f ${NPM_SHRINKWRAP} ]
> +    then
> +        install -m 644 ${NPM_SHRINKWRAP} ${1}
> +        echo ${1}/npm-shrinkwrap.json
> +    else
> +        bbfatal "No mandatory NPM_SHRINKWRAP file found"
> +    fi
> +}
>   
>   npm_do_compile() {
> -	# Copy in any additionally fetched modules
> -	if [ -d ${WORKDIR}/node_modules ] ; then
> -		cp -a ${WORKDIR}/node_modules ${S}/
> -	fi
> -	# changing the home directory to the working directory, the .npmrc will
> -	# be created in this directory
> -	export HOME=${WORKDIR}
> -	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
> -		npm config set dev true
> -	else
> -		npm config set dev false
> -	fi
> -	npm set cache ${WORKDIR}/npm_cache
> -	# clear cache before every build
> -	npm cache clear --force
> -	# Install pkg into ${S} without going to the registry
> -	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
> -		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --no-registry install
> -	else
> -		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry install
> -	fi
> +    # This function executes the 'npm install' command which builds and
> +    # installs every dependencies needed for the package. All the files are
> +    # installed in a build directory ${B} without filtering anything. To do so,
> +    # a combination of 'npm pack' and 'npm install' is used to ensure that the
> +    # files in ${B} are actual copies instead of symbolic links (which is the
> +    # default npm behavior).
> +
> +    # The npm command use by default a cache which is located in '~/.npm'. In
> +    # order to force the next npm commands to disable caching, the npm cache
> +    # needs to be cleared. But not to alter the local cache, the npm config
> +    # needs to be updated to use another cache directory. The HOME needs to be
> +    # updated as well to avoid modifying the local '~/.npmrc' file.
> +    HOME=${WORKDIR}
> +    npm config set cache ${WORKDIR}/npm_cache
> +    npm cache clear --force
> +
> +    # First ensure that there is a shrinkwrap file in the sources.
> +    local NPM_SHRINKWRAP_INSTALLED=$(npm_install_shrinkwrap ${S})
> +
> +    # Then create a tarball from a npm package whose sources must be in ${S}.
> +    local NPM_PACK_FILE=$(cd ${WORKDIR} && npm pack ${S}/)
> +
> +    # Finally install and build the tarball package in ${B}.
> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --loglevel silly"
> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --prefix=${B}"
> +    local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --global"
> +
> +    if [ "${NPM_INSTALL_DEV}" != 1 ]
> +    then
> +        local NPM_INSTALL_ARGS="${NPM_INSTALL_ARGS} --production"
> +    fi
> +
> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS} --arch=${NPM_ARCH}"
> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS} --target_arch=${NPM_ARCH}"
> +    local NPM_INSTALL_GYP_ARGS="${NPM_INSTALL_GYP_ARGS} --release"
> +
> +    cd ${WORKDIR} && npm install \

Why you don't use "npm ci"?

> +        ${NPM_INSTALL_EXTRA_ARGS} \
> +        ${NPM_INSTALL_GYP_ARGS} \
> +        ${NPM_INSTALL_ARGS} \
> +        ${NPM_PACK_FILE}
> +
> +    # Clean source tree.
> +    rm -f ${NPM_SHRINKWRAP_INSTALLED}
>   }
>   
>   npm_do_install() {
> -	# changing the home directory to the working directory, the .npmrc will
> -	# be created in this directory
> -	export HOME=${WORKDIR}
> -	mkdir -p ${D}${libdir}/node_modules
> -	local NPM_PACKFILE=$(npm pack .)
> -	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPM_PACKFILE}
> -	ln -fs node_modules ${D}${libdir}/node
> -	find ${D}${NPM_INSTALLDIR} -type f \( -name "*.a" -o -name "*.d" -o -name "*.o" \) -delete
> -	if [ -d ${D}${prefix}/etc ] ; then
> -		# This will be empty
> -		rmdir ${D}${prefix}/etc
> -	fi
> -}
> +    # This function creates the destination directory from the pre installed
> +    # files in the ${B} directory.
> +
> +    # Copy the entire lib and bin directories from ${B} to ${D}.
> +    install -d ${D}/${libdir}
> +    cp --no-preserve=ownership --recursive ${B}/lib/. ${D}/${libdir}
> +
> +    if [ -d "${B}/bin" ]
> +    then
> +        install -d ${D}/${bindir}
> +        cp --no-preserve=ownership --recursive ${B}/bin/. ${D}/${bindir}
> +    fi
> +
> +    # If the package (or its dependencies) uses node-gyp to build native addons,
> +    # object files, static libraries or other temporary files can be hidden in
> +    # the lib directory. To reduce the package size and to avoid QA issues
> +    # (staticdev with static library files) these files must be removed.
> +
> +    # Remove any node-gyp directory in ${D} to remove temporary build files.
> +    for GYP_D_FILE in $(find ${D} -regex ".*/build/Release/[^/]*.node")
> +    do
> +        local GYP_D_DIR=${GYP_D_FILE%/Release/*}
> +
> +        rm --recursive --force ${GYP_D_DIR}
> +    done
> +
> +    # Copy only the node-gyp release files from ${B} to ${D}.
> +    for GYP_B_FILE in $(find ${B} -regex ".*/build/Release/[^/]*.node")
> +    do
> +        local GYP_D_FILE=${D}/${prefix}/${GYP_B_FILE#${B}}
> +
> +        install -d ${GYP_D_FILE%/*}
> +        install -m 755 ${GYP_B_FILE} ${GYP_D_FILE}
> +    done
> +
> +    # Remove the shrinkwrap file which does not need to be packed.
> +    rm -f ${D}/${libdir}/node_modules/*/npm-shrinkwrap.json
> +    rm -f ${D}/${libdir}/node_modules/@*/*/npm-shrinkwrap.json
>   
> -python populate_packages_prepend () {
> -    instdir = d.expand('${D}${NPM_INSTALLDIR}')
> -    extrapackages = oe.package.npm_split_package_dirs(instdir)
> -    pkgnames = extrapackages.keys()
> -    d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
> -    for pkgname in pkgnames:
> -        pkgrelpath, pdata = extrapackages[pkgname]
> -        pkgpath = '${NPM_INSTALLDIR}/' + pkgrelpath
> -        # package names can't have underscores but npm packages sometimes use them
> -        oe_pkg_name = pkgname.replace('_', '-')
> -        expanded_pkgname = d.expand(oe_pkg_name)
> -        d.setVar('FILES_%s' % expanded_pkgname, pkgpath)
> -        if pdata:
> -            version = pdata.get('version', None)
> -            if version:
> -                d.setVar('PKGV_%s' % expanded_pkgname, version)
> -            description = pdata.get('description', None)
> -            if description:
> -                d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'"))
> -    d.appendVar('RDEPENDS_%s' % d.getVar('PN'), ' %s' % ' '.join(pkgnames).replace('_', '-'))
> +    # node(1) is using /usr/lib/node as default include directory and npm(1) is
> +    # using /usr/lib/node_modules as install directory. Let's make both happy.
> +    ln -fs node_modules ${D}/${libdir}/node
>   }
>   
>   FILES_${PN} += " \
>       ${bindir} \
> -    ${libdir}/node \
> -    ${NPM_INSTALLDIR} \
> +    ${libdir} \
>   "
>   
>   EXPORT_FUNCTIONS do_compile do_install
> 

Regards
   Stefan

