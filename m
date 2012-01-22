Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ronnm-0002c0-Oe
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 04:09:06 +0100
Received: by iabz21 with SMTP id z21so3204780iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 19:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vf5VPmFgN9tRcpbpJ+YFSaCKLtStblY1HsZWNumG6ME=;
	b=mmiebRjUufnu01yIWlBm7/3DqKm6NCDZ/W4a9H2Ycbrj7V6Lqf42+aIhY5xJlw/0Li
	N7/eoWwCM0oHWLQWQXkRfXFWzUApiXbLc1PhiwmhhYJVhBk8DoDECxRLk5zom0bvWkCA
	0bTPEIhrEpHbBsT1UqOIZMklZ2BpsszCSoquw=
Received: by 10.50.12.162 with SMTP id z2mr4229282igb.3.1327201283681;
	Sat, 21 Jan 2012 19:01:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id gf6sm7774382igb.1.2012.01.21.19.01.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 19:01:22 -0800 (PST)
Date: Sat, 21 Jan 2012 19:02:16 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122030216.GD27997@sakrah.homelinux.org>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
	<1326733174.2933.3.camel@ted>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
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
X-List-Received-Date: Sun, 22 Jan 2012 03:09:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/01/12 03:05), Lu, Lianhao wrote:
> 
> Richard Purdie wrote on 2012-01-17:
> > On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
> >> [YOCTO #1555]
> >> Adding new mechanism to allow multiple gcc related recipes sharing the
> >> same src directory when using the basichash as the signature handler.
> >> 
> >> Using the same stamp file for multiple gcc related recipes to share the
> >> same src directory is no longer working when using the basichash
> >> signature.
> >> 
> >> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> >> ---
> >>  meta/recipes-devtools/gcc/gcc-common.inc |   56 ++++++++++++++++++++++++++++++
> >>  1 files changed, 56 insertions(+), 0 deletions(-)
> > 
> > Can you please check if this can be fixed by:
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > index d014980..3a82720 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > @@ -77,6 +77,9 @@ do_headerfix () {
> > 
> >  addtask headerfix after do_unpack before do_patch
> > +CROSS_TARGET_SYS_DIR[vardepsexclude] = "PN"
> > +CROSS_TARGET_SYS_DIR[vardepvalue] = "1"
> > +
> >  do_configure_prepend () {
> >         # teach gcc to find correct target includedir when checking libc ssp support
> >         mkdir -p ${B}/gcc
> > as discussed in the "sstate info" thread?
> > 
> 
> By using this patch, gcc-cross-initial, gcc-cross-intermediate, gcc-cross would have the same signatures for tasks like do_fetch, do_unpack, do_headerfix, do_patch. But libgcc still has different signature with gcc-cross-initial for task do_patch.
> 
> By bitbake-diffsigs the do_patch signature files between gcc-cross-initial and libgcc, it says:
>   Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
>   Dependency on task gcc-cross-initial_4.6.bb.do_headerfix was added
>   Dependency on task libgcc_4.6.bb.do_unpack was removed
> 
> Besides, gcc-runtime seems have an additional patch file "fortran-cross-compile-hack.patch" which was never got be used. This would results all the signature difference between gcc-cross-initial and gcc-runtime. After I remove that unused patch file, the signatures begin to differ in  task do_headerfix and do_patch. By bitbake-diffsigs the do_headerfix sigangure files between gcc-cross-initial and gcc-runtime, we could see tons of variable values, variable dependencies, task dependencies difference.

this patch can be dropped we dont build fortran at present if we need to
then this should be fixed via configure variable.

> 
> So I think this patch alone is not enough to solve all the problems here.
> 
> Best Regards,
> Lianhao
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


