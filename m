Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 07FC76A498
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 13:03:23 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 May 2013 06:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,758,1363158000"; d="scan'208";a="247634787"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by AZSMGA002.ch.intel.com with ESMTP; 28 May 2013 06:03:20 -0700
Message-ID: <51A4AB07.4070904@linux.intel.com>
Date: Tue, 28 May 2013 22:03:03 +0900
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
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
X-List-Received-Date: Tue, 28 May 2013 13:03:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2013 05:01 PM, Ming Liu wrote:
> libpam might miss ABI specific dependencies for pam-plugins-*, for RPM uses
> generic names to check the packages depending on it and doesn't consider the
> arch, which will lead to packaging issues in multilib build.
>
> pam_plugin_hook is added because the plugin packages are dynamically
> generated, so we need to manually process multilib names by add baselib to
> RPROVIDES/RDEPENDS as ABI specific tag.
>
There seems to still be an issue with multilib

>
> | Computing transaction...error: Can't install pam-plugin-unix-1.1.6-r2@lib64_x86_64: no package provides libpam-lib64
> |
> | Saving cache...

this is from the Autobuilder:

http://autobuilder.yoctoproject.org:8011/builders/nightly-multilib/builds/151/steps/Building%20Images_4/logs/stdio

Sau!

> [YOCTO #4532]
> [ CQID: WIND00416824 ]
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
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

