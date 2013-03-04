Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UCXlR-0008La-G5
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 16:57:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r24Fen2H016756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2013 07:40:50 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 4 Mar 2013 07:40:49 -0800
Message-ID: <5134C088.5060601@windriver.com>
Date: Mon, 4 Mar 2013 09:40:56 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1362263971.11004.18.camel@ted>
In-Reply-To: <1362263971.11004.18.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: Optimise per file dependency handling
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
X-List-Received-Date: Mon, 04 Mar 2013 15:57:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/13 4:39 PM, Richard Purdie wrote:
> Currently the process for injecting the per file rpm dependencies into
> rpmbuild is painfully slow. Its done through the repeated execution of
> a script which has to return the correct value in each case. This continual
> execution means the CPU usage of rpmbuild is low.
>
> This patch allows the option of collapsing the per file dependencies to
> a per package basis and injecting them through the .spec file. This removes
> the execution overhead and allows rpmbuild to run at 100% of cpu.
>
> Ultimately it would be nice to inject the per file dependencies through
> the .spec file however that is not currently possible.
>
> Since few people use the per file dependency information, this patch
> goes for the faster approach. It can be enabled if anyone needs it although
> I'd mention that its being used to us as this code may well go away in
> the future if nobody complains.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 697bb36..3ac379d 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -8,6 +8,10 @@ RPMBUILD="rpmbuild"
>   PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
>   PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
>
> +# Maintaining the perfile dependencies has singificant overhead when writing the
> +# packages. When set, this value merges them for efficiency.
> +MERGEPERFILEDEPS = "1"

Can this be a "?=" so it can be easily overridden?

> +
>   #
>   # Update the packages indexes ${DEPLOY_DIR_RPM}
>   #
> @@ -460,6 +464,78 @@ EOF
>   	fi
>   }
>
> +# Construct per file dependencies file
> +def write_rpm_perfiledata(srcname, d):
> +    workdir = d.getVar('WORKDIR', True)
> +    packages = d.getVar('PACKAGES', True)
> +    pkgd = d.getVar('PKGD', True)
> +
> +    def dump_filerdeps(varname, outfile, d):
> +        outfile.write("#!/usr/bin/env python\n\n")
> +        outfile.write("# Dependency table\n")
> +        outfile.write('deps = {\n')
> +        for pkg in packages.split():
> +            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
> +            dependsflist = (d.getVar(dependsflist_key, True) or "")
> +            for dfile in dependsflist.split():
> +                key = "FILE" + varname + "_" + dfile + "_" + pkg
> +                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True) or "")
> +                file = dfile.replace("@underscore@", "_")
> +                file = file.replace("@closebrace@", "]")
> +                file = file.replace("@openbrace@", "[")
> +                file = file.replace("@tab@", "\t")
> +                file = file.replace("@space@", " ")
> +                file = file.replace("@at@", "@")
> +                outfile.write('"' + pkgd + file + '" : "')
> +                for dep in depends_dict:
> +                    ver = depends_dict[dep]
> +                    if dep and ver:
> +                        ver = ver.replace("(","")
> +                        ver = ver.replace(")","")
> +                        outfile.write(dep + " " + ver + " ")
> +                    else:
> +                        outfile.write(dep + " ")
> +                outfile.write('",\n')
> +        outfile.write('}\n\n')
> +        outfile.write("import sys\n")
> +        outfile.write("while 1:\n")
> +        outfile.write("\tline = sys.stdin.readline().strip()\n")
> +        outfile.write("\tif not line:\n")
> +        outfile.write("\t\tsys.exit(0)\n")
> +        outfile.write("\tif line in deps:\n")
> +        outfile.write("\t\tprint(deps[line] + '\\n')\n")
> +
> +    # OE-core dependencies a.k.a. RPM requires
> +    outdepends = workdir + "/" + srcname + ".requires"
> +
> +    try:
> +        from __builtin__ import file
> +        dependsfile = file(outdepends, 'w')
> +    except OSError:
> +        raise bb.build.FuncFailed("unable to open spec file for writing.")
> +
> +    dump_filerdeps('RDEPENDS', dependsfile, d)
> +
> +    dependsfile.close()
> +    os.chmod(outdepends, 0755)
> +
> +    # OE-core / RPM Provides
> +    outprovides = workdir + "/" + srcname + ".provides"
> +
> +    try:
> +        from __builtin__ import file
> +        providesfile = file(outprovides, 'w')
> +    except OSError:
> +        raise bb.build.FuncFailed("unable to open spec file for writing.")
> +
> +    dump_filerdeps('RPROVIDES', providesfile, d)
> +
> +    providesfile.close()
> +    os.chmod(outprovides, 0755)
> +
> +    return (outdepends, outprovides)
> +
> +
>   python write_specfile () {
>       import textwrap
>       import oe.packagedata
> @@ -576,6 +652,17 @@ python write_specfile () {
>           scr = scr[:pos] + 'if [ "$1" = "0" ] ; then\n' + scr[pos:] + '\nfi'
>           return scr
>
> +    def get_perfile(varname, pkg, d):
> +        deps = []
> +        dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
> +        dependsflist = (d.getVar(dependsflist_key, True) or "")
> +        for dfile in dependsflist.split():
> +            key = "FILE" + varname + "_" + dfile + "_" + pkg
> +            depends = d.getVar(key, True)
> +            if depends:
> +                deps.append(depends)
> +        return " ".join(deps)
> +

The above doesn't avoid duplicate entries.  Is this a concern?  (RPM doesn't 
care, it'll do it itself... but it may be slower due to this.)

>       packages = d.getVar('PACKAGES', True)
>       if not packages or packages == '':
>           bb.debug(1, "No packages; nothing to do")
> @@ -626,6 +713,8 @@ python write_specfile () {
>       spec_files_top = []
>       spec_files_bottom = []
>
> +    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
> +
>       for pkg in packages.split():
>           localdata = bb.data.createCopy(d)
>
> @@ -679,6 +768,12 @@ python write_specfile () {
>           splitrprerm    = localdata.getVar('pkg_prerm', True)
>           splitrpostrm   = localdata.getVar('pkg_postrm', True)
>
> +
> +        if not perfiledeps:
> +            # Add in summary of per file dependencies
> +            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
> +            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
> +
>           # Gather special src/first package data
>           if srcname == splitname:
>               srcrdepends    = splitrdepends
> @@ -977,69 +1072,9 @@ python do_package_rpm () {
>       d.setVar('OUTSPECFILE', outspecfile)
>       bb.build.exec_func('write_specfile', d)
>
> -    # Construct per file dependencies file
> -    def dump_filerdeps(varname, outfile, d):
> -        outfile.write("#!/usr/bin/env python\n\n")
> -        outfile.write("# Dependency table\n")
> -        outfile.write('deps = {\n')
> -        for pkg in packages.split():
> -            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
> -            dependsflist = (d.getVar(dependsflist_key, True) or "")
> -            for dfile in dependsflist.split():
> -                key = "FILE" + varname + "_" + dfile + "_" + pkg
> -                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True) or "")
> -                file = dfile.replace("@underscore@", "_")
> -                file = file.replace("@closebrace@", "]")
> -                file = file.replace("@openbrace@", "[")
> -                file = file.replace("@tab@", "\t")
> -                file = file.replace("@space@", " ")
> -                file = file.replace("@at@", "@")
> -                outfile.write('"' + pkgd + file + '" : "')
> -                for dep in depends_dict:
> -                    ver = depends_dict[dep]
> -                    if dep and ver:
> -                        ver = ver.replace("(","")
> -                        ver = ver.replace(")","")
> -                        outfile.write(dep + " " + ver + " ")
> -                    else:
> -                        outfile.write(dep + " ")
> -                outfile.write('",\n')
> -        outfile.write('}\n\n')
> -        outfile.write("import sys\n")
> -        outfile.write("while 1:\n")
> -        outfile.write("\tline = sys.stdin.readline().strip()\n")
> -        outfile.write("\tif not line:\n")
> -        outfile.write("\t\tsys.exit(0)\n")
> -        outfile.write("\tif line in deps:\n")
> -        outfile.write("\t\tprint(deps[line] + '\\n')\n")
> -
> -    # OE-core dependencies a.k.a. RPM requires
> -    outdepends = workdir + "/" + srcname + ".requires"
> -
> -    try:
> -        from __builtin__ import file
> -        dependsfile = file(outdepends, 'w')
> -    except OSError:
> -        raise bb.build.FuncFailed("unable to open spec file for writing.")
> -
> -    dump_filerdeps('RDEPENDS', dependsfile, d)
> -
> -    dependsfile.close()
> -    os.chmod(outdepends, 0755)
> -
> -    # OE-core / RPM Provides
> -    outprovides = workdir + "/" + srcname + ".provides"
> -
> -    try:
> -        from __builtin__ import file
> -        providesfile = file(outprovides, 'w')
> -    except OSError:
> -        raise bb.build.FuncFailed("unable to open spec file for writing.")
> -
> -    dump_filerdeps('RPROVIDES', providesfile, d)
> -
> -    providesfile.close()
> -    os.chmod(outprovides, 0755)
> +    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
> +    if perfiledeps:
> +        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
>
>       # Setup the rpmbuild arguments...
>       rpmbuild = d.getVar('RPMBUILD', True)
> @@ -1062,8 +1097,12 @@ python do_package_rpm () {
>       cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
>       cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
>       cmd = cmd + " --define '_use_internal_dependency_generator 0'"
> -    cmd = cmd + " --define '__find_requires " + outdepends + "'"
> -    cmd = cmd + " --define '__find_provides " + outprovides + "'"
> +    if perfiledeps:
> +        cmd = cmd + " --define '__find_requires " + outdepends + "'"
> +        cmd = cmd + " --define '__find_provides " + outprovides + "'"
> +    else:
> +        cmd = cmd + " --define '__find_requires %{nil}'"
> +        cmd = cmd + " --define '__find_provides %{nil}'"
>       cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
>       cmd = cmd + " --define 'debug_package %{nil}'"
>       cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
>
>



