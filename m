Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EB9AB6FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:56:38 +0000 (UTC)
Received: by wmww144 with SMTP id w144so84374347wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6gojfSawlo8Lh0+Xm1+V3Cs14u40HImVQULKUjcYSQc=;
	b=m80576IxnEf2FT1Kiuj5cyVfwtttWatQzuREdPGyzGQSQ1hGg+HDfYkUF5R+TWLi3I
	F/6aPzwNzPhfQ0Pcy2uFykz0gMLLhdQW/tg0aI6mI4RY4HOW2JiuWyerj8GdbPj0o4L4
	NVybSvf32s3FngQ7swtpgZ/XUfAnVOywG8kSGuOUC+OCn/KwxNXwuJHiutASPIGNadQK
	m58l+fVfRIgJJ+IEQF/iPx3zUOAu1xBpueHlokTg+WdlqAjlKsj7AAX4AiN2JbPfAnHH
	BGbpPqmfsMI8IL1af5f9wZlg5RYS57KvIpRqQBWs557jn3Jb5U33leeR7XAAIdu86x3v
	EVMg==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr34604214wmb.61.1449683799110;
	Wed, 09 Dec 2015 09:56:39 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Wed, 9 Dec 2015 09:56:39 -0800 (PST)
In-Reply-To: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
Date: Wed, 9 Dec 2015 09:56:39 -0800
Message-ID: <CAJ86T=VSauxfhwap_96w3SHnEPm1-NA469=cpm2emoJtgmZ31Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Source packages
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
X-List-Received-Date: Wed, 09 Dec 2015 17:56:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi Haris,

On Tue, Dec 8, 2015 at 12:53 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
> This change enables creation of ${PN}-src packages which provide recipe
> source code on target machines. A distribution might use this facility
> to provide a feed of source packages for user reference and
> debugging/development activities.
>
> The packaged source code is copy of SRC_URI files + a manifest declaring
> the contents in order of appearance in SRC_URI. For example, it might
> include a tarball + patch files, which could be used to reconstruct the
> state of a recipe's working dir after do_patch() by unpacking the
> archive and applying patches in order.
>
> At the moment, unpacking need to be done by hand. However, RPM and Dpkg
> can both do this automatically upon install when the source is packaged
> in a src.rpm or dsc file, respectively, as opposed to a binary archive
> (rpm or deb). A good future improvement might be to provide proper
> src.rpm's or .dsc's for distributions using those package manager.
>
> I don't believe opkg can distinguish between binary and source archives
> at the moment, so this may be the best we can do at the moment for IPK
> distributions.
>
>
> Classic OE provided a similar facility for IPKs only with
> sourceipk.bbclass [1]. It was dropped at some point in modern OE and I'm
> not familiar enough with OE's history pre Yocto to track down exactly
> why. I'm curious if this was this a deliberate change or just an
> accidental regression, and the reasons it was removed in the former
> case.
>
> One significant difference between the classic sourceipk.bbclass and my
> proposal is what gets packaged: sourceipk simply archived the entire
> ${S} dir after do_patch() but before do_configure() pollutes it. I opted
> not to go this route because it's seems at odds with RPM and Dpkg, both
> of which use the aforementioned tarball+patch file scheme. This may
> allow us to re-use the staging logic should we implement proper
> src.rpm's and dsc's in the future.
>
>
> Not all recipes have useful source to package: For example,
> linux-libc-headers build from the kernel source, which is is already
> provided by the kernel recipe. base-files just provides initial system
> configuration, so it's source package provides no additional info than
> it's binary.
>
> I couldn't find a clever way to filter out these edge cases, other than
> disabling source packages inside those recipes which would require a
> lengthy review of OE meta layers.
>
> I imagine many OE distro also target small, resource constrained,
> systems, that couldn't benefit from source packaging.
>
> Therefore I've made this an opt-in feature for individual distro
> maintainers to enable as needed. It can be enabled per recipe via the
> ENABLE_SRC_INSTALL_${PN} var or globally via ENABLE_SRC_INSTALL from
> distribution confs.
>
>
> === Implementation details ===
>
> [PATCH 1/3] package.bbclass/package.py: Add do_install_source() task
>
> Add do_install_source() task to stage a recipe's SRC_URI files under
> SRC_D.
>
> Dependencies:
>  After do_fetch() to ensure SRC_URI files are downloaded
>  After do_install() because it resets ${D} that's also used by this task
>  Before do_package() to stage files before writing installers
>
> No-ops unless ENABLE_SRC_INSTALL_${PN} = 1, which needs to be set in
> distro config or recipes wanting to use this facility.
>
> [PATCH 2/3] documentation.conf: Document do_install_source()
>
> [PATCH 3/3] bitbake.conf: Define source package, disabled by default
>
> Add ${PN}-src to PACKAGES with a default set of FILES_{PV}-src
> per FHS [2].
>
> Define a staging directory SRC_D under ${D}.
>
> Define ENABLE_SRC_INSTALL to enable source staging via package.bbclass's
> do_install_source() task. It's disabled by default, but may be
> overridden by distro configs or individual recipes as needed.
>
>
> === References ===
>
> [1] https://github.com/openembedded/openembedded/blob/master/classes/sourceipk.bbclass
> [2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html#usrsrcSourceCode
>
>
> Comments, opinions, and other meandering thoughts welcome....
>
> Thanks,
> Haris
> ---
>  meta/classes/package.bbclass |  5 +++
>  meta/conf/bitbake.conf       |  9 ++++-
>  meta/conf/documentation.conf |  1 +
>  meta/lib/oe/package.py       | 96 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 110 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d731757..98f01e5 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -2079,3 +2079,8 @@ def mapping_rename_hook(d):
>      runtime_mapping_rename("RRECOMMENDS", pkg, d)
>      runtime_mapping_rename("RSUGGESTS", pkg, d)
>
> +addtask do_install_source after do_fetch after do_install before do_package
> +
> +python do_install_source () {
> +    oe.package.do_install_source(d)
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 06971da..431865d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -36,6 +36,7 @@ export systemd_unitdir = "${nonarch_base_libdir}/systemd"
>  export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
>  export nonarch_libdir = "${exec_prefix}/lib"
>  export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
> +export srcdir = "${prefix}/src"

I wonder if globally exporting a "srcdir" environment variable is the
correct thing to do. If it's not expected to be recognised or used
directly by any package's "make install", etc, then perhaps it should
just be a bitbake internal variable to avoid any concerns about
namespace pollution.

(AFAIK, variables like "prefix" are only exported to support legacy
packages which rely on environment variables + "make -e" to ensure
that "make install", etc, do the right thing. For autotools packages,
for example, prefix etc are all passed directly on the configure
command line so exporting them too is mostly redundant. If we succeed
in getting rid of "make -e" then I guess eventually none of these
directory variables will need to be exported any more?).

>  # Architecture dependent paths
>  export bindir = "${exec_prefix}/bin"
> @@ -267,7 +268,7 @@ SOLIBSDEV = ".so"
>  SOLIBSDEV_darwin = ".dylibbroken"
>
>  PACKAGE_BEFORE_PN ?= ""
> -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> +PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>  PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>  FILES = ""
>
> @@ -313,6 +314,12 @@ ALLOW_EMPTY_${PN}-dbg = "1"
>
>  FILES_${PN}-locale = "${datadir}/locale"
>
> +FILES_${PN}-src = "${srcdir}/${PN}"
> +SRC_D = "${D}${srcdir}/${PN}"
> +
> +ENABLE_SRC_INSTALL = "0"
> +ENABLE_SRC_INSTALL_${PN} = "${ENABLE_SRC_INSTALL}"
> +
>  # File manifest
>
>  FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 845559a..0df8a2f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -26,6 +26,7 @@ do_fetchall[doc] = "Fetches all remote sources required to build a target"
>  do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
>  do_install[doc] = "Copies files from the compilation directory to a holding area"
>  do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
> +do_install_source[doc] = "Stages source code for packaging"
>  do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
>  do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
>  do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index ea6feaa..f980f25 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -123,3 +123,99 @@ def read_shlib_providers(d):
>                          shlib_provider[s[0]] = {}
>                      shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
>      return shlib_provider
> +
> +def archive_dir(dirPath, archivePath):
> +    ''' Create tar.bz2 archive at archivePath from dirPath '''
> +    import os, oe, bb
> +
> +    arDir = os.path.dirname(dirPath)
> +    arName = os.path.basename(dirPath)
> +
> +    cmd = 'tar -c -j -f \"%s\" -C \"%s\" -p \"%s\"' % (archivePath, arDir, arName)

Perhaps try to make use of pbzip2 instead of "tar -j" to create
tar.bz2 files. See:

  http://git.openembedded.org/openembedded-core/commit/?id=670f5cda06070ae888d17cca7a07aa74d751c2f7

> +    (retval, output) = oe.utils.getstatusoutput(cmd)
> +    if retval:
> +        bb.fatal('Failed to archive %s --> %s: %s %s' % (dirPath, archivePath, cmd, output))
> +
> +def do_install_source(d):
> +    ''' Stage recipe's source for packaging '''
> +    import os, oe, bb
> +
> +    pn = d.getVar("PN", True)
> +
> +    if d.getVar("ENABLE_SRC_INSTALL_%s" % pn, True) != "1":
> +        return
> +
> +    packages = (d.getVar("PACKAGES") or "").split()
> +    if ("%s-src" % pn) not in packages:
> +        # Some recipes redefine PACKAGES without ${PN}-src. Don't stage
> +        # anything in this case to avoid installed-vs-shipped warning.
> +        return
> +
> +    urls = (d.getVar('SRC_URI', True) or "").split()
> +    if len(urls) == 0:
> +        return
> +
> +    workdir = d.getVar('WORKDIR', True)
> +
> +    # TODO rm_work() should clean this up
> +    unpackTempDir = os.path.join(workdir, 'install-source-unpack-temp')
> +    if os.path.exists(unpackTempDir):
> +        bb.utils.remove(unpackTempDir, recurse=True)
> +    os.makedirs(unpackTempDir, 0755)
> +
> +    src_d = d.getVar("SRC_D", True)
> +    if os.path.exists(src_d):
> +        bb.warn("SRC_D already exist. Removing.")
> +        bb.utils.remove(src_d, recurse=True)
> +    os.makedirs(src_d, 0755)
> +
> +    fetcher = bb.fetch2.Fetch(urls, d)
> +
> +    fileManif = []
> +    for url in urls:
> +        urlScheme = bb.fetch2.decodeurl(url)[0]
> +        srcPath = fetcher.localpath(url)
> +        srcName = os.path.basename(srcPath)
> +
> +        dstName = srcName
> +        if os.path.isdir(srcPath):
> +            dstName += '.tar.bz2'
> +
> +        dstPath = os.path.join(src_d, dstName)
> +
> +        # fetch() doesn't retrieve any actual files from git:// URLs,
> +        # so we do an additional unpack() step to get something useful
> +        # for these.
> +        # TODO: May need to pre-process other revision control schemes
> +        if urlScheme == 'git':
> +            unpackPath = os.path.join(unpackTempDir, srcName)
> +            if os.path.exists(unpackPath):
> +                bb.utils.remove(unpackPath, recurse=True)
> +            os.makedirs(unpackPath, 0755)
> +
> +            fetcher.unpack(unpackPath, [url])
> +
> +            # unpack() puts actual source in a 'git' subdir
> +            srcPath = os.path.join(unpackPath, 'git')
> +
> +        if os.path.exists(dstPath):
> +            bb.warn('Duplicate file %s in SRC_URI. Overwriting.' % dstName)
> +            bb.utils.remove(dstPath, recurse=True)
> +
> +        if not dstName in fileManif:
> +            fileManif.append(dstName)
> +
> +        if os.path.isdir(srcPath):
> +            archive_dir(srcPath, dstPath)
> +        else:
> +            bb.utils.copyfile(srcPath, dstPath)
> +
> +    manifFilePath = os.path.join(src_d, 'manifest')
> +    if os.path.exists(manifFilePath):
> +        bb.warn('manifest file found in SRC_URI. Overwriting.')
> +        bb.utils.remove(manifFilePath, recurse=True)
> +
> +    with open(manifFilePath, 'wb') as manif:
> +        for fname in fileManif:
> +            manif.write(fname)
> +            manif.write('\n')
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

