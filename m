Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A37896072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2FCAA20AED;
	Thu, 17 Nov 2016 18:47:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cPqD3ebWUXFH; Thu, 17 Nov 2016 18:47:32 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 10D14204AF;
	Thu, 17 Nov 2016 18:47:31 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 6C4401621A5; Thu, 17 Nov 2016 13:47:30 -0500 (EST)
Date: Thu, 17 Nov 2016 13:47:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20161117184730.GD26131@denix.org>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
	<20160818075626.15973-2-git@andred.net>
	<20161116201836.GA26131@denix.org>
	<1479378138.27546.1.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <1479378138.27546.1.camel@andred.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] module.bbclass: use Module.symvers for dependants
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
X-List-Received-Date: Thu, 17 Nov 2016 18:47:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 17, 2016 at 10:22:18AM +0000, André Draszik wrote:
> Hi,
> 
> On Wed, 2016-11-16 at 15:18 -0500, Denys Dmytriyenko wrote:
> > On Thu, Aug 18, 2016 at 08:56:24AM +0100, André Draszik wrote:
> > >  
> > > @@ -24,6 +34,11 @@ module_do_install() {
> > >  	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> > >  	           O=${STAGING_KERNEL_BUILDDIR} \
> > >  	           ${MODULES_INSTALL_TARGET}
> > > +
> > > +	install -d -m0755 ${D}${includedir}/${BPN}
> > > +	cp -a --no-preserve=ownership ${B}/Module.symvers
> > > ${D}${includedir}/${BPN}
> > 
> > Hmm, why is Module.symvers expected to be in the root of ${B}? This seems
> > like 
> > a very artificial assumption/requirement!
> 
> [...]
> 
> > I wonder if this should have been rolled into ${MODULES_INSTALL_TARGET} 
> > step...
> 
> What about adding a (lazy ?=) variable to be able to override the location
> of Module.symvers within ${B}, or alternatively using find to automatically
> detect it? I guess there could also be more than one in theory? Do you have
> something different in mind?

Yes, find will probably be too ambiguous, but I like the variable idea to 
point to Module.symvers within ${B}!

For now I have a workaround to do an extra copy in do_install_prepend(), which 
is not very elegant...

-- 
Denys

