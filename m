Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3EF6D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:46:41 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1VipNP-0006e0-Dx
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Nov 2013 18:46:42 +0100
Message-ID: <1384883174.23724.116.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:46:14 +0000
In-Reply-To: <20131119173725.GA13018@mcrowe.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2013-11-19 at 17:37 +0000,
	Mike Crowe wrote: > On
	Tuesday 08 October 2013 at 17:12:54 -0400,
	Bruce Ashfield wrote: > > When building against the sysroot,
	out of tree modules can require modpost > >
	and other utilities normally found in the kernel's scripts directory.
	For > > the kernel source in the staging dir,
	these scripts have been removed
	to > > avoid mixing archiectures when packaging kernel-dev (among other
	things).
	> > > > Rather than further complicate the kernel's install rule, or its
	packaging,
	> > we can restore the scripts by building them in the kernel staging
	directory > > after the sstate is installed,
	making them available to packages
	that need them. > > > > Signed-off-by: Bruce Ashfield
	<bruce.ashfield@windriver.com>
	> > --- > > meta/classes/kernel.bbclass | 11 +++++++++++ > > 1 file
	changed, 
	11 insertions(+) > > > > diff --git a/meta/classes/kernel.bbclass
	b/meta/classes/kernel.bbclass
	> > index 4acfb7e..d5fa801 100644 > > --- a/meta/classes/kernel.bbclass
	> > +++ b/meta/classes/kernel.bbclass > > @@ -292, 6 +292,
	17 @@ kernel_do_install()
	{ > > } > > do_install[prefuncs] += "package_get_auto_pr" > > > > + > >
	+SSTATEPOSTINSTFUNCS
	+= "kernelscripts_sstate_postinst" > > +kernelscripts_sstate_postinst
	() { > > + if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o
	"${BB_CURRENTTASK}" = "populate_sysroot_setscene" ];
	then > > + ( > > + cd ${STAGING_KERNEL_DIR}
	> > + oe_runmake scripts > > + ) > > + fi > > +} > > + > >
	sysroot_stage_all_append()
	{ > > sysroot_stage_dir ${D}${KERNEL_SRC_PATH}
	${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
	> > } > > This sstate_postinst fails for me when the compiler isn't
	already present > in the sysroot. > > Also,
	I notice that the environment and parameters
	passed to oe_runmake are > not the same as those used by
	kernel_do_compile etc. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 17:46:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 17:37 +0000, Mike Crowe wrote:
> On Tuesday 08 October 2013 at 17:12:54 -0400, Bruce Ashfield wrote:
> > When building against the sysroot, out of tree modules can require modpost
> > and other utilities normally found in the kernel's scripts directory. For
> > the kernel source in the staging dir, these scripts have been removed to
> > avoid mixing archiectures when packaging kernel-dev (among other things).
> > 
> > Rather than further complicate the kernel's install rule, or its packaging,
> > we can restore the scripts by building them in the kernel staging directory
> > after the sstate is installed, making them available to packages that need them.
> > 
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  meta/classes/kernel.bbclass | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 4acfb7e..d5fa801 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -292,6 +292,17 @@ kernel_do_install() {
> >  }
> >  do_install[prefuncs] += "package_get_auto_pr"
> >  
> > +
> > +SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
> > +kernelscripts_sstate_postinst () {
> > +	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
> > +		( 
> > +		  cd ${STAGING_KERNEL_DIR}
> > +		  oe_runmake scripts
> > +		)
> > +	fi
> > +}
> > +
> >  sysroot_stage_all_append() {
> >  	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
> >  }
> 
> This sstate_postinst fails for me when the compiler isn't already present
> in the sysroot.
> 
> Also, I notice that the environment and parameters passed to oe_runmake are
> not the same as those used by kernel_do_compile etc.

Also note that module.bbclass already does "make scripts" before
do_compile() so out-of-tree modules should already have access to all
the files that they need.  

If we're going to make a policy decision that the kernel is responsible
for making scripts then I guess that's fine (modulo the implementation
problems that Mike describes) but in that case the code in
module{-base}.bbclass is redundant and ought to be removed.

p.



