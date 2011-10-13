Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RELrS-0000GR-Rz for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:02:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9DE39eE026632 for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 15:03:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gULFZDXXjxaq
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 15:03:09 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9DE37IE026613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 15:03:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 14:56:24 +0100
In-Reply-To: <20111013133221.GC28525@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted> <20111013133221.GC28525@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318514192.23801.229.camel@ted>
Mime-Version: 1.0
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 14:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 15:32 +0200, Martin Jansa wrote:
> On Thu, Oct 13, 2011 at 02:23:54PM +0100, Richard Purdie wrote:
> > On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > > * not everybody needs i915, i965
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa-dri.inc     |    4 ++++
> > >  meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
> > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
> > > index 603438e..be6905c 100644
> > > --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> > > @@ -6,6 +6,10 @@ DEFAULT_PREFERENCE = "-1"
> > >  
> > >  EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers"
> > >  
> > > +MACHINE_DRI_MODULES ?= ""
> > > +PACKAGE_ARCH = "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data.getVar('MACHINE_DRI_MODULES',d,1) == '']}"
> > > +EXTRA_OECONF += "--with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
> > > +
> > >  python populate_packages_prepend() {
> > >  	import os.path
> > 
> > Whilst I understand the problem, I don't like this solution.
> > Particularly, it means that the meas-dri package needs to be marked as
> > machine specific which I don't like the idea of at all.
> > 
> > How about we do this on a per architecture basis?
> 
> taken from cover-letter:
> but maybe we can use it as distro variable and keep it with default arch.
> But then we cannot just add ie glamo dri module from meta-openmoko like this:
> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=b50c8d00cf764c276b0792c0623b8eda3d18d343
> without distro (setting MACHINE_DRI_MODULES) depending on such bsp layer.

Whilst I hadn't seen the patch I was guessing you were doing something
like this. Will the glamo module build on all arm platforms or just
gta02 specifically?

> per architecture has same problem as distro basis
> 
> btw: in old recipes there was --with-dri-drivers with only one -, so maybe it 
> wasn't actually working even for i915, i965 before or configure has benevolent syntax

It defaults to enable all modules. We don't have libdrm-nouveau (or
llvm) so we had to change the config options to explicitly enable the
pieces I know are cared about on x86 in the latest version. This is why
the COMPATIBLE_HOST is there too since that recipe was always meaning to
compile these modules.

FWIW, if a patch needs some change in behaviour such as the introduction
of a variable like MACHINE_DRI_MODULES, we need to spell this out very
clearly. I know its better in this series but that was a major problem
in the last version. I'm spelling this out for anyone else on the
mailing list to take note of!

Cheers,

Richard
 



