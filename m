Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOVdQ-0004Vy-OH
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:34:16 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so11895480ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JcIw0CiZGDOM3i3pMCjWKC+CG7Sxg4D7lbwll26CbEI=;
	b=LZaOWyTATBaTMi6KLN3rlEmxvHB+4unKD5Sf2RWhikPK5ME2FDEwpLha7EK2sIJWCq
	Ejvd4Hra3MTJeJ0CiXj/whvgvPwlMO7t3faZ12Kkp+Fgu33Gefq6U/VJaS6VDdLxMzuI
	FY2BnXpnGnzYqdC96Dkwp1bV57G9qSdXaYwSmsbIo+FSni4fPD87ZDijFHEmJkK6VuF9
	3Aze8DoljGE/G91fy+4S/CUC59p9X7d0tHFACDUraFX2KKve/VDCeAF0amIXsOM/8ROH
	4tYdiSi4hcwvsTg/Kdzfyx5lwrFy4VvdVRPX2C2XuufeEJWIVIkMYgr1VCw53JlZKmBV
	iwIA==
MIME-Version: 1.0
Received: by 10.50.181.202 with SMTP id dy10mr1937076igc.14.1350487260530;
	Wed, 17 Oct 2012 08:21:00 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 08:21:00 -0700 (PDT)
In-Reply-To: <1350484172-9188-2-git-send-email-s.stirtzel@googlemail.com>
References: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
	<1350484172-9188-2-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 17 Oct 2012 17:21:00 +0200
Message-ID: <CAGiJk9eM=Zhz0uVLhw0ba=wsxp5c-Dz8Z7t5SSDwZKvHX_d0LA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
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
X-List-Received-Date: Wed, 17 Oct 2012 15:34:17 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/17 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> This is used by:
> openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta/classes/gtk-immodules-cache.bbclass |   72 ++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 meta/classes/gtk-immodules-cache.bbclass
>
> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
> new file mode 100644
> index 0000000..cb2d46d
> --- /dev/null
> +++ b/meta/classes/gtk-immodules-cache.bbclass
> @@ -0,0 +1,72 @@
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
> +    packages = d.getVar('PACKAGES', True).split()
> +    pkgdest =  d.getVar('PKGDEST', True)
^^^^^^^^^^
These two are unused variables, v2 coming soon

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
> --
> 1.7.9.5
>



-- 
Regards
Samuel


