Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9A877708
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 17:04:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2AH4Zi1012307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 10 Mar 2017 09:04:36 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 09:04:35 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<77fe606e011b51fe2551e2e4e5a2b25f682ebb2c.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5b89b6ce-5a17-3cf6-dbaf-dc941daf29af@windriver.com>
Date: Fri, 10 Mar 2017 11:04:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <77fe606e011b51fe2551e2e4e5a2b25f682ebb2c.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 38/44] package_rpm.bbclass: do not strip multilib prefixes from package names, do not add multilib prefix to package arch
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
X-List-Received-Date: Fri, 10 Mar 2017 17:04:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 3/10/17 5:24 AM, Alexander Kanavin wrote:
> This is done for reasons I cannot establish, and greatly complicates the code
> that installs packages into rootfs.

RPM internally resolves ELF dependencies through a resolution system.

If you look at a typical Fedora, SuSe, etc system you will often see:

glibc-x.y.i386.rpm
glibc-x.y.x86-64.rpm

When a package asks for 'glibc', the system will go out and match the one for
the arch that is being requested.

This permits you to have an i386 feed for i386 machines and an x86-64 feed that
can use both.  (This is much less of an issue on x86 these days then it used to
be.  However, it is still an issue on ARM big/LITTLE and some combination
hardware that may have an aarch64 system and an armv7 in the same chassis.)

The typical OE approach is:

glibc-x.y.i386.rpm

and

lib32-glibc-x.y.i386.rpm
glibc-x.y.x86-64.rpm

This means the '32-bit' feeds can not be shared in any way.  The system naming
is also more confusing to people familiar with other RPM distirbutions, as they
are expecting to be able to say 'give me glibc i386' are, and not have to just
know it starts with 'lib32-'.  (This is because internally to RPM, the arch is
treated as part of the naming fields, as long as the contents do not conflict.
So you SHOULD be able to have two non-conflicting glibc* packages installed at
the same time -- the resolver will decide which ELF file to install.)

This is very different in practice to deb/ipkg naming that is required to be unique.


The other problem this introduces for people trying to use ISP packages and
other external (non YP sources) is the naming scheme is suddenly wildly
different.  So they may ask (depend on) the wrong named packages.

If you do want to remove this, I would really prefer a switch to full OE/YP
styling naming -- so those that need to keep 'Red Hat style' can do so.

(If having this code in places cause DNF/RPM4 to break, chances are there is a
problem in the configuration or resolving code -- since everything should be
automatic.)

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 55 ++++++++--------------------------------
>  1 file changed, 11 insertions(+), 44 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 4f4f8e4e11c..07ab5cdd9e0 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -101,27 +101,6 @@ python write_specfile () {
>                  os.chown(f, 0, 0)
>                  spec_preamble_top.append('Source%s: %s' % (source_number, source))
>                  source_number += 1
> -    # We need a simple way to remove the MLPREFIX from the package name,
> -    # and dependency information...
> -    def strip_multilib(name, d):
> -        multilibs = d.getVar('MULTILIBS') or ""
> -        for ext in multilibs.split():
> -            eext = ext.split(':')
> -            if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') >= 0:
> -                name = "".join(name.split(eext[1] + '-'))
> -        return name
> -
> -    def strip_multilib_deps(deps, d):
> -        depends = bb.utils.explode_dep_versions2(deps or "")
> -        newdeps = {}
> -        for dep in depends:
> -            newdeps[strip_multilib(dep, d)] = depends[dep]
> -        return bb.utils.join_deps(newdeps)
> -
> -#        ml = d.getVar("MLPREFIX")
> -#        if ml and name and len(ml) != 0 and name.find(ml) == 0:
> -#            return ml.join(name.split(ml, 1)[1:])
> -#        return name
>  
>      # In RPM, dependencies are of the format: pkg <>= Epoch:Version-Release
>      # This format is similar to OE, however there are restrictions on the
> @@ -283,7 +262,7 @@ python write_specfile () {
>          bb.fatal("No OUTSPECFILE")
>  
>      # Construct the SPEC file...
> -    srcname    = strip_multilib(d.getVar('PN'), d)
> +    srcname    = d.getVar('PN')
>      srcsummary = (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".")
>      srcversion = d.getVar('PKGV').replace('-', '+')
>      srcrelease = d.getVar('PKGR')
> @@ -295,7 +274,7 @@ python write_specfile () {
>      srcdescription = d.getVar('DESCRIPTION') or "."
>      srccustomtagschunk = get_package_additional_metadata("rpm", d)
>  
> -    srcdepends     = strip_multilib_deps(d.getVar('DEPENDS'), d)
> +    srcdepends     = d.getVar('DEPENDS')
>      srcrdepends    = []
>      srcrrecommends = []
>      srcrsuggests   = []
> @@ -340,7 +319,7 @@ python write_specfile () {
>          if dirfiles is not None:
>              dirfiles = dirfiles.split()
>  
> -        splitname    = strip_multilib(pkgname, d)
> +        splitname    = pkgname
>  
>          splitsummary = (localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or ".")
>          splitversion = (localdata.getVar('PKGV') or "").replace('-', '+')
> @@ -361,12 +340,12 @@ python write_specfile () {
>          # Map the dependencies into their final form
>          mapping_rename_hook(localdata)
>  
> -        splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS'), d)
> -        splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS'), d)
> -        splitrsuggests   = strip_multilib_deps(localdata.getVar('RSUGGESTS'), d)
> -        splitrprovides   = strip_multilib_deps(localdata.getVar('RPROVIDES'), d)
> -        splitrreplaces   = strip_multilib_deps(localdata.getVar('RREPLACES'), d)
> -        splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS'), d)
> +        splitrdepends    = localdata.getVar('RDEPENDS')
> +        splitrrecommends = localdata.getVar('RRECOMMENDS')
> +        splitrsuggests   = localdata.getVar('RSUGGESTS')
> +        splitrprovides   = localdata.getVar('RPROVIDES')
> +        splitrreplaces   = localdata.getVar('RREPLACES')
> +        splitrconflicts  = localdata.getVar('RCONFLICTS')
>          splitrobsoletes  = []
>  
>          splitrpreinst  = localdata.getVar('pkg_preinst')
> @@ -640,14 +619,6 @@ python write_specfile () {
>  write_specfile[vardepsexclude] = "OVERRIDES"
>  
>  python do_package_rpm () {
> -    # We need a simple way to remove the MLPREFIX from the package name,
> -    # and dependency information...
> -    def strip_multilib(name, d):
> -        ml = d.getVar("MLPREFIX")
> -        if ml and name and len(ml) != 0 and name.find(ml) >= 0:
> -            return "".join(name.split(ml))
> -        return name
> -
>      workdir = d.getVar('WORKDIR')
>      tmpdir = d.getVar('TMPDIR')
>      pkgd = d.getVar('PKGD')
> @@ -665,7 +636,7 @@ python do_package_rpm () {
>      # If the spec file already exist, and has not been stored into 
>      # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
>      # so remove it before doing rpmbuild src.rpm.
> -    srcname    = strip_multilib(d.getVar('PN'), d)
> +    srcname    = d.getVar('PN')
>      outspecfile = workdir + "/" + srcname + ".spec"
>      if os.path.isfile(outspecfile):
>          os.remove(outspecfile)
> @@ -684,11 +655,7 @@ python do_package_rpm () {
>      # Let's not fight against this.
>      package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_").replace("all", "noarch")
>      sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
> -    if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
> -        ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
> -        d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
> -    else:
> -        d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
> +    d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
>      pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
>      d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
>      bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
> 


