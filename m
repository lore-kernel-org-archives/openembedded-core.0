Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFF2781E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 20:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9F0F20A31;
	Fri,  8 Sep 2017 20:37:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BS90h8I3H7Py; Fri,  8 Sep 2017 20:37:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8E2E1203A8;
	Fri,  8 Sep 2017 20:37:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 21C281625E1; Fri,  8 Sep 2017 16:37:26 -0400 (EDT)
Date: Fri, 8 Sep 2017 16:37:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Barker <pbarker@toganlabs.com>
Message-ID: <20170908203726.GG26405@denix.org>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Fri, 08 Sep 2017 20:37:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 08, 2017 at 09:06:17PM +0100, Paul Barker wrote:
> On Mon, Aug 21, 2017 at 10:21 AM, Martin Hundebøll <mnhu@prevas.dk> wrote:
> > Hard depending on the kernel makes it impossible to install kernel
> > modules without getting the kernel image installed too. This is
> > inconvenient in e.g. initramdisks, where the kernel is loaded from
> > outside the initramdisk.
> >
> > Making the kernel modules rrecommend kernel-image-<version> instead of
> > rdepending on it, makes it possible to install kernel modules without
> > the kernel image by setting "kernel-image" in BAD_RECOMMENDATIONS.
> >
> > Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> > ---
> >  meta/classes/kernel-module-split.bbclass | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> > index 1035525dac..78843c5474 100644
> > --- a/meta/classes/kernel-module-split.bbclass
> > +++ b/meta/classes/kernel-module-split.bbclass
> > @@ -120,6 +120,11 @@ python split_kernel_module_packages () {
> >                  rdepends[dep] = []
> >          d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
> >
> > +        # let kernel modules runtime recommend kernel image
> > +        rrecommends = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
> > +        rrecommends['kernel-image'] = []
> > +        d.setVar('RRECOMMENDS_' + pkg, bb.utils.join_deps(rrecommends, commasep=False))
> > +
> >          # Avoid automatic -dev recommendations for modules ending with -dev.
> >          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
> >
> > @@ -138,7 +143,7 @@ python split_kernel_module_packages () {
> >      postinst = d.getVar('pkg_postinst_modules')
> >      postrm = d.getVar('pkg_postrm_modules')
> >
> > -    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
> > +    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='')
> >      if modules:
> >          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
> >          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> > --
> > 2.14.1
> >
> 
> This breaks the method described in the kernel dev FAQ to omit the
> kernel image from the rootfs which is to set the following in a conf
> file:
> 
>     RDEPENDS_kernel-base = ""
> 
> See http://www.yoctoproject.org/docs/2.3.1/kernel-dev/kernel-dev.html#idm45690538384880.
> 
> By recommending kernel-image directly instead of recommending the
> top-level kernel-<version> package which was actually removed from
> extra_depends, we skip the inclusion of the kernel-base package. I'm
> not familiar enough with the details of kernel module loading to know
> if the 2 files in kernel-base (modules.builtin and modules.order) are
> strictly needed but I think they should at least be included in via
> recommendation.
> 
> As we already have a documented way to omit the kernel image, can we
> revert this?
> 
> As an alternative I can send in a patch which changes the recommend to
> the top-level kernel-<version> package instead of kernel-image.

FWIW, this was discussed at #yocto on IRC today. When I first saw the change 
several days ago, I was puzzled as well...
The existing method has been in use by many of us for a very long time and 
seems to be well documented - I also vote for reverting the change.

-- 
Denys

