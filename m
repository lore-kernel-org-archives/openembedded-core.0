Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2kj-0003rw-L5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:20:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Oct 2012 08:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="159854416"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2012 08:06:27 -0700
Message-ID: <508803F2.7020809@linux.intel.com>
Date: Wed, 24 Oct 2012 08:06:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
References: <1350545567-16374-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1350545567-16374-1-git-send-email-s.stirtzel@googlemail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Wed, 24 Oct 2012 15:20:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2012 12:32 AM, Samuel Stirtzel wrote:
> This is used by:
> openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>   meta/classes/gtk-immodules-cache.bbclass |   55 ++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 meta/classes/gtk-immodules-cache.bbclass
>
> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
> new file mode 100644
> index 0000000..515d28b
> --- /dev/null
> +++ b/meta/classes/gtk-immodules-cache.bbclass
> @@ -0,0 +1,55 @@
> +# This class will update the inputmethod module cache for virtual keyboards
> +#
> +# Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
> +
> +gtk_immodule_cache_postinst() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +if [ ! -z `which gtk-query-immodules-2.0` ]; then
> +    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +fi
> +if [ ! -z `which gtk-query-immodules-3.0` ]; then
> +    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
> +fi
> +}
> +
> +gtk_immodule_cache_postrm() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +if [ ! -z `which gtk-query-immodules-2.0` ]; then
> +    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +fi
> +if [ ! -z `which gtk-query-immodules-3.0` ]; then
> +    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
> +fi
> +}
> +
> +python populate_packages_append () {
> +    gtkimmodules_pkgs = d.getVar('GTKIMMODULES_PACKAGES', True).split()
> +
> +    for pkg in gtkimmodules_pkgs:
> +            bb.note("adding gtk-immodule-cache postinst and postrm scripts to %s" % pkg)
> +
> +            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
> +            if not postinst:
> +                postinst = '#!/bin/sh\n'
> +            postinst += d.getVar('gtk_immodule_cache_postinst', True)
> +            d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
> +            if not postrm:
> +                postrm = '#!/bin/sh\n'
> +            postrm += d.getVar('gtk_immodule_cache_postrm', True)
> +            d.setVar('pkg_postrm_%s' % pkg, postrm)
> +}
> +
> +python __anonymous() {
> +    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
> +        if not gtkimmodules_check:
> +            bb_filename = d.getVar('FILE')
> +            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
> +}
> +
>
Merged into OE-Core

Thanks
	Sau!


