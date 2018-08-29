Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E0C9578DC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEEF620C5A;
	Wed, 29 Aug 2018 02:39:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uzhI5xeNO_1g; Wed, 29 Aug 2018 02:39:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98F44207AB;
	Wed, 29 Aug 2018 02:39:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 161D11635DF; Tue, 28 Aug 2018 22:39:53 -0400 (EDT)
Date: Tue, 28 Aug 2018 22:39:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180829023952.GO19965@denix.org>
References: <1534382547-55346-1-git-send-email-denis@denix.org>
	<da127d48-fa98-c8c6-bae5-27ba6249e9d1@gmail.com>
	<20180824011555.GD19965@denix.org>
MIME-Version: 1.0
In-Reply-To: <20180824011555.GD19965@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] module-base.bbclass: fix out-of-tree module builds with custom EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 29 Aug 2018 02:39:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 23, 2018 at 09:15:55PM -0400, Denys Dmytriyenko wrote:
> On Wed, Aug 15, 2018 at 07:27:50PM -0700, akuster808 wrote:
> > 
> > 
> > On 08/15/2018 06:22 PM, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Commit d2aa88a6a92985f21414fceea2dc0facbf7f8779 was meant to backport build
> > > dependencies on bc-native and openssl-native, but it also changed execution
> > > of do_make_scripts() from calling make directly to using oe_runmake. That
> > > change was made in master/sumo as part of a separate make-mod-scripts recipe.
> > >
> > > Unfortunately, that doesn't work here in rocko in the context of module-base
> > > class, as it gets executed inside out-of-tree module environment. Quite often
> > > those out-of-tree modules provide own Makefile with custom EXTRA_OEMAKE var
> > > defined. But do_make_scripts() gets executed within STAGING_KERNEL_DIR and
> > > cannot simply use custom EXTRA_OEMAKE set by a module.
> > >
> > > Move back to calling make and passing HOSTCC/HOSTCPP directly w/o using
> > > EXTRA_OEMAKE.
> > 
> > Got this stagged it my rocko mut branch for testing.
> 
> Ping

Ping again - are there any problems with this patch?


> > thanks
> > Armin
> > >
> > > For more details please see:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154189.html
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Cc: Anuj Mittal <anuj.mittal@intel.com>
> > > Cc: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  meta/classes/module-base.bbclass | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> > > index 9f3465e..c1fa3ad 100644
> > > --- a/meta/classes/module-base.bbclass
> > > +++ b/meta/classes/module-base.bbclass
> > > @@ -13,7 +13,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
> > >  export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
> > >  
> > >  DEPENDS += "bc-native"
> > > -EXTRA_OEMAKE += " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> > >  
> > >  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
> > >  KERNEL_OBJECT_SUFFIX = ".ko"
> > > @@ -25,6 +24,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  # be called before do_compile. See module.bbclass for an example.
> > >  do_make_scripts() {
> > >  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
> > > -	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > +	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> > > +	           HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
> > >  	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> > >  }
> > 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

