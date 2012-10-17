Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOWUe-0005Yh-Sk for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 18:29:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HGFtYj007462;
	Wed, 17 Oct 2012 17:15:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07386-01; Wed, 17 Oct 2012 17:15:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HGFk6i007455
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 17 Oct 2012 17:15:47 +0100
Message-ID: <1350490553.2185.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Wed, 17 Oct 2012 17:15:53 +0100
In-Reply-To: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Wed, 17 Oct 2012 16:29:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-17 at 17:24 +0200, Samuel Stirtzel wrote:
> This is used by:
> openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> 
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta/classes/gtk-immodules-cache.bbclass |   70 ++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 meta/classes/gtk-immodules-cache.bbclass
> 
> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
> new file mode 100644
> index 0000000..833eefe
> --- /dev/null
> +++ b/meta/classes/gtk-immodules-cache.bbclass
> @@ -0,0 +1,70 @@
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
> +def gtkimmodules_after_parse(d):
> +    def gtkimmodules_check_vars():
> +        if d.getVar('BB_WORKERCONTEXT', True) is not None:
> +            return
> +
> +        bb_filename = d.getVar('FILE')
> +        packages = d.getVar('PACKAGES', True)
> +
> +        # check gtk-immodules package
> +        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES', True) or ""
> +        if gtkimmodules_check == "":
> +            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
> +
> +    bpn = d.getVar('BPN', 1)
> +    if bpn + "-native" != d.getVar('PN', 1) and \
> +            bpn + "-cross" != d.getVar('PN', 1) and \
> +            bpn + "-nativesdk" != d.getVar('PN', 1):
> +        gtkimmodules_check_vars()
> +
> +python __anonymous() {
> +    gtkimmodules_after_parse(d)
> +}
> +

Sorry, but the after_parse code above is horrible. How about something
more simple like:

python __anonymous() {
    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
        if not gtkimmodules_check:
            bb_filename = d.getVar('FILE')
            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
}

I'd like to know where you got the inspiration for the original as I'd
like to simplify that too!

Cheers,

Richard



