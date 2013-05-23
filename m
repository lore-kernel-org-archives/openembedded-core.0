Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFE1E6A2F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 14:40:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4NEeqxt013994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 07:40:52 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 23 May 2013 07:40:51 -0700
Message-ID: <519E2A73.3020509@windriver.com>
Date: Thu, 23 May 2013 09:40:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1369296115-20823-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1369296115-20823-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpam: fix multilib packaging issue for pam-plugins
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
X-List-Received-Date: Thu, 23 May 2013 14:40:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/13 3:01 AM, Ming Liu wrote:
> libpam might miss ABI specific dependencies for pam-plugins-*, for RPM uses
> generic names to check the packages depending on it and doesn't consider the
> arch, which will lead to packaging issues in multilib build.
>
> pam_plugin_hook is added because the plugin packages are dynamically
> generated, so we need to manually process multilib names by add baselib to
> RPROVIDES/RDEPENDS as ABI specific tag.
>
> [YOCTO #4532]
> [ CQID: WIND00416824 ]
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>

I worked with Ming Liu on this particular issue.  You may wonder why this is 
necessary let me attempt to explain the underlying causes.

In deb/ipk on a multilib package, the package name has specific multilib 
references in it.  I.e. the alternative libraries start with something like 
lib32-...  This was done primarily because deb/ipk do not allow two packages 
with the same name (but different architectures) to be installed at the same 
time.  So the name has to be unique.

In RPM however, the names of the packages and matches with the architectures and 
if they are not the same we can do these multilib installs.  This matches the 
behavior of other RPM based distributions and in many ways the tools people are 
used to working with RPM.  For the most part this works fine in multilib 
configurations because additional per-file dependencies are added that capture 
the shared library dependencies with ABI specific information.  This 
unfortunately fails in a few cases where plugins are dynamically loaded via 
dlopen -- such as libpam.

One possible fix is simply to follow the deb/ipk package naming, but this causes 
a design advantage of rpm.  When a package has a dependency on 'bash', we really 
don't care what bash is installed, only that -a- bash is installed.  In the 
deb/ipk case, the lib32- packages would end up with a lib32-bash dependency and 
you could potentially end up with two 'bash' packages being installed.

So the fix I recommended for the issue was to add the baselib path to the 
internal dependencies.  Since we know that the libpam installed in 'lib' needs 
the modules that were compiled to also work with the 'lib' version of libpam. 
While the libpam in 'lib64' need the modules to work with the 'lib64' version of 
the plugins.

Existing dependencies are preserved so there is no impact in the ipk/deb case, 
the RPM case is resolved as the additional dependency information is now present 
for the package manager to select the package we really want.

If anyone else has a suggestion for an alternative fix, we're interested -- but 
this is the best answer we could come up with.  (If any of the above should be 
added to the commit message, the YP bug, or documentation, please let me know 
and I'll make sure it gets added.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

--Mark

> ---
>   meta/recipes-extended/pam/libpam_1.1.6.bb | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
> index c355634..289f134 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
> @@ -51,9 +51,12 @@ FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
>
>   PACKAGES_DYNAMIC += "^pam-plugin-.*"
>
> -RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
> -RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory pam-plugin-succeed-if pam-plugin-time coreutils"
> -RRECOMMENDS_${PN} = "libpam-runtime"
> +RPROVIDES_${PN} += "libpam-${baselib}"
> +RPROVIDES_${PN}-runtime += "libpam-runtime-${baselib}"
> +
> +RDEPENDS_${PN}-runtime = "libpam-${baselib} pam-plugin-deny-${baselib} pam-plugin-permit-${baselib} pam-plugin-warn-${baselib} pam-plugin-unix-${baselib}"
> +RDEPENDS_${PN}-xtests = "libpam-${baselib} pam-plugin-access-${baselib} pam-plugin-debug-${baselib} pam-plugin-cracklib-${baselib} pam-plugin-pwhistory-${baselib} pam-plugin-succeed-if-${baselib} pam-plugin-time-${baselib} coreutils"
> +RRECOMMENDS_${PN} = "libpam-runtime-${baselib}"
>
>   python populate_packages_prepend () {
>       def pam_plugin_append_file(pn, dir, file):
> @@ -63,12 +66,30 @@ python populate_packages_prepend () {
>               nf = of + " " + nf
>           d.setVar('FILES_' + pn, nf)
>
> +    def pam_plugin_hook(file, pkg, pattern, format, basename):
> +        baselib = d.getVar('baselib', True)
> +        mlprefix = d.getVar('MLPREFIX', True) or ''
> +
> +        rdeps = d.getVar('RDEPENDS_' + pkg, True)
> +        if rdeps:
> +            rdeps = rdeps + " " + mlprefix + "libpam-" + baselib
> +        else:
> +            rdeps = mlprefix + "libpam-" + baselib
> +        d.setVar('RDEPENDS_' + pkg, rdeps)
> +
> +        provides = d.getVar('RPROVIDES_' + pkg, True)
> +        if provides:
> +            provides = provides + " " + pkg + "-" + baselib
> +        else:
> +            provides = pkg + "-" + baselib
> +        d.setVar('RPROVIDES_' + pkg, provides)
> +
>       dvar = bb.data.expand('${WORKDIR}/package', d, True)
>       pam_libdir = d.expand('${base_libdir}/security')
>       pam_sbindir = d.expand('${sbindir}')
>       pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
>
> -    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', extra_depends='')
> +    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
>       mlprefix = d.getVar('MLPREFIX', True) or ''
>       pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
>       pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
>


