Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U4uqv-0001jE-Qb for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 15:59:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BEnB03007299; Mon, 11 Feb 2013 14:49:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aN-DI+dol5yC; Mon, 11 Feb 2013 14:49:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BEn6HR007296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Feb 2013 14:49:09 GMT
Message-ID: <1360593792.6793.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 11 Feb 2013 14:43:12 +0000
In-Reply-To: <a32b33801c899dce34b072ad1d9d9ede30e8b598.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
	<a32b33801c899dce34b072ad1d9d9ede30e8b598.1360360346.git.ross.burton@intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1BEnB03007299
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] systemd.bbclass: helper class for recipes with systemd units
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
X-List-Received-Date: Mon, 11 Feb 2013 14:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-02-08 at 22:43 +0000, Ross Burton wrote:
> This class adds postinst/prerm scripts to start/stop/enable/disable the=
 services
> as relevant, and some magic to ensure the service files are installed.
>=20
> Based on (but not the same as) the systemd.bbclass in meta-systemd, so =
thanks to
> the following for their work there:
>=20
> Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Khem Raj <raj.khem@gmail.com>
> Martin Jansa <Martin.Jansa@gmail.com>
> Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Koen Kooi <koen@dominion.thruhere.net>
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/systemd.bbclass |  158 ++++++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 meta/classes/systemd.bbclass
>=20
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclas=
s
> new file mode 100644
> index 0000000..e0ea65c
> --- /dev/null
> +++ b/meta/classes/systemd.bbclass
> @@ -0,0 +1,158 @@
> +# The list of packages that should have systemd packaging scripts adde=
d.  For
> +# each entry, optionally have a SYSTEMD_SERVICE_[package] that lists t=
he service
> +# files in this package.  If this variable isn't set, [package].servic=
e is used.
> +SYSTEMD_PACKAGES ?=3D "${PN}"
> +
> +# Whether to enable or disable the services on installation.
> +SYSTEMD_AUTO_ENABLE ??=3D "enable"
> +
> +# This class will be included in any recipe that supports systemd init=
 scripts,
> +# even if the systemd DISTRO_FEATURE isn't enabled.  As such don't mak=
e any
> +# changes directly but check the DISTRO_FEATURES first.
> +python __anonymous() {
> +    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d=
):
> +        d.appendVar("DEPENDS", " systemd-systemctl-native")
> +        # Set a variable so that update-rcd.bbclass knows we're active=
 and can
> +        # disable itself.
> +        d.setVar("SYSTEMD_BBCLASS_ENABLED", "1")
> +}
> +systemd_postinst() {
> +OPTS=3D""
> +
> +if [ -n "$D" ]; then
> +    OPTS=3D"--root=3D$D"
> +fi
> +
> +systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> +
> +if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> +    systemctl start ${SYSTEMD_SERVICE}
> +fi
> +}
> +
> +systemd_prerm() {
> +if [ -z "$D" ]; then
> +    systemctl stop ${SYSTEMD_SERVICE}
> +fi
> +
> +systemctl disable ${SYSTEMD_SERVICE}
> +}
> +
> +def systemd_populate_packages(d):
> +    def get_package_var(d, var, pkg):
> +        val =3D (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
> +        if val =3D=3D "":
> +            val =3D (d.getVar(var, True) or "").strip()
> +        return val
> +
> +
> +    # Add a runtime dependency on systemd to pkg
> +    def systemd_add_rdepends(pkg):
> +        rdepends =3D d.getVar('RDEPENDS_' + pkg, True) or ""
> +        if not 'systemd' in rdepends.split():
> +            rdepends =3D '%s %s' % (rdepends, 'systemd')
> +        d.setVar('RDEPENDS_' + pkg, rdepends)
> +
> +
> +    def systemd_generate_package_scripts(pkg):
> +        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' %=
 pkg)
> +
> +        # Add pkg to the overrides so that it finds the SYSTEMD_SERVIC=
E_pkg
> +        # variable.
> +        localdata =3D d.createCopy()
> +        localdata.prependVar("OVERRIDES", pkg + ":")
> +        bb.data.update_data(localdata)
> +
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        if not postinst:
> +            postinst =3D '#!/bin/sh\n'
> +        postinst +=3D localdata.getVar('systemd_postinst', True)
> +        d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +        prerm =3D d.getVar('pkg_prerm_%s' % pkg, True)
> +        if not prerm:
> +            prerm =3D '#!/bin/sh\n'
> +        prerm +=3D localdata.getVar('systemd_prerm', True)
> +        d.setVar('pkg_prerm_%s' % pkg, prerm)
> +
> +
> +    # Add files to FILES_*-systemd if existent and not already done
> +    def systemd_append_file(pkg_systemd, file_append):
> +        appended =3D False
> +        if os.path.exists(oe.path.join(d.getVar("D", True), file_appen=
d)):
> +            var_name =3D "FILES_" + pkg_systemd
> +            files =3D d.getVar(var_name, False) or ""
> +            if file_append not in files.split():
> +                d.appendVar(var_name, " " + file_append)
> +                appended =3D True
> +        return appended
> +
> +    # Add systemd files to FILES_*-systemd, parse for Also=3D and foll=
ow recursive
> +    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
> +        # avoid infinite recursion
> +        if systemd_append_file(pkg_systemd, oe.path.join(path, service=
)):
> +            fullpath =3D oe.path.join(d.getVar("D", True), path, servi=
ce)
> +            if service.find('.service') !=3D -1:
> +                # for *.service add *@.service
> +                service_base =3D service.replace('.service', '')
> +                systemd_add_files_and_parse(pkg_systemd, path, service=
_base + '@.service', keys)
> +            if service.find('.socket') !=3D -1:
> +                # for *.socket add *.service and *@.service
> +                service_base =3D service.replace('.socket', '')
> +                systemd_add_files_and_parse(pkg_systemd, path, service=
_base + '.service', keys)
> +                systemd_add_files_and_parse(pkg_systemd, path, service=
_base + '@.service', keys)
> +            for key in keys.split():
> +                # recurse all dependencies found in keys ('Also';'Conf=
licts';..) and add to files
> +                cmd =3D "grep %s %s | sed 's,%s=3D,,g' | tr ',' '\\n'"=
 % (key, fullpath, key)
> +                pipe =3D os.popen(cmd, 'r')
> +                line =3D pipe.readline()
> +                while line:
> +                    line =3D line.replace('\n', '')
> +                    systemd_add_files_and_parse(pkg_systemd, path, lin=
e, keys)
> +                    line =3D pipe.readline()
> +                pipe.close()
> +
> +    # Check service-files and call systemd_add_files_and_parse for eac=
h entry
> +    def systemd_check_services():
> +        base_libdir =3D d.getVar('base_libdir', True)
> +        searchpaths =3D [oe.path.join(d.getVar("sysconfdir", True), "s=
ystemd", "system"),]
> +        searchpaths.append(oe.path.join(d.getVar("base_libdir", True),=
 "systemd", "system"))
> +        searchpaths.append(oe.path.join(d.getVar("libdir", True), "sys=
temd", "system"))
> +        searchpaths.append(oe.path.join(d.getVar("libdir", True), "sys=
temd", "user"))
> +        systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', True)
> +        has_exactly_one_service =3D len(systemd_packages.split()) =3D=3D=
 1
> +        if has_exactly_one_service:
> +            has_exactly_one_service =3D len(get_package_var(d, 'SYSTEM=
D_SERVICE', systemd_packages).split()) =3D=3D 1
> +
> +        keys =3D 'Also' # Conflicts??
> +        if has_exactly_one_service:
> +            # single service gets also the /dev/null dummies
> +            keys =3D 'Also Conflicts'
> +        # scan for all in SYSTEMD_SERVICE[]
> +        for pkg_systemd in systemd_packages.split():
> +            for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_s=
ystemd).split():
> +                path_found =3D ''
> +                for path in searchpaths:
> +                    if os.path.exists(oe.path.join(d.getVar("D", True)=
, path, service)):
> +                        path_found =3D path
> +                        break
> +                if path_found !=3D '':
> +                    systemd_add_files_and_parse(pkg_systemd, path_foun=
d, service, keys)
> +                else:
> +                    raise bb.build.FuncFailed, "\n\nSYSTEMD_SERVICE_%s=
 value %s does not exist" % \
> +                        (pkg_systemd, service)
> +
> +    # Run all modifications once when creating package
> +    if os.path.exists(d.getVar("D", True)):
> +        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
> +            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
> +                systemd_generate_package_scripts(pkg)
> +                systemd_add_rdepends(pkg)
> +        systemd_check_services()
> +
> +
> +python populate_packages_prepend () {
> +    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d=
):
> +        systemd_populate_packages (d)
> +}


I know this has been a long time in the works so I'll merge but could
you follow up with a change:

PACKAGESPLITFUNCS_prepend =3D "systemd_populate_packages "

and just put the=20

oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d) into
systemd_populate_packages with a return? You'll need to drop the d as a
parameter and turn it into a python xxxx() { style function. The nice
thing is this then shows up nicely on the profiles too. I'm aiming to
stamp out use of populate_packages_prepend entirely.

Cheers,

Richard



