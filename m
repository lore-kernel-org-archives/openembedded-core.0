Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rutwv-0005SR-5o
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:55:45 +0100
Received: by daln34 with SMTP id n34so3194493dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 14:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=11h4dTd6GPbpTS+awfxnzr54TrYZ8hTMYFZJRzx8uIQ=;
	b=MHb4AzeMpdzhbSI351qbQdS8TJcxkTOoLB/vMZ95PvSSFF7A0xQT4vjjNBLV3bF3va
	gZxZmZd08I/wNFx6eapPVjdnQ6MWOulyUfnJ5mOii+ba5tfCx6Bve4n7tEyZnOZlhUWu
	s6ykISLscT0jh24JSxdUCzwRcrEXZqqjE+rwU=
Received: by 10.68.218.231 with SMTP id pj7mr62594228pbc.63.1328654861623;
	Tue, 07 Feb 2012 14:47:41 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id x6sm166976pbf.7.2012.02.07.14.47.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 14:47:40 -0800 (PST)
Date: Tue, 7 Feb 2012 14:47:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120207224728.GB13125@sakrah.homelinux.org>
References: <1321488805.18905.5.camel@ted> <20120207103141.GA30500@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20120207103141.GA30500@mcrowe.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] libtool-cross: Upbreak and actually use more of it
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
X-List-Received-Date: Tue, 07 Feb 2012 22:55:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 10:31), Mike Crowe wrote:
> On Thu, Nov 17, 2011 at 12:13:25AM +0000, Richard Purdie wrote:
> > We should be using libtool-cross for cross compiling but
> > were not. This patch sets datadir so libtoolize ends up
> > containing correct paths. It then installs libtoolize.
> 
> I have a recipe that no longer works after this (or perhaps the other
> changes Richard mentions later in the thread.) It's a pretty
> straightforward recipe that inherits from autotools. Judging by the
> number of warnings from autoconf the package was probably expecting an
> older version of automake/autoconf. The configure task fails with:
> 
>  libtoolize: `config/compile' not found in `/home/mac/src/oe/build/tmp-eglibc/sysroots/panther/usr/share/libtool'
> 
> (continued inside patch)
> 
> > The path ltmain.sh was installed to was incorrect and this is fixed.
> > 
> > We also now install all the libtool m4 macros.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > index 596528a..4e6e3f2 100644
> > --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > @@ -1,10 +1,13 @@
> >  require libtool-${PV}.inc
> >  
> > -PR = "r5"
> > +PR = "r7"
> >  PACKAGES = ""
> >  SRC_URI += "file://prefix.patch"
> >  SRC_URI += "file://fixinstall.patch"
> >  
> > +target_datadir := "${datadir}"
> > +datadir = "${STAGING_DIR_TARGET}${target_datadir}"
> > +
> >  do_configure_prepend () {
> >  	# Remove any existing libtool m4 since old stale versions would break
> >  	# any upgrade
> > @@ -13,20 +16,21 @@ do_configure_prepend () {
> >  }
> >  
> >  do_install () {
> > -	install -d ${D}${bindir}/
> > -	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
> > -	install -d ${D}${datadir}/libtool/
> > -	install -d ${D}${datadir}/aclocal/
> > -	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
> > -	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
> > -	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
> > -	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
> > -	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
> > +	install -d ${D}${bindir_crossscripts}/
> > +	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> > +	install -d ${D}${bindir_crossscripts}/
> > +	install -m 0755 libtoolize ${D}${bindir_crossscripts}/
> > +	install -d ${D}${target_datadir}/libtool/config/
> > +	install -d ${D}${target_datadir}/aclocal/
> > +	install -c ${S}/libltdl/config/config.guess ${D}${target_datadir}/libtool/
> > +	install -c ${S}/libltdl/config/config.sub ${D}${target_datadir}/libtool/
> 
> If I also install "compile", "depcomp" and "missing" here then this
> solves the immediate problem but then it looks like I also need to add
> "COPYING.LIB" and probably many other files to
> ${D}{$target_datadir}/libtool/libltdl too which leads me to think that
> I'm swimming against the tide and might be going about this the wrong
> way. Is this the correct approach? If so why not just call "make
> install" rather than installing everything by hand?

can you just try oe_runmake DESTDIR=${D} install ?
you might need to do some extra bits in there but that can be done
additionally

> 
> > +	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${target_datadir}/libtool/config/
> > +	install -c -m 0644 ${S}/libltdl/m4/*.m4 ${D}${target_datadir}/aclocal/
> >  }
> >  
> >  SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
> >  
> >  libtoolcross_sysroot_preprocess () {
> > -	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> > -	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
> > +	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
> > +	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_datadir}
> >  }
> 
> TIA
> 
> Mike.
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


