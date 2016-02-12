Return-Path: <belen.barros.pena@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B3CBC731E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:31:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 12 Feb 2016 03:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,435,1449561600"; d="scan'208";a="910669718"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2016 03:31:12 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.31]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.30]) with mapi id
	14.03.0248.002; Fri, 12 Feb 2016 11:31:10 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Patches and discussions about the
	oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Parsing exception with latest oe-core
Thread-Index: AQHRZYjeU/A4GKi3MEuD1Ev1zZO7og==
Date: Fri, 12 Feb 2016 11:31:10 +0000
Message-ID: <D2E380AD.73A80%belen.barros.pena@intel.com>
References: <CA+chaQd-Yyno+uQOXKZgRqjTUSURtr0X8eSMAO3iRNf3AP_Cmw@mail.gmail.com>
In-Reply-To: <CA+chaQd-Yyno+uQOXKZgRqjTUSURtr0X8eSMAO3iRNf3AP_Cmw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.6.0.151221
x-originating-ip: [10.252.16.54]
MIME-Version: 1.0
Subject: Re: Parsing exception with latest oe-core
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
X-List-Received-Date: Fri, 12 Feb 2016 11:31:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6682B8F8BCF99C41A8016F1F7BB874B2@intel.com>
Content-Transfer-Encoding: quoted-printable



On 12/02/2016 10:52, "openembedded-core-bounces@lists.openembedded.org on
behalf of Martin Jansa" <openembedded-core-bounces@lists.openembedded.org
on behalf of martin.jansa@gmail.com> wrote:

>Hi,
>
>
>is anyone else seeing this unhelpful fatal exception?

FWIW, I am=20

http://piratepad.net/2E3lnayxi8

Cheers

Bel=E9n

>
>
>ERROR: Failure expanding variable
>__anon_648__home_jenkins_oe_world_shr_core_openembedded_core_meta_classes_
>base_bbclass, expression was def
>__anon_648__home_jenkins_oe_world_shr_core_openembedded_core_meta_classes_
>base_bbclass(d):
>    import string, re
>
>    # Handle PACKAGECONFIG
>    #
>    # These take the form:
>    #
>    # PACKAGECONFIG ??=3D "<default options>"
>    # PACKAGECONFIG[foo] =3D
>"--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
>    pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
>    if pkgconfigflags:
>        pkgconfig =3D (d.getVar('PACKAGECONFIG', True) or "").split()
>        pn =3D d.getVar("PN", True)
>
>        mlprefix =3D d.getVar("MLPREFIX", True)
>
>        def expandFilter(appends, extension, prefix):
>            appends =3D bb.utils.explode_deps(d.expand(" ".join(appends)))
>            newappends =3D []
>            for a in appends:
>                if a.endswith("-native") or ("-cross-" in a):
>                    newappends.append(a)
>                elif a.startswith("virtual/"):
>                    subs =3D a.split("/", 1)[1]
>                    if subs.startswith(prefix):
>                        newappends.append(a + extension)
>                    else:
>                        newappends.append("virtual/" + prefix + subs +
>extension)
>                else:
>                    if a.startswith(prefix):
>                        newappends.append(a + extension)
>                    else:
>                        newappends.append(prefix + a + extension)
>            return newappends
>
>        def appendVar(varname, appends):
>            if not appends:
>                return
>            if varname.find("DEPENDS") !=3D -1:
>                if pn.startswith("nativesdk-"):
>                    appends =3D expandFilter(appends, "", "nativesdk-")
>                if pn.endswith("-native"):
>                    appends =3D expandFilter(appends, "-native", "")
>                if mlprefix:
>                    appends =3D expandFilter(appends, "", mlprefix)
>            varname =3D d.expand(varname)
>            d.appendVar(varname, " " + " ".join(appends))
>
>        extradeps =3D []
>        extrardeps =3D []
>        extraconf =3D []
>        for flag, flagval in sorted(pkgconfigflags.items()):
>            items =3D flagval.split(",")
>            num =3D len(items)
>            if num > 4:
>                bb.error("%s: PACKAGECONFIG[%s] Only
>enable,disable,depend,rdepend can be specified!"
>                    % (d.getVar('PN', True), flag))
>
>            if flag in pkgconfig:
>                if num >=3D 3 and items[2]:
>                    extradeps.append(items[2])
>                if num >=3D 4 and items[3]:
>                    extrardeps.append(items[3])
>                if num >=3D 1 and items[0]:
>                    extraconf.append(items[0])
>            elif num >=3D 2 and items[1]:
>                    extraconf.append(items[1])
>        appendVar('DEPENDS', extradeps)
>        appendVar('RDEPENDS_defaultpkgname', extrardeps)
>        if bb.data.inherits_class('cmake', d):
>            appendVar('EXTRA_OECMAKE', extraconf)
>        else:
>            appendVar('EXTRA_OECONF', extraconf)
>
>    pn =3D d.getVar('PN', True)
>    license =3D d.getVar('LICENSE', True)
>    if license =3D=3D "INVALID":
>        bb.fatal('This recipe does not have the LICENSE field set (%s)' %
>pn)
>
>    if bb.data.inherits_class('license', d):
>        check_license_format(d)
>        unmatched_license_flag =3D check_license_flags(d)
>        if unmatched_license_flag:
>            bb.debug(1, "Skipping %s because it has a restricted license
>not"
>                 " whitelisted in LICENSE_FLAGS_WHITELIST" % pn)
>            raise bb.parse.SkipPackage("because it has a restricted
>license not"
>                 " whitelisted in LICENSE_FLAGS_WHITELIST")
>
>    # If we're building a target package we need to use fakeroot (pseudo)
>    # in order to capture permissions, owners, groups and special files
>    if not bb.data.inherits_class('native', d) and not
>bb.data.inherits_class('cross', d):
>        d.setVarFlag('do_unpack', 'umask', '022')
>        d.setVarFlag('do_configure', 'umask', '022')
>        d.setVarFlag('do_compile', 'umask', '022')
>        d.appendVarFlag('do_install', 'depends', '
>virtual/fakeroot-native:do_populate_sysroot')
>        d.setVarFlag('do_install', 'fakeroot', '1')
>        d.setVarFlag('do_install', 'umask', '022')
>        d.appendVarFlag('do_package', 'depends', '
>virtual/fakeroot-native:do_populate_sysroot')
>        d.setVarFlag('do_package', 'fakeroot', '1')
>        d.setVarFlag('do_package', 'umask', '022')
>        d.setVarFlag('do_package_setscene', 'fakeroot', '1')
>        d.appendVarFlag('do_package_setscene', 'depends', '
>virtual/fakeroot-native:do_populate_sysroot')
>        d.setVarFlag('do_devshell', 'fakeroot', '1')
>        d.appendVarFlag('do_devshell', 'depends', '
>virtual/fakeroot-native:do_populate_sysroot')
>
>    need_machine =3D d.getVar('COMPATIBLE_MACHINE', True)
>    if need_machine:
>        import re
>        compat_machines =3D (d.getVar('MACHINEOVERRIDES', True) or
>"").split(":")
>        for m in compat_machines:
>            if re.match(need_machine, m):
>                break
>        else:
>            raise bb.parse.SkipPackage("incompatible with machine %s (not
>in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
>
>    source_mirror_fetch =3D d.getVar('SOURCE_MIRROR_FETCH', 0)
>    if not source_mirror_fetch:
>        need_host =3D d.getVar('COMPATIBLE_HOST', True)
>        if need_host:
>            import re
>            this_host =3D d.getVar('HOST_SYS', True)
>            if not re.match(need_host, this_host):
>                raise bb.parse.SkipPackage("incompatible with host %s
>(not in COMPATIBLE_HOST)" % this_host)
>
>        bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE', True) or
>"").split()
>
>        check_license =3D False if pn.startswith("nativesdk-") else True
>        for t in ["-native", "-cross-arm", "-cross-initial-arm",
>              "-crosssdk-x86_64", "-crosssdk-initial-x86_64",
>              "-cross-canadian-arm"]:
>            if pn.endswith(d.expand(t)):
>                check_license =3D False
>        if pn.startswith("gcc-source-"):
>            check_license =3D False
>
>        if check_license and bad_licenses:
>            bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
>
>            whitelist =3D []
>            incompatwl =3D []
>            htincompatwl =3D []
>            for lic in bad_licenses:
>                spdx_license =3D return_spdx(d, lic)
>                for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_",
>"WHITELIST_"]:
>                    whitelist.extend((d.getVar(w + lic, True) or
>"").split())
>                    if spdx_license:
>                        whitelist.extend((d.getVar(w + spdx_license,
>True) or "").split())
>                    '''
>                    We need to track what we are whitelisting and why. If
>pn is
>                    incompatible and is not HOSTTOOLS_WHITELIST_ we need
>to be
>                    able to note that the image that is created may infact
>                    contain incompatible licenses despite
>INCOMPATIBLE_LICENSE
>                    being set.
>                    '''
>                    if "HOSTTOOLS" in w:
>                        htincompatwl.extend((d.getVar(w + lic, True) or
>"").split())
>                        if spdx_license:
>                            htincompatwl.extend((d.getVar(w +
>spdx_license, True) or "").split())
>                    else:
>                        incompatwl.extend((d.getVar(w + lic, True) or
>"").split())
>                        if spdx_license:
>                            incompatwl.extend((d.getVar(w + spdx_license,
>True) or "").split())
>
>            if not pn in whitelist:
>                recipe_license =3D d.getVar('LICENSE', True)
>                pkgs =3D d.getVar('PACKAGES', True).split()
>                skipped_pkgs =3D []
>                unskipped_pkgs =3D []
>                for pkg in pkgs:
>                    if incompatible_license(d, bad_licenses, pkg):
>                        skipped_pkgs.append(pkg)
>                    else:
>                        unskipped_pkgs.append(pkg)
>                all_skipped =3D skipped_pkgs and not unskipped_pkgs
>                if unskipped_pkgs:
>                    for pkg in skipped_pkgs:
>                        bb.debug(1, "SKIPPING the package " + pkg + " at
>do_rootfs because it's " + recipe_license)
>                        mlprefix =3D d.getVar('MLPREFIX', True)
>                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
>                    for pkg in unskipped_pkgs:
>                        bb.debug(1, "INCLUDING the package " + pkg)
>                elif all_skipped or incompatible_license(d, bad_licenses):
>                    bb.debug(1, "SKIPPING recipe %s because it's %s" %
>(pn, recipe_license))
>                    raise bb.parse.SkipPackage("incompatible with license
>%s" % recipe_license)
>            elif pn in whitelist:
>                if pn in incompatwl:
>                    bb.note("INCLUDING " + pn + " as buildable despite
>INCOMPATIBLE_LICENSE because it has been whitelisted")
>                elif pn in htincompatwl:
>                    bb.note("INCLUDING " + pn + " as buildable despite
>INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
>
>    needsrcrev =3D False
>    srcuri =3D d.getVar('SRC_URI', True)
>    for uri in srcuri.split():
>        (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]
>
>        # HTTP/FTP use the wget fetcher
>        if scheme in ("http", "https", "ftp"):
>            d.appendVarFlag('do_fetch', 'depends', '
>wget-native:do_populate_sysroot')
>
>        # Svn packages should DEPEND on subversion-native
>        if scheme =3D=3D "svn":
>            needsrcrev =3D True
>            d.appendVarFlag('do_fetch', 'depends', '
>subversion-native:do_populate_sysroot')
>
>        # Git packages should DEPEND on git-native
>        elif scheme =3D=3D "git":
>            needsrcrev =3D True
>            d.appendVarFlag('do_fetch', 'depends', '
>git-native:do_populate_sysroot')
>
>        # Mercurial packages should DEPEND on mercurial-native
>        elif scheme =3D=3D "hg":
>            needsrcrev =3D True
>            d.appendVarFlag('do_fetch', 'depends', '
>mercurial-native:do_populate_sysroot')
>
>        # OSC packages should DEPEND on osc-native
>        elif scheme =3D=3D "osc":
>            d.appendVarFlag('do_fetch', 'depends', '
>osc-native:do_populate_sysroot')
>
>        # *.lz4 should DEPEND on lz4-native for unpacking
>        if path.endswith('.lz4'):
>            d.appendVarFlag('do_unpack', 'depends', '
>lz4-native:do_populate_sysroot')
>
>        # *.lz should DEPEND on lzip-native for unpacking
>        elif path.endswith('.lz'):
>            d.appendVarFlag('do_unpack', 'depends', '
>lzip-native:do_populate_sysroot')
>
>        # *.xz should DEPEND on xz-native for unpacking
>        elif path.endswith('.xz'):
>            d.appendVarFlag('do_unpack', 'depends', '
>xz-native:do_populate_sysroot')
>
>        # .zip should DEPEND on unzip-native for unpacking
>        elif path.endswith('.zip'):
>            d.appendVarFlag('do_unpack', 'depends', '
>unzip-native:do_populate_sysroot')
>
>        # file is needed by rpm2cpio.sh
>        elif path.endswith('.src.rpm'):
>            d.appendVarFlag('do_unpack', 'depends', '
>file-native:do_populate_sysroot')
>
>    if needsrcrev:
>        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
>
>    set_packagetriplet(d)
>
>    # 'multimachine' handling
>    mach_arch =3D d.getVar('MACHINE_ARCH', True)
>    pkg_arch =3D d.getVar('PACKAGE_ARCH', True)
>
>    if (pkg_arch =3D=3D mach_arch):
>        # Already machine specific - nothing further to do
>        return
>
>    #
>    # We always try to scan SRC_URI for urls with machine overrides
>    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=3D0
>    #
>    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
>    if override !=3D '0':
>        paths =3D []
>        fpaths =3D (d.getVar('FILESPATH', True) or '').split(':')
>        machine =3D d.getVar('MACHINE', True)
>        for p in fpaths:
>            if os.path.basename(p) =3D=3D machine and os.path.isdir(p):
>                paths.append(p)
>
>        if len(paths) !=3D 0:
>            for s in srcuri.split():
>                if not s.startswith("file://"):
>                    continue
>                fetcher =3D bb.fetch2.Fetch([s], d)
>                local =3D fetcher.localpath(s)
>                for mp in paths:
>                    if local.startswith(mp):
>                        #bb.note("overriding PACKAGE_ARCH from %s to %s
>for %s" % (pkg_arch, mach_arch, pn))
>                        d.setVar('PACKAGE_ARCH', "qemuarm")
>                        return
>
>    packages =3D d.getVar('PACKAGES', True).split()
>    for pkg in packages:
>        pkgarch =3D d.getVar("PACKAGE_ARCH_%s" % pkg, True)
>
>        # We could look for !=3D PACKAGE_ARCH here but how to choose
>        # if multiple differences are present?
>        # Look through PACKAGE_ARCHS for the priority order?
>        if pkgarch and pkgarch =3D=3D mach_arch:
>            d.setVar('PACKAGE_ARCH', "qemuarm")
>            bb.warn("Recipe %s is marked as only being architecture
>specific but seems to have machine specific packages?! The recipe may as
>well mark itself as machine specific directly." % d.getVar("PN", True))
> which triggered exception FetchError: Fetcher failure: SRCREV was used
>yet no valid SCM was found in SRC_URI
>
>
>
>


