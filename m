Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C219E7222C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:18:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAP3IDg7007414
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:18:13 -0800 (PST)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 24 Nov 2014 19:18:12 -0800
Message-ID: <5473F4F1.2040005@windriver.com>
Date: Tue, 25 Nov 2014 11:18:09 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1416885339-11694-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1416885339-11694-1-git-send-email-ming.liu@windriver.com>
X-Originating-IP: [128.224.163.186]
Subject: Re: [PATCH] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Tue, 25 Nov 2014 03:18:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

This path is after my previous review request "[OE-core] [PATCH 1/3] 
binconfig.bbclass: introduce BINCONFIG_FILES variable".

//Ming Liu

On 11/25/2014 11:15 AM, Ming Liu wrote:
> In a lot of cases binconfig files refer to multilib particular paths like
> ${base_libdir}, ${libdir}, this would certainly cause files conflict among
> multilib packages when they are involved in the image, for instance:
> with following lines:
> ......
> IMAGE_INSTALL_append = " curl"
> IMAGE_INSTALL_append = " lib32-curl"
> ......
>
> $ bitbake ${DEFAULT_IMAGE} -c populate_sdk
>
> The above task would fail due to the file conflicts between multilib
> binconfigs.
>
> I know the situation is that most of the binconfig usage were removed from
> recipes, but there are still some not in the case, and we also need take
> account of the cases that some recipes may need it for their own purpose.
>
> This patch aims to use update-alternatives link *-config from real path
> with a PACKAGE_ARCH suffix to avoid the conflicts, which will shore up the
> binconfig.bbclass without introducing any harmness.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/classes/binconfig.bbclass           | 81 ++++++++++++++++++++++++++++++++
>   meta/recipes-devtools/tcltk/tcl_8.6.3.bb |  1 +
>   2 files changed, 82 insertions(+)
>
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
> index abeda57..b8cc518 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -1,4 +1,5 @@
>   BINCONFIG_FILES ?= "${bindir}/*-config"
> +BINCONFIG_FILES_class-target ?= "${bindir}/*-config.${PACKAGE_ARCH}"
>   FILES_${PN}-dev += "${BINCONFIG_FILES}"
>    
>   # The namespaces can clash here hence the two step replace
> @@ -27,9 +28,21 @@ def get_binconfig_mangle(d):
>   
>       return s
>   
> +python __anonymous() {
> +    # Update Alternatives are only used on target packages
> +    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or \
> +       bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or \
> +       bb.data.inherits_class('cross-canadian', d):
> +        return
> +
> +    if not 'virtual/update-alternatives' in d.getVar('PROVIDES', True):
> +        d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
> +}
> +
>   BINCONFIG_GLOB ?= "*-config"
>   
>   PACKAGE_PREPROCESS_FUNCS += "binconfig_package_preprocess"
> +PACKAGE_PREPROCESS_FUNCS_append_class-target = " binconfig_rename_package_preprocess"
>   
>   binconfig_package_preprocess () {
>   	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
> @@ -54,6 +67,74 @@ binconfig_package_preprocess () {
>   	done	
>   }
>   
> +binconfig_rename_package_preprocess () {
> +	binconfig_files=`echo ${BINCONFIG_FILES} | sed 's:\.${PACKAGE_ARCH}::'`
> +	for config in `find ${PKGD} -wholename ${PKGD}$binconfig_files`; do
> +		if [ -h $config ]; then
> +			real_config=`readlink $config`
> +			unlink $config
> +			( cd ${PKGD}${bindir} ; ln -sf $real_config.${PACKAGE_ARCH} $config.${PACKAGE_ARCH} )
> +		else
> +			mv $config $config.${PACKAGE_ARCH}
> +		fi
> +	done
> +}
> +
> +BINCONFIG_PRIORITY ?= "10"
> +
> +PACKAGESPLITFUNCS_prepend_class-target = "populate_packages_binconfig "
> +
> +#
> +# Fix binconfig conflicts among multilib packages
> +#
> +python populate_packages_binconfig () {
> +    import os, glob
> +
> +    pkg = d.getVar('PN', True) + '-dev'
> +    dvar = d.getVar('PKGD', True)
> +    binconfig_files = d.getVar('BINCONFIG_FILES', True)
> +    binconfig_priority = d.getVar('BINCONFIG_PRIORITY', True)
> +    binconfig_setup_links = ""
> +    binconfig_remove_links = ""
> +    for file in glob.glob('%s%s' % (dvar, binconfig_files)):
> +        binconfig_target = os.path.basename(file)
> +        binconfig_name = binconfig_target[:binconfig_target.find('.')]
> +        binconfig_link = file[:file.rfind('.')].replace(dvar, "")
> +        binconfig_setup_links += '\tupdate-alternatives --install %s %s %s %s\n' % (binconfig_link, binconfig_name, binconfig_target, binconfig_priority)
> +        binconfig_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (binconfig_name, binconfig_target)
> +
> +        if binconfig_setup_links:
> +            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
> +            if provider:
> +                d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)
> +
> +            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
> +            postinst += binconfig_setup_links
> +            d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or '#!/bin/sh\n'
> +            postrm += binconfig_remove_links
> +            d.setVar('pkg_postrm_%s' % pkg, postrm)
> +}
> +
> +python package_do_filedeps_append_class-target () {
> +    import glob
> +
> +    pkg = d.getVar('PN', True) + '-dev'
> +    pkgdest = d.getVar('PKGDEST', True)
> +    binconfig_files = d.getVar('BINCONFIG_FILES', True)
> +
> +    for file in glob.glob('%s/%s%s' % (pkgdest, pkg, binconfig_files)):
> +        binconfig_target = os.path.basename(file)
> +        binconfig_link = file[:file.rfind('.')].replace(pkgdest + os.sep + pkg, "")
> +
> +        # Add file provide
> +        trans_target = oe.package.file_translate('%s' % file.replace(pkgdest + os.sep + pkg, ""))
> +        d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + binconfig_link)
> +        if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or ""):
> +            d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
> +}
> +
>   SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
>   
>   binconfig_sysroot_preprocess () {
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
> index 27197fa..055b9cf 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
> @@ -92,6 +92,7 @@ do_install_ptest() {
>   # Fix some paths that might be used by Tcl extensions
>   BINCONFIG_GLOB = "*Config.sh"
>   BINCONFIG_FILES = "${bindir}/*Config.sh"
> +BINCONFIG_FILES_class-target = "${bindir}/*Config.sh.${PACKAGE_ARCH}"
>   
>   # Fix the path in sstate
>   SSTATE_SCAN_FILES += "*Config.sh"


