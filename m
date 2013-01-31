Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0zZu-0002Dz-9F
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 20:13:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jan 2013 10:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,578,1355126400"; d="scan'208";a="284796303"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2013 10:57:57 -0800
Message-ID: <510ABEB0.5050400@linux.intel.com>
Date: Thu, 31 Jan 2013 10:57:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
	<61320cb73d2e573199e129ff355494f9ef47a6c2.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <61320cb73d2e573199e129ff355494f9ef47a6c2.1359554291.git.richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/17] package.bbclass: Split out package_fixsymlinks function
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
X-List-Received-Date: Thu, 31 Jan 2013 19:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2013 06:01 AM, Richard Purdie wrote:
> The symlink handling code doesn't need to being part of populate_packages
> and is logically separate so split it out into a separate function,
> package_fixsymlinks.
>

Not sure why, this patch causes a problem with the hicolor-icon-theme.

The problem I see is:
TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
> ERROR:      0127:        bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
> ERROR:      0128:        rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
> ERROR:  *** 0129:        rdepends = rdepends + ' ' + d.getVar('MLPREFIX') + "hicolor-icon-t

In this case the rdepends is a NoneType.

I have a patch on the queue that solves the problem. I changed the lines 
above to use d.appendVar().

Sau!



> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/package.bbclass |   17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 858afbd..8bf80f5 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -919,7 +919,7 @@ python split_and_strip_files () {
>   }
>
>   python populate_packages () {
> -    import glob, stat, errno, re, subprocess
> +    import glob, re, subprocess
>
>       workdir = d.getVar('WORKDIR', True)
>       outdir = d.getVar('DEPLOY_DIR', True)
> @@ -1037,10 +1037,17 @@ python populate_packages () {
>               package_qa_handle_error("installed_vs_shipped", msg, d)
>
>       bb.build.exec_func("package_name_hook", d)
> +}
> +populate_packages[dirs] = "${D}"
> +
> +python package_fixsymlinks () {
> +    import errno
> +    pkgdest = d.getVar('PKGDEST', True)
> +    packages = d.getVar("PACKAGES").split()
>
>       dangling_links = {}
>       pkg_files = {}
> -    for pkg in package_list:
> +    for pkg in packages:
>           dangling_links[pkg] = []
>           pkg_files[pkg] = []
>           inst_root = os.path.join(pkgdest, pkg)
> @@ -1059,13 +1066,13 @@ python populate_packages () {
>                           target = os.path.join(root[len(inst_root):], target)
>                       dangling_links[pkg].append(os.path.normpath(target))
>
> -    for pkg in package_list:
> +    for pkg in packages:
>           rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
>
>           for l in dangling_links[pkg]:
>               found = False
>               bb.debug(1, "%s contains dangling link %s" % (pkg, l))
> -            for p in package_list:
> +            for p in packages:
>                   for f in pkg_files[p]:
>                       if f == l:
>                           found = True
> @@ -1079,7 +1086,6 @@ python populate_packages () {
>                   bb.note("%s contains dangling symlink to %s" % (pkg, l))
>           d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
>   }
> -populate_packages[dirs] = "${D}"
>
>   PKGDESTWORK = "${WORKDIR}/pkgdata"
>
> @@ -1842,6 +1848,7 @@ PACKAGEFUNCS ?= "package_get_auto_pr \
>                   split_and_strip_files \
>                   fixup_perms \
>                   populate_packages \
> +                package_fixsymlinks \
>                   package_do_filedeps \
>                   package_do_shlibs \
>                   package_do_pkgconfig \
>


