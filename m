Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id F0BAA6CB10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 17:10:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1VOW7f-0005lp-GR for openembedded-core@lists.openembedded.org;
	Tue, 24 Sep 2013 19:10:03 +0200
Received: from proxysb02-out.ext.ti.com ([192.94.94.106])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 19:10:03 +0200
Received: from fcooper by proxysb02-out.ext.ti.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 19:10:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Franklin S. Cooper Jr <fcooper@ti.com>
Date: Tue, 24 Sep 2013 17:05:28 +0000 (UTC)
Message-ID: <loom.20130924T183757-12@post.gmane.org>
References: <1377024321-6230-1-git-send-email-fcooper@ti.com>
	<5213B9E1.1050805@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 192.94.94.106 (Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:23.0) Gecko/20100101 Firefox/23.0)
Subject: Re: [PATCH v2] kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
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
X-List-Received-Date: Tue, 24 Sep 2013 17:10:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Mark Hatle <mark.hatle@...> writes:

> 
> On 8/20/13 1:45 PM, Franklin S. Cooper Jr wrote:
> > * By default for some platforms U-boot assumes the kernel image is
located in
> >    the boot directory of the root filesystem.
> > * The kernel.bbclass already includes the kernel image in the /boot
directory
> >    but adds a version number to the file name.
> > * Create a symbolic link that names the kernel image in the exact way that
> >    U-boot expects.
> 
> This should be done with a package post-install script.  It is fairly
common for 
> multilib kernel versions to be installed on a machine at the same time,
with the 
> Link pointing to the 'last-installed' version.  Doing it in the do_install
rule 
> will cause a conflict (at least in the RPM case), preventing certain field 
> upgrade activities.
> 
> post install script with something like:
> 
> ln -sf $D/boot/≤kernel_name> <common-name>
> 
> Should work.
> 
> (The above assumes that the kernel itself is being packaged.. if it's not
being 
> packages and just copied to the end image -- then doing the link should be
fine.)
> 
> --

Looks like the below patch addresses my issue and also handles it in the
same way you recommended.

kernel.bbclass: Correct post(inst|rm) package association 
OE Core Commit: 35f538b117e3387354d2dab1f22c3de28ab1322b
> 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@...>
> > ---
> > Version 2 changes:
> > Change "ln -s" to "ln -sf" based on Bruce's comment.
> >
> >   meta/classes/kernel.bbclass |    1 +
> >   1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index e039dfc..6e7d994 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> >  <at>  <at>  -109,6 +109,7  <at>  <at>  kernel_do_install() {
> >   	install -d ${D}/${KERNEL_IMAGEDEST}
> >   	install -d ${D}/boot
> >   	install -m 0644 ${KERNEL_OUTPUT}
${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> > +	ln      -sf
${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
> >   	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> >   	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> >   	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> >
> 





