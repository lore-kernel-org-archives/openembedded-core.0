Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6A7C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:29:17 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web09.64.1637767755514419190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XnE2Q59Q;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id az37so5842727uab.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ej5Z+Sz6xF66ldlJECOx8UWQt3DbcSD00cwE351Q17U=;
        b=XnE2Q59QnywGhliUwVvWnJBUHAzXAUJKvcoL4ArYr18t6b66V2d0iTJIPfEK44uM6U
         bZZQJztOOyrPXZaQ2FcT56rhVFUEv2socPaLKb6hwHVBmZ4asvOJjVv5QPNhCFTDM0dP
         xvARAnoMJbCrvIdNPr1h0KFWAAAxRzdb2p/dtoH4pjd9LmbUz282UU1M4iTWsbGCTnmh
         0i3qBlH7mAFS49DKYSX22m7WEfwOkCMl48LVjQkSSx1jkJpmx6O4PhElhPYv9VVYgOJJ
         Ygtu0NhQcpXAHH9qxw6wbpnBoWQaAJWTdYBZ18uW+nU5O+EAmTC0M1ALJ0Ti5U9yijc+
         K81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ej5Z+Sz6xF66ldlJECOx8UWQt3DbcSD00cwE351Q17U=;
        b=ztv1Uv57w1RSfnamLm0VCh0aHFOZPjX1dDkl/bcHbqg2e2FSeJjE9A8cqyY0DlDwJM
         OtADMUhWIrP8Vy3pBbRaeeEyNFsVoTsv1bBzBG9GCID0tfuFUlaCUeIRqywY0xQgYtCd
         eUXjig5zddF91vJC08FkXHqNkNLywbvjF01xM5Vr4QrrukeQM5i8vmcD9iOG3cXVN0pM
         5WT7liu/zChg7qAF55pLu9GqW5wfWNpYohSUdtubheG7CEGM/D0ece6clNTT7wZFmvpK
         64MuZ5yEFjKkkPLPaUu4DssEpSrPpy7Ei5tMk+rnyV31sc+GLn345wsCeIdOvlZxwxin
         z/4Q==
X-Gm-Message-State: AOAM531ev1/6kKkM/CdbWUfVXiTp5ulPHP/B0GJYYWDTNSl10/3od1qO
	GaOQWM9mPKNVsXr+5Bx9MWL5Fo34qpqO6k7nQPA=
X-Google-Smtp-Source: 
 ABdhPJyf2pxDDOtxDEumDfphRxhw8x0gfUuwF61O01zymmZCRjndWlh5w9xx9G5zrLUbMuAfzsGP7Zw27BNwpSlNeac=
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr25607647vst.1.1637767754521;
 Wed, 24 Nov 2021 07:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-7-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-7-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:29:03 +0100
Message-ID: 
 <CANNYZj-_CtGHGB=oay-TDJZtFnHCVgeBeT1u2mZOD-z5d5MFjw@mail.gmail.com>
Subject: Re: [RFC PATCH 06/15] npm: Rework to use plain npm commands and avoid
 npm cache
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000003b9fea05d18a85ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:29:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158720

--0000000000003b9fea05d18a85ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think a longer commit message would be beneficial here as well, and in
7/8/9/10/11 patches. What has changed? How does the new class work and what
does it do at each step? What problems does it solve compared to the old
implementation? Please keep in mind that getting code to work is only half
the job, the other half is explaining it to other human beings.

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Rework the npm class to use plain npm commands and remove the usage of
> the npm cache to speed-up builds.
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/classes/npm.bbclass        | 340 +++++++++++---------------------
>  scripts/lib/devtool/standard.py |   6 +-
>  2 files changed, 119 insertions(+), 227 deletions(-)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index ba50fcac20..cb22dc6998 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -1,7 +1,12 @@
>  # Copyright (C) 2020 Savoir-Faire Linux
>  #
> +# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
> +# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com=
>
> +#
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
> +# A bbclass to install an npm package and build its dependencies.
> +#
>  # This bbclass builds and installs an npm package to the target. The
> package
>  # sources files should be fetched in the calling recipe by using the
> SRC_URI
>  # variable. The ${S} variable should be updated depending of your fetche=
r.
> @@ -16,18 +21,29 @@
>  #
>  #  NPM_INSTALL_DEV:
>  #       Set to 1 to also install devDependencies.
> +#
> +#  NPM_BUILD_PRUNE_FOR_PRODUCTION
> +#       Set to 0 to keep installed devDependencies.
>
>  inherit python3native
>
>  DEPENDS:prepend =3D "nodejs-native "
> -RDEPENDS:${PN}:append:class-target =3D " nodejs"
> +NPM_RDEPENDS =3D "nodejs"
> +RDEPENDS:${PN}:append:class-target =3D " ${NPM_RDEPENDS}"
>
> -EXTRA_OENPM =3D ""
> +EXTRA_OENPM ?=3D ""
> +EXTRA_OENPM_BUILD ?=3D ""
>
>  NPM_INSTALL_DEV ?=3D "0"
>
>  NPM_NODEDIR ?=3D "${RECIPE_SYSROOT_NATIVE}${prefix_native}"
>
> +def npm_flag_dev(value):
> +    if bb.utils.to_boolean(value, False):
> +        return "--also=3Ddevelopment"
> +    else:
> +        return "--only=3Dproduction"
> +
>  def npm_target_arch_map(target_arch):
>      """Maps arch names to npm arch names"""
>      import re
> @@ -43,247 +59,124 @@ def npm_target_arch_map(target_arch):
>
>  NPM_ARCH ?=3D "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
>
> -NPM_PACKAGE =3D "${WORKDIR}/npm-package"
>  NPM_CACHE =3D "${WORKDIR}/npm-cache"
> -NPM_BUILD =3D "${WORKDIR}/npm-build"
> -
> -def npm_global_configs(d):
> -    """Get the npm global configuration"""
> -    configs =3D []
> -    # Ensure no network access is done
> -    configs.append(("offline", "true"))
> -    configs.append(("proxy", "http://invalid"))
> -    # Configure the cache directory
> -    configs.append(("cache", d.getVar("NPM_CACHE")))
> -    return configs
> -
> -def npm_pack(env, srcdir, workdir):
> -    """Run 'npm pack' on a specified directory"""
> -    import shlex
> -    cmd =3D "npm pack %s" % shlex.quote(srcdir)
> -    args =3D [("ignore-scripts", "true")]
> -    tarball =3D env.run(cmd, args=3Dargs, workdir=3Dworkdir).strip("\n")
> -    return os.path.join(workdir, tarball)
> -
> -python npm_do_configure() {
> -    """
> -    Step one: configure the npm cache and the main npm package
> -
> -    Every dependencies have been fetched and patched in the source
> directory.
> -    They have to be packed (this remove unneeded files) and added to the
> npm
> -    cache to be available for the next step.
> -
> -    The main package and its associated manifest file and shrinkwrap fil=
e
> have
> -    to be configured to take into account these cached dependencies.
> -    """
> -    import base64
> -    import copy
> -    import json
> -    import re
> -    import shlex
> -    import tempfile
> -    from bb.fetch2.npm import NpmEnvironment
> -    from bb.fetch2.npm import npm_unpack
> -    from bb.fetch2.npmsw import foreach_dependencies
> -    from bb.progress import OutOfProgressHandler
> -
> -    bb.utils.remove(d.getVar("NPM_CACHE"), recurse=3DTrue)
> -    bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=3DTrue)
> -
> -    env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))
> -
> -    def _npm_cache_add(tarball):
> -        """Run 'npm cache add' for a specified tarball"""
> -        cmd =3D "npm cache add %s" % shlex.quote(tarball)
> -        env.run(cmd)
> -
> -    def _npm_integrity(tarball):
> -        """Return the npm integrity of a specified tarball"""
> -        sha512 =3D bb.utils.sha512_file(tarball)
> -        return "sha512-" +
> base64.b64encode(bytes.fromhex(sha512)).decode()
> -
> -    def _npm_version(tarball):
> -        """Return the version of a specified tarball"""
> -        regex =3D r"-(\d+\.\d+\.\d+(-.*)?(\+.*)?)\.tgz"
> -        return re.search(regex, tarball).group(1)
> -
> -    def _npmsw_dependency_dict(orig, deptree):
> -        """
> -        Return the sub dictionary in the 'orig' dictionary corresponding
> to the
> -        'deptree' dependency tree. This function follows the shrinkwrap
> file
> -        format.
> -        """
> -        ptr =3D orig
> -        for dep in deptree:
> -            if "dependencies" not in ptr:
> -                ptr["dependencies"] =3D {}
> -            ptr =3D ptr["dependencies"]
> -            if dep not in ptr:
> -                ptr[dep] =3D {}
> -            ptr =3D ptr[dep]
> -        return ptr
> -
> -    # Manage the manifest file and shrinkwrap files
> -    orig_manifest_file =3D d.expand("${S}/package.json")
> -    orig_shrinkwrap_file =3D d.expand("${S}/npm-shrinkwrap.json")
> -    cached_manifest_file =3D d.expand("${NPM_PACKAGE}/package.json")
> -    cached_shrinkwrap_file =3D
> d.expand("${NPM_PACKAGE}/npm-shrinkwrap.json")
> -
> -    with open(orig_manifest_file, "r") as f:
> -        orig_manifest =3D json.load(f)
> -
> -    cached_manifest =3D copy.deepcopy(orig_manifest)
> -    cached_manifest.pop("dependencies", None)
> -    cached_manifest.pop("devDependencies", None)
> -
> -    has_shrinkwrap_file =3D True
> -
> -    try:
> -        with open(orig_shrinkwrap_file, "r") as f:
> -            orig_shrinkwrap =3D json.load(f)
> -    except IOError:
> -        has_shrinkwrap_file =3D False
> -
> -    if has_shrinkwrap_file:
> -       cached_shrinkwrap =3D copy.deepcopy(orig_shrinkwrap)
> -       cached_shrinkwrap.pop("dependencies", None)
> -
> -    # Manage the dependencies
> -    progress =3D OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
> -    progress_total =3D 1 # also count the main package
> -    progress_done =3D 0
> -
> -    def _count_dependency(name, params, deptree):
> -        nonlocal progress_total
> -        progress_total +=3D 1
> -
> -    def _cache_dependency(name, params, deptree):
> -        destsubdirs =3D [os.path.join("node_modules", dep) for dep in
> deptree]
> -        destsuffix =3D os.path.join(*destsubdirs)
> -        with tempfile.TemporaryDirectory() as tmpdir:
> -            # Add the dependency to the npm cache
> -            destdir =3D os.path.join(d.getVar("S"), destsuffix)
> -            tarball =3D npm_pack(env, destdir, tmpdir)
> -            _npm_cache_add(tarball)
> -            # Add its signature to the cached shrinkwrap
> -            dep =3D _npmsw_dependency_dict(cached_shrinkwrap, deptree)
> -            dep["version"] =3D _npm_version(tarball)
> -            dep["integrity"] =3D _npm_integrity(tarball)
> -            if params.get("dev", False):
> -                dep["dev"] =3D True
> -            # Display progress
> -            nonlocal progress_done
> -            progress_done +=3D 1
> -            progress.write("%d/%d" % (progress_done, progress_total))
> -
> -    dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
> -
> -    if has_shrinkwrap_file:
> -        foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
> -        foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
> -
> -    # Configure the main package
> -    with tempfile.TemporaryDirectory() as tmpdir:
> -        tarball =3D npm_pack(env, d.getVar("S"), tmpdir)
> -        npm_unpack(tarball, d.getVar("NPM_PACKAGE"), d)
> -
> -    # Configure the cached manifest file and cached shrinkwrap file
> -    def _update_manifest(depkey):
> -        for name in orig_manifest.get(depkey, {}):
> -            version =3D cached_shrinkwrap["dependencies"][name]["version=
"]
> -            if depkey not in cached_manifest:
> -                cached_manifest[depkey] =3D {}
> -            cached_manifest[depkey][name] =3D version
> -
> -    if has_shrinkwrap_file:
> -        _update_manifest("dependencies")
> -
> -    if dev:
> -        if has_shrinkwrap_file:
> -            _update_manifest("devDependencies")
> -
> -    with open(cached_manifest_file, "w") as f:
> -        json.dump(cached_manifest, f, indent=3D2)
> -
> -    if has_shrinkwrap_file:
> -        with open(cached_shrinkwrap_file, "w") as f:
> -            json.dump(cached_shrinkwrap, f, indent=3D2)
> -}
> -
> -python npm_do_compile() {
> -    """
> -    Step two: install the npm package
>
> -    Use the configured main package and the cached dependencies to run t=
he
> -    installation process. The installation is done in a directory which =
is
> -    not the destination directory yet.
> +NPM_PRUNE_FOR_PRODUCTION ?=3D "1"
>
> -    A combination of 'npm pack' and 'npm install' is used to ensure that
> the
> -    installed files are actual copies instead of symbolic links (which i=
s
> the
> -    default npm behavior).
> -    """
> -    import shlex
> -    import tempfile
> -    from bb.fetch2.npm import NpmEnvironment
> +B =3D "${WORKDIR}/build"
>
> -    bb.utils.remove(d.getVar("NPM_BUILD"), recurse=3DTrue)
> +NPM_SOURCEPATH ?=3D "${S}"
>
> -    with tempfile.TemporaryDirectory() as tmpdir:
> -        args =3D []
> -        configs =3D npm_global_configs(d)
> +export NPM_CONFIG_GLOBALCONFIG =3D "${WORKDIR}/npmrc"
> +export NPM_CONFIG_USERCONFIG =3D "/dev/null"
>
> -        if bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False):
> -            configs.append(("also", "development"))
> -        else:
> -            configs.append(("only", "production"))
> -
> -        # Report as many logs as possible for debugging purpose
> -        configs.append(("loglevel", "silly"))
> +oe_runnpm_plain() {
> +    HOME=3D${B}/root npm "$@"
> +}
>
> -        # Configure the installation to be done globally in the build
> directory
> -        configs.append(("global", "true"))
> -        configs.append(("prefix", d.getVar("NPM_BUILD")))
> +oe_runnpm() {
> +    bbnote npm "$@"
> +    oe_runnpm_plain "$@"
> +}
>
> -        # Add node-gyp configuration
> -        configs.append(("arch", d.getVar("NPM_ARCH")))
> -        configs.append(("release", "true"))
> -        configs.append(("nodedir", d.getVar("NPM_NODEDIR")))
> -        configs.append(("python", d.getVar("PYTHON")))
> +oe_runnpm_pack() {
> +    oe_runnpm_plain pack --ignore-scripts --loglevel=3Dwarn "$@"
> +}
>
> -        env =3D NpmEnvironment(d, configs)
> +oe_runnpm_rebuild() {
> +    arch=3D$1
> +    shift
>
> -        # Add node-pre-gyp configuration
> -        args.append(("target_arch", d.getVar("NPM_ARCH")))
> -        args.append(("build-from-source", "true"))
> +    # Create symlinks for package executables
> +    # because rebuild doesn't respect the dependency tree
> +    oe_runnpm rebuild --ignore-scripts
>
> -        # Pack and install the main package
> -        tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
> -        cmd =3D "npm install %s %s" % (shlex.quote(tarball),
> d.getVar("EXTRA_OENPM"))
> -        env.run(cmd, args=3Dargs)
> +    # Rebuild dependencies
> +    oe_runnpm rebuild \
> +        --arch=3D${arch} \
> +        --target_arch=3D${arch} \
> +        --build-from-source \
> +        "$@"
>  }
>
> -npm_do_install() {
> -    # Step three: final install
> -    #
> -    # The previous installation have to be filtered to remove some extra
> files.
> +do_generate_npmrc() {
> +    cat > ${NPM_CONFIG_GLOBALCONFIG} <<EOF
> +cache=3D${NPM_CACHE}
> +loglevel=3Dsilly
> +offline=3Dtrue
> +package-lock=3Dfalse
> +proxy=3Dhttp://invalid
> +; node-gyp
> +arch=3D${NPM_ARCH}
> +nodedir=3D${NPM_NODEDIR}
> +python=3D${PYTHON}
> +release=3Dtrue
> +EOF
> +}
> +do_generate_npmrc[vardeps] +=3D "NPM_ARCH NPM_CACHE NPM_CONFIG_GLOBALCON=
FIG
> NPM_NODEDIR PYTHON"
> +addtask generate_npmrc after do_patch before do_populate_cache
>
> -    rm -rf ${D}
> +npm_do_configure() {
> +    :
> +}
>
> -    # Copy the entire lib and bin directories
> -    install -d ${D}/${nonarch_libdir}
> -    cp --no-preserve=3Downership --recursive ${NPM_BUILD}/lib/.
> ${D}/${nonarch_libdir}
> +npm_do_compile() {
> +    # Create a tarball from main npm package
> +    # to respect ignore files and files property of package.json
> +    cd ${B}/pkg
> +    tarball=3D$(oe_runnpm_pack ${NPM_SOURCEPATH})
> +    [ -n "${tarball}" ] || exit 1
> +
> +    # Unpack main npm package
> +    mkdir ${B}/lib/node_modules/${BPN}/
> +    tar -xzf ${B}/pkg/$tarball --no-same-owner \
> +        --strip-components=3D1 -C ${B}/lib/node_modules/${BPN}
> +
> +    # Copy npm dependencies from sources
> +    if [ -d ${S}/node_modules ]; then
> +        # Copy sources without preserve mode and ownership
> +        # to prevent ugly file permissions
> +        mkdir ${B}/lib/node_modules/${BPN}/node_modules
> +        cp -a --no-preserve=3Dmode,ownership \
> +            ${S}/node_modules/. ${B}/lib/node_modules/${BPN}/node_module=
s/
> +
> +        # Prune dependencies for production
> +        if [ "${NPM_INSTALL_DEV}" =3D "1" -a "${NPM_PRUNE_FOR_PRODUCTION=
}"
> =3D "1" ] ; then
> +            oe_runnpm prune --only=3Dproduction
> +        fi
> +
> +        # Rebuild dependencies inside node_modules folder
> +        # to create bin links in .bin folder
> +        cd ${B}/lib/node_modules
> +        oe_runnpm_rebuild ${NPM_ARCH} ${EXTRA_OENPM}
> +    fi
> +}
> +do_compile[cleandirs] =3D "${B}/lib/node_modules ${B}/pkg"
>
> -    if [ -d "${NPM_BUILD}/bin" ]
> -    then
> -        install -d ${D}/${bindir}
> -        cp --no-preserve=3Downership --recursive ${NPM_BUILD}/bin/.
> ${D}/${bindir}
> +npm_do_install() {
> +    # Copy the entire main node_modules directory
> +    install -d ${D}${nonarch_libdir}
> +    cp -a --no-preserve=3Downership ${B}/lib/node_modules \
> +        ${D}${nonarch_libdir}/
> +
> +    # Create symlinks for package executables
> +    if [ -d ${D}${nonarch_libdir}/node_modules/.bin ]; then
> +        install -d ${D}${bindir}
> +        for f in ${D}${nonarch_libdir}/node_modules/.bin/*; do
> +            name=3D"$(basename $f)"
> +            link=3D"$(readlink $f)"
> +            target=3D"$(realpath -m --relative-to ${D}${bindir} \
> +                ${D}${nonarch_libdir}/node_modules/.bin/$link)"
> +            ln -s "$target" "${D}${bindir}/$name"
> +        done
> +        rm -rf ${D}${nonarch_libdir}/node_modules/.bin
>      fi
>
>      # If the package (or its dependencies) uses node-gyp to build native
> addons,
>      # object files, static libraries or other temporary files can be
> hidden in
>      # the lib directory. To reduce the package size and to avoid QA issu=
es
>      # (staticdev with static library files) these files must be removed.
> -    local GYP_REGEX=3D".*/build/Release/[^/]*.node"
> +    local GYP_REGEX=3D".*/build.*/Release/[^/]*.node"
>
>      # Remove any node-gyp directory in ${D} to remove temporary build
> files
>      for GYP_D_FILE in $(find ${D} -regex "${GYP_REGEX}")
> @@ -294,9 +187,9 @@ npm_do_install() {
>      done
>
>      # Copy only the node-gyp release files
> -    for GYP_B_FILE in $(find ${NPM_BUILD} -regex "${GYP_REGEX}")
> +    for GYP_B_FILE in $(find ${B}/pkg -regex "${GYP_REGEX}")
>      do
> -        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${NPM_BUILD}}
> +        local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE#${B}/pkg}
>
>          install -d ${GYP_D_FILE%/*}
>          install -m 755 ${GYP_B_FILE} ${GYP_D_FILE}
> @@ -310,6 +203,7 @@ npm_do_install() {
>      # using /usr/lib/node_modules as install directory. Let's make both
> happy.
>      ln -fs node_modules ${D}/${nonarch_libdir}/node
>  }
> +do_install[cleandirs] =3D "${D}"
>
>  FILES:${PN} +=3D " \
>      ${bindir} \
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 01fb5ad96f..10dc2b1373 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -260,10 +260,8 @@ def add(args, config, basepath, workspace):
>                  f.write('}\n')
>
>              if bb.data.inherits_class('npm', rd):
> -                f.write('python do_configure:append() {\n')
> -                f.write('    pkgdir =3D d.getVar("NPM_PACKAGE")\n')
> -                f.write('    lockfile =3D os.path.join(pkgdir,
> "singletask.lock")\n')
> -                f.write('    bb.utils.remove(lockfile)\n')
> +                f.write('do_configure:append() {\n')
> +                f.write('    rm -f ${NPM_PACKAGE}/singletask.lock\n')
>                  f.write('}\n')
>
>          # Check if the new layer provides recipes whose priorities have
> been
> --
> 2.20.1
>
>

--0000000000003b9fea05d18a85ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think a longer commit message would be beneficial h=
ere as well, and in 7/8/9/10/11 patches. What has changed? How does the new=
 class work and what does it do at each step? What problems does it solve c=
ompared to the old implementation? Please keep in mind that getting code to=
 work is only half the job, the other half is explaining it to other human =
beings.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 2021 at 15:48=
, Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@w=
eidmueller.com" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier@=
weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</=
a>&gt;<br>
<br>
Rework the npm class to use plain npm commands and remove the usage of<br>
the npm cache to speed-up builds.<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/classes/npm.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 340 +++++++++++=
---------------------<br>
=C2=A0scripts/lib/devtool/standard.py |=C2=A0 =C2=A06 +-<br>
=C2=A02 files changed, 119 insertions(+), 227 deletions(-)<br>
<br>
diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass<br>
index ba50fcac20..cb22dc6998 100644<br>
--- a/meta/classes/npm.bbclass<br>
+++ b/meta/classes/npm.bbclass<br>
@@ -1,7 +1,12 @@<br>
=C2=A0# Copyright (C) 2020 Savoir-Faire Linux<br>
=C2=A0#<br>
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH &amp; Co. KG<br>
+# Author: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsme=
ier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.c=
om</a>&gt;<br>
+#<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
+# A bbclass to install an npm package and build its dependencies.<br>
+#<br>
=C2=A0# This bbclass builds and installs an npm package to the target. The =
package<br>
=C2=A0# sources files should be fetched in the calling recipe by using the =
SRC_URI<br>
=C2=A0# variable. The ${S} variable should be updated depending of your fet=
cher.<br>
@@ -16,18 +21,29 @@<br>
=C2=A0#<br>
=C2=A0#=C2=A0 NPM_INSTALL_DEV:<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Set to 1 to also install devDependencies.=
<br>
+#<br>
+#=C2=A0 NPM_BUILD_PRUNE_FOR_PRODUCTION<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0Set to 0 to keep installed devDependencies.<br=
>
<br>
=C2=A0inherit python3native<br>
<br>
=C2=A0DEPENDS:prepend =3D &quot;nodejs-native &quot;<br>
-RDEPENDS:${PN}:append:class-target =3D &quot; nodejs&quot;<br>
+NPM_RDEPENDS =3D &quot;nodejs&quot;<br>
+RDEPENDS:${PN}:append:class-target =3D &quot; ${NPM_RDEPENDS}&quot;<br>
<br>
-EXTRA_OENPM =3D &quot;&quot;<br>
+EXTRA_OENPM ?=3D &quot;&quot;<br>
+EXTRA_OENPM_BUILD ?=3D &quot;&quot;<br>
<br>
=C2=A0NPM_INSTALL_DEV ?=3D &quot;0&quot;<br>
<br>
=C2=A0NPM_NODEDIR ?=3D &quot;${RECIPE_SYSROOT_NATIVE}${prefix_native}&quot;=
<br>
<br>
+def npm_flag_dev(value):<br>
+=C2=A0 =C2=A0 if bb.utils.to_boolean(value, False):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;--also=3Ddevelopment&quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;--only=3Dproduction&quot;<br>
+<br>
=C2=A0def npm_target_arch_map(target_arch):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Maps arch names to npm arch names&quo=
t;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
@@ -43,247 +59,124 @@ def npm_target_arch_map(target_arch):<br>
<br>
=C2=A0NPM_ARCH ?=3D &quot;${@npm_target_arch_map(d.getVar(&quot;TARGET_ARCH=
&quot;))}&quot;<br>
<br>
-NPM_PACKAGE =3D &quot;${WORKDIR}/npm-package&quot;<br>
=C2=A0NPM_CACHE =3D &quot;${WORKDIR}/npm-cache&quot;<br>
-NPM_BUILD =3D &quot;${WORKDIR}/npm-build&quot;<br>
-<br>
-def npm_global_configs(d):<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;Get the npm global configuration&quot;&quo=
t;&quot;<br>
-=C2=A0 =C2=A0 configs =3D []<br>
-=C2=A0 =C2=A0 # Ensure no network access is done<br>
-=C2=A0 =C2=A0 configs.append((&quot;offline&quot;, &quot;true&quot;))<br>
-=C2=A0 =C2=A0 configs.append((&quot;proxy&quot;, &quot;<a href=3D"http://i=
nvalid" rel=3D"noreferrer" target=3D"_blank">http://invalid</a>&quot;))<br>
-=C2=A0 =C2=A0 # Configure the cache directory<br>
-=C2=A0 =C2=A0 configs.append((&quot;cache&quot;, d.getVar(&quot;NPM_CACHE&=
quot;)))<br>
-=C2=A0 =C2=A0 return configs<br>
-<br>
-def npm_pack(env, srcdir, workdir):<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;Run &#39;npm pack&#39; on a specified dire=
ctory&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 import shlex<br>
-=C2=A0 =C2=A0 cmd =3D &quot;npm pack %s&quot; % shlex.quote(srcdir)<br>
-=C2=A0 =C2=A0 args =3D [(&quot;ignore-scripts&quot;, &quot;true&quot;)]<br=
>
-=C2=A0 =C2=A0 tarball =3D env.run(cmd, args=3Dargs, workdir=3Dworkdir).str=
ip(&quot;\n&quot;)<br>
-=C2=A0 =C2=A0 return os.path.join(workdir, tarball)<br>
-<br>
-python npm_do_configure() {<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Step one: configure the npm cache and the main npm package<b=
r>
-<br>
-=C2=A0 =C2=A0 Every dependencies have been fetched and patched in the sour=
ce directory.<br>
-=C2=A0 =C2=A0 They have to be packed (this remove unneeded files) and adde=
d to the npm<br>
-=C2=A0 =C2=A0 cache to be available for the next step.<br>
-<br>
-=C2=A0 =C2=A0 The main package and its associated manifest file and shrink=
wrap file have<br>
-=C2=A0 =C2=A0 to be configured to take into account these cached dependenc=
ies.<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 import base64<br>
-=C2=A0 =C2=A0 import copy<br>
-=C2=A0 =C2=A0 import json<br>
-=C2=A0 =C2=A0 import re<br>
-=C2=A0 =C2=A0 import shlex<br>
-=C2=A0 =C2=A0 import tempfile<br>
-=C2=A0 =C2=A0 from bb.fetch2.npm import NpmEnvironment<br>
-=C2=A0 =C2=A0 from bb.fetch2.npm import npm_unpack<br>
-=C2=A0 =C2=A0 from bb.fetch2.npmsw import foreach_dependencies<br>
-=C2=A0 =C2=A0 from bb.progress import OutOfProgressHandler<br>
-<br>
-=C2=A0 =C2=A0 bb.utils.remove(d.getVar(&quot;NPM_CACHE&quot;), recurse=3DT=
rue)<br>
-=C2=A0 =C2=A0 bb.utils.remove(d.getVar(&quot;NPM_PACKAGE&quot;), recurse=
=3DTrue)<br>
-<br>
-=C2=A0 =C2=A0 env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(d))<b=
r>
-<br>
-=C2=A0 =C2=A0 def _npm_cache_add(tarball):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Run &#39;npm cache add&#39; =
for a specified tarball&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;npm cache add %s&quot; % shlex.q=
uote(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env.run(cmd)<br>
-<br>
-=C2=A0 =C2=A0 def _npm_integrity(tarball):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return the npm integrity of =
a specified tarball&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha512 =3D bb.utils.sha512_file(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sha512-&quot; + base64.b64encode(=
bytes.fromhex(sha512)).decode()<br>
-<br>
-=C2=A0 =C2=A0 def _npm_version(tarball):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return the version of a spec=
ified tarball&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 regex =3D r&quot;-(\d+\.\d+\.\d+(-.*)?(\+.*)?)=
\.tgz&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return re.search(regex, tarball).group(1)<br>
-<br>
-=C2=A0 =C2=A0 def _npmsw_dependency_dict(orig, deptree):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Return the sub dictionary in the &#39;orig&#39=
; dictionary corresponding to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;deptree&#39; dependency tree. This functi=
on follows the shrinkwrap file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 format.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D orig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in deptree:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;dependencies&quot; not =
in ptr:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr[&quot;dependen=
cies&quot;] =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ptr[&quot;dependencies&q=
uot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep not in ptr:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr[dep] =3D {}<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ptr[dep]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ptr<br>
-<br>
-=C2=A0 =C2=A0 # Manage the manifest file and shrinkwrap files<br>
-=C2=A0 =C2=A0 orig_manifest_file =3D d.expand(&quot;${S}/package.json&quot=
;)<br>
-=C2=A0 =C2=A0 orig_shrinkwrap_file =3D d.expand(&quot;${S}/npm-shrinkwrap.=
json&quot;)<br>
-=C2=A0 =C2=A0 cached_manifest_file =3D d.expand(&quot;${NPM_PACKAGE}/packa=
ge.json&quot;)<br>
-=C2=A0 =C2=A0 cached_shrinkwrap_file =3D d.expand(&quot;${NPM_PACKAGE}/npm=
-shrinkwrap.json&quot;)<br>
-<br>
-=C2=A0 =C2=A0 with open(orig_manifest_file, &quot;r&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_manifest =3D json.load(f)<br>
-<br>
-=C2=A0 =C2=A0 cached_manifest =3D copy.deepcopy(orig_manifest)<br>
-=C2=A0 =C2=A0 cached_manifest.pop(&quot;dependencies&quot;, None)<br>
-=C2=A0 =C2=A0 cached_manifest.pop(&quot;devDependencies&quot;, None)<br>
-<br>
-=C2=A0 =C2=A0 has_shrinkwrap_file =3D True<br>
-<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(orig_shrinkwrap_file, &quot;r&quot;)=
 as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 orig_shrinkwrap =3D json.load(f)=
<br>
-=C2=A0 =C2=A0 except IOError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_shrinkwrap_file =3D False<br>
-<br>
-=C2=A0 =C2=A0 if has_shrinkwrap_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cached_shrinkwrap =3D copy.deepcopy(orig_shrink=
wrap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cached_shrinkwrap.pop(&quot;dependencies&quot;,=
 None)<br>
-<br>
-=C2=A0 =C2=A0 # Manage the dependencies<br>
-=C2=A0 =C2=A0 progress =3D OutOfProgressHandler(d, r&quot;^(\d+)/(\d+)$&qu=
ot;)<br>
-=C2=A0 =C2=A0 progress_total =3D 1 # also count the main package<br>
-=C2=A0 =C2=A0 progress_done =3D 0<br>
-<br>
-=C2=A0 =C2=A0 def _count_dependency(name, params, deptree):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nonlocal progress_total<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 progress_total +=3D 1<br>
-<br>
-=C2=A0 =C2=A0 def _cache_dependency(name, params, deptree):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 destsubdirs =3D [os.path.join(&quot;node_modul=
es&quot;, dep) for dep in deptree]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D os.path.join(*destsubdirs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.TemporaryDirectory() as tmpdir:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the dependency to the npm =
cache<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D os.path.join(d.getVa=
r(&quot;S&quot;), destsuffix)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball =3D npm_pack(env, destdi=
r, tmpdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _npm_cache_add(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add its signature to the cache=
d shrinkwrap<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D _npmsw_dependency_dict(c=
ached_shrinkwrap, deptree)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep[&quot;version&quot;] =3D _np=
m_version(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep[&quot;integrity&quot;] =3D _=
npm_integrity(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if params.get(&quot;dev&quot;, F=
alse):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep[&quot;dev&quot=
;] =3D True<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Display progress<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nonlocal progress_done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 progress_done +=3D 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 progress.write(&quot;%d/%d&quot;=
 % (progress_done, progress_total))<br>
-<br>
-=C2=A0 =C2=A0 dev =3D bb.utils.to_boolean(d.getVar(&quot;NPM_INSTALL_DEV&q=
uot;), False)<br>
-<br>
-=C2=A0 =C2=A0 if has_shrinkwrap_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach_dependencies(orig_shrinkwrap, _count_d=
ependency, dev)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach_dependencies(orig_shrinkwrap, _cache_d=
ependency, dev)<br>
-<br>
-=C2=A0 =C2=A0 # Configure the main package<br>
-=C2=A0 =C2=A0 with tempfile.TemporaryDirectory() as tmpdir:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball =3D npm_pack(env, d.getVar(&quot;S&quo=
t;), tmpdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 npm_unpack(tarball, d.getVar(&quot;NPM_PACKAGE=
&quot;), d)<br>
-<br>
-=C2=A0 =C2=A0 # Configure the cached manifest file and cached shrinkwrap f=
ile<br>
-=C2=A0 =C2=A0 def _update_manifest(depkey):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in orig_manifest.get(depkey, {}):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D cached_shrinkwrap[&q=
uot;dependencies&quot;][name][&quot;version&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if depkey not in cached_manifest=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cached_manifest[de=
pkey] =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cached_manifest[depkey][name] =
=3D version<br>
-<br>
-=C2=A0 =C2=A0 if has_shrinkwrap_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _update_manifest(&quot;dependencies&quot;)<br>
-<br>
-=C2=A0 =C2=A0 if dev:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if has_shrinkwrap_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _update_manifest(&quot;devDepend=
encies&quot;)<br>
-<br>
-=C2=A0 =C2=A0 with open(cached_manifest_file, &quot;w&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(cached_manifest, f, indent=3D2)<br>
-<br>
-=C2=A0 =C2=A0 if has_shrinkwrap_file:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(cached_shrinkwrap_file, &quot;w&quot=
;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(cached_shrinkwrap, f, =
indent=3D2)<br>
-}<br>
-<br>
-python npm_do_compile() {<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Step two: install the npm package<br>
<br>
-=C2=A0 =C2=A0 Use the configured main package and the cached dependencies =
to run the<br>
-=C2=A0 =C2=A0 installation process. The installation is done in a director=
y which is<br>
-=C2=A0 =C2=A0 not the destination directory yet.<br>
+NPM_PRUNE_FOR_PRODUCTION ?=3D &quot;1&quot;<br>
<br>
-=C2=A0 =C2=A0 A combination of &#39;npm pack&#39; and &#39;npm install&#39=
; is used to ensure that the<br>
-=C2=A0 =C2=A0 installed files are actual copies instead of symbolic links =
(which is the<br>
-=C2=A0 =C2=A0 default npm behavior).<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 import shlex<br>
-=C2=A0 =C2=A0 import tempfile<br>
-=C2=A0 =C2=A0 from bb.fetch2.npm import NpmEnvironment<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
-=C2=A0 =C2=A0 bb.utils.remove(d.getVar(&quot;NPM_BUILD&quot;), recurse=3DT=
rue)<br>
+NPM_SOURCEPATH ?=3D &quot;${S}&quot;<br>
<br>
-=C2=A0 =C2=A0 with tempfile.TemporaryDirectory() as tmpdir:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs =3D npm_global_configs(d)<br>
+export NPM_CONFIG_GLOBALCONFIG =3D &quot;${WORKDIR}/npmrc&quot;<br>
+export NPM_CONFIG_USERCONFIG =3D &quot;/dev/null&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.to_boolean(d.getVar(&quot;NPM_INST=
ALL_DEV&quot;), False):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;also&quot;=
, &quot;development&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;only&quot;=
, &quot;production&quot;))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Report as many logs as possible for debuggin=
g purpose<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;loglevel&quot;, &quot;si=
lly&quot;))<br>
+oe_runnpm_plain() {<br>
+=C2=A0 =C2=A0 HOME=3D${B}/root npm &quot;$@&quot;<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Configure the installation to be done global=
ly in the build directory<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;global&quot;, &quot;true=
&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;prefix&quot;, d.getVar(&=
quot;NPM_BUILD&quot;)))<br>
+oe_runnpm() {<br>
+=C2=A0 =C2=A0 bbnote npm &quot;$@&quot;<br>
+=C2=A0 =C2=A0 oe_runnpm_plain &quot;$@&quot;<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add node-gyp configuration<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;arch&quot;, d.getVar(&qu=
ot;NPM_ARCH&quot;)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;release&quot;, &quot;tru=
e&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;nodedir&quot;, d.getVar(=
&quot;NPM_NODEDIR&quot;)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configs.append((&quot;python&quot;, d.getVar(&=
quot;PYTHON&quot;)))<br>
+oe_runnpm_pack() {<br>
+=C2=A0 =C2=A0 oe_runnpm_plain pack --ignore-scripts --loglevel=3Dwarn &quo=
t;$@&quot;<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D NpmEnvironment(d, configs)<br>
+oe_runnpm_rebuild() {<br>
+=C2=A0 =C2=A0 arch=3D$1<br>
+=C2=A0 =C2=A0 shift<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add node-pre-gyp configuration<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append((&quot;target_arch&quot;, d.getVar=
(&quot;NPM_ARCH&quot;)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append((&quot;build-from-source&quot;, &q=
uot;true&quot;))<br>
+=C2=A0 =C2=A0 # Create symlinks for package executables<br>
+=C2=A0 =C2=A0 # because rebuild doesn&#39;t respect the dependency tree<br=
>
+=C2=A0 =C2=A0 oe_runnpm rebuild --ignore-scripts<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pack and install the main package<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tarball =3D npm_pack(env, d.getVar(&quot;NPM_P=
ACKAGE&quot;), tmpdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;npm install %s %s&quot; % (shlex=
.quote(tarball), d.getVar(&quot;EXTRA_OENPM&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env.run(cmd, args=3Dargs)<br>
+=C2=A0 =C2=A0 # Rebuild dependencies<br>
+=C2=A0 =C2=A0 oe_runnpm rebuild \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --arch=3D${arch} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --target_arch=3D${arch} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --build-from-source \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$@&quot;<br>
=C2=A0}<br>
<br>
-npm_do_install() {<br>
-=C2=A0 =C2=A0 # Step three: final install<br>
-=C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 # The previous installation have to be filtered to remove so=
me extra files.<br>
+do_generate_npmrc() {<br>
+=C2=A0 =C2=A0 cat &gt; ${NPM_CONFIG_GLOBALCONFIG} &lt;&lt;EOF<br>
+cache=3D${NPM_CACHE}<br>
+loglevel=3Dsilly<br>
+offline=3Dtrue<br>
+package-lock=3Dfalse<br>
+proxy=3D<a href=3D"http://invalid" rel=3D"noreferrer" target=3D"_blank">ht=
tp://invalid</a><br>
+; node-gyp<br>
+arch=3D${NPM_ARCH}<br>
+nodedir=3D${NPM_NODEDIR}<br>
+python=3D${PYTHON}<br>
+release=3Dtrue<br>
+EOF<br>
+}<br>
+do_generate_npmrc[vardeps] +=3D &quot;NPM_ARCH NPM_CACHE NPM_CONFIG_GLOBAL=
CONFIG NPM_NODEDIR PYTHON&quot;<br>
+addtask generate_npmrc after do_patch before do_populate_cache<br>
<br>
-=C2=A0 =C2=A0 rm -rf ${D}<br>
+npm_do_configure() {<br>
+=C2=A0 =C2=A0 :<br>
+}<br>
<br>
-=C2=A0 =C2=A0 # Copy the entire lib and bin directories<br>
-=C2=A0 =C2=A0 install -d ${D}/${nonarch_libdir}<br>
-=C2=A0 =C2=A0 cp --no-preserve=3Downership --recursive ${NPM_BUILD}/lib/. =
${D}/${nonarch_libdir}<br>
+npm_do_compile() {<br>
+=C2=A0 =C2=A0 # Create a tarball from main npm package<br>
+=C2=A0 =C2=A0 # to respect ignore files and files property of package.json=
<br>
+=C2=A0 =C2=A0 cd ${B}/pkg<br>
+=C2=A0 =C2=A0 tarball=3D$(oe_runnpm_pack ${NPM_SOURCEPATH})<br>
+=C2=A0 =C2=A0 [ -n &quot;${tarball}&quot; ] || exit 1<br>
+<br>
+=C2=A0 =C2=A0 # Unpack main npm package<br>
+=C2=A0 =C2=A0 mkdir ${B}/lib/node_modules/${BPN}/<br>
+=C2=A0 =C2=A0 tar -xzf ${B}/pkg/$tarball --no-same-owner \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --strip-components=3D1 -C ${B}/lib/node_module=
s/${BPN}<br>
+<br>
+=C2=A0 =C2=A0 # Copy npm dependencies from sources<br>
+=C2=A0 =C2=A0 if [ -d ${S}/node_modules ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy sources without preserve mode and owner=
ship<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to prevent ugly file permissions<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir ${B}/lib/node_modules/${BPN}/node_module=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --no-preserve=3Dmode,ownership \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/node_modules/. ${B}/lib/nod=
e_modules/${BPN}/node_modules/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prune dependencies for production<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${NPM_INSTALL_DEV}&quot; =3D &quot;=
1&quot; -a &quot;${NPM_PRUNE_FOR_PRODUCTION}&quot; =3D &quot;1&quot; ] ; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runnpm prune --only=3Dproduct=
ion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rebuild dependencies inside node_modules fol=
der<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to create bin links in .bin folder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/lib/node_modules<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runnpm_rebuild ${NPM_ARCH} ${EXTRA_OENPM}<b=
r>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+do_compile[cleandirs] =3D &quot;${B}/lib/node_modules ${B}/pkg&quot;<br>
<br>
-=C2=A0 =C2=A0 if [ -d &quot;${NPM_BUILD}/bin&quot; ]<br>
-=C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${bindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --no-preserve=3Downership --recursive ${NPM=
_BUILD}/bin/. ${D}/${bindir}<br>
+npm_do_install() {<br>
+=C2=A0 =C2=A0 # Copy the entire main node_modules directory<br>
+=C2=A0 =C2=A0 install -d ${D}${nonarch_libdir}<br>
+=C2=A0 =C2=A0 cp -a --no-preserve=3Downership ${B}/lib/node_modules \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${nonarch_libdir}/<br>
+<br>
+=C2=A0 =C2=A0 # Create symlinks for package executables<br>
+=C2=A0 =C2=A0 if [ -d ${D}${nonarch_libdir}/node_modules/.bin ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in ${D}${nonarch_libdir}/node_modules/.b=
in/*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D&quot;$(basename $f)&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link=3D&quot;$(readlink $f)&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target=3D&quot;$(realpath -m --r=
elative-to ${D}${bindir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${nonarch_libd=
ir}/node_modules/.bin/$link)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;$target&quot; &quot;=
${D}${bindir}/$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${nonarch_libdir}/node_modules/.bin=
<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0# If the package (or its dependencies) uses node-gyp to=
 build native addons,<br>
=C2=A0 =C2=A0 =C2=A0# object files, static libraries or other temporary fil=
es can be hidden in<br>
=C2=A0 =C2=A0 =C2=A0# the lib directory. To reduce the package size and to =
avoid QA issues<br>
=C2=A0 =C2=A0 =C2=A0# (staticdev with static library files) these files mus=
t be removed.<br>
-=C2=A0 =C2=A0 local GYP_REGEX=3D&quot;.*/build/Release/[^/]*.node&quot;<br=
>
+=C2=A0 =C2=A0 local GYP_REGEX=3D&quot;.*/build.*/Release/[^/]*.node&quot;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0# Remove any node-gyp directory in ${D} to remove tempo=
rary build files<br>
=C2=A0 =C2=A0 =C2=A0for GYP_D_FILE in $(find ${D} -regex &quot;${GYP_REGEX}=
&quot;)<br>
@@ -294,9 +187,9 @@ npm_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Copy only the node-gyp release files<br>
-=C2=A0 =C2=A0 for GYP_B_FILE in $(find ${NPM_BUILD} -regex &quot;${GYP_REG=
EX}&quot;)<br>
+=C2=A0 =C2=A0 for GYP_B_FILE in $(find ${B}/pkg -regex &quot;${GYP_REGEX}&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE=
#${NPM_BUILD}}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local GYP_D_FILE=3D${D}/${prefix}/${GYP_B_FILE=
#${B}/pkg}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${GYP_D_FILE%/*}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${GYP_B_FILE} ${GYP_D_FILE=
}<br>
@@ -310,6 +203,7 @@ npm_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0# using /usr/lib/node_modules as install directory. Let=
&#39;s make both happy.<br>
=C2=A0 =C2=A0 =C2=A0ln -fs node_modules ${D}/${nonarch_libdir}/node<br>
=C2=A0}<br>
+do_install[cleandirs] =3D &quot;${D}&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${bindir} \<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index 01fb5ad96f..10dc2b1373 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -260,10 +260,8 @@ def add(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
}\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&=
#39;npm&#39;, rd):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;pytho=
n do_configure:append() {\n&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;=C2=
=A0 =C2=A0 pkgdir =3D d.getVar(&quot;NPM_PACKAGE&quot;)\n&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;=C2=
=A0 =C2=A0 lockfile =3D os.path.join(pkgdir, &quot;singletask.lock&quot;)\n=
&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;=C2=
=A0 =C2=A0 bb.utils.remove(lockfile)\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;do_co=
nfigure:append() {\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;=C2=
=A0 =C2=A0 rm -f ${NPM_PACKAGE}/singletask.lock\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
}\n&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if the new layer provides recipes=
 whose priorities have been<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000003b9fea05d18a85ab--

