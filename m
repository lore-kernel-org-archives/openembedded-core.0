Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2E7165D1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 05:41:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L5fjdK013253
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Apr 2014 22:41:45 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 20 Apr 2014 22:41:45 -0700
Message-ID: <5354AF95.7040109@windriver.com>
Date: Mon, 21 Apr 2014 13:41:41 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: ming liu <mliu3@pek-lpgbuild1.wrs.com>
References: <1398058390-3227-1-git-send-email-mliu3@pek-lpgbuild1.wrs.com>
In-Reply-To: <1398058390-3227-1-git-send-email-mliu3@pek-lpgbuild1.wrs.com>
X-Originating-IP: [128.224.163.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Mon, 21 Apr 2014 05:41:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I know this patch is not going to be integrated, for as Richard Purdie 
pointed out, it should be replaced by a requirement and not needed for 
any kind of shored up, but my V1 patch introduced a few drawbacks, so I 
put the V2 here to ensure anybody wanna enable multilib in their builds 
wouldn't get blocked by this issue before the binconfig.bbclass is removed.

//Ming Liu

On 04/21/2014 01:33 PM, ming liu wrote:
> From: Ming Liu <ming.liu@windriver.com>
>
> In most cases binconfig files conflict among multilib packages, to avoid
> that, use update-alternatives link *-config from real path with a
> PACKAGE_ARCH suffix.
>
> This change needs only apply to target recipes.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/classes/binconfig.bbclass |   86 +++++++++++++++++++++++++++++++++++++++-
>   1 files changed, 85 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
> index 7158c8c..b6c3923 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -1,4 +1,6 @@
> -FILES_${PN}-dev += "${bindir}/*-config"
> +BINCONFIG_FILES = "${bindir}/*-config"
> +BINCONFIG_FILES_class-target = "${bindir}/*-config.${PACKAGE_ARCH}"
> +FILES_${PN}-dev += "${BINCONFIG_FILES}"
>    
>   # The namespaces can clash here hence the two step replace
>   def get_binconfig_mangle(d):
> @@ -26,9 +28,21 @@ def get_binconfig_mangle(d):
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
> @@ -51,6 +65,76 @@ binconfig_package_preprocess () {
>   	done	
>   }
>   
> +binconfig_rename_package_preprocess () {
> +	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
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
> +    bindir = d.getVar('bindir', True)
> +    binconfig_glob = d.getVar('BINCONFIG_GLOB', True)
> +    binconfig_priority = d.getVar('BINCONFIG_PRIORITY', True)
> +    binconfig_setup_links = ""
> +    binconfig_remove_links = ""
> +    for file in glob.glob('%s%s/%s.%s' % (dvar, bindir, binconfig_glob, d.getVar('PACKAGE_ARCH', True))):
> +        binconfig_target = os.path.basename(file)
> +        binconfig_name = binconfig_target[:binconfig_target.find('.')]
> +        binconfig_link = bindir + os.sep + binconfig_name
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
> +    pn = d.getVar('BPN', True)
> +    pkg = d.getVar('PN', True) + '-dev'
> +    pkgdest = d.getVar('PKGDEST', True)
> +    bindir = d.getVar('bindir', True)
> +    binconfig_glob = d.getVar('BINCONFIG_GLOB', True)
> +
> +    for file in glob.glob('%s/%s%s/%s.%s' % (pkgdest, pkg, bindir, binconfig_glob, d.getVar('PACKAGE_ARCH', True))):
> +        binconfig_target = os.path.basename(file)
> +        binconfig_link = '%s/%s' % (bindir, binconfig_target[:binconfig_target.find('.')])
> +
> +        # Add file provide
> +        trans_target = oe.package.file_translate('%s/%s' % (bindir, binconfig_target))
> +        d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + binconfig_link)
> +        if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or ""):
> +            d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
> +}
> +
>   SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
>   
>   binconfig_sysroot_preprocess () {


