Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REkLG-0001t3-Vp for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:10:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EGBVw5023675 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 17:11:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xaPmruewWx5V
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 17:11:31 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EGBS82023660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 17:11:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 17:04:44 +0100
In-Reply-To: <20111013140718.GD28525@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted> <20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted> <20111013140718.GD28525@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318608293.2342.33.camel@ted>
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
X-List-Received-Date: Fri, 14 Oct 2011 16:10:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 16:07 +0200, Martin Jansa wrote:
> On Thu, Oct 13, 2011 at 02:56:24PM +0100, Richard Purdie wrote:
> > On Thu, 2011-10-13 at 15:32 +0200, Martin Jansa wrote:
> > > On Thu, Oct 13, 2011 at 02:23:54PM +0100, Richard Purdie wrote:
> > > > On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > > > > * not everybody needs i915, i965
> > > > > 
> > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > ---
> > > > >  meta/recipes-graphics/mesa/mesa-dri.inc     |    4 ++++
> > > > >  meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
> > > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
> > > > > index 603438e..be6905c 100644
> > > > > --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> > > > > +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> > > > > @@ -6,6 +6,10 @@ DEFAULT_PREFERENCE = "-1"
> > > > >  
> > > > >  EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers"
> > > > >  
> > > > > +MACHINE_DRI_MODULES ?= ""
> > > > > +PACKAGE_ARCH = "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data.getVar('MACHINE_DRI_MODULES',d,1) == '']}"
> > > > > +EXTRA_OECONF += "--with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
> > > > > +
> > > > >  python populate_packages_prepend() {
> > > > >  	import os.path
> > > > 
> > > > Whilst I understand the problem, I don't like this solution.
> > > > Particularly, it means that the meas-dri package needs to be marked as
> > > > machine specific which I don't like the idea of at all.
> > > > 
> > > > How about we do this on a per architecture basis?
> > > 
> > > taken from cover-letter:
> > > but maybe we can use it as distro variable and keep it with default arch.
> > > But then we cannot just add ie glamo dri module from meta-openmoko like this:
> > > http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=b50c8d00cf764c276b0792c0623b8eda3d18d343
> > > without distro (setting MACHINE_DRI_MODULES) depending on such bsp layer.
> > 
> > Whilst I hadn't seen the patch I was guessing you were doing something
> > like this. Will the glamo module build on all arm platforms or just
> > gta02 specifically?
> 
> It should build on all arm platforms, but depends on another patch to
> libdrm
> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=0a846fa3dec896751b44811cd909013874920aae
> which should also build on all arm platforms.
> 
> I was using both patches for all machines (distr==SHR basis) in OE-classic, 
> but with BSP layers I found it nice to keep them only in respective layer 
> and now I would need to move them to upper layer again..

Not necessarily, you can keep them in the layer but apply the patch
globally. This means you do need to build shr with all layers enabled
but that shouldn't be too much of an issue?

Cheers,

Richard



